<%@ Page Language="C#" AutoEventWireup="true" CodeFile="demoajaxdll.aspx.cs" Inherits="demoajaxdll" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <script type="text/javascript" >
    function funSendMsg()
{


         //document.getElementById("tdiv").innerHTML=demoajaxdll.SendMsg().value;
         demoajaxdll.SendMsg(callback_send);

}
function callback_send(res)
{
   
    document.getElementById("tdiv").innerHTML=res.value;
}
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    	    <input id="btnChat" name="btnChat"onclick="funSendMsg();" value="Send Message" type="button">                
  <div id="tdiv" >
  </div>
    </div>
    </form>
</body>
</html>
