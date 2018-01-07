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
using System.Xml;
using System.IO;


public partial class exam : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["connectionString"]);

        if (IsPostBack != true)
        {
            string ques = Request.QueryString["ques"];
            string val = Request.QueryString["val"];
            if (val == null)
                val = "0";
            if (ques == null)
                ques = "1";
            //try
            //{

            //    if (conn.State == ConnectionState.Closed)
            //    {
            //        conn.Open();
            //    }

            //    SqlCommand cmd = new SqlCommand("select * from ques where ques_no='" + ques + "'", conn);
            //    SqlDataReader dr = cmd.ExecuteReader();
            //    dr.Read();
            //    this.quesno.InnerHtml = dr["ques_no"].ToString();
            //    this.lblques.Text = dr["ques"].ToString();
            //    this.rb1.Value = dr["ans1"].ToString();
            //    this.rbs1.InnerText = dr["ans1"].ToString();
            //    this.rb2.Value = dr["ans2"].ToString();
            //    this.rbs2.InnerText = dr["ans2"].ToString();
            //    this.rb3.Value = dr["ans3"].ToString();
            //    this.rbs3.InnerText = dr["ans3"].ToString();
            //    this.rb4.Value = dr["ans4"].ToString();
            //    this.rbs4.InnerText = dr["ans4"].ToString();
            //    this.ans.Value = dr["ans"].ToString();
            //    this.score.Value = val;

            //}
            //catch (Exception ex)
            //{
            //}
            //finally
            //{
            //    if (conn.State == ConnectionState.Open)
            //    {
            //        conn.Close();
            //    }
            //}

            try
            {
               string filepath = Server.MapPath("XML/questionDB.xml");
                XmlDocument xdoc = new XmlDocument();
                FileStream rfile = new FileStream(filepath, FileMode.Open);
                xdoc.Load(rfile);
                XmlNodeList list = xdoc.GetElementsByTagName("question");
                for (int i = 0; i < list.Count; i++)
                {
                    hdTotQues.Value = Convert.ToString(list.Count);
                    if (xdoc.GetElementsByTagName("ques_no")[i].InnerText.ToString() == ques)
                    {

                        this.quesno.InnerHtml = xdoc.GetElementsByTagName("ques_no")[i].InnerText.ToString();
                        this.lblques.Text = xdoc.GetElementsByTagName("ques")[i].InnerText.ToString();
                        this.rb1.Value = xdoc.GetElementsByTagName("ans1")[i].InnerText.ToString();
                        this.rbs1.InnerText = xdoc.GetElementsByTagName("ans1")[i].InnerText.ToString();
                        this.rb2.Value = xdoc.GetElementsByTagName("ans2")[i].InnerText.ToString();
                        this.rbs2.InnerText = xdoc.GetElementsByTagName("ans2")[i].InnerText.ToString();
                        this.rb3.Value = xdoc.GetElementsByTagName("ans3")[i].InnerText.ToString();
                        this.rbs3.InnerText = xdoc.GetElementsByTagName("ans3")[i].InnerText.ToString();
                        this.rb4.Value = xdoc.GetElementsByTagName("ans4")[i].InnerText.ToString();
                        this.rbs4.InnerText = xdoc.GetElementsByTagName("ans4")[i].InnerText.ToString();
                        this.ans.Value = xdoc.GetElementsByTagName("ans")[i].InnerText.ToString();
                        this.score.Value = val;
                        break;
                    }
                }
                rfile.Close();
            }
            catch (Exception ex)
            {
            }
        }
    }







}