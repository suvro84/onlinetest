<%@ Page Language="C#" AutoEventWireup="true" CodeFile="exam.aspx.cs" Inherits="exam" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>

    <script language="javascript" type="text/javascript" src="js/myscript.js"></script>

</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table>
            <tr>
                <td>
                    <span id="quesno" runat="server" />
                </td>
                <td>
                    <asp:Label ID="lblques" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    <input type="radio" name="gr" id="rb1" runat="server" width="72px" />
                    <span id="rbs1" runat="server" />
                </td>
                </td><td>
                    <input type="radio" name="gr" id="rb2" runat="server" />
                    <span id="rbs2" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    <input type="radio" name="gr" id="rb3" runat="server" />
                    <span id="rbs3" runat="server" />
                </td>
                <td>
                    <input type="radio" name="gr" id="rb4" runat="server" />
                    <span id="rbs4" runat="server" />
                </td>
            </tr>
            <%--
				<asp:Label id="lblques_no" runat="server"></asp:Label>--%>
        </table>
        <br />
        <asp:Label ID="lblerror" runat="server" Width="72px" ForeColor="Red" /><input id="Button1"
            type="button" value="NEXT" onclick="javascript:nextques();" />
        <input type="hidden" id="ans" runat="server" />
        <input type="hidden" id="score" runat="server" />
        <input type="hidden" id="hdTotQues" runat="server" />
    </form>

    <script language="javascript" type="text/javascript">
		settimer();
    </script>

</body>
</html>
