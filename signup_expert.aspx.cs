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

public partial class signup_expert : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSubmit_Click(object sender, ImageClickEventArgs e)
    {
        Login objlogin = new Login();
        objlogin.Address1 = txtAddress1.Value.ToString().Replace("'", "''");
        objlogin.username = txtUserName.Value;
        DataManipulationClass objdata = new DataManipulationClass();
        string strError = "";
        objdata.AddExpert(objlogin, ref strError);
    }
}
