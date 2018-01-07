<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RptJqeryDataTable.aspx.cs" Inherits="RptJqeryDataTable" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
  <title>DataTables example</title>
		<style type="text/css" title="currentStyle">
			@import "media/css/demo_page.css";
			@import "media/css/demo_table.css";
		</style>
		
		
   
    
		<script type="text/javascript" language="javascript" src="media/js/jquery.js"></script>
		<script type="text/javascript" language="javascript" src="media/js/jquery.dataTables.js"></script>
		<script type="text/javascript" charset="utf-8">
		    /* Time between each scrolling frame */
		    $.fn.dataTableExt.oPagination.iTweenTime = 100;

		    $.fn.dataTableExt.oPagination.scrolling = {
		        "fnInit": function(oSettings, nPaging, fnCallbackDraw) {
		            /* Store the next and previous elements in the oSettings object as they can be very
		            * usful for automation - particularly testing
		            */
		            var nPrevious = document.createElement('div');
		            var nNext = document.createElement('div');

		            if (oSettings.sTableId !== '') {
		                nPaging.setAttribute('id', oSettings.sTableId + '_paginate');
		                nPrevious.setAttribute('id', oSettings.sTableId + '_previous');
		                nNext.setAttribute('id', oSettings.sTableId + '_next');
		            }

		            nPrevious.className = "paginate_disabled_previous";
		            nNext.className = "paginate_disabled_next";

		            nPrevious.title = oSettings.oLanguage.oPaginate.sPrevious;
		            nNext.title = oSettings.oLanguage.oPaginate.sNext;

		            nPaging.appendChild(nPrevious);
		            nPaging.appendChild(nNext);

		            $(nPrevious).click(function() {
		                /* Disallow paging event during a current paging event */
		                if (typeof oSettings.iPagingLoopStart != 'undefined' && oSettings.iPagingLoopStart != -1) {
		                    return;
		                }

		                oSettings.iPagingLoopStart = oSettings._iDisplayStart;
		                oSettings.iPagingEnd = oSettings._iDisplayStart - oSettings._iDisplayLength;

		                /* Correct for underrun */
		                if (oSettings.iPagingEnd < 0) {
		                    oSettings.iPagingEnd = 0;
		                }

		                var iTween = $.fn.dataTableExt.oPagination.iTweenTime;
		                var innerLoop = function() {
		                    if (oSettings.iPagingLoopStart > oSettings.iPagingEnd) {
		                        oSettings.iPagingLoopStart--;
		                        oSettings._iDisplayStart = oSettings.iPagingLoopStart;
		                        fnCallbackDraw(oSettings);
		                        setTimeout(function() { innerLoop(); }, iTween);
		                    } else {
		                        oSettings.iPagingLoopStart = -1;
		                    }
		                };
		                innerLoop();
		            });

		            $(nNext).click(function() {
		                /* Disallow paging event during a current paging event */
		                if (typeof oSettings.iPagingLoopStart != 'undefined' && oSettings.iPagingLoopStart != -1) {
		                    return;
		                }

		                oSettings.iPagingLoopStart = oSettings._iDisplayStart;

		                /* Make sure we are not over running the display array */
		                if (oSettings._iDisplayStart + oSettings._iDisplayLength < oSettings.fnRecordsDisplay()) {
		                    oSettings.iPagingEnd = oSettings._iDisplayStart + oSettings._iDisplayLength;
		                }

		                var iTween = $.fn.dataTableExt.oPagination.iTweenTime;
		                var innerLoop = function() {
		                    if (oSettings.iPagingLoopStart < oSettings.iPagingEnd) {
		                        oSettings.iPagingLoopStart++;
		                        oSettings._iDisplayStart = oSettings.iPagingLoopStart;
		                        fnCallbackDraw(oSettings);
		                        setTimeout(function() { innerLoop(); }, iTween);
		                    } else {
		                        oSettings.iPagingLoopStart = -1;
		                    }
		                };
		                innerLoop();
		            });

		            /* Take the brutal approach to cancelling text selection */
		            $(nPrevious).bind('selectstart', function() { return false; });
		            $(nNext).bind('selectstart', function() { return false; });
		        },

		        "fnUpdate": function(oSettings, fnCallbackDraw) {
		            if (!oSettings.aanFeatures.p) {
		                return;
		            }

		            /* Loop over each instance of the pager */
		            var an = oSettings.aanFeatures.p;
		            for (var i = 0, iLen = an.length; i < iLen; i++) {
		                if (an[i].childNodes.length !== 0) {
		                    an[i].childNodes[0].className =
					(oSettings._iDisplayStart === 0) ?
					oSettings.oClasses.sPagePrevDisabled : oSettings.oClasses.sPagePrevEnabled;

		                    an[i].childNodes[1].className =
					(oSettings.fnDisplayEnd() == oSettings.fnRecordsDisplay()) ?
					oSettings.oClasses.sPageNextDisabled : oSettings.oClasses.sPageNextEnabled;
		                }
		            }
		        }
		    }

		    $(document).ready(function() {
		        $('#example').dataTable({
		            "sPaginationType": "scrolling"
		        });
		    });
		</script>
    <%--<link rel="stylesheet" href="Datatables/css/demo_table.css"type="text/css" />
<script type="text/javascript" src="Datatables/js/jquery.js"></script>
<script type="text/javascript" src="Datatables/js/jquery.dataTables.js"></script>

<script type="text/javascript">
  $(document).ready(function() {
  $('#tblOscarNominees').dataTable({ "oLanguage": { "sSearch": "Search the nominees:" },
                    "iDisplayLength": 10,
                    "aaSorting": [[0, "asc"]]});
    });
</script>--%>

</head>
<body>
    <form id="form1" runat="server">
    <div>
    <%--<asp:Repeater ID="rptOscarNominees" runat="server">
  <HeaderTemplate>
    <table id="example" cellpadding="0" cellspacing="0" border="0" class="display">
      <thead>
        <tr>
            <th>pid</th>  
            <th>pname</th>
      
        </tr>
      </thead>
      <tbody>
  </HeaderTemplate>
  <ItemTemplate>
    <tr>
      <td><%# Eval("pid")%></td>
      <td><%# Eval("pname")%></td>
 
    </tr>
  </ItemTemplate>
  <FooterTemplate>
    </tbody>
    </table>
  </FooterTemplate>
</asp:Repeater>--%>





<asp:Repeater ID="rptOscarNominees" runat="server">
  <HeaderTemplate>
<table cellpadding="0" cellspacing="0" border="0" class="display" id="example">
	<thead>
		<tr>
			<th>Rendering engine</th>
			<th>Browser</th>
			
		</tr>
	</thead>
	<tbody>
	</HeaderTemplate>
  <ItemTemplate>
		<tr class="gradeX">
			<td><%# Eval("pid")%></td>
			<td><%# Eval("pname")%></td>
			
		</tr>
		
		
	</tbody>
	
</table>
</ItemTemplate>
<FooterTemplate>
    </tbody>
    </table>
  </FooterTemplate>
</asp:Repeater>
<div class="spacer"></div>
    </div>
    </form>
</body>
</html>

