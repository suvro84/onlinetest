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

function handleResponseRating()
{
    if(http.readyState==4)
    { 
        var response=http.responseText;
        var update=new Array();
        if(response.indexOf('|' != -1))
        { 
            update=response.split("|");
//            alert(update[0]);
//            alert(update[1]);
           // alert(update[2]);
            if(update[0]=="MyMoneyJugglers.aspx")
            {
                //window.location.href=update[0];
//                alert('hi');
                document.getElementById("divExpert").innerHTML ="";  
                alert("Your rating is successfully inserted.")
              
                document.getElementById("divExpert").innerHTML =update[1]; 
            }
            else
            {
                alert(update[0]);
            }
        }
    }
}

function InsertRating(Value,expertId,id)
{      
    var response=confirm("You are going to rate with "+Value+". Are you sure?");
    if(response==true)
    {
        http.open("GET","AjaxThird.aspx?mode=rating&value="+Value+"&ExpertId="+expertId+"&Id="+id+"");
        http.onreadystatechange=handleResponseRating;
        http.send(null);
    }
}


//function InsertUserRating_ServiceConsultant(Value,expertId,id)
//{      
//    var response=confirm("You are going to rate with "+Value+". Are you sure?");
//    if(response==true)
//    {
//        http.open("GET","AjaxThird.aspx?mode=rating_ServiceConsultant&value="+Value+"&ExpertId="+expertId+"&Id="+id+"");
//        
//        http.onreadystatechange=handleResponseRating;
//        http.send(null);
//    }
//}

function InsertUserRating_ServiceConsultant(Value)
{      
    var response=confirm("You are going to rate with "+Value+". Are you sure?");
    var expert_id=document.getElementById("hdexpert_id").value;
    if(response==true)
    {
        http.open("GET","AjaxPage.aspx?mode=rating_ServiceConsultant&value="+Value+"&expert_id="+expert_id);
        
        http.onreadystatechange=handleResponseRating;
        http.send(null);
    }
}

