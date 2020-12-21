$(function(){
  $(window).scroll(function(){
    var scrollTop = $(window).scrollTop();
    if(scrollTop > 300 && scrollTop < 2000){
    	$('.young-host-profile-box').css({transform: 'translateY(' + (scrollTop-300) +'px)'});
    }
  });
});	