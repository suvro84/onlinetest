<%@ Page Language="C#" AutoEventWireup="true" CodeFile="expertcityselection.aspx.cs"
    Inherits="expertcityselection" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <link href="CSS/Homepage.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript">
function CheckSameCheckbox(obj1,obj2)
{
      
                      if((obj1!=null)&&(document.getElementsByName(obj2)!=null))
                       {
                          if(obj1.checked==true)
                          {
                           var fieldCheck=document.getElementsByName(obj2);
                           for (i = 0; i <fieldCheck.length; i++)
	                       fieldCheck[i].checked = true ;
	                      }
	                      if(obj1.checked==false)
                          {
                           var fieldCheck=document.getElementsByName(obj2);
                           for (i = 0; i <fieldCheck.length; i++)
	                       fieldCheck[i].checked = false ;
	                      }
	                   }
	             

 }

    </script>
    <script language="javascript" type="text/javascript">
function GetCity()
{
      
            var objCityId=document.getElementById("hidCityIds");
            var totCity=document.getElementById("hidTotCity").value;
        
            if(objCityId!=null)
             {  
             
                if(objCityId.value!="")
                 {
                         // alert("hi val="+objCityId.value);
                            var update=new Array();
                           
                          
                           if(objCityId.value.indexOf(',' != -1))
                           {            
                                            var cityName="";
                                            
                                            update=objCityId.value.split(",");
                                            var i=0;
                                            var count1=0;
                                            for(i=0;i<update.length;i++)
                                            {
                                               var cid="chkCity"+String(update[i]);
                                             
                                              if(document.getElementById(cid)!=null)
                                              { 
                                                  if(document.getElementById(cid).checked==true)
                                                    {
                                                          var updateCitName=new Array();
                                                            
                                                        if(document.getElementById(cid).value.indexOf('|' != -1))
                                                         { 
                                                             updateCitName=document.getElementById(cid).value.split("|");
                                                             if(cityName=="")
                                                             {
                                                              cityName=cityName+updateCitName[1];
                                                             }
                                                             else
                                                             {
                                                              cityName=cityName+","+updateCitName[1];
                                                             }
                                                         }           
                               
                                                         
                                                    
                                                      count1++
                                                    }
                                              }
                                            }
                                           // alert("no="+count1);
                                            if(count1<=0)
                                            {
                                              cityName="";
                                              alert("You have not selected any City.");
                                              return false;
                                            }
                                           
                                            var cname="Cities";
                                            if(totCity==1)
                                            {
                                              cname="City"
                                            }
                                            
                                            if(count1>totCity)
                                            {
                                             cityName="";
                                             
                                              alert("You cannot go beyond "+String(totCity)+" "+cname+".");
                                              return false;
                                            }
                                            if(count1<totCity)
                                            {
                                               cityName="";
                                              alert(String(totCity)+" "+cname+" must be checked.");
                                              return false;
                                            }
                                            if((count1!=0)&&(count1==totCity))
                                            {
                                                    if((document.getElementById("divHead")!=null)&&(cityName!=""))
                                                    {
                                                        if(totCity>1)
                                                        {
                                                            document.getElementById("divHead").innerHTML="<span class=\"LoginName\">Cities selected:</span><span class=\"SearchTerm\"> "+cityName+" </span>";
                                                        }
                                                        else
                                                        {
                                                            document.getElementById("divHead").innerHTML="<span class=\"LoginName\">City selected:</span><span class=\"SearchTerm\"> "+cityName+" </span>";
                                                        }
                                                    }
                                                    
                                                    if(document.getElementById("divCity")!=null)
                                                    {
                                                    document.getElementById("divCity").style.display="none";
                                                    }
                                                    if(document.getElementById("divForServices")!=null)
                                                    {
                                                    document.getElementById("divForServices").style.display="block";
                                                    }
                                                    
                                            }
                                            else
                                            {
                                                   if(document.getElementById("divHead")!=null)
                                                    {
                                                     document.getElementById("divHead").innerHTML="";
                                                    }
                                            }

                            
                                }
                                else
                                {
                                
                                             var cid1="chkCity"+String(objCityId.value);
                                             
                                              if(document.getElementById(cid1)!=null)
                                              { 
                                                  if(document.getElementById(cid1).checked==false)
                                                    {
                                                      alert("You have not selected any City.");
                                                      return false;
                                                     
                                                    }
                                              }
                                              else
                                              {
                                                        var updateCitName1=new Array();
                                                            
                                                        if(document.getElementById(cid1).value.indexOf('|' != -1))
                                                         { 
                                                            updateCitName1=document.getElementById(cid1).value.split("|");
                                                            
                                                            if((document.getElementById("divHead")!=null)&&(updateCitName1[1]!=""))
                                                             {
                                                                document.getElementById("divHead").innerHTML="<span class=\"LoginName\">Cities selected:</span><span class=\"SearchTerm\"> "+updateCitName1[1]+" </span>";
                                                               
                                                             }
                                                          
                                                          }
                                                          
                                                    if(document.getElementById("divCity")!=null)
                                                    {
                                                    document.getElementById("divCity").style.display="none";
                                                    }
                                                    if(document.getElementById("divForServices")!=null)
                                                    {
                                                    document.getElementById("divForServices").style.display="block";
                                                    }
                                          
                                              }
                                
                                
                                }
                          
                
                      }
         
              }


    
   
}

    </script>

    <script>
