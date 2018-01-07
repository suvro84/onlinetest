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
var landingTime = new Date();
interval=setInterval("funRetrieveMsg(landingTime);",3000);

function funRetrieveMsg()
{
         chat.FetchMsg(callback_Retrieve);
}
function callback_Retrieve(res)
{
    document.getElementById("tdiv").innerHTML=res.value;
}

function funSendMsg()
{

         //document.getElementById("tdiv").innerHTML += "<p><span class='visitorName'>" + arrQrStr["vname"].replace("%20"," ") + " :</span> <span class='msg'>" + chat + "</span></p><br class=\"clear\" />";

         //document.getElementById("tdiv").innerHTML=chat.SendMsg().value;
         chat.insertXML(document.getElementById("txtChat").value,callback_send);

}
function callback_send(res)
{
    document.getElementById("tdiv").innerHTML=res.value;
}