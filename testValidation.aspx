<%@ Page Language="C#" AutoEventWireup="true" CodeFile="testValidation.aspx.cs" Inherits="testValidation" %>

<%@ Register Src="UC.ascx" TagName="UC" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>

    <script type="text/javascript">
        function funPagination(id) {
            document.getElementById("hdPageNo").value = id;
            var prev = parseInt(id) - 1;
            var next = parseInt(id) + 1;
            var count = parseInt(document.getElementById("hdTot").value);
            for (var i = 1; i <= count; i++) {
                if (id == i) {
                    document.getElementById("sp" + i).style.display = "block";
                }
                else {
                    document.getElementById("sp" + i).style.display = "none";
                }
            }
            if (id != count) {
                document.getElementById("spNext").innerHTML = "<a href=\"javascript:funPagination(" + next + ");\"><span style='display:block' id=\"spNext\">Next</span></a>";
            }
            else {
                document.getElementById("spNext").innerHTML = "<span style='display:block' id=\"spNext\">Next</span>";
            }
            if (id == "1") {
                document.getElementById("spPrevious").innerHTML = "<span style='display:block' id=\"spPrevious\">Previous</span>";
            }
            else {
                document.getElementById("spPrevious").innerHTML = "<a href=\"javascript:funPagination(" + prev + ");\"><span style='display:block' id=\"spPrevious\">Previous</span></a>";
            }
        }
        function funMakeFocus(controlId) {
            document.getElementById(controlId).focus();
            if (controlId == "rb") {
                var rb = document.getElementsByName(controlId);
                var cnt = 0;
                for (var i = 0; i < rb.length; i++) {
                    if (rb[i].checked == true) {
                        cnt++;
                    }
                }
                // alert(cnt);
                if (cnt < 1) {
                    alert("Please select .");
                    return false;
                }
                else {
                    return true;
                }
            }
        }
    </script>

    <style type="text/css">
        #dvUc
        {
            width: 1010px;
        }
        SPAN.float
        {
            float: left;
            position: static;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td colspan="2">
                    <div id="dvUc" runat="server">
                        <uc1:UC ID="UC1" runat="server" />
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    Name
                </td>
                <td>
                    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    City <span id="spP"></span>
                </td>
                <td>
                    <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
                    <%--<span style="display:none"></span>--%>
                </td>
            </tr>
            <tr>
                <td>
                    Phone <span id="Span1"></span>
                </td>
                <td>
                    <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
                    <%--<span style="display:none"></span>--%>
                </td>
            </tr>
            <tr>
                <td>
                    Select Status
                </td>
                <td>
                    <%--<span>prev</span> <span>nex</span>--%>
                    <input id="cbStatus" type="checkbox" />
                </td>
            </tr>
            <tr>
                <td>
                    Select
                </td>
                <td>
                    <%--<span>prev</span> <span>nex</span>--%>
                    <input id="rbMale" name="rb" type="radio" runat="server" />
                    <input id="rbFemale" name="rb" type="radio" runat="server" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="btnSubmit" runat="server" Text="Button" OnClick="btnSubmit_Click" />
                </td>
            </tr>
        </table>
    </div>
    <input type="hidden" id="hdPageNo" runat="server" />
    <input type="hidden" id="hdTot" runat="server" />
    
    <input type="hidden" id="rb" runat="server" />
    </form>
</body>
</html>
