<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Ajax_CSharp.aspx.cs" Inherits="Ajax_CSharp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <script language="javascript" type="text/javascript">
    function GetData()
    {
        var response;
        Ajax_CSharp.GetData(GetData_CallBack);    
    }
    
    function GetData_CallBack(response)
    {
        var response=response.value;
        
        if(response=="Empty")
        {
            alert("No Record Found !!!");
        }
        else if(response=='Error')
        {
            alert("An Error occured in accessing the DataBase !!!");
        }
        else
        {
            var arr=response.split("~");
            var empID=arr[0].split(",");
            var empName=arr[1].split(",");
        
            document.getElementById('dlistEmployee').length=0;
            for(var i=0;i<empID.length;i++)
            {
                var o = document.createElement("option");
                o.value = empID[i];
                o.text = empName[i];
                document.getElementById('dlistEmployee').add(o);
            }
        }
    }
    
    
    function display()
{
    var selIndex=document.getElementById("dlistEmployee").selectedIndex;
    var empName=document.getElementById("dlistEmployee").options(selIndex).text;
    var empID=document.getElementById("dlistEmployee").options(selIndex).value;
    
    document.getElementById("lblResult").innerHTML="You have selected " + empName + " ( ID : " + empID + " )";
}
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <input id="btnGetData" onclick="GetData();" type="button" value="I am Html Button To Get Employee Data From DB" />
        <asp:DropDownList ID="dlistEmployee" runat="server" onchange="display();">
        </asp:DropDownList><asp:Label ID="lblResult" runat="server" Text="No Record Selected"></asp:Label></div>
    </form>
</body>
</html>
