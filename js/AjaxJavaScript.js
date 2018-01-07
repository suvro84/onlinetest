function createRequestObject()
{
    var object;
    var browser=navigator.appName;
    if(browser=="Microsoft Internet Explorer")
    {
        object=new ActiveXObject("Microsoft.XMLHTTP");
    }
    else
    {
        object=new XMLHttpRequest()
    }
    return object;
}

var http=createRequestObject();

function handleResponse()
{
    if(http.readyState==4)
    {
    
        document.getElementById("displayError").innerHTML = "";
        var response=http.responseText;
        var update=new Array();
        if(response.indexOf('|' != -1))
        {            
            
            update=response.split("|");
            
            
       
        if(update[0]=="Error")
        {
          document.getElementById("displayError").innerHTML = update[1];
          var objerror=document.getElementById("displayErrorLogOutPage");
          if(objerror) 
          {
            document.getElementById("displayErrorLogOutPage").innerHTML = update[1];
          }
        }
        if(update[0]=="Success")
        {
	   //alert(update[1]);
           window.location.href=update[1];
	   if(document.getElementById("divSignOut"))
	   {	
           	document.getElementById("divSignOut").innerHTML = "<a href=\"#\" onClick=\"functionSignOut();\">SignOut</a>";   
	   }
	   if(document.getElementById("LoginBody"))
	   {	
             document.getElementById("LoginBody").style.display="none";
	   }
           //alert(update[1]);
           //window.location.href=update[1];
        }
            
        }
    }
}

function functionSignUp(username,password)
{    

    var obj= document.getElementById("HiddSSSC");
   if(obj)
   {
      if(obj.value=="SSSC")
      {
       // alert("yes hidden");
       // alert("Username="+username+" and  pass="+password);
        http.open("GET","ajaxpage.aspx?mode=login&type=2&un="+username+"&pwd="+password+"&r="+Math.random()+"");
        http.onreadystatechange=handleResponseSpecial;
        http.send(null);
      }
      else
      {
        http.open("GET","ajaxpage.aspx?mode=login&type=1&un="+username+"&pwd="+password+"&r="+Math.random()+"");
        http.onreadystatechange=handleResponse;
        http.send(null);
      }
   
   }
   else
   {
    // alert("no hidden");
     http.open("GET","ajaxpage.aspx?mode=login&type=1&un="+username+"&pwd="+password+"&r="+Math.random()+"");
     http.onreadystatechange=handleResponse;
     http.send(null);
    }
}



function functionSignOut()
{
    http.open("GET","ajaxpage.aspx?mode=signout&r="+Math.random()+"");
    http.onreadystatechange=handleResponseSignOut;
    http.send(null);
	//window.location="Default.aspx";
	//window.location.href="http://www.moneyjugglers.com/LoggedOut.aspx";
}

function handleResponseSignOut()
{
    if(document.getElementById("divSignOut"))
    {
        document.getElementById("divSignOut").innerHTML = "<a href=\"#\" name=\"two-tabs|he|all-categories12\" title=\"Login\" class=\"HeaderNav\" id=\"two-tabs|he|all-categories12\">Login</a>";   
    }
    if(http.readyState == 4) 
    {  
        var response = http.responseText;
        var update = new Array();
                        
        if(response.indexOf('|' != -1)) 
        {         
           update = response.split("|");
           window.location.href="http://www.moneyjugglers.com/LoggedOut.aspx";
        }
    }      
    
}

