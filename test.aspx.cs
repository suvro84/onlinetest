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
using System.Collections.Generic;

public partial class test : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        btnUpload.Attributes.Add("onclick", "return validateFileUpload(document.getElementById('" + FileUpload1.ClientID + "'));");
        if (Request.QueryString["p"] != null)
        {
            int f ;
            int t ;
            int p = Convert.ToInt32(Request.QueryString["p"]);
            bool bflag=false;
            if (bflag == false)
            {
                ViewState["f"] = 1;
                ViewState["t"] = 6;
                bflag = true;
            }
            else
            {
                ViewState["f"] = p + 1;
                ViewState["t"] = p * 2;
            }

            if (p % 6 == 0)
            {
               ViewState["f"] = p + 1;
                  ViewState["t"] = p * 2;
                  bflag = true;
            }
            else
            {
                ViewState["f"] = 1;
                ViewState["t"] = 6;
            }

            Response.Write(Convert.ToString(ViewState["f"]));
            Response.Write(Convert.ToString(ViewState["t"]));


            //if (bflag == "x")
            //{
            //    Response.Write(f.ToString());
            //    Response.Write(t.ToString());

            //}
            //else
            //{
            //    Response.Write(f.ToString());
            //    Response.Write(t.ToString());
            //}
        }


        if (!IsPostBack)
        {
            populateStateddl();
        }

    }

    public void populateStateddl()
    {

        GCommon<State> obj = new DataManipulationClass().populateState();
        if (obj.Count > 0)
        {
            IEnumerator<State> ie = obj.GetEnumerator();
            while (ie.MoveNext())
            {
                ListItem li = new ListItem();
                li.Text = ie.Current.sname.ToString();
                li.Value = ie.Current.sid.ToString();
                ddlState.Items.Add(li);

            }
        }


    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        string[] strCityIds = hdids.Value.Split(new char[] { ',' });

        string seletedcities = "";
        for (int i = 0; i < strCityIds.Length - 1; i++)
        {
            if (Request.Form.Get("Radio" + strCityIds[i]) != null)
            {
                seletedcities += Request.Form.Get("Radio"+strCityIds[i]) + "|";
            }
        }
    }
}
