$(function() {

	//change border color set-appointment
	var radioId = $('input[name=set-appointment-select]:checked', '#service-centre').attr("id");
	changeBorder(radioId);

	$('#service-centre input[type="radio"]').on('change', function() {
	   	var radioId = $('input[name=set-appointment-select]:checked', '#service-centre').attr("id");
	   	changeBorder(radioId);
	});
	
	//Beneficiary Info
	//added by: RMN
	$("#own-estate-now").click(function() {
		$('#beneficiary-contents').addClass('hidden');
		$('#add-beneficiary-2').addClass('hidden');
		$('#add-beneficiary-3').addClass('hidden');
	});
	
	$("#name-others-now").click(function() {
		if($('#beneficiary-contents').hasClass('hidden')){
			$('#beneficiary-contents').removeClass('hidden');
		}
		
		if($('#add-beneficiary-2').hasClass('hidden')){
			$('#add-beneficiary-2').removeClass('hidden');
		}
		
		if($('#add-beneficiary-3').hasClass('hidden')){
			$('#add-beneficiary-3').removeClass('hidden');
		}
	
	});
	
	
	//by: RMN
	$("#residence-check").change(function() {
		if(this.checked) {
			$('#passport-section').addClass('hidden');
		}
		else{
			if($('#passport-section').hasClass('hidden')){
				$('#passport-section').removeClass('hidden');
			}
		}
	});
	
	
	$("#file-upload").change( function() {
		$('#select-file-section').addClass('hidden');
		
		if($('#finish-upload').hasClass('hidden')){
			$('#finish-upload').removeClass('hidden');
		}
	});
	
	
	$("#file-upload-addr").change( function() {
		$('#select-file-section-address').addClass('hidden');
		
		if($('#finish-upload-addr').hasClass('hidden')){
			$('#finish-upload-addr').removeClass('hidden');
		}
	});
	
	//Tooltip
	//by: RMN
	 $('[data-toggle="tooltip"]').tooltip();  
	 //$('[data-toggle=tooltip]').tooltip({trigger: 'manual'}).tooltip('show'); 
	
	
	//Upload Document Radio Buttons
	//by: RMN
	//give-store
	$("#give-store").click(function() {
		$('#upload-later-section').addClass('hidden');
		$('#upload-now-section').addClass('hidden');
		if($('#submit-btn').hasClass('hidden')){
			$('#submit-btn').removeClass('hidden');
		}
	});
	
	//upload-later
	$("#upload-later").click(function() {
		if($('#upload-later-section').hasClass('hidden')){
			$('#upload-later-section').removeClass('hidden');
		}
		
		$('#upload-now-section').addClass('hidden');
		$('#submit-btn').addClass('hidden');
	});
	
	//upload-now
	$("#upload-now").click(function() {
		if($('#upload-now-section').hasClass('hidden')){
			$('#upload-now-section').removeClass('hidden');
		}
		
		if($('#submit-btn').hasClass('hidden')){
			$('#submit-btn').removeClass('hidden');
		}
		$('#upload-later-section').addClass('hidden');
	});
	
	// Sales Illustration Page to FNA Page
	$("#made-decision-next-btn").on('click', function(){
         window.location = "fna.jsp";    
    });	

	// FNA Page to Application Page
	$("#fna-next-btn").on('click', function(){
         window.location = "application.jsp";    
    });

	// FNA Page to Sales Illustration Page
	$("#fna-return-btn").on('click', function(){
         window.location = "sales-illustration.jsp";    
    });    

	// Application Page to Order Page
	$("#application-proceed-btn").on('click', function(){
         window.location = "order-summary.jsp";    
    });

	// Application Page to Fna Page
	$("#application-return-btn").on('click', function(){
         window.location = "fna.jsp";    
    });    

	// Order Page to Declaration Page
	$("#order-summary-proceed-btn").on('click', function(){
         window.location = "declaration-authorization.jsp";    
    });    

	// Order Page to Application Page
	$("#order-summary-return-btn").on('click', function(){
         window.location = "application.jsp";    
    });    

	// Declaration Page to Signature Page
	$("#declaration-proceed-btn").on('click', function(){
         window.location = "signature.jsp";    
    });   

	// Declaration Page to Order Page
	$("#declaration-return-btn").on('click', function(){
         window.location = "order-summary.jsp";    
    });    

	// Signature Page to Set Appointment Page
	$("#signature-proceed-btn").on('click', function(){
         window.location = "set-appointment.jsp";    
    });         

	// Signature Page to Declaration Page
	$("#signature-return-btn").on('click', function(){
         window.location = "declaration-authorization.jsp";    
    });    
    
	// Set Appointment Page to Upload Document Page
	$("#set-application-confirm-btn").on('click', function(){
		window.location = "upload-document.jsp";    
	});     

	// Set Appointment Page to Signature Page
	$("#set-appointment-return-btn").on('click', function(){
         window.location = "signature.jsp";    
    });       

	// Upload Document Page to Thank You Page
	$("#upload-doc-submit-btn").on('click', function(){
 	window.location = "overall.jsp";    
 	});    

	// Upload Document Page to Set Appointment Page
	$("#upload-doc-return-btn").on('click', function(){
         window.location = "set-appointment.jsp";    
    });    

	// Overall Page Links
	// Sales Illustration Page
	$("#sales-edit-btn").on('click', function(){
         window.location = "sales-illustration.jsp";    
    });

	// FNA Page
	$("#fna-edit-btn").on('click', function(){
         window.location = "fna.jsp";    
    });

	// Application Page
	$("#application-edit-btn").on('click', function(){
         window.location = "application.jsp";    
    });    

	// Order Summary Page
	$("#application-view-btn").on('click', function(){
         window.location = "order-summary.jsp";    
    });    

	// Set Appointment Page
	$("#appointment-change-btn").on('click', function(){
         window.location = "set-appointment.jsp";    
    });    
	
	//Signature Radio Buttons
	//by: RMN
	
	$("#offline-signature").click(function() {
		$('#signature-section').addClass('hidden');
	});
	
	$("#digital-signature").click(function() {
		if($('#signature-section').hasClass('hidden')){
			$('#signature-section').removeClass('hidden');
		}
		
	});
	//change caret class
	window.onload = function() {
		if($('span.caret').hasClass('caret')) {
	        $('span.caret').removeClass('caret').addClass('icon-chevron-thin-down');
	    }
	}
	
	if ($('#male-1').length > 0) {
		changeColorRadioButtonLabel (1);
	}

	$("#own-estate, #name-others").change(function () {
		if ($("#name-others").is(":checked")) {
			if(getWidth()<992) {
				ifSelected("name-others-label", "own-estate-label");
			}

			else {
				$("#own-estate-label").addClass("hidden-sm hidden-xs");	
			}
		}
		else {
			if(getWidth()<992) {
				ifSelected("own-estate-label", "name-others-label");
			}

			else {	
				$("#name-others-label").addClass("hidden-sm hidden-xs");
			}
		}
	});

	$("#pay-online-radio, #pay-later-radio").change(function () {
		if ($("#pay-online-radio").is(":checked")) {
			if(getWidth()<992) {
				ifSelected("pay-online-label", "pay-later-label");
			}

			else {
				$("#pay-later-label").addClass("hidden-sm hidden-xs");	
			}
		}
		else {
			if(getWidth()<992) {
				ifSelected("pay-later-label", "pay-online-label");
			}

			else {	
				$("#pay-online-label").addClass("hidden-sm hidden-xs");
			}
		}
	});

	$("#roundedOne-male, #roundedOne-female").change(function () {
		if ($("#roundedOne-female").is(":checked")) {
			if(getWidth()<992) {
				ifSelected("roundedOne-female-label", "roundedOne-male-label");
			}

			else {
				removeClass("roundedOne-female-label");	
			}
		}
		else {
			if(getWidth()<992) {
				ifSelected("roundedOne-male-label", "roundedOne-female-label");
			}

			else {
				removeClass("roundedOne-male-label");	
			}
		}
	});

	if ($('#payment-content').length > 0) {
		$("#pay-later-radio, #pay-online-radio").change(function () {			
			if($("#pay-later-radio").is(":checked"))
			{
				$("#payment-content").addClass("hidden");
				$("#payment-policy").addClass("hidden");
			}
			else
			{
				$("#payment-content").removeClass("hidden");
				$("#payment-policy").removeClass("hidden");
			}
		});
	}

	if ($('#estate').length > 0) {
		$("#own-estate, #name-others").change(function () {			
			if($("#own-estate").is(":checked"))
			{
				$("#beneficiary-contents, #add-beneficiary-2, #add-beneficiary-3").addClass("hidden");
			}
			else
			{
				$("#beneficiary-contents, #add-beneficiary-2, #add-beneficiary-3").removeClass("hidden");
			}
		});
	}

	if($("#personal-info").length > 0) {
		$("#personal-info-next").click(function(){
        	$('html, body').animate({
				scrollTop: $('#employment-info').offset().top - $('.navbar-fixed-top').height()
			}, 1000);
    	});

    	$("#employment-info-next").click(function(){
        	$('html, body').animate({
				scrollTop: $('#beneficiary-info').offset().top - $('.navbar-fixed-top').height()
			}, 1000);
    	});

    	$("#beneficiary-info-next").click(function(){
        	$('html, body').animate({
				scrollTop: $('#payment').offset().top - $('.navbar-fixed-top').height()
			}, 1000);
    	});
	}

	if($("#illustration-next-btn").length > 0) {
		$("#illustration-next-btn").click(function(){
        	$('html, body').animate({
				scrollTop: $('#application-review-container').offset().top - $('.navbar-fixed-top').height()
			}, 1000);
    	});
	}

	if($("#set-appointment-next").length > 0) {
		$("#set-appointment-next").click(function(){
        	$('html, body').animate({
				scrollTop: $('#view-selected-appointment').offset().top - $('.navbar-fixed-top').height()
			}, 1000);
    	});
	}

	if($("#financial-analysis-next").length > 0) {
		$("#financial-analysis-next").click(function(){
        	$('html, body').animate({
				scrollTop: $('#fna-policy-replacement').offset().top - $('.navbar-fixed-top').height()
			}, 1000);
    	});
	}	


	if($("#add-beneficiary-2").length > 0) { 
		$("#add-beneficiary-button-2").click(function(){
			$("#add-beneficiary-2 .add-beneficiary" ).addClass("hidden");
			//add form
			addFormBeneficiary ($("#add-beneficiary-button-2").attr("value"));
		});
		$("#add-beneficiary-button-3").click(function(){
			$("#add-beneficiary-3 .add-beneficiary" ).addClass("hidden");
			//add form
			addFormBeneficiary ($("#add-beneficiary-button-3").attr("value"));
		});
	}

	//Mobile Menu on Accordion Expanded
	//by: RMN
	
	$('#travel-mobile-menu').click(function(){	
		if($('#travel-mobile-menu').hasClass('collapsed')){
			$('#arrow-travel').removeClass('arrow-right');
			$('#arrow-travel').addClass('arrow-down ');
		}
		else{
			$('#arrow-travel').removeClass('arrow-down');
			$('#arrow-travel').addClass('arrow-right');
		}
	});

	
	//Date Picker for Application Page
	//by: RMN
	if($("#personal-info-datePicker").length > 0) {
		$('#personal-info-datePicker').datepicker({
			autoclose: true,
		});
	}
	//Input number only
	//by: RMN
	$('#residential-first').keypress(function(e) {
		var a = [];
		var k = e.which;
		
		for (i = 48; i < 58; i++)
			a.push(i);
		
		if (!(a.indexOf(k)>=0))
			e.preventDefault();
	});
	
	$('#residential-second').keypress(function(e) {
		var a = [];
		var k = e.which;
		
		for (i = 48; i < 58; i++)
			a.push(i);
		
		if (!(a.indexOf(k)>=0))
			e.preventDefault();
	});
	
	$('#mobile-first').keypress(function(e) {
		var a = [];
		var k = e.which;
		
		for (i = 48; i < 58; i++)
			a.push(i);
		
		if (!(a.indexOf(k)>=0))
			e.preventDefault();
	});
	
	$('#mobile-second').keypress(function(e) {
		var a = [];
		var k = e.which;
		
		for (i = 48; i < 58; i++)
			a.push(i);
		
		if (!(a.indexOf(k)>=0))
			e.preventDefault();
	});
	
		
	//Sample only
	$('#previous').click(function(){
		alert('Previous');
	});
	
	//next button onclick
	$('#next').click(function(){
		$('#timeline-step-2').addClass('done');
	});
	
	//DATE PICKER
	if($("#datePicker").length > 0) {
		var datePlaceholder = (getWidth() >= 992) ? "28th May 1996" : "1996-05-28";
		var $datePicker = $("#datePicker");
		$('#dates').attr('placeholder', datePlaceholder);
		changeDatePickerValue($datePicker);
	}
	//SET-APPOINTMENT PAGE DATEPICKER
	if($("#scheduler-datePicker").length > 0) {
		var $sched_datePicker = $("#scheduler-datePicker");
		$sched_datePicker.datepicker({
	        startDate: new Date(),
	       	autoclose: true,
	       	format: 'd MM yy',
	       	language: 'zh-CN'
	    }).on("changeDate", function(e) {
	        $sched_datePicker.datepicker('hide');
	      });
	}
	$('.dropdown')
		.on('show.bs.dropdown', function(e){
			if (!$('body').hasClass('page-sales-illustration')) {
				$('.navbar-menu').addClass('show-dropdown');
			}
			
			$(this).find('.dropdown-menu').first().stop(true, true).slideDown(400, function() {
				$(this).addClass('dropdown-menu-open');
				if (!$('body').hasClass('page-sales-illustration')) {
					$('.navbar-menu').addClass('show-dropdown');
				}
			});
			setTimeout(function(){
				$('#overlay').removeClass('hidden');
			},400);
			
			var screenheight = ($('.fwd-wrapper').height() - 170) + 'px';
			$('#overlay').css({"height":screenheight});
		})
		.on('hide.bs.dropdown', function(e){
			$('#overlay').addClass('hidden');
			$(this).find('.dropdown-menu').first().stop(true, true).slideUp(400, function() {
				$(this).removeClass('dropdown-menu-open');
				$('#login-button-modal').removeAttr( "data-toggle" );
				if (!$('body').hasClass('page-sales-illustration')) {
					$('.navbar-menu').removeClass('show-dropdown');
				}
			});	   
		});
	
	//Sales Illustration Page
	//Dropdown 
	$('.selectpicker').selectpicker();
	$('.selectpicker').selectpicker({
		style: 'btn-info',
		size: 3
	});
	
	window.onresize = function() {
		
		
		if(parseInt($(document).width() )>= 992) {
			//description: add the modal attr for login button
			$('#login-button').attr("data-toggle","modal");
			
			$('#collapseExplanation').collapse('show');
			
			if($("body").hasClass('canvas-slid')) {		
				$('.navmenu').offcanvas('hide');
				$("body").attr('style','');
			}
		} else {			
			//description: remove modal attr for login button
			$('#login-button').removeAttr("data-toggle");
			if($("#loginModal").hasClass("in")){
				$('#loginModal').modal('hide');
			}
			//end here
		}
		if (getWidth() >= 992) {
			$('#sticky-buy-now').removeClass('sticky-button');
		}

		//BACK TO TOP ON SCREEN RESIZE
		if(getWidth() < 992) {
			$('#gotop').addClass('go-top');
			$('#gotop').removeClass('hidden');
			checkPosition();
		}

		if(getWidth() > 991){
			$('#gotop').removeClass('go-top');
			$('#gotop').addClass('hidden');
		}
		//END
		
		// Made your decision
		if (getWidth() >= 992) {
			$('.made-your-decision-section, footer').removeAttr('style');
		}

		//change color radio button
			changeColorRadioButtonLabel(1);
			changeColorRadioButtonLabel(2);
			changeColorRadioButtonLabel(3);


		if(getWidth()>=992)
		{	
			$("#own-estate-label").removeClass("second-label-mobile");
			$("#name-others-label").removeClass("second-label-mobile");	

			$("#own-estate, #name-others").change(function () {
				if($("#own-estate").is(":checked"))
					$("#own-estate-label").removeClass("hidden-xs hidden-sm");

				if($("#name-others").is(":checked"))
					$("#name-others-label").removeClass("hidden-xs hidden-sm");	
			});

			$("#pay-later-radio, #pay-online-radio").change(function () {
				if($("#pay-later-radio").is(":checked"))
					$("#pay-later-label").removeClass("hidden-xs hidden-sm");

				if($("#pay-online-radio").is(":checked"))
					$("#pay-online-label").removeClass("hidden-xs hidden-sm");	
			});
		}
		else
		{
			$("#own-estate-label").addClass("second-label-mobile");
			$("#name-others-label").addClass("second-label-mobile");
		}

		// sales illustration date picker
		if ($('#dates').length > 0) {
			var datePlaceholder = (getWidth() >= 992) ? "28th May 1996" : "1996-05-28";
			$('#dates').attr('placeholder', datePlaceholder);
			
			var dateVal = new Date($('#dates').val());
			if ($('#dates').val().length > 0) {	
				var dateVal = new Date($datePicker.datepicker('getFormattedDate'));
				if (getWidth() >= 992) {
					$('#dates').val(dateVal.format('jS M Y'));
				} else {
					$('#dates').val(dateVal.format('Y-m-d'));
				}
			}
		}
	};	
	$(window).resize();

	$(window).bind('scroll', function() {
	 	if ($('#flux').length > 0 && getWidth() < 992) { // check if flux div exists
	 		if ($(window).scrollTop() >= $('#flux').offset().top - window.innerHeight && !$('#headerNavmenu').hasClass('canvas-slid')) {
				if (getWidth() < 992) {
					$('#sticky-buy-now').addClass('sticky-button');
				}
	 		} else {
	 			$('#sticky-buy-now').removeClass('sticky-button');
	 		}
          
	 		if ($(window).scrollTop() >= $('#flux').offset().top + $('#flux').outerHeight() - window.innerHeight) {
	 			$('#sticky-buy-now').removeClass('sticky-button');			
	 		}
	 	}
		
		madeDecisionSticky();
	});


	//BACK TO TOP ONLOAD
	if(getWidth() < 992) {
  		$('#gotop').addClass('go-top');
  		$('#gotop').removeClass('hidden');
		checkPosition();
	}

	if(getWidth() > 991){
		$('#gotop').removeClass('go-top');
		$('#gotop').addClass('hidden');
	}

    // Show or hide the sticky footer button
    $(window).scroll(checkPosition);

    // Animate the scroll to top
    $('.go-top').click(function(event) {
        event.preventDefault();

		$('html, body').animate({scrollTop: 0}, 1000);
    });
	
	// Power saving Swipe
	$(".carousel-inner").swipe( {
		//Generic swipe handler for all directions
		swipeLeft:function(event, direction, distance, duration, fingerCount) {
			$(this).parent().carousel('next'); 
		},
		swipeRight: function() {
			$(this).parent().carousel('prev'); 
		},
		//Default is 75px, set to 0 for demo so any distance triggers swipe
		threshold:0
	});
	
	// add overflow hidden to html
	var windowHeight = ($(window).height()) + 'px';
	$('#headerNavmenu')
		.on('show.bs.offcanvas', function() {
			$('.fwd-wrapper').css({'position': 'relative', 'overflow' : 'hidden', 'height' : windowHeight});
		})
		.on('hide.bs.offcanvas', function() {
			$('.fwd-wrapper').removeAttr('style');
		});
		
	// Made your decision sticky
	$('#collapseExplanation')
		.on('show.bs.collapse', function() {
			$('html, body').animate({
				scrollTop: $('.explanation-block').offset().top - $('.navbar-fixed-top').height()
			}, 1000, function() {
				if (getWidth() < 992) {
					$('.made-your-decision-section').css({
						'position': 'fixed',
						'bottom': '0'
					});
					
					$('footer').css('margin-top', $('.made-your-decision-section').outerHeight());
				}
			});
		})
		.on('hide.bs.collapse', function() {
			$('.made-your-decision-section, footer').removeAttr('style');
		});
});

