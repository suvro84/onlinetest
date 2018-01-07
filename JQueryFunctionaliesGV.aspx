<%@ Page Language="C#" AutoEventWireup="true" CodeFile="JQueryFunctionaliesGV.aspx.cs"
    Inherits="JQueryFunctionaliesGV" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="CSS/Standard.css" rel="stylesheet" type="text/css" />
    <%-- <script src="_assets/js/jquery.simplemodal-1.1.1.js" type="text/javascript"></script>--%>
    <!-- Load jQuery, SimpleModal and Basic JS files -->
    <%-- <script src="script/jquery-ui.js" type="text/javascript"></script>--%>
    <%-- <script src="script/jquery.js" type="text/javascript"></script>--%>
    <%--   <script src="script/ww.jquery.js" type="text/javascript"></script>--%>
    <%--<script type='text/javascript' src='js/jquery.js'></script>--%>
    <%--  <script type='text/javascript' src='js/jquery.simplemodal.js'></script>--%>
    <%-- <script type='text/javascript' src='js/basic.js'></script>--%>

    <script language="javascript" src="js/jquery-1.4.min.js" type="text/javascript"></script>

    <%--<script type="text/javascript">

        function ShowEditBox(id) {
            //$("#divEditBox").slideDown("medium");
            var pid = 'PName' + id;
            var colIndex = 0;
            //alert(pid);
            var $tr = $("#" + pid).parent().parent();
            $tr.find('td').each(function() {

                if (colIndex == 0) {
                    // $("#txtEditName").val($(this).text());
                    // alert($(this).text());
                }
                else if (colIndex == 3) {
                    //$("#txtEditAddress").val($(this).text());
                    alert($(this).text());
                }
                else if (colIndex == 4) {
                    //$("#txtEditCity").val($(this).text());
                }
                else if (colIndex == 5) {
                    // $("#txtEditPhone").val($(this).text());
                    alert($(this).text());
                }
                colIndex++;
            })
            //$("#editId").val(id);

            //            if ($("#cb1").checked == true) {
            //                alert('checked');
            //            }
            if ($("#cb" + id).attr("checked") == true) {
                //alert("Checked" + id);
                //alert($("#ddl" + id));
                $("#ddl" + id).attr("disabled", true);
                $("#txt" + id).attr("disabled", true);
                //alert(document.getElementById("GridView2").rows[id].cells[1].innerHTML);
                //alert($("#<%=GridView2%>").rows[id].cells[1]);
            }
            else {
                //alert("Unchecked");
                $("#ddl" + id).attr("disabled", false);
                $("#txt" + id).attr("disabled", false);
            }
        }
    </script>--%>

    <script type="text/javascript">

        $(document).ready(function() {
            $(".cbclass").live('click', function() {
                if ($(this).attr('checked')) {
                    $(this).parent().parent().children().find(".txtBoxCSS").attr("disabled", "disabled");
                    $(this).parent().parent().children().find(".ddlCSS").attr("disabled", "disabled");

                    var text = $(this).parent().parent().children().find(".txtBoxCSS").val();
                    alert(text);
                }
                else {
                    $(this).parent().parent().children().find(".txtBoxCSS").removeAttr("disabled");
                    $(this).parent().parent().children().find(".ddlCSS").removeAttr("disabled");


                }



            });

        });



        function EnableTextBox(cb) {
            var itemCount = 0;
            var tb;
            var cb;
            itemCount = document.getElementById('<%= this.GridView2.ClientID %>'); //get the Rowcount in the GridView
            alert(cb);
            for (i = 0; i < parseInt(document.getElementById('hdtot').value); i++) {
                tb = document.getElementById('txtApplicationName');
                //            cb = document.getElementById('cb');

                if (cb.Checked == true) {
                    alert('hi');
                    tb.Enabled = True;
                }
                else
                { tb.Enabled = False }
            }
        } 
    </script>

    <%--<script type="text/javascript">
        function showPanel(panelID) {
            $panel = $('#' + panelID);
            $.ajax({
                url: "/OnlineTest/JqueryModalPopUp.aspx",
                type: "GET",
                dataType: "html",
                async: false,
                data: { "param": "abcd"
                },
                success: function(obj) {
                    // obj will contain the complete contents of the page requested
                    // use jquery to extract just the html inside the body tag
                    $content = $(obj).find('body').html();
                    // then update the dialog contents with this and show it
                    $panel.html($content);
                    var dialog = $panel.dialog({ autoOpen: false });
                    dialog.dialog("open");

                    // $panel.dialog('open');
                }
            });
        }
    </script>--%>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:GridView ID="GridView2" runat="server" DataKeyNames="id" AutoGenerateColumns="False"
            OnRowDataBound="GridView2_RowDataBound">
            <Columns>
                <asp:TemplateField HeaderText="SL">
                    <ItemTemplate>
                        <%--<input type="checkbox" name="cb<%#Eval("id")%>" onclick="ShowEditBox(<%# Eval("id") %>)"
                            id="cb<%#Eval("id")%>" />--%>
                        <%-- <input type="checkbox" onclick="EnableTextBox(this);" runat="server" id="cb" />--%>
                        <input type="checkbox" runat="server" id="cb" class="cbclass" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="SL">
                    <ItemTemplate>
                        <span id="PName<%# Eval("id") %>">
                            <%--  <%# Eval("ApplicationName") %>--%>
                            <%--  <input type="text" value="<%#Eval("ApplicationName")%>" id="txt<%#Eval("id")%>" />--%>
                            <input type="text" value="<%#Eval("ApplicationName")%>" id="txtApplicationName" class="txtBoxCSS"
                                runat="server" />
                        </span>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="SL">
                    <ItemTemplate>
                        <a href="javascript:showQueryDialog()" title="F4" class="hoverbutton">Show Query Dialog</a>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="SL">
                    <ItemTemplate>
                        <asp:DropDownList ID="ddl" runat="server" CssClass="ddlCSS">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                        </asp:DropDownList>
                        <%-- <select id="ddl<%# Eval("id") %>" name="SCOPE">
                            <option value="0">0
                                <option value="1">
                            1
                        </select>--%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="SL">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkDelete" CommandName="del" runat="server">PopUP</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <input type="hidden" id="hdtot" runat="server" />
    </div>
    <div id="dialog">
    </div>
    <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
    <div id="divjQueryDialog" class="dialog">
        <div class="dialog-header">
            Enter a jQuery Expression</div>
        <div class="containercontent dialog-bottom">
            Expression: <span id="lblExpressionMsg" class="errormessage"></span>
            <br />
            <textarea id="txtExpression" style="width: 300px; height: 60px;"></textarea>
            <input type="button" id="btnExpression" value="Show" />
        </div>
    </div>
    </form>
</body>
</html>
