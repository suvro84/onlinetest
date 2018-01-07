<%@ Page Language="C#" AutoEventWireup="true" CodeFile="grid.aspx.cs" Inherits="grid"
    EnableEventValidation="false" %>

<%@ Register src="ucMenu.ascx" tagname="ucMenu" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <link href="CSS/styles.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">





        function valid(lblPackName) {
            // alert('hi');
            // alert(lblPackName);
            // alert(lblPackName.length);
            // alert(document.getElementById(lblPackName).value.length );
            if (document.getElementById(lblPackName).value.length > 0) {

                return true;

            }
            else {
                alert("plz enter value");
                document.getElementById(lblPackName).focus();
                return false;
            }
        }
        function funGetcheckedValues() {
            //            alert(emp_id);
            //            hdcheckedValues += emp_id + "~";
            //            alert(hdcheckedValues);

            var empIds = document.getElementById("hdAllempIds").value;
            alert(empIds);
            if (empIds != null && empIds != '') {
                var strempIds = new Array();
                var SelectedFectors = "";
                strempIds = empIds.split('|');

                for (var j = 0; j < strempIds.length - 1; j++) {
                    if (document.getElementById("cb" + strempIds[j]).checked == true) {
                       // SelectedFectors += document.getElementById("cb" + strempIds[j]).value + "|";
                        SelectedFectors +=  strempIds[j]+ "|";
                    }
                }

                var gridView = document.getElementById('<%= gv.ClientID %>');
                var cell = gridView.rows[parseInt(SelectedFectors) + 1].cells[2].childNodes[2];  
                alert(SelectedFectors);
                 alert(cell);
            }
            else {

            }




        }





      

    </script>
    
    
    
    
    

</head>
<body>
    <form id="form1" runat="server">
    <div>
        
        <uc1:ucMenu ID="ucMenu1" runat="server" />
        
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" OnRowCommand="GridView1_RowCommand">
            <Columns>
                <asp:BoundField DataField="ApplicationName" HeaderText="Application Name" />
               
                <asp:BoundField DataField="ServerName" HeaderText="Server Name" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:TextBox ID="txtsample" runat="server"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <%-- <asp:LinkButton ID="btnUpdate" CommandArgument='<%# Container.DataItemIndex %>' CommandName="Up"
                            runat="server" CausesValidation="False">Update</asp:LinkButton>--%>
                        <asp:Button ID="btnUpdate" runat="server" Text="Update" CommandArgument='<%# Container.DataItemIndex %>'
                            CommandName="Up" />
                        <%--  <asp:LinkButto<asp:Button runat="server" Text="Button"></asp:Button>n ID="lnkAdd" CommandArgument='<%# Container.DataItemIndex %>' CommandName="Add"
                            runat="server" CausesValidation="False">Add</asp:LinkButton>--%>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Button" />
        <br />
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand"
            OnRowDataBound="GridView2_RowDataBound">
            <Columns>
                <asp:BoundField DataField="ApplicationName"  HeaderText="Application Name" />
                <asp:BoundField DataField="ServerName" HeaderText="Server Name" />
                <asp:TemplateField HeaderText="package_name">
                    <ItemTemplate>
                        <asp:TextBox ID="lblPackName" runat="server"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkAdd" CommandArgument='<%# Container.DataItemIndex %>' CommandName="Add"
                            runat="server" CausesValidation="False">Add</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:GridView ID="gv" ShowFooter="true" runat="server" AutoGenerateColumns="false"
            OnRowCommand="gv_RowCommand">
            <Columns>
                <asp:TemplateField HeaderText="SL">
                    <ItemTemplate>
                        <input type="checkbox" name="cb<%#Eval("emp_id")%>" id="cb<%#Eval("emp_id")%>" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="SL">
                    <ItemTemplate>
                        <%#Eval("SlNo")%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="emp_id">
                    <ItemTemplate>
                        <asp:Literal ID="ltemp_id" Text='<%#Eval("emp_id")%>' runat="server"></asp:Literal>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="SL">
                    <ItemTemplate>
                        <%#Eval("package_name")%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Status">
                    <ItemTemplate>
                        <input type="checkbox" name="cb" id="cb" runat="server" />
                        <asp:Literal ID="ltcheck" Visible="false" Text='<%#Eval("checked")%>' runat="server"></asp:Literal>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="SL">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkDelete" CommandName="del" CommandArgument='<%#Container.DataItemIndex %>'
                            runat="server">Delete</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <input type="hidden" id="hdAllempIds" runat="server" />
        <input type="button" id="btnDel" value="Del" onclick="javascript:funGetcheckedValues();" />
        <asp:Button ID="btnServerDel" runat="server" Text="ServerDel" OnClick="btnServerDel_Click" />
        <asp:GridView ID="gvRowSelect" DataKeyNames="emp_id" ShowFooter="true" runat="server" AutoGenerateColumns="false"
            OnRowDataBound="gvRowSelect_RowDataBound">
            <Columns>
                <%--<asp:TemplateField HeaderText="SL">
                    <ItemTemplate>
                        <%#Eval("SlNo")%>
                    </ItemTemplate>
                </asp:TemplateField>--%>
                <asp:BoundField DataField="SlNo" HeaderText="SlNo" />
                <asp:TemplateField HeaderText="emp_id">
                    <ItemTemplate>
                        <asp:Literal ID="ltemp_id" Text='<%#Eval("emp_id")%>' runat="server"></asp:Literal>
                    </ItemTemplate>
                  
                </asp:TemplateField>
               <%-- <asp:BoundField DataField="emp_id" HeaderText="emp_id" />--%>
                <%--<asp:TemplateField HeaderText="SL">
                    <ItemTemplate>
                        <%#Eval("package_name")%>
                    </ItemTemplate>
                </asp:TemplateField>--%>
                <asp:BoundField DataField="package_name" HeaderText="package_name" />
                <%--<asp:TemplateField HeaderText="Status">
                    <ItemTemplate>
                        <input type="checkbox" name="cb" id="cb" runat="server" />
                        <asp:Literal ID="ltcheck" Visible="false" Text='<%#Eval("checked")%>' runat="server"></asp:Literal>
                    </ItemTemplate>
                </asp:TemplateField>--%>
            </Columns>
        </asp:GridView>
        
        
        <asp:GridView ID="GridView3" CssClass="dataTable1" runat="server" 
            onrowdatabound="GridView3_RowDataBound">
        </asp:GridView>
        
        
        <input type="hidden" id="hdAllids" runat="server" />
        <input type="hidden" id="hdSelectedIds" runat="server" />
    </div>
    </form>
</body>
</html>

<script language="javascript" type="text/javascript">

    function FillColor(cellid, id, evt)
     {

         alert(cellid);
         alert(document.getElementById(cellid));
         if (!evt) var evt = window.event;
         ctrlPressed = evt.ctrlKey;
         if (!ctrlPressed) {
             //alert(ctrlPressed);
             var clearCellColor = document.getElementById('hdAllids').value.split('|');
             for (i = 0; i < clearCellColor.length; i++) {
                 document.getElementById(cellid).bgColor = "#99CCFF";
                 document.getElementById(clearCellColor[i]).style.color = "Black";
             }
            // isSelected.value = '';
         }
       
//        for (i = 0; i < clearCellColor.length; i++) 
//        {
//        
//        
//        }
    }




</script>
