<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SelectableGridView.aspx.cs"
    Inherits="SelectableGridView" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <%--<script src="_scripts/jquery-1.3.2.min.js" type="text/javascript"></script>--%>

    <script src="_scripts/jquery-1.4.1.min.js" type="text/javascript"></script>

    <%--<script type="text/javascript">
        $(function() {

            var RowID = $('#hdnEmailID').val();
            if (RowID != "0") {
                $('#<%=gvUsers.ClientID%> tr[id=' + RowID + ']').css({ "background-color": "Black", "color": "White" });
            }

            $('#<%=gvUsers.ClientID%> tr[id]').click(function() {
                $('#<%=gvUsers.ClientID%> tr[id]').css({ "background-color": "White", "color": "Black" });
                $(this).css({ "background-color": "Black", "color": "White" });
                $('#hdnEmailID').val($(this).attr("id"));
            });

            $('#<%=gvUsers.ClientID%> tr[id]').mouseover(function() {
                $(this).css({ cursor: "hand", cursor: "pointer" });
            });

        });
    </script>--%>

    <script type="text/javascript">

        var currentRowId = 0;

        function MarkRow(rowId) {
            if (document.getElementById(rowId) == null)
                return;

            if (document.getElementById(currentRowId) != null)
                document.getElementById(currentRowId).style.backgroundColor = '#ffffff';
                
            var count = parseInt(document.getElementById("hdTot").value);
            for (var i = 0; i < count; i++) {
               // alert(document.getElementById(i).style.backgroundColor.toString());
                //if (document.getElementById(i).style.backgroundColor.toString() == 'rgb(255, 0, 0)') {
                if (document.getElementById(i).style.backgroundColor.toString() == '#ff0000'|| document.getElementById(i).style.backgroundColor.toString() == 'rgb(255, 0, 0)') {
                    //alert('found');
                    document.getElementById(i).style.backgroundColor = '#ffffff';
                   // break;
                }
            
            } 

            currentRowId = rowId;
            document.getElementById(rowId).style.backgroundColor = '#ff0000';

            document.getElementById("hdcurrentRowId").value = rowId;
           // alert(document.getElementById("hdcurrentRowId").value);
        }

        function SelectRow() {
            if (event.keyCode == 40)
                MarkRow(currentRowId + 1);
            else if (event.keyCode == 38)
                MarkRow(currentRowId - 1);
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
    
    
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
     <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
        
    <div>
        <input id="hdcurrentRowId" type="hidden" value="0" runat="server" />
        <input id="hdTot" type="hidden" value="" runat="server" />
       
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID"
            OnRowDataBound="gvUsers_RowDataBound">
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" />
                <asp:BoundField DataField="Value" HeaderText="Value" ReadOnly="True" />
                <%-- <asp:BoundField DataField="Email" HeaderText="Email" ReadOnly="True" />                    --%>
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#330099" />
            <RowStyle BackColor="White" ForeColor="#330099" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#F06300" Font-Bold="True" ForeColor="#FFFFCC" />
        </asp:GridView>
      
        
        
        <asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="False" DataKeyNames="ID"
            OnRowDataBound="gvUsers_RowDataBound">
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" />
                <asp:BoundField DataField="Value" HeaderText="Value" ReadOnly="True" />
                <%-- <asp:BoundField DataField="Email" HeaderText="Email" ReadOnly="True" />                    --%>
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#330099" />
            <RowStyle BackColor="White" ForeColor="#330099" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#F06300" Font-Bold="True" ForeColor="#FFFFCC" />
        </asp:GridView>
        <asp:Button ID="btnSelect" runat="server" OnClick="btnSelect_Click" Text="Select" />
        <asp:Button ID="btnDelete" runat="server" OnClick="btnDelete_Click" Text="Delete" />
        <asp:Button ID="btnDown" runat="server" Text="DOWN" OnClick="btnDown_Click" />
        <asp:Button ID="btnUp" runat="server" Text="UP" />
        
        <br />
        <asp:Button ID="btn_dwn" runat="server" Text="DOWN" onclick="btn_dwn_Click" />
         <asp:Button ID="btn_up" runat="server" Text="UP" onclick="btn_up_Click" />
    </div>
  </ContentTemplate>
        
        
        </asp:UpdatePanel>
    <script type="text/javascript">
        $(document).ready(function() {
            $(".up,.down").click(function() {
                var row = $(this).parents("tr:first");
                if ($(this).is(".up")) {
                    row.insertBefore(row.prev());
                } else {
                    row.insertAfter(row.next());
                }
            });
        });
    </script>

    <table>
        <tr>
            <td>
                One
            </td>
            <td>
                <a href="#" class="up">Up</a> <a href="#" class="down">Down</a>
            </td>
        </tr>
        <tr>
            <td>
                Two
            </td>
            <td>
                <a href="#" class="up">Up</a> <a href="#" class="down">Down</a>
            </td>
        </tr>
        <tr>
            <td>
                Three
            </td>
            <td>
                <a href="#" class="up">Up</a> <a href="#" class="down">Down</a>
            </td>
        </tr>
        <tr>
            <td>
                Four
            </td>
            <td>
                <a href="#" class="up">Up</a> <a href="#" class="down">Down</a>
            </td>
        </tr>
        <tr>
            <td>
                Five
            </td>
            <td>
                <a href="#" class="up">Up</a> <a href="#" class="down">Down</a>
            </td>
        </tr>
    </table>
    <input id="hdnEmailID" type="hidden" value="1" runat="server"/>
    </form>
</body>
</html>
