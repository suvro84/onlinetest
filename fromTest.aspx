<%@ Page Language="C#" AutoEventWireup="true" CodeFile="fromTest.aspx.cs" Inherits="fromTest" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>

    <%--<script type="text/javascript">
    function getIframeValues()
    {
   // alert(window.frames["iframe"].document.forms["Members"].elements["TextBox1"].value);
  // alert(window.frames['iframe.aspx'].document.forms['Members'].elements['Search'].value);
  // alert(document.getElementById("iframe").body.document.getElementById("Search").value);
    
 //  alert(alert(window.frames["iframe"].document.getElementById("Search").value));
   
   
//    if (document.getElementById("iframe").contentDocument) 
//    {
//               var doc = document.getElementById("iframe").contentDocument;
//              alert(document.getElementById("iframe").contentDocument.value);
//              // alert(document.getElementById("iframe").body.document.getElementById("Search").value);

//           
//           
//    } 
//    else if (document.getElementById("iframe").contentWindow)
//            {
//               var doc = document.getElementById("iframe").contentWindow.document;
//                      alert(document.getElementById("iframe").body.document.getElementById("Search").value);

//           } 
//           else
//            {
//               var doc = window.frames[document.getElementById("iframe")].document;
//                  alert(document.getElementById("iframe").body.document.getElementById("Search").value);

//           
//           }
    

    var $currentIFrame = $('#iframe');
alert($currentIFrame.contents().find("body #Search").val("Value from parent file."));
    
    }
    
    </script>--%>


<script type="text/javascript">
    function getIframeValues()
    {
   // alert(window.frames["iframe"].document.forms["Members"].elements["TextBox1"].value);
  // alert(window.frames['iframe.aspx'].document.forms['Members'].elements['Search'].value);
  // alert(document.getElementById("iframe").body.document.getElementById("Search").value);
    
    
    if (document.getElementById("iframe").contentDocument) 
    {
               var doc = document.getElementById("iframe").contentDocument;
           } 
           else if (document.getElementById("iframe").contentWindow)
            {
               var doc = document.getElementById("iframe").contentWindow.document;
           } 
           else
            {
               var doc = window.frames[this.iframe.id].document;
           }
    
       alert(document.getElementById("iframe").body.document.getElementById("Search").value);

    
    
    }
    
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <div>
        <%-- <a href="test.aspx?p=1">1</a>
        <a href="test.aspx?p=6">6</a>--%>
        <iframe src="iframe.aspx" id="iframe"></iframe>
        <input type="button" id="btnsubmit" onclick="getIframeValues();" value="GetIframe Value"
            runat="server" />
    </div>
    </form>
</body>
</html>
