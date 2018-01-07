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
using System.Xml;
using System.IO;
using System.Text;

public partial class RTracking : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string a = "";
        string ip = "";
        string landingpage = "";
        string frompage = "";
        string os = "";
        string browser = "";
        string siteid = "";
        string screenresolution = "";
        if (Request.Params["a"] != null)
        {
            siteid = Convert.ToString(Request.Params["a"]);
        }
        if (Request.Params["b"] != null)
        {
            screenresolution = Convert.ToString(Request.Params["b"]) + "X" + Convert.ToString(Request.Params["c"]);
        }

        if (Request.Params["d"] != null)
        {
            frompage = Convert.ToString(Request.Params["d"]);
        }
        if (Request.Params["e"] != null)
        {
            landingpage = Convert.ToString(Request.Params["e"]);
        }
        if (Request.Params["f"] != null)
        {
            ip = Convert.ToString(Request.Params["f"]);
        }
        if (Request.Params["g"] != null)
        {
            browser = Convert.ToString(Request.Params["g"]);
        }
        if (Request.Params["h"] != null)
        {
            os = Convert.ToString(Request.Params["h"]);
        }
        // string cuurentdate = DateTime.Now.ToString("dd-MM-yy hh:mm:ss");
        System.Collections.Hashtable ht = new System.Collections.Hashtable();
        ht.Add("siteid", siteid);
        ht.Add("screenresolution", screenresolution);
        ht.Add("frompage", frompage);
        ht.Add("landingpage", landingpage);
        ht.Add("ip", ip);
        ht.Add("browser", browser);
        ht.Add("os", os);
        ht.Add("landingtime", DateTime.Now.ToString("dd-MM-yy hh:mm:ss"));

        string filepath = Server.MapPath("XML/" + Convert.ToString(ht["ip"]).Replace(".", "_") + ".xml");

        
         if (System.IO.File.Exists(filepath))
        {
           
            Ins_UpdateXML(ht);
        }
        else
        {
            CreateXML_Insert(ht);
        }



    }

    public void CreateXML_Insert(Hashtable ht)
    {

        try
        {

            string filepath = Server.MapPath("XML/" + Convert.ToString(ht["ip"]).Replace(".", "_") + ".xml");
            //XmlTextWriter xtw = new XmlTextWriter("D:\\VS08_Proj\\OnlineTest\\XML\\test.xml", null);
            XmlTextWriter xtw = new XmlTextWriter(filepath, Encoding.UTF8);
            xtw.WriteStartDocument();
            xtw.WriteStartElement("pathinfo");
            xtw.WriteEndElement();
            xtw.Close();


            XmlDocument xd = new XmlDocument();
            FileStream lfile = new FileStream(filepath, FileMode.Open);
            xd.Load(lfile);
            XmlElement path = xd.CreateElement("path");
          //  cl.SetAttribute("Name", "abc");
            XmlElement frompage = xd.CreateElement("frompage");
            XmlText frompagetext = xd.CreateTextNode(Convert.ToString(ht["frompage"]));
            frompage.AppendChild(frompagetext);
            path.AppendChild(frompage);

            XmlElement landingpage = xd.CreateElement("landingpage");
            XmlText landingpagetext = xd.CreateTextNode(Convert.ToString(ht["landingpage"]));
            landingpage.AppendChild(landingpagetext);
            path.AppendChild(landingpage);

            XmlElement landingtime = xd.CreateElement("landingtime");
            XmlText landingtimetext = xd.CreateTextNode(DateTime.Now.ToString("dd-MM-yy hh:mm:ss"));
            landingtime.AppendChild(landingtimetext);
            path.AppendChild(landingtime);


            xd.DocumentElement.AppendChild(path);
            lfile.Close();
            xd.Save(filepath);

          


        }
        catch (Exception ex)
        {
        }

    }
    public void Ins_UpdateXML(Hashtable ht)
    {

        try
        {



            string filepath = Server.MapPath("XML/" + Convert.ToString(ht["ip"]).Replace(".", "_") + ".xml");


            XmlDocument xmldoc = new XmlDocument();
           // xmldoc.Load(Server.MapPath(filepath));
            xmldoc.Load(Server.MapPath("XML\\" + Convert.ToString(ht["ip"]).Replace(".", "_") + ".xml"));
            //Create a new node
            XmlElement newelement = xmldoc.CreateElement("pathinfo");
            XmlElement xmlfrompage = xmldoc.CreateElement("frompage");
            XmlElement xmllandingpage = xmldoc.CreateElement("landingpage");
            XmlElement xmllandingtime = xmldoc.CreateElement("landingtime");
            XmlNodeList list = xmldoc.GetElementsByTagName("path");
            int count = 0;
            if (list.Count == 0)
            {
                count = 1;
            }
            else
            {
                count = Convert.ToInt32(list.Count) + 1;
            }
            // xmlques_no.InnerText = count.ToString();
            xmlfrompage.InnerText = Convert.ToString(ht["frompage"]);
            xmllandingpage.InnerText = Convert.ToString(ht["landingpage"]);
            xmllandingtime.InnerText = DateTime.Now.ToString("dd-MM-yy hh:mm:ss");


            // newelement.AppendChild(xmlques_no);
            newelement.AppendChild(xmlfrompage);
            newelement.AppendChild(xmllandingpage);
            newelement.AppendChild(xmllandingtime);
            xmldoc.DocumentElement.AppendChild(newelement);
            //save
            xmldoc.Save(Server.MapPath("XML\\" + Convert.ToString(ht["ip"]).Replace(".", "_") + ".xml"));


        }
        catch (Exception ex)
        {
        }

    }
}
