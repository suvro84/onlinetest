//////////
//START FETCH QUERYSTRING VALUE FROM URL ///////////////////////
//////////
var qrStr = window.location.search;
var spQrStr = qrStr.substring(1);
var arrQrStr = new Array();
var arr = spQrStr.split('&');

for (var i=0;i<arr.length;i++)
{    
    var index = arr[i].indexOf('=');
    var key = arr[i].substring(0,index);
    var val = arr[i].substring(index+1);
    
    arrQrStr[key] = val;
}
//////////
//END FETCH QUERYSTRING VALUE FROM URL ///////////////////////
//////////

var chatContent = replaceAll(arrQrStr["message"],'%20'," ").replace('and',"&");
//document.getElementById("tdiv").innerHTML = "<p><span class='visitorName'>" + arrQrStr["vname"].replace("%20"," ") + " :</span> <span class='msg'>" + chatContent + "</span></p>";

//////////
//START////////  STRING REPLACE ALL FUNCTION   /////////////////////
/////////
function replaceAll(oldStr,findStr,repStr) {
  var srchNdx = 0;  // srchNdx will keep track of where in the whole line
                    // of oldStr are we searching.
  var newStr = "";  // newStr will hold the altered version of oldStr.
  while (oldStr.indexOf(findStr,srchNdx) != -1)  
                    // As long as there are strings to replace, this loop
                    // will run. 
  {
    newStr += oldStr.substring(srchNdx,oldStr.indexOf(findStr,srchNdx));
                    // Put it all the unaltered text from one findStr to
                    // the next findStr into newStr.
    newStr += repStr;
                    // Instead of putting the old string, put in the
                    // new string instead. 
    srchNdx = (oldStr.indexOf(findStr,srchNdx) + findStr.length);
                    // Now jump to the next chunk of text till the next findStr.           
  }
  newStr += oldStr.substring(srchNdx,oldStr.length);
                    // Put whatever's left into newStr.             
  return newStr;
}
//////////
//END////////  STRING REPLACE ALL FUNCTION   /////////////////////
//////////

//////////
//START////////  CALL TIMER FUNCTION   /////////////////////
//////////
var ScrollPosition;
var interval; 
var landingTime = new Date();
interval=setInterval("ProcessStart(landingTime);",3000);

function ProcessStart(time)
{     	
  	var sessiontimeout = 1000; 
	var newTime = new Date();     
    var tDiff = (newTime - landingTime) / 1000; 
        
    if ((sessiontimeout == 0) || (sessiontimeout > tDiff)) 
    {
        VisitorChatWindow1.mainProcess(
        arrQrStr["cid"],
        arrQrStr["sessionid"],        
        arrQrStr["opid"],
        callback_mainProcessJS
        );
    }
    else
    {
        document.getElementById("divChat").style.display="none";
        document.getElementById("divEndChat").style.display="block";
        visitorendChat();
        alert("The chat session has been terminated. To chat again with us, please click on the live chat link on our website.");        
    }
}

function callback_mainProcessJS(res)
{
    if(res.value[0]==false || res.value[0]==null || res.value[0]=="")
    {
        document.getElementById("divChat").style.display="none";
        document.getElementById("divEndChat").style.display="block";
    }
    else
    {   
        if(ScrollPosition != res.value[1].length)
        {           
            if(res.value[3])
            {
                ScrollPosition=res.value[1].length;            
                document.getElementById("tdiv").innerHTML = document.getElementById("OpMessage").value + res.value[1]; 
                document.getElementById("divChatContent").innerHTML =res.value[1]; 
                document.getElementById("hdnLastID").value=res.value[2];                
                if(res.value[4])
                {
                    callSoundFunc();
                    window.focus();
                    if(navigator.appName!="Microsoft Internet Explorer")
                    {
                        //call title bar marqueue function
                        MakeTitleBlink();
                    }
                }                      
            }
            else
            {                
                if(document.getElementById("divEndChat").style.display=="none")
                {
                    document.getElementById("sample1").style.display="block";              
                }
            }
        
            scroll_down('tdiv');                   
        }        
    }
}
//////////
//END////////  CALL TIMER FUNCTION   /////////////////////
//////////

//////////
//START//////  SCROLL DOWN FUNCTION  /////////////////////
//////////
function scroll_down(id)
{  
  var div = document.getElementById(id);
  h = div.scrollHeight;  
  div.scrollTop = h+1;
}
//////////
//END////////  SCROLL DOWN FUNCTION   /////////////////////
//////////

