<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SelectAndDeselectUsingCtrl.aspx.cs"
    Inherits="SelectAndDeselectUsingCtrl" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="js/modaPopUps/SyntaxHighlighter.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="js/modaPopUps/shCore.js" language="javascript"></script>

    <script type="text/javascript" src="js/modaPopUps/shBrushJScript.js" language="javascript"></script>

    <script type="text/javascript" src="js/modaPopUps/ModalPopups.js" language="javascript"></script>
    <script type="text/javascript" src="JS/ContextMenu.js"></script>

    <script type="text/javascript">
        //    function modalWin() {
        //if (window.showModalDialog) {
        //window.showModalDialog("DownloadReports.aspx","name","dialogWidth:255px;dialogHeight:250px");
        //} else {
        ////window.open('DownloadReports.aspx','name','height=255,width=250,toolbar=no,directories=no,status=no,continued from previous linemenubar=no,scrollbars=no,resizable=no ,modal=yes');
        //var theWin = window.open('DownloadReports.aspx', 'theWin', 'width=400, height=120, location=no, status=no, scrollbar=no');
        //theWin.moveTo(300, 300);
        //theWin.focus();


        //theWin.focus();


        //}
        //}
        function ModalPopupsAlert99() {
            // alert(document.getElementById('<%=hidSelectedRow.ClientID%>').value);
            //alert(document.getElementById('<%=hdTotalValueSelected.ClientID%>').value / 2);
            var count = '';
            var intcount = 0;
            var GetValue = new Array();
            GetValue = document.getElementById('<%=hidSelectedRow.ClientID%>').value.split(",");
            //  alert(GetValue[0]);
            if (document.getElementById('<%=hidSelectedRow.ClientID%>').value != "") {
                for (var i = 0; i < GetValue.length; i++) {
                    intcount++;

                }
            }
            // alert(intcount);
            //            if (document.getElementById('<%=hdTotalValueSelected.ClientID%>').value / 2 == '1.5') {
            //                 count= 1;
            //                alert('x');
            //            }
            //            else {

            //                count = document.getElementById('<%=hdTotalValueSelected.ClientID%>').value / 2; 
            //            
            //            }
            if (intcount == 0) {
                alert('Please select');
                return false;
            }
            else {


                ModalPopups.Alert("jsAlert99",
        "Download",
        "", {
            okButtonText: "Close",
            loadTextFile: "DownloadReports.aspx?SelectedIds=" + document.getElementById('<%=hidSelectedRow.ClientID%>').value + '&count=' + intcount,
            width: 500,
            height: 300
        });
                return true;
            }
        }

    </script>

</head>
<body >
    <form id="form1" runat="server">
    <div>
        <a onclick="javascript:return ModalPopupsAlert99();" href="#">Download</a>
        <asp:GridView ID="gvDept" runat="server" AutoGenerateColumns="False" CellPadding="5"
            Font-Name="verdana" Font-Size="10pt" onselectstart="return false;" BorderStyle="Solid"
            OnRowDataBound="gvDept_RowDataBound" DataKeyNames="emp_id">
            <RowStyle BackColor="#99CCFF" />
            <Columns>
                <asp:BoundField DataField="emp_id" HeaderText="emp_id" ItemStyle-VerticalAlign="Top"
                    ItemStyle-Width="120px" />
                <asp:BoundField DataField="package_name" HeaderText="package_name" ItemStyle-VerticalAlign="Top"
                    ItemStyle-Width="120px" />
            </Columns>
            <HeaderStyle HorizontalAlign="Left" BackColor="#003366" ForeColor="#ffffff" Font-Bold="true"
                Font-Size=".75em" />
        </asp:GridView>
        <asp:HiddenField ID="hidCellId" runat="server" />
        <asp:HiddenField ID="hidSelectedRow" runat="server" />
        <asp:HiddenField ID="hidIsSelected" runat="server" />
        <asp:HiddenField ID="hdTotalValueSelected" runat="server" />
        
        <input type="hidden" id="hdFromValue" runat="server" />
            <input type="hidden" id="hdToValue" runat="server" />
            
            
       
         
        <asp:GridView ID="gvDestDept" runat="server" AutoGenerateColumns="False" CellPadding="5"
            Font-Name="verdana" Font-Size="10pt" onselectstart="return false;" BorderStyle="Solid">
            <RowStyle BackColor="#99CCFF" />
            <Columns>
                <asp:BoundField DataField="emp_id" HeaderText="emp_id" ItemStyle-VerticalAlign="Top"
                    ItemStyle-Width="120px" />
                <asp:BoundField DataField="package_name" HeaderText="package_name" ItemStyle-VerticalAlign="Top"
                    ItemStyle-Width="120px" />
            </Columns>
            <HeaderStyle HorizontalAlign="Left" BackColor="#003366" ForeColor="#ffffff" Font-Bold="true"
                Font-Size=".75em" />
        </asp:GridView>
    </div>
    <asp:Button ID="btnCopy" runat="server" OnClientClick="return IsRowSelected();" Text="Copy"
        OnClick="btnCopy_Click" />
    <asp:Label ID="lbl" runat="server" Text="Ctrl + Click to select multiple rows." />
    </form>
