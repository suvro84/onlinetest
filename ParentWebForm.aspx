<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ParentWebForm.aspx.cs" Inherits="ParentWebForm" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
    <HEAD>
        <title>Parent Webform</title>
        <script language="javascript">
function OpenChild() 
{
    var ParmA = retvalA.value;
    var ParmB = retvalB.value;
    var ParmC = retvalC.value;
    var MyArgs = new Array(ParmA, ParmB, ParmC);
    var WinSettings = "center:yes;resizable:no;dialogHeight:300px"
    //ALTER BELOW LINE - supply correct URL for Child Form

    var MyArgs = window.showModalDialog(
   "http://localhost:1136/OnlineTest/ChildWebForm.aspx", MyArgs, WinSettings);
    if (MyArgs == null)
    {
        window.alert(
          "Nothing returned from child. No changes made to input boxes")
    }
    else
    {
        retvalA.value=MyArgs[0].toString();
        retvalB.value=MyArgs[1].toString();
        retvalC.value=MyArgs[2].toString();
    }
}
        </script>
    </HEAD>
    <body>
        <P><INPUT id="retvalA" type="text" value="AAA"></P>
        <P><INPUT id="retvalB" type="text" value="BBB"></P>
        <P><INPUT id="retvalC" type="text" value="CCC"></P>
        <P><BUTTON onclick="OpenChild()" type="button">
                Open Child Window</BUTTON>
        </P>
    </body>
</HTML>
