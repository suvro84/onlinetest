<%@ Page Language="C#" AutoEventWireup="true" CodeFile="demohtml.aspx.cs" Inherits="demohtml" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <title>Money Jugglers</title>
    <link href="http://www.moneyjugglers.com/CSS/Homepage.css" type="text/css" rel="stylesheet" />
    <link href="CSS/Homepage.css" type="text/css" rel="stylesheet" />

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

    <!-- Start PopUp CSS -->
    <link href="http://www.moneyjugglers.com/popup/n2CoreLibs-n2v1-57871.css" type="text/css"
        rel="stylesheet">
    <link href="http://www.moneyjugglers.com/popup/n2CoreLibs-n2v1-57871.css" type="text/css"
        rel="stylesheet">
    <link href="http://www.moneyjugglers.com/popup/Default_Sheet.css" type="text/css"
        rel="stylesheet">
    <!-- End PopUp CSS -->
</head>
<body>
    <form name="form1" method="post" action="expertcityselection.aspx" onsubmit="javascript:return WebForm_OnSubmit();" id="form1">
<div>
<input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="" />
<input type="hidden" name="__EVENTARGUMENT" id="__EVENTARGUMENT" value="" />
<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwULLTE2NzkzMDA1NTMPZBYCZg9kFhICAg8WAh4JaW5uZXJodG1sBXg8c3BhbiBjbGFzcz0iT3JhbmdlMTEiPjxzdHJvbmc+UGFja2FnZTo8L3N0cm9uZz48L3NwYW4+IDxzcGFuIGNsYXNzPSJHb2xkU2VjdGlvbiI+PC9zcGFuPiAtIDAgU2VydmljZXMgaW4gMSBDaXR5LiA8L2Rpdj5kAgQPFgIfAAXoCDx0YWJsZSB3aWR0aD0iMzAwIiBib3JkZXI9IjAiIGNlbGxzcGFjaW5nPSIwIiBjZWxscGFkZGluZz0iMCI+PHRyPjx0ZCB3aWR0aD0iNTAlIj48aW5wdXQgdHlwZT0iY2hlY2tib3giIG5hbWU9ImNoa0NpdHkxIiAgaWQ9ImNoa0NpdHkxIiAgICAgdmFsdWU9IjF8S29sa2F0YSIgY2xhc3M9ImlucHV0Ym94Ij48c3Ryb25nPktvbGthdGE8L3N0cm9uZz48L3RkPjx0ZCB3aWR0aD0iNTAlIj48aW5wdXQgdHlwZT0iY2hlY2tib3giIG5hbWU9ImNoa0NpdHk2IiAgaWQ9ImNoa0NpdHk2IiAgICAgdmFsdWU9IjZ8Q2hlbm5haSIgY2xhc3M9ImlucHV0Ym94Ij48c3Ryb25nPkNoZW5uYWk8L3N0cm9uZz48L3RkPjwvdHI+PHRyPjx0ZCB3aWR0aD0iNTAlIj48aW5wdXQgdHlwZT0iY2hlY2tib3giICBuYW1lPSJjaGtDaXR5NSIgICBpZD0iY2hrQ2l0eTUiICAgICAgIHZhbHVlPSI1fEJhbmdhbG9yZSIgY2xhc3M9ImlucHV0Ym94Ij48c3Ryb25nPkJhbmdhbG9yZTwvc3Ryb25nPjwvdGQ+PHRkIHdpZHRoPSI1MCUiPjxpbnB1dCB0eXBlPSJjaGVja2JveCIgbmFtZT0iY2hrQ2l0eTMiICBpZD0iY2hrQ2l0eTMiICAgICB2YWx1ZT0iM3xOZXcgRGVsaGkiIGNsYXNzPSJpbnB1dGJveCI+PHN0cm9uZz5OZXcgRGVsaGk8L3N0cm9uZz48L3RkPjwvdHI+PHRyPjx0ZCB3aWR0aD0iNTAlIj48aW5wdXQgdHlwZT0iY2hlY2tib3giICBuYW1lPSJjaGtDaXR5OCIgICBpZD0iY2hrQ2l0eTgiICAgICAgIHZhbHVlPSI4fEh5ZGVyYWJhZCIgY2xhc3M9ImlucHV0Ym94Ij48c3Ryb25nPkh5ZGVyYWJhZDwvc3Ryb25nPjwvdGQ+PHRkIHdpZHRoPSI1MCUiPjxpbnB1dCB0eXBlPSJjaGVja2JveCIgbmFtZT0iY2hrQ2l0eTE2IiAgaWQ9ImNoa0NpdHkxNiIgICAgIHZhbHVlPSIxNnxBaG1lZGFiYWQiIGNsYXNzPSJpbnB1dGJveCI+PHN0cm9uZz5BaG1lZGFiYWQ8L3N0cm9uZz48L3RkPjwvdHI+PHRyPjx0ZCB3aWR0aD0iNTAlIj48aW5wdXQgdHlwZT0iY2hlY2tib3giICBuYW1lPSJjaGtDaXR5MiIgICBpZD0iY2hrQ2l0eTIiICAgICAgIHZhbHVlPSIyfE11bWJhaSIgY2xhc3M9ImlucHV0Ym94Ij48c3Ryb25nPk11bWJhaTwvc3Ryb25nPjwvdGQ+PHRkIHdpZHRoPSI1MCUiPiZuYnNwOzwvdGQ+PC90cj48L3RhYmxlPmQCBQ8WAh8ABXg8c3BhbiBjbGFzcz0iT3JhbmdlMTEiPjxzdHJvbmc+UGFja2FnZTo8L3N0cm9uZz48L3NwYW4+IDxzcGFuIGNsYXNzPSJHb2xkU2VjdGlvbiI+PC9zcGFuPiAtIDAgU2VydmljZXMgaW4gMSBDaXR5LiA8L2Rpdj5kAgcPFgIfAAUuUGxlYXNlIHNlbGVjdCB0aGUgMCBTZXJ2aWNlcyBpbiAxIENpdHkuIDwvZGl2PmQCCA8WAh8ABYyDATx0YWJsZSB3aWR0aD0iODM2IiBib3JkZXI9IjAiIGFsaWduPSJjZW50ZXIiIGNlbGxwYWRkaW5nPSIwIiBjZWxsc3BhY2luZz0iMCI+PHRyPjx0ZCB2YWxpZ249InRvcCIgc3R5bGU9ImhlaWdodDogMTc4cHg7IiB3aWR0aD0iMjAlIj48dGFibGUgd2lkdGg9IjIwOSIgYm9yZGVyPSIwIiBjZWxsc3BhY2luZz0iMCIgY2VsbHBhZGRpbmc9IjAiPjx0cj48dGQgYmdjb2xvcj0iI0Y2RTA4RCIgY2xhc3M9IkdvbGRTZWN0aW9uIiBzdHlsZT0iaGVpZ2h0OiAxOXB4Ij5NdXR1YWwgRnVuZHM8L3RkPjwvdHI+PHRyPjx0ZCB2YWxpZ249InRvcCIgYmdjb2xvcj0iI0ZDRjRENiIgc3R5bGU9ImhlaWdodDogMTQwcHgiPjxpbnB1dCB0eXBlPSJjaGVja2JveCIgaWQ9ImNoa1N1YlNlcnYzIiAgbmFtZT0iY2hrU3ViU2VydjMiICAgICAgICAgb25jbGljaz0iamF2YXNjcmlwdDpyZXR1cm4gQ2hlY2tTYW1lQ2hlY2tib3godGhpcywnY2hrU3ViU2VydjMnKTsiICAgICAgIHZhbHVlPSIzIj5GdW5kIERpc3RyaWJ1dG9ycyA8YnI+PC90ZD4gPC90cj48L3RhYmxlPjwvdGQ+PHRkIHZhbGlnbj0idG9wIiBzdHlsZT0iaGVpZ2h0OiAxNzhweDsiIHdpZHRoPSIyMCUiPjx0YWJsZSB3aWR0aD0iMjA5IiBib3JkZXI9IjAiIGNlbGxzcGFjaW5nPSIwIiBjZWxscGFkZGluZz0iMCI+PHRyPjx0ZCBiZ2NvbG9yPSIjRjZFMDhEIiBjbGFzcz0iR29sZFNlY3Rpb24iIHN0eWxlPSJoZWlnaHQ6IDE5cHgiPkxvYW5zPC90ZD48L3RyPjx0cj48dGQgdmFsaWduPSJ0b3AiIGJnY29sb3I9IiNGQ0Y0RDYiIHN0eWxlPSJoZWlnaHQ6IDE0MHB4Ij48aW5wdXQgdHlwZT0iY2hlY2tib3giIGlkPSJjaGtTdWJTZXJ2MjYiICBuYW1lPSJjaGtTdWJTZXJ2MjYiICAgICAgICAgb25jbGljaz0iamF2YXNjcmlwdDpyZXR1cm4gQ2hlY2tTYW1lQ2hlY2tib3godGhpcywnY2hrU3ViU2VydjI2Jyk7IiAgICAgICB2YWx1ZT0iMjYiPkhvbWUgTG9hbiA8YnI+PGlucHV0IHR5cGU9ImNoZWNrYm94IiBpZD0iY2hrU3ViU2VydjI3IiAgbmFtZT0iY2hrU3ViU2VydjI3IiAgICAgICAgIG9uY2xpY2s9ImphdmFzY3JpcHQ6cmV0dXJuIENoZWNrU2FtZUNoZWNrYm94KHRoaXMsJ2Noa1N1YlNlcnYyNycpOyIgICAgICAgdmFsdWU9IjI3Ij5BdXRvIExvYW4gPGJyPjxpbnB1dCB0eXBlPSJjaGVja2JveCIgaWQ9ImNoa1N1YlNlcnYyOCIgIG5hbWU9ImNoa1N1YlNlcnYyOCIgICAgICAgICBvbmNsaWNrPSJqYXZhc2NyaXB0OnJldHVybiBDaGVja1NhbWVDaGVja2JveCh0aGlzLCdjaGtTdWJTZXJ2MjgnKTsiICAgICAgIHZhbHVlPSIyOCI+UGVyc29uYWwgTG9hbiA8YnI+PGlucHV0IHR5cGU9ImNoZWNrYm94IiBpZD0iY2hrU3ViU2VydjI5IiAgbmFtZT0iY2hrU3ViU2VydjI5IiAgICAgICAgIG9uY2xpY2s9ImphdmFzY3JpcHQ6cmV0dXJuIENoZWNrU2FtZUNoZWNrYm94KHRoaXMsJ2Noa1N1YlNlcnYyOScpOyIgICAgICAgdmFsdWU9IjI5Ij5FZHVjYXRpb25hbCBMb2FuIDxicj48aW5wdXQgdHlwZT0iY2hlY2tib3giIGlkPSJjaGtTdWJTZXJ2MzAiICBuYW1lPSJjaGtTdWJTZXJ2MzAiICAgICAgICAgb25jbGljaz0iamF2YXNjcmlwdDpyZXR1cm4gQ2hlY2tTYW1lQ2hlY2tib3godGhpcywnY2hrU3ViU2VydjMwJyk7IiAgICAgICB2YWx1ZT0iMzAiPkJ1c2luZXNzIExvYW4gPGJyPjwvdGQ+IDwvdHI+PC90YWJsZT48L3RkPjx0ZCB2YWxpZ249InRvcCIgc3R5bGU9ImhlaWdodDogMTc4cHg7IiB3aWR0aD0iMjAlIj48dGFibGUgd2lkdGg9IjIwOSIgYm9yZGVyPSIwIiBjZWxsc3BhY2luZz0iMCIgY2VsbHBhZGRpbmc9IjAiPjx0cj48dGQgYmdjb2xvcj0iI0Y2RTA4RCIgY2xhc3M9IkdvbGRTZWN0aW9uIiBzdHlsZT0iaGVpZ2h0OiAxOXB4Ij5DcmVkaXQgQ2FyZHM8L3RkPjwvdHI+PHRyPjx0ZCB2YWxpZ249InRvcCIgYmdjb2xvcj0iI0ZDRjRENiIgc3R5bGU9ImhlaWdodDogMTQwcHgiPjxpbnB1dCB0eXBlPSJjaGVja2JveCIgaWQ9ImNoa1N1YlNlcnYxMCIgIG5hbWU9ImNoa1N1YlNlcnYxMCIgICAgICAgICBvbmNsaWNrPSJqYXZhc2NyaXB0OnJldHVybiBDaGVja1NhbWVDaGVja2JveCh0aGlzLCdjaGtTdWJTZXJ2MTAnKTsiICAgICAgIHZhbHVlPSIxMCI+Q3JlZGl0IENhcmRzIDxicj48L3RkPiA8L3RyPjwvdGFibGU+PC90ZD48dGQgdmFsaWduPSJ0b3AiIHN0eWxlPSJoZWlnaHQ6IDE3OHB4OyIgd2lkdGg9IjIwJSI+PHRhYmxlIHdpZHRoPSIyMDkiIGJvcmRlcj0iMCIgY2VsbHNwYWNpbmc9IjAiIGNlbGxwYWRkaW5nPSIwIj48dHI+PHRkIGJnY29sb3I9IiNGNkUwOEQiIGNsYXNzPSJHb2xkU2VjdGlvbiIgc3R5bGU9ImhlaWdodDogMTlweCI+RXF1aXR5IE1hcmtldDwvdGQ+PC90cj48dHI+PHRkIHZhbGlnbj0idG9wIiBiZ2NvbG9yPSIjRkNGNEQ2IiBzdHlsZT0iaGVpZ2h0OiAxNDBweCI+PGlucHV0IHR5cGU9ImNoZWNrYm94IiBpZD0iY2hrU3ViU2VydjE0IiAgbmFtZT0iY2hrU3ViU2VydjE0IiAgICAgICAgIG9uY2xpY2s9ImphdmFzY3JpcHQ6cmV0dXJuIENoZWNrU2FtZUNoZWNrYm94KHRoaXMsJ2Noa1N1YlNlcnYxNCcpOyIgICAgICAgdmFsdWU9IjE0Ij5EZXBvc2l0b3JpZXMgPGJyPjxpbnB1dCB0eXBlPSJjaGVja2JveCIgaWQ9ImNoa1N1YlNlcnYzMyIgIG5hbWU9ImNoa1N1YlNlcnYzMyIgICAgICAgICBvbmNsaWNrPSJqYXZhc2NyaXB0OnJldHVybiBDaGVja1NhbWVDaGVja2JveCh0aGlzLCdjaGtTdWJTZXJ2MzMnKTsiICAgICAgIHZhbHVlPSIzMyI+QnJva2VycyA8YnI+PGlucHV0IHR5cGU9ImNoZWNrYm94IiBpZD0iY2hrU3ViU2VydjM1IiAgbmFtZT0iY2hrU3ViU2VydjM1IiAgICAgICAgIG9uY2xpY2s9ImphdmFzY3JpcHQ6cmV0dXJuIENoZWNrU2FtZUNoZWNrYm94KHRoaXMsJ2Noa1N1YlNlcnYzNScpOyIgICAgICAgdmFsdWU9IjM1Ij5JbnRlcm5ldCBUcmFkaW5nIDxicj48aW5wdXQgdHlwZT0iY2hlY2tib3giIGlkPSJjaGtTdWJTZXJ2MzgiICBuYW1lPSJjaGtTdWJTZXJ2MzgiICAgICAgICAgb25jbGljaz0iamF2YXNjcmlwdDpyZXR1cm4gQ2hlY2tTYW1lQ2hlY2tib3godGhpcywnY2hrU3ViU2VydjM4Jyk7IiAgICAgICB2YWx1ZT0iMzgiPlBNUyA8YnI+PGlucHV0IHR5cGU9ImNoZWNrYm94IiBpZD0iY2hrU3ViU2Vydjg5IiAgbmFtZT0iY2hrU3ViU2Vydjg5IiAgICAgICAgIG9uY2xpY2s9ImphdmFzY3JpcHQ6cmV0dXJuIENoZWNrU2FtZUNoZWNrYm94KHRoaXMsJ2Noa1N1YlNlcnY4OScpOyIgICAgICAgdmFsdWU9Ijg5Ij5JUE8gPGJyPjwvdGQ+IDwvdHI+PC90YWJsZT48L3RkPjwvdHI+PHRyPjx0ZCAgd2lkdGg9IjIwJSIgc3R5bGU9ImhlaWdodDogMTlweCI+Jm5ic3A7PC90ZD48dGQgIHdpZHRoPSIyMCUiIHN0eWxlPSJoZWlnaHQ6IDE5cHgiPiZuYnNwOzwvdGQ+PHRkICB3aWR0aD0iMjAlIiBzdHlsZT0iaGVpZ2h0OjE5cHgiPiZuYnNwOzwvdGQ+PHRkIHdpZHRoPSIyMCUiIHN0eWxlPSJoZWlnaHQ6IDE5cHgiPiZuYnNwOzwvdGQ+PC90cj4gIDx0cj48dGQgdmFsaWduPSJ0b3AiIHN0eWxlPSJoZWlnaHQ6IDE3OHB4OyIgd2lkdGg9IjIwJSI+PHRhYmxlIHdpZHRoPSIyMDkiIGJvcmRlcj0iMCIgY2VsbHNwYWNpbmc9IjAiIGNlbGxwYWRkaW5nPSIwIj48dHI+PHRkIGJnY29sb3I9IiNGNkUwOEQiIGNsYXNzPSJHb2xkU2VjdGlvbiIgc3R5bGU9ImhlaWdodDogMTlweCI+RmluYW5jaWFsIEFuYWx5c3Q8L3RkPjwvdHI+PHRyPjx0ZCB2YWxpZ249InRvcCIgYmdjb2xvcj0iI0ZDRjRENiIgc3R5bGU9ImhlaWdodDogMTQwcHgiPjxpbnB1dCB0eXBlPSJjaGVja2JveCIgaWQ9ImNoa1N1YlNlcnY0MCIgIG5hbWU9ImNoa1N1YlNlcnY0MCIgICAgICAgICBvbmNsaWNrPSJqYXZhc2NyaXB0OnJldHVybiBDaGVja1NhbWVDaGVja2JveCh0aGlzLCdjaGtTdWJTZXJ2NDAnKTsiICAgICAgIHZhbHVlPSI0MCI+VGVjaG5pY2FsIEVxdWl0eSA8YnI+PGlucHV0IHR5cGU9ImNoZWNrYm94IiBpZD0iY2hrU3ViU2VydjUzIiAgbmFtZT0iY2hrU3ViU2VydjUzIiAgICAgICAgIG9uY2xpY2s9ImphdmFzY3JpcHQ6cmV0dXJuIENoZWNrU2FtZUNoZWNrYm94KHRoaXMsJ2Noa1N1YlNlcnY1MycpOyIgICAgICAgdmFsdWU9IjUzIj5GdW5kYW1lbnRhbCBBbmFseXN0IDxicj48L3RkPiA8L3RyPjwvdGFibGU+PC90ZD48dGQgdmFsaWduPSJ0b3AiIHN0eWxlPSJoZWlnaHQ6IDE3OHB4OyIgd2lkdGg9IjIwJSI+PHRhYmxlIHdpZHRoPSIyMDkiIGJvcmRlcj0iMCIgY2VsbHNwYWNpbmc9IjAiIGNlbGxwYWRkaW5nPSIwIj48dHI+PHRkIGJnY29sb3I9IiNGNkUwOEQiIGNsYXNzPSJHb2xkU2VjdGlvbiIgc3R5bGU9ImhlaWdodDogMTlweCI+QXJ0IEludmVzdG1lbnQ8L3RkPjwvdHI+PHRyPjx0ZCB2YWxpZ249InRvcCIgYmdjb2xvcj0iI0ZDRjRENiIgc3R5bGU9ImhlaWdodDogMTQwcHgiPjxpbnB1dCB0eXBlPSJjaGVja2JveCIgaWQ9ImNoa1N1YlNlcnY1IiAgbmFtZT0iY2hrU3ViU2VydjUiICAgICAgICAgb25jbGljaz0iamF2YXNjcmlwdDpyZXR1cm4gQ2hlY2tTYW1lQ2hlY2tib3godGhpcywnY2hrU3ViU2VydjUnKTsiICAgICAgIHZhbHVlPSI1Ij5BcnRpc3QgPGJyPjxpbnB1dCB0eXBlPSJjaGVja2JveCIgaWQ9ImNoa1N1YlNlcnY2IiAgbmFtZT0iY2hrU3ViU2VydjYiICAgICAgICAgb25jbGljaz0iamF2YXNjcmlwdDpyZXR1cm4gQ2hlY2tTYW1lQ2hlY2tib3godGhpcywnY2hrU3ViU2VydjYnKTsiICAgICAgIHZhbHVlPSI2Ij5BcnQgR2FsbGVyeSA8YnI+PGlucHV0IHR5cGU9ImNoZWNrYm94IiBpZD0iY2hrU3ViU2VydjciICBuYW1lPSJjaGtTdWJTZXJ2NyIgICAgICAgICBvbmNsaWNrPSJqYXZhc2NyaXB0OnJldHVybiBDaGVja1NhbWVDaGVja2JveCh0aGlzLCdjaGtTdWJTZXJ2NycpOyIgICAgICAgdmFsdWU9IjciPkFydCBDb2xsZWN0b3IgPGJyPjwvdGQ+IDwvdHI+PC90YWJsZT48L3RkPjx0ZCB2YWxpZ249InRvcCIgc3R5bGU9ImhlaWdodDogMTc4cHg7IiB3aWR0aD0iMjAlIj48dGFibGUgd2lkdGg9IjIwOSIgYm9yZGVyPSIwIiBjZWxsc3BhY2luZz0iMCIgY2VsbHBhZGRpbmc9IjAiPjx0cj48dGQgYmdjb2xvcj0iI0Y2RTA4RCIgY2xhc3M9IkdvbGRTZWN0aW9uIiBzdHlsZT0iaGVpZ2h0OiAxOXB4Ij5MaWZlIEluc3VyYW5jZTwvdGQ+PC90cj48dHI+PHRkIHZhbGlnbj0idG9wIiBiZ2NvbG9yPSIjRkNGNEQ2IiBzdHlsZT0iaGVpZ2h0OiAxNDBweCI+PGlucHV0IHR5cGU9ImNoZWNrYm94IiBpZD0iY2hrU3ViU2VydjIzIiAgbmFtZT0iY2hrU3ViU2VydjIzIiAgICAgICAgIG9uY2xpY2s9ImphdmFzY3JpcHQ6cmV0dXJuIENoZWNrU2FtZUNoZWNrYm94KHRoaXMsJ2Noa1N1YlNlcnYyMycpOyIgICAgICAgdmFsdWU9IjIzIj5MaWZlIEluc3VyYW5jZSA8YnI+PGlucHV0IHR5cGU9ImNoZWNrYm94IiBpZD0iY2hrU3ViU2VydjI0IiAgbmFtZT0iY2hrU3ViU2VydjI0IiAgICAgICAgIG9uY2xpY2s9ImphdmFzY3JpcHQ6cmV0dXJuIENoZWNrU2FtZUNoZWNrYm94KHRoaXMsJ2Noa1N1YlNlcnYyNCcpOyIgICAgICAgdmFsdWU9IjI0Ij5NZWRpY2FsIEluc3VyYW5jZSA8YnI+PC90ZD4gPC90cj48L3RhYmxlPjwvdGQ+PHRkIHZhbGlnbj0idG9wIiBzdHlsZT0iaGVpZ2h0OiAxNzhweDsiIHdpZHRoPSIyMCUiPjx0YWJsZSB3aWR0aD0iMjA5IiBib3JkZXI9IjAiIGNlbGxzcGFjaW5nPSIwIiBjZWxscGFkZGluZz0iMCI+PHRyPjx0ZCBiZ2NvbG9yPSIjRjZFMDhEIiBjbGFzcz0iR29sZFNlY3Rpb24iIHN0eWxlPSJoZWlnaHQ6IDE5cHgiPkdlbmVyYWwgSW5zdXJhbmNlPC90ZD48L3RyPjx0cj48dGQgdmFsaWduPSJ0b3AiIGJnY29sb3I9IiNGQ0Y0RDYiIHN0eWxlPSJoZWlnaHQ6IDE0MHB4Ij48aW5wdXQgdHlwZT0iY2hlY2tib3giIGlkPSJjaGtTdWJTZXJ2MjEiICBuYW1lPSJjaGtTdWJTZXJ2MjEiICAgICAgICAgb25jbGljaz0iamF2YXNjcmlwdDpyZXR1cm4gQ2hlY2tTYW1lQ2hlY2tib3godGhpcywnY2hrU3ViU2VydjIxJyk7IiAgICAgICB2YWx1ZT0iMjEiPkF1dG8gSW5zdXJhbmNlIDxicj48aW5wdXQgdHlwZT0iY2hlY2tib3giIGlkPSJjaGtTdWJTZXJ2MjIiICBuYW1lPSJjaGtTdWJTZXJ2MjIiICAgICAgICAgb25jbGljaz0iamF2YXNjcmlwdDpyZXR1cm4gQ2hlY2tTYW1lQ2hlY2tib3godGhpcywnY2hrU3ViU2VydjIyJyk7IiAgICAgICB2YWx1ZT0iMjIiPkFzc2V0IEluc3VyYW5jZSA8YnI+PC90ZD4gPC90cj48L3RhYmxlPjwvdGQ+PC90cj48dHI+PHRkICB3aWR0aD0iMjAlIiBzdHlsZT0iaGVpZ2h0OiAxOXB4Ij4mbmJzcDs8L3RkPjx0ZCAgd2lkdGg9IjIwJSIgc3R5bGU9ImhlaWdodDogMTlweCI+Jm5ic3A7PC90ZD48dGQgIHdpZHRoPSIyMCUiIHN0eWxlPSJoZWlnaHQ6MTlweCI+Jm5ic3A7PC90ZD48dGQgd2lkdGg9IjIwJSIgc3R5bGU9ImhlaWdodDogMTlweCI+Jm5ic3A7PC90ZD48L3RyPiAgPHRyPjx0ZCB2YWxpZ249InRvcCIgc3R5bGU9ImhlaWdodDogMTc4cHg7IiB3aWR0aD0iMjAlIj48dGFibGUgd2lkdGg9IjIwOSIgYm9yZGVyPSIwIiBjZWxsc3BhY2luZz0iMCIgY2VsbHBhZGRpbmc9IjAiPjx0cj48dGQgYmdjb2xvcj0iI0Y2RTA4RCIgY2xhc3M9IkdvbGRTZWN0aW9uIiBzdHlsZT0iaGVpZ2h0OiAxOXB4Ij5GaW5hbmNlIENhcmVlcjwvdGQ+PC90cj48dHI+PHRkIHZhbGlnbj0idG9wIiBiZ2NvbG9yPSIjRkNGNEQ2IiBzdHlsZT0iaGVpZ2h0OiAxNDBweCI+PGlucHV0IHR5cGU9ImNoZWNrYm94IiBpZD0iY2hrU3ViU2VydjQzIiAgbmFtZT0iY2hrU3ViU2VydjQzIiAgICAgICAgIG9uY2xpY2s9ImphdmFzY3JpcHQ6cmV0dXJuIENoZWNrU2FtZUNoZWNrYm94KHRoaXMsJ2Noa1N1YlNlcnY0MycpOyIgICAgICAgdmFsdWU9IjQzIj5Db2xsZWdlcyA8YnI+PGlucHV0IHR5cGU9ImNoZWNrYm94IiBpZD0iY2hrU3ViU2VydjQ0IiAgbmFtZT0iY2hrU3ViU2VydjQ0IiAgICAgICAgIG9uY2xpY2s9ImphdmFzY3JpcHQ6cmV0dXJuIENoZWNrU2FtZUNoZWNrYm94KHRoaXMsJ2Noa1N1YlNlcnY0NCcpOyIgICAgICAgdmFsdWU9IjQ0Ij5Db3Vuc2VsbG9ycyA8YnI+PGlucHV0IHR5cGU9ImNoZWNrYm94IiBpZD0iY2hrU3ViU2VydjQ1IiAgbmFtZT0iY2hrU3ViU2VydjQ1IiAgICAgICAgIG9uY2xpY2s9ImphdmFzY3JpcHQ6cmV0dXJuIENoZWNrU2FtZUNoZWNrYm94KHRoaXMsJ2Noa1N1YlNlcnY0NScpOyIgICAgICAgdmFsdWU9IjQ1Ij5Db3Vyc2VzIDxicj48L3RkPiA8L3RyPjwvdGFibGU+PC90ZD48dGQgdmFsaWduPSJ0b3AiIHN0eWxlPSJoZWlnaHQ6IDE3OHB4OyIgd2lkdGg9IjIwJSI+PHRhYmxlIHdpZHRoPSIyMDkiIGJvcmRlcj0iMCIgY2VsbHNwYWNpbmc9IjAiIGNlbGxwYWRkaW5nPSIwIj48dHI+PHRkIGJnY29sb3I9IiNGNkUwOEQiIGNsYXNzPSJHb2xkU2VjdGlvbiIgc3R5bGU9ImhlaWdodDogMTlweCI+QmlsbCBQYXltZW50czwvdGQ+PC90cj48dHI+PHRkIHZhbGlnbj0idG9wIiBiZ2NvbG9yPSIjRkNGNEQ2IiBzdHlsZT0iaGVpZ2h0OiAxNDBweCI+PGlucHV0IHR5cGU9ImNoZWNrYm94IiBpZD0iY2hrU3ViU2VydjgiICBuYW1lPSJjaGtTdWJTZXJ2OCIgICAgICAgICBvbmNsaWNrPSJqYXZhc2NyaXB0OnJldHVybiBDaGVja1NhbWVDaGVja2JveCh0aGlzLCdjaGtTdWJTZXJ2OCcpOyIgICAgICAgdmFsdWU9IjgiPkJpbGwgUGF5bWVudHMgPGJyPjwvdGQ+IDwvdHI+PC90YWJsZT48L3RkPjx0ZCB2YWxpZ249InRvcCIgc3R5bGU9ImhlaWdodDogMTc4cHg7IiB3aWR0aD0iMjAlIj48dGFibGUgd2lkdGg9IjIwOSIgYm9yZGVyPSIwIiBjZWxsc3BhY2luZz0iMCIgY2VsbHBhZGRpbmc9IjAiPjx0cj48dGQgYmdjb2xvcj0iI0Y2RTA4RCIgY2xhc3M9IkdvbGRTZWN0aW9uIiBzdHlsZT0iaGVpZ2h0OiAxOXB4Ij5SZWFsIEVzdGF0ZTwvdGQ+PC90cj48dHI+PHRkIHZhbGlnbj0idG9wIiBiZ2NvbG9yPSIjRkNGNEQ2IiBzdHlsZT0iaGVpZ2h0OiAxNDBweCI+PGlucHV0IHR5cGU9ImNoZWNrYm94IiBpZD0iY2hrU3ViU2VydjMxIiAgbmFtZT0iY2hrU3ViU2VydjMxIiAgICAgICAgIG9uY2xpY2s9ImphdmFzY3JpcHQ6cmV0dXJuIENoZWNrU2FtZUNoZWNrYm94KHRoaXMsJ2Noa1N1YlNlcnYzMScpOyIgICAgICAgdmFsdWU9IjMxIj5Db25zdHJ1Y3Rpb24gQ28uIDxicj48aW5wdXQgdHlwZT0iY2hlY2tib3giIGlkPSJjaGtTdWJTZXJ2MzIiICBuYW1lPSJjaGtTdWJTZXJ2MzIiICAgICAgICAgb25jbGljaz0iamF2YXNjcmlwdDpyZXR1cm4gQ2hlY2tTYW1lQ2hlY2tib3godGhpcywnY2hrU3ViU2VydjMyJyk7IiAgICAgICB2YWx1ZT0iMzIiPkVzdGF0ZSBBZ2VudCA8YnI+PC90ZD4gPC90cj48L3RhYmxlPjwvdGQ+PHRkIHZhbGlnbj0idG9wIiBzdHlsZT0iaGVpZ2h0OiAxNzhweDsiIHdpZHRoPSIyMCUiPjx0YWJsZSB3aWR0aD0iMjA5IiBib3JkZXI9IjAiIGNlbGxzcGFjaW5nPSIwIiBjZWxscGFkZGluZz0iMCI+PHRyPjx0ZCBiZ2NvbG9yPSIjRjZFMDhEIiBjbGFzcz0iR29sZFNlY3Rpb24iIHN0eWxlPSJoZWlnaHQ6IDE5cHgiPkJhbmtzPC90ZD48L3RyPjx0cj48dGQgdmFsaWduPSJ0b3AiIGJnY29sb3I9IiNGQ0Y0RDYiIHN0eWxlPSJoZWlnaHQ6IDE0MHB4Ij48aW5wdXQgdHlwZT0iY2hlY2tib3giIGlkPSJjaGtTdWJTZXJ2MTUiICBuYW1lPSJjaGtTdWJTZXJ2MTUiICAgICAgICAgb25jbGljaz0iamF2YXNjcmlwdDpyZXR1cm4gQ2hlY2tTYW1lQ2hlY2tib3godGhpcywnY2hrU3ViU2VydjE1Jyk7IiAgICAgICB2YWx1ZT0iMTUiPlBlcnNvbmFsIEJhbmtpbmcgPGJyPjxpbnB1dCB0eXBlPSJjaGVja2JveCIgaWQ9ImNoa1N1YlNlcnYxNiIgIG5hbWU9ImNoa1N1YlNlcnYxNiIgICAgICAgICBvbmNsaWNrPSJqYXZhc2NyaXB0OnJldHVybiBDaGVja1NhbWVDaGVja2JveCh0aGlzLCdjaGtTdWJTZXJ2MTYnKTsiICAgICAgIHZhbHVlPSIxNiI+Q29tbWVyY2lhbCBCYW5rIDxicj48aW5wdXQgdHlwZT0iY2hlY2tib3giIGlkPSJjaGtTdWJTZXJ2NTkiICBuYW1lPSJjaGtTdWJTZXJ2NTkiICAgICAgICAgb25jbGljaz0iamF2YXNjcmlwdDpyZXR1cm4gQ2hlY2tTYW1lQ2hlY2tib3godGhpcywnY2hrU3ViU2VydjU5Jyk7IiAgICAgICB2YWx1ZT0iNTkiPk5SSSBCYW5raW5nIDxicj48L3RkPiA8L3RyPjwvdGFibGU+PC90ZD48L3RyPjx0cj48dGQgIHdpZHRoPSIyMCUiIHN0eWxlPSJoZWlnaHQ6IDE5cHgiPiZuYnNwOzwvdGQ+PHRkICB3aWR0aD0iMjAlIiBzdHlsZT0iaGVpZ2h0OiAxOXB4Ij4mbmJzcDs8L3RkPjx0ZCAgd2lkdGg9IjIwJSIgc3R5bGU9ImhlaWdodDoxOXB4Ij4mbmJzcDs8L3RkPjx0ZCB3aWR0aD0iMjAlIiBzdHlsZT0iaGVpZ2h0OiAxOXB4Ij4mbmJzcDs8L3RkPjwvdHI+ICA8dHI+PHRkIHZhbGlnbj0idG9wIiBzdHlsZT0iaGVpZ2h0OiAxNzhweDsiIHdpZHRoPSIyMCUiPjx0YWJsZSB3aWR0aD0iMjA5IiBib3JkZXI9IjAiIGNlbGxzcGFjaW5nPSIwIiBjZWxscGFkZGluZz0iMCI+PHRyPjx0ZCBiZ2NvbG9yPSIjRjZFMDhEIiBjbGFzcz0iR29sZFNlY3Rpb24iIHN0eWxlPSJoZWlnaHQ6IDE5cHgiPlRheGF0aW9uPC90ZD48L3RyPjx0cj48dGQgdmFsaWduPSJ0b3AiIGJnY29sb3I9IiNGQ0Y0RDYiIHN0eWxlPSJoZWlnaHQ6IDE0MHB4Ij48aW5wdXQgdHlwZT0iY2hlY2tib3giIGlkPSJjaGtTdWJTZXJ2NDYiICBuYW1lPSJjaGtTdWJTZXJ2NDYiICAgICAgICAgb25jbGljaz0iamF2YXNjcmlwdDpyZXR1cm4gQ2hlY2tTYW1lQ2hlY2tib3godGhpcywnY2hrU3ViU2VydjQ2Jyk7IiAgICAgICB2YWx1ZT0iNDYiPkF1ZGl0b3JzIDxicj48aW5wdXQgdHlwZT0iY2hlY2tib3giIGlkPSJjaGtTdWJTZXJ2NDciICBuYW1lPSJjaGtTdWJTZXJ2NDciICAgICAgICAgb25jbGljaz0iamF2YXNjcmlwdDpyZXR1cm4gQ2hlY2tTYW1lQ2hlY2tib3godGhpcywnY2hrU3ViU2VydjQ3Jyk7IiAgICAgICB2YWx1ZT0iNDciPlBhbiBDYXJkIDxicj48aW5wdXQgdHlwZT0iY2hlY2tib3giIGlkPSJjaGtTdWJTZXJ2NDgiICBuYW1lPSJjaGtTdWJTZXJ2NDgiICAgICAgICAgb25jbGljaz0iamF2YXNjcmlwdDpyZXR1cm4gQ2hlY2tTYW1lQ2hlY2tib3godGhpcywnY2hrU3ViU2VydjQ4Jyk7IiAgICAgICB2YWx1ZT0iNDgiPlRheCBSZXR1cm5zIDxicj48aW5wdXQgdHlwZT0iY2hlY2tib3giIGlkPSJjaGtTdWJTZXJ2NTYiICBuYW1lPSJjaGtTdWJTZXJ2NTYiICAgICAgICAgb25jbGljaz0iamF2YXNjcmlwdDpyZXR1cm4gQ2hlY2tTYW1lQ2hlY2tib3godGhpcywnY2hrU3ViU2VydjU2Jyk7IiAgICAgICB2YWx1ZT0iNTYiPkNvbXBhbnkgTWF0dGVycyA8YnI+PC90ZD4gPC90cj48L3RhYmxlPjwvdGQ+PHRkIHZhbGlnbj0idG9wIiBzdHlsZT0iaGVpZ2h0OiAxNzhweDsiIHdpZHRoPSIyMCUiPjx0YWJsZSB3aWR0aD0iMjA5IiBib3JkZXI9IjAiIGNlbGxzcGFjaW5nPSIwIiBjZWxscGFkZGluZz0iMCI+PHRyPjx0ZCBiZ2NvbG9yPSIjRjZFMDhEIiBjbGFzcz0iR29sZFNlY3Rpb24iIHN0eWxlPSJoZWlnaHQ6IDE5cHgiPkNvbW1vZGl0eSBNYXJrZXQ8L3RkPjwvdHI+PHRyPjx0ZCB2YWxpZ249InRvcCIgYmdjb2xvcj0iI0ZDRjRENiIgc3R5bGU9ImhlaWdodDogMTQwcHgiPjxpbnB1dCB0eXBlPSJjaGVja2JveCIgaWQ9ImNoa1N1YlNlcnYzOSIgIG5hbWU9ImNoa1N1YlNlcnYzOSIgICAgICAgICBvbmNsaWNrPSJqYXZhc2NyaXB0OnJldHVybiBDaGVja1NhbWVDaGVja2JveCh0aGlzLCdjaGtTdWJTZXJ2MzknKTsiICAgICAgIHZhbHVlPSIzOSI+TUNYIEJyb2tlcnMgPGJyPjxpbnB1dCB0eXBlPSJjaGVja2JveCIgaWQ9ImNoa1N1YlNlcnY1MCIgIG5hbWU9ImNoa1N1YlNlcnY1MCIgICAgICAgICBvbmNsaWNrPSJqYXZhc2NyaXB0OnJldHVybiBDaGVja1NhbWVDaGVja2JveCh0aGlzLCdjaGtTdWJTZXJ2NTAnKTsiICAgICAgIHZhbHVlPSI1MCI+TkNERVggQnJva2VycyA8YnI+PC90ZD4gPC90cj48L3RhYmxlPjwvdGQ+PHRkIHZhbGlnbj0idG9wIiBzdHlsZT0iaGVpZ2h0OiAxNzhweDsiIHdpZHRoPSIyMCUiPjx0YWJsZSB3aWR0aD0iMjA5IiBib3JkZXI9IjAiIGNlbGxzcGFjaW5nPSIwIiBjZWxscGFkZGluZz0iMCI+PHRyPjx0ZCBiZ2NvbG9yPSIjRjZFMDhEIiBjbGFzcz0iR29sZFNlY3Rpb24iIHN0eWxlPSJoZWlnaHQ6IDE5cHgiPkZpbmFuY2UgSm9iczwvdGQ+PC90cj48dHI+PHRkIHZhbGlnbj0idG9wIiBiZ2NvbG9yPSIjRkNGNEQ2IiBzdHlsZT0iaGVpZ2h0OiAxNDBweCI+PGlucHV0IHR5cGU9ImNoZWNrYm94IiBpZD0iY2hrU3ViU2VydjU1IiAgbmFtZT0iY2hrU3ViU2VydjU1IiAgICAgICAgIG9uY2xpY2s9ImphdmFzY3JpcHQ6cmV0dXJuIENoZWNrU2FtZUNoZWNrYm94KHRoaXMsJ2Noa1N1YlNlcnY1NScpOyIgICAgICAgdmFsdWU9IjU1Ij5QbGFjZW1lbnQgQWdlbmN5IDxicj48L3RkPiA8L3RyPjwvdGFibGU+PC90ZD48dGQgdmFsaWduPSJ0b3AiIHN0eWxlPSJoZWlnaHQ6IDE3OHB4OyIgd2lkdGg9IjIwJSI+PHRhYmxlIHdpZHRoPSIyMDkiIGJvcmRlcj0iMCIgY2VsbHNwYWNpbmc9IjAiIGNlbGxwYWRkaW5nPSIwIj48dHI+PHRkIGJnY29sb3I9IiNGNkUwOEQiIGNsYXNzPSJHb2xkU2VjdGlvbiIgc3R5bGU9ImhlaWdodDogMTlweCI+RmluYW5jaWFsIENvbnN1bHRhbnQ8L3RkPjwvdHI+PHRyPjx0ZCB2YWxpZ249InRvcCIgYmdjb2xvcj0iI0ZDRjRENiIgc3R5bGU9ImhlaWdodDogMTQwcHgiPjxpbnB1dCB0eXBlPSJjaGVja2JveCIgaWQ9ImNoa1N1YlNlcnY5IiAgbmFtZT0iY2hrU3ViU2VydjkiICAgICAgICAgb25jbGljaz0iamF2YXNjcmlwdDpyZXR1cm4gQ2hlY2tTYW1lQ2hlY2tib3godGhpcywnY2hrU3ViU2VydjknKTsiICAgICAgIHZhbHVlPSI5Ij5DRlAgPGJyPjxpbnB1dCB0eXBlPSJjaGVja2JveCIgaWQ9ImNoa1N1YlNlcnY1OCIgIG5hbWU9ImNoa1N1YlNlcnY1OCIgICAgICAgICBvbmNsaWNrPSJqYXZhc2NyaXB0OnJldHVybiBDaGVja1NhbWVDaGVja2JveCh0aGlzLCdjaGtTdWJTZXJ2NTgnKTsiICAgICAgIHZhbHVlPSI1OCI+RmluYW5jaWFsIENvbnN1bHRhbnQgPGJyPjwvdGQ+IDwvdHI+PC90YWJsZT48L3RkPjwvdHI+PHRyPjx0ZCAgd2lkdGg9IjIwJSIgc3R5bGU9ImhlaWdodDogMTlweCI+Jm5ic3A7PC90ZD48dGQgIHdpZHRoPSIyMCUiIHN0eWxlPSJoZWlnaHQ6IDE5cHgiPiZuYnNwOzwvdGQ+PHRkICB3aWR0aD0iMjAlIiBzdHlsZT0iaGVpZ2h0OjE5cHgiPiZuYnNwOzwvdGQ+PHRkIHdpZHRoPSIyMCUiIHN0eWxlPSJoZWlnaHQ6IDE5cHgiPiZuYnNwOzwvdGQ+PC90cj4gIDx0cj48dGQgdmFsaWduPSJ0b3AiIHN0eWxlPSJoZWlnaHQ6IDE3OHB4OyIgd2lkdGg9IjIwJSI+PHRhYmxlIHdpZHRoPSIyMDkiIGJvcmRlcj0iMCIgY2VsbHNwYWNpbmc9IjAiIGNlbGxwYWRkaW5nPSIwIj48dHI+PHRkIGJnY29sb3I9IiNGNkUwOEQiIGNsYXNzPSJHb2xkU2VjdGlvbiIgc3R5bGU9ImhlaWdodDogMTlweCI+TGVnYWw8L3RkPjwvdHI+PHRyPjx0ZCB2YWxpZ249InRvcCIgYmdjb2xvcj0iI0ZDRjRENiIgc3R5bGU9ImhlaWdodDogMTQwcHgiPjxpbnB1dCB0eXBlPSJjaGVja2JveCIgaWQ9ImNoa1N1YlNlcnY3OSIgIG5hbWU9ImNoa1N1YlNlcnY3OSIgICAgICAgICBvbmNsaWNrPSJqYXZhc2NyaXB0OnJldHVybiBDaGVja1NhbWVDaGVja2JveCh0aGlzLCdjaGtTdWJTZXJ2NzknKTsiICAgICAgIHZhbHVlPSI3OSI+UHJvcGVydHkgTGF3IDxicj48aW5wdXQgdHlwZT0iY2hlY2tib3giIGlkPSJjaGtTdWJTZXJ2ODEiICBuYW1lPSJjaGtTdWJTZXJ2ODEiICAgICAgICAgb25jbGljaz0iamF2YXNjcmlwdDpyZXR1cm4gQ2hlY2tTYW1lQ2hlY2tib3godGhpcywnY2hrU3ViU2VydjgxJyk7IiAgICAgICB2YWx1ZT0iODEiPkNvcnBvcmF0ZSBMYXcgPGJyPjxpbnB1dCB0eXBlPSJjaGVja2JveCIgaWQ9ImNoa1N1YlNlcnY4MiIgIG5hbWU9ImNoa1N1YlNlcnY4MiIgICAgICAgICBvbmNsaWNrPSJqYXZhc2NyaXB0OnJldHVybiBDaGVja1NhbWVDaGVja2JveCh0aGlzLCdjaGtTdWJTZXJ2ODInKTsiICAgICAgIHZhbHVlPSI4MiI+Q2l2aWwgU29saWNpdG9ycyA8YnI+PC90ZD4gPC90cj48L3RhYmxlPjwvdGQ+PHRkIHZhbGlnbj0idG9wIiBzdHlsZT0iaGVpZ2h0OiAxNzhweDsiIHdpZHRoPSIyMCUiPjx0YWJsZSB3aWR0aD0iMjA5IiBib3JkZXI9IjAiIGNlbGxzcGFjaW5nPSIwIiBjZWxscGFkZGluZz0iMCI+PHRyPjx0ZCBiZ2NvbG9yPSIjRjZFMDhEIiBjbGFzcz0iR29sZFNlY3Rpb24iIHN0eWxlPSJoZWlnaHQ6IDE5cHgiPkZpbmFuY2lhbCBCb29rczwvdGQ+PC90cj48dHI+PHRkIHZhbGlnbj0idG9wIiBiZ2NvbG9yPSIjRkNGNEQ2IiBzdHlsZT0iaGVpZ2h0OiAxNDBweCI+PGlucHV0IHR5cGU9ImNoZWNrYm94IiBpZD0iY2hrU3ViU2VydjY2IiAgbmFtZT0iY2hrU3ViU2VydjY2IiAgICAgICAgIG9uY2xpY2s9ImphdmFzY3JpcHQ6cmV0dXJuIENoZWNrU2FtZUNoZWNrYm94KHRoaXMsJ2Noa1N1YlNlcnY2NicpOyIgICAgICAgdmFsdWU9IjY2Ij5Cb29rIFN0b3JlcyA8YnI+PGlucHV0IHR5cGU9ImNoZWNrYm94IiBpZD0iY2hrU3ViU2VydjY3IiAgbmFtZT0iY2hrU3ViU2VydjY3IiAgICAgICAgIG9uY2xpY2s9ImphdmFzY3JpcHQ6cmV0dXJuIENoZWNrU2FtZUNoZWNrYm94KHRoaXMsJ2Noa1N1YlNlcnY2NycpOyIgICAgICAgdmFsdWU9IjY3Ij5QdWJsaXNoZXJzIDxicj48L3RkPiA8L3RyPjwvdGFibGU+PC90ZD48dGQgdmFsaWduPSJ0b3AiIHN0eWxlPSJoZWlnaHQ6IDE3OHB4OyIgd2lkdGg9IjIwJSI+PHRhYmxlIHdpZHRoPSIyMDkiIGJvcmRlcj0iMCIgY2VsbHNwYWNpbmc9IjAiIGNlbGxwYWRkaW5nPSIwIj48dHI+PHRkIGJnY29sb3I9IiNGNkUwOEQiIGNsYXNzPSJHb2xkU2VjdGlvbiIgc3R5bGU9ImhlaWdodDogMTlweCI+RmluYW5jaWFsIEluZHVsZ2VuY2U8L3RkPjwvdHI+PHRyPjx0ZCB2YWxpZ249InRvcCIgYmdjb2xvcj0iI0ZDRjRENiIgc3R5bGU9ImhlaWdodDogMTQwcHgiPjxpbnB1dCB0eXBlPSJjaGVja2JveCIgaWQ9ImNoa1N1YlNlcnY3MCIgIG5hbWU9ImNoa1N1YlNlcnY3MCIgICAgICAgICBvbmNsaWNrPSJqYXZhc2NyaXB0OnJldHVybiBDaGVja1NhbWVDaGVja2JveCh0aGlzLCdjaGtTdWJTZXJ2NzAnKTsiICAgICAgIHZhbHVlPSI3MCI+RmluYW5jaWFsIEFzdHJvbG9neSA8YnI+PGlucHV0IHR5cGU9ImNoZWNrYm94IiBpZD0iY2hrU3ViU2VydjcyIiAgbmFtZT0iY2hrU3ViU2VydjcyIiAgICAgICAgIG9uY2xpY2s9ImphdmFzY3JpcHQ6cmV0dXJuIENoZWNrU2FtZUNoZWNrYm94KHRoaXMsJ2Noa1N1YlNlcnY3MicpOyIgICAgICAgdmFsdWU9IjcyIj5MaWZlc3R5bGUgPGJyPjwvdGQ+IDwvdHI+PC90YWJsZT48L3RkPjx0ZCB2YWxpZ249InRvcCIgc3R5bGU9ImhlaWdodDogMTc4cHg7IiB3aWR0aD0iMjAlIj48dGFibGUgd2lkdGg9IjIwOSIgYm9yZGVyPSIwIiBjZWxsc3BhY2luZz0iMCIgY2VsbHBhZGRpbmc9IjAiPjx0cj48dGQgYmdjb2xvcj0iI0Y2RTA4RCIgY2xhc3M9IkdvbGRTZWN0aW9uIiBzdHlsZT0iaGVpZ2h0OiAxOXB4Ij5Gb3JleDwvdGQ+PC90cj48dHI+PHRkIHZhbGlnbj0idG9wIiBiZ2NvbG9yPSIjRkNGNEQ2IiBzdHlsZT0iaGVpZ2h0OiAxNDBweCI+PGlucHV0IHR5cGU9ImNoZWNrYm94IiBpZD0iY2hrU3ViU2VydjY4IiAgbmFtZT0iY2hrU3ViU2VydjY4IiAgICAgICAgIG9uY2xpY2s9ImphdmFzY3JpcHQ6cmV0dXJuIENoZWNrU2FtZUNoZWNrYm94KHRoaXMsJ2Noa1N1YlNlcnY2OCcpOyIgICAgICAgdmFsdWU9IjY4Ij5Gb3JleCBUcmFkaW5nIDxicj48L3RkPiA8L3RyPjwvdGFibGU+PC90ZD48L3RyPjx0cj48dGQgIHdpZHRoPSIyMCUiIHN0eWxlPSJoZWlnaHQ6IDE5cHgiPiZuYnNwOzwvdGQ+PHRkICB3aWR0aD0iMjAlIiBzdHlsZT0iaGVpZ2h0OiAxOXB4Ij4mbmJzcDs8L3RkPjx0ZCAgd2lkdGg9IjIwJSIgc3R5bGU9ImhlaWdodDoxOXB4Ij4mbmJzcDs8L3RkPjx0ZCB3aWR0aD0iMjAlIiBzdHlsZT0iaGVpZ2h0OiAxOXB4Ij4mbmJzcDs8L3RkPjwvdHI+ICA8dHI+PHRkIHZhbGlnbj0idG9wIiBzdHlsZT0iaGVpZ2h0OiAxNzhweDsiIHdpZHRoPSIyMCUiPjx0YWJsZSB3aWR0aD0iMjA5IiBib3JkZXI9IjAiIGNlbGxzcGFjaW5nPSIwIiBjZWxscGFkZGluZz0iMCI+PHRyPjx0ZCBiZ2NvbG9yPSIjRjZFMDhEIiBjbGFzcz0iR29sZFNlY3Rpb24iIHN0eWxlPSJoZWlnaHQ6IDE5cHgiPk5SSTwvdGQ+PC90cj48dHI+PHRkIHZhbGlnbj0idG9wIiBiZ2NvbG9yPSIjRkNGNEQ2IiBzdHlsZT0iaGVpZ2h0OiAxNDBweCI+PGlucHV0IHR5cGU9ImNoZWNrYm94IiBpZD0iY2hrU3ViU2VydjU5IiAgbmFtZT0iY2hrU3ViU2VydjU5IiAgICAgICAgIG9uY2xpY2s9ImphdmFzY3JpcHQ6cmV0dXJuIENoZWNrU2FtZUNoZWNrYm94KHRoaXMsJ2Noa1N1YlNlcnY1OScpOyIgICAgICAgdmFsdWU9IjU5Ij5OUkkgQmFua2luZyA8YnI+PGlucHV0IHR5cGU9ImNoZWNrYm94IiBpZD0iY2hrU3ViU2VydjYwIiAgbmFtZT0iY2hrU3ViU2VydjYwIiAgICAgICAgIG9uY2xpY2s9ImphdmFzY3JpcHQ6cmV0dXJuIENoZWNrU2FtZUNoZWNrYm94KHRoaXMsJ2Noa1N1YlNlcnY2MCcpOyIgICAgICAgdmFsdWU9IjYwIj5DYXBpdGFsIE1hcmtldHMgPGJyPjxpbnB1dCB0eXBlPSJjaGVja2JveCIgaWQ9ImNoa1N1YlNlcnY2MiIgIG5hbWU9ImNoa1N1YlNlcnY2MiIgICAgICAgICBvbmNsaWNrPSJqYXZhc2NyaXB0OnJldHVybiBDaGVja1NhbWVDaGVja2JveCh0aGlzLCdjaGtTdWJTZXJ2NjInKTsiICAgICAgIHZhbHVlPSI2MiI+VGF4IENvbnN1bHRhbnRzIDxicj48L3RkPiA8L3RyPjwvdGFibGU+PC90ZD48dGQgdmFsaWduPSJ0b3AiIHN0eWxlPSJoZWlnaHQ6IDE3OHB4OyIgd2lkdGg9IjIwJSI+PHRhYmxlIHdpZHRoPSIyMDkiIGJvcmRlcj0iMCIgY2VsbHNwYWNpbmc9IjAiIGNlbGxwYWRkaW5nPSIwIj48dHI+PHRkIGJnY29sb3I9IiNGNkUwOEQiIGNsYXNzPSJHb2xkU2VjdGlvbiIgc3R5bGU9ImhlaWdodDogMTlweCI+RmluYW5jaWFsIFRvb2xzPC90ZD48L3RyPjx0cj48dGQgdmFsaWduPSJ0b3AiIGJnY29sb3I9IiNGQ0Y0RDYiIHN0eWxlPSJoZWlnaHQ6IDE0MHB4Ij48aW5wdXQgdHlwZT0iY2hlY2tib3giIGlkPSJjaGtTdWJTZXJ2ODUiICBuYW1lPSJjaGtTdWJTZXJ2ODUiICAgICAgICAgb25jbGljaz0iamF2YXNjcmlwdDpyZXR1cm4gQ2hlY2tTYW1lQ2hlY2tib3godGhpcywnY2hrU3ViU2Vydjg1Jyk7IiAgICAgICB2YWx1ZT0iODUiPkZpbmFuY2lhbCBIYXJkd2FyZSA8YnI+PGlucHV0IHR5cGU9ImNoZWNrYm94IiBpZD0iY2hrU3ViU2Vydjg2IiAgbmFtZT0iY2hrU3ViU2Vydjg2IiAgICAgICAgIG9uY2xpY2s9ImphdmFzY3JpcHQ6cmV0dXJuIENoZWNrU2FtZUNoZWNrYm94KHRoaXMsJ2Noa1N1YlNlcnY4NicpOyIgICAgICAgdmFsdWU9Ijg2Ij5GaW5hbmNpYWwgU29mdHdhcmUgPGJyPjwvdGQ+IDwvdHI+PC90YWJsZT48L3RkPjx0ZCB2YWxpZ249InRvcCIgc3R5bGU9ImhlaWdodDogMTc4cHgiIHdpZHRoPSIyMCUiID4gICZuYnNwOzwvdGQ+PHRkIHZhbGlnbj0idG9wIiBzdHlsZT0iaGVpZ2h0OiAxNzhweCIgd2lkdGg9IjIwJSIgPiAgJm5ic3A7PC90ZD48L3RyPjx0cj48dGQgIHdpZHRoPSIyMCUiIHN0eWxlPSJoZWlnaHQ6IDE5cHgiPiZuYnNwOzwvdGQ+PHRkICB3aWR0aD0iMjAlIiBzdHlsZT0iaGVpZ2h0OiAxOXB4Ij4mbmJzcDs8L3RkPjx0ZCAgd2lkdGg9IjIwJSIgc3R5bGU9ImhlaWdodDoxOXB4Ij4mbmJzcDs8L3RkPjx0ZCB3aWR0aD0iMjAlIiBzdHlsZT0iaGVpZ2h0OiAxOXB4Ij4mbmJzcDs8L3RkPjwvdHI+PC90YWJsZT5kAgoPFgIfAAU9PGlucHV0IHR5cGU9ImhpZGRlbiIgaWQ9ImhpZENpdHlJZHMiIHZhbHVlPSIxLDYsNSwzLDgsMTYsMiIgPmQCCw8WAh8ABTA8aW5wdXQgdHlwZT0iaGlkZGVuIiBpZD0iaGlkVG90Q2l0eSIgdmFsdWU9IjEiID5kAgwPFgIfAAXDATxpbnB1dCB0eXBlPSJoaWRkZW4iIGlkPSJoaWRTdWJTZXJ2SWQiIHZhbHVlPSIzLDI2LDI3LDI4LDI5LDMwLDEwLDE0LDMzLDM1LDM4LDg5LDQwLDUzLDUsNiw3LDIzLDI0LDIxLDIyLDQzLDQ0LDQ1LDgsMzEsMzIsMTUsMTYsNTksNDYsNDcsNDgsNTYsMzksNTAsNTUsOSw1OCw3OSw4MSw4Miw2Niw2Nyw3MCw3Miw2OCw2MCw2Miw4NSw4NiIgPmQCDQ8WAh8ABTU8aW5wdXQgdHlwZT0iaGlkZGVuIiBpZD0iaGlkVG90U3ViU2VydklkIiB2YWx1ZT0iMCIgPmQYAQUeX19Db250cm9sc1JlcXVpcmVQb3N0QmFja0tleV9fFgIFJE1KX0hlYWRlckNvbnRyb2wxJE1KX01lbnUxJGltZ1NlYXJjaAUMSW1hZ2VCdXR0b24xf+ggEsr7lgyyVZ4vtz+LV2YHlyY=" />
</div>

