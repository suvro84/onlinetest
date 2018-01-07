<%@ Page Language="C#" AutoEventWireup="true" CodeFile="gvContextMenu.aspx.cs" Inherits="gvContextMenu" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
      
      
        <%--<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" OnRowCommand="gvResults_RowCommand"
            EmptyDataText="Results not found">
        
        <Columns>
                <asp:TemplateField ItemStyle-Width="3%">
                    <ItemStyle HorizontalAlign="Center" />
                    <ItemTemplate>
                        <asp:Label ID="lblID" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "UserID")%>'></asp:Label>
                        <ul id="ulMenu" runat="server" class="SimpleContextMenu" style="width: 120px">
                            <li>
                                <asp:LinkButton ID="lnkEdit" runat="server" CausesValidation="false" CommandName="EditUser"
                                    CommandArgument='<%#DataBinder.Eval(Container.DataItem,"UserID")%>'>
                                    <asp:Image ID="Image2" runat="server" SkinID="Edit">
                                    Edit</asp:LinkButton>
                            </li>
                            <li>
                                <asp:LinkButton ID="lnkView" runat="server" CausesValidation="false" CommandName="View"
                                    CommandArgument='<%#DataBinder.Eval(Container.DataItem,"UserID")%>'>
                                    <asp:Image ID="imgbtnSendMailContext" runat="server" ToolTip="Click here to View"
                                        SkinID="ImgSendMail" />&nbsp; View
                                </asp:LinkButton>
                            </li>
                        </ul>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>--%>
      
     
    </div>
    </form>
</body>
</html>