function Response()
{
    if(http.readyState < 4) 
    {
     document.getElementById("ImgLoading").innerHTML ="<img src=\"Pictures/Loading.gif\" border=\"0\">";
    }
    if(http.readyState == 4) 
    {
       document.getElementById("ImgLoading").innerHTML ="";
       
        var response = http.responseText;
        var update = new Array();
        
        if(response.indexOf('|' != -1)) 
        {
         
           update = response.split("|");
           var div="divSubServ"+String(update[1]);
           document.getElementById(div).innerHTML =update[0]; 
            
        }
    }
}
function Response1()
{
     if(http.readyState < 4) 
     {
        document.getElementById("ImgLoading").innerHTML ="<img src=\"Pictures/Loading.gif\" border=\"0\">";
     }
    if(http.readyState == 4) 
    {
      document.getElementById("ImgLoading").innerHTML ="";
       
      
       
        var response = http.responseText;
        var update = new Array();
        
        if(response.indexOf('|' != -1)) 
        {
         
           update = response.split("|");
           document.getElementById("divServiceDet").innerHTML =update[0]; 
           document.getElementById("divCityname").innerHTML ="<input type=\"hidden\" id=\"hiddCityName\" name=\"hiddCityName\" value=\""+update[1]+"\" >";
           
            
        }
    }
}

function PopulateSubServDDL(ServiceId,CityID,divid)
{
    
     http.open("GET", "ajaxPageSecond.aspx?id="+ServiceId+"&cityid="+CityID+"&divID="+divid+"&r=" + Math.random());
     http.onreadystatechange = Response;
     http.send(null);
}

function PopulateServDDL(CityID)
{
   
     var No=document.getElementById("ServNo").value;
     http.open("GET", "AjaxThird.aspx?id="+CityID+"&no="+No+"&r=" + Math.random());
     http.onreadystatechange = Response1;
     http.send(null);
}
function Go(Page,ID)
{

    var val=parseInt(document.getElementById("hidden1").value);
  //  alert(val);
    val=val+1;
    //alert(val);
   // document.getElementById("divHidden").innerHTML="<input type=\"hidden\" id=\"hidden1\" name=\"hidden1\" value=\""+String(value+1)+"\"/>";
   
    window.location.href=Page+"?hid="+val+"&Id="+ID;

}
function AjaxCityService(PkgId,LoginId,OrderId)
{
     http.open("GET", "AjaxThird.aspx?mode=CityService&OrdId="+OrderId+"&PkgId="+PkgId+"&LoginId="+LoginId+"&r=" + Math.random());
     http.onreadystatechange = Response2;
     http.send(null);
}

function Response2()
{
     if(http.readyState < 4) 
     {
        document.getElementById("ImgLoading").style.display="block";
        document.getElementById("ImgLoading").innerHTML ="<img src=\"Pictures/Loading.gif\" border=\"0\">";
     }
    if(http.readyState == 4) 
    {
      document.getElementById("ImgLoading").innerHTML ="";
       var response = http.responseText;
        var update = new Array();
        
        if(response.indexOf('|' != -1)) 
        {
           update = response.split("|");
          // alert(update[0]);
           var obj=document.getElementById("divCityService");
           obj.style.display="block";
           document.getElementById("divCityService").innerHTML =update[0]; 
        }
    }
}
function AjaxExpertDet(LoginId,ExpertId,PageName,id)
{
     http.open("GET", "AjaxThird.aspx?mode=ExpertDetails&LoginId="+LoginId+"&ExpertId="+ExpertId+"&pagename="+PageName+"&Id="+id+"&r=" + Math.random());
     http.onreadystatechange = ResponseExpert;
     http.send(null);
}
function ResponseExpert()
{
     if(http.readyState < 4) 
     {

        document.getElementById("divExpert").style.display="block";
        document.getElementById("divExpert").innerHTML ="<img src=\"Pictures/Loading.gif\" border=\"0\">";
     }
    if(http.readyState == 4) 
    {

       document.getElementById("divExpert").innerHTML ="";
       var response = http.responseText;
        var update = new Array();
        
        if(response.indexOf('|' != -1)) 
        {
           update = response.split("|");
        
           var obj=document.getElementById("divExpert");
           obj.style.display="block";
           document.getElementById("divExpert").innerHTML =update[0]; 
        }
    }
}

