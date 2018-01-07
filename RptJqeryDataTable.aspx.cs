using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class RptJqeryDataTable : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strQuery = "SELECT * FROM testProduct";
        rptOscarNominees.DataSource = GetData(strQuery);
        rptOscarNominees.DataBind();
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
}
