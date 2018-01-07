<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CopyMultipleGridViewRowUsingCtrl.aspx.cs"
    Inherits="CopyMultipleGridViewRowUsingCtrl" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body onunload="">
    <form id="form1" runat="server">
    <div>
        <table>
            <tr>
                <td valign="top">
                    <asp:GridView ID="gvDept" runat="server" AutoGenerateColumns="False" CellPadding="5"
                        Font-Name="verdana" Font-Size="10pt" onselectstart="return false;" BorderStyle="Solid"
                        OnRowDataBound="gvDept_RowDataBound" DataKeyNames="emp_id">
                        <RowStyle BackColor="#99CCFF" />
                        <Columns>
                            <%-- <asp:BoundField DataField="emp_id" HeaderText="emp_id Id" ItemStyle-VerticalAlign="Top"
                                ItemStyle-Width="120px" />
                            <asp:BoundField DataField="package_name" HeaderText="package_name" ItemStyle-VerticalAlign="Top"
                                ItemStyle-Width="120px" />--%>
                            <asp:TemplateField HeaderText="emp_id">
                                <ItemTemplate>
                                    <asp:Literal ID="ltemp_id" Text='<%#Eval("emp_id")%>' runat="server"></asp:Literal>
                                </ItemTemplate>
                              
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="package_name">
                                <ItemTemplate>
                                    <%#Eval("package_name")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <HeaderStyle HorizontalAlign="Left" BackColor="#003366" ForeColor="#ffffff" Font-Bold="true"
                            Font-Size=".75em" />
                    </asp:GridView>
                    <asp:HiddenField ID="hidCellId" runat="server" />
                    <asp:HiddenField ID="hidSelectedRow" runat="server" />
                    <asp:HiddenField ID="hidIsSelected" runat="server" />
                </td>
                <td valign="top">
                    <asp:GridView ID="gvDestDept" runat="server" AutoGenerateColumns="False" CellPadding="5"
                        Font-Name="verdana" Font-Size="10pt" onselectstart="return false;" BorderStyle="Solid">
                        <RowStyle BackColor="#99CCFF" />
                        <Columns>
                            <asp:BoundField DataField="emp_id" HeaderText="emp_id Id" ItemStyle-VerticalAlign="Top"
                                ItemStyle-Width="120px" />
                            <asp:BoundField DataField="package_name" HeaderText="package_name" ItemStyle-VerticalAlign="Top"
                                ItemStyle-Width="120px" />
                        </Columns>
                        <HeaderStyle HorizontalAlign="Left" BackColor="#003366" ForeColor="#ffffff" Font-Bold="true"
                            Font-Size=".75em" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="btnCopy" runat="server" OnClientClick="return IsRowSelected();" Text="Copy"
                        OnClick="btnCopy_Click" />
                    <asp:Label ID="lbl" runat="server" Text="Ctrl + Click to select multiple rows." />
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>

