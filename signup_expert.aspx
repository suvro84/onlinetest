<%@ Page Language="C#" AutoEventWireup="true" CodeFile="signup_expert.aspx.cs" Inherits="signup_expert" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">

    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <title>Money Jugglers</title>

    <script language="javascript" type="text/javascript" src="signup_expert.aspx_files/MJ_JScript.js"></script>

    <script language="javascript" type="text/javascript" src="signup_expert.aspx_files/AjaxJavaScript.js"></script>

    <link href="signup_expert.aspx_files/Homepage.css" type="text/css" rel="stylesheet">

    <script type="text/javascript" src="signup_expert.aspx_files/calendarDateInput.js"></script>

    <style>
        td.calendarDateInput
        {
            letter-spacing: normal;
            line-height: normal;
            font-family: Tahoma,Sans-Serif;
            font-size: 11px;
        }
        select.calendarDateInput
        {
            letter-spacing: .06em;
            font-family: Verdana,Sans-Serif;
            font-size: 11px;
        }
        input.calendarDateInput
        {
            letter-spacing: .06em;
            font-family: Verdana,Sans-Serif;
            font-size: 11px;
        }
    </style>

    <script language="javascript" type="text/javascript">
<!--hide

function newwindow(a)
{
var path='ExpertTerms.aspx?file='+a;
window.open(path, 'jav','width=500, height=400, scrollbars=1, resizable=no,');
}
//-->
    </script>

    <script language="javascript" type="text/javascript">
function ImageChange(alterim,dividimg,text)
{
    var ImagArray = new Array();   
    ImagArray = alterim.split("+"); 
    var vartext = text;

    var TextArray = new Array(); 
    TextArray=text.split("+");
	//alert(TextArray[0]);
	//var index=TextArray[0].indexOf(' ');
	//if(index==-1)
	//{
	//alert(index);
	//}
	

    //document.getElementById(id).innerHTML ="<img id="+id+" onMouseOut=ImageSet('Pictures/Bn-Yel.jpg',this.id) src=" + alterim + " />";
    document.getElementById(dividimg).innerHTML ="<table width='140' border='0' align='center' cellpadding='0' cellspacing='0'>" +
              " <tr> " +
                " <td><div align='center'><img src="+ImagArray[1]+" width='60' height='60'></div></td> " +
              " </tr> " +
              " <tr class='TDHeight'> " +
                " <td>&nbsp;</td> " +
              " </tr> " +
              " <tr> " +
                " <td align='center' onMouseOut=ImageSet('Pictures/Bn-Yel.jpg+"+ImagArray[1]+"','"+dividimg+"','"+TextArray[0]+"+"+TextArray[1]+"') background="+ImagArray[0]+" style='height: 40px'><a href='#' class='BigNav'>"+TextArray[0]+"<br>"+TextArray[1]+"</a></td> " +
              " </tr> " +
            " </table>";
       
}
function ImageSet(alterim1,dividimg,text)
{
    var ImagArray = new Array();   
    ImagArray = alterim1.split("+"); 
     
    var TextArray = new Array(); 
    TextArray=text.split("+");

    //document.getElementById(id1).innerHTML ="<img id="+id1+" onmouseover=ImageChange('Pictures/Bn-Black.jpg',this.id) src=" + alterim1 + " />";
    document.getElementById(dividimg).innerHTML ="<table width='140' border='0' align='center' cellpadding='0' cellspacing='0'>" +
              " <tr> " +
                " <td><div align='center'><img src="+ImagArray[1]+" width='60' height='60'></div></td> " +
              " </tr> " +
              " <tr class='TDHeight'> " +
                " <td>&nbsp;</td> " +
              " </tr> " +
              " <tr> " +
                " <td align='center' onmouseover=ImageChange('Pictures/Bn-Black.jpg+"+ImagArray[1]+"','"+dividimg+"','"+TextArray[0]+"+"+TextArray[1]+"') background="+ImagArray[0]+" style='height: 40px'><a href='#' class='BigNav'>"+TextArray[0]+"<br>"+TextArray[1]+"</a></td> " +
              " </tr> " +
            " </table>";
}
    </script>

    <script>
    function CheckFirst()
    { 
         if(document.getElementById("CheckAgree")!=null)
         {
                   
                   
                    if(document.getElementById("CheckAgree").checked==false)
                    {
                         if(document.getElementById("divBtn")!=null)
                          {
                            document.getElementById("divBtn").style.display="none";
                          }
                     }
                     
                      if(document.getElementById("CheckAgree").checked==true)
                      {
                          if(document.getElementById("divBtn")!=null)
                          {
                            document.getElementById("divBtn").style.display="";
                          }
                      }
        
           }
           
    }
    </script>

    <script language="javascript" type="text/javascript">

function CheckforOtherCity()
{
    var objstate=document.getElementById("ddlCity");
    if(objstate!=null)
    {
        var divOtherStateObj=document.getElementById("divOther");
        if(objstate.value=="0")
        {

           if(divOtherStateObj!=null)
           {
               divOtherStateObj.style.display="block";
           }

        }
        else
        {
           if(divOtherStateObj!=null)
           {
               divOtherStateObj.style.display="none";
           }
        
        } 
   
    }


}

