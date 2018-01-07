<%@ Page Language="C#" AutoEventWireup="true" CodeFile="repeaterdemo.aspx.cs" Inherits="repeaterdemo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    		<script language="javascript" type="text/javascript" src="js/myscript.js"></script>

</head>
<body>
  <form id="form1" runat="server">
    <div>
    QUESTION SET:-
				<asp:Repeater ID="myrepeater" Runat="server">
					<ItemTemplate>
						<b></b><div style="text-align:right">Question No:<%# DataBinder.Eval(Container.DataItem,"ques_no")%></div><br/></b><hr/>
						Option 1 : <input type="checkbox" name="gr_<%# DataBinder.Eval(Container.DataItem,"ques_no")%>"name="gr_<%# DataBinder.Eval(Container.DataItem,"ques_no")%>" id="chk_<%# DataBinder.Eval(Container.DataItem,"ans1")%>" value="<%# DataBinder.Eval(Container.DataItem,"ans1")%>"><%# DataBinder.Eval(Container.DataItem,"ans1")%><br/>
						Option 2 : <input type="checkbox" name="gr_<%# DataBinder.Eval(Container.DataItem,"ques_no")%>" id="chk_<%# DataBinder.Eval(Container.DataItem,"ans2")%>" value="<%# DataBinder.Eval(Container.DataItem,"ans2")%>"><%# DataBinder.Eval(Container.DataItem,"ans2")%><br/>
						Option 3 : <input type="checkbox" name="gr_<%# DataBinder.Eval(Container.DataItem,"ques_no")%>" id="chk_<%# DataBinder.Eval(Container.DataItem,"ans3")%>" value="<%# DataBinder.Eval(Container.DataItem,"ans3")%>"><%# DataBinder.Eval(Container.DataItem,"ans3")%><br/>
						Option 4 : <input type="checkbox" name="gr_<%# DataBinder.Eval(Container.DataItem,"ques_no")%>" id="chk_<%# DataBinder.Eval(Container.DataItem,"ans4")%>" value="<%# DataBinder.Eval(Container.DataItem,"ans4")%>"><%# DataBinder.Eval(Container.DataItem,"ans4")%><br/>
					<input type="button" id="but" onclick="javascript:checkstat();" value="<%# DataBinder.Eval(Container.DataItem,"ques_no")%>"/>
				</ItemTemplate>
				</asp:Repeater>
				<span id="chklst"></span>
    </div>
    </form>
</body>
</html>
