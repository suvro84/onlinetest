<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AssignService_SubService.aspx.cs"
    Inherits="AssignService_SubService" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    
    <form id="form1" runat="server">
    <div>
      
      <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
        <asp:DropDownList ID="ddlService" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlService_SelectedIndexChanged"
            Style="height: 22px">
        </asp:DropDownList>
        <br />
        <asp:CheckBoxList RepeatDirection="Horizontal" RepeatColumns="4" ID="cbSubService"
            runat="server">
        </asp:CheckBoxList>
    
    
        <asp:Button ID="btnSubmit" runat="server" Text="Submit" 
            onclick="btnSubmit_Click" />
            
            
               <label for="pass">Password</label><input type="password" name="pass" id="pass" onkeyup="passwordStrength(this.value)" />
    <p>

                        <label for="passwordStrength">Password strength</label>

                        <div id="passwordDescription">Password not entered</div>

                        <div id="passwordStrength" class="strength0"></div>

                </p>
    
    <script type="text/javascript" >
    function passwordStrength(password)

{

        var desc = new Array();

        desc[0] = "Very Weak";

        desc[1] = "Weak";

        desc[2] = "Better";

        desc[3] = "Medium";

        desc[4] = "Strong";

        desc[5] = "Strongest";



        var score   = 0;



        //if password bigger than 6 give 1 point

        if (password.length > 6) score++;



        //if password has both lower and uppercase characters give 1 point      

        if ( ( password.match(/[a-z]/) ) && ( password.match(/[A-Z]/) ) ) score++;



        //if password has at least one number give 1 point

        if (password.match(/\d+/)) score++;



        //if password has at least one special caracther give 1 point

        if ( password.match(/.[!,@,#,$,%,^,&,*,?,_,~,-,(,)]/) ) score++;



        //if password bigger than 12 give another 1 point

        if (password.length > 12) score++;



         document.getElementById("passwordDescription").innerHTML = desc[score];

         document.getElementById("passwordStrength").className = "strength" + score;

}
    </script>
    </div>
    </form>
</body>
</html>
