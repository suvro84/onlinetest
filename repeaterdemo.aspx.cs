using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;


public partial class repeaterdemo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["connectionString"]);

        //try
        //{
        //    //Class1.conn.Open();
        //    if (conn.State == ConnectionState.Closed)
        //    {
        //        conn.Open();
        //    }
        //    //conn.Open();
        //    DataSet d1 = new DataSet();
        //    SqlDataAdapter adpt = new SqlDataAdapter("select * from ques", conn);
        //    adpt.Fill(d1, "ques");
        //    myrepeater.DataSource = d1.Tables["ques"];
        //    myrepeater.DataBind();
        //}
        //catch { }
        //finally
        //{

        //    if (conn.State == ConnectionState.Open)
        //    {
        //        conn.Close();
        //    }
        //}



        commonclass objrep = new commonclass();
        if (!IsPostBack)
        {
            DataTable dtques = new DataTable();
            string strSql = "select * from ques";
            dtques = objrep.Fetchrecords(strSql);
            myrepeater.DataSource = dtques;
            myrepeater.DataBind();
        }


    }
}
