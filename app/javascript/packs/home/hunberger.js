$(function() {
	$('#menu').on("click", function(){
		$('.menu-list').toggleClass('open');
	});
});
$(function() {
	$('#container').on("click", function() {
		$('.menu-list').removeClass('open');
	});
});