function fetchService()
{
            var objCity=document.getElementById("ddlCity");
            if(objCity)
            {
              if(objCity.value=="")
              { 
                 alert("Please Select one city and click on go button.");
                 return false;
              }
              else
              {
                  var response=objCity.value;
                  var update=new Array();
                   if(response.indexOf('|' != -1))
                   {
                        update=response.split("|");
                       if(update.length==2)
                       {
                            if(update[0]!="")
                            {
                                 if(document.getElementById("divCityID"))
                                 {
                                   document.getElementById("divCityID").innerHTML="<input type=\"hidden\" id=\"hiddCityID\" value=\""+String(update[0]) +"\" >";
                                 }
                             }
                             if(update[1]!="")
                             {
                                if(document.getElementById("divHead"))
                                {
                                   document.getElementById("divHead").innerHTML="Cities selected:<span class=\"SearchTerm\"> "+String(update[1])+"</span>";
                                }
                             }
                             if(document.getElementById("divForServices"))
                             {
                               document.getElementById("divForServices").style.display="block";
                             
                             }
                             
                       }
                     
                   }
                   //checkOnload();
                   return true;
              }
            }
            else
            {
             alert("City dropdown is not vailable.");
             return false;
            }


}

function Validate()
{
            var objCityId=document.getElementById("hidSubServId");
            var totCity=document.getElementById("hidTotSubServId").value;
            if(objCityId!=null)
             {  
             
                if(objCityId.value!="")
                 {
                         // alert("hi val="+objCityId.value);
                            var update=new Array();
                           
                          
                           if(objCityId.value.indexOf(',' != -1))
                           {            
                                            update=objCityId.value.split(",");
                                            var i=0;
                                            var count1=0;
                                            for(i=0;i<update.length;i++)
                                            {
                                               var cid="chkSubServ"+String(update[i]);
                                             
                                              if(document.getElementById(cid)!=null)
                                              { 
                                                  if(document.getElementById(cid).checked==true)
                                                    {
                                                      count1++
                                                    }
                                              }
                                            }
                                           // alert("no="+count1);
                                            if(count1<=0)
                                            {
                                              alert("You have not selected any Sub Services.");
                                              return false;
                                            }
                                             var cname="SubServices";
                                            if(totCity==1)
                                            {
                                              cname="SubService"
                                            }
                                            if(count1>totCity)
                                            {
                                              alert("You cannot go beyond "+String(totCity)+" "+cname+".");
                                              return false;
                                            }
                                            if(count1<totCity)
                                            {
                                              alert(String(totCity)+" "+cname+" must be checked.");
                                              return false;
                                            }
                                            if((count1!=0)&&(count1==totCity))
                                            {
//                                                    if(document.getElementById("divCity")!=null)
//                                                    {
//                                                    document.getElementById("divCity").style.display="none";
//                                                    }
//                                                    if(document.getElementById("divForServices")!=null)
//                                                    {
//                                                    document.getElementById("divForServices").style.display="block";
//                                                    }
                                            }

                            
                                }
                                else
                                {
                                
                                             var cid1="chkSubServ"+String(objCityId.value);
                                             
                                              if(document.getElementById(cid1)!=null)
                                              { 
                                                  if(document.getElementById(cid1).checked==false)
                                                    {
                                                      alert("You have not selected any Sub Services.");
                                                      return false;
                                                     
                                                    }
                                              }
                                              else
                                              {
//                                                    if(document.getElementById("divCity")!=null)
//                                                    {
//                                                    document.getElementById("divCity").style.display="none";
//                                                    }
//                                                    if(document.getElementById("divForServices")!=null)
//                                                    {
//                                                    document.getElementById("divForServices").style.display="block";
//                                                    }
                                          
                                              }
                                
                                
                                }
                          
                
                      }
         
              }


    

}

