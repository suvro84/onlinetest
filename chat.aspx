<%@ Page Language="C#" AutoEventWireup="true" CodeFile="chat.aspx.cs" Inherits="chat" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <script type="text/javascript" src="js/chat.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="divChat" class="container">  
            <a href="#" id="logoChat" title="flowerstokolkata24x7" class="logo"></a>
            <br class="clear">     
            <p id="welcomeOnlineChatText">Welcome to our Live Chat support</p>
            
            <div id="tdiv" class="chatarea">
                  <%--  <p>
                        <span class="operatorName">Operator :</span> <span class="msg">How can I assist you
                            today ?</span>
                    </p>
                    <br class="clear">
                    <p>
                        <span class="visitorName">Visitor :</span> <span class="msg">I have a query with regards
                            to your website. Can you plz... </span>
                    </p>
                    <br class="clear">
                    <p>
                        <span class="operatorName">Operator :</span> <span class="msg">Sure. Please tell ...<br>
                            adesai12@gmail.com</span>
                    </p>--%>
                </div>
            <br class="clear">                                                                     
            <p class="chatTime">
            <span id="spType" class="typingTxt"></span>                            
        <span class="duration">
            <span id="spnDuration">Duration</span>
            <span id="lblduration">0:54</span>
        </span>
        </p>
        <textarea name="txtChat" rows="2" cols="55" id="txtChat" class="textType"></textarea>
        <br class="clear">		    
	    <input id="btnChat" name="btnChat" class="sendBtn" onclick="funSendMsg();" value="Send Message" type="button">                
        <a id="linkEndChat" href="#" class="endChat"><span id="spnEndChat">End Chat</span></a>
        <br class="clear">                    
        <p id="poweredBy" class="powered"><span><a href="https://livechat.reliabletechnologies.in/" alt="Live Chat" title="Live Chat">Live Chat</a></span><br class="clear"><span class="poweredTxt">Powered By</span><br class="clear"><a href="https://www.reliabletechnologies.in/"><img src="previewChat.aspx_files/reliable_logo1.gif" alt="Reliable Technologies" title="Reliable Technologies"></a></p>        
	    <br class="clear">            
    </div>
    
    
    
    
    
    
    </form>
</body>
</html>
