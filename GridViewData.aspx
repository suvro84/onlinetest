﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridViewData.aspx.cs" Inherits="GridViewData" %>

<%--<script src="http://localhost:1181/OnlineTest/_assets/js/jquery-1.2.6.min.js" type="text/javascript"></script>--%>

<script src="_assets/js/jquery.simplemodal-1.1.1.js" type="text/javascript"></script>

<script src="_assets/js/jquery.contextMenu.js" type="text/javascript"></script>

<link href="_assets/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />
<form id="form1" runat="server">
<div id="divGridView">
    <asp:gridview id="GridView1" runat="server" enableviewstate="False" width="100%"
        borderwidth="1" cellpadding="4" forecolor="#333333" gridlines="None" autogeneratecolumns="false"
        datakeynames="AutoId" autogeneratedeletebutton="false" emptydatatext="No records found"
        onrowdatabound="GridView1_RowDataBound">
        <RowStyle BackColor="#99CCFF" />
            <HeaderStyle BackColor="#507CD1" HorizontalAlign="Left" Font-Bold="True" ForeColor="White" />
            <Columns>
           <%--     <asp:BoundField     DataField="AutoId"   HeaderText="AutoId" />--%>
           
           <asp:TemplateField >
            <ItemTemplate>
                         <asp:Literal ID="AutoId"  Text='<%#Eval("AutoId")%>' runat="server"></asp:Literal>
                    </ItemTemplate>
                       </asp:TemplateField>
                <asp:TemplateField HeaderText="Edit">
                    <ItemTemplate>
                        <a href="javascript:void(0)" onclick="ShowEditBox(<%# Eval("AutoId") %>)" title="Edit">Edit</a>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Name">
                    <ItemTemplate>
                        <span id="PName<%# Eval("AutoId") %>"><%# Eval("Name") %></span>
                       <input type="hidden" id="hdaid" value="<%# Eval("AutoId") %>" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField HeaderText="Address" DataField="Address" />
                <asp:BoundField HeaderText="City" DataField="City" />
                <asp:BoundField HeaderText="Phone" DataField="Phone" />
                <asp:TemplateField HeaderText="Delete">
                    <ItemTemplate>
                        <span onclick="return confirm('Are you sure?')">
                            <a href="javascript:DeleteRecord(<%# Eval("AutoId") %>)" title="Delete"><font color="red">Delete?</font></a>
                        </span>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:gridview>
    <input type="hidden" style="display: none" id="hdAutoId" />
    <input type="hidden" style="display: none" id="hdSelectedIds" />
    
    
    
       <asp:HiddenField ID="hidCellId" runat="server" />
        <asp:HiddenField ID="hidSelectedRow" runat="server" />
        <asp:HiddenField ID="hidIsSelected" runat="server" />
        <asp:HiddenField ID="hdTotalValueSelected" runat="server" />
        
          <input type="hidden" id="hdFromValue" runat="server" />
            <input type="hidden" id="hdToValue" runat="server" />
    <asp:literal runat="server" id="litPaging" enableviewstate="False" />
    <p>
        <asp:label id="lblMessage" runat="server" enableviewstate="false" />
    </p>
</div>
<ul id="myMenu" class="contextMenu">
    <li class="insert"><a href="#insert">Add New</a></li>
    <li class="edit"><a href="#edit">Edit</a></li>
    <li class="delete"><a href="#delete">Delete</a></li>
</ul>
</form>

<script language="javascript" type="text/javascript">
    // highlight the row when clicked
    $(document).ready(function() {
        $("#divGridView table tbody tr").mouseover(function() {
            $(this).addClass("highlightRow");
        }).mouseout(function() { $(this).removeClass('highlightRow'); })
    });

    // highlight row by clicking it
    //    $(document).ready(function() {
    //        $("#divGridView table tbody tr").click(function() {
    //            $(this).addClass("select");
    //        })
    //    });


    $('#<%=GridView1.ClientID%> tr[id]').click(function() {
//        alert('hii');

        //        if (!evt.ctrlKey) {
        $('#<%=GridView1.ClientID%> tr[id]').css({ "background-color": "White", "color": "Black" });

        $(this).css({ "background-color": "Black", "color": "White" });

        // $('#hdSelectedIds').val($(this).attr("id"));
        //alert($('#hdSelectedIds').val());
        if (document.getElementById('hdSelectedIds').value == '') {
            document.getElementById('hdSelectedIds').value = $(this).attr("id");

        }
        else {
            document.getElementById('hdSelectedIds').value = document.getElementById('hdSelectedIds').value + ',' + $(this).attr("id");



        }
       // alert($('#hdSelectedIds').val());
        //        }
    });
