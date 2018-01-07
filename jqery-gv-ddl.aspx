<%@ Page Language="C#" AutoEventWireup="true" CodeFile="jqery-gv-ddl.aspx.cs" Inherits="jqery_gv_ddl" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8" />
    <title></title>
    <link type="text/css" href="themes/base/jquery.ui.all.css" rel="stylesheet" />

    <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>

    <script type="text/javascript" src="js/jquery.effects.core.js"></script>

    <script type="text/javascript" src="js/jquery.effects.blind.js"></script>

    <link type="text/css" href="CSS/demos.css" rel="stylesheet" />
    <style type="text/css">
        #effect
        {
            width: 180px;
            height: 135px;
            padding: 0.4em;
            position: relative;
            overflow: auto;
        }
        .textbox
        {
            width: 185px;
            height: 14px;
        }
        body
        {
            font-size: 62.5%;
        }
    </style>

    <script type="text/javascript">
        $(function() {
            $("#effect").hide();
            //run the currently selected effect
            function runEffect() {
                //get effect type from
                if (!($('#effect').is(":visible"))) {
                    //run the effect
                    $("#effect").show('blind', 200);
                }
                else {
                    $("#effect").hide('blind', 200);
                }
            };

            //set effect from select menu value
            $("#ddlArrow").click(function() {
                runEffect();
                return false;
            });


            $(document).click(function(e) { if (($('#effect').is(":visible"))) { $("#effect").hide('blind', 1000); } });

            $('#effect').click(function(e) {
                e.stopPropagation();
            });
        });
	</script>
<script language="javascript">
    function GetSelectedValue(ID, Value) 
    {
        alert(ID); 
         alert(Value); 
        var objTextBox = document.getElementById("<%=txtChkValue.ClientID%>");
        if (document.getElementById("cb" + ID.checked == true)) 
        {
            if (objTextBox.value == "") 
            {
                objTextBox.value = ID + " " + Value;
                alert(objTextBox.value);
            }
            else
            {
                objTextBox.value = objTextBox.value + ", " + ID + " " + Value;
            }
        }
    }
</script>
</head>
<body>
    <form runat="server" id="form1">
    <div class="demo">
        <div class="toggler">
            <span>
                <asp:TextBox ID="txtChkValue" runat="server" CssClass="textbox"></asp:TextBox>
                <img id="ddlArrow" src="images/down_arrow.jpg" style="margin-left: -23px; margin-bottom: -4px" />
            </span>
            <div id="effect" class="ui-widget-content">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
                    <Columns>
                        <asp:TemplateField HeaderText="CheckBox">
                            <ItemTemplate>
                                   <input type="checkbox" name="cb<%#Eval("ID")%>" id="cb<%#Eval("ID")%>" onclick="GetSelectedValue(<%#Eval("ID")%>,'<%#Eval("Value")%>');" />
                            
                              <%--  <asp:CheckBox ID="chkList" runat="server" />--%>
                              
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ID">
                            <ItemTemplate>
                                <%#Eval("ID")%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Value">
                            <ItemTemplate>
                                <%#Eval("Value")%>
                            </ItemTemplate>
                        </asp:TemplateField>
                   
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
    </form>
</body>
</html>


