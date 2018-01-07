<%@ Page Language="C#" AutoEventWireup="true" CodeFile="demoXML.aspx.cs" Inherits="demoXML" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:label id="result" runat="server" />
        <asp:Button ID="BtnCreate" runat="server" Text="Create" 
            onclick="BtnCreate_Click" />
                   <asp:Button ID="btnAdd" runat="server" Text="ADD" 
            onclick="btnAdd_Click"  />

       <asp:Button ID="btnRead" runat="server" Text="Read" onclick="btnRead_Click" />
       <asp:Button ID="btnUpdate" runat="server" Text="Update" 
            onclick="btnUpdate_Click" />
       <asp:Button ID="btnDelete" runat="server" Text="Delete" 
            onclick="btnDelete_Click" />
            <br />
              <asp:Button ID="btnCreateMovieXML" runat="server" Text="CreateMovieXML" 
            onclick="btnCreateMovieXML_Click" />
            
               <asp:Button ID="btnXpath" runat="server" Text="XPath" onclick="btnXpath_Click" 
            />

            
        <asp:DropDownList ID="ddlPrice" runat="server">
        </asp:DropDownList>
        </div>
    </form>
</body>
</html>
