<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Rating.aspx.cs" Inherits="Rating" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
     <link rel="stylesheet" href="css/lightbox.css" type="text/css" />

    <script type="text/javascript" src="js/rating.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div align="left" style="float: left; width: 76%;" id="divExpert">
           <%-- <img onclick="InsertUserRating_ServiceConsultant(1);" border="0" src="Pictures/star_iv.gif" />
            <img  onclick="InsertUserRating_ServiceConsultant(2);" border="0" src="Pictures/star_iv.gif" />
            <img  onclick="InsertUserRating_ServiceConsultant(3);" border="0" src="Pictures/star_iv.gif" />--%>
            
            
             <img  onclick="InsertUserRating_ServiceConsultant(1);" border="0" src="Pictures/star_i.gif" />
            <img  onclick="InsertUserRating_ServiceConsultant(2);" border="0" src="Pictures/star_i.gif" />
            <img  onclick="InsertUserRating_ServiceConsultant(3);" border="0" src="Pictures/star_i.gif" />
            <img  onclick="InsertUserRating_ServiceConsultant(4);" border="0" src="Pictures/star_i.gif" />
            <img  onclick="InsertUserRating_ServiceConsultant(5);" border="0" src="Pictures/star_i.gif" />
            </div>
                <input type="hidden" id="hdexpert_id" runat="server" value="1" />    
   
    </div>
    
    
    <a class="lbOn" href="pwdStength.aspx">Click here to view the answer</a>
    </form>
    
    <script type="text/javascript" src="js/prototype.js"></script>

    <script type="text/javascript" src="js/lightbox.js"></script>


</body>
</html>
