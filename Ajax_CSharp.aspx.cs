using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Ajax;

public partial class Ajax_CSharp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Ajax.Utility.RegisterTypeForAjax(typeof(Ajax_CSharp));
    }

    [Ajax.AjaxMethod(HttpSessionStateRequirement.ReadWrite)]
    public string GetData()
    {
        try
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["connectionString"]);
            SqlCommand cmd = new SqlCommand("SELECT * FROM testProduct", con);
            cmd.Connection.Open();

            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet("DataSet");
            adapter.Fill(ds, "Table");

            if ((ds.Tables[0].Rows.Count <= 0))
            {
                return "Empty";
            }
            else
            {
                string empID = "";
                string empName = "";
                for (int i = 0; i <= ds.Tables[0].Rows.Count - 1; i++)
                {
                    empID += ds.Tables[0].Rows[i][0].ToString() + ",";
                    empName += ds.Tables[0].Rows[i][1].ToString() + ",";
                }
                empID = empID.Substring(0, empID.Length - 1);
                empName = empName.Substring(0, empName.Length - 1);

                return empID + "~" + empName;
            }
        }
        catch
        {
            return "Error";
        }
    }
}