function checkOnload()
{
     
       
            var objCity=document.getElementById("ddlCity");
            if(objCity)
            {
              if(objCity.value!="")
              { 
                   var obj=document.getElementById("suvServId");
                   if(obc)
                   {
                        var val=obc.value;
                        if(val!="")
                        {
                              var update=new Array();
                              if(val.indexOf('|' != -1))
                              {
                                update=val.split("|");
                                var i=0;
                                 for(i=0;i<update.length;i++)
                                 { 
                                     var update2=new Array();
                                 if(update[i].indexOf(',' != -1))
                                 {
                                      update2=update[i].split(",");
                                       if(objCity.value==update2[0])
                                       {
                                               var SubServiceId = "chkSubServ" + update2[1];
                                               var objSerId=document.getElementById(SubServiceId);
                                               if(objSerId)
                                               {
                                                objSerId.disabled=true;
                                                }
                                        }
                                  }
                                 
                                 }
                              }
                              else
                              {
                                 var update1=new Array();
                                 if(val.indexOf(',' != -1))
                                 {
                                      update1=val.split(",");
                                       if(objCity.value==update1[0])
                                       {
                                               var SubServiceId = "chkSubServ" + update1[1];
                                               var objSerId=document.getElementById(SubServiceId);
                                               if(objSerId)
                                               {
                                                objSerId.disabled=true;
                                                }
                                        }
                                  }
                              
                              }
                              
                             
                            
                        }
                     
                   }
                 
              }
            }
           
            
      

}
    </script>

    <script language="javascript" type="text/javascript">
