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
using System.Xml.XPath;
using System.Xml.Serialization;


public partial class demoXML : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void BtnCreate_Click(object sender, EventArgs e)
    {

        string filepath = Server.MapPath("XML/test.xml");
        //XmlTextWriter xtw = new XmlTextWriter("D:\\VS08_Proj\\OnlineTest\\XML\\test.xml", null);
        XmlTextWriter xtw = new XmlTextWriter(Server.MapPath("XML/test.xml"), Encoding.UTF8);
        xtw.WriteStartDocument();
        xtw.WriteStartElement("CustomerDetails");
        xtw.WriteEndElement();
        xtw.Close();




        // Get a FileStream object
      //  StreamWriter xmlDoc = new StreamWriter(Server.MapPath("~/FileTest/Testdo.xml"), false);
        // Apply the WriteXml method to write an XML document
       // ds.WriteXml(xmlDoc);
      //  xmlDoc.Close();







    }
    protected void btnRead_Click(object sender, EventArgs e)
    {
        string filepath = Server.MapPath("XML/test.xml");

        XmlDocument xdoc = new XmlDocument();
       // FileStream rfile = new FileStream(filepath, FileMode.Open,FileAccess.Read,FileShare.ReadWrite);
        XmlTextReader rfile = new XmlTextReader(filepath);
        xdoc.Load(rfile);
        String address;
        XmlNodeList list = xdoc.GetElementsByTagName("Customer");
        for (int i = 0; i < list.Count; i++)
        {
            XmlElement cl = (XmlElement)xdoc.GetElementsByTagName("Customer")[i];
            XmlElement add = (XmlElement)xdoc.GetElementsByTagName("Address")[i];
            if ((cl.GetAttribute("Name")) == "abc")
            {
                address = add.InnerText;
                break;
            }
        }
        rfile.Close();
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        string filepath = Server.MapPath("XML/test.xml");

        XmlDocument xdoc = new XmlDocument();
        FileStream up = new FileStream(filepath, FileMode.Open);
     
        xdoc.Load(up);
        XmlNodeList list = xdoc.GetElementsByTagName("Customer");
        for (int i = 0; i < list.Count; i++)
        {
            XmlElement cu = (XmlElement)xdoc.GetElementsByTagName("Customer")[i];
            XmlElement add = (XmlElement)xdoc.GetElementsByTagName("Address")[i];
            if (cu.GetAttribute("Name") == "abc")
            {
                cu.SetAttribute("Name", "efgh");
                add.InnerText = "pqrs,india";
                break;
            }
        }
        up.Close();
        xdoc.Save(filepath);
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        string filepath = Server.MapPath("XML/test.xml");

        FileStream rfile = new FileStream(filepath, FileMode.Open);
        XmlDocument tdoc = new XmlDocument();
        tdoc.Load(rfile);
        XmlNodeList list = tdoc.GetElementsByTagName("Customer");
        for (int i = 0; i < list.Count; i++)
        {
            XmlElement cl = (XmlElement)tdoc.GetElementsByTagName("Customer")[i];
            if (cl.GetAttribute("Name") == "efgh")
            {
                tdoc.DocumentElement.RemoveChild(cl);
            }
        }
        rfile.Close();
        tdoc.Save(filepath);
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        string filepath = Server.MapPath("XML/test.xml");

        XmlDocument xd = new XmlDocument();
        FileStream lfile = new FileStream(filepath, FileMode.Open);
        xd.Load(lfile);
        XmlElement cl = xd.CreateElement("Customer");
        cl.SetAttribute("Name", "abc");
        XmlElement na = xd.CreateElement("Address");
        XmlText natext = xd.CreateTextNode("xyz,india");
        na.AppendChild(natext);
        cl.AppendChild(na);
        xd.DocumentElement.AppendChild(cl);
        lfile.Close();
        xd.Save(filepath);
    }
    protected void btnCreateMovieXML_Click(object sender, EventArgs e)
    {
        // location to the XML file to write
        String strFilePath = Server.MapPath("XML/movies.xml");

        // create an instance of the XmlTextWriter object
        XmlTextWriter objWriter = new XmlTextWriter(strFilePath, System.Text.Encoding.UTF8);

        objWriter.WriteStartDocument();

        // write a comment in our XML file
        objWriter.WriteComment("My Movie Collection");

        // starting with the root element i.e. "movies"
        objWriter.WriteStartElement("movies");

        // output the first "movie" element
        objWriter.WriteStartElement("movie", null);

        objWriter.WriteElementString("title", "Harry Potter and the Chamber of Secrets");
        objWriter.WriteElementString("director", "Chris Columbus");
        objWriter.WriteElementString("year_of_release", "2002");
        objWriter.WriteElementString("format", "VHS");

        // close "movie" element
        objWriter.WriteEndElement();

        // and the next ...
        objWriter.WriteStartElement("movie", null);

        objWriter.WriteElementString("title", "Harry Potter and the Prisoner of Azkaban ");
        objWriter.WriteElementString("director", "Alfonso Cuaron");
        objWriter.WriteElementString("year_of_release", "2004");
        objWriter.WriteElementString("format", "DVD");

        // close "movie" element
        objWriter.WriteEndElement();

        // and so on for the entire collection...

        // end the "movies" element
        objWriter.WriteEndElement();

        // flush and write XML data to the file
        objWriter.Flush();

        // clear up memory
        objWriter.Close();

        // successfully done
        result.Text = "XML file " + strFilePath + " created.";
    }
    protected void btnXpath_Click(object sender, EventArgs e)
    {
     
        String strFilePath = Server.MapPath("XML/data.xml");

        string fileName = "data.xml";
        XPathDocument doc = new XPathDocument(strFilePath);
        XPathNavigator nav = doc.CreateNavigator();

        // Compile a standard XPath expression

        XPathExpression expr;
        expr = nav.Compile("/catalog/cd/price");
        XPathNodeIterator iterator = nav.Select(expr);

        // Iterate on the node set

        //listBox1.Items.Clear();
        try
        {
            while (iterator.MoveNext())
            {
                XPathNavigator nav2 = iterator.Current.Clone();
                ddlPrice.Items.Add("price: " + nav2.Value);
            }
          
        }
        catch (Exception ex)
        {
            Console.WriteLine(ex.Message);
        }
    }


    /// ---- DeSerializeAnObject ------------------------------

    /// <summary>

    /// DeSerialize an object

    /// </summary>

    /// <param name="XmlOfAnObject">The XML string</param>

    /// <param name="ObjectType">The type of object</param>

    /// <returns>A deserialized object...must be cast to correct type</returns>



    public static Object DeSerializeAnObject(string XmlOfAnObject, Type ObjectType)
    {
        StringReader StrReader = new StringReader(XmlOfAnObject);
        XmlSerializer Xml_Serializer = new XmlSerializer(ObjectType);
        XmlTextReader XmlReader = new XmlTextReader(StrReader);
        try
        {
            Object AnObject = Xml_Serializer.Deserialize(XmlReader);
            return AnObject;
        }
        finally
        {
            XmlReader.Close();
            StrReader.Close();
        }
    }
}