//////////
//START//////  SEND MESSAGE FUNCTION  /////////////////////
//////////
function callback_sendMessageJS(res)
{    
    if(res.value[0]==false || res.value[0]==null || res.value[0]=="")
    {
        document.getElementById("divChat").style.display="none";
        document.getElementById("divEndChat").style.display="block";
    }
    else
    { 
//        document.getElementById("txtChat").value="";
//        document.getElementById("txtChat").focus();
        //document.getElementById("tdiv").innerHTML = document.getElementById("OpMessage").value + res.value[1];
        document.getElementById("divChatContent").innerHTML =res.value[1];
        //document.getElementById("Hidden1").value =res.value[1]; 
        document.getElementById("hdnLastID").value=res.value[2];
        
        scroll_down('tdiv');
        //ScrollPosition=res.value[1].length;
        
//        clearInterval(interval);
//        interval=setInterval("ProcessStart(landingTime);",3000);
    }
}

function sendMessageJS(boxType)
{       
    landingTime = new Date();
    var ObjBoxType;
    if(boxType=="multi")
    {
        ObjBoxType=document.getElementById("txtChat");
    }
    else
    {
        ObjBoxType=document.getElementById("txtChatSingleLine");
    }    
    if(ObjBoxType.value !="")
    {
        var chat = ObjBoxType.value;
        ObjBoxType.value="";
        document.getElementById("tdiv").innerHTML += "<p><span class='visitorName'>" + arrQrStr["vname"].replace("%20"," ") + " :</span> <span class='msg'>" + chat + "</span></p><br class=\"clear\" />";
        ObjBoxType.focus();
        scroll_down('tdiv');                
        
        VisitorChatWindow1.sendMessagetoOp(
        chat,
        arrQrStr["cid"],
        arrQrStr["sessionid"],
        arrQrStr["dbvisitorid"],
        arrQrStr["opid"],        
        arrQrStr["wid"], 
        callback_sendMessageJS
        );       
    }
    else
    {
        alert("Please write a message.");
        ObjBoxType.focus();
    }
}
//////////
//END//////  SEND MESSAGE FUNCTION  /////////////////////
//////////

//////////
//START//////  SEND EMAIL FUNCTION  /////////////////////
//////////
function callback_sendEmailJS(res)
{
    document.getElementById("divChatContent").innerHTML=res.value;
}
function sendEmailJS()
{
    if(document.getElementById("txtEmail").value !="")
    {
        if(validateEmail(document.getElementById("txtEmail").value))
        {         
            VisitorChatWindow1.sendChatEmail(    
            arrQrStr["cid"],
            arrQrStr["did"],
            arrQrStr["wid"],
            document.getElementById("divChatContent").innerHTML,
            document.getElementById("txtEmail").value,    
            arrQrStr["sessionid"],
            callback_sendEmailJS
            );
        }
        else
        {
            alert("Invalid E-mail ID");
        }
    }
    else
    {
        alert("Please give a Email address.");
    }
}
//////////
//END//////  SEND EMAIL FUNCTION  /////////////////////
//////////

//////////
//START//////  END CHAT FUNCTION  /////////////////////
//////////
function callback_visitorEndChatJS(res)
{
    if(res.value)
    {
        clearInterval(interval);
        document.getElementById("sample1").style.display="none";              
        document.getElementById("divChat").style.display="none";
        document.getElementById("divEndChat").style.display="block";
    }
}
function visitorendChat()
{
    clearInterval(interval);
    clearInterval(intervalTyping);
    PreEndChat();
    if(document.getElementById("sample1").style.display=="block")
    {
        document.getElementById("sample1").style.display="none";
    }
    VisitorChatWindow1.visitorEndChat(    
    arrQrStr["cid"],
    arrQrStr["sessionid"],
    arrQrStr["wid"],
    arrQrStr["did"],
    arrQrStr["opid"],
    callback_visitorEndChatJS
    );
}
//////////
//END//////  END CHAT FUNCTION  /////////////////////
//////////
function alertOk()
{
    clearInterval(interval);
    document.getElementById("sample1").style.display="none";              
    document.getElementById("divChat").style.display="none";
    document.getElementById("divEndChat").style.display="block";
}

