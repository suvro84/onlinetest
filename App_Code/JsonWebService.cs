using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Script.Services;
using System.Data;
using System.Data.SqlClient;


/// <summary>
/// Summary description for JsonWebService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
[ScriptService]
public class JsonWebService : System.Web.Services.WebService
{


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json, UseHttpGet = true)]
    //public List<Recipie> GetRecipie()
    //{
    //    //string strQuery = "SELECT * FROM Recipie";
    //    string strQuery = "SELECT * FROM testProduct";

    //    DataTable dtRecipie = null;
    //    Recipie objRecipie;
    //    //  SqlConnection con = GetConnection("Data Source=(PERSONAL-9D79B9);Initial Catalog=employee;Integrated Security=true");
    //    SqlConnection con = GetConnection(System.Configuration.ConfigurationManager.AppSettings["connectionString"]);
    //    using (con)
    //    {
    //        con.Open();
    //        using (SqlDataAdapter sqlAdapter = new SqlDataAdapter(strQuery, con))
    //        {
    //            dtRecipie = new DataTable();
    //            sqlAdapter.Fill(dtRecipie);
    //        }
    //    }
    //    List<Recipie> drlist = new List<Recipie>();

    //    foreach (DataRow row in dtRecipie.Rows)
    //    {
    //        objRecipie = new Recipie();
    //        //objRecipie.by = row["by"].ToString();
    //        //objRecipie.Recipiename = row["Recipiename"].ToString();
    //        //objRecipie.preparationtime = row["preparationtime"].ToString();
    //        //objRecipie.cookingtime = row["cookingtime"].ToString();

    //        objRecipie.pid = row["pid"].ToString();
    //        objRecipie.pname = row["pname"].ToString();
    //        //objRecipie.preparationtime = row["preparationtime"].ToString();
    //        //objRecipie.cookingtime = row["cookingtime"].ToString();


    //        drlist.Add(objRecipie);
    //    }
    //    return drlist;
    //}

    //public static System.Collections.Hashtable GetRecipie()
    //{
    //    //Company c = new Company();
    //    System.Collections.Hashtable c = new System.Collections.Hashtable();
    //    c.Add("pid", "Please enter Name");
    //    return c;
    //}

    public List<Recipie> GetRecipie(string ControlId)
    {
        string strcId = "";
        if (HttpContext.Current.Request.Params["controlId"] != null)
        {
            strcId = Convert.ToString(HttpContext.Current.Request.Params["controlId"]);
        }
        DataTable dtRecipie = new DataTable();
        dtRecipie.Columns.Add("msg", typeof(string));
        dtRecipie.Columns.Add("controlId", typeof(string));
        Recipie objRecipie;
        List<Recipie> drlist = new List<Recipie>();
        DataRow dr = dtRecipie.NewRow();
        dr[0] = "Please enter Name";
        dr[1] = strcId;
        dtRecipie.Rows.Add(dr);
        foreach (DataRow row in dtRecipie.Rows)
        {
            objRecipie = new Recipie();
          // objRecipie.msg = row["msg"].ToString();
            objRecipie.msg = "<a href=\"javascript:funMakeFocus(" + strcId + ");\">" + row["msg"].ToString() + "</a>";
            objRecipie.controlId = row["controlId"].ToString();
            drlist.Add(objRecipie);
        }
        return drlist;
    }

    private SqlConnection GetConnection(string m_conString)
    {
        SqlConnection con = new SqlConnection(m_conString);
        return con;
    }


}


public class Recipie
{
    //public string by;
    //public string Recipiename;
    //public string preparationtime;
    //public string cookingtime;

    public string pid;

    public string msg;
    public string controlId;

}
