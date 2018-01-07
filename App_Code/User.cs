using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

/// <summary>
/// Summary description for User
/// </summary>
namespace Rob
{
    public class User
    {
        protected string name;
        protected int age;
        public string Name
        { 
            get 
            { return name; 
            } 
            set
            {
                name = value; 
            }
        }
        public int Age { get { return age; } set { age = value; } }
    }
}

