using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class DownloadReports : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            if (Request.QueryString["count"] != null)
            {
                dvSelectedIds.InnerHtml = " There are " + Convert.ToString(Request.QueryString["count"]) + " Records";
                //string[] arr = Request.Params["strBoxIds"].ToString().Split(new char[] { ',' });
            }
        }

    }


    private DataTable GetData(string strQuery)
    {
        DataTable dtDept = null;
        using (SqlConnection con = new SqlConnection(Convert.ToString(ConfigurationManager.AppSettings["connectionString"])))
        {
            con.Open();
            using (SqlDataAdapter sqlAdapter = new SqlDataAdapter(strQuery, con))
            {
                dtDept = new DataTable();
                sqlAdapter.Fill(dtDept);
            }
        }
        return dtDept;
    }
    protected void btnDownload_Click(object sender, EventArgs e)
    {
        Download();
    }


    public void Download()
    {
        string ids = "";

        if (Convert.ToString(Request.QueryString["SelectedIds"]).EndsWith(","))
        {
            ids = Convert.ToString(Request.QueryString["SelectedIds"]).Substring(0, Convert.ToString(Request.QueryString["SelectedIds"]).Length - 1);

        }
        else
        {

            ids = Convert.ToString(Request.QueryString["SelectedIds"]);

        }
        string strSQL = "SELECT * FROM emp2 WHERE emp_id IN(" + ids + ")";
        string strError = "";
        DataTable dtProd = new DataTable();
        dtProd = GetData(strSQL);
        //Admin_Module_Works_Select objSelect = new Admin_Module_Works_Select(dtProd, strSQL, strSchema, ref strError);

        if (dtProd.Rows.Count > 0)
        {
            string strFile = Convert.ToString(dtProd.Rows[0]["package_name"]) + ".xls";
            int[] iColumns = null;
            string[] sHeaders = { "emp_id", "package_name" };

            iColumns = new int[sHeaders.Length];
            for (int k = 0; sHeaders.Length > k; k++)
            {
                iColumns[k] = k;
            }
            Export objExport = new Export();

            objExport.ExportDetails(dtProd, iColumns, sHeaders, Export.ExportFormat.Excel, strFile);
        }
        else
        {
            Response.Write("No Record found");
        }
    }
}
