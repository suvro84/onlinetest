<%@ Page Language="C#" AutoEventWireup="true" CodeFile="pwdstrength1.aspx.cs" Inherits="pwdstrength1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html> 
<head> 
    <title>Javascript Password Strength Validator</title> 
</head> 
 
<body> 
 
<h1>Javascript Password Strength Validation</h1> 
 
<script type="text/javascript" src="js/password.js"></script> 
 
<table> 
<tr> 
<td>Password:</td> 
<td><input type="text" onKeyUp="checkPassword(this.value)"/></td> 
<td> 
<div style="border: 1px solid gray; width: 100px;"> 
<div id="progressBar" 
     style="font-size: 1px; height: 20px; width: 0px; border: 1px solid white;"> 
</div> 
</div> 
</td> 
</tr> 
</table> 
 
</body> 
</html> 


