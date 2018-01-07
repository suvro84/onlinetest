<%@ Page Language="C#" AutoEventWireup="true" CodeFile="WebServiceFromJS.aspx.cs"
    Inherits="WebServiceFromJS" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <script language="javascript">



        function createRequestObject() {
            var object;
            var browser = navigator.appName;
            if (browser == "Microsoft Internet Explorer") {
                object = new ActiveXObject("Microsoft.XMLHTTP");
            }
            else {
                object = new XMLHttpRequest()
            }
            return object;
        }

//        function funAjax() {
//            var http = createRequestObject();
//            //http.open("GET", "WeatherService.asmx?id=1"&r=" + Math.random() + "&mode=GetSiteURL");
//         //   http.open("GET", "WeatherService.asmx?id=1"+"&r=" + Math.random() + "&mode=GetSiteURL");
//            http.open("GET", "WeatherService.asmx?op=HelloWorld");

//            http.onreadystatechange = function() {

//                if (http.readyState == 4) {
//                    var response = http.responseText;
//                    if (response.indexOf('|' != -1)) {
//                        document.getElementById("dvAjaxPic").innerHTML = "";
//                        update = response.split("|");
//                       // alert(update[0]);
//                    }
//                }
//                else {
//                    document.getElementById("dvAjaxPic").innerHTML = "<img  src=\"images/loading.gif\" alt=\"Wait...\" />"

//                }
//            }






//            http.send(null);
//        }



        function funAjax() {
                    var xmlHttpReq = false;
                    var self = this;
                    if (window.XMLHttpRequest) {
                        self.xmlHttpReq = new XMLHttpRequest();
                    }
                    else if (window.ActiveXObject) {
                        self.xmlHttpReq = new ActiveXObject("Microsoft.XMLHTTP");
                    }
                    self.xmlHttpReq.open('POST', "WeatherService.asmx/HelloWorld", true);
                    self.xmlHttpReq.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
                   // self.xmlHttpReq.setRequestHeader('Content-Type', 'text/plain');
                    self.xmlHttpReq.onreadystatechange = function() {
                        if (self.xmlHttpReq.readyState == 4) {
                            document.getElementById("dvAjaxPic").style.display = "none";
                            alert(self.xmlHttpReq.responseText);

                            var GetValue = new Array();
                            if (self.xmlHttpReq.responseText.indexOf('~' != -1)) {
                                GetValue = self.xmlHttpReq.responseText.split("~");
                                //alert(GetValue[0].toString());
                               // alert(GetValue[1].toString());
                            }
                            if (GetValue[1].toString() != "") {
                                if (GetValue[1].toString() == "1") {

                                    alert(GetValue[2].toString());
                                }
                              
//                                else {
//                                    objMainDiv.innerHTML = GetValue[1].toString(); ;
//                                    objErrLabel.innerHTML = "";
//                                }
                            }
                            else {
                                alert("Ajax return not found...");
                            }
                        }
                        else {
                            document.getElementById("dvAjaxPic").style.display = "block";
                            //objMainDiv.style.display = "none";
                        }
                    }
                    //self.xmlHttpReq.send("mode=" + mode + "&discCode="+varDiscCode);
                    self.xmlHttpReq.send("mode=1");
            
              
           
          
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <div>
        <input id="btnclick" onclick="funAjax()"; type="button" value="Click" />
        <div id="dvAjaxPic" style="display:none">
           <img  src="Pictures/loading.gif" alt="Wait..." />
            </div>
    </div>
    </form>
</body>
</html>