function CheckforOtherState()
{
    var objstate=document.getElementById("ddlState");
    if(objstate!=null)
    {
        var divOtherStateObj=document.getElementById("divOtherStateName");
        if(objstate.value=="0")
        {

           if(divOtherStateObj!=null)
           {
               divOtherStateObj.style.display="block";
           }

        }
        else
        {
           if(divOtherStateObj!=null)
           {
               divOtherStateObj.style.display="none";
           }
        
        } 
   
    }


}

    </script>

    <!-- Start PopUp CSS -->
    <link href="signup_expert.aspx_files/n2CoreLibs-n2v1-57871.css" type="text/css" rel="stylesheet">
    <link href="signup_expert.aspx_files/n2CoreLibs-n2v1-57871.css" type="text/css" rel="stylesheet">
    <link href="signup_expert.aspx_files/Default_Sheet.css" type="text/css" rel="stylesheet">
    <!-- End PopUp CSS -->
    <link href="signup_expert.aspx_files/n2CoreLibs-n2v1-57871.css" type="text/css" rel="stylesheet">
    <link href="signup_expert.aspx_files/Default_Sheet.css" type="text/css" rel="stylesheet">
    <link href="signup_expert.aspx_files/screen1.css" rel="stylesheet" type="text/css">
    <link href="signup_expert.aspx_files/redbox.css" media="screen" rel="stylesheet"
        type="text/css">
    <style type="text/css">
        <!
        -- .style1
        {
            font-family: Verdana, Arial, Helvetica, sans-serif;
            font-size: 11px;
        }
        -- ></style>
