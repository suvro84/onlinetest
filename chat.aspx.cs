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

public partial class chat : System.Web.UI.Page
{


    protected void Page_Load(object sender, EventArgs e)
    {


        Ajax.Utility.RegisterTypeForAjax(typeof(chat));
    }

    [Ajax.AjaxMethod]
    public string SendMsg()
    {
        return "Hi";
    }
    [Ajax.AjaxMethod]
    public string FetchMsg()
    {

        string filepath = "D:/VS08_Proj/OnlineTest/XML/chat.xml";
        string msg = "";
        XmlDocument xdoc = new XmlDocument();
        XmlTextReader rfile = new XmlTextReader(filepath);
        xdoc.Load(rfile);
        rfile.Close();
        //XmlNode tempNode;
        //XmlElement root = xdoc.DocumentElement;
        XmlNode tempNode = xdoc.DocumentElement.SelectSingleNode("/CustomerDetails/Customer[@Name=\"abc\"]");

      //  tempNode = root.SelectSingleNode("/CustomerDetails/Customer[@Name=\"abc\"]");
        foreach (XmlNode node in tempNode.ChildNodes)
        {
            msg += node.InnerText + "<br>";
        }
        return msg;

    }

    public void GetUpdatedMsg(ref string msg, string filepath)
    {

        //string filepath = Server.MapPath("XML/chat.xml");
        //XmlDocument xmlDoc = new XmlDocument();
        //xmlDoc.LoadXml(xmlData);

        XmlDocument xdoc = new XmlDocument();
        XmlTextReader rfile = new XmlTextReader(filepath);
        xdoc.Load(rfile);

        //XmlNode tempNode = xdoc.SelectSingleNode("CustomerDetails/Customer/Name=@abc");
        XmlNode tempNode = xdoc.DocumentElement.SelectSingleNode("CustomerDetails/Customer/Name=@abc");

        foreach (XmlNode node in tempNode.ChildNodes)
        {
            msg += tempNode.InnerText.ToString() + "<br>";
        }

    }

    [Ajax.AjaxMethod]
    public string insertXML(string msg)
    {

        string UpdatedMsg = "";
        //  string filepath = Server.MapPath("XML/chat.xml");
        try
        {
            string filepath = "D:/VS08_Proj/OnlineTest/XML/chat.xml";
            XmlDocument xdoc = new XmlDocument();
            XmlTextReader rfile = new XmlTextReader(filepath);
            xdoc.Load(rfile);
            //XmlNode tempNode = xdoc.DocumentElement.SelectSingleNode("CustomerDetails/Customer[Name=@abc");
            //XmlNode tempNode = xdoc.DocumentElement.SelectSingleNode("/CustomerDetails/Customer[@Name=\"abc\"]");

            XmlDocumentFragment frag = xdoc.CreateDocumentFragment();
            frag.InnerXml = "<msg type=\"1\" name=\"customer\" date=\"" + DateTime.Now.ToString("dd/mm/yy") + "\" >" + msg + "</msg>";
            XmlNode tempNode;
            XmlElement root = xdoc.DocumentElement;
            tempNode = root.SelectSingleNode("/CustomerDetails/Customer[@Name=\"abc\"]");
            tempNode.AppendChild(frag);
            rfile.Close();
            xdoc.Save(filepath);
            GetUpdatedMsg(ref UpdatedMsg, filepath);
            return UpdatedMsg;
        }
        catch (Exception ex)
        {

        }
        return UpdatedMsg;
    }

}
