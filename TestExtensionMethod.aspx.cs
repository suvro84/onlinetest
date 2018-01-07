using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using ExtM;
using DAL;


public partial class TestExtensionMethod : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string email = "test@yahoo.com";
        if (email.IsValidEmailAddress())
        {
            email.Reverse();
            Response.Write(email.Reverse());
        }

        NorthwindDataContext db = new NorthwindDataContext();

    }

}
