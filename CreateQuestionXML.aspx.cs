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

public partial class CreateQuestionXML : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            loadXmlData();
        }
    }

    private void loadXmlData()
    {
        DataSet myDs = new DataSet();
        //myDs.ReadXml(Server.MapPath(@"App_Data\smallfools.xml"));
        myDs.ReadXml(Server.MapPath("XML\\questionDB.xml"));

        if (myDs.Tables.Count > 0)
        {

            GridView1.Visible = true;
            this.GridView1.DataSource = myDs;
            this.GridView1.DataBind();
            lblMsg.Text = "";
        }
        else
        {
            lblMsg.Text = "No Record";
            GridView1.Visible = false;
        }
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        loadXmlData();
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        loadXmlData();
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        try
        {
            XmlDocument xmldoc = new XmlDocument();
            //xmldoc.Load(Server.MapPath(@"App_Data\smallfools.xml"));
            xmldoc.Load(Server.MapPath("XML\\questionDB.xml"));
            //Create a new node
            XmlElement newelement = xmldoc.CreateElement("question");

            XmlElement xmlques_no = xmldoc.CreateElement("ques_no");
            XmlElement xmlQues = xmldoc.CreateElement("ques");
            XmlElement xmlAns1 = xmldoc.CreateElement("ans1");
            XmlElement xmlAns2 = xmldoc.CreateElement("ans2");
            XmlElement xmlAns3 = xmldoc.CreateElement("ans3");
            XmlElement xmlAns4 = xmldoc.CreateElement("ans4");
            XmlElement xmlAns = xmldoc.CreateElement("ans");

            XmlNodeList list = xmldoc.GetElementsByTagName("question");

            int count = 0;
            if (list.Count == 0)
            {
                count = 1;
            }
            else
            {
                count = Convert.ToInt32(list.Count) + 1;
            }
            xmlques_no.InnerText = count.ToString();
            xmlQues.InnerText = this.txtQues.Text.Trim();
            xmlAns1.InnerText = this.txtAns1.Text.Trim();
            xmlAns2.InnerText = this.txtAns2.Text.Trim();
            xmlAns3.InnerText = this.txtAns3.Text.Trim();
            xmlAns4.InnerText = this.txtAns4.Text.Trim();
            xmlAns.InnerText = this.txtAns.Text.Trim();

            newelement.AppendChild(xmlques_no);
            newelement.AppendChild(xmlQues);
            newelement.AppendChild(xmlAns1);
            newelement.AppendChild(xmlAns2);
            newelement.AppendChild(xmlAns3);

            newelement.AppendChild(xmlAns4);

            newelement.AppendChild(xmlAns);


            xmldoc.DocumentElement.AppendChild(newelement);

            //xmlDoc.DocumentElement.InsertAfter(newElement,xmlDoc.DocumentElement.ChildNodes.Item(0));

            //xmlDoc.DocumentElement.InsertBefore(newElement,xmlDoc.DocumentElement.ChildNodes.Item(0));
            //save
            xmldoc.Save(Server.MapPath("XML\\questionDB.xml"));

            loadXmlData();
        }
        catch (Exception ex)
        {
        }
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

        XmlDocument xmldoc = new XmlDocument();
        xmldoc.Load(Server.MapPath("XML\\questionDB.xml"));

        Label lblques_no = (Label)GridView1.Rows[e.RowIndex].FindControl("lblques_no");



        XmlNode xmlnode = xmldoc.DocumentElement.ChildNodes.Item(Convert.ToInt32(lblques_no.Text) - 1);

        TextBox txtques = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtques");
        TextBox txtans1 = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtans1");
        TextBox txtans2 = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtans2");
        TextBox txtans3 = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtans3");
        TextBox txtans4 = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtans4");
        TextBox txtans = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtans");

        xmlnode["ques"].InnerText = txtques.Text.Trim();
        xmlnode["ans1"].InnerText = txtans1.Text.Trim();
        xmlnode["ans2"].InnerText = txtans2.Text.Trim();
        xmlnode["ans3"].InnerText = txtans3.Text.Trim();
        xmlnode["ans4"].InnerText = txtans4.Text.Trim();
        xmlnode["ans"].InnerText = txtans.Text.Trim();

        xmldoc.Save(Server.MapPath("XML\\questionDB.xml"));
        GridView1.EditIndex = -1;
        loadXmlData();
    }
    //protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    //{
    //    GridView1.EditIndex = -1;
    //    loadXmlData();
    //}
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        XmlDocument xmldoc = new XmlDocument();
        xmldoc.Load(Server.MapPath("XML\\questionDB.xml"));
        Label lblques_no = (Label)GridView1.Rows[e.RowIndex].FindControl("lblques_no");

        XmlNode xmlnode = xmldoc.DocumentElement.ChildNodes.Item(Convert.ToInt32(lblques_no.Text) - 1);
        xmlnode.ParentNode.RemoveChild(xmlnode);
        xmldoc.Save(Server.MapPath("XML\\questionDB.xml"));

        loadXmlData();
    }
    protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
    {
        DataSet myDs = new DataSet();
        //myDs.ReadXml(Server.MapPath(@"App_Data\smallfools.xml"));
        myDs.ReadXml(Server.MapPath("XML\\questionDB.xml"));



        DataTable dt4 = myDs.Tables[0];
        DataView dv = dt4.DefaultView;


        if (ViewState["sortorder"] == null)
        {
            ViewState["sortorder"] = "desc";

        }
        else
        {
            if (ViewState["sortorder"].ToString() == "desc")
            {
                ViewState["sortorder"] = "asc";
            }
            else
            {
                ViewState["sortorder"] = "desc";
            }
        }
        dv.Sort = e.SortExpression + " " + ViewState["sortorder"].ToString();
        Session["sortexp"] = e.SortExpression.ToString();
        GridView1.DataSource = dv;
        GridView1.DataBind();
    }
}
