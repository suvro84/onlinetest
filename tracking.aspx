﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="tracking.aspx.cs" Inherits="tracking" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    <a href="EditExpertProfile.aspx">Edit</a>
    
    
    <script type="text/javascript" language="javascript" src="js/rt.js"></script>        
<script>var ip= '<%=Request.UserHostAddress%>'; track(ip,1);</script> 

    </div>
    </form>
</body>
</html>