<script type="text/javascript">
//<![CDATA[
var theForm = document.forms['form1'];
if (!theForm) {
    theForm = document.form1;
}
function __doPostBack(eventTarget, eventArgument) {
    if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
        theForm.__EVENTTARGET.value = eventTarget;
        theForm.__EVENTARGUMENT.value = eventArgument;
        theForm.submit();
    }
}
//]]>
</script>


<script src="/WebResource.axd?d=iNTIScGvOmPyZxm6gTboOw2&amp;t=633828978592718649" type="text/javascript"></script>


<script src="/WebResource.axd?d=dfTdkivJuXviSYs8YtWFoDD24Tqso_XnJttMGHOK3Is1&amp;t=633828978592718649" type="text/javascript"></script>
<script type="text/javascript">
//<![CDATA[
function WebForm_OnSubmit() {
if (typeof(ValidatorOnSubmit) == "function" && ValidatorOnSubmit() == false) return false;javascript:return Validate();
return true;
}
//]]>
</script>

<div>

	<input type="hidden" name="__EVENTVALIDATION" id="__EVENTVALIDATION" value="/wEWAwKH1fCEAgKl08O0DALSwpnTCByZezYwny47buia0FFK9QL7K+mF" />
</div>
        <!-- Start PopUp -->
        <a style="z-index: 225; display: none; position: absolute; background-color: transparent;"
            id="n2SPopClickGrab"></a>
        <div style="display: none;">
            

 <!-- Start PopUp CSS -->
    <link href="popup/n2CoreLibs-n2v1-57871.css" type="text/css" rel="stylesheet" />
    <link href="popup/Default_Sheet.css" type="text/css" rel="stylesheet" />
    <link href="css/screen1.css" rel="stylesheet" type="text/css" />
    <link href="css/redbox.css" media="screen" rel="stylesheet" type="text/css">
    <!-- End PopUp CSS -->
    <style type="text/css">
