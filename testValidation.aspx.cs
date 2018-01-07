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

public partial class testValidation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {

            if (txtName.Text.Trim() == "")
            {


                DataTable dtMsgDetails = new DataTable();
                dtMsgDetails.Columns.Add("id", typeof(int));
                dtMsgDetails.Columns["id"].AutoIncrement = true;
                dtMsgDetails.Columns["id"].AutoIncrementSeed = 1;
                dtMsgDetails.PrimaryKey = new System.Data.DataColumn[] { dtMsgDetails.Columns["id"] };
                dtMsgDetails.Columns.Add("msg", typeof(string));
                dtMsgDetails.Columns.Add("controlId", typeof(string));
                DataRow dr = dtMsgDetails.NewRow();
                dr[1] = "Please enter Name";
                dr[2] = txtName.ClientID;
                dtMsgDetails.Rows.Add(dr);
                DataRow dr1 = dtMsgDetails.NewRow();
                dr1[1] = "Please enter City";
                dr1[2] = txtCity.ClientID;
                dtMsgDetails.Rows.Add(dr1);
                DataRow dr2 = dtMsgDetails.NewRow();
                dr2[1] = "Please enter Phone";
                dr2[2] = txtPhone.ClientID;
                dtMsgDetails.Rows.Add(dr2);
                DataRow dr3 = dtMsgDetails.NewRow();
                dr3[1] = "Please Select";
                //dr3[2] = Request.Form.Get("rb");
                dr3[2] = "rb";
               // ClientScript.RegisterStartupScript(this.GetType(), "alert","<script>document.getElementById("hdTot").value=;</script>");

                dtMsgDetails.Rows.Add(dr3);
                hdTot.Value = Convert.ToString(dtMsgDetails.Rows.Count);
                System.Text.StringBuilder sbErrorDetails = new System.Text.StringBuilder();
                System.Text.StringBuilder sbPage = new System.Text.StringBuilder();
                int intPageNo = 1;
                if (hdPageNo.Value == "")
                {
                }
                else
                {
                    intPageNo = Convert.ToInt32(hdPageNo.Value);
                }
                foreach (DataRow drMsgDetails in dtMsgDetails.Rows)
                {
                    if (txtName.ClientID == Convert.ToString(drMsgDetails["controlId"]))
                    {
                        sbErrorDetails.Append("<span style=\"display:block\" id=\"sp" + drMsgDetails["id"] + "\"><a href=\"javascript:funMakeFocus('" + Convert.ToString(drMsgDetails["controlId"]) + "');\">" + drMsgDetails["msg"].ToString() + "</a></span><br>");
                    }
                    else
                    {
                        sbErrorDetails.Append("<span style=\"display:none\" id=\"sp" + drMsgDetails["id"] + "\"><a href=\"javascript:funMakeFocus('" + Convert.ToString(drMsgDetails["controlId"]) + "');\">" + drMsgDetails["msg"].ToString() + "</a></span><br>");
                    }
                }
                if (intPageNo == 1)
                {
                    sbPage.Append("<span style=\"display:block\"id=\"spPrevious\">Previous</span>");
                }
                else
                {
                    sbPage.Append("<span style=\"display:block\"id=\"spPrevious\"><a href=\"javascript:funPagination(" + (intPageNo - 1) + ");\">Previous</a></span>");
                }
                if (Convert.ToString(dtMsgDetails.Rows.Count) == "1")
                {
                    sbPage.Append("<span style=\"display:block\"id=\"spNext\">Next</span>");
                }
                else
                {
                    sbPage.Append("<span class=\"float\"   style=\"display:block\"id=\"spNext\"><a href=\"javascript:funPagination(" + (intPageNo + 1) + ");\">Next</a></span>");
                }
                ((Label)UC1.FindControl("lblError")).Text = Convert.ToString(sbErrorDetails);
                ((Label)UC1.FindControl("lblPage")).Text = Convert.ToString(sbPage);
            }
        }
        catch (Exception ex)
        {



        }


    }
}