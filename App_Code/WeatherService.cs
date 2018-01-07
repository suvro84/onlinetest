using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Script.Services;

/// <summary>
/// Summary description for WeatherService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class WeatherService : System.Web.Services.WebService {

    public WeatherService () {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Xml, UseHttpGet = true)]

    public void HelloWorld() {
        if (HttpContext.Current.Request.Params["mode"] != null)
        {
            string mode = Convert.ToString(HttpContext.Current.Request.Params["mode"]);
        }
        string response = "Testing Web service response without tags ";



        System.Text.UTF8Encoding encoding = new System.Text.UTF8Encoding();



        HttpContext.Current.Response.Clear();



        HttpContext.Current.Response.BinaryWrite(encoding.GetBytes(response));
        //return "~1~Hello World~";
    }
    
}

