function b(){
	h = $(window).height();
	t = $(document).scrollTop();
	
}
$(document).ready(function(e) {
	b();
	$('#gotop').click(function(){
		$(document).scrollTop(0);	
	})
});
$(window).scroll(function(e){
	b();		
})
