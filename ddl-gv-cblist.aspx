<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ddl-gv-cblist.aspx.cs" Inherits="ddl_gv_cblist" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table>
            <tr>
                <td valign="top" style="width: 165px">
                    <asp:PlaceHolder ID="phDDLCHK" runat="server"></asp:PlaceHolder>
                </td>
                <td valign="top">
                    <asp:Button ID="btn" runat="server" Text="Get Checked" OnClick="btn_Click" />
                </td>
                <td valign="top">
                    <asp:Label ID="lblSelectedItem" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
        <asp:HiddenField ID="hidList" runat="server" />
    </div>
    </form>
</body>
</html>

<script language="javascript" type="text/javascript">

    function showdiv() {
        document.getElementById("divChkList").style.display = "block";
    }

    function showdivonClick() {
        var objDLL = document.getElementById("divChkList");
        if (objDLL.style.display == "block")
            objDLL.style.display = "none";
        else {
            objDLL.style.display = "block";
        }
    }
    
    function getSelectedItem(lstValue, lstNo, lstID, ctrlType) {
        var noItemChecked = 0;
        var ddlReport = document.getElementById("ddlChkList");
        var selectedItems = "";
        var arr = document.getElementById("chkLstItem").getElementsByTagName('input');
        var arrlbl = document.getElementById("chkLstItem").getElementsByTagName('label');
        var objLstId = document.getElementById('hidList');
        for (i = 0; i < arr.length; i++) {
            checkbox = arr[i];
            if (i == lstNo) {
                if (ctrlType == 'anchor') {
                    if (!checkbox.checked) {
                        checkbox.checked = true;
                    }
                    else {
                        checkbox.checked = false;
                    }
                }
            }
            if (checkbox.checked) {
                if (selectedItems == "") {
                    selectedItems = arrlbl[i].innerText;
                }
                else {
                    selectedItems = selectedItems + "," + arrlbl[i].innerText;
                }
                noItemChecked = noItemChecked + 1;
            }
        }




        ddlReport.title = selectedItems;
        var Text = ddlReport.options[ddlReport.selectedIndex].text;
        if (noItemChecked == 1)
            ddlReport.options[ddlReport.selectedIndex].text = lstValue;
        else
            ddlReport.options[ddlReport.selectedIndex].text = noItemChecked + " Items";

        document.getElementById('hidList').value = ddlReport.options[ddlReport.selectedIndex].text;
    }


        

    document.onclick = check;
    function check(e) {
        var target = (e && e.target) || (event && event.srcElement);
        var obj = document.getElementById('divChkList');
        var obj1 = document.getElementById('ddlChkList');

        if (target.id != "alst" && !target.id.match("chkLstItem")) {
            if (!(target == obj || target == obj1)) {//  || target == obj2)) {
                obj.style.display = 'none'
            }
            else if (target == obj || target == obj1) {// || target == obj2) {
                if (obj.style.display == 'block') {
                    obj.style.display = 'block';
                }
                else {
                    obj.style.display = 'none';
                    document.getElementById('ddlChkList').blur();
                }
            }
        }
    }

</script>