</body>
</html>

<script language="javascript" type="text/javascript">

    function FillColor(cellid, id, evt) {
        if (evt.shiftKey) {

            var clearCellColor = document.getElementById('hidCellId').value.split(',');
            for (i = 0; i < clearCellColor.length; i++) {
                //alert(document.getElementById(clearCellColor[i]));
                document.getElementById(clearCellColor[i]).bgColor = "#99CCFF";
                document.getElementById(clearCellColor[i]).style.color = "Black";

            }
            if (document.getElementById('hdToValue').value != "") {
                document.getElementById('hdFromValue').value = document.getElementById('hdToValue').value
                document.getElementById('hdToValue').value = cellid;
            }

            else {
                document.getElementById('hdFromValue').value = cellid;
                document.getElementById('hdToValue').value = cellid;

           }
            // alert("from value:" + document.getElementById('hdFromValue').value);
          //  alert("to value:" + document.getElementById('hdToValue').value);
            var GetValue = new Array();
            GetValue = document.getElementById('hdFromValue').value.split("_");
            var from = GetValue[1].toString().substring(GetValue[1].toString().indexOf("l") + 1, GetValue[1].length);
            alert("from:" + from);
           // alert("To value:" + document.getElementById('hdToValue').value);
          
            GetValue = document.getElementById('hdToValue').value.split("_");
            var To = GetValue[1].toString().substring(GetValue[1].toString().indexOf("l") + 1, GetValue[1].length);
              alert("To:" + To);
            document.getElementById("gvDept_ctl" + from + "_ctl00").bgColor = "#800000";
            document.getElementById("gvDept_ctl" + from + "_ctl00").style.color = "Black";
            document.getElementById("gvDept_ctl" + from + "_ctl01").bgColor = "#800000";
            document.getElementById("gvDept_ctl" + from + "_ctl01").style.color = "Black";
            //alert(document.getElementById("gvDept_ctl" + from + "_ctl00").innerHTML);
            document.getElementById('<%=hidSelectedRow.ClientID%>').value = document.getElementById("gvDept_ctl" + from + "_ctl00").innerHTML;

            //  clearCells();
            var start = "";
            var end = ""
            if (from > To) {
                alert('hi');
                //                from = To;
                //                To = from;

                start = To;
                end = from;
                alert("from:" + from);
                alert("To:" + To);
            }
            else {
                start = from;
                end = To;
           
            }

            for (i = parseInt(start) + 1; i <= end; i++) {
           
              if (i < 10) {
                  document.getElementById("gvDept_ctl0" + i + "_ctl00").bgColor = "#800000";
                  document.getElementById("gvDept_ctl0" + i + "_ctl00").style.color = "Black";
                  document.getElementById("gvDept_ctl0" + i + "_ctl01").bgColor = "#800000";
                  document.getElementById("gvDept_ctl0" + i + "_ctl01").style.color = "Black";
                  document.getElementById('<%=hidSelectedRow.ClientID%>').value = document.getElementById('<%=hidSelectedRow.ClientID%>').value + ',' + document.getElementById("gvDept_ctl0" + i + "_ctl00").innerHTML;
                 
                  
                } else {
                document.getElementById("gvDept_ctl" + i + "_ctl00").bgColor = "#800000";
                document.getElementById("gvDept_ctl" + i + "_ctl00").style.color = "Black";
                document.getElementById("gvDept_ctl" + i + "_ctl01").bgColor = "#800000";
                document.getElementById("gvDept_ctl" + i + "_ctl01").style.color = "Black";
                document.getElementById('<%=hidSelectedRow.ClientID%>').value = document.getElementById('<%=hidSelectedRow.ClientID%>').value + ',' + document.getElementById("gvDept_ctl" + i + "_ctl00").innerHTML;

                }
            }

            alert(document.getElementById('<%=hidSelectedRow.ClientID%>').value );

            
        }


        else
        {
            //document.getElementById('<%=hdTotalValueSelected.ClientID%>').value = '';
            document.getElementById('<%=hidSelectedRow.ClientID%>').value = '';
        var isSelected = document.getElementById('<%=hidSelectedRow.ClientID%>');
        if (!evt) var evt = window.event;
        ctrlPressed = evt.ctrlKey;
        // alert(document.getElementById('hidCellId').value);



//        var clearCellColor = document.getElementById('hidCellId').value.split(',');
//        for (i = 0; i < clearCellColor.length; i++) {
//            //alert(document.getElementById(clearCellColor[i]));
//            document.getElementById(clearCellColor[i]).bgColor = "#99CCFF";
//            document.getElementById(clearCellColor[i]).style.color = "Black";

//        }
        if (!ctrlPressed) {
           var clearCellColor = document.getElementById('hidCellId').value.split(',');
            //  alert(clearCellColor.length);

            for (i = 0; i < clearCellColor.length; i++) {
                //alert(document.getElementById(clearCellColor[i]));
                document.getElementById(clearCellColor[i]).bgColor = "#99CCFF";
                document.getElementById(clearCellColor[i]).style.color = "Black";
                document.getElementById('<%=hdTotalValueSelected.ClientID%>').value = 1;
            }
            isSelected.value = '';
        }
        var cellNo = cellid.split('_');
        var clearCellColor = document.getElementById('hidCellId').value.split(',');
        if (document.getElementById('<%=hidIsSelected.ClientID%>').value != cellNo[1]) {
            //alert('hi');
            SetColor(clearCellColor, cellNo, id);
            document.getElementById('<%=hidIsSelected.ClientID%>').value = cellNo[1];
        }
        else {
            //alert('ho');
            SetColor(clearCellColor, cellNo, id);
        }
    }

    function SetColor(clearCellColor, cellNo, id) {
        var selectcellNo;
        var counter = 0;
        for (i = 0; i < clearCellColor.length; i++) {
            selectcellNo = clearCellColor[i].split('_');
            var objCell = document.getElementById(clearCellColor[i]);
            if (cellNo[1] == selectcellNo[1]) {

                if (objCell.bgColor == "#800000") {
                    //alert(objCell.bgColor);
                    objCell.bgColor = "#99CCFF";
                    objCell.style.color = "Black";
                    counter++;
                    if (counter < 2) {
                        IdtoRemove(id);
                    }

                    document.getElementById('<%=hdTotalValueSelected.ClientID%>').value--;

                }
                else {
                    objCell.bgColor = "#800000";
                    objCell.style.color = "White";
                    IdtoCopy(id);
                    //  alert('hi');
                    document.getElementById('<%=hdTotalValueSelected.ClientID%>').value++;
                }
            }
        }
    }
    }


    function IdtoCopy(id) {
        // alert(id);
        //document.getElementById('<%=hdTotalValueSelected.ClientID%>').value = '0';
        //document.getElementById('<%=hidSelectedRow.ClientID%>').value++;
        //document.getElementById('<%=hdTotalValueSelected.ClientID%>').value =parseInt(document.getElementById('<%=hdTotalValueSelected.ClientID%>').value)+1;


        var isSelected = document.getElementById('<%=hidSelectedRow.ClientID%>');
        var selected = isSelected.value.split(',');
        //alert(selected.length);

        var copyflag;
        for (j = 0; j < selected.length; j++) {
            if (selected[j] == id) {
                copyflag = true;

                break;
            }
        }
        if (!copyflag) {
            if (isSelected.value == '') {
                isSelected.value = id;
                //document.getElementById('<%=hdTotalValueSelected.ClientID%>').value++;
            }
            else {
                isSelected.value = isSelected.value + ',' + id;
                //alert(isSelected.value);
                // document.getElementById('<%=hidSelectedRow.ClientID%>').value ++;


            }
        }

        // alert(document.getElementById('<%=hidSelectedRow.ClientID%>').value);

    }


    function IdtoRemove(id) {

        var isSelected = document.getElementById('<%=hidSelectedRow.ClientID%>');
        //alert(isSelected.value);
        var selected = isSelected.value.split(','); //alert(selected); 
        var copyflag;
        var arrExistProd = new Array();
        for (j = 0; j < selected.length; j++) {

            if (selected[j] != id) {
                // alert(selected[j]);
                arrExistProd.push(selected[j]);
                //selected[j] = "";
                //break;
                // alert('hi');
            }
        }
        isSelected.value = '';
        // alert('length:'+arrExistProd.length);
        for (var k = 0; k < arrExistProd.length; k++) {
            //alert(arrExistProd[k]);
            isSelected.value += arrExistProd[k] + ',';
        }
        isSelected.value = isSelected.value.substring(0, isSelected.value.length - 1);
        //   alert(isSelected.value);













    }

    function IsRowSelected() {
        if (document.getElementById('<%=hidSelectedRow.ClientID%>').value == '') {
            alert('Nothing to copy');
            return false;
        }
    }

    function clearCells() {
        //get reference of GridView control
        var grid = document.getElementById("<%= gvDept.ClientID %>");
        //variable to contain the cell of the grid
        var cell;

        if (grid.rows.length > 0) {
            //loop starts from 1. rows[0] points to the header.
            for (i = 1; i < grid.rows.length; i++) {
                //get the reference of first column
                cell = grid.rows[i].cells[i];

                //loop according to the number of childNodes in the cell
                for (j = 0; j < cell.childNodes.length; j++) {

                    cell.childNodes[j].bgColor = "#99CCFF";
                    cell.childNodes[j].style.color = "Black";
                    
                   
                }
            }
        }
    }
    function SelectAll(id) {
        //get reference of GridView control
        var grid = document.getElementById("<%= gvDept.ClientID %>");
        //variable to contain the cell of the grid
        var cell;

        if (grid.rows.length > 0) {
            //loop starts from 1. rows[0] points to the header.
            for (i = 1; i < grid.rows.length; i++) {
                //get the reference of first column
                cell = grid.rows[i].cells[0];

                //loop according to the number of childNodes in the cell
                for (j = 0; j < cell.childNodes.length; j++) {
                    //if childNode type is CheckBox                 
                    if (cell.childNodes[j].type == "checkbox") {
                        //assign the status of the Select All checkbox to the cell checkbox within the grid
                        cell.childNodes[j].checked = document.getElementById(id).checked;
                    }
                }
            }
        }
    }



