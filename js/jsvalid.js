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

   