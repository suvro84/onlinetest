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
using System.Text.RegularExpressions;
using System.Xml;
using System.IO;

public partial class demo_WebService : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // localhost.CustomerServices wsCustomer = new localhost.CustomerServices();
            globalweather.GlobalWeather obj = new globalweather.GlobalWeather();
            //string ddl = removeHmtlFromString(obj.GetCitiesByCountry("india"));
            string ddl = obj.GetCitiesByCountry("india");
            //ddl = Regex.Replace(ddl, "&lt;", "<");
            //ddl = Regex.Replace(ddl, "&gt;", ">");
            //  ddl = ddl.Replace("<NewDataSet>", "").Replace("</NewDataSet>", "");

           
            
            
            
            
            
            
            
            //string filepath = Server.MapPath("XML/city.xml");
            //if (!File.Exists(filepath))
            //{
            //    System.IO.FileStream fs = new System.IO.FileStream(filepath, FileMode.Append, FileAccess.Write);
            //    StreamWriter sw = new StreamWriter(fs);
            //    sw.Write(ddl);
            //    sw.Close();
            //    fs.Close();
            //}

           

            XmlDocument xdoc = new XmlDocument();
            xdoc.LoadXml(ddl);


            //FileStream rfile = new FileStream(filepath, FileMode.Open);
            //xdoc.Load(rfile);
            //String address;
            XmlNodeList list = xdoc.GetElementsByTagName("Table");

            DataTable dt = new DataTable("Test");
            dt.Columns.Add("city");
            dt.Columns.Add("id", typeof(int));
            dt.Columns["id"].AutoIncrement = true;
            dt.Columns["id"].AutoIncrementSeed = 1;
           // DataTable dtfinal = dt.DefaultView.ToTable(true, new char[] { city, id });

            dt.PrimaryKey = new System.Data.DataColumn[] { dt.Columns["id"] };
            for (int i = 0; i < list.Count; i++)
            {
                XmlElement city = (XmlElement)xdoc.GetElementsByTagName("City")[i];
                //ddlCity.DataSource = city.InnerXml.ToString();
                //ddlCity.DataBind();
                DataRow dr = dt.NewRow();
                dr["city"] = city.InnerText.ToString(); 
                dt.Rows.Add(dr);
            }

            ddlCity.DataSource = dt;
            ddlCity.DataTextField = "city";
            ddlCity.DataValueField = "id";
            ddlCity.DataBind();
            ListItem li = new ListItem();
            li.Value = "0";
            li.Text = "Please Select";
            ddlCity.Items.Insert(0, li);
            //rfile.Close();

 



            //XmlDocument document = new XmlDocument();
            //document.Load(strFilePath);
            //XmlNode node = document.DocumentElement.SelectSingleNode("//City");
            //Response.Write("node = " + node);


            //XmlTextReader reader = new XmlTextReader(ddl);

            //// Skip non-significant whitespace  
            //reader.WhitespaceHandling = WhitespaceHandling.Significant;

            //// Read nodes one at a time  
            //while (reader.Read())
            //{
            //    // Print out info on node  
            //    Console.WriteLine("{0}: {1}", reader.NodeType.ToString(), reader.Name);
            //}




            //string strURL = string.Format("http://www.webservicex.net/globalweather.asmx/GetWeather?CityName={0}&CountryName={1}", "New York", "United States");


            //XmlDocument XMLDoc = new XmlDocument();
            //XMLDoc.Load(strURL);


            //string strXML = XMLDoc.ChildNodes[1].ChildNodes[0].InnerText;


            //XMLDoc = new XmlDocument();
            //XMLDoc.LoadXml(strXML);


            //string strWeatherCondition = XMLDoc.SelectSingleNode("/CurrentWeather/SkyConditions").InnerText;


            //lblWeatherCondition.Text = strWeatherCondition;



            //ddlCity.DataSource = ddl;

            //ddlCity.DataBind();
        }
    }
    //public void fun()
    //{
    //    string xmlCitites = "";
    //    //string xmlCitites = <br>           
    //    //    "<soap:Envelope xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\" "+<br>                "xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\">"+
    //    //    <br>                  
    //    //        "<soap:Body>"+<br>           
    //    //            "<GetCitiesByCountryResponse xmlns=\"http://www.webserviceX.NET\">"+
    //    //    <br>                            "<GetCitiesByCountryResult>"+<br>  
    //    //        "&lt;NewDataSet&gt;"+<br>     
    //    //            "&lt;Table&gt;"+<br>    
    //    //                "&lt;Country&gt;British Indian Ocean Territory&lt;/Country&gt;"+<br> 

    //    //                    "&lt;City&gt;Diego Garcia&lt;/City&gt;"+<br>               
    //    //                        "&lt;/Table&gt;"+<br> 
    //    //                            "&lt;Table&gt;"+
    //    //    <br>                                        "&lt;Country&gt;India&lt;/Country&gt;"+<br>     
    //    //        "&lt;City&gt;Ahmadabad&lt;/City&gt;"+<br> 

    //    //            "&lt;/Table&gt;"+<br>      
    //    //                "&lt;Table&gt;"+<br>     
    //    //                    "&lt;Country&gt;India&lt;/Country&gt;"+
    //    //    <br>                                        "&lt;City&gt;Akola&lt;/City&gt;"+<br> 
    //    //        "&lt;/Table&gt;"+<br> 
    //    //            "&lt;Table&gt;"+<br>  
    //    //                "&lt;Country&gt;India&lt;/Country&gt;"+<br> 
    //    //                    "&lt;City&gt;Aurangabad Chikalthan Aerodrome&lt;/City&gt;"+<br>  
    //    //                        "&lt;/Table&gt;"+<br>     
    //    //                            "&lt;/NewDataSet&gt;"+<br>  
    //    //                                "</GetCitiesByCountryResult>"+<br> 
    //    //                                    "</GetCitiesByCountryResponse>"+<br> 
    //    //                                        "</soap:Body>"+<br>   
    //    //                                            "</soap:Envelope>";
    //    //I have received above xml from the web service.Of course 
    //   // it was too long So I have removed most of the child nodes.
    //        //since the response data is in htmlDecoded format first we have to encode it.
        
    //    xmlCitites = xmlCitites.Replace("&lt;", "<").Replace("&gt;", ">");
    //         //Now load this xml into xmlDom object. 
    //    XmlDocument xDoc = new XmlDocument();

    //    xDoc.LoadXml(xmlCitites);
    //    // Here you can work with the xml string and no need to use xmlFile.
          
    //    XmlNamespaceManager xMan = new XmlNamespaceManager(xDoc.NameTable);
       
    //    xMan.AddNamespace("s", "http://schemas.xmlsoap.org/soap/envelope/");

    //    xMan.AddNamespace("ns", "http://www.webserviceX.NET");

    //    XmlNodeList xNodeCitites = xDoc.SelectNodes("s:Envelope/s:Body/ns:GetCitiesByCountryResponse/ns:GetCitiesByCountryResult/ns:NewDataSet/ns:Table/ns:City", xMan);
    //    DataTable dtCities = new DataTable();
    //    dtCities.Columns.Add("City");
    //    DataRow dr;
    //    foreach (XmlNode xCity in xNodeCitites)
    //    {
    //        dr = dtCities.NewRow();
    //        dr["City"] = xCity.InnerText;
    //        dtCities.Rows.Add(dr);
    //    }

    //    ddlCities.DataTextField = "City";
    //    ddlCities.DataValueField = "City";
    //    ddlCities.DataSource = dtCities;
    //    ddlCities.DataBind();
    //}
    private string removeHmtlFromString(string strInput)
    {
        try
        {
            Regex objRegExp = new Regex("<(.|\n)+?>");
            return objRegExp.Replace(strInput, String.Empty).Trim();
        }
        catch
        {
            return string.Empty;
        }
    }
    protected void ddlCity_SelectedIndexChanged(object sender, EventArgs e)
    {
        globalweather.GlobalWeather obj = new globalweather.GlobalWeather();

       // WeatherReference.GlobalWeather weatherObject = new WeatherReference.GlobalWeather();
        string xmlData = obj.GetWeather(ddlCity.SelectedItem.Text, "india");

        XmlDocument xmlDoc = new XmlDocument();
        xmlDoc.LoadXml(xmlData);
        XmlNode tempNode = xmlDoc.SelectSingleNode("CurrentWeather/Temperature");
        lblWeatherCondition.Text = tempNode.InnerText;  


    }
}