</script>


<script type="text/javascript">

    $(function() {



    $('#<%=gvDept.ClientID%> tr[id]').click(function() {

            $('#<%=gvDept.ClientID%> tr[id]').css({ "background-color": "White", "color": "Black" });

            $(this).css({ "background-color": "Black", "color": "White" });

            $('#<%=hidSelectedRow.ClientID%>').val($(this).attr("id"));

        });



        $('#<%=gvDept.ClientID%> tr[id]').mouseover(function() {

            $(this).css({ cursor: "hand", cursor: "pointer" });

        });



    });

</script>
<script type="text/javascript">
    var oCustomContextMenu = null;
    var oBase = null;
    window.onload = function() {
        oBase = document.getElementById('div');

        var Arguments = {
            Base: oBase,
            Width: 200,
            FontColor: null,
            HoverFontColor: null,
            HoverBackgroundColor: null,
            HoverBorderColor: null,
            ClickEventListener: OnClick
        };

        oCustomContextMenu = new CustomContextMenu(Arguments);

        oCustomContextMenu.AddItem('Images/ei0019-48.gif', 'Add', false, 'Add');
        oCustomContextMenu.AddItem('Images/save.png', 'Save', true, 'Save');
        oCustomContextMenu.AddSeparatorItem();
        oCustomContextMenu.AddItem('Images/ei0020-48.gif', 'Update', false, 'Update');
        oCustomContextMenu.AddSeparatorItem();
        oCustomContextMenu.AddItem(null, 'Cancel', false, 'Cancel');
    }

    var OnClick = function(Sender, EventArgs) {
        switch (EventArgs.CommandName) {
            case 'Add':
                alert('Text: ' + EventArgs.Text);
                alert('IsDisabled: ' + EventArgs.IsDisabled);
                alert('ImageUrl: ' + EventArgs.ImageUrl);
                break;
            case 'Save':
                alert('Text: ' + EventArgs.Text);
                alert('IsDisabled: ' + EventArgs.IsDisabled);
                alert('ImageUrl: ' + EventArgs.ImageUrl);
                break;
            case 'Update':
                alert('Text: ' + EventArgs.Text);
                alert('IsDisabled: ' + EventArgs.IsDisabled);
                alert('ImageUrl: ' + EventArgs.ImageUrl);
                break;
            case 'Cancel':
                alert('Text: ' + EventArgs.Text);
                alert('IsDisabled: ' + EventArgs.IsDisabled);
                alert('ImageUrl: ' + EventArgs.ImageUrl);
                break;
        }

        oCustomContextMenu.Hide();
    }

    window.onunload = function() { oCustomContextMenu.Dispose(); }
    </script>