<!--
.style1 {	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 11px;
}
-->
</style>

<script language="javascript" type="text/javascript" src="http://www.moneyjugglers.com/JS/AjaxJavaScript.js"></script>
<div id="all-categories1">
<div id="CategoryPopUp1_divcontent" style="border:1px solid #DA6F22; border-collapse:collapse; padding: 12px; width: 250px; background:#fff;">                                
									  
<table border="0" width="100%">
	  <tr>
		<td valign="top" style="width: 114px">            
            <div id="MJ_PopUp1_lblBodyLeftUp"><table border="0"> <tr>  <td style="width: 77px"><a href="Kolkata.aspx" class="sublink">Kolkata</a></td> </tr></table></div>
		</td>
		<td style="width: 102px">			
			<div id="MJ_PopUp1_lblBodyRightUp"><table border="0"></table></div>		
		</td>				
	  </tr>
	  
  	  <tr>
	  	<td style="width: 114px;">	  	    
	  	    <div id="MJ_PopUp1_lblBodyLeftDown"><table border="0"></table></div>
		</td>
		<td style="width: 102px;">		    
		    <div id="MJ_PopUp1_lblBodyRightDown"><table border="0"></table></div>
		</td>
	  </tr>
	<tr>
	  	<td align="center" colspan="2" class="comsoon"><div id="MJ_PopUp1_divCommSoonHead">Coming Soon</div></td>
	  </tr>
	    <tr>
		<td valign="top" style="width: 114px">
          
            <div id="MJ_PopUp1_lblBodyLeftUpCS"><table border="0"><tr>  <td style="width: 77px" class="sublinkpop" >Ahmedabad</td></tr><tr>  <td style="width: 77px" class="sublinkpop" >Bangalore</td></tr><tr>  <td style="width: 77px" class="sublinkpop" >Chennai</td></tr><tr>  <td style="width: 77px" class="sublinkpop" >Hyderabad</td></tr></table></div>
		</td>
		<td style="width: 102px">
			
			<div id="MJ_PopUp1_lblBodyRightUpCS"><table border="0"> <tr>  <td style="width: 77px"  class="sublinkpop">Mumbai</td> </tr> <tr>  <td style="width: 77px"  class="sublinkpop">New Delhi</td> </tr></table></div>		
		</td>				
	  </tr>
	  
  	  <tr>
	  	<td style="width: 114px;">
	  	   
	  	    <div id="MJ_PopUp1_lblBodyLeftDownCS"><table border="0"><table border="0"></table></div>
		</td>
		<td style="width: 102px;">
		   
		    <div id="MJ_PopUp1_lblBodyRightDownCS"><table border="0"><table border="0"></table></div>
		</td>
	  </tr>
  </table>    
									  
	 
	</div>
  </div>
  
  
        </div>

        <script src="http://www.moneyjugglers.com/popup/popup.js" type="text/javascript"></script>

        <script src="http://www.moneyjugglers.com/popup/popup2.js" type="text/javascript"></script>

        <!-- End PopUp -->
        <!-- Start PopUp -->
        <a style="z-index: 225; display: none; position: absolute; background-color: transparent;"
            id="A1"></a>
        <div style="display: none;">
        </div>

        <script src="http://www.moneyjugglers.com/popup/popup.js" type="text/javascript"></script>

        <script src="http://www.moneyjugglers.com/popup/popup2.js" type="text/javascript"></script>

        

