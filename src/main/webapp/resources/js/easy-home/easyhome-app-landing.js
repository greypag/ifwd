$(document).ready(function(){

	setTimeout(function(){
		$(".offset_card_holder").autoAlignHeight({child: ".eh_sec_title", minWidth: 992});
		$(".offset_card_holder").autoAlignHeight({child: ".inner", minWidth: 992});
		$(".eh_theclub_container").autoAlignHeight({child: ".ah_box", minWidth: 992});
		$(".eh_cfucome_banner").autoAlignHeight({child: ".ah_box", minWidth: 992});
		$(".eh_moreProtect_banner").autoAlignHeight({child: ".ah_box", minWidth: 992});
		$(".eh_3_feature").autoAlignHeight({child: ".eh_feature_box_title", minWidth: 992, onFinish:function (){
			$(".autoAlignBox").autoAlignHeight({child: ".inner", minWidth: 992});
		}});

		$('#canvas').on('inview', function(event, isInView) {
		  if (isInView && $(this).hasClass("waiting")){
		  	// element is now visible in the viewport
		  	$(this).removeClass("waiting");
		    init();
		  } else {
		    // element has gone out of viewport
		  }
		});

		$('.introAni').on('inview', function(event, isInView) {
		  if (isInView && $(this).hasClass("waiting")){
		    // element is now visible in the viewport
		    $(this).removeClass("waiting");
		  } else {
		    // element has gone out of viewport
		  }
		});
	}, 1200);

});



// sample config
// conf{
// 	child: ".inner",
// 	minWidth: 992
// }
$.fn.autoAlignHeight = function(conf) {
		var parentDom = this;
		var childDom = conf.child;
		var _conf = conf;

		reAlignHeight();

		$(window).on("resize", reAlignHeight);
		$(window).on("orientationchange", reAlignHeight);

		// window.onorientationchange = reAlignHeight;
		// window.onresize = reAlignHeight;

		function reAlignHeight(){
			if(window.innerWidth < _conf.minWidth){
				resetChildHeight();
				return;
			}
			alignChildHeight(parentDom, conf.child);
		}

		function resetChildHeight(){
			$(parentDom).find(childDom).each(function() {
		        $(this).css("height", "auto");
		    });
		}

		function alignChildHeight(sel, child) {
		    //reset all child height
			$(sel).find(child).css("height", "auto");
			
			setTimeout(function (){
				var max = 0;
			    $(sel).find(child).each(function() {
			        c_height = parseInt($(this).outerHeight(false));
			        if (c_height > max) {
			            max = c_height;
			        }
			    });
			    $(sel).find(child).outerHeight(max);
			    
			    if(!!conf.onFinish){
			    	conf.onFinish();
			    }
			}, 500);
			
		}	
	
};

(function (){
	$(document).ready(function(){
		$('*[data-ani2]').on("click", function (){
			var jSelecctor = $(this).attr("data-ani2");
			var offsetTop = $(jSelecctor).offset().top;

			$("html, body").animate({ scrollTop: (offsetTop - 50) + "px" });
		});
	});
})();