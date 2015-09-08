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
//	$(window).load(function(){'use strict';
//		var $portfolio_selectors = $('.portfolio-filter >li>a');
//		var $portfolio = $('.portfolio-items');
//		$portfolio.isotope({
//			itemSelector : '.portfolio-item',
//			layoutMode : 'fitRows'
//		});
//		
//		$portfolio_selectors.on('click', function(){
//			$portfolio_selectors.removeClass('active');
//			$(this).addClass('active');
//			var selector = $(this).attr('data-filter');
//			$portfolio.isotope({ filter: selector });
//			return false;
//		});
//	});

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
//	$("a[rel^='prettyPhoto']").prettyPhoto({
//		social_tools: false
//	});	
	
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
    $(this).children('i').toggleClass('fa-minus');
    
    
    $target.slideToggle("slow", function(){
    	chk = 0;
    });
    //chk = 0;
    }
 });
  
  
$('.product_plan_panel').click(function(e){
	$panel=$(this);
	if($panel.next('.product_plan_panel_content:visible').length>0){
		$('.product_plan_panel').find('.fa-chevron-up').removeClass('fa-chevron-up');
		$('.product_plan_panel_content:visible').slideUp("slow",function(){
			$(".product_plan_panel_content").mCustomScrollbar("destroy");
		});
	}else if($('.product_plan_panel_content:visible').length>0){
		$('.product_plan_panel').find('.fa-chevron-up').removeClass('fa-chevron-up');
		$('.product_plan_panel_content:visible').slideUp("fast",function(){
			$(".product_plan_panel_content").mCustomScrollbar("destroy");
			
			var $target = $panel.next('.fwdpanel-body');
			scrollDownProductPanel($target);
		});
	}else{
		var $target = $panel.next('.fwdpanel-body');		
		scrollDownProductPanel($target);
	}
});

$('.product_plan_inner_panel').click(function(e){
	$panel=$(this);
	if($panel.next('.product_plan_inner_panel_content:visible').length>0){
		$('.product_plan_panel').find('.fa-chevron-up').removeClass('fa-minus');
		$('.product_plan_inner_panel_content:visible').slideUp("slow",function(){
			var $target = $panel.next('.fwdpanel-body');
			$target.find('table').parent().removeAttr('id');
		});
	}else if($('.product_plan_inner_panel_content:visible').length>0){
		$("#plan-no-more-tables").removeAttr('id');
		$('.product_plan_panel').find('.fa-chevron-up').removeClass('fa-minus');
		$('.product_plan_inner_panel_content:visible').slideUp("fast",function(){
			var $target = $panel.next('.fwdpanel-body');
			$target.find('table').parent().attr('id', 'plan-no-more-tables');
			$target.slideDown("slow", function(){
				$panel.find('i').addClass('fa-minus');
			});
		});
	}else{
		$("#plan-no-more-tables").removeAttr('id');
		var $target = $panel.next('.fwdpanel-body');
		$target.find('table').parent().attr('id', 'plan-no-more-tables');
		$target.slideDown("slow", function(){
			$panel.find('i').addClass('fa-minus');
		});
	}
});

function scrollDownProductPanel($element){
	$element.slideDown("slow", function(){
		$panel.find('i').addClass('fa-chevron-up');
		$.mCustomScrollbar.defaults.scrollButtons.enable=true; //enable scrolling buttons by default
		$.mCustomScrollbar.defaults.axis="y";
		$(".product_plan_panel_content").mCustomScrollbar({
			theme:"light-2"
		});
	});
}




