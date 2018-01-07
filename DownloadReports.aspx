<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DownloadReports.aspx.cs" Inherits="DownloadReports" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div id="dvSelectedIds" runat="server">
    
   
        </div>
        
        <asp:Button ID="btnDownload" runat="server" Text="Download" 
            onclick="btnDownload_Click" />
    </form>
</body>
</html>
