<%@Page Language="C#" AutoEventWireup="true" CodeFile="test.aspx.cs" ValidateRequest="false" Inherits="test" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <script type="text/javascript" language="javascript" src="js/JScript.js"></script>


<script language="javascript" type="text/javascript">
   function validateFileUpload(objFu)
    //  function validateFileup()
      {
        //var objFu=document.getElementById("ctl00_ContentPlaceHolder1_fileReport");
//        alert(objFu);
  //      alert(objFu.value + " ext: " + objFu.value.substring(objFu.value.indexOf('.')+1));
        if(objFu!=null)
        {
            if(objFu.value!=null && objFu.value!='')
            {
              //  var ext=objFu.value.substring(objFu.value.indexOf('.'));
                       
                var ext=objFu.value.substr(objFu.value.length - 3, 3);

                alert(ext);
                var allowedExt=new Array("jpg", "png", "gif");
                var flag=false;
                for(var i=0;i<allowedExt.length;i++)
                {
                    if(ext.toLowerCase()==allowedExt[i])
                    {
                        flag=true;
                    }
                }
                if(flag)
                {
//                    args.IsValid=true; 
                       return true;
                }
                else
                {
//                    args.IsValid=false; 
                     alert("Please upload the file in any of the following format :-.jpg, .png,.gif");
                     return false;
                    
                }
            }
            else
            {
                                 alert("Please upload the file in any of the following format :-.jpg, .png,.gif");

            
            }
        }
        else
        {
//            args.IsValid=false; 
                return false;
            alert("Object not found.");            
        }
    }
    function allowedKey(e)
    {
        // Calling procedure
        // onKeyPress=\"javascript:return IsNumeric(event);\" 
	    var KeyID = (window.event) ? event.keyCode : e.which;
	    //alert(KeyID);
	    if((KeyID >= 33 && KeyID <= 44) || (KeyID >= 46 && KeyID <= 47) || (KeyID == 32) || (KeyID >= 58 && KeyID <= 64) ||
	       (KeyID >= 91 && KeyID <= 94) || (KeyID == 96) || (KeyID >= 123 && KeyID <= 126))
	    {
		    return false;
	    }
	    return true;
    }
    function val()
    {
             if(document.getElementById("txtName").value=="")
              {
                alert("Name Required");
                return false;  
              }
              if(document.getElementById("txtCity").value=="")
              {
                alert("City Required");
                return false;  
              }
              
    
    }
    function check()
    {
    var html=document.getElementById("txtHTML").value;
   // var text=server.HTMLEncode( html.replace( /<[^<|>]+?>/gi,'' ) );
    var regEx = /<[^>]*>/g;
	

    alert(html.replace(regEx, ""));
    }
    
    function SetValueToHdnField(selectedhdnvalue)
{
//          document.getElementById("hdids").value=selectedhdnvalue; 
//        alert(document.getElementById("hdids").value);
        
        var hiddenValue=  document.getElementById("hdnSelectedRedioValue").value; 
        alert(hiddenValue);
        var arrValues=new Array();  
        arrValues=hiddenValue.split('|');
        for(var i=0;i<arrValues.length-1;i++)
        {
             if(selectedhdnvalue.substring(0,arrValues[i].indexOf(','))==arrValues[i].substring(0,arrValues[i].indexOf(',')))
             {
                hiddenValue= hiddenValue.replace(arrValues[i]+"|","");
             }
        }
         hiddenValue=hiddenValue+selectedhdnvalue+"|";
         document.getElementById("hdnSelectedRedioValue").value=hiddenValue;
         alert(document.getElementById("hdnSelectedRedioValue").value);
}


    </script>
</head>
<body>
    <form id="form1" runat="server" >
    
    <asp:scriptmanager ID="Scriptmanager1" runat="server"></asp:scriptmanager>

    <div>
        <a href="test.aspx?p=1">1</a> <a href="test.aspx?p=6">6</a><a href="test.aspx?p=7">7</a>
    
      <asp:DropDownList ID="ddlState" runat="server">
    </asp:DropDownList><br />
        <asp:TextBox ID="txtName" runat="server"></asp:TextBox><br />
        
         <asp:TextBox ID="txtCity" runat="server"></asp:TextBox><br />
    <asp:FileUpload ID="FileUpload1" onchange="return validateFileUpload(this);" runat="server" />
    
        <asp:Button ID="btnUpload"  runat="server" Text="Button" />
        <asp:TextBox ID="txtHTML" runat="server"></asp:TextBox>
        
       <input type="button" id="btnCheck" onclick="check();" />
       
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
               <textarea style="width: 348px;" cols="0" rows="0" id="txtPageDescription" name="txtPageDescription">Below mentioned are some of the finest directories on the world wide web.  If you have a directory and want it listed on this page, <a href='http://www.reliablelinkexchange.com/RequestLinkExchange.aspx?r=3' target='_blank'>Click here</a></textarea>
<script language="javascript" type="text/javascript">
                                                                                             displaylimit("","txtPageDescription",800)
                                                                                            </script>
        </ContentTemplate>
        </asp:UpdatePanel>
    
       
       <%-- <input type="radio"  value="1,radioMasterSample" name="RadioButton1" id="radioMasterSample1"/>Mailing master sample Customised Inskirt for taking measurements
      
     <input type="radio"  value="1,radioDummaySample" name="RadioButton1" id="radioDummaySample1"/>Make a dummy sample for approval
      --%>
        <br />
        <input id="Radio1" onclick="SetValueToHdnField(this.value);" name="Radio" value="1"  type="radio" />1<br />
      <input id="Radio2" onclick="SetValueToHdnField(this.value);" name="Radio" value="2"  type="radio" />2<br />
      
        <input id="Radio3" onclick="SetValueToHdnField(this.value);" name="Radio3" value="3"  type="radio" />3<br />
       
        <asp:Button ID="Button1" runat="server" Text="Button" onclick="Button1_Click" />
        
        <input type="hidden" id="hdids" value="" runat="server" />
         <input type="hidden" id="hdnSelectedRedioValue" value="" runat="server" />
         
         
         <div id="sample1" class="window" style="left: 350px; top: 180px; 
z-index: 1; width: 262px;">
      <div style="" class="clientArea" id="dvConformation">
          <input name="hdnQuestionId" id="hdnQuestionId" type="hidden">
            <p class="queryTxt">This will delete this question from the 
database. Do you want to proceed?</p>
            <br class="clear">
            <p class="popUpBtn"> 
            <a href="javascript:CallAjaxData();"><img 
src="viewquestion.aspx_files/yes_btn.gif" alt="Yes" title="Yes"></a>
            
            <img src="viewquestion.aspx_files/no_btn.gif" alt="No" 
title="No" class="proceedImg" onclick="hidedv();"> </p>
            
      </div>
      <div id="dvWaitForSuccess" style="display: none;">
      <p class="queryTxt">Please wait ....</p>
     
      </div>
<!-- Sample Window 1 -->
</div>
         
         
    </div>
    </form>
</body>
</html>