function ImageChange(alterim,dividimg,text)
{
    var ImagArray = new Array();   
    ImagArray = alterim.split("+"); 
    var vartext = text;

    var TextArray = new Array(); 
    TextArray=text.split("+");

    //document.getElementById(id).innerHTML ="<img id="+id+" onMouseOut=ImageSet('Pictures/Bn-Yel.jpg',this.id) src=" + alterim + " />";
    document.getElementById(dividimg).innerHTML ="<table width='140' border='0' align='center' cellpadding='0' cellspacing='0'>" +
              " <tr> " +
                " <td><div align='center'><img src="+ImagArray[1]+" width='60' height='60'></div></td> " +
              " </tr> " +
              " <tr class='TDHeight'> " +
                " <td>&nbsp;</td> " +
              " </tr> " +
              " <tr> " +
                " <td align='center' onMouseOut=ImageSet('Pictures/Bn-Yel.jpg+"+ImagArray[1]+"','"+dividimg+"','"+TextArray[0]+"+"+TextArray[1]+"') background="+ImagArray[0]+" style='height: 40px'><a href='"+TextArray[0]+".html' class='BigNav'>"+TextArray[0]+"<br>"+TextArray[1]+"</a></td> " +
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

</head>
<body>
    <form id="form1" runat="server" onsubmit="return Validate();">
    <table align="center" border="0" cellpadding="0" cellspacing="0" width="90%">
        <tbody>
            <tr>
                <td class="ShortDesc" valign="top">
                    <div align="justify">
                        <span class="AboutMJ">Steps to follow –<br>
                        </span>&nbsp;&nbsp;&nbsp;&nbsp;1. The package selected by you is displayed below.<br>
                        &nbsp;&nbsp;&nbsp;&nbsp;2. Select city/cities as per your package requirement in
                        which you want to offer the services.<br>
                        &nbsp;&nbsp;&nbsp;&nbsp;3. For multi-city packages, please note that the services
                        selected will remain same for the chosen set of cities.<br>
                        &nbsp;&nbsp;&nbsp;&nbsp;4. Now select the services as per your package by ticking
                        in the box next to the services.<br>
                        &nbsp;&nbsp;&nbsp;&nbsp;5. Submit after selecting the services by clicking on the
                        Submit button.
                    </div>
                </td>
            </tr>
            <tr class="TDHeight8">
                <td valign="top">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td valign="top">
                    <div  id="divCity">
                        <table class="DashedTable" align="center" border="0" cellpadding="0" cellspacing="0"
                            width="100%">
                            <tbody>
                                <tr class="AboutBody">
                                    <td colspan="3" style="height: 20px;" bgcolor="#ffb538">
                                        <div id="divPkgDet1" align="center">
                                            <span class="Orange11"><strong>Package:</strong></span> <span class="GoldSection">Free</span>
                                            - 2 Service in 1 Cities.
                                        </div>
                                    </td>
                                </tr>
                                <tr class="ShortDesc">
                                    <td colspan="3">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr class="ShortDesc">
                                    <td colspan="3">
                                        <div align="center">
                                            Please choose the cities from the list below.
                                        </div>
                                    </td>
                                </tr>
                                <tr class="ShortDesc">
                                    <td colspan="3" class="ShortDesc" style="height: 13px;">
                                        <div id="divError1" align="center">
                                            &nbsp;</div>
                                    </td>
                                </tr>
                                <tr class="ShortDesc">
                                    <td class="ShortDesc" style="height: 73px;" width="4%">
                                        &nbsp;
                                    </td>
                                    <td colspan="2" class="ShortDesc" style="height: 73px;">
                                        <div id="divCityList">
                                            <asp:DataList RepeatColumns="2" RepeatDirection="Horizontal" ID="rptCity" runat="server">
                                                <ItemTemplate>
                                                    <table width="300" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="50%">
                                                                <input type="checkbox"  class="inputbox" name="chkCity<%#Eval("city_id")%>" id="chkCity<%#Eval("city_id") %>"
                                                                    value="<%#Eval("city_id")%>|<%#Eval("city_name")%>" runat="server">
                                                                <%#Eval("city_name")%>
                                                            </td>
                                                    </table>
                                                </ItemTemplate>
                                            </asp:DataList>
                                            </div>
                                    </td>
                                </tr>
                                <tr class="ShortDesc">
                                    <td class="ShortDesc" style="height: 13px;">
                                        &nbsp;
                                    </td>
                                    <td class="ShortDesc" style="height: 13px;">
                                        &nbsp;
                                    </td>
                                    <td class="ShortDesc" style="height: 13px;" width="61%">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr class="ShortDesc">
                                    <td class="ShortDesc" style="height: 13px;">
                                        &nbsp;
                                    </td>
                                    <td class="ShortDesc" style="height: 13px;" width="35%">
                                        &nbsp;
                                    </td>
                                    <td class="ShortDesc" style="height: 13px;">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr class="ShortDesc">
                                    <td class="ShortDesc">
                                        &nbsp;
                                    </td>
                                    <td class="ShortDesc">
                                        <a href="#" onclick="javascript:return GetCity();">
                                            <img src="Pictures/Submit.jpg" id="IMG1" language="javascript"
                                                border="0" height="40" width="105"></a>
                                    </td>
                                    <td class="ShortDesc">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr class="ShortDesc">
                                    <td colspan="3" class="ShortDesc">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr class="ShortDesc">
                                    <td colspan="3" class="ShortDesc">
                                        &nbsp;
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <div id="divForServices" style="display:none;">
                        <table class="ShortDesc" border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tbody>
                                <tr class="AboutBody">
                                    <td colspan="6" bgcolor="#f6e08d" height="20">
                                        <div id="divPkgDet2" align="center">
                                            <span class="Orange11"><strong>Package:</strong></span> <span class="GoldSection">Free</span>
                                            - 2 Service in 1 Cities.
                                        </div>
                                    </td>
                                </tr>
                                <tr class="ShortDesc">
                                    <td colspan="6">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr class="ShortDesc">
                                    <td colspan="6" class="ShortDesc" style="height: 19px;">
                                        <div id="divHead">
                                            <span class="LoginName">City selected:</span><span class="SearchTerm"> Kolkata </span>
                                        </div>
                                    </td>
                                </tr>
                                <tr class="ShortDesc">
                                    <td colspan="6" class="ShortDesc" style="height: 19px;">
                                        <div id="divError" align="center">
                                            &nbsp;</div>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="6" class="Tab_headerF" style="height: 19px;">
                                        <div id="divText">
                                            Please select the 2 Service in 1 Cities.
                                        </div>
                                    </td>
                                </tr>
                                <tr class="ShortDesc">
                                    <td class="ShortDesc" style="height: 19px;" width="4%">
                                        &nbsp;
                                    </td>
                                    <td class="ShortDesc" style="height: 19px;" width="20%">
                                        &nbsp;
                                    </td>
                                    <td colspan="4" class="ShortDesc" style="height: 19px;">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="6" style="height: 235px;">
                                        <table class="ShortDesc" border="0" cellpadding="0" cellspacing="0" width="100%">
                                            <tbody>
                                                <tr class="ShortDesc">
                                                    <td class="ShortDesc">
                                                        &nbsp;
                                                    </td>
                                                    <td>
                                                        <div id="divServiceList" runat="server">
                                                        </div>
                                                    </td>
                                                    <td class="GoldSection">
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                                <tr class="ShortDesc">
                                    <td colspan="6" class="ShortDesc">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr class="ShortDesc">
                                    <td colspan="6" class="ShortDesc" style="height: 40px;">
                                        <div align="center">
                                            <%--<input name="ImageButton1" id="ImageButton1" src="pictures/Submit.jpg"
                                                style="border-width: 0px;" type="image" runat="server" ">--%>
                                                
                                            <asp:ImageButton ID="ImageButton1" BorderWidth="0px" 
                                                ImageUrl="pictures/Submit.jpg" runat="server" onclick="ImageButton1_Click" />
                                        </div>
                                    </td>
                                </tr>
                                <tr class="ShortDesc">
                                    <td colspan="6" class="ShortDesc" style="height: 13px;">
                                        &nbsp;
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </td>
            </tr>
        </tbody>
    </table>
    <div id="divhidCityId">
        <input id="hidCityIds" runat="server" type="hidden"></div>
    <div id="divTotCity">
        <input id="hidTotCity" runat="server" type="hidden"></div>
    <div id="divhidSubServId">
        <input id="hidSubServId" runat="server" type="hidden"></div>
    <div id="divTotSubServId">
        <input id="hidTotSubServId" runat="server" type="hidden"></div>

    <script type="text/javascript" src="js/jsvalid.js">




</script>

    </form>
</body>
</html>
