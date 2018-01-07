// JavaScript Document

$(document).ready(function() {
$("#treemenu1 li a").hover(function () {
		$(this).parent().children("ul").show();
        },function(){
		$(this).parent().children("ul").hide();
	});//hover
$("#treemenu1 li ul").hover(function () {
		$(this).show();
		$(this).parent().find("a:first").addClass("active");
        },function(){
		$(this).hide();
		$(this).parent().find("a:first").removeClass("active");
	});//hover	


});// document ready