function getWidth() {
	if (self.innerWidth) {
		return self.innerWidth;
	}
	else if (document.documentElement && document.documentElement.clientHeight){
		return document.documentElement.clientWidth;
	}
	else if (document.body) {
		return document.body.clientWidth;
	}
	return 0;
}

function getHeight() {
  	if (self.innerHeight) {
    	return self.innerHeight;
  	}

  	if (document.documentElement && document.documentElement.clientHeight) {
    	return document.documentElement.clientHeight;
  	}

  	if (document.body) {
    	return document.body.clientHeight;
  	}
}

 //BACK TO TOP
function checkPosition() {
	
	var footer_height = $(".footer-whole").height();

    if ($(this).scrollTop() > 200) {
		$('.go-top').fadeIn(400);
    } 
    else {
     	$('.go-top').fadeOut(400);
    }

    if($(window).scrollTop() + $(window).height() > $(document).height() - $(".footer-whole").height()) { 
    	$(".go-top").css("bottom", footer_height+"px");
    	$('#gotop').removeClass('go-top-default');
    }
    else {
    	$(".go-top").css("bottom", 0);
    	$('#gotop').addClass('go-top-default');
    }
}

function forceLower(strInput) {
	strInput.value = strInput.value.toLowerCase();
}

function madeDecisionSticky() {
	var windowScroll = $(window).scrollTop() + $(window).height();
	var footerTopScroll = $(document).height() - $(".footer-whole").height();
	var explanationTopScroll = $(document).height() - $(".explanation-block").height() - $('.made-your-decision-section').outerHeight();

	if ($('.explanation-block').length > 0 && getWidth() < 992) {
		if (windowScroll > footerTopScroll) { 
			$('.made-your-decision-section, footer').removeAttr('style');
		} else {
			if ($('#collapseExplanation').hasClass('in')) {
				$('.made-your-decision-section').css({
					'position': 'fixed',
					'bottom': '0',
					'width': '100%'
				});
				
				$('footer').css('margin-top', $('.made-your-decision-section').outerHeight());
			}
		}					
		
		if (windowScroll < explanationTopScroll) { 
			$('.made-your-decision-section, footer').removeAttr('style');
		} else {
			if (windowScroll > footerTopScroll) { 
				$('.made-your-decision-section, footer').removeAttr('style');
			} else {
				if ($('#collapseExplanation').hasClass('in')) {
					$('.made-your-decision-section').css({
						'position': 'fixed',
						'bottom': '0',
						'width': '100%'
					});
					
					$('footer').css('margin-top', $('.made-your-decision-section').outerHeight());
				}
			}
		}
	}
}

