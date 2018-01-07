<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditRepeater.aspx.cs" Inherits="EditRepeater" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Repeater ID="rep1" runat="server" OnItemDataBound="rep1_ItemDataBound" OnItemCommand="rep1_ItemCommand">
            <HeaderTemplate>
                <table>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td>
                        <asp:Literal ID="litname" runat="server"></asp:Literal>
                    </td>
                    <td>
                        <asp:TextBox ID="txtUnitsInStock" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="btnChangeUnitsInStock" runat="server" Text="Update" />
                        <asp:Button ID="btnDiscontinued" runat="server" Text="Set as discontinued" />
                    </td>
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