<script language="javascript" type="text/javascript">

    function FillColor(cellid, id, evt) {
    
        var isSelected = document.getElementById('<%=hidSelectedRow.ClientID%>');
        alert(cellid);
        if (!evt) var evt = window.event;
        ctrlPressed = evt.ctrlKey;
        if (!ctrlPressed) {
            //alert(ctrlPressed);
            var clearCellColor = document.getElementById('hidCellId').value.split(',');
            for (i = 0; i < clearCellColor.length; i++) {
                document.getElementById(clearCellColor[i]).bgColor = "#99CCFF";
                document.getElementById(clearCellColor[i]).style.color = "Black";
            }
            isSelected.value = '';
        }


        var cellNo = cellid.split('_');
        var selectcellNo;
        var bFlag = false;
        var clearCellColor = document.getElementById('hidCellId').value.split(',');
        alert('hidIsSelected:'+document.getElementById('<%=hidIsSelected.ClientID%>').value);
        alert('cellid:' + cellNo[1]);
//        if (document.getElementById('<%=hidIsSelected.ClientID%>').value != "") 
//        {
//            document.getElementById('<%=hidIsSelected.ClientID%>').value = cellNo[1];
//        }
        if (document.getElementById('<%=hidIsSelected.ClientID%>').value != cellNo[1] ) 
        {
            //   alert('bFlag:'+bFlag);
              bFlag = true;
//            if (bFlag == false) 
//            {
                for (i = 0; i < clearCellColor.length; i++) 
                {

                    selectcellNo = clearCellColor[i].split('_');
                    var objCell = document.getElementById(clearCellColor[i]);
                    //alert('cellNo:'+cellNo[1]);
                    //alert('selectcellNo:'+selectcellNo[1]);
                    if (cellNo[1] == selectcellNo[1])
                     {

                        //bFlag = true;
                        objCell.bgColor = "Maroon";
                        objCell.style.color = "White";
                        //  alert('isSelected.value:' + isSelected.value);
                        //alert('id:' + id);
                        if (!isSelected.value.match(id))
                         {
                             if (isSelected.value == '')
                             {
                                isSelected.value = id; alert('hi');
                                //alert(isSelected.value);
                                //bFlag = true;


                            }
                            else
                             {
                                isSelected.value = isSelected.value + ',' + id;
                                //alert(isSelected.value);
                                // bFlag = false;
                            }

                        }
                        else 
                        {
                            //alert('deselect'); 
                            //bFlag = false;
                        }
                        //                    else if (isSelected.value.match(id) )
                        //                    {

                        //                        alert('hi');
                        //                        //objCell.bgColor = "blue";
                        //                        //objCell.style.color = "White";
                        //                        //alert(isSelected.value);               
                        //                    }
                    }
                    else 
                    {
                        //                     alert('deselect');
                        //                     bFlag = false;

                    }
                }
                document.getElementById('<%=hidIsSelected.ClientID%>').value = cellNo[1];
                alert('hidIsSelected:' + document.getElementById('<%=hidIsSelected.ClientID%>').value);
                //            }
//            else
//             {

//                                     alert('deselect');
//                                    // bFlag = false;
//            
//            }
        }
        else 
        {
            bFlag = false;
           // document.getElementById('<%=hidIsSelected.ClientID%>').value = '';
            isSelected.value = '';
            alert('deselect');
         

            //alert('bFlag:' + bFlag);
            //            if (bFlag == false) 
            //            {
            for (i = 0; i < clearCellColor.length; i++) {

                selectcellNo = clearCellColor[i].split('_');
                var objCell = document.getElementById(clearCellColor[i]);
                //alert('cellNo:'+cellNo[1]);
                //alert('selectcellNo:'+selectcellNo[1]);
                if (cellNo[1] == selectcellNo[1]) {

                    alert('cellNo:'+cellNo[1]);
                    //bFlag = true;
                    objCell.bgColor = "Blue";
                    objCell.style.color = "White";
                    //  alert('isSelected.value:' + isSelected.value);
                    //alert('id:' + id);
                    if (!isSelected.value.match(id)) {
                       // alert('hi');
                        if (isSelected.value == '') {
                            isSelected.value = id;
                           // alert(isSelected.value);
                           // bFlag = true;


                        }
                        else {
                            alert('Remove');
                            isSelected.value = isSelected.value + ',' + id;
                           //alert(isSelected.value);
                            // bFlag = false;
                        }

                    }
                    else {
                        //alert('deselect'); 
                        //bFlag = false;
                    }
                  
                }
                else {
                    //                     alert('deselect');
                    //                     bFlag = false;

                }
            }
            //alert('x');
            //alert(selectcellNo[1]);
            document.getElementById('<%=hidIsSelected.ClientID%>').value = cellNo[1];
            alert('hidIsSelected:' + document.getElementById('<%=hidIsSelected.ClientID%>').value);




//            document.getElementById('<%=hidIsSelected.ClientID%>').value = '';
//            isSelected.value = '';



        }
       
    }


    function IsRowSelected() {
        if (document.getElementById('<%=hidSelectedRow.ClientID%>').value == '') {
            alert('Nothing to copy');
            return false;
        }
    }

</script>