function AjaxRatingDet(LoginId,ExpertId,PageName,id)
{
     http.open("GET", "AjaxThird.aspx?mode=RatingDetails&LoginId="+LoginId+"&ExpertId="+ExpertId+"&pagename="+PageName+"&Id="+id+"&r=" + Math.random());
     http.onreadystatechange = ResponseRating;
     http.send(null);
}
function ResponseRating()
{
     if(http.readyState < 4) 
     {

        document.getElementById("divExpertDetails").style.display="block";
        document.getElementById("divExpertDetails").innerHTML ="<img src=\"Pictures/Loading.gif\" border=\"0\">";
     }
    if(http.readyState == 4) 
    {

       document.getElementById("divExpertDetails").innerHTML ="";
       var response = http.responseText;
        var update = new Array();
        
        if(response.indexOf('|' != -1)) 
        {
           update = response.split("|");
        
           var obj=document.getElementById("divExpertDetails");
           obj.style.display="block";
           document.getElementById("divExpertDetails").innerHTML =update[0]; 
        }
    }
}
function handleResponseSpecial()
{
    if(http.readyState==4)
    {
        document.getElementById("displayError").innerHTML = "";
        var response=http.responseText;
        //alert(response);
        var update=new Array();
        var fullurl=new Array();
		var fullurl1=new Array();
		var modurl="";
        if(response.indexOf('|' != -1))
        {            
            update=response.split("|");
             //alert("update[0]"+update[0]);
              
            fullurl=parent.document.URL.split("/");  
            if(parent.document.URL.indexOf('#')>-1)
            {
			    fullurl1=parent.document.URL.split("#");  
			    modurl=fullurl1[0];
			}
			else
			{
			//alert("fullURL"+fullurl);
			    //fullurl1=parent.document.URL;
			    //fullurl1[0]==parent.document.URL;
			    modurl=parent.document.URL;
			}
            //alert(parent.document.URL);
            if(update[0]=="Error")
            {            
                document.getElementById("displayError").innerHTML = "UserName & Password does not match";
                var objerror=document.getElementById("displayErrorLogOutPage");
                if(objerror) 
                {
                  document.getElementById("displayErrorLogOutPage").innerHTML = "UserName & Password does not match";
                }                 
            }
            else
            {    
                //document.getElementById("divSignOut").innerHTML = "<a href=\"#\" onClick=\"functionSignOut();\">SignOut</a>";   
                //document.getElementById("LoginBody").style.visibility='hidden';
                //document.getElementById("divLoginBodyCSSPage").style.display="none";                
                //document.getElementById("LoginBody").style.display="none"; 
//http://www.moneyjugglers.com/Service/SubService/generalinsurance/autoinsurance/Kolkata.aspx                                           
                if(fullurl.length>=(fullurl.length-1))
                {
                document.getElementById("divLoginBodyCSSPage").style.display="none";                
                //document.getElementById("divLoginBodyCSSPage").style.visibility='hidden';
                  
                   //alert("update[0]="+update[0]);
                    if(update[0]=="8")
                    {
						//alert(fullurl1[0]);
                        //document.getElementById("package").style.display="block";   
						window.location.href=modurl;
						//window.location="GoldSelection.aspx"; 
                    }
                    if(update[0]=="7" && update[1]=="selyes")
                    {                        
                        //alert("yes");
                        //alert("yes"+parent.document.URL);
                        window.location.href=modurl;
                        //document.getElementById("divprovider").style.display="block"; 
                        //document.getElementById("package").style.display="none";   
                        //window.location="GoldSelection.aspx";                       
                    }
                    if(update[0]=="7" && update[1]=="selno")
                    {                
                        //alert("no");        
                        window.location.href=modurl;
                        document.getElementById("divtopup").style.display="block"; 
                        document.getElementById("package").style.display="none";
                        document.getElementById("divprovider").style.display="none";    
                        //window.location="GoldSelection.aspx";                       
                    }
                    if(update[0]=="5")
                    { 
                        window.location.href="http://www.moneyjugglers.com/"+update[1];
                    }

		    if(update[0]=="9")
                    { 
                        window.location.href="http://www.moneyjugglers.com/"+update[1];
                    }     
                }
            }
        }
    }
}

