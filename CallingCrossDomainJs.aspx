<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CallingCrossDomainJs.aspx.cs"
    Inherits="CallingCrossDomainJs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <script type="text/javascript">
        //<![CDATA[


        // called when the "Show Me" button is pressed
        function show_me() {
            ///
            /// dynamically insert a script tag into the DOM tree
            ///

            // create the element
            var script_object = document.createElement('SCRIPT');
            // NOTE: the URL is connecting to a foreign site (and not a js file either)
           // script_object.src = 'http://www.edgeofnowhere.cc/yo_what_time_is_it.php';
           // script_object.src = 'http://localhost:3825/MultiselectCopyGrid/Default.aspx';
            script_object.src = 'http://www.google.co.in';

            script_object.type = 'text/javascript';

            // do the insert
            var head = document.getElementsByTagName('HEAD')[0];
            alert(script_object.innerHTML);
            head.appendChild(script_object);
        }

        //]]>
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <div>
        <p>
            You are connected to cows-ajax.sourceforge.net but we can ask a foriegn site for
            the time.
            <input type="button" onclick="show_me()" value="Show Me" />
        </p>
        <div id="response">
        </div>
    </div>
    </form>
</body>
</html>
