<%@ Page Language="C#" AutoEventWireup="true" CodeFile="jQueryCustomDataTable.aspx.cs"
    Inherits="jQueryCustomDataTable" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>

    <script src="js/jquery-1.4.2.min.js" type="text/javascript"></script>

    <script src="js/jquery.dataTables.min.js" type="text/javascript"></script>

    <style type="text/css">
        .myGrid
        {
            width: 100%;
            margin: 0px 0 0px 0;
            border: solid 1px #525252;
            border-collapse: collapse;
            width: 600px;
        }
        .myGrid td
        {
            padding: 2px;
            border: solid 1px #c1c1c1;
            color: Black;
            font-family: Arial,Helvetica,sans-serif;
            font-size: 0.9em;
        }
        .myGrid th
        {
            color: #fff;
            background: url(images/grid_header.png) repeat-x top;
            font-family: Arial,Helvetica,sans-serif;
            font-size: 0.9em;
            cursor: pointer;
        }
        .dataTables_paginate
        {
            width: 600px;
            background: url(images/grid_pager.png) repeat-x top;
            text-align: center;
        }
        .paging_full_numbers
        {
            width: 600px;
            height: 24px;
            padding: 4px 0px 2px 0px;
            vertical-align: middle;
            line-height: 22px;
        }
        .paging_full_numbers span.paginate_button, .paging_full_numbers span.paginate_active
        {
            border: 1px solid #aaa;
            padding: 2px 5px;
            margin: 0 3px;
            cursor: pointer;
            cursor: hand;
        }
        .paging_full_numbers span.paginate_button
        {
            background-color: #fff;
        }
        .paging_full_numbers span.paginate_button:hover
        {
            background-color: #ccc;
        }
        .paging_full_numbers span.paginate_active
        {
            background-color: #99B3FF;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table id="grid" class="myGrid">
            <thead>
                <tr>
                    <th>
                        pid
                    </th>
                    <%--<th>
                        pname
                    </th>--%>
                    <%-- <th>
                        Preparation Time
                    </th>
                    <th>
                        Cooking Time
                    </th>--%>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td colspan="5">
                        Loading....
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="errorMessage">
    </div>
    <input type="hidden" id="hdControl" runat="server" />
    </form>
</body>
</html>

<script language="javascript" type="text/javascript">


    $(document).ready(function() {
        function renderTable(result) {
            var dtData = [];
            $.each(result, function() {
                dtData.push([
                //                           this.by,
                //                           this.Recipiename,
                //                           this.preparationtime,
                //                           this.cookingtime
                           this.msg
                //                                           this.pname
                        ]);
            });

            $('#grid').dataTable({ //grid is the id of the table
                'aaData': dtData,
                'bPaginate': true,
                'bInfo': false,
                'bFilter': false,
                'bLengthChange': false,
                "aoColumns": [
			        { "bSortable": false, sWidth: '80px' }
                //                			        { sWidth: '180px' }
                //			        { sWidth: '170px' },
                //			        { sWidth: '170px' }
		        ],
                'sPaginationType': 'full_numbers',
                'iDisplayLength': 1,
                "fnDrawCallback": function() {
                   // alert($("#grid").find("tr:not(.ui-widget-header)").length);
                    if ($("#grid").find("tr:not(.ui-widget-header)").length <= 1) {
                        $('div.dataTables_paginate')[0].style.display = "none";
                    } else {
                        $('div.dataTables_paginate')[0].style.display = "block";
                    }
                }
            });
        }


        $.ajax({
            type: "GET",
            url: "JsonWebService.asmx/GetRecipie?controlId=" + $('#hdControl').val(),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function(response) {
                renderTable(response.d);
            },
            failure: function(errMsg) {
                alert('hi');
                $('#errorMessage').text(errMsg); //errorMessage is id of the div
            }
        });
    });

</script>
<script type="text/javascript">
    function funMakeFocus(controlId) {
        alert(parent.document.getElementById(controlId));
        parent.document.getElementById(controlId).focus();
    }
</script>

