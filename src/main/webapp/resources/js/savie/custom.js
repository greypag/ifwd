//Plan Details Calendar
//by: RMN
function fnSetStyle(){
	if($('.datepicker.datepicker-dropdown').length){
		//datepicker exist
		
		var isVisible = $('.datepicker .datepicker-years table thead tr th:last-child').css("visibility");
		
		if(isVisible == "hidden"){
			console.log('hidden');
			$('.datepicker .datepicker-years table thead tr th:last-child').removeAttr('style');
			$('.datepicker .datepicker-years table thead tr th:last-child').css(
			{"visibility":'visible !important',
			"cursor":"not-allowed"});
		}else{
			console.log('vivible');
			$('.datepicker .datepicker-years table thead tr th:last-child').css(
			{"visibility":'visible !important',
			"cursor":"pointer"});
		}
		
	
	}else{
		//console.log('doesnot exist');
		//date picker does not exist
	}
}

$(function() {
	
	

	//Thank You Page
	//by: RMN
	//$('#membership-account').bootstrapValidator();
	
	$('#activate-fwd-account').click(function(){
		$('html, body').animate({
			scrollTop: $('#member-account').offset().top - $('.navbar-fixed-top').height()
		}, 1000);

	});
	
	//Form Validation
	$("#activate-account-now").click(function(){
		var username = $("#member-username").val();
		var password = $("#member-password").val();
		var confirmPassword = $("#confirmPassword").val();
		
		if(( (username.match('^[a-zA-Z0-9]+$'))   && (username.length >= 6 && username.length <= 50)) &&
			 (password.match(/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z]{8,}$/)) &&
			 (confirmPassword == password)
		){
			$('#account-created-divider').removeClass('hidden');
			$('#account-created').removeClass('hidden');
		}else{
			//do nothing
		}
		
    });
	
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
		$('#add-beneficiary-1').addClass('hidden');
		$('#add-beneficiary-2').addClass('hidden');
	});
	
	$("#name-others-now").click(function() {
		if($('#beneficiary-contents').hasClass('hidden')){
			$('#beneficiary-contents').removeClass('hidden');
		}
		
		if($('#add-beneficiary-1').hasClass('hidden')){
			$('#add-beneficiary-1').removeClass('hidden');
		}
		
		if($('#add-beneficiary-2').hasClass('hidden')){
			$('#add-beneficiary-2').removeClass('hidden');
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
		$('#loginModal').modal('show');
    });	

	// FNA Page to Application Page
	$("#fna-next-btn").on('click', function(){
        window.location = "application";    
    });

	// FNA Page to Sales Illustration Page
	$("#fna-return-btn").on('click', function(){
        window.location = "plan-details";    
    });    
    
	// Application Page to Order Page
	//$("#application-proceed-btn").on('click', function(){
    //    window.location = "order-summary";    
    //});

	// Application Page to Fna Page
	$("#application-return-btn").on('click', function(){
        window.location = "fna";    
    });    

	// Order Page to Declaration Page
	$("#order-summary-proceed-btn").on('click', function(){
        window.location = "declarations";    
    });    

	// Order Page to Application Page
	$("#order-summary-return-btn").on('click', function(){
        window.location = "application";    
    });    

	// Declaration Page to Signature Page
	$("#declaration-proceed-btn").on('click', function(){
        window.location = "signature";    
    });   

	// Declaration Page to Order Page
	$("#declaration-return-btn").on('click', function(){
        window.location = "order-summary";    
    });    

	// Signature Page to Set Appointment Page
	$("#signature-proceed-btn").on('click', function(){
        window.location = "set-appointment";    
    });         

	// Signature Page to Declaration Page
	$("#signature-return-btn").on('click', function(){
        window.location = "declaration-authorization";    
    });    
    
	// Set Appointment Page to Upload Document Page
	$("#set-application-confirm-btn").on('click', function(){
		window.location = "upload-document";    
	});     

	// Set Appointment Page to Signature Page
	$("#set-appointment-return-btn").on('click', function(){
         window.location = "signature";    
    });       

	// Upload Document Page to Thank You Page
	$("#upload-doc-submit-btn").on('click', function(){
		window.location = "overall";    
 	});    

	// Upload Document Page to Set Appointment Page
	$("#upload-doc-return-btn").on('click', function(){
        window.location = "set-appointment";    
    });    

	// Overall Page Links
	// Sales Illustration Page
	$("#sales-edit-btn").on('click', function(){
        window.location = "plan-details";    
    });

	// FNA Page
	$("#fna-edit-btn").on('click', function(){
        window.location = "fna";    
    });

	// Application Page
	$("#application-edit-btn").on('click', function(){
        window.location = "application";    
    });    

	// Order Summary Page
	$("#application-view-btn").on('click', function(){
        window.location = "order-summary";    
    });    

	// Set Appointment Page
	$("#appointment-change-btn").on('click', function(){
        window.location = "set-appointment";    
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
	
	if ($('#male-0').length > 0) {
		changeColorRadioButtonLabel(1);
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
		//$("#personal-info-next").click(function(){
        //	$('html, body').animate({
		//		scrollTop: $('#employment-info').offset().top - $('.navbar-fixed-top').height()
		//	}, 1000);
    	//});

    	//$("#employment-info-next").click(function(){
        //	$('html, body').animate({
		//		scrollTop: $('#beneficiary-info').offset().top - $('.navbar-fixed-top').height()
		//	}, 1000);
    	//});

    	//$("#beneficiary-info-next").click(function(){
        //	$('html, body').animate({
		//		scrollTop: $('#payment').offset().top - $('.navbar-fixed-top').height()
		//	}, 1000);
    	//});
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


	if($("#add-beneficiary-1").length > 0) { 
		$("#add-beneficiary-button-2").click(function(){
			$("#add-beneficiary-1 .add-beneficiary" ).addClass("hidden");
			//add form
			addFormBeneficiary ($("#add-beneficiary-button-2").attr("value"));
		});
		$("#add-beneficiary-button-3").click(function(){
			$("#add-beneficiary-2 .add-beneficiary" ).addClass("hidden");
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
	if($("#datePicker").length > 0 && getWidth() >= 992) {
		var datePlaceholder = (getWidth() >= 992) ? "28th May 1996" : "1996-05-28";
		var $datePicker = $("#datePicker");
		$('#dates').attr('placeholder', datePlaceholder);
		changeDatePickerValue($datePicker);
	}
	
	if ($("#mobile-date").length > 0) {
		var currentDate = new Date();
		$("#mobile-date").attr('max', currentDate.format('Y-m-d'));			
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
			
			var screenheight = ($('.fwd-savie-wrapper').height() - 170) + 'px';
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
			changeColorRadioButtonLabel(0);
			changeColorRadioButtonLabel(1);
			changeColorRadioButtonLabel(2);


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
			var datePlaceholder = (getWidth() >= 992) ? "28-05-1995" : "1996-05-28";
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
		
		// modals
		var top = $('header .navbar-fixed-top').height();
		$('.modal.in').css('margin-top', top + 'px');
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
			$('.fwd-savie-wrapper').css({'position': 'relative', 'overflow' : 'hidden', 'height' : windowHeight});
		})
		.on('hide.bs.offcanvas', function() {
			$('.fwd--savie-wrapper').removeAttr('style');
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
	
	// Login Modal
	$('#loginModal, #american-citizen, #fna-no, #illustration-result').on('show.bs.modal', function() {
		var top = $('header .navbar-fixed-top').height();
		$(this).css('margin-top', top + 'px');	
	});
	$('#loginModal, #american-citizen, #fna-no, #illustration-result').on('hide.bs.modal', function() {
		//$('header .navbar-menu').removeClass('modal-display');
		//$('.fwd-savie-wrapper').removeAttr('style');
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

// 18 year ago date
var dob_end_date = new Date();
dob_end_date.setFullYear(dob_end_date.getFullYear()-18);

//70 year ago date
var dob_start_date = new Date();
dob_start_date.setFullYear(dob_start_date.getFullYear()-70);
dob_start_date.setDate(dob_start_date.getDate()+1);

function changeDatePickerValue($datePicker) {
	$datePicker.datepicker({
       	autoclose: true,
		startView: "decade",
		startDate: dob_start_date,
		endDate: dob_end_date,
    }).on("changeDate", function(e) {
        $datePicker.datepicker('hide');
		
		var dateVal = new Date($datePicker.datepicker('getFormattedDate'));
		if (getWidth() >= 992) {
			//$('#dates').val(dateVal.format('jS M Y'));
			$('#dates').val(dateVal.format('d-m-Y'));
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
	
	
	$('<form class="content tabs-margin" id="beneficiaryInfoForm['+counter+']" method="post" action="application-richie.php" onsubmit="return false"></form>').appendTo("#add-beneficiary-"+counter).hide().fadeIn(500); //create form

	$('<div class="form-group beneficiary-info-row" >'
		+ '<label for="savieBeneficiaryBean['+counter+'].firstName">Name in English</label>'
		+ '<input type="text" id="savieBeneficiaryBean['+counter+'].fullName" hidden>'
		+ '<input type="text" id="savieBeneficiaryBean['+counter+'].firstName" name="savieBeneficiaryBean['+counter+'].firstName" onchange="getBeneficiaryFullName'+counter+'()" class="form-control gray-textbox form-textbox" placeholder="Given name" maxlength="25">'
		+ '<span class="error-msg" id="beneficiaryFnameMessage['+counter+']"></span>'
		+ '<input type="text" id="savieBeneficiaryBean['+counter+'].lastName" name="savieBeneficiaryBean['+counter+'].lastName" onchange="getBeneficiaryFullName'+counter+'()" class="form-control gray-textbox form-textbox" placeholder="Last name" maxlength="25">'
		+ '<span class="error-msg" id="beneficiaryLnameMessage['+counter+']"></span>'
		+ '<span class="dup-error-msg hidden" id="duplicate-english-name['+counter+']">Duplicate English Name</span>'
		+ '</div>'

		+ '<div class="form-group beneficiary-info-row">'
		+ '<label for="savieBeneficiaryBean['+counter+'].chineseName">Name in Chinese</label>'
		+ '<input type="text" id="savieBeneficiaryBean['+counter+'].chineseName" name="savieBeneficiaryBean['+counter+'].chineseName" class="form-control gray-textbox form-textbox" placeholder="Name in Chinese">'
		+ '<span class="error-msg" id="beneficiaryChineseNameMessage['+counter+']"></span>'
		+ '<span class="dup-error-msg hidden" id="duplicate-chinese-name['+counter+']">Duplicate Chinese Name</span>'
		+ '</div>'

		+ '<div class="form-group beneficiary-info-row">'
		+ '<label for="savieBeneficiaryBean['+counter+'].hkId">HKID / Passport No</label>'
		+ '<input type="text" id="savieBeneficiaryBean['+counter+'].hkId" name="savieBeneficiaryBean['+counter+'].hkId" class="form-control gray-textbox form-textbox" placeholder="HKID/Passport No">'
		+ '<span class="error-msg" id="hkidOrPassportMessage['+counter+']"></span>'
		+ '<span class="dup-error-msg hidden" id="duplicate-beneficiaries['+counter+']">Duplicate Beneficiaries</span>'
		+ '</div>'

		+ '<div class="beneficiary-info-row">'
		+ '<label for="savieBeneficiaryBean['+counter+'].gender">Gender</label>'
		+ '<div id="gender-'+counter+'" class="clearfix radio-buttons">'
		+ '<input type="radio" name="savieBeneficiaryBean['+counter+'].gender" value="male" id="male-'+counter+'" checked>'
		+ '<label for="male-'+counter+'" class="male" >'
		+ '<span class="hidden-lg hidden-md">Male</span>'
		+ '<span class="orange-hover hidden-xs hidden-sm pull-left"></span>'
		+ '</label>'
		+ '<span id="male-label-'+counter+'" class="pull-left second-label">Male</span>'
		+ '<input type="radio" name="savieBeneficiaryBean['+counter+'].gender" value="female" id="female-'+counter+'">'
		+ '<label for="female-'+counter+'" class="female">'
		+ '<span class="hidden-lg hidden-md">Female</span>'
		+ '<span class="orange-hover hidden-xs hidden-sm pull-left"></span>'
		+ '</label>'
		+ '<span id="female-label-'+counter+'" class="pull-left second-label-female">Female</span>'
		+ '</div>'
		+ '</div>'
		
		+ '<div class="form-group beneficiary-info-row relationship">'
		+ '<label for="savieBeneficiaryBean['+counter+'].relationship">Relationship with you</label>'
		+ '<div class="selectBeneficiary">'
		+ '<span class="icon-chevron-thin-down orange-caret"></span>'
		+ '<select class="form-control gray-dropdown"  id="savieBeneficiaryBean['+counter+'].relationship" name="savieBeneficiaryBean['+counter+'].relationship" data-style="application-select">'
		+ '<option selected disabled value="">- Please select -</option>'
		+ '<option value="father">Father</option>'
		+ '<option value="mother">Mother</option>'	
		+ '</select>'
		+ '</div>'
		+ '	<span class="error-msg" id="relationshipMessage['+counter+']"></span>'
		+ '</div>'
		
		+ '<div class="form-group beneficiary-info-row entitle">'
		+ '<label for="savieBeneficiaryBean['+counter+'].entitlement">Entitlement (%)</label>'
		+ '<input type="text" id="savieBeneficiaryBean['+counter+'].entitlement" name="savieBeneficiaryBean['+counter+'].entitlement" class="form-control gray-textbox percentage" placeholder="100%" value="">'
		+ '<span class="error-msg" id="entitlementMessage['+counter+']"></span>'
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

// Getting the Final Residential Tel No Value
function getResidentialFinalValue() {
	var firstValue = document.getElementById("residential-first").value;
	var secondValue = document.getElementById("residential-second").value;
	var thirdValue = document.getElementById("residential-third").value;
	document.getElementById("savieApplicantBean.residentialTelNo").value = firstValue + secondValue + thirdValue;
}   

// Getting the Final Mobile No Value
function getMobileFinalValue() {
	var fMobileValue = document.getElementById("mobile-first").value;
	var sMobileValue = document.getElementById("mobile-second").value;
	var tMobileValue = document.getElementById("mobile-third").value;
	document.getElementById("savieApplicantBean.mobileNo").value = fMobileValue + sMobileValue + tMobileValue;
}