//    var isCtrl = false;
//    $('#<%=GridView1.ClientID%>').keyup(function(e) {
//    alert(e.which);
//        if (e.which == 17) isCtrl = false;
//    }).keydown(function(e) {
//        if (e.which == 17) isCtrl = true; alert('hi');

//    });


    // double click delete rows
    $(document).ready(function() {
        $("#divGridView table tbody tr").dblclick(function() {
            // find the id first
            var v = confirm('Are you sure to delete?');
            if (v) {
                var autoId = $(this).find("td:first").text();
                // remove the row from server side (the database)
                DeleteRecord(autoId);
                // remove from the clien side
                $(this).remove();
            }
        })
    });

   
    $(document).ready(function() {

        //        $("#addNewCustomerInstructionsImg").click(function(ev) {
        //            toggleAddCustomerInstructions();
        //        });

        //        $("#addNewCustomerInstructionsLink").click(function(ev) {
        //            ev.preventDefault();
        //            toggleAddCustomerInstructions();
        //        });

        //        $("#addNewCustomerInstructionsClose").click(function(ev) {
        //            ev.preventDefault();
        //            toggleAddCustomerInstructions();
        //        });

        //        $("#customerResponse").fadeOut(5000);
        // alert('hi');
        $(".customerRow").contextMenu({ menu: 'myMenu' }, function(action, el, pos) { contextMenuWork(action, el, pos); });

        $(".openmenu").contextMenu({ menu: 'myMenu', leftButton: true }, function(action, el, pos) { contextMenuWork(action, el.parent("tr"), pos); });
    });

    function contextMenuWork(action, el, pos) {
        //alert(action);
        $("#hdAutoId").val($(el).find("#hdaid").val());

        switch (action) {

            case "delete":
                {
                    //    var msg = "Delete " + $(el).find("#contactname").text() + "?";
                    //  alert($("#hdAutoId").val($(el).find("#hdaid").text()));
                    //alert($(el).find("#hdaid").val());

                    var v = confirm('Are you sure to delete?');
                    if (v) {

                        $.post("GridViewData.aspx",
        {
            deleteId: $("#hdAutoId").val()
        },
        function(data) {
            $("div#divGridViewData").html(data);
        });


                    }







                    // alert('hi');
                    //                    $('#<%=GridView1.ClientID%> tr[id]').click(function() {

                    //                        //                    $('#<%=GridView1.ClientID%> tr[id]').css({ "background-color": "White", "color": "Black" });

                    //                        //                        $(this).css({ "background-color": "Black", "color": "White" });

                    //                        $('#hdAutoId').val($(this).attr("id"));
                    //                        alert($('#hdAutoId').val());

                    //                    });

                    //                    $('#<%=GridView1.ClientID%> tr[id]').unbind('click').click(function() {
                    //                        alert('right');
                    //                        //do something
                    //                        $('#hdAutoId').val($(this).attr("id"));
                    //                        alert($('#hdAutoId').val());

                    //                    });



                    break;

                }
            case "insert":
                {

                    $("#divEditBox").slideDown("medium");
                    $("#txtEditName").val("");
                    $("#txtEditAddress").val("");
                    $("#txtEditCity").val("");
                    $("#txtEditPhone").val("");
                    $("#editId").val("0");
                    $("#lblPopTitle").text("Add Record");


                    //                    $("#TextBoxContactName").val("");
                    //                    $("#TextBoxContactTitle").val("");
                    //                    $("#TextBoxCountry").val("");
                    //                    $("#TextBoxPhone").val("");

                    //                    $("#addNewCustomer").modal({
                    //                        close: true,
                    //                        onOpen: modalOpenAddCustomer,
                    //                        onClose: modalOnClose,
                    //                        persist: true,
                    //                        containerCss: ({ width: "500px", height: "275px", marginLeft: "-250px" })
                    //                    });
                    alert('insert');
                    break;
                }

            case "edit":
                {
                    //                    alert(
                    //	    						'Action: ' + action + '\n\n' +
                    //	    						'Element ID: ' + $(el).attr('id') + '\n\n' +
                    //	    						'X: ' + pos.x + '  Y: ' + pos.y + ' (relative to element)\n\n' +
                    //	    						'X: ' + pos.docX + '  Y: ' + pos.docY + ' (relative to document)'
                    //	    						);
                    //alert('edit');



                    $("#divEditBox").slideDown("medium");
                    var pid = 'PName' + $("#hdAutoId").val();
                    var colIndex = 0;

                    var $tr = $("#" + pid).parent().parent();
                    $tr.find('td').each(function() {

                        if (colIndex == 2) {
                            $("#txtEditName").val($(this).text());
                        }
                        else if (colIndex == 3) {
                            $("#txtEditAddress").val($(this).text());
                        }
                        else if (colIndex == 4) {
                            $("#txtEditCity").val($(this).text());
                        }
                        else if (colIndex == 5) {
                            $("#txtEditPhone").val($(this).text());
                        }
                        colIndex++;
                    })
                    $("#editId").val($("#hdAutoId").val());
                    break;
                }
        }
    }

    //    function confirm(message) {
    //        $("#confirm").modal({
    //            close: true,
    //            overlayId: 'confirmModalOverlay',
    //            containerId: 'confirmModalContainer',
    //            onClose: modalOnClose,
    //            onShow: function modalShow(dialog) {
    //                dialog.overlay.fadeIn('slow', function() {
    //                    dialog.container.fadeIn('fast', function() {
    //                        dialog.data.hide().slideDown('slow');
    //                    });
    //                });

    //                dialog.data.find(".confirmmessage").append(message);

    //                // Yes button clicked
    //                dialog.data.find("#ButtonYes").click(function(ev) {
    //                    ev.preventDefault();
    //                    $.modal.close();
    //                    alert('The customer with id ' + $("#HiddenFieldRowId").val() + ' would of been deleted.');
    //                    //$("#ButtonDeleteCustomer").click();
    //                });
    //            }
    //        })
    //    }

    //    function modalOpenAddCustomer(dialog) {
    //        dialog.overlay.fadeIn('fast', function() {
    //            dialog.container.fadeIn('fast', function() {
    //                dialog.data.hide().slideDown('slow');
    //            });
    //        });

    //        dialog.data.find(".modalheader span").html("Add New Customer");

    //        // if the user clicks "yes"
    //        dialog.data.find("#ButtonAddCustomer").click(function(ev) {
    //            ev.preventDefault();

    //            //Perfom validation
    //            if (Page_ClientValidate("addCustomer")) {
    //                $.modal.close();
    //                $("#ButtonHiddenAddCustomer").click();
    //            }

    //        });
    //    }

    //    function toggleAddCustomerInstructions() {
    //        $("#addNewCustomerFields").toggle();
    //        $("#addNewCustomerInstructions").toggle()
    //    }

    //    function modalOnClose(dialog) {
    //        dialog.data.fadeOut('slow', function() {
    //            dialog.container.slideUp('slow', function() {
    //                dialog.overlay.fadeOut('slow', function() {
    //                    $.modal.close(); // must call this to have SimpleModal                   
    //                    // re-insert the data correctly and
    //                    // clean up the dialog elements
    //                });
    //            });
    //        });
    //    }


    function UpdateInsertData() {
        $(document).ready(function() {
            $.post("GridViewData.aspx",
        {
            pName: $("#txtEditName").val(),
            pAddress: $("#txtEditAddress").val(),
            pCity: $("#txtEditCity").val(),
            pPhone: $("#txtEditPhone").val(),
            editId: $("#editId").val()
        },
        function(data) {
            $("div#divGridViewData").html(data);
        });
        });
        // hide the edit box
        HideEditBox();
    }
