jQuery(function($) {'use strict',

	//#main-slider
	$(function(){
		$('#main-slider.carousel').carousel({
			interval: 8000
		});
	});


	// accordian
	$('.accordion-toggle').on('click', function(){
		$(this).closest('.panel-group').children().each(function(){
		$(this).find('>.panel-heading').removeClass('active');
		 });
		
	 	$(this).closest('.panel-heading').toggleClass('active');
	});

	//Initiat WOW JS
	new WOW().init();

	// portfolio filter
	$(window).load(function(){'use strict';
		var $portfolio_selectors = $('.portfolio-filter >li>a');
		var $portfolio = $('.portfolio-items');
		$portfolio.isotope({
			itemSelector : '.portfolio-item',
			layoutMode : 'fitRows'
		});
		
		$portfolio_selectors.on('click', function(){
			$portfolio_selectors.removeClass('active');
			$(this).addClass('active');
			var selector = $(this).attr('data-filter');
			$portfolio.isotope({ filter: selector });
			return false;
		});
	});

	// Contact form
	var form = $('#main-contact-form');
	form.submit(function(event){
		event.preventDefault();
		var form_status = $('<div class="form_status"></div>');
		$.ajax({
			url: $(this).attr('action'),

			beforeSend: function(){
				form.prepend( form_status.html('<p><i class="fa fa-spinner fa-spin"></i> Email is sending...</p>').fadeIn() );
			}
		}).done(function(data){
			form_status.html('<p class="text-success">' + data.message + '</p>').delay(3000).fadeOut();
		});
	});

	
	//goto top
	$('.gototop').click(function(event) {
		event.preventDefault();
		$('html, body').animate({
			scrollTop: $("body").offset().top
		}, 500);
	});	

	//Pretty Photo
	$("a[rel^='prettyPhoto']").prettyPhoto({
		social_tools: false
	});	
	
});

//Account Drop Down
	$(document).ready(function(e){
    $('#acc_drop .dropdown-menu').find('a').click(function(e) {
		e.preventDefault();
		var param = $(this).attr("href").replace("#","");
		var concept = $(this).text();
		$('#acc_drop span#search_concept').text(concept);
	
	});
});


// travel plan

// PANELS

var chk = 0;
  $('.fwdpanel-minimize').click(function(e){
    e.preventDefault();
    if(chk == 0){
    	chk = 1;
    var $target = $(this).parent().parent().parent().next('.fwdpanel-body');
    if($target.is(':visible')) {
     $('i',$(this)).removeClass('fa-minus').addClass('fa-plus'); 
    }
    else {
        $('i',$(this)).removeClass('fa-plus').addClass('fa-minus');
    }
    
    $target.slideToggle("slow", function(){
    	chk = 0;
    });
    //chk = 0;
    }
 });




//Scroll top  Get more link 
$(document).ready(function(){
  
  //Check to see if the window is top if not then display button
  $(window).scroll(function(){
    if ($(this).scrollTop() > 100) {
      $('.scrollToTop').fadeIn();
    } else {
      $('.scrollToTop').fadeOut();
    }
  });
  
  //Click event to scroll to top
  $('.scrollToTop').click(function(){
    $('html, body').animate({scrollTop : 0},400);
    return false;
  });
  
});
/// Auto fill inputbox on   plan details
$("#inputFullName").keyup(function() {
   document.getElementById("txtAdFullName1").value = this.value;
});
$("#inputTxtAppHkid").keyup(function() {
   document.getElementById("txtInsuHkid1").value = this.value;
});

jQuery('ul.maintabs li').hover(function () {
	jQuery("a", this).addClass('maintabs-hover');
}, function () {
    jQuery("a", this).removeClass('maintabs-hover');
});

/* fixed-content js */
$(window).scroll(function (event) {
    var scroll = $(window).scrollTop();
    var winh = $(window).height();
    var diff = $('.carousel').height() + 40 + 115 + 230- winh;
   
    // Do something
    if (scroll > diff) {
	    jQuery('#middle').removeClass("fixed-content");
	  } else {
	    jQuery('#middle').addClass("fixed-content");
	  }
});

jQuery(document).ready(function() {
	if($('#homecare-scroll').length){
	    var winh = $(window).height();
	    var conh = $('#main-slider').height() + $('#header').height() + 50;
	    if(conh > winh)
	    {
	        var bottom = $('#homecare-scroll').outerHeight() - $('#homecare-scroll h2').outerHeight() - 30;
	        jQuery('#homecare-scroll').css('bottom', -bottom);
	        $(window).scroll(function (event) {
	            var scroll = $(window).scrollTop();
	            var winh = $(window).height();
	            var diff = $('.carousel').height()  + 60 + 200- winh;
	            
	            // Do something
	            if (scroll > diff) {
	                jQuery('#homecare-scroll').removeClass("fixed-content");
	              } else {
	                jQuery('#homecare-scroll').addClass("fixed-content");
	              }
	            });
	    }
	}

	if(jQuery("#d_clip_button").length){
		var clip = new ZeroClipboard(jQuery("#d_clip_button"));
	  clip.on("ready", function() {
		var oldText = jQuery("#d_clip_button").text();
	    this.on("aftercopy", function(event) {
	    	jQuery("#d_clip_button").width(jQuery("#d_clip_button").width()).text('Copied').css('padding',0);
	    	setTimeout(function(){ jQuery("#d_clip_button").text(oldText) }, 10000);
	    });
	  });
	}
  
});