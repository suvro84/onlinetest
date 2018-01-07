<%@ Page Language="C#" AutoEventWireup="true" CodeFile="testMultiselectCopyGrid1.aspx.cs"
    Inherits="testMultiselectCopyGrid1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div>
        <div id="" >
            <asp:GridView ID="GridView1" runat="server" DataKeyNames="ID" AutoGenerateColumns="False" 
               onrowdatabound="GridView1_RowDataBound">
                <Columns>
                    <asp:TemplateField HeaderText="CheckBox">
                        <ItemTemplate>
                            <input type="checkbox" name="cb<%#Eval("ID")%>" id="cb<%#Eval("ID")%>" />
                            <%--  <asp:CheckBox ID="chkList" runat="server" />--%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ID">
                        <ItemTemplate>
                            <asp:Literal ID="ltID1" Text='<%#Eval("ID")%>' runat="server"></asp:Literal>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Value">
                        <ItemTemplate>
                            <asp:Literal ID="ltValue1" Text='<%#Eval("Value")%>' runat="server"></asp:Literal>
                            <input style="display: none" type="text" name="txt<%#Eval("ID")%>" value="<%#Eval("Value")%>"
                                id="txt<%#Eval("ID")%>" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            
            <asp:Button ID="btnUp" runat="server" Text="UP"  Style="width: 30px" 
                onclick="btnUp_Click" />
            
          <asp:Button ID="btnAdd" runat="server" Text=">>" OnClick="btnAdd_Click" Style="width: 30px" />
            <asp:Button ID="btnRemove" runat="server" Text="<<" OnClick="btnRemove_Click" Style="width: 30px" />
           <%--  <asp:Button ID="btnUp" runat="server" Text="UP"  Style="width: 30px" 
                onclick="btnUp_Click" />--%>
            
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" ShowHeader="true">
                        <Columns>
                            <asp:TemplateField HeaderText="CheckBox">
                                <ItemTemplate>
                                    <input type="checkbox" id="cb1" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="ID">
                                <ItemTemplate>
                                    <asp:Literal ID="ltID" Text='<%#Eval("ID")%>' runat="server"></asp:Literal>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Value">
                                <ItemTemplate>
                                    <asp:Literal ID="ltValue" Text='<%#Eval("Value")%>' runat="server"></asp:Literal>
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
                <%--  <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnDel" EventName="Click" />
                </Triggers>--%>
            </asp:UpdatePanel>
            
        </div>
        <input type="hidden" id="hdAllempIds" runat="server" />
        <%--  <input type="button" id="btnDel" value="Del" onclick="javascript:funGetcheckedValues();" />--%>
        <%--<asp:Button ID="btnServerDel" runat="server" Text="ServerDel" OnClick="btnServerDel_Click" />--%>
    </div>
    </form>
</body>
</html>
