using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Net;
using System.Net.Mail;
using System.Web.Configuration;

public class MailOnExceptions
{
    public MailOnExceptions()
	{
	}
    public void SendMail(string mailBody, string mailSubject)
    {
        // ------------------------------------------------------
        // MAIL SERVER SETTINGS (DONT' TOUCH THE CODE)
        // ------------------------------------------------------
        System.Configuration.Configuration config = WebConfigurationManager.OpenWebConfiguration(HttpContext.Current.Request.ApplicationPath);
        System.Net.Configuration.MailSettingsSectionGroup settings = (System.Net.Configuration.MailSettingsSectionGroup) config.GetSectionGroup("system.net/mailSettings");
        string server = settings.Smtp.Network.Host;
        int port = settings.Smtp.Network.Port;
        string email = settings.Smtp.Network.UserName;
        string passkey = settings.Smtp.Network.Password;
        MailMessage objMail = new MailMessage();
        objMail.To.Add("rtechkol@gmail.com");
        objMail.To.Add("adesai12@gmail.com");
        objMail.From = new MailAddress("noreply@giftstoindia24x7.com", "Giftstoindia24x7");
        //objMail.CC.Add("ravi.lal@reliablewebtechnologies.com");
        objMail.Subject = "Error : " + mailSubject;
        objMail.Body = mailBody;
        objMail.IsBodyHtml = true;
        objMail.Priority = MailPriority.High;
        //objMail.DeliveryNotificationOptions = DeliveryNotificationOptions.OnFailure;
        try
        {
            SmtpClient client = new SmtpClient(server);
            client.UseDefaultCredentials = false;
            client.Credentials = new NetworkCredential(email, passkey);
            client.Port = port;
            //client.DeliveryMethod = SmtpDeliveryMethod.PickupDirectoryFromIis;
            client.Send(objMail);
            //flag = true;
        }
        catch (SmtpException ex) {  }
    }
}
