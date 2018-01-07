<%@ Page Language="C#" AutoEventWireup="true" CodeFile="end.aspx.cs" Inherits="end" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:Label id="Label1" style="Z-INDEX: 101; LEFT: 200px; POSITION: absolute; TOP: 104px" runat="server"
				Width="272px">Thanks For Completion of The Exams....</asp:Label>
				Your Score is : <span id="score" runat="server"></span>
				<INPUT style="Z-INDEX: 102; LEFT: 216px; POSITION: absolute; TOP: 168px" type="button"
				value="Close Window" onclick="window.close();"/>
    </div>
    </form>
</body>
</html>