<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#DF7427">
  <tr>
    <td width="141" bgcolor="#FDB138"><img src="http://www.moneyjugglers.com/Pictures/MJ-Logo.gif" alt="Money jugglers" width="141" height="150" /></td>
    <td width="84%" align="left" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="58%" align="left" valign="top"><img src="http://www.moneyjugglers.com/Pictures/MJ-Logotext.gif" alt="MoneyJugglers"  title="MoneyJugglers" width="391" height="119" /></td>
        <td width="42%" align="right" valign="top">
        

<script type="text/javascript">
AC_FL_RunContent( 'width','328','height','119','codebase','http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0','pluginspage','http://www.macromedia.com/go/getflashplayer','quality','high','src','Pictures/MJheader','movie','Pictures/MJheader','wmode','transparent' ); //end AC code
</script><noscript>
   <object width="328" height="119" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000">
   <param value="Pictures/MJheader.swf" name="movie"/>
   <param value="high" name="quality"/>
   <param value="transparent" name="wmode"/>
   <embed width="328" height="119" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" quality="high" src="Pictures/MJheader.swf"/>
   </object></noscript>
          
        </td>
      </tr>
      <tr>
        <td height="31" colspan="2" align="left" valign="top" style="background:url(http://www.moneyjugglers.com/Pictures/header_navBg.gif) repeat-x 0 0;">
		