function colorChange(id)
{
document.getElementById(id).style.backgroundColor="#FFCD37";
}
function colorSet(id)
{
document.getElementById(id).style.backgroundColor="#FFEEBB";
}


function CheckAvailability()
{
    var objUname= document.getElementById("txtUserName"); 

     if(objUname!=null)
     {
       
       var varUname=objUname.value;
       if(varUname!="")
       {
           http.open("GET", "AjaxThird.aspx?mode=ChkUsrAvlblity&UserName="+varUname+"&r=" + Math.random());
           http.onreadystatechange = ResponseCheckAvailability;
           http.send(null);
       }
       else
       {
         alert("User Name cannot be left blank.");
         return false;
       }
     }

}

function ResponseCheckAvailability()
{
    
        if(http.readyState == 4) 
        {
               var response = http.responseText;
               var update = new Array();
            
                if(response.indexOf('|' != -1)) 
                {
                 
                        update = response.split("|");
                        var objDiv=document.getElementById("divAvailableMsg");
                        if(objDiv!=null)
                        {
                              if(update[0]!="")
                              {
                               objDiv.style.display="block";
                               objDiv.innerHTML =update[0]; 
                              }
                              else
                              {
                               objDiv.style.display="none";
                              }
                        }
                    
                }
        }
        
}

function UserCityServiceSelection()
{
//http://www.moneyjugglers.com/UserPackageSelection.aspx?status=pending&OrderNo=90 
//http://www.moneyjugglers.com/UserPackageSelection.aspx?OrderNo=310# 
       var fullurl=new Array(); 
       var varOrderNo="";
       fullurl=parent.document.URL.split("=");
       if(fullurl.length>2)
       {
            varOrderNo=fullurl[2];
       }
       else
       {
            var fullurlorder=new Array();
            fullurlorder=fullurl[1].split("#");
            varOrderNo=fullurlorder[0];
       }  
       var objcity=document.getElementById("ddlCity");
       if(objcity!=null)
       {
         if(objcity.value!="")
         {
          // alert("city="+objcity.value);
           
           http.open("GET","ajaxpage.aspx?mode=PackageCityService&cityId="+objcity.value+"&OrderNo="+varOrderNo+"&r="+Math.random()+"");
           http.onreadystatechange=handleResponseCityService;
           http.send(null);
         }
         else
         {
           alert("You have not selected any City.");
           return false;
         }
       }
       else
        {
           alert("There is no city list.");
           return false;
        }
       
   
}


function handleResponseCityService()
{
   
        if(http.readyState < 4) 
        {
               document.getElementById("divImgLoad").style.display="block";
            
        }
        
        if(http.readyState == 4) 
        {
               var response = http.responseText;
               var update = new Array();
            
                if(response.indexOf('|' != -1)) 
                {
                      update = response.split("|");
                      if((update[0]!="")&&(update[1]!="")&&(update[2]!=""))
                      {
                         document.getElementById("divImgLoad").style.display="none";
                         document.getElementById("divForServices").style.display="block";
                         document.getElementById("divHead").innerHTML=update[0];
                        
                         document.getElementById("divServiceList").innerHTML=update[2];
                        if((update[2].indexOf("There are no service available currently against the selected city.  Please select another City.")== -1)&&(update[2].indexOf("You have logged out, please login again.")== -1)) 
                         {
                          document.getElementById("divText").innerHTML=update[1];
                          document.getElementById("divImgbtn").style.display="block";
                         }
                         else
                         {
                          document.getElementById("divText").innerHTML="";
                          document.getElementById("divImgbtn").style.display="none";
                         }
                         
                       
                      }
                    

                }
        }
        
        
}