function changeDatePickerValue($datePicker) {
	$datePicker.datepicker({
        endDate: '+0d',
       	autoclose: true,
    }).on("changeDate", function(e) {
        $datePicker.datepicker('hide');
		
		var dateVal = new Date($datePicker.datepicker('getFormattedDate'));
		if (getWidth() >= 992) {
			$('#dates').val(dateVal.format('jS M Y'));
		} else {
			$('#dates').val(dateVal.format('Y-m-d'));
		}
	});
}
 
function changeColorRadioButtonLabel (formNumber) {
	if(getWidth()<992){
		ifChecked(formNumber);
	}
	else {
		removeClasses(formNumber);
	}

		$("#male-"+formNumber+",#female-"+formNumber).change(function () {
			if(getWidth()<992) {
				ifChecked(formNumber);
			}

			else {
				removeClasses(formNumber);	
			}
		});
}

function removeClasses (formNumberReceive) {
	$("#female-label-"+formNumberReceive).removeClass("hidden");
	$("#male-label-"+formNumberReceive).removeClass("hidden");
	$("#female-label-"+formNumberReceive).removeClass("second-label-mobile");
	$("#male-label-"+formNumberReceive).removeClass("second-label-mobile");
}

function ifChecked (formNumberReceive) {
	if($("#male-"+formNumberReceive).is(":checked")==false) {
		$("#male-label-"+formNumberReceive).addClass("hidden");
		$("#female-label-"+formNumberReceive).removeClass("hidden");
		$("#female-label-"+formNumberReceive).addClass("second-label-mobile");	
		$("#male-label-"+formNumberReceive).removeClass("second-label-mobile");			
	}
	else {
		$("#male-label-"+formNumberReceive).removeClass("hidden");
		$("#male-label-"+formNumberReceive).addClass("second-label-mobile");
		$("#female-label-"+formNumberReceive).removeClass("second-label-mobile");
		$("#female-label-"+formNumberReceive).addClass("hidden");	
	}
}

