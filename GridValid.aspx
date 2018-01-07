<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridValid.aspx.cs" Inherits="GridValid" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript">
        function fun1() {
            document.getElementById("dvUc").innerHTML = "<iframe  src=\"jQueryCustomDataTable.aspx?control=" + document.getElementById("txtName") + "\" id=\"iframeImage\" scrolling=\"no\" frameborder=\"0\" hidefocus=\"true\" style=\"text-align: center; vertical-align: middle; border-style: none; margin:0 0 10px 0; width:521px; overflow:hidden; \"></iframe>";

        }
</script>

</head>
<body>
    <form id="form1" runat="server" >
    <div id="dvUc" runat="server">
    </div>
    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
    </form>
</body>
</html>
