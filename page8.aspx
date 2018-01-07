<%@ Page Language="C#" AutoEventWireup="true" CodeFile="page8.aspx.cs" Inherits="page8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <link href="CSS/style.css" rel="stylesheet" type="text/css" />
</head>
<link href="CSS/style.css" rel="stylesheet" type="text/css" />
<body>
    <form id="form1" runat="server">
    <div>
    <asp:Repeater   ID="dlLink" runat="server">
    <HeaderTemplate>
    <table class="tableBorder" width="100%" border="0" cellpadding="0" cellspacing="0">
         
                  <tbody>
                  <tr>
                    <td class="tableBorder1 tableBorder2" valign="top" width="10%" align="center">S. No</td>
                    <td class="tableBorder1" valign="top" align="center">Link Exchange Category</td>
                    <td class="tableBorder1" valign="top" width="20%" align="center">Wating for Approval</td>
                    <td class="tableBorder1" valign="top" width="20%" align="center">Approved</td>
                    <td class="tableBorder1 tableBorder4" valign="top" width="25%" align="center">Rejected</td>
                  </tr>
                     <tr>
                    <td colspan="5" class="topBorder" valign="top" align="center" height="1"></td>
                  </tr>
    </HeaderTemplate>
    
    <ItemTemplate>
  
      <tr>
                    <td class="rightBorder" valign="top" align="center"><%#Eval("wait")%></td>
                    <td class="rightBorder siteName1" valign="top" align="center"><a href="#" class="siteName"> <%#Eval("COL") %> </a></td>
                    <td class="rightBorder approvedLink" valign="top" align="center"><span><%#Eval("wait")%></span> | <a href="#" title="view">view</a></td>
                    <td class="rightBorder approvedLink" valign="top" align="center"><span><%#Eval("approved")%></span> | <a href="#" title="view">view</a></td>
                    <td class="approvedLink" valign="top" align="center"><span><%#Eval("cancel")%></span> | <a href="#" title="view">view</a></td>
                  </tr>
       
        <tr>
                    <td colspan="5" class="bottomBorder" valign="top" align="center" height="5"></td>
                  </tr>
    </ItemTemplate>
    <FooterTemplate>
    </table>
    </FooterTemplate>
    </asp:Repeater>
    
    
    </div>
    </form>
</body>
</html>