function ifSelected(id,idRemove) {

		$("#"+id).addClass("hidden-xs hidden-sm");
		$("#"+id).removeClass("hidden-xs hidden-sm");
		$("#"+id).addClass("second-label-mobile");
		$("#"+id).removeClass("second-label-mobile");


		$("#"+idRemove).removeClass("hidden-xs hidden-sm");
		$("#"+idRemove).addClass("hidden-xs hidden-sm");
		$("#"+idRemove).removeClass("second-label-mobile");
		$("#"+idRemove).addClass("second-label-mobile");

}

function addFormBeneficiary (counter) {
	
	$('<div class="page-divider page-divider-margin hidden-md hidden-lg"></div>').appendTo("#add-beneficiary-"+counter);
	
	
	$('<form class="content tabs-margin"></form>').appendTo("#add-beneficiary-"+counter).hide().fadeIn(500); //create form

	$('<div class="beneficiary-info-row">'
		+ '<label for="first-name-'+counter+'">Name in English</label>'
		+ '<input type="text" id="first-name-'+counter+'" name="first-name-'+counter+'" class="form-control gray-textbox form-textbox" placeholder="Given name">'
		+ '<input type="text" id="last-name-'+counter+'" name="last-name-'+counter+'" class="form-control gray-textbox form-textbox" placeholder="Last name">'
		+ '</div>'

		+ '<div class="beneficiary-info-row">'
		+ '<label for="name-chinese-'+counter+'">Name in Chinese</label>'
		+ '<input type="text" id="name-chinese-'+counter+'" name="name-chinese-'+counter+'" class="form-control gray-textbox form-textbox" placeholder="Name in Chinese">'
		+ '</div>'

		+ '<div class="beneficiary-info-row">'
		+ '<label for="hkid-'+counter+'">HKID / Passport No</label>'
		+ '<select class="selectpicker" id="hkid-'+counter+'" name="hkid" data-style="application-select" style="display: none">'
			+ '<option disabled selected>- Please select -</option>'
			+ '<option>Lorem ipsum</option>'
			+ '<option>Lorem ipsum</option>'
		   +'</select>'
		+ '<div class="btn-group bootstrap-select"><button type="button" class="btn dropdown-toggle selectpicker application-select" data-toggle="dropdown" data-id="hkid" title="- Please select -"><span class="filter-option pull-left">- Please select -</span>&nbsp;<span class="icon-chevron-thin-down"></span></button><div class="dropdown-menu open"><ul class="dropdown-menu inner selectpicker" role="menu"><li data-original-index="0" class="disabled selected"><a tabindex="-1" class="" data-normalized-text="<span class=&quot;text&quot;>- Please select -</span>" href="#"><span class="text">- Please select -</span><span class="glyphicon glyphicon-ok check-mark"></span></a></li><li data-original-index="1"><a tabindex="0" class="" data-normalized-text="<span class=&quot;text&quot;>Lorem ipsum</span>"><span class="text">Lorem ipsum</span><span class="glyphicon glyphicon-ok check-mark"></span></a></li><li data-original-index="2"><a tabindex="0" class="" data-normalized-text="<span class=&quot;text&quot;>Lorem ipsum</span>"><span class="text">Lorem ipsum</span><span class="glyphicon glyphicon-ok check-mark"></span></a></li></ul></div></div>'
		+ '</div>'

		+ '<div class="beneficiary-info-row">'
		+ '<label for="gender-'+counter+'">Gender</label>'
		+ '<div id="gender-'+counter+'" class="clearfix radio-buttons">'
		+ '<input type="radio" name="gender-'+counter+'" value="male" id="male-'+counter+'" checked>'
		+ '<label for="male-'+counter+'" class="male" >'
		+ '<span class="hidden-lg hidden-md">Male</span>'
		+ '<span class="orange-hover hidden-xs hidden-sm pull-left"></span>'
		+ '</label>'
		+ '<span id="male-label-'+counter+'" class="pull-left second-label">Male</span>'
		+ '<input type="radio" name="gender-'+counter+'" value="female" id="female-'+counter+'">'
		+ '<label for="female-'+counter+'" class="female">'
		+ '<span class="hidden-lg hidden-md">Female</span>'
		+ '<span class="orange-hover hidden-xs hidden-sm pull-left"></span>'
		+ '</label>'
		+ '<span id="female-label-'+counter+'" class="pull-left second-label-female">Female</span>'
		+ '</div>'
		+ '</div>'
		+ '<div class="beneficiary-info-row relationship">'
		+ '<label for="relationship-'+counter+'">Relationship with you</label>'
		+ '<select class="selectpicker" id="relationship-'+counter+'" name="relationship-'+counter+'" data-style="application-select" style="display: none">'
		+ '<option disabled selected>- Please select -</option>'
		+ '<option>Lorem ipsum</option>'
		+ '<option>Lorem ipsum</option>'
		+ '</select>'
		+ '<div class="btn-group bootstrap-select"><button type="button" class="btn dropdown-toggle selectpicker application-select" data-toggle="dropdown" data-id="hkid" title="- Please select -"><span class="filter-option pull-left">- Please select -</span>&nbsp;<span class="icon-chevron-thin-down"></span></button><div class="dropdown-menu open"><ul class="dropdown-menu inner selectpicker" role="menu"><li data-original-index="0" class="disabled selected"><a tabindex="-1" class="" data-normalized-text="<span class=&quot;text&quot;>- Please select -</span>" href="#"><span class="text">- Please select -</span><span class="glyphicon glyphicon-ok check-mark"></span></a></li><li data-original-index="1"><a tabindex="0" class="" data-normalized-text="<span class=&quot;text&quot;>Lorem ipsum</span>"><span class="text">Lorem ipsum</span><span class="glyphicon glyphicon-ok check-mark"></span></a></li><li data-original-index="2"><a tabindex="0" class="" data-normalized-text="<span class=&quot;text&quot;>Lorem ipsum</span>"><span class="text">Lorem ipsum</span><span class="glyphicon glyphicon-ok check-mark"></span></a></li></ul></div></div>'
		+ '</div>'
		+ '<div class="beneficiary-info-row entitle">'
		+ '<label for="entitlement-'+counter+'">Entitlement (%)</label>'
		+ '<input type="text" id="entitlement-'+counter+'" name="entitlement-'+counter+'" class="form-control gray-textbox percentage" placeholder="100%">'
		+ '</div>'
		).appendTo("#add-beneficiary-"+counter+" .content");
	changeColorRadioButtonLabel (counter);
}

function changeBorder (radioId) {
	// $('#service-centre .service-centre-cells').css("border","1px solid #b7c3cd");

   	if($("#"+radioId).is(":checked")) {
   		// $("#"+radioId).closest('.service-centre-cells').css("border","1px solid transparent");

   		//change contents
   		var parent = $("#"+radioId).closest('.service-centre-cells');
   		var newTitle = parent.find('h4').html();
   		var newContent = parent.find('.col-md-9').html();
   		$("#view-selected-appointment .view-selected-box .service-centre-cells").html('<h4 class="title-margin">'+newTitle+'</h4> <div class="content">'+newContent+'</div>');
   	}
}
