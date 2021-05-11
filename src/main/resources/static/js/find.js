$(function() {

    $('#id-find-link').click(function(e) {
		$("#id-find").delay(100).fadeIn(100);
 		$("#pw-find").fadeOut(100);
		$('#pw-find-link').removeClass('active');
		$(this).addClass('active');
	
		e.preventDefault();
	});
    
	$('#pw-find-link').click(function(e) {
		$("#pw-find").delay(100).fadeIn(100);
 		$("#id-find").fadeOut(100);
		$('#id-find-link').removeClass('active');
		$(this).addClass('active');
	
		e.preventDefault();
	});

});