//Scroll top  Get more link 
$(document).ready(function(){
  
  //Check to see if the window is top if not then display button
  $(window).scroll(function(){
    if ($(this).scrollTop() > 100) {
      $('.scroll-to-top').fadeIn();
    } else {
      $('.scroll-to-top').fadeOut();
    }
  });
  
  var scrollToTopValid=true;
  //Click event to scroll to top
  $('.scroll-to-top').click(function(){
if(scrollToTopValid){
	scrollToTopValid=false;
	$('html, body').animate({scrollTop : 0},400, function() {
		scrollToTopValid=true;
	});
}
  });
  
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
//$("#inputFullName").keyup(function() {
//   document.getElementById("txtAdFullName1").value = this.value;
//});

//$("#inputTxtAppHkid").keyup(function() {
//   //document.getElementById("txtInsuHkid1").value = this.value;
//	$("#txtInsuHkid1").val(this.value).css("color", "#000000");
//});

jQuery('ul.maintabs li').hover(function () {
	jQuery("a", this).addClass('maintabs-hover');
}, function () {
    jQuery("a", this).removeClass('maintabs-hover');
});



jQuery(document).ready(function() {
	
	/* fixed-content js */

	/*if($(window).height() > $('.carousel').height()  + 40 + 131 + $('#middle').height()){
		jQuery('#middle').removeClass("fixed-content");
	}else if($('#middle').length){
		$(window).scroll(function (event) {
		    var scroll = $(window).scrollTop();
		    var winh = $(window).height();
		    var diff = $('.carousel').height() + 40 + 131 + $('#middle').height() - winh;
		   
		    // Do something
		    if (scroll > diff) {
			    jQuery('#middle').removeClass("fixed-content");
			  } else {
			    jQuery('#middle').addClass("fixed-content");
			  }
		});
	}
	
	
	if($(window).height() > $('.carousel').height()  + 40 + 131 + $('#homecare-scroll').height()){
		jQuery('#homecare-scroll').removeClass("fixed-content");
	}else if($('#homecare-scroll').length){

	        $(window).scroll(function (event) {
	            var scroll = $(window).scrollTop();
	            var winh = $(window).height();
	            var diff = $('.carousel').height()  + 40 + 131 + $('#homecare-scroll').height() - winh;
	            
	            // Do something
	            if (scroll > diff) {
	                jQuery('#homecare-scroll').removeClass("fixed-content");
	              } else {
	                jQuery('#homecare-scroll').addClass("fixed-content");
	              }
	            });
	    //}
	}
	*/
	if(jQuery("#d_clip_button").length){
		var clip = new ZeroClipboard(jQuery("#d_clip_button"));
		var message = getBundle(getBundleLanguage, "confirmation.share.copy");
	  clip.on("ready", function() {
		var oldText = jQuery("#d_clip_button").text();
	    this.on("aftercopy", function(event) {
	    	jQuery("#d_clip_button").width(jQuery("#d_clip_button").width()).text(message).css('padding',0);
	    	setTimeout(function(){ jQuery("#d_clip_button").text(oldText) }, 10000);
	    });
	  });
	}
	if($('.account-dropdown').length && $('#tab-dropdown').length){
		$('.account-dropdown .dropdown-menu a').click(function(){
			var $this = $(this);
			var anchor = $(this).attr('href');
			$('.tab-content .tab-pane').hide();
			$(anchor).show();
			$this.parents('.account-dropdown').children('button').children('.button-text').text($this.text());
			$this.parents('.dropdown-menu').children('li').removeClass('active');
			$this.parent('li').addClass('active');
		});
		$('#tab-dropdown li a').click(function(){
			var $this = $(this);
			var anchor = $(this).attr('href');
			var anchor = $(this).attr('href');
			$('.tab-content .tab-pane').hide();
			$(anchor).show();
			$('.account-dropdown').children('button').children('.button-text').text($this.text());
			$('.account-dropdown .dropdown-menu').children('li').removeClass('active');
			$('.account-dropdown .dropdown-menu').children('li').each(function(){
				$(this).removeClass('active');
				if($(this).children('a').attr('href') == anchor){
					$(this).addClass('active');
				}
			});
		});
	}
});

var chk_cat = 0;
$('.faq_cat_mini').click(function(e){
	e.preventDefault();
	if(chk_cat == 0){
		chk_cat = 1;
		var $target = $(this).parent().parent().next('.faq_cat_detail');
		$(this).children('i').toggleClass('fa-chevron-up');
		
		$target.slideToggle(function(){
			chk_cat = 0;
		});
	}
});

var chk_qna = 0;
$('.faq_qna_mini').click(function(e){
	e.preventDefault();
	if(chk_qna == 0){
		chk_qna = 1;
		var $target = $(this).parent().parent().next('.faq_answer_container');
		$(this).children('i').toggleClass('fa-minus');
		
		var $question = $(this).parent().prev('.faq_question');
		
		$question.toggleClass("active");
		
		$target.slideToggle(function(){
			chk_qna = 0;
		});
	}
});

function faqChangeCare(element, care){
	$(".faq_menu_item").removeClass('active');
	$(element).addClass('active');
	
	$(".faq_care_container").hide();
	$("#faq_"+care).show();
}

function faqChangeCareMob(care){	
	$("#faq_main_menu_mob").hide();
	$("#faq_"+care+"_mob").show();
}

function faqMainMenuMob(care){	
	$("#faq_"+care+"_mob").hide();
	$("#faq_main_menu_mob").show();
}

