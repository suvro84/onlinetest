using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class GridValid : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (txtName.Text == "")
        {
            
            dvUc.InnerHtml ="<iframe  src=\"jQueryCustomDataTable.aspx?control='" + txtName.ClientID + "'\" id=\"iframeImage\" scrolling=\"no\" frameborder=\"0\" hidefocus=\"true\" style=\"text-align: center; vertical-align: middle; border-style: none; margin:0 0 10px 0; width:521px; overflow:hidden; \"></iframe>";
            
           // ClientScript.RegisterClientScriptBlock(Page.GetType(), "PopupScript", "<script>fun1();</script>");

        }
    }
}
