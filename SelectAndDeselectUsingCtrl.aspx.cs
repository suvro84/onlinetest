using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using System.Configuration;


public partial class SelectAndDeselectUsingCtrl : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strQuery = "SELECT * FROM emp2";
        gvDept.DataSource = GetData(strQuery);
        gvDept.DataBind();
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



    protected void gvDept_RowDataBound(Object sender, GridViewRowEventArgs e)
    {
        StringBuilder sbRowCellIds = new StringBuilder();
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            for (int i = 0; i < gvDept.Columns.Count; i++)
            {
                DataKey dk = gvDept.DataKeys[e.Row.RowIndex];
                string id = dk.Values["emp_id"].ToString();
                e.Row.Cells[i].Attributes.Add("onclick", "FillColor('" + e.Row.Cells[i].ClientID + "','" + id + "',event)");
                e.Row.Cells[i].Attributes.Add("oncontextmenu", "javascript:return oCustomContextMenu.Display(event);");


                if (hidCellId.Value.Length == 0)
                {
                    hidCellId.Value = e.Row.Cells[i].ClientID;
                }
                else
                {
                    if (!IsPostBack)
                    {
                        hidCellId.Value = hidCellId.Value + "," + e.Row.Cells[i].ClientID;
                    }
                }
                if (sbRowCellIds.ToString().Length == 0)
                {
                    sbRowCellIds.Append(e.Row.Cells[i].ClientID);
                }
                else
                {
                    sbRowCellIds.Append(",");
                    sbRowCellIds.Append(e.Row.Cells[i].ClientID);
                }
            }
        }
    }



    protected void btnCopy_Click(object sender, EventArgs e)
    {
        string strQuery = "SELECT * FROM emp2 WHERE emp_id IN(" + hidSelectedRow.Value + ")";

        gvDestDept.DataSource = GetData(strQuery);
        gvDestDept.DataBind();
    }

   


}
