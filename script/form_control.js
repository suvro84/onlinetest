$(document).ready(function () {
    ButtonControl();
	EditButton();
});
function ButtonControl() {

    if (!$("input:button").hasClass('edit-submit')) {
        $("input:button").addClass("edit-submit");
    }
    if (!$("input:submit").hasClass("edit-submit")) {
        $("input:submit").addClass("edit-submit");
    }
    if (!$("input:reset").hasClass("edit-submit")) {
        $("input:reset").addClass("edit-submit");
    }
    if (!$("input:text").hasClass("edit-text")) {
        $("input:text").addClass("edit-text");
    }
    if (!$("input:text:disabled").hasClass("edit-disabled")) {
        $("input:text:disabled").addClass("edit-disabled");
    }

    if (!$("input:button").parents("div:first").hasClass("jquery-roundedBtn")) {
        $("input:button").wrap("<div class='jquery-roundedBtn'></div>");
        $("input:button").after("<span class='spanRt'></span>");
        $("input:button").before("<span class='spanLt'></span>");
    }


    if (!$("input:submit").parents("div:first").hasClass("jquery-roundedBtn")) {
        $("input:submit").wrap("<div class='jquery-roundedBtn'></div>");
        $("input:submit").after("<span class='spanRt'></span>");
        $("input:submit").before("<span class='spanLt'></span>");
    }

    if (!$("input:reset").parents("div:first").hasClass("jquery-roundedBtn")) {
        $("input:reset").wrap("<div class='jquery-roundedBtn'></div>");
        $("input:reset").after("<span class='spanRt'></span>");
        $("input:reset").before("<span class='spanLt'></span>");
    }
  /* var totalWidth = $('.jquery-roundedBtn .spanLt').outerWidth() + $('.jquery-roundedBtn .spanRt').outerWidth() + $('.jquery-roundedBtn input').outerWidth();
   $('.jquery-roundedBtn').css('width', totalWidth);*/

}

function EditButton() {
var x = $("#mydiv2 .jquery-roundedBtn");
$(x).parent().html($(x).html());
$(x).remove();
$(".spanRt,.spanLt",$("#mydiv2") ).remove();
$("#mydiv2").find("input:button" ).addClass("edit-submit").wrap("<div class='Editjquery-roundedBtn'></div>").after("<span class='EditspanRt'></span>").before("<span class='EditspanLt'></span>");

var totalWidth = $('.Editjquery-roundedBtn .EditspanLt').outerWidth() + $('.Editjquery-roundedBtn .EditspanRt').outerWidth() + $('.Editjquery-roundedBtn input').outerWidth();
   $('.Editjquery-roundedBtn').css('width', totalWidth);
   
}

$(document).ready(function(){
$('input[type=file]').each(function(){
    $(this).addClass('file').addClass('hidden');
    $(this).parent().append($('<div class="fakefile" />').append($('<input type="text" />').attr('id',$(this).attr('id')+'__fake')).append($('<img src="../images/btn-browse.png" class="browse_btn" alt="Browse" title="Browse"/>')));
 
    $(this).bind('change', function() {
      $('#'+$(this).attr('id')+'__fake').val($(this).val());;
    });
    $(this).bind('mouseout', function() {
      $('#'+$(this).attr('id')+'__fake').val($(this).val());;
    });
  });
});