<script language="javascript" type="text/javascript" src="http://www.moneyjugglers.com/JS/PopUp_JScript.js"></script>

<div id="navigation-wrapper">
	<div id="navT">
	
	<ul>
	
	    <li><a href="http://www.moneyjugglers.com/" class="home"></a></li>	
	
	
	
		<li><a href="#" name="two-tabs|he|all-categories1" title="View All Cities" id="two-tabs|he|all-categories1" class="cities"></a></li>
	
		
	    <li><a href="http://www.moneyjugglers.com/aboutus.aspx" class="aboutus"></a></li>
			
	    <li><a href="http://www.moneyjugglers.com/contactus.aspx" class="contactus"></a></li>
	
      <li><span id="div1"><a href="#" title="Login" onClick="showpopup();" class="login"></a></span></li>
      
    	<li><a href="http://www.moneyjugglers.com/infomine.aspx" class="infomine">Infomine</a></li>
    
	    <li><a href="http://www.moneyjugglers.com/whatsnew.aspx" class="whatsnew">What's New</a></li>
	
	
		
	</ul>
	<ul class="navTsearch">
    <li>
      <span id="MJ_HeaderControl1_MJ_Menu1_cv" style="color:Red;visibility:hidden;"></span>
        <input id="txtSearch" name="txtSearch" type="text" class="searchtxt"/>
  		<input type="image" name="MJ_HeaderControl1$MJ_Menu1$imgSearch" id="MJ_HeaderControl1_MJ_Menu1_imgSearch" title="Go" class="searchBtn" src="http://www.moneyjugglers.com/Pictures/search_btn.gif" onclick="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;MJ_HeaderControl1$MJ_Menu1$imgSearch&quot;, &quot;&quot;, true, &quot;VGSearchButton&quot;, &quot;&quot;, false, false))" style="height:18px;width:56px;border-width:0px;" />
    </li>
   </ul>