</head>
<body>
        <form id="form1" runat="server">
      <table class="LoginPage" align="center" border="0" cellpadding="0" cellspacing="0"
                                        width="98%">
                                        <tbody>
                                            <tr class="TDHeight8">
                                                <td style="height: 10px;">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr class="TDHeight8">
                                                <td style="height: 10px;" align="center">
                                                    <span id="lblError" class="contactus" style="color: Red; font-size: 10pt;"></span>
                                                </td>
                                            </tr>
                                            <tr class="TDHeight8">
                                                <td style="height: 10px;">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="SignupHeader">
                                                    1. Select an ID and password
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                        <tbody>
                                                            <tr>
                                                                <td style="width: 173px; height: 23px;" valign="top">
                                                                    <p class="contactus">
                                                                        User ID <span class="RedStar">*</span></p>
                                                                </td>
                                                                <td style="width: 5px; height: 23px;">
                                                                    &nbsp;
                                                                </td>
                                                                <td style="width: 173px; height: 23px;">
                                                                    <input name="txtUserName" runat="server" id="txtUserName" class="inputSignup" type="text"><br>
                                                                    <span id="RequiredFieldValidator2" class="LoginAlert" style="color: Red; visibility: hidden;">
                                                                        user id can't blank</span> &nbsp;
                                                                </td>
                                                                <td class="LoginAlert" style="height: 23px; width: 201px;" valign="top">
                                                                    <input name="CheckavailableBtn" class="footerNav" value="check availability!" onclick="javascript:return CheckAvailability();"
                                                                        type="button"><br>
                                                                    <div id="divAvailableMsg" style="display: none;" align="left">
                                                                        &nbsp;</div>
                                                                </td>
                                                            </tr>
                                                            <tr class="TDHeight">
                                                                <td colspan="4">
                                                                    &nbsp;
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="height: 3px; width: 173px;">
                                                                    <p class="contactus">
                                                                        Password<span class="RedStar"> *</span></p>
                                                                </td>
                                                                <td style="height: 3px; width: 5px;">
                                                                    &nbsp;
                                                                </td>
                                                                <td style="height: 3px; width: 173px;">
                                                                    <input name="txtPassword" runat="server" id="txtPassword" class="inputSignup" type="password">
                                                                    <div class="AboutMJBody">
                                                                        4 - 10 Characters</div>
                                                                </td>
                                                                <td class="LoginAlert" style="height: 3px; width: 201px;">
                                                                    <span id="RequiredFieldValidator3" style="color: Red; width: 144px; visibility: hidden;">
                                                                        Required field can't blank</span><br>
                                                                    <span id="regexPass" style="color: Red; width: 187px; visibility: hidden;">Password
                                                                        to be 4-10 Characters</span>
                                                                </td>
                                                            </tr>
                                                            <tr class="TDHeight">
                                                                <td colspan="4" style="height: 5px;">
                                                                    &nbsp;
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 173px; height: 8px;">
                                                                    <p class="contactus">
                                                                        Repeat Password <span class="RedStar">*</span></p>
                                                                </td>
                                                                <td style="width: 5px; height: 8px;">
                                                                    &nbsp;
                                                                </td>
                                                                <td style="width: 173px; height: 8px;">
                                                                    <input name="txtConPassword" runat="server" id="txtConPassword" class="inputSignup" type="password">
                                                                </td>
                                                                <td class="LoginAlert" style="width: 201px; height: 8px;">
                                                                    <span id="RequiredFieldValidator4" style="color: Red; visibility: hidden;">Required
                                                                        field can't blank</span><br>
                                                                    <span id="regexConfirmPass" style="color: Red; visibility: hidden;">Confirm Password
                                                                        to be 4-10 Characters</span><br>
                                                                    <span id="CompareValidator1" style="color: Red; visibility: hidden;">Confirm Password
                                                                        does not match.</span>
                                                                </td>
                                                            </tr>
                                                            <tr class="TDHeight">
                                                                <td colspan="4">
                                                                    &nbsp;
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 173px;">
                                                                    &nbsp;
                                                                </td>
                                                                <td style="width: 5px;">
                                                                    &nbsp;
                                                                </td>
                                                                <td style="width: 173px;">
                                                                    &nbsp;
                                                                </td>
                                                                <td style="width: 201px;">
                                                                    &nbsp;
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="4" class="SignupHeader" height="20">
                                                                    2. Tell us about yourself...
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 173px;">
                                                                    &nbsp;
                                                                </td>
                                                                <td style="width: 5px;">
                                                                    &nbsp;
                                                                </td>
                                                                <td style="width: 173px;">
                                                                    &nbsp;
                                                                </td>
                                                                <td style="width: 201px;">
                                                                    &nbsp;
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 173px; height: 24px;">
                                                                    <p class="contactus">
                                                                        Name of the Company <span class="RedStar">*</span></p>
                                                                </td>
                                                                <td style="width: 5px; height: 24px;">
                                                                    &nbsp;
                                                                </td>
                                                                <td style="width: 173px; height: 24px;">
                                                                    <input name="txtCompanyName" runat="server" id="txtCompanyName" class="inputSignup" type="text">
                                                                </td>
                                                                <td class="LoginAlert" style="width: 201px; height: 24px;">
                                                                    <span id="RequiredFieldValidator1" style="color: Red; visibility: hidden;">Required
                                                                        field can't blank</span>
                                                                </td>
                                                            </tr>
                                                            <tr class="TDHeight">
                                                                <td colspan="4">
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 173px; height: 26px;">
                                                                    <p class="contactus">
                                                                        Name of the Expert / Authorised Person <span class="RedStar">*</span></p>
                                                                </td>
                                                                <td style="width: 5px; height: 26px;">
                                                                    &nbsp;
                                                                </td>
                                                                <td style="width: 173px; height: 26px;">
                                                                    <input name="txtExpertName" runat="server" id="txtExpertName" class="inputSignup" type="text">
                                                                </td>
                                                                <td class="LoginAlert" style="width: 201px; height: 26px;">
                                                                    <span id="RequiredFieldValidator5" style="color: Red; visibility: hidden;">Required
                                                                        field can't blank</span>
                                                                </td>
                                                            </tr>
                                                            <tr class="TDHeight">
                                                                <td colspan="4">
                                                                    &nbsp;
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="height: 24px; width: 173px;">
                                                                    <p class="contactus">
                                                                        Email Address <span class="RedStar">*</span></p>
                                                                </td>
                                                                <td style="height: 24px; width: 5px;">
                                                                    &nbsp;
                                                                </td>
                                                                <td style="width: 173px; height: 24px;">
                                                                    <input name="txtEmail" id="txtEmail" class="inputSignup" type="text">
                                                                </td>
                                                                <td class="LoginAlert" style="height: 24px; width: 201px;">
                                                                    <span id="RequiredFieldValidator8" style="color: Red; visibility: hidden;">Required
                                                                        field can't blank</span> <span id="RegularExpressionValidator1" style="color: Red;
                                                                            visibility: hidden;">Incorrect</span>
                                                                </td>
                                                            </tr>
                                                            <tr class="TDHeight">
                                                                <td colspan="4">
                                                                    &nbsp;
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 173px;">
                                                                    <p class="contactus">
                                                                        Address1 <span class="RedStar">*</span></p>
                                                                </td>
                                                                <td style="width: 5px;">
                                                                    &nbsp;
                                                                </td>
                                                                <td style="width: 173px;">
                                                                    <textarea name="txtAddress1" runat="server" runat="server" rows="2" cols="20" id="txtAddress1" class="textareaSignUp"></textarea>
                                                                </td>
                                                                <td class="LoginAlert" style="width: 201px;">
                                                                    <span id="RequiredFieldValidator7" style="color: Red; visibility: hidden;">Required
                                                                        field can't blank</span>
                                                                </td>
                                                            </tr>
                                                            <tr class="TDHeight">
                                                                <td colspan="4">
                                                                    &nbsp;
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 173px;">
                                                                    <p class="contactus">
                                                                        Address 2</p>
                                                                </td>
                                                                <td style="width: 5px;">
                                                                    &nbsp;
                                                                </td>
                                                                <td style="width: 173px;">
                                                                    <textarea name="txtAddress2" runat="server" rows="2" cols="20" id="txtAddress2" class="textareaSignUp"></textarea>
                                                                </td>
                                                                <td class="LoginAlert" style="width: 201px;">
                                                                    &nbsp;
                                                                </td>
                                                            </tr>
                                                            <tr class="TDHeight">
                                                                <td colspan="4">
                                                                    &nbsp;
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="height: 22px; width: 173px;">
                                                                    <p class="contactus">
                                                                        City <span class="RedStar">*</span></p>
                                                                </td>
                                                                <td style="height: 22px; width: 5px;">
                                                                    &nbsp;
                                                                </td>
                                                                <td style="width: 173px; height: 22px;">
                                                                    <select name="ddlCity" id="ddlCity" class="selectSignUp" onchange="javascript:return CheckforOtherCity();">
                                                                        <option value="">Select City</option>
                                                                        <option value="16">Ahmedabad</option>
                                                                        <option value="5">Bangalore</option>
                                                                        <option value="6">Chennai</option>
                                                                        <option value="8">Hyderabad</option>
                                                                        <option value="1">Kolkata</option>
                                                                        <option value="2">Mumbai</option>
                                                                        <option value="3">New Delhi</option>
                                                                        <option value="0">Other City</option>
                                                                    </select>
                                                                </td>
                                                                <td class="LoginAlert" style="height: 22px; width: 201px;">
                                                                    <div id="divOther" style="display: none;">
                                                                        <input name="txtOtherCityName" id="txtOtherCityName" style="width: 153px;" type="text"></div>
                                                                    <span id="RequiredFieldValidator11" style="color: Red; visibility: hidden;">City must
                                                                        be selected.</span>
                                                                </td>
                                                            </tr>
                                                            <tr class="TDHeight">
                                                                <td colspan="4">
                                                                    &nbsp;
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 173px;">
                                                                    <p class="contactus">
                                                                        PIN<span class="RedStar"> *</span></p>
                                                                </td>
                                                                <td style="width: 5px;">
                                                                    &nbsp;
                                                                </td>
                                                                <td style="width: 173px;">
                                                                    <input name="txtPinCode" runat="server" maxlength="10" id="txtPinCode" class="inputSignup" onchange="NumericBox_FindItem('txtPinCode').OnTextChange(this);"
                                                                        onkeypress="return NumericBox_FindItem('txtPinCode').AddNumericItem(event, this);"
                                                                        type="text">
                                                                </td>
                                                                <td class="LoginAlert" style="width: 201px;">
                                                                    <span id="RequiredFieldValidator9" style="color: Red; visibility: hidden;">Required
                                                                        field can't blank</span>
                                                                </td>
                                                            </tr>
                                                            <tr class="TDHeight">
                                                                <td colspan="4">
                                                                    &nbsp;
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 173px;">
                                                                    <p class="contactus">
                                                                        State <span class="RedStar">*</span></p>
                                                                </td>
                                                                <td style="width: 5px;">
                                                                    &nbsp;
                                                                </td>
                                                                <td style="width: 173px;">
                                                                    <select name="ddlState" id="ddlState" class="selectSignUp" onchange="javascript:return CheckforOtherState();">
                                                                        <option value="">Select State</option>
                                                                        <option value="19">Andaman and Nicobar Islands</option>
                                                                        <option value="5">Andhra Pradesh</option>
                                                                        <option value="20">Arunachal Pradesh</option>
                                                                        <option value="21">Assam</option>
                                                                        <option value="22">Bihar</option>
                                                                        <option value="7">Chandigarh</option>
                                                                        <option value="23">Chhattisgarh</option>
                                                                        <option value="25">Dadra and Nagar Haveli</option>
                                                                        <option value="24">Daman and Diu</option>
                                                                        <option value="26">Delhi</option>
                                                                        <option value="27">Goa</option>
                                                                        <option value="6">Gujarat</option>
                                                                        <option value="28">Haryana</option>
                                                                        <option value="29">Himachal Pradesh</option>
                                                                        <option value="31">Jammu and Kashmir</option>
                                                                        <option value="30">Jharkhand</option>
                                                                        <option value="3">Karnataka</option>
                                                                        <option value="32">Kerala</option>
                                                                        <option value="33">Lakshadweep</option>
                                                                        <option value="36">Madhya Pradesh</option>
                                                                        <option value="2">Maharashtra</option>
                                                                        <option value="35">Manipur</option>
                                                                        <option value="34">Meghalaya</option>
                                                                        <option value="37">Mizoram</option>
                                                                        <option value="38">Nagaland</option>
                                                                        <option value="18">New Delhi</option>
                                                                        <option value="39">Orissa</option>
                                                                        <option value="41">Pondicherry</option>
                                                                        <option value="40">Punjab</option>
                                                                        <option value="42">Rajasthan</option>
                                                                        <option value="43">Sikkim</option>
                                                                        <option value="4">Tamil Nadu</option>
                                                                        <option value="44">Tripura</option>
                                                                        <option value="9">Uttar Pradesh</option>
                                                                        <option value="45">Uttaranchal</option>
                                                                        <option value="1">West Bengal</option>
                                                                        <option value="0">Other State</option>
                                                                    </select>
                                                                </td>
                                                                <td class="LoginAlert" style="width: 201px;">
                                                                    <div id="divOtherStateName" style="display: none;">
                                                                        <input name="txtOtherStateName" id="txtOtherStateName" style="width: 153px;" type="text"></div>
                                                                    <span id="RequiredFieldValidator12" style="color: Red; visibility: hidden;">State must
                                                                        be selected.</span>
                                                                </td>
                                                            </tr>
                                                            <tr class="TDHeight">
                                                                <td colspan="4">
                                                                    &nbsp;
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 173px;">
                                                                    <p class="contactus">
                                                                        Country <span class="RedStar">*</span></p>
                                                                </td>
                                                                <td style="width: 5px;">
                                                                    &nbsp;
                                                                </td>
                                                                <td style="width: 173px;">
                                                                    <select name="ddlCountry" id="ddlCountry" class="selectSignUp">
                                                                        <option value="">Select Country</option>
                                                                        <option value="3">Afghanistan</option>
                                                                        <option value="4">Albania</option>
                                                                        <option value="5">Algeria</option>
                                                                        <option value="6">Andorra</option>
                                                                        <option value="7">Angola</option>
                                                                        <option value="8">Anguilla</option>
                                                                        <option value="9">AntiguaandBarbuda</option>
                                                                        <option value="10">Argentina</option>
                                                                        <option value="11">Armenia</option>
                                                                        <option value="12">Aruba</option>
                                                                        <option value="13">Australia</option>
                                                                        <option value="14">Austria</option>
                                                                        <option value="15">Azerbaijan</option>
                                                                        <option value="16">Bahamas</option>
                                                                        <option value="17">Bahrain</option>
                                                                        <option value="18">Bangladesh</option>
                                                                        <option value="19">Barbados</option>
                                                                        <option value="20">Belarus</option>
                                                                        <option value="21">Belgium</option>
                                                                        <option value="22">Belize</option>
                                                                        <option value="23">Benin</option>
                                                                        <option value="24">Bermuda</option>
                                                                        <option value="25">Bhutan</option>
                                                                        <option value="26">Bolivia</option>
                                                                        <option value="27">BosniaandHerzegovina</option>
                                                                        <option value="28">Botswana</option>
                                                                        <option value="29">BouvetIsland</option>
                                                                        <option value="30">Brazil</option>
                                                                        <option value="31">BritishIndianOceanTerritory</option>
                                                                        <option value="32">Brunei</option>
                                                                        <option value="33">Bulgaria</option>
                                                                        <option value="34">BurkinaFaso</option>
                                                                        <option value="35">Burundi</option>
                                                                        <option value="36">Cambodia</option>
                                                                        <option value="37">Cameroon</option>
                                                                        <option value="38">Canada</option>
                                                                        <option value="39">CapeVerde</option>
                                                                        <option value="40">CaymanIslands</option>
                                                                        <option value="41">CentralAfricanRepublic</option>
                                                                        <option value="42">Chad</option>
                                                                        <option value="43">Chile</option>
                                                                        <option value="44">China</option>
                                                                        <option value="45">ChristmasIsland</option>
                                                                        <option value="46">Cocos(Keeling)Islands</option>
                                                                        <option value="47">Colombia</option>
                                                                        <option value="48">Comoros</option>
                                                                        <option value="49">Congo</option>
                                                                        <option value="50">CookIslands</option>
                                                                        <option value="51">CostaRica</option>
                                                                        <option value="52">CoteDIvoire(IvoryCoast)</option>
                                                                        <option value="53">Croatia(Hrvatska)</option>
                                                                        <option value="54">Cuba</option>
                                                                        <option value="55">Cyprus</option>
                                                                        <option value="56">CzechRepublic</option>
                                                                        <option value="57">DemRepofCongo(Zaire)</option>
                                                                        <option value="58">Denmark</option>
                                                                        <option value="59">Djibouti</option>
                                                                        <option value="60">Dominica</option>
                                                                        <option value="61">DominicanRepublic</option>
                                                                        <option value="62">EastTimor</option>
                                                                        <option value="63">Ecuador</option>
                                                                        <option value="64">Egypt</option>
                                                                        <option value="65">ElSalvador</option>
                                                                        <option value="66">EquatorialGuinea</option>
                                                                        <option value="67">Eritrea</option>
                                                                        <option value="68">Estonia</option>
                                                                        <option value="69">Ethiopia</option>
                                                                        <option value="70">FalklandIslands(Malvinas)</option>
                                                                        <option value="71">FaroeIslands</option>
                                                                        <option value="72">Fiji</option>
                                                                        <option value="73">Finland</option>
                                                                        <option value="74">France</option>
                                                                        <option value="75">FrenchGuiana</option>
                                                                        <option value="76">FrenchPolynesia</option>
                                                                        <option value="77">FrenchSouthernTerritories</option>
                                                                        <option value="78">Gabon</option>
                                                                        <option value="80">Gambia</option>
                                                                        <option value="81">Georgia</option>
                                                                        <option value="82">Germany</option>
                                                                        <option value="83">Ghana</option>
                                                                        <option value="84">Gibraltar</option>
                                                                        <option value="79">GreatBritain</option>
                                                                        <option value="85">Greece</option>
                                                                        <option value="86">Greenland</option>
                                                                        <option value="87">Grenada</option>
                                                                        <option value="88">Guadeloupe</option>
                                                                        <option value="89">Guatemala</option>
                                                                        <option value="90">Guinea</option>
                                                                        <option value="91">Guinea-Bissau</option>
                                                                        <option value="92">Guyana</option>
                                                                        <option value="93">Haiti</option>
                                                                        <option value="94">HeardandMcDonaldIslands</option>
                                                                        <option value="95">Holland-Netherlands</option>
                                                                        <option value="96">Honduras</option>
                                                                        <option value="97">HongKong</option>
                                                                        <option value="98">Hungary</option>
                                                                        <option value="99">Iceland</option>
                                                                        <option selected="selected" value="1">India</option>
                                                                        <option value="100">Indonesia</option>
                                                                        <option value="101">Iran</option>
                                                                        <option value="102">Iraq</option>
                                                                        <option value="103">Ireland</option>
                                                                        <option value="104">Israel</option>
                                                                        <option value="105">Italy</option>
                                                                        <option value="106">Jamaica</option>
                                                                        <option value="107">Japan</option>
                                                                        <option value="108">Jordan</option>
                                                                        <option value="109">Kazakhstan</option>
                                                                        <option value="110">Kenya</option>
                                                                        <option value="111">Kiribati</option>
                                                                        <option value="112">Kuwait</option>
                                                                        <option value="113">Kyrgyzstan</option>
                                                                        <option value="114">Lao</option>
                                                                        <option value="115">Laos</option>
                                                                        <option value="116">Latvia</option>
                                                                        <option value="117">Lebanon</option>
                                                                        <option value="118">Lesotho</option>
                                                                        <option value="119">Liberia</option>
                                                                        <option value="120">Libya</option>
                                                                        <option value="121">Liechtenstein</option>
                                                                        <option value="122">Lithuania</option>
                                                                        <option value="123">Luxembourg</option>
                                                                        <option value="124">Macao</option>
                                                                        <option value="125">Macedonia</option>
                                                                        <option value="126">Madagascar</option>
                                                                        <option value="127">Malawi</option>
                                                                        <option value="128">Malaysia</option>
                                                                        <option value="129">Maldives</option>
                                                                        <option value="130">Mali</option>
                                                                        <option value="131">Malta</option>
                                                                        <option value="132">Martinique</option>
                                                                        <option value="133">Mauritania</option>
                                                                        <option value="134">Mauritius</option>
                                                                        <option value="135">Mayotte</option>
                                                                        <option value="136">Mexico</option>
                                                                        <option value="137">Moldova</option>
                                                                        <option value="138">Monaco</option>
                                                                        <option value="139">Mongolia</option>
                                                                        <option value="140">Montserrat</option>
                                                                        <option value="141">Morocco</option>
                                                                        <option value="142">Mozambique</option>
                                                                        <option value="143">Myanmar</option>
                                                                        <option value="144">Namibia</option>
                                                                        <option value="145">Nauru</option>
                                                                        <option value="146">Nepal</option>
                                                                        <option value="147">Netherlands</option>
                                                                        <option value="148">NetherlandsAntilles</option>
                                                                        <option value="149">NewCaledonia</option>
                                                                        <option value="150">NewZealand</option>
                                                                        <option value="151">Nicaragua</option>
                                                                        <option value="152">Niger</option>
                                                                        <option value="153">Nigeria</option>
                                                                        <option value="154">Niue</option>
                                                                        <option value="155">NorfolkIsland</option>
                                                                        <option value="156">NorthKorea</option>
                                                                        <option value="157">Norway</option>
                                                                        <option value="158">Oman</option>
                                                                        <option value="159">Pakistan</option>
                                                                        <option value="160">Palau</option>
                                                                        <option value="161">Panama</option>
                                                                        <option value="162">PapuaNewGuinea</option>
                                                                        <option value="163">Paraguay</option>
                                                                        <option value="164">Peru</option>
                                                                        <option value="165">Philippines</option>
                                                                        <option value="166">Pitcairn</option>
                                                                        <option value="167">Poland</option>
                                                                        <option value="168">Portugal</option>
                                                                        <option value="169">Qatar</option>
                                                                        <option value="170">Reunion</option>
                                                                        <option value="171">Romania</option>
                                                                        <option value="172">Russia</option>
                                                                        <option value="173">Rwanda</option>
                                                                        <option value="174">SaintKittsandNevis</option>
                                                                        <option value="175">SaintLucia</option>
                                                                        <option value="176">SaintVincentandTheGrenadines</option>
                                                                        <option value="177">Samoa</option>
                                                                        <option value="178">SanMarino</option>
                                                                        <option value="179">SaoTomeandPrincipe</option>
                                                                        <option value="180">SaudiArabia</option>
                                                                        <option value="181">Senegal</option>
                                                                        <option value="182">SerbiaandMontenegro</option>
                                                                        <option value="183">Seychelles</option>
                                                                        <option value="184">SierraLeone</option>
                                                                        <option value="185">Singapore</option>
                                                                        <option value="186">SlovakRepublic</option>
                                                                        <option value="187">Slovenia</option>
                                                                        <option value="188">SolomonIslands</option>
                                                                        <option value="189">Somalia</option>
                                                                        <option value="190">SouthAfrica</option>
                                                                        <option value="191">SouthGeorgia-SandwichIslands</option>
                                                                        <option value="192">SouthKorea</option>
                                                                        <option value="193">Spain</option>
                                                                        <option value="194">SriLanka</option>
                                                                        <option value="195">StHelena</option>
                                                                        <option value="196">StPierreandMiquelon</option>
                                                                        <option value="197">Sudan</option>
                                                                        <option value="198">Suriname</option>
                                                                        <option value="199">SvalbardAndJanMayenIslands</option>
                                                                        <option value="200">Swaziland</option>
                                                                        <option value="201">Sweden</option>
                                                                        <option value="202">Switzerland</option>
                                                                        <option value="203">Syria</option>
                                                                        <option value="204">Taiwan</option>
                                                                        <option value="205">Tajikistan</option>
                                                                        <option value="206">Tanzania</option>
                                                                        <option value="207">Thailand</option>
                                                                        <option value="208">Togo</option>
                                                                        <option value="209">Tokelau</option>
                                                                        <option value="210">Tonga</option>
                                                                        <option value="211">TrinidadandTobago</option>
                                                                        <option value="212">Tunisia</option>
                                                                        <option value="213">Turkey</option>
                                                                        <option value="214">Turkmenistan</option>
                                                                        <option value="215">TurksAndCaicosIslands</option>
                                                                        <option value="216">Tuvalu</option>
                                                                        <option value="217">Uganda</option>
                                                                        <option value="218">Ukraine</option>
                                                                        <option value="219">UnitedArabEmirates</option>
                                                                        <option value="220">UnitedKingdom</option>
                                                                        <option value="2">UnitedStates</option>
                                                                        <option value="221">Uruguay</option>
                                                                        <option value="222">Uzbekistan</option>
                                                                        <option value="223">Vanuatu</option>
                                                                        <option value="224">VaticanCityState(HolySee)</option>
                                                                        <option value="225">Venezuela</option>
                                                                        <option value="226">Vietnam</option>
                                                                        <option value="227">VirginIslands(British)</option>
                                                                        <option value="228">WallisAndFutunaIslands</option>
                                                                        <option value="229">WesternSahara</option>
                                                                        <option value="230">Yemen</option>
                                                                        <option value="231">Zambia</option>
                                                                        <option value="232">Zimbabwe</option>
                                                                    </select>
                                                                </td>
                                                                <td class="LoginAlert" style="width: 201px;">
                                                                    <span id="RequiredFieldValidator10" style="color: Red; visibility: hidden;">Country
                                                                        must be selected.</span>
                                                                </td>
                                                            </tr>
                                                            <tr class="TDHeight">
                                                                <td style="width: 173px;">
                                                                    &nbsp;
                                                                </td>
                                                                <td style="width: 5px;">
                                                                    &nbsp;
                                                                </td>
                                                                <td style="width: 173px;">
                                                                    &nbsp;
                                                                </td>
                                                                <td style="width: 201px;">
                                                                    &nbsp;
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 173px;">
                                                                    <p class="contactus">
                                                                        Contact Number<span class="RedStar"> *</span></p>
                                                                </td>
                                                                <td style="width: 5px;">
                                                                    &nbsp;
                                                                </td>
                                                                <td style="width: 173px;">
                                                                    <input name="txtPhone1" maxlength="15" id="txtPhone1" class="inputSignup" onchange="NumericBox_FindItem('txtPhone1').OnTextChange(this);"
                                                                        onkeypress="return NumericBox_FindItem('txtPhone1').AddNumericItem(event, this);"
                                                                        type="text">
                                                                </td>
                                                                <td class="LoginAlert" style="width: 201px;">
                                                                    <span id="RequiredFieldValidator14" style="color: Red; visibility: hidden;">Required
                                                                        field can't blank</span>
                                                                </td>
                                                            </tr>
                                                            <tr class="TDHeight">
                                                                <td colspan="4">
                                                                    &nbsp;
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 173px;">
                                                                    <p class="contactus">
                                                                        Mobile Number <span class="RedStar">*</span></p>
                                                                </td>
                                                                <td style="width: 5px;">
                                                                    &nbsp;
                                                                </td>
                                                                <td style="width: 173px;">
                                                                    <input name="txtMobile" id="txtMobile" class="inputSignup" type="text">
                                                                </td>
                                                                <td class="LoginAlert" style="width: 201px;">
                                                                    <span id="RequiredFieldValidator6" style="color: Red; visibility: hidden;">Required
                                                                        field can't blank</span>
                                                                </td>
                                                            </tr>
                                                            <tr class="TDHeight">
                                                                <td colspan="4">
                                                                    &nbsp;
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 173px;">
                                                                    <p class="contactus">
                                                                        Reference no.
                                                                    </p>
                                                                </td>
                                                                <td style="width: 5px;">
                                                                    &nbsp;
                                                                </td>
                                                                <td style="width: 173px;">
                                                                    <input name="txtReference" maxlength="15" id="txtReference" class="inputSignup" onchange="NumericBox_FindItem('txtReference').OnTextChange(this);"
                                                                        onkeypress="return NumericBox_FindItem('txtReference').AddNumericItem(event, this);"
                                                                        type="text">
                                                                </td>
                                                                <td class="LoginAlert" style="width: 201px;">
                                                                    &nbsp;
                                                                </td>
                                                            </tr>
                                                            <tr class="TDHeight">
                                                                <td colspan="4">
                                                                    &nbsp;
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="SignupHeader" colspan="3" valign="top">
                                                                    <img src="signup_expert.aspx_files/Verifysignup.gif" alt="Verify your signup" align="absmiddle"
                                                                        height="28" width="28">
                                                                    Verify your signup&nbsp;
                                                                </td>
                                                                <td valign="top">
                                                                    &nbsp;
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 154px;" valign="top">
                                                                    &nbsp;
                                                                </td>
                                                                <td style="width: 5px;" valign="top">
                                                                    &nbsp;
                                                                </td>
                                                                <td style="width: 173px;" valign="top">
                                                                    <img src="signup_expert.aspx_files/JpegImage.jpg">
                                                                </td>
                                                                <td valign="top">
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 154px;" valign="top">
                                                                    <p class="contactus">
                                                                        Image Verification <span class="RedStar">*</span></p>
                                                                </td>
                                                                <td style="width: 5px;" valign="top">
                                                                    &nbsp;
                                                                </td>
                                                                <td style="width: 173px;" valign="top">
                                                                    <input name="CodeNumberTextBox" id="CodeNumberTextBox" class="inputSignup" type="text">
                                                                </td>
                                                                <td class="LoginAlert" valign="top">
                                                                    <span id="RequiredFieldValidator15" style="color: Red; visibility: hidden;">Required
                                                                        field can't blank</span>
                                                                    <br>
                                                                    <span id="CompareValidator2" style="color: Red; visibility: hidden;">The number does
                                                                        not match the image.</span>
                                                                </td>
                                                            </tr>
                                                            <tr class="TDHeight">
                                                                <td colspan="4">
                                                                    &nbsp;
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="height: 20px; width: 173px;" valign="top">
                                                                    &nbsp;
                                                                </td>
                                                                <td style="height: 20px; width: 5px;" valign="top">
                                                                    &nbsp;
                                                                </td>
                                                                <td class="footerNav" style="height: 20px;" colspan="2" valign="top">
                                                                    <div id="divtermscondition">
                                                                        <input name="CheckAgree" id="CheckAgree" value="1" onclick="javascript:return CheckFirst();"
                                                                            checked="checked" type="checkbox">&nbsp; I accept the <a href="javascript:newwindow('Terms_Expert.txt')"
                                                                                class="body-text-sky">terms and conditions.</a></div>
                                                                    <p style="padding: 0pt 0pt 0pt 26px;">
                                                                        Check the box to proceed further.</p>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 173px; height: 19px;" valign="top">
                                                                    &nbsp;
                                                                </td>
                                                                <td style="width: 5px; height: 19px;" valign="top">
                                                                    &nbsp;
                                                                </td>
                                                                <td style="width: 173px; height: 19px;" valign="top">
                                                                    &nbsp;
                                                                </td>
                                                                <td style="width: 201px; height: 19px;" valign="top">
                                                                    &nbsp;
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 173px;" valign="top">
                                                                    &nbsp;
                                                                </td>
                                                                <td style="width: 5px;" valign="top">
                                                                    &nbsp;
                                                                </td>
                                                                <td style="width: 173px;" valign="top">
                                                                    &nbsp;
                                                                </td>
                                                                <td style="width: 201px;" valign="top">
                                                                    &nbsp;
                                                                </td>
                                                            </tr>
                                                            <tr class="TDHeight">
                                                                <td style="width: 173px;" valign="top">
                                                                    &nbsp;
                                                                </td>
                                                                <td style="width: 5px;" valign="top">
                                                                    &nbsp;
                                                                </td>
                                                                <td style="width: 173px;" valign="top">
                                                                    &nbsp;
                                                                </td>
                                                                <td style="width: 201px;" valign="top">
                                                                    &nbsp;
                                                                </td>
                                                            </tr>
                                                            <tr class="TDHeight">
                                                                <td style="width: 173px;" valign="top">
                                                                    &nbsp;
                                                                </td>
                                                                <td style="width: 5px;" valign="top">
                                                                    &nbsp;
                                                                </td>
                                                                <td style="width: 173px;" valign="top">
                                                                    <div id="divBtn" style="display: block;">
                                                                        <%--<input name="imgBtnSubmit" id="imgBtnSubmit" src="signup_expert.aspx_files/Submit.jpg"
                                                                            onclick='javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions("imgBtnSubmit", "", true, "", "", false, false))'
                                                                            style="border-width: 0px;" type="image">--%>
                                                                            
                                                                        <asp:ImageButton ID="btnSubmit" ImageUrl="~/Pictures/Submit.jpg" 
                                                                            runat="server" onclick="btnSubmit_Click"  />
                                                                            
                                                                    </div>
                                                                </td>
                                                                <td style="width: 201px;" valign="top">
                                                                    &nbsp;
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    &nbsp;
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
       </form> 
</body>
</html>
