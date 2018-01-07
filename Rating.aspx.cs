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
using System.Net;
using System.Collections.Generic;

public partial class Rating : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // DataTable dt=new DataTable();
        // dt.Columns.Add("recid", typeof(int));
        // DataRowState dr=dt.new
        //dr["recid"]="1";
        //Dictionary<int, string> dict = new Dictionary<int, string>();
        //dict.Add("1", "Ram");
        //dict.Add("2", "Sam");
        //dict.Add("1", "Jadhu");

        //try
        //{
        //    int x = 4;
        //    int y = 0;
        //    int res = x / y;
        //}
        //catch (Exception ex)
        //{

        //}
        //finally
        //{
        //    Response.Redirect("http://www.rediffmail.com:");
        //}
        //int x=fun();
        //if (ValidateUrl("http://www.rediffmail.com:"))
        if (ValidateUrl("http://www.suvrojyotik.com"))
        {
        }
        DataManipulationClass objd = new DataManipulationClass();
        objd.funOL(1);
    }

    //public Int16 fun()
    //{
    //    return 1;

    //}

    //public Int32 fun()
    //{
    //    return 2;

    //}


    public bool ValidateUrl(string url)
    {

        try
        {

            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);
            request.MaximumAutomaticRedirections = 4;

            HttpWebResponse response = (HttpWebResponse)request.GetResponse();
            response.Close();

            return response.StatusCode

                == HttpStatusCode.OK;

        }

        catch
        {

            return false;

        }

    }


}
