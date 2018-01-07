<%@ Page Language="C#" AutoEventWireup="true" CodeFile="JqueryModalPopUp.aspx.cs" Inherits="JqueryModalPopUp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        th
        {
            text-align:left;
        }
          body
         {
             font-family:Arial;
             font-size:10pt;
         }
         #divEditBox
         {
             display:none;
             position:absolute;
             left:30%;
             top:30%;
         }
         .highlightRow
         {
            background-color:Yellow;   
         }
         .select
         {
             background-color:#c0c0c0;
         }
    </style>
        <script language="javascript" src="js/jquery-1.4.min.js" type="text/javascript"></script>

</head>
<body>
    <form id="form1" runat="server">
    <div>
    <a id="addLink" href="javascript:void(0)" title="Add">Open PopUp</a>
    <div id="divEditBox">
        <table cellpadding="4" width="600" cellspacing="0" border="0" style="background-color:#efefef;border:1px solid #c0c0c0;">
            <tr style="background-color:#b0b0b0;" valign="top">
                <td style="width: 91%" colspan="3">&nbsp;<label id="lblPopTitle">Modify Record</label></td>
                <td align="right" style="width: 9%;padding-right:10px;">
                    <a id="closeLink"  href="javascript:void(0)" onclick="HideEditBox()" title="Close">Close</a>
                </td>
            </tr>
            <tr>
                <td>Name: </td><td><input type="text" id="txtEditName" />
                </td>                
                <td>Address: </td><td><input type="text" id="txtEditAddress" /></td>
            </tr>
            <tr>
                <td>Phone: </td><td><input type="text" id="txtEditPhone" size="10" /></td>
                <td>City: </td><td><input type="text" id="txtEditCity" size="10" /></td>
            </tr>
            <tr><td colspan="4" align="center">&nbsp;
        <%--    <input type="button" value="Submit" onclick="UpdateInsertData()" />--%>
            <input type="hidden" id="editId" value="0" />
            </td></tr>
        </table>
    </div>
    </div>
    </form>
    <script language="javascript" type="text/javascript">



        
// show edit box when edit link is clicked   


// Hide the edit/insert box
function HideEditBox() {
    $("#divEditBox").slideUp("medium");
}


// show the box when add link is clicked
$(document).ready(function() {

    // when add link will be clicked
    $("#addLink").click(function() {
        $("#divEditBox").slideDown("medium");
        $("#txtEditName").val("");
        $("#txtEditAddress").val("");
        $("#txtEditCity").val("");
        $("#txtEditPhone").val("");
        $("#editId").val("0");
        $("#lblPopTitle").text("Add Record");
    })
})
       
</script>
</body>
</html>
