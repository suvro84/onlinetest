<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CS.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Delete Selected rows from one Gridview to another</title>
    <script type = "text/javascript">
<!--
function Check_Click(objRef)
{
    //Get the Row based on checkbox
    var row = objRef.parentNode.parentNode;
    
    //Get the reference of GridView
    var GridView = row.parentNode;
    
    //Get all input elements in Gridview
    var inputList = GridView.getElementsByTagName("input");
    
    for (var i=0;i<inputList.length;i++)
    {
        //The First element is the Header Checkbox
        var headerCheckBox = inputList[0];
        
        //Based on all or none checkboxes
        //are checked check/uncheck Header Checkbox
        var checked = true;
        if(inputList[i].type == "checkbox" && inputList[i] != headerCheckBox)
        {
            if(!inputList[i].checked)
            {
                checked = false;
                break;
            }
        }
    }
    headerCheckBox.checked = checked;
    
}
function checkAll(objRef)
{
    var GridView = objRef.parentNode.parentNode.parentNode;
    var inputList = GridView.getElementsByTagName("input");
    for (var i=0;i<inputList.length;i++)
    {
        var row = inputList[i].parentNode.parentNode;
        if(inputList[i].type == "checkbox"  && objRef != inputList[i])
        {
            if (objRef.checked)
            {
                inputList[i].checked=true;
            }
            else
            {
                if(row.rowIndex % 2 == 0)
                {
                   row.style.backgroundColor = "#C2D69B";
                }
                else
                {
                   row.style.backgroundColor = "white";
                }
                inputList[i].checked=false;
            }
        }
    }
}
//-->
</script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <div>
     <asp:GridView ID="gvAll" runat="server" 
    AutoGenerateColumns = "false" Font-Names = "Arial" 
    Font-Size = "11pt" AlternatingRowStyle-BackColor = "#C2D69B"  
    HeaderStyle-BackColor = "green" AllowPaging ="true"   
    OnPageIndexChanging = "OnPaging" PageSize = "10" >
   <Columns>
    <asp:TemplateField>
        <HeaderTemplate>
            <asp:CheckBox ID="chkAll" runat="server" onclick = "checkAll(this);" 
            AutoPostBack = "true"  OnCheckedChanged = "CheckBox_CheckChanged"/>
        </HeaderTemplate> 
        <ItemTemplate>
            <asp:CheckBox ID="chk" runat="server" onclick = "Check_Click(this)" 
            AutoPostBack = "true"  OnCheckedChanged = "CheckBox_CheckChanged" />
        </ItemTemplate>
    </asp:TemplateField> 
    <asp:BoundField DataField = "CustomerID" HeaderText = "Customer ID" 
     HtmlEncode = "false" />
    <asp:BoundField DataField = "ContactName" HeaderText = "Contact Name" 
    HtmlEncode = "false" />
    <asp:BoundField DataField = "City" HeaderText = "City" 
    HtmlEncode = "false" />
   </Columns> 
   <AlternatingRowStyle BackColor="#C2D69B"  />
</asp:GridView> 
            <br />
<asp:GridView ID="gvSelected" runat="server" 
AutoGenerateColumns = "false" Font-Names = "Arial" 
Font-Size = "11pt" AlternatingRowStyle-BackColor = "#C2D69B"  
HeaderStyle-BackColor = "green" EmptyDataText = "No Records Selected"  >
<Columns>
    <asp:BoundField DataField = "CustomerID" HeaderText = "Customer ID" />
    <asp:BoundField DataField = "ContactName" HeaderText = "Contact Name" />
    <asp:BoundField DataField = "City" HeaderText = "City" />
 </Columns>
</asp:GridView>
        </div>
    </form>
</body>
</html>