</script>

<!-- IE 6 hacks -->
<!--[if lt IE 7]>
<link type='text/css' href='_assets/css/confirm_ie.css' rel='stylesheet' media='screen' />
<![endif]-->



<%--<script language="javascript" type="text/javascript">

    function FillColor(cellid, id, evt) {
        if (evt.shiftKey) {
            alert('x');
            var clearCellColor = document.getElementById('hidCellId').value.split(',');
            for (i = 0; i < clearCellColor.length; i++) {
                //alert(document.getElementById(clearCellColor[i]));
                document.getElementById(clearCellColor[i]).bgColor = "#99CCFF";
                document.getElementById(clearCellColor[i]).style.color = "Black";

            }
            if (document.getElementById('hdToValue').value != "") {
                document.getElementById('hdFromValue').value = document.getElementById('hdToValue').value
                document.getElementById('hdToValue').value = cellid;
            }

            else {
                document.getElementById('hdFromValue').value = cellid;
                document.getElementById('hdToValue').value = cellid;

            }
            // alert("from value:" + document.getElementById('hdFromValue').value);
            //  alert("to value:" + document.getElementById('hdToValue').value);
            var GetValue = new Array();
            GetValue = document.getElementById('hdFromValue').value.split("_");
            var from = GetValue[1].toString().substring(GetValue[1].toString().indexOf("l") + 1, GetValue[1].length);
            alert("from:" + from);
            // alert("To value:" + document.getElementById('hdToValue').value);

            GetValue = document.getElementById('hdToValue').value.split("_");
            var To = GetValue[1].toString().substring(GetValue[1].toString().indexOf("l") + 1, GetValue[1].length);
            alert("To:" + To);
            document.getElementById("GridView1_ctl" + from + "_ctl00").bgColor = "#800000";
            document.getElementById("GridView1_ctl" + from + "_ctl00").style.color = "Black";
            document.getElementById("GridView1_ctl" + from + "_ctl01").bgColor = "#800000";
            document.getElementById("GridView1_ctl" + from + "_ctl01").style.color = "Black";
            //alert(document.getElementById("GridView1_ctl" + from + "_ctl00").innerHTML);
            document.getElementById('<%=hidSelectedRow.ClientID%>').value = document.getElementById("GridView1_ctl" + from + "_ctl00").innerHTML;

            //  clearCells();
            var start = "";
            var end = ""
            if (from > To) {
                alert('hi');
                //                from = To;
                //                To = from;

                start = To;
                end = from;
                alert("from:" + from);
                alert("To:" + To);
            }
            else {
                start = from;
                end = To;

            }

            for (i = parseInt(start) + 1; i <= end; i++) {

                if (i < 10) {
                    document.getElementById("GridView1_ctl0" + i + "_ctl00").bgColor = "#800000";
                    document.getElementById("GridView1_ctl0" + i + "_ctl00").style.color = "Black";
                    document.getElementById("GridView1_ctl0" + i + "_ctl01").bgColor = "#800000";
                    document.getElementById("GridView1_ctl0" + i + "_ctl01").style.color = "Black";
                    document.getElementById('<%=hidSelectedRow.ClientID%>').value = document.getElementById('<%=hidSelectedRow.ClientID%>').value + ',' + document.getElementById("GridView1_ctl0" + i + "_ctl00").innerHTML;


                } else {
                    document.getElementById("GridView1_ctl" + i + "_ctl00").bgColor = "#800000";
                    document.getElementById("GridView1_ctl" + i + "_ctl00").style.color = "Black";
                    document.getElementById("GridView1_ctl" + i + "_ctl01").bgColor = "#800000";
                    document.getElementById("GridView1_ctl" + i + "_ctl01").style.color = "Black";
                    document.getElementById('<%=hidSelectedRow.ClientID%>').value = document.getElementById('<%=hidSelectedRow.ClientID%>').value + ',' + document.getElementById("GridView1_ctl" + i + "_ctl00").innerHTML;

                }
            }

            alert(document.getElementById('<%=hidSelectedRow.ClientID%>').value);


        }


        else {
            //document.getElementById('<%=hdTotalValueSelected.ClientID%>').value = '';
            document.getElementById('<%=hidSelectedRow.ClientID%>').value = '';
            var isSelected = document.getElementById('<%=hidSelectedRow.ClientID%>');
            if (!evt) var evt = window.event;
            ctrlPressed = evt.ctrlKey;
            // alert(document.getElementById('hidCellId').value);



            //        var clearCellColor = document.getElementById('hidCellId').value.split(',');
            //        for (i = 0; i < clearCellColor.length; i++) {
            //            //alert(document.getElementById(clearCellColor[i]));
            //            document.getElementById(clearCellColor[i]).bgColor = "#99CCFF";
            //            document.getElementById(clearCellColor[i]).style.color = "Black";

            //        }
            if (!ctrlPressed) {
                var clearCellColor = document.getElementById('hidCellId').value.split(',');
                //  alert(clearCellColor.length);

                for (i = 0; i < clearCellColor.length; i++) {
                    //alert(document.getElementById(clearCellColor[i]));
                    document.getElementById(clearCellColor[i]).bgColor = "#99CCFF";
                    document.getElementById(clearCellColor[i]).style.color = "Black";
                    document.getElementById('<%=hdTotalValueSelected.ClientID%>').value = 1;
                }
                isSelected.value = '';
            }
            var cellNo = cellid.split('_');
            var clearCellColor = document.getElementById('hidCellId').value.split(',');
            if (document.getElementById('<%=hidIsSelected.ClientID%>').value != cellNo[1]) {
                //alert('hi');
                SetColor(clearCellColor, cellNo, id);
                document.getElementById('<%=hidIsSelected.ClientID%>').value = cellNo[1];
            }
            else {
                //alert('ho');
                SetColor(clearCellColor, cellNo, id);
            }
        }

        function SetColor(clearCellColor, cellNo, id) {
            var selectcellNo;
            var counter = 0;
            for (i = 0; i < clearCellColor.length; i++) {
                selectcellNo = clearCellColor[i].split('_');
                var objCell = document.getElementById(clearCellColor[i]);
                if (cellNo[1] == selectcellNo[1]) {

                    if (objCell.bgColor == "#800000") {
                        //alert(objCell.bgColor);
                        objCell.bgColor = "#99CCFF";
                        objCell.style.color = "Black";
                        counter++;
                        if (counter < 2) {
                            IdtoRemove(id);
                        }

                        document.getElementById('<%=hdTotalValueSelected.ClientID%>').value--;

                    }
                    else {
                        objCell.bgColor = "#800000";
                        objCell.style.color = "White";
                        IdtoCopy(id);
                        //  alert('hi');
                        document.getElementById('<%=hdTotalValueSelected.ClientID%>').value++;
                    }
                }
            }
        }
    }


    function IdtoCopy(id) {
        // alert(id);
        //document.getElementById('<%=hdTotalValueSelected.ClientID%>').value = '0';
        //document.getElementById('<%=hidSelectedRow.ClientID%>').value++;
        //document.getElementById('<%=hdTotalValueSelected.ClientID%>').value =parseInt(document.getElementById('<%=hdTotalValueSelected.ClientID%>').value)+1;


        var isSelected = document.getElementById('<%=hidSelectedRow.ClientID%>');
        var selected = isSelected.value.split(',');
        //alert(selected.length);

        var copyflag;
        for (j = 0; j < selected.length; j++) {
            if (selected[j] == id) {
                copyflag = true;

                break;
            }
        }
        if (!copyflag) {
            if (isSelected.value == '') {
                isSelected.value = id;
                //document.getElementById('<%=hdTotalValueSelected.ClientID%>').value++;
            }
            else {
                isSelected.value = isSelected.value + ',' + id;
                //alert(isSelected.value);
                // document.getElementById('<%=hidSelectedRow.ClientID%>').value ++;


            }
        }

        // alert(document.getElementById('<%=hidSelectedRow.ClientID%>').value);

    }


    function IdtoRemove(id) {

        var isSelected = document.getElementById('<%=hidSelectedRow.ClientID%>');
        //alert(isSelected.value);
        var selected = isSelected.value.split(','); //alert(selected); 
        var copyflag;
        var arrExistProd = new Array();
        for (j = 0; j < selected.length; j++) {

            if (selected[j] != id) {
                // alert(selected[j]);
                arrExistProd.push(selected[j]);
                //selected[j] = "";
                //break;
                // alert('hi');
            }
        }
        isSelected.value = '';
        // alert('length:'+arrExistProd.length);
        for (var k = 0; k < arrExistProd.length; k++) {
            //alert(arrExistProd[k]);
            isSelected.value += arrExistProd[k] + ',';
        }
        isSelected.value = isSelected.value.substring(0, isSelected.value.length - 1);
        //   alert(isSelected.value);













    }

    function IsRowSelected() {
        if (document.getElementById('<%=hidSelectedRow.ClientID%>').value == '') {
            alert('Nothing to copy');
            return false;
        }
    }

    function clearCells() {
        //get reference of GridView control
        var grid = document.getElementById("<%= GridView1.ClientID %>");
        //variable to contain the cell of the grid
        var cell;

        if (grid.rows.length > 0) {
            //loop starts from 1. rows[0] points to the header.
            for (i = 1; i < grid.rows.length; i++) {
                //get the reference of first column
                cell = grid.rows[i].cells[i];

                //loop according to the number of childNodes in the cell
                for (j = 0; j < cell.childNodes.length; j++) {

                    cell.childNodes[j].bgColor = "#99CCFF";
                    cell.childNodes[j].style.color = "Black";


                }
            }
        }
    }
    function SelectAll(id) {
        //get reference of GridView control
        var grid = document.getElementById("<%= GridView1.ClientID %>");
        //variable to contain the cell of the grid
        var cell;

        if (grid.rows.length > 0) {
            //loop starts from 1. rows[0] points to the header.
            for (i = 1; i < grid.rows.length; i++) {
                //get the reference of first column
                cell = grid.rows[i].cells[0];

                //loop according to the number of childNodes in the cell
                for (j = 0; j < cell.childNodes.length; j++) {
                    //if childNode type is CheckBox                 
                    if (cell.childNodes[j].type == "checkbox") {
                        //assign the status of the Select All checkbox to the cell checkbox within the grid
                        cell.childNodes[j].checked = document.getElementById(id).checked;
                    }
                }
            }
        }
    }



</script>--%>