function functionForContactUs()
{
    var varmobilenum="";
    var varname=document.getElementById("lblName").innerHTML;
    var varemail=document.getElementById("lblEmail").innerHTML;
    var varcontactnum=document.getElementById("lblPhNo").innerHTML;
    if(document.getElementById("lblConMobile"))
    {
        varmobilenum=document.getElementById("lblConMobile").innerHTML;
    }
    var varquery=document.getElementById("txtQuery").value;  
    
    http.open("GET","AjaxThird.aspx?mode=MyMjContactUs&name="+varname+"&email="+varemail+"&contactnum="+varcontactnum+"&mobilenum="+varmobilenum+"&query="+varquery+"&r="+Math.random()+"");
    http.onreadystatechange=handleResponseContactUs;
    http.send(null);
}

function handleResponseContactUs()
{
    if(http.readyState == 4) 
    {
        var response = http.responseText;
        var update = new Array();
         
        if(response.indexOf('|' != -1)) 
        {
            update = response.split("|");
            document.getElementById("divContactUsBefore").style.display="none";
            document.getElementById("divContactUsAfter").style.display="block";
        }
    }       
}

//function GetCityListFromMap(varStateId,varCountryId)
//{
//    http.open("GET","AjaxThird.aspx?mode=CityListFromMap&StateId="+varStateId+"&CountryId="+varCountryId+"&r="+Math.random()+"");
//    http.onreadystatechange=handleResponseCityListFromMap;
//    http.send(null);

//}

//function handleResponseCityListFromMap()
//{
//            if(http.readyState < 4) 
//            {
//                          if(document.getElementById("divCityList")!=null)
//                          {
//                            document.getElementById("divCityList").innerHTML="<img src=\"Pictures/loading.gif\" border=\"0\" >";
//                          
//                          }
//            }
//            if(http.readyState == 4) 
//            {
//                        var response = http.responseText;
//                        var update = new Array();
//                         
//                        if(response.indexOf('|' != -1)) 
//                        {
//                                    update = response.split("|");
//                                  
//                                   if(update.length>0)
//                                   {
//                                              if(document.getElementById("divCityList")!=null)
//                                              {
//                                                document.getElementById("divCityList").innerHTML="";
//                                                document.getElementById("divCityList").innerHTML=update[0];
//                                              
//                                              }
//                                   }
//                                   else
//                                   {
//                                              if(document.getElementById("divCityList")!=null)
//                                              {
//                                                document.getElementById("divCityList").innerHTML="";
//                                                document.getElementById("divCityList").innerHTML="No Data Available";
//                                              
//                                              }
//                                   
//                                   }
//                          
//                        }
//            }       
//}


function GetCityListFromMapNew(varStateId,varCountryId)
{

   
       for(var i=1;i<=45;i++)
       {
              var objid="CityList"+String(i)
              if(document.getElementById(objid)!=null)
              {
                       
                        if(varStateId==i)
                        {
                          document.getElementById(objid).style.display="block";
                        }
                        else
                        {
                          document.getElementById(objid).style.display="none";
                        
                        }
              }
              
       }

}

function CompletePayment(orderid,amount,invoiceno,packageid)
{
    http.open("GET","ajaxpage.aspx?mode=completepayment&orderid="+orderid+"&amount="+amount+"&invoiceno="+invoiceno+"&r="+Math.random()+"");
    http.onreadystatechange=function()
    {
        if(http.readyState == 4) 
        {  
            var response = http.responseText;
            var update = new Array();
                            
            if(response.indexOf('|' != -1)) 
            {         
               update = response.split("|");
               if(update[0]=="Success")
               {
                    window.location.href="http://www.moneyjugglers.com/ExpertPay/"+packageid+".aspx";
                    //document.getElementById("divCompletePaymentError").innerHTML="http://www.moneyjugglers.com/ExpertPay.aspx";
               }
               else
               {
                    document.getElementById("divCompletePaymentError").innerHTML="Some Error Occure. Contact to Moneyjugglers.com";
               }
            }
        } 
    }
    http.send(null);
}