//////////
////START EMAIL VALIVATION CODE //////////////////////////
//////////
function validateEmail(str)
{
    if(str)
    {
        var at="@"
        var dot="."
        var lat=str.indexOf(at)
        var lstr=str.length
        var ldot=str.indexOf(dot)
        if (str.indexOf(at)==-1)
        {
           return false;
        }

        if (str.indexOf(at)==-1 || str.indexOf(at)==0 || str.indexOf(at)==lstr)
        {
           return false;
        }

        if (str.indexOf(dot)==-1 || str.indexOf(dot)==0 || str.indexOf(dot)==lstr)
        {
            return false;
        }

         if (str.indexOf(at,(lat+1))!=-1)
         {
            return false;
         }

         if (str.substring(lat-1,lat)==dot || str.substring(lat+1,lat+2)==dot)
         {
            return false;
         }

         if (str.indexOf(dot,(lat+2))==-1)
         {
            return false;
         }

         if (str.indexOf(" ")!=-1)
         {
            return false;
         }
         return true  
  }
  else
  {
     return false;
  }   
}
//////////
////END EMAIL VALIVATION CODE //////////////////////////
//////////

function PlaySound(url) {
  document.all.Bgsound1.src = url;
} 

////////////////////////
///////////////////////////
/////////////////////////////

function getScript(Source){	
	
		var XMLHttpRequestObject = false;
	
		if (window.XMLHttpRequest){
			XMLHttpRequestObject = new XMLHttpRequest();
		}	else if (window.ActiveXObject){
			XMLHttpRequestObject = new ActiveXObject("Microsoft.XMLHttp");
		}
	
		if (XMLHttpRequestObject){
			
			XMLHttpRequestObject.open("GET", Source);
			XMLHttpRequestObject.onreadystatechange = function()
			{
				if (XMLHttpRequestObject.readyState == 4 && XMLHttpRequestObject.status == 200)
				{	
					eval(XMLHttpRequestObject.responseText);
					delete XMLHttpRequestObject;
					XMLHttpRequestObject = null;
				}
			}
			XMLHttpRequestObject.send(null);
		}
	}
	

soundManagerInit();


function callSoundFunc(){
		var url = 'RTChatAjax.aspx?mode=sound&operatorid=5&clientid=5';
		getScript(url);
	}

var intervalTyping=null;

intervalTyping=setInterval("checkTyping();",2000);

function checkTyping()
{
    
    VisitorChatWindow1.checkTyping(
    arrQrStr["sessionid"],
    document.getElementById("hdnVt").value,       
    callback_checkTypingJS
    );
}

function callback_checkTypingJS(res)
{
    document.getElementById("hdnVt").value="0";
//    if(document.getElementById("txtChat").value.length<1)
//    {
//        document.getElementById("hdnVt").value="0";
//    }

    // FOR OPERATOR TYPING LOGIC
    switch(res.value)
    {
        case 0 :
        document.getElementById("spanOpType").innerHTML = "";
        break;
        case 1 :
        document.getElementById("spanOpType").innerHTML = "Operator is typing...";
        break;
        case 2 :
        document.getElementById("spanOpType").innerHTML = "erase...";
        break;
        case 3 :
        document.getElementById("spanOpType").innerHTML = "Operator has entered the text";
        break;
    }
}

//////////
//START////////   NEW MESSAGE TEXT CODE    /////////////////////
//////////

var titleSwitchCount = 0; 
var titleSwitchLimit = 20; 
var titleOriginalText = document.title; 
var titleText = "You have a new message!!"; 
var titleDelay = 500;   	
var titleTimeOutinterval;

function MakeTitleBlink() 
{ 
    // Failsafe     
    titleText = document.getElementById("spOpName").innerHTML + " has send a new message!!";
    if( titleSwitchCount) return;
    
    titlebarSwitch(); 
}

function titlebarSwitch() 
{

    if( document.title == titleOriginalText) 
    { 
        // New message text 
        document.title = titleText; 
        titleSwitchCount++;

    } 
    else 
    { 
        // Original text 
        document.title = titleOriginalText; 
        if( titleSwitchCount == titleSwitchLimit) titleSwitchCount = 0; 
    }

    // If count is 0 then we must have just reset it 
    if( titleSwitchCount) 
    {
        titleTimeOutinterval = setTimeout( "titlebarSwitch();", titleDelay); 
    }
}


//////////
//END////////   NEW MESSAGE TEXT CODE    /////////////////////
//////////	

function stopTitleMarqueue()
{
    clearTimeout(titleTimeOutinterval);
    titleSwitchCount = 0;
    document.title = ":: Reliable Technologies Visitor ChatWindow ::";
}