</div>
</div>
<br class="clearNav" />


<div id="diva" style="display:none">
<div id="showimage" style="position:absolute; width:250px; left:29%; top:135px; background-color:#ffffff; z-index:10000;">

<table border="1" width="250" cellspacing="0" cellpadding="2" style="border:solid 1px #DA6F22;">
  <tr>
    <td width="100%">
    <table border="0" width="100%" cellspacing="0" cellpadding="0" height="36px">
      <tr>
        <td id="dragbar" style="cursor:hand; cursor:pointer; background-color:#ffffff; height: 16px;" align="center" width="100%" onmousedown="initializedrag(event)"><ilayer width="100%" onSelectStart="return false"><layer width="100%" onmouseover="dragswitch=1;if (ns4) drag_dropns(showimage)" onmouseout="dragswitch=0"><font face="Verdana"
        color="#333"><strong><small>Login</small></strong></font></layer></ilayer></td>
        <td style="cursor:hand; height: 16px;">
        <a href="#" onclick="hidebox();return false">
        <img src="http://www.moneyjugglers.com/Pictures/close.gif" width="16px" height="14px" border="0" alt="Close" title="Close"/>
        </a></td>
      </tr>
      <tr>
        <td width="100%" bgcolor="#FFFFFF" style="padding:4px" colspan="2">

<!-- PUT YOUR CONTENT BETWEEN HERE -->

<table border="0" width="100%">
    <tr>
    	<td style="height: 100px">
        <div class="Login"> User Name 
        <span>
             <input name="textfield" id="textfield" type="text" class="textBox" size="16"/>
        </span> 
        </div>
        <div class="Login"> Password 
        <span class="Loginbox_spacing">
             <input name="textfield2" id="textfield2" type="password" class="textBox" size="16" onkeydown="if(event.keyCode==13){functionSignUp(document.getElementById('textfield').value,document.getElementById('textfield2').value);}"/>
        </span> 
        </div>
        <div class="Login" id="displayError" style="color:red;"></div>            
        <br class="TDHeight8"/>
        <p class="login_button_padding">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="#" onclick="functionSignUp(document.getElementById('textfield').value,document.getElementById('textfield2').value);"><img src="http://www.moneyjugglers.com/Pictures/Submit.gif" width="60" height="19" align="absmiddle"  border="0" ></a>
        </p>
            <input id="hiddenValue" name="hiddenValue" type="hidden" />
        <br class="TDHeight8"/>
        <span><a href="http://www.moneyjugglers.com/Forgotpassword.aspx" class="ForgetPass">Forgot Password</a> |  <a href="http://www.moneyjugglers.com/SignUp.aspx" class="SignUpPad">New User Sign up</a> </span>
        </td>
	</tr>
  </table> 

<!-- END YOUR CONTENT HERE -->

</td>
      </tr>
    </table>
    </td>
  </tr>
</table>
</div>
</div>
		</td>
        </tr>
    </table></td>
  </tr>
</table>

