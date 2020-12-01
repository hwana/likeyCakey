$(document).ready(function(){
	$('#biz-member-link').click(function(e) {
		$("#register-form").delay(100).fadeIn(100);
 		$("#login-form").fadeOut(100);
		$('#normal-member-link').removeClass('active');
		$(this).addClass('active');
		e.preventDefault();
	});
	
});
