<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChildWebForm.aspx.cs" Inherits="ChildWebForm" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<HTML>
    <HEAD>
        <TITLE>Child Webform</TITLE>
        <script language="javascript">
function Done() {
    var ParmA = tbParamA.value;
    var ParmB = tbParamB.value;
    var ParmC = tbParamC.value;
    var MyArgs = new Array(ParmA, ParmB, ParmC);
    window.returnValue = MyArgs;
    window.close();
}
function doInit() {
    var ParmA = "Aparm";
    var ParmB = "Bparm";
    var ParmC = "Cparm";
    var MyArgs = new Array(ParmA, ParmB, ParmC);
    MyArgs =  window.dialogArguments;
    tbParamA.value = MyArgs[0].toString();
    tbParamB.value = MyArgs[1].toString();
    tbParamC.value = MyArgs[2].toString();
}
        </script>
    </HEAD>
    <BODY onload="doInit()">
        <P>Param A:<INPUT id="tbParamA" TYPE="text"></P>
        <P>Param B:<INPUT ID="tbParamB" TYPE="text"></P>
        <P>Param C:<INPUT ID="tbParamC" TYPE="text"></P>
        <BUTTON onclick="Done()" type="button">OK</BUTTON>
    </BODY>
</HTML>