<script src="http://www.moneyjugglers.com/JS/AC_RunActiveContent.js" type="text/javascript"></script>




      

        
        <!-- End Logo -->
        <!-- Start Header Nav -->
        <!-- End Header Nav -->
        <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td valign="top" class="ShortDesc">
                    <div align="justify">
                        <span class="AboutMJ">Steps to follow –<br />
                        </span>&nbsp;&nbsp;&nbsp;&nbsp;1. The package selected by you is displayed below.<br />
                        &nbsp;&nbsp;&nbsp;&nbsp;2. Select city/cities as per your package requirement in
                        which you want to offer the services.<br />
                        &nbsp;&nbsp;&nbsp;&nbsp;3. For multi-city packages, please note that the services
                        selected will remain same for the chosen set of cities.<br />
                        &nbsp;&nbsp;&nbsp;&nbsp;4. Now select the services as per your package by ticking
                        in the box next to the services.<br />
                        &nbsp;&nbsp;&nbsp;&nbsp;5. Submit after selecting the services by clicking on the
                        Submit button.
                    </div>
                </td>
            </tr>
            <tr class="TDHeight8">
                <td valign="top">
                    &nbsp;</td>
            </tr>
            <tr>
                <td valign="top">
                    <div id="divCity">
                        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="DashedTable">
                            <tr class="AboutBody">
                                <td colspan="3" bgcolor="#FFB538" style="height: 20px">
                                    <div id="divPkgDet1" align="center"><span class="Orange11"><strong>Package:</strong></span> <span class="GoldSection"></span> - 0 Services in 1 City. </div></div>
                                </td>
                            </tr>
                            <tr class="ShortDesc">
                                <td colspan="3">
                                    &nbsp;</td>
                            </tr>
                            <tr class="ShortDesc">
                                <td colspan="3">
                                    <div align="center">
                                        Please choose the cities from the list below.
                                    </div>
                                </td>
                            </tr>
                            <tr class="ShortDesc">
                                <td colspan="3" class="ShortDesc" style="height: 13px">
                                    <div id="divError1" align="center">
                                        &nbsp;</div>
                                </td>
                            </tr>
                            <tr class="ShortDesc">
                                <td width="4%" class="ShortDesc" style="height: 73px">
                                    &nbsp;</td>
                                <td colspan="2" class="ShortDesc" style="height: 73px">
                                    <div id="divCityList"><table width="300" border="0" cellspacing="0" cellpadding="0"><tr><td width="50%"><input type="checkbox" name="chkCity1"  id="chkCity1"     value="1|Kolkata" class="inputbox"><strong>Kolkata</strong></td><td width="50%"><input type="checkbox" name="chkCity6"  id="chkCity6"     value="6|Chennai" class="inputbox"><strong>Chennai</strong></td></tr><tr><td width="50%"><input type="checkbox"  name="chkCity5"   id="chkCity5"       value="5|Bangalore" class="inputbox"><strong>Bangalore</strong></td><td width="50%"><input type="checkbox" name="chkCity3"  id="chkCity3"     value="3|New Delhi" class="inputbox"><strong>New Delhi</strong></td></tr><tr><td width="50%"><input type="checkbox"  name="chkCity8"   id="chkCity8"       value="8|Hyderabad" class="inputbox"><strong>Hyderabad</strong></td><td width="50%"><input type="checkbox" name="chkCity16"  id="chkCity16"     value="16|Ahmedabad" class="inputbox"><strong>Ahmedabad</strong></td></tr><tr><td width="50%"><input type="checkbox"  name="chkCity2"   id="chkCity2"       value="2|Mumbai" class="inputbox"><strong>Mumbai</strong></td><td width="50%">&nbsp;</td></tr></table></div>
                                </td>
                            </tr>
                            <tr class="ShortDesc">
                                <td class="ShortDesc" style="height: 13px;">
                                    &nbsp;</td>
                                <td class="ShortDesc" style="height: 13px">
                                    &nbsp;</td>
                                <td width="61%" class="ShortDesc" style="height: 13px">
                                    &nbsp;</td>
                            </tr>
                            <tr class="ShortDesc">
                                <td class="ShortDesc" style="height: 13px;">
                                    &nbsp;</td>
                                <td width="35%" class="ShortDesc" style="height: 13px">
                                    &nbsp;</td>
                                <td class="ShortDesc" style="height: 13px">
                                    &nbsp;</td>
                            </tr>
                            <tr class="ShortDesc">
                                <td class="ShortDesc">
                                    &nbsp;</td>
                                <td class="ShortDesc">
                                    <a href="#" onclick="javascript:return GetCity();">
                                        <img src="Pictures/Submit.jpg" width="105" height="40" border="0" id="IMG1" language="javascript"></a></td>
                                <td class="ShortDesc">
                                    &nbsp;</td>
                            </tr>
                            <tr class="ShortDesc">
                                <td colspan="3" class="ShortDesc">
                                    &nbsp;</td>
                            </tr>
                            <tr class="ShortDesc">
                                <td colspan="3" class="ShortDesc">
                                    &nbsp;</td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <div id="divForServices" style="display: none;">
                        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="ShortDesc">
                            <tr class="AboutBody">
                                <td height="20" colspan="6" bgcolor="#F6E08D">
                                    <div id="divPkgDet2" align="center"><span class="Orange11"><strong>Package:</strong></span> <span class="GoldSection"></span> - 0 Services in 1 City. </div></div>
                                </td>
                            </tr>
                            <tr class="ShortDesc">
                                <td colspan="6">
                                    &nbsp;</td>
                            </tr>
                            <tr class="ShortDesc">
                                <td colspan="6" class="ShortDesc" style="height: 19px">
                                    <div id="divHead">
                                        
                                    </div>
                                </td>
                            </tr>
                            <tr class="ShortDesc">
                                <td colspan="6" class="ShortDesc" style="height: 19px">
                                    <div id="divError" align="center">
                                        &nbsp;</div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="6" class="Tab_headerF" style="height: 19px">
                                    <div id="divText">Please select the 0 Services in 1 City. </div></div>
                                </td>
                            </tr>
                            <tr class="ShortDesc">
                                <td width="4%" class="ShortDesc" style="height: 19px">
                                    &nbsp;</td>
                                <td width="20%" class="ShortDesc" style="height: 19px">
                                    &nbsp;</td>
                                <td colspan="4" class="ShortDesc" style="height: 19px">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="6" style="height: 235px">
                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="ShortDesc">
                                        <tr class="ShortDesc">
                                            <td class="ShortDesc">
                                                &nbsp;</td>
                                            <td>
                                                <div id="divServiceList"><table width="836" border="0" align="center" cellpadding="0" cellspacing="0"><tr><td valign="top" style="height: 178px;" width="20%"><table width="209" border="0" cellspacing="0" cellpadding="0"><tr><td bgcolor="#F6E08D" class="GoldSection" style="height: 19px">Mutual Funds</td></tr><tr><td valign="top" bgcolor="#FCF4D6" style="height: 140px"><input type="checkbox" id="chkSubServ3"  name="chkSubServ3"         onclick="javascript:return CheckSameCheckbox(this,'chkSubServ3');"       value="3">Fund Distributors <br></td> </tr></table></td><td valign="top" style="height: 178px;" width="20%"><table width="209" border="0" cellspacing="0" cellpadding="0"><tr><td bgcolor="#F6E08D" class="GoldSection" style="height: 19px">Loans</td></tr><tr><td valign="top" bgcolor="#FCF4D6" style="height: 140px"><input type="checkbox" id="chkSubServ26"  name="chkSubServ26"         onclick="javascript:return CheckSameCheckbox(this,'chkSubServ26');"       value="26">Home Loan <br><input type="checkbox" id="chkSubServ27"  name="chkSubServ27"         onclick="javascript:return CheckSameCheckbox(this,'chkSubServ27');"       value="27">Auto Loan <br><input type="checkbox" id="chkSubServ28"  name="chkSubServ28"         onclick="javascript:return CheckSameCheckbox(this,'chkSubServ28');"       value="28">Personal Loan <br><input type="checkbox" id="chkSubServ29"  name="chkSubServ29"         onclick="javascript:return CheckSameCheckbox(this,'chkSubServ29');"       value="29">Educational Loan <br><input type="checkbox" id="chkSubServ30"  name="chkSubServ30"         onclick="javascript:return CheckSameCheckbox(this,'chkSubServ30');"       value="30">Business Loan <br></td> </tr></table></td><td valign="top" style="height: 178px;" width="20%"><table width="209" border="0" cellspacing="0" cellpadding="0"><tr><td bgcolor="#F6E08D" class="GoldSection" style="height: 19px">Credit Cards</td></tr><tr><td valign="top" bgcolor="#FCF4D6" style="height: 140px"><input type="checkbox" id="chkSubServ10"  name="chkSubServ10"         onclick="javascript:return CheckSameCheckbox(this,'chkSubServ10');"       value="10">Credit Cards <br></td> </tr></table></td><td valign="top" style="height: 178px;" width="20%"><table width="209" border="0" cellspacing="0" cellpadding="0"><tr><td bgcolor="#F6E08D" class="GoldSection" style="height: 19px">Equity Market</td></tr><tr><td valign="top" bgcolor="#FCF4D6" style="height: 140px"><input type="checkbox" id="chkSubServ14"  name="chkSubServ14"         onclick="javascript:return CheckSameCheckbox(this,'chkSubServ14');"       value="14">Depositories <br><input type="checkbox" id="chkSubServ33"  name="chkSubServ33"         onclick="javascript:return CheckSameCheckbox(this,'chkSubServ33');"       value="33">Brokers <br><input type="checkbox" id="chkSubServ35"  name="chkSubServ35"         onclick="javascript:return CheckSameCheckbox(this,'chkSubServ35');"       value="35">Internet Trading <br><input type="checkbox" id="chkSubServ38"  name="chkSubServ38"         onclick="javascript:return CheckSameCheckbox(this,'chkSubServ38');"       value="38">PMS <br><input type="checkbox" id="chkSubServ89"  name="chkSubServ89"         onclick="javascript:return CheckSameCheckbox(this,'chkSubServ89');"       value="89">IPO <br></td> </tr></table></td></tr><tr><td  width="20%" style="height: 19px">&nbsp;</td><td  width="20%" style="height: 19px">&nbsp;</td><td  width="20%" style="height:19px">&nbsp;</td><td width="20%" style="height: 19px">&nbsp;</td></tr>  <tr><td valign="top" style="height: 178px;" width="20%"><table width="209" border="0" cellspacing="0" cellpadding="0"><tr><td bgcolor="#F6E08D" class="GoldSection" style="height: 19px">Financial Analyst</td></tr><tr><td valign="top" bgcolor="#FCF4D6" style="height: 140px"><input type="checkbox" id="chkSubServ40"  name="chkSubServ40"         onclick="javascript:return CheckSameCheckbox(this,'chkSubServ40');"       value="40">Technical Equity <br><input type="checkbox" id="chkSubServ53"  name="chkSubServ53"         onclick="javascript:return CheckSameCheckbox(this,'chkSubServ53');"       value="53">Fundamental Analyst <br></td> </tr></table></td><td valign="top" style="height: 178px;" width="20%"><table width="209" border="0" cellspacing="0" cellpadding="0"><tr><td bgcolor="#F6E08D" class="GoldSection" style="height: 19px">Art Investment</td></tr><tr><td valign="top" bgcolor="#FCF4D6" style="height: 140px"><input type="checkbox" id="chkSubServ5"  name="chkSubServ5"         onclick="javascript:return CheckSameCheckbox(this,'chkSubServ5');"       value="5">Artist <br><input type="checkbox" id="chkSubServ6"  name="chkSubServ6"         onclick="javascript:return CheckSameCheckbox(this,'chkSubServ6');"       value="6">Art Gallery <br><input type="checkbox" id="chkSubServ7"  name="chkSubServ7"         onclick="javascript:return CheckSameCheckbox(this,'chkSubServ7');"       value="7">Art Collector <br></td> </tr></table></td><td valign="top" style="height: 178px;" width="20%"><table width="209" border="0" cellspacing="0" cellpadding="0"><tr><td bgcolor="#F6E08D" class="GoldSection" style="height: 19px">Life Insurance</td></tr><tr><td valign="top" bgcolor="#FCF4D6" style="height: 140px"><input type="checkbox" id="chkSubServ23"  name="chkSubServ23"         onclick="javascript:return CheckSameCheckbox(this,'chkSubServ23');"       value="23">Life Insurance <br><input type="checkbox" id="chkSubServ24"  name="chkSubServ24"         onclick="javascript:return CheckSameCheckbox(this,'chkSubServ24');"       value="24">Medical Insurance <br></td> </tr></table></td><td valign="top" style="height: 178px;" width="20%"><table width="209" border="0" cellspacing="0" cellpadding="0"><tr><td bgcolor="#F6E08D" class="GoldSection" style="height: 19px">General Insurance</td></tr><tr><td valign="top" bgcolor="#FCF4D6" style="height: 140px"><input type="checkbox" id="chkSubServ21"  name="chkSubServ21"         onclick="javascript:return CheckSameCheckbox(this,'chkSubServ21');"       value="21">Auto Insurance <br><input type="checkbox" id="chkSubServ22"  name="chkSubServ22"         onclick="javascript:return CheckSameCheckbox(this,'chkSubServ22');"       value="22">Asset Insurance <br></td> </tr></table></td></tr><tr><td  width="20%" style="height: 19px">&nbsp;</td><td  width="20%" style="height: 19px">&nbsp;</td><td  width="20%" style="height:19px">&nbsp;</td><td width="20%" style="height: 19px">&nbsp;</td></tr>  <tr><td valign="top" style="height: 178px;" width="20%"><table width="209" border="0" cellspacing="0" cellpadding="0"><tr><td bgcolor="#F6E08D" class="GoldSection" style="height: 19px">Finance Career</td></tr><tr><td valign="top" bgcolor="#FCF4D6" style="height: 140px"><input type="checkbox" id="chkSubServ43"  name="chkSubServ43"         onclick="javascript:return CheckSameCheckbox(this,'chkSubServ43');"       value="43">Colleges <br><input type="checkbox" id="chkSubServ44"  name="chkSubServ44"         onclick="javascript:return CheckSameCheckbox(this,'chkSubServ44');"       value="44">Counsellors <br><input type="checkbox" id="chkSubServ45"  name="chkSubServ45"         onclick="javascript:return CheckSameCheckbox(this,'chkSubServ45');"       value="45">Courses <br></td> </tr></table></td><td valign="top" style="height: 178px;" width="20%"><table width="209" border="0" cellspacing="0" cellpadding="0"><tr><td bgcolor="#F6E08D" class="GoldSection" style="height: 19px">Bill Payments</td></tr><tr><td valign="top" bgcolor="#FCF4D6" style="height: 140px"><input type="checkbox" id="chkSubServ8"  name="chkSubServ8"         onclick="javascript:return CheckSameCheckbox(this,'chkSubServ8');"       value="8">Bill Payments <br></td> </tr></table></td><td valign="top" style="height: 178px;" width="20%"><table width="209" border="0" cellspacing="0" cellpadding="0"><tr><td bgcolor="#F6E08D" class="GoldSection" style="height: 19px">Real Estate</td></tr><tr><td valign="top" bgcolor="#FCF4D6" style="height: 140px"><input type="checkbox" id="chkSubServ31"  name="chkSubServ31"         onclick="javascript:return CheckSameCheckbox(this,'chkSubServ31');"       value="31">Construction Co. <br><input type="checkbox" id="chkSubServ32"  name="chkSubServ32"         onclick="javascript:return CheckSameCheckbox(this,'chkSubServ32');"       value="32">Estate Agent <br></td> </tr></table></td><td valign="top" style="height: 178px;" width="20%"><table width="209" border="0" cellspacing="0" cellpadding="0"><tr><td bgcolor="#F6E08D" class="GoldSection" style="height: 19px">Banks</td></tr><tr><td valign="top" bgcolor="#FCF4D6" style="height: 140px"><input type="checkbox" id="chkSubServ15"  name="chkSubServ15"         onclick="javascript:return CheckSameCheckbox(this,'chkSubServ15');"       value="15">Personal Banking <br><input type="checkbox" id="chkSubServ16"  name="chkSubServ16"         onclick="javascript:return CheckSameCheckbox(this,'chkSubServ16');"       value="16">Commercial Bank <br><input type="checkbox" id="chkSubServ59"  name="chkSubServ59"         onclick="javascript:return CheckSameCheckbox(this,'chkSubServ59');"       value="59">NRI Banking <br></td> </tr></table></td></tr><tr><td  width="20%" style="height: 19px">&nbsp;</td><td  width="20%" style="height: 19px">&nbsp;</td><td  width="20%" style="height:19px">&nbsp;</td><td width="20%" style="height: 19px">&nbsp;</td></tr>  <tr><td valign="top" style="height: 178px;" width="20%"><table width="209" border="0" cellspacing="0" cellpadding="0"><tr><td bgcolor="#F6E08D" class="GoldSection" style="height: 19px">Taxation</td></tr><tr><td valign="top" bgcolor="#FCF4D6" style="height: 140px"><input type="checkbox" id="chkSubServ46"  name="chkSubServ46"         onclick="javascript:return CheckSameCheckbox(this,'chkSubServ46');"       value="46">Auditors <br><input type="checkbox" id="chkSubServ47"  name="chkSubServ47"         onclick="javascript:return CheckSameCheckbox(this,'chkSubServ47');"       value="47">Pan Card <br><input type="checkbox" id="chkSubServ48"  name="chkSubServ48"         onclick="javascript:return CheckSameCheckbox(this,'chkSubServ48');"       value="48">Tax Returns <br><input type="checkbox" id="chkSubServ56"  name="chkSubServ56"         onclick="javascript:return CheckSameCheckbox(this,'chkSubServ56');"       value="56">Company Matters <br></td> </tr></table></td><td valign="top" style="height: 178px;" width="20%"><table width="209" border="0" cellspacing="0" cellpadding="0"><tr><td bgcolor="#F6E08D" class="GoldSection" style="height: 19px">Commodity Market</td></tr><tr><td valign="top" bgcolor="#FCF4D6" style="height: 140px"><input type="checkbox" id="chkSubServ39"  name="chkSubServ39"         onclick="javascript:return CheckSameCheckbox(this,'chkSubServ39');"       value="39">MCX Brokers <br><input type="checkbox" id="chkSubServ50"  name="chkSubServ50"         onclick="javascript:return CheckSameCheckbox(this,'chkSubServ50');"       value="50">NCDEX Brokers <br></td> </tr></table></td><td valign="top" style="height: 178px;" width="20%"><table width="209" border="0" cellspacing="0" cellpadding="0"><tr><td bgcolor="#F6E08D" class="GoldSection" style="height: 19px">Finance Jobs</td></tr><tr><td valign="top" bgcolor="#FCF4D6" style="height: 140px"><input type="checkbox" id="chkSubServ55"  name="chkSubServ55"         onclick="javascript:return CheckSameCheckbox(this,'chkSubServ55');"       value="55">Placement Agency <br></td> </tr></table></td><td valign="top" style="height: 178px;" width="20%"><table width="209" border="0" cellspacing="0" cellpadding="0"><tr><td bgcolor="#F6E08D" class="GoldSection" style="height: 19px">Financial Consultant</td></tr><tr><td valign="top" bgcolor="#FCF4D6" style="height: 140px"><input type="checkbox" id="chkSubServ9"  name="chkSubServ9"         onclick="javascript:return CheckSameCheckbox(this,'chkSubServ9');"       value="9">CFP <br><input type="checkbox" id="chkSubServ58"  name="chkSubServ58"         onclick="javascript:return CheckSameCheckbox(this,'chkSubServ58');"       value="58">Financial Consultant <br></td> </tr></table></td></tr><tr><td  width="20%" style="height: 19px">&nbsp;</td><td  width="20%" style="height: 19px">&nbsp;</td><td  width="20%" style="height:19px">&nbsp;</td><td width="20%" style="height: 19px">&nbsp;</td></tr>  <tr><td valign="top" style="height: 178px;" width="20%"><table width="209" border="0" cellspacing="0" cellpadding="0"><tr><td bgcolor="#F6E08D" class="GoldSection" style="height: 19px">Legal</td></tr><tr><td valign="top" bgcolor="#FCF4D6" style="height: 140px"><input type="checkbox" id="chkSubServ79"  name="chkSubServ79"         onclick="javascript:return CheckSameCheckbox(this,'chkSubServ79');"       value="79">Property Law <br><input type="checkbox" id="chkSubServ81"  name="chkSubServ81"         onclick="javascript:return CheckSameCheckbox(this,'chkSubServ81');"       value="81">Corporate Law <br><input type="checkbox" id="chkSubServ82"  name="chkSubServ82"         onclick="javascript:return CheckSameCheckbox(this,'chkSubServ82');"       value="82">Civil Solicitors <br></td> </tr></table></td><td valign="top" style="height: 178px;" width="20%"><table width="209" border="0" cellspacing="0" cellpadding="0"><tr><td bgcolor="#F6E08D" class="GoldSection" style="height: 19px">Financial Books</td></tr><tr><td valign="top" bgcolor="#FCF4D6" style="height: 140px"><input type="checkbox" id="chkSubServ66"  name="chkSubServ66"         onclick="javascript:return CheckSameCheckbox(this,'chkSubServ66');"       value="66">Book Stores <br><input type="checkbox" id="chkSubServ67"  name="chkSubServ67"         onclick="javascript:return CheckSameCheckbox(this,'chkSubServ67');"       value="67">Publishers <br></td> </tr></table></td><td valign="top" style="height: 178px;" width="20%"><table width="209" border="0" cellspacing="0" cellpadding="0"><tr><td bgcolor="#F6E08D" class="GoldSection" style="height: 19px">Financial Indulgence</td></tr><tr><td valign="top" bgcolor="#FCF4D6" style="height: 140px"><input type="checkbox" id="chkSubServ70"  name="chkSubServ70"         onclick="javascript:return CheckSameCheckbox(this,'chkSubServ70');"       value="70">Financial Astrology <br><input type="checkbox" id="chkSubServ72"  name="chkSubServ72"         onclick="javascript:return CheckSameCheckbox(this,'chkSubServ72');"       value="72">Lifestyle <br></td> </tr></table></td><td valign="top" style="height: 178px;" width="20%"><table width="209" border="0" cellspacing="0" cellpadding="0"><tr><td bgcolor="#F6E08D" class="GoldSection" style="height: 19px">Forex</td></tr><tr><td valign="top" bgcolor="#FCF4D6" style="height: 140px"><input type="checkbox" id="chkSubServ68"  name="chkSubServ68"         onclick="javascript:return CheckSameCheckbox(this,'chkSubServ68');"       value="68">Forex Trading <br></td> </tr></table></td></tr><tr><td  width="20%" style="height: 19px">&nbsp;</td><td  width="20%" style="height: 19px">&nbsp;</td><td  width="20%" style="height:19px">&nbsp;</td><td width="20%" style="height: 19px">&nbsp;</td></tr>  <tr><td valign="top" style="height: 178px;" width="20%"><table width="209" border="0" cellspacing="0" cellpadding="0"><tr><td bgcolor="#F6E08D" class="GoldSection" style="height: 19px">NRI</td></tr><tr><td valign="top" bgcolor="#FCF4D6" style="height: 140px"><input type="checkbox" id="chkSubServ59"  name="chkSubServ59"         onclick="javascript:return CheckSameCheckbox(this,'chkSubServ59');"       value="59">NRI Banking <br><input type="checkbox" id="chkSubServ60"  name="chkSubServ60"         onclick="javascript:return CheckSameCheckbox(this,'chkSubServ60');"       value="60">Capital Markets <br><input type="checkbox" id="chkSubServ62"  name="chkSubServ62"         onclick="javascript:return CheckSameCheckbox(this,'chkSubServ62');"       value="62">Tax Consultants <br></td> </tr></table></td><td valign="top" style="height: 178px;" width="20%"><table width="209" border="0" cellspacing="0" cellpadding="0"><tr><td bgcolor="#F6E08D" class="GoldSection" style="height: 19px">Financial Tools</td></tr><tr><td valign="top" bgcolor="#FCF4D6" style="height: 140px"><input type="checkbox" id="chkSubServ85"  name="chkSubServ85"         onclick="javascript:return CheckSameCheckbox(this,'chkSubServ85');"       value="85">Financial Hardware <br><input type="checkbox" id="chkSubServ86"  name="chkSubServ86"         onclick="javascript:return CheckSameCheckbox(this,'chkSubServ86');"       value="86">Financial Software <br></td> </tr></table></td><td valign="top" style="height: 178px" width="20%" >  &nbsp;</td><td valign="top" style="height: 178px" width="20%" >  &nbsp;</td></tr><tr><td  width="20%" style="height: 19px">&nbsp;</td><td  width="20%" style="height: 19px">&nbsp;</td><td  width="20%" style="height:19px">&nbsp;</td><td width="20%" style="height: 19px">&nbsp;</td></tr></table></div>
                                            </td>
                                            <td class="GoldSection">
                                                &nbsp;</td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr class="ShortDesc">
                                <td colspan="6" class="ShortDesc">
                                    &nbsp;</td>
                            </tr>
                            <tr class="ShortDesc">
                                <td colspan="6" class="ShortDesc" style="height: 40px">
                                    <div align="center">
                                        <input type="image" name="ImageButton1" id="ImageButton1" src="Pictures/Submit.jpg" style="border-width:0px;" />
                                    </div>
                                </td>
                            </tr>
                            <tr class="ShortDesc">
                                <td colspan="6" class="ShortDesc" style="height: 13px">
                                    &nbsp;</td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
        </table>
        <div id="divhidCityId"><input type="hidden" id="hidCityIds" value="1,6,5,3,8,16,2" ></div>
        <div id="divTotCity"><input type="hidden" id="hidTotCity" value="1" ></div>
        <div id="divhidSubServId"><input type="hidden" id="hidSubServId" value="3,26,27,28,29,30,10,14,33,35,38,89,40,53,5,6,7,23,24,21,22,43,44,45,8,31,32,15,16,59,46,47,48,56,39,50,55,9,58,79,81,82,66,67,70,72,68,60,62,85,86" ></div>
        <div id="divTotSubServId"><input type="hidden" id="hidTotSubServId" value="0" ></div>
    
<script type="text/javascript">
//<![CDATA[
var Page_Validators =  new Array(document.getElementById("MJ_HeaderControl1_MJ_Menu1_cv"));
//]]>
</script>

<script type="text/javascript">
//<![CDATA[
var MJ_HeaderControl1_MJ_Menu1_cv = document.all ? document.all["MJ_HeaderControl1_MJ_Menu1_cv"] : document.getElementById("MJ_HeaderControl1_MJ_Menu1_cv");
MJ_HeaderControl1_MJ_Menu1_cv.validationGroup = "VGSearchButton";
MJ_HeaderControl1_MJ_Menu1_cv.evaluationfunction = "CustomValidatorEvaluateIsValid";
MJ_HeaderControl1_MJ_Menu1_cv.clientvalidationfunction = "BlockSearcgEvent";
//]]>
</script>

<script type="text/javascript">
//<![CDATA[

var Page_ValidationActive = false;
if (typeof(ValidatorOnLoad) == "function") {
    ValidatorOnLoad();
}

function ValidatorOnSubmit() {
    if (Page_ValidationActive) {
        return ValidatorCommonOnSubmit();
    }
    else {
        return true;
    }
}
        //]]>
</script>
</form>
</body>
</html>
