<%@ Page Language="C#" AutoEventWireup="true" CodeFile="testMultiselectGridCopy.aspx.cs"
    Inherits="testMultiselectGridCopy" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div>
        <div id="effect" class="ui-widget-content">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:TemplateField HeaderText="CheckBox">
                        <ItemTemplate>
                            <input type="checkbox" name="cb<%#Eval("ID")%>" id="cb<%#Eval("ID")%>" onclick="GetSelectedValue(<%#Eval("ID")%>,'<%#Eval("Value")%>');" />
                            <%--  <asp:CheckBox ID="chkList" runat="server" />--%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ID">
                        <ItemTemplate>
                            <%#Eval("ID")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Value">
                        <ItemTemplate>
                            <span id="sp<%#Eval("ID")%>">
                                <%#Eval("Value")%>
                            </span>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <br />
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" ShowHeader="true">
                        <Columns>
                            <asp:TemplateField HeaderText="CheckBox">
                                <ItemTemplate>
                                    <input type="checkbox" id="cb2" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="ID">
                                <ItemTemplate>
                                    <%#Eval("ID")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Value">
                                <ItemTemplate>
                                    <span id="sp<%#Eval("ID")%>">
                                        <%#Eval("Value")%>
                                    </span>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                        <ProgressTemplate>
                            <img src="Pictures/loading.gif" />
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnDel" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
            <asp:Button ID="btnDel" runat="server" Text=">>" OnClick="btnDel_Click" Style="width: 30px" />
        </div>
        <input type="hidden" id="hdAllempIds" runat="server" />
        <input type="button" id="btnDel" value="Del" onclick="javascript:funGetcheckedValues();" />
        <asp:Button ID="btnServerDel" runat="server" Text="ServerDel" OnClick="btnServerDel_Click" />
    </div>
    </form>
</body>
</html>
