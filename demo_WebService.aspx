<%@ Page Language="C#" AutoEventWireup="true" CodeFile="demo_WebService.aspx.cs" Inherits="demo_WebService" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <asp:DropDownList ID="ddlCity" AutoPostBack="true" runat="server" Height="16px" Width="252px" 
            onselectedindexchanged="ddlCity_SelectedIndexChanged">
    </asp:DropDownList>
    
        <asp:Label ID="lblWeatherCondition" runat="server" Text=""></asp:Label>
    </div>
   
    </form>
</body>
</html>
