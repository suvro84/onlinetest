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

public partial class AjaxUploadFile : System.Web.UI.Page
{
    public string img="";
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void UploadFile(object sender, EventArgs e)
    {
        if (myFile.HasFile)
        {
            string strFileName;
            int intFileNameLength;
            string strFileExtension;

            strFileName = myFile.FileName;
            intFileNameLength = strFileName.Length;
            strFileExtension = strFileName.Substring(intFileNameLength - 4, 4);

            if (strFileExtension.ToLower() == ".jpg")
            {
                try
                {
                    myFile.PostedFile.SaveAs(Server.MapPath(".") + "//Upload//1.jpg");
                    lblMsg.Text = strFileName + " Uploaded successfully!";
                    img = "http://localhost:1732/OnlineTest/" + "Upload/1.jpg";
                }
                catch (Exception exc)
                {
                    lblMsg.Text = exc.Message;
                }
            }
            else
            {
                lblMsg.Text = "Only Text File (.txt) can be uploaded.";
            }
        }
        else
        {
            lblMsg.Text = "Please select a file!";
        }
    }
}
