<%@ Page Language="C#" AutoEventWireup="true" CodeFile="update_GTD.aspx.cs" Inherits="update_GTD" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="Wynguest_css/styles.css">
    <link rel="stylesheet" type="text/css" href="Wynguest_css/form.css">
    <link rel="stylesheet" type="text/css" href="Wynguest_css/top_menu.css">
    <title>Update GTD on checked out SUB accounts</title>
    <link href="CSS/cardvalidate.css" rel="stylesheet" type="text/css" />

    <script src="script/jquery.min.js" type="text/javascript"></script>

    <script src="script/form_control.js" type="text/javascript"></script>

    <script src="script/top_menu.js" type="text/javascript"></script>

    <script src="script/jquery.validate.js" type="text/javascript"></script>

    <script src="script/jquery-1.3.2.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(function() {
            $("form1").validate({
                errorLabelContainer: $("ul", $('div.error-container')),
                wrapper: 'li',
                rules: {
                    txtSiteNo: {
                        required: true
                    },

//                    txtSubAccounNo: {
//                        required: true,
//                        digits: true

//                    }
                },

                messages: {
                    txtSiteNo: {
                        required: "Please Enter Site No."

                    },
//                    txtSubAccounNo: {
//                    required: "Please Enter SubAccounNo."

//                    }

                }

            });
            $("#txtSiteNo").keypress(function(e) {
                var v = $("#txtSiteNo").val();

                var KeyCode = (e.which) ? e.which : e.keyCode;

                if (KeyCode == 37 || KeyCode == 39 || KeyCode == 46) {
                    return true;
                }
                if ((KeyCode >= 65 && KeyCode <= 90) || (KeyCode >= 97 && KeyCode <= 122) || (KeyCode >= 33 && KeyCode <= 47) ||
                 (KeyCode >= 58 && KeyCode <= 64) || (KeyCode >= 91 && KeyCode <= 96) || (KeyCode >= 123 && KeyCode <= 126)) {
                    return false;
                }
                if (v.length == 0 && KeyCode == 48) {
                    return false;
                }

            });
        });
    </script>

</head>
<body>
    <form id="form1" >
    <div id="hd-orange-gradient">
        <div class="hd-title">
            WynGuest Database Utility</div>
    </div>
    <div id="master">
        <div id="wyndham-logo">
            <div class="logo_pos">
                <img src="../images/wyndham-logo.png" alt="Wyndham Hotel Group" width="209" height="63"
                    border="0" />
            </div>
        </div>
        <!--this is end of windham logo-->
        <div id="content_holder">
            <div align="center" style="margin: 0 auto; width: 100%;">
                <div class="mainNav">
                    <ul id="treemenu1">
                        <li><a href="#">MAIN MENU</a></li>
                        <li class="right"><a href="#" class="logout">LOGOUT</a></li>
                    </ul>
                    <br style="clear: left;" />
                </div>
            </div>
            <!--this is end of top navigation-->
            <div id="bodycontent_inner">
                <div class="main_center_panel_top">
                    <div class="h1-title">
                        Update GTD on checked out SUB accounts</div>
                </div>
                <div class="main_center_panel">
                    <div class="centre_panel_content">
                        <div>
                            <span class="mandatory">*</span> Means Mandatory Field</div>
                        <%-- <div class="error_msg">
                            Error message place holder</div>--%>
                        <div class="error-container">
                            <ul>
                            </ul>
                        </div>
                        <div class="databas_util_cont">
                            <div class="formrow_2">
                                <div class="formLabel">
                                    <span class="mandatory">*</span><span class="blue_label">Site#</span></div>
                                <div class="formField">
                                    <input id="txtSiteNo" type="text" name="textfield" id="textfield" /><span class="required">Required</span></div>
                            </div>
                            <div class="formrow_2">
                                <div class="formLabel">
                                    <span class="mandatory">*</span><span class="blue_label">Production Environment:</span></div>
                                <div class="formField">
                                    <input type="text" name="textfield2" id="textfield2" />
                                    <span>Required</span>
                                </div>
                            </div>
                            <div class="formrow_2">
                                <div class="formLabel">
                                    <span class="mandatory">*</span><span class="blue_label">Sub Account Number:</span></div>
                                <div class="formField">
                                    <input id="txtSubAccounNo" type="text" name="textfield"  /><span class="required">Required</span></div>
                            </div>
                            <div class="formrow_2">
                                <div style="width: 180px; margin: 20px 0 0 120px;">
                                    <span class="btn_alignment">
                                        <input name="" type="button" value="OK" /></span><span class="btn_alignment"><input
                                            name="" type="button" value="CANCEL" /></span></div>
                            </div>
                        </div>
                        <div style="clear: both;">
                        </div>
                        <div class="gridtable_cont">
                            <table width="95%" border="0" cellpadding="0" cellspacing="0" class="gridTable">
                                <tr>
                                    <th>
                                        Heading 1
                                    </th>
                                    <th>
                                        Heading 2
                                    </th>
                                    <th>
                                        Heading 3
                                    </th>
                                    <th>
                                        Heading 4
                                    </th>
                                    <th>
                                        Heading 5
                                    </th>
                                    <th>
                                        Heading 6
                                    </th>
                                </tr>
                                <tr>
                                    <td style="text-align: center">
                                        <input type="checkbox" name="checkbox" id="checkbox" />
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: center">
                                        <input type="checkbox" name="checkbox2" id="checkbox2" />
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: center">
                                        <input type="checkbox" name="checkbox3" id="checkbox3" />
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <!--this is end of centre panel content-->
                    <br />
                    <br />
                    <!--this is end of centre panel content-->
                    <!--this is end of centre panel content-->
                    <!--this is end of centre panel content-->
                    <!--this is end of centre panel content-->
                </div>
                <!--this is end of main_center_panel-->
            </div>
            <!--this is end of body content-->
        </div>
        <!--this is end of content holder-->
    </div>
    </form>
</body>
</html>
