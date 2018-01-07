<%@ Page Language="C#" AutoEventWireup="true" CodeFile="floatingdiv-gv.aspx.cs" Inherits="floatingdiv_gv" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <style type="text/css">
        .dvBroker
        {
            display: none;
            position: absolute;
            left: 0;
            top: 0;
            height: 100%;
            width: 100%;
            background-image: url(image/broker_bg.png);
            background-repeat: repeat;
        }
        .collection_heading2
        {
            font-family: verdana;
            font-size: 12px;
            font-weight: bold;
            color: #000000;
            background-image: url(image/gray_bg.gif);
            background-repeat: repeat-x;
            height: 20px;
            width: 386px;
            margin-left: 30%;
            margin-top: 50px;
            padding: 7px 7px 0px 7px;
            border: 3px solid #000000;
            border-bottom: none;
            text-align: center;
        }
        .broker_window
        {
            border: 3px solid #000000;
            height: 250px;
            overflow: auto;
            width: 400px;
            background-color: White;
            margin-left: 30%;
            border-top: none;
            padding-top: 10px;
            text-align: left;
        }
    </style>
</head>
<body>

    <script type="text/javascript" language="javascript">
        function Show() {
            document.getElementById("dvstage").style.display = 'block';
            return false;
        }
        function Close() {
            document.getElementById("dvstage").style.display = 'none';
            return false;
        }

    </script>

    <form id="form1" runat="server">
    <asp:ScriptManager ID="sc1" runat="server" EnablePartialRendering="true">
    </asp:ScriptManager>
    
    <div>
       
        
        <%--<asp:GridView ID="gvstudent" runat="server" AutoGenerateColumns="False" Width="857px"
            OnRowDataBound="gvstudent_RowDataBound" OnSelectedIndexChanged="gvstudent_SelectedIndexChanged1">
            <Columns>
                <asp:BoundField HeaderText="ROLL NO" DataField="roll_no" />
                <asp:BoundField HeaderText="NAME" DataField="name" />
                <asp:BoundField HeaderText="TOTAL" DataField="total" />
                <asp:BoundField HeaderText="STATUS" DataField="status" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button CommandName="Click" ID="btnclick" OnCommand="btnclick_Click" CommandArgument='<%#Eval("roll_no") %>'
                            OnClientClick="return Show('aspnetForm','[gvstudent]');" runat="server" Text="Click" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>--%>
        <asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="False" DataKeyNames="ID"
            >
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" />
                <asp:BoundField DataField="Value" HeaderText="Value" ReadOnly="True" />
                <%-- <asp:BoundField DataField="Email" HeaderText="Email" ReadOnly="True" /> 
                                   --%>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button CommandName="Click" ID="btnclick" 
                            OnClientClick="return Show('aspnetForm','[gvstudent]');" runat="server" Text="Click" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#330099" />
            <RowStyle BackColor="White" ForeColor="#330099" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#F06300" Font-Bold="True" ForeColor="#FFFFCC" />
        </asp:GridView>
    </div>
    <div id="dvstage" class="dvBroker" style="display:none">
        <div class="collection_heading2">
            <div style="float: left">
                SUBJECT
            </div>
            <div style="float: right">
                <asp:ImageButton ID="btnclose" runat="server" ImageUrl="~/image/delete.png" OnClientClick="return Close();" />
            </div>
        </div>
        <div class="broker_window">
            <asp:UpdatePanel ID="up1" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <%--<asp:PopupControlExtender ID="PopupControlExtender1" runat="server" TargetControlID="gvchild"
                        PopupControlID="btnclick" Position="Center">
                    </asp:PopupControlExtender>
                    --%>
                    
                    
                    <asp:Button ID="btnaddchild" runat="server" Text="ADD" />&nbsp;
                    <asp:Button ID="btncancle" runat="server" Text="CANCLE"  />
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
    </form>
</body>
</html>
