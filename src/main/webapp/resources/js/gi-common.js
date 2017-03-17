var floatingBox = function(){
	/* scrolling code starts */
	var floatingbox = $('.floatingbox');
	
	if (floatingbox[0]){
		var floatingboxY = floatingbox.offset().top,
	    wrapboxY = $("#quote-wrap").offset().top;
	    var topMargin = 40;
	    
	    $(window).on('scroll', function(event) {
	    	if ($("#quote-wrap").height() > $(".floatingbox").height()){
	    		var scrollTop = $(window).scrollTop();
	    		var wrapboxRY = wrapboxY+$("#quote-wrap").height();
	    		var floatingboxRY = scrollTop+$(".floatingbox").height()+topMargin;
	
	    		if (wrapboxRY > floatingboxRY){
	    			floatingbox.stop(false).animate({
	                    top: scrollTop < floatingboxY ? 0 : scrollTop - floatingboxY + topMargin
	                }, 100);
	    		}else{
	    			if (floatingboxRY > wrapboxRY){
	                    floatingbox.css("top", $("#quote-wrap").height()-$(".floatingbox").height())
	                }
	    		}
	    	}
	    });
	}
	/* scrolling code ends */	
}();