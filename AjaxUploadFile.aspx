<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AjaxUploadFile.aspx.cs" Inherits="AjaxUploadFile" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>

    <script language="javascript" type="text/javascript">
function showWait()
{
    if ($get('myFile').value.length > 0)
    {
        $get('UpdateProgress1').style.display = 'block';
    }
}
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <Triggers>
                <asp:PostBackTrigger ControlID="btnUpload" />
            </Triggers>
            <ContentTemplate>
                <asp:FileUpload ID="myFile" runat="server" />
                <asp:Label ID="lblMsg" runat="server"></asp:Label>
                <br />
                <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="UploadFile" OnClientClick="javascript:showWait();" />
                <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                    <ProgressTemplate>
                        <asp:Label ID="lblWait" runat="server" BackColor="#507CD1" Font-Bold="True" ForeColor="White"
                            Text="Please wait ... Uploading file"></asp:Label>
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </ContentTemplate>
        </asp:UpdatePanel>
        <img src="<%=img %>" width="50px" height="50px" />
    </div>
    </form>
</body>
</html>
