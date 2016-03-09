// Savie Online
$(document).ready(function() {
	window.onresize = function() {
		if (getWidth()>=992) {
			$('.psa-collapse-content').addClass('in');
			$('.psa-btn').removeAttr('data-toggle');
			
			$('.fna-tab-content').addClass('col-lg-3 col-md-3 active');
			$('.navtabs-title').removeAttr('data-toggle');
			
			// Carousel modification
			$('.fna-icons-body .tab-content').removeClass('carousel-inner');
			$('.fna-icons-body .tab-content').removeAttr('role');
			$('.fna-tab-content').removeClass('item');
			
		} else {
			$('.psa-collapse-content').removeClass('in');
			$('.psa-btn').attr('data-toggle', 'collapse');
			
			$('.fna-tab-content').removeClass('col-lg-3 col-md-3 active');
			$('.navtabs-title').attr('data-toggle', 'tab');
			$('#navtabs-1').addClass('active');
			
			// Carousel modification
			$('#so-carousel').carousel({
				interval: false
			});
			$('#so-carousel').addClass('carousel slide');
			$('#so-carousel').attr('data-ride', 'carousel');
			$('.fna-carousel .tab-content').addClass('carousel-inner');
			$('.fna-carousel .tab-content').attr('role', 'listbox');
			$('.fna-tab-content').addClass('item');
			
			$('#so-carousel').on('slid.bs.carousel', function() {
				if($('#navtabs-1').hasClass('active')) {
					$('.navtabs-li').removeClass('active');
					$('#nav-title-1').addClass('active');
				}
				if($('#navtabs-2').hasClass('active')) {
					$('.navtabs-li').removeClass('active');
					$('#nav-title-2').addClass('active');
				}
				if($('#navtabs-3').hasClass('active')) {
					$('.navtabs-li').removeClass('active');
					$('#nav-title-3').addClass('active');
				}
				if($('#navtabs-4').hasClass('active')) {
					$('.navtabs-li').removeClass('active');
					$('#nav-title-4').addClass('active');
				}
			});
		}
	};
	$(window).resize();
	
	// PDF lightbox resizing
	var browWidth = $(window).width();
	var browHeight = $(window).height();
	var heightToSet =  browHeight - 300;
	if(browWidth >= 992) {
		$('#fna-signature-modal, .sales-illustration-modal, .signature-offline-modal').find('iframe').css('cssText', 'height:'+ heightToSet +'px !important');
	}
	window.onresize = function() {
		browWidth = $(window).width();
		if(browWidth >= 992) {
			$('#fna-signature-modal, .sales-illustration-modal, .signature-offline-modal').find('iframe').css('cssText', 'height:'+ heightToSet +'px !important');
		} else {
			$('#fna-signature-modal, .sales-illustration-modal, .signature-offline-modal').find('iframe').removeAttr('style');
		}
	};

	$('#see-all-product-btn').on('click', function () {
		$('.psa-link-content').slideDown('fast');
	});

	// Datepicker
	$('#so-calendar-dob').datepicker({
		format: "mm-dd-yyyy",
		container: "#date",
		//startDate: new Date()
		startView: "decade",
		startDate: dob_start_date,
		endDate: dob_end_date,
		autoclose: true,
		startView: 2
	 });
	 
	// Placeholder	 
	$('input[placeholder]').placeholder();
	$('[placeholder]').focus(function() {
		var input = $(this);
		if (input.val() == input.attr('placeholder')) {
			input.val('');
			input.removeClass('placeholder');
		}
	}).blur(function() {
		var input = $(this);
		if (input.val() == '' || input.val() == input.attr('placeholder')) {
			input.addClass('placeholder');
			input.val(input.attr('placeholder'));
		}
	}).blur();
	$('[placeholder]').parents('form').submit(function() {
		$(this).find('[placeholder]').each(function() {
			var input = $(this);
			if (input.val() == input.attr('placeholder')) {
				input.val('');
			}
		})
	});
	
	// Permanent Address showing the additional 3 lines
	$('.res-textfield-hidden').css("margin-bottom", "0");
	$('#permanentAddress1').focus(function() {
		if ($('.res-additional').hasClass('hidden')) {
			$('.res-additional').removeClass('hidden');
			$('.res-textfield-hidden').css("margin-bottom", "10px");
		}
	});
	
	// Convert inputted letters to uppercase
	$('.form-uppercase input[type="text"]').keyup(function() {
		this.value = this.value.toUpperCase();
	});
	
	// Radio button upload document
	if ($('#upload-later-radio').is(':checked')) {
		$('#upload-later-section').removeClass('hidden');
		$('#upload-now-section').addClass('hidden');
	}
	$('#upload-now-radio').click(function () {
		var $self = $(this);
		if ($self.is(':checked')) {
			$('#upload-now-section').removeClass('hidden');
			$('#upload-later-section').addClass('hidden');
		}
	});
	$('#upload-later-radio').click(function () {
		var $self = $(this);
		if ($self.is(':checked')) {
			$('#upload-later-section').removeClass('hidden');
			$('#upload-now-section').addClass('hidden');
		}
	});
	
	// Radio button
	if ($('#own-estate-id').is(':checked')) {
		$('#beneficiary-contents').addClass('hidden');
		$('.add-on-beneficiary').addClass('hidden');
		$('#bf-save-and-con-later').attr('data-target','#save-and-continue-batch5-modal');
	}
	$('#own-estate-id').click(function () {
		if ($(this).is(':checked')) {
			$('#beneficiary-contents').addClass('hidden');
			$('.add-on-beneficiary').addClass('hidden');
			$('#bf-save-and-con-later').attr('data-target','#save-and-continue-batch5-modal');
		}
	});
	$('#name-others-id').click(function () {
		if ($(this).is(':checked')) {
			$('#beneficiary-contents').removeClass('hidden');
			$('.add-on-beneficiary').removeClass('hidden');
			$('#bf-save-and-con-later').attr('data-target','#save-and-continue-modal');
			$('#beneficiary-info-form\\[0\\]').data('bootstrapValidator').resetForm(true);
		}
	});
	
	// Adding new form for additional beneficiary
	$('#add-beneficiary-btn-1').click(function () {
		$('#beneficiary1').addClass('hidden');
		$('#beneficiary-header\\[1\\]').removeClass('hidden');
		$('#beneficiary-info-form\\[1\\]').removeClass('hidden');
		$('#add-beneficiary-btn-2').removeClass('disabled-beneficiary-add');
		$('#add-btn-img').attr('src', '/fwdhk/resources/images/savie-2016/orange-plus.png');
	});
	$('#add-beneficiary-btn-2').click(function (e) {
		e.preventDefault();
		if($(this).hasClass('disabled-beneficiary-add') == false) {
			$('#beneficiary2').addClass('hidden');
			$('#beneficiary-header\\[2\\]').removeClass('hidden');
			$('#beneficiary-info-form\\[2\\]').removeClass('hidden');
		}
	});
	
	// Deleting new form for additional beneficiary
	$('#remove-beneficiary\\[1\\]').click(function () {
		$('#beneficiaryFirstName\\[1\\]').val("");
		$('#add-beneficiary-btn-2').find('#add-btn-img').attr('src', '/fwdhk/resources/images/savie-2016/gray-plus.png');
		$('#add-beneficiary-btn-2').addClass('disabled-beneficiary-add');
		$('#beneficiary2').removeClass('hidden');
		$('#beneficiary-header\\[2\\]').addClass('hidden');
		$('#beneficiary-info-form\\[2\\]').addClass('hidden');
		$('#beneficiary1').removeClass('hidden');
		$('#beneficiary-header\\[1\\]').addClass('hidden');
		$('#beneficiary-info-form\\[1\\]').addClass('hidden');
		$('#beneficiary-info-form\\[1\\]').data('bootstrapValidator').resetForm(true);
		$('#beneficiary-info-form\\[0\\]').data('bootstrapValidator').updateStatus('beneficiaryEntitlement[0]', 'INVALID','callback');
		$('#add-btn-img').attr('src', '/fwdhk/resources/images/savie-2016/gray-plus.png');
		$('#beneficiary-info-form\\[2\\]').data('bootstrapValidator').resetForm(true);
	});
	$('#remove-beneficiary\\[2\\]').click(function () {
		$('#beneficiaryFirstName\\[2\\]').val("");
		$('#beneficiary2').removeClass('hidden');
		$('#beneficiary-header\\[2\\]').addClass('hidden');
		$('#beneficiary-info-form\\[2\\]').addClass('hidden');
		$('#beneficiary-info-form\\[2\\]').data('bootstrapValidator').resetForm(true);
		$('#beneficiary-info-form\\[1\\]').data('bootstrapValidator').updateStatus('beneficiaryEntitlement[1]', 'INVALID','callback');
	});

   var open = false;
    function isOpen(){
       if(open)
          return true;
       else
          return false;
   }
   
   $('.gray-dropdown').on('click', function() {
         open = !open;
        if(isOpen()) {
          $(this).parent('.selectDiv').find('.orange-caret-bg').attr('src',getpath + '/resources/images/orange-caret-inv.png');
        }  else {
        	$(this).parent('.selectDiv').find('.orange-caret-bg').attr('src',getpath + '/resources/images/orange-caret.png');
        }
   }).on('blur', function () {
   		$(this).parent('.selectDiv').find('.orange-caret-bg').attr('src',getpath + '/resources/images/orange-caret.png');
   });

   $('.so-mdl-textfield-input').focus(function () {
   		$(this).parent('.so-mdl-textfield').removeClass('is-not-active');
   		$(this).parent('.so-mdl-textfield').addClass('is-active');
   }).on('blur', function () {
   		$(this).parent('.so-mdl-textfield').addClass('is-not-active');
   		$(this).parent('.so-mdl-textfield').removeClass('is-active');
   		if($(this).val() == '') {
   			$(this).parent('.so-mdl-textfield').removeClass('is-not-active');
   		}
   });

   $('input[type=checkbox]').on('change', function () {
   		if($(this).is(':checked') == false ) {
   			$(this).parent('div').find('label').addClass('active-checkbox');
   		} else {
   			$(this).parent('div').find('label').removeClass('active-checkbox');
   		}
   });
   
   // to display dropdown label
   $('.gray-dropdown').on('change', function() {
	   $(this).parent('.selectDiv').addClass('is-not-active');
	   if($(this).val() == '') {
		   $(this).parent('.selectDiv').removeClass('is-not-active');
		}
		
		// passing select value to its input hidden element
		// need to use input hidden element for disabled select field
		var inputHiddenElem = $(this).siblings('input[type=hidden]');
		if(inputHiddenElem !== 'undefiine') {
			inputHiddenElem.val($(this).val());
		}
   })
   
   // to change dropdown label color
   $('.gray-dropdown').focus(function() {
		$(this).siblings('label').attr('style', 'color: #ff8200;');
	}).on('blur', function () {
		$(this).siblings('label').removeAttr('style');
	})
	
	// Submitting beneficiary form
	$('#beneficiary-next-btn').on('click', function(e) {
        var $self = $(this);
        if (isBeneficaryFormValid()) {
            $('#name-others-id').on('click', function(e) {
            	$('#beneficiary-info-form\\[0\\]').data('bootstrapValidator').resetForm(true);
        		if ( !($('#beneficiary-info-form\\[1\\]').hasClass('hidden')) ) {
        			$('#beneficiary-info-form\\[1\\]').data('bootstrapValidator').resetForm(true);
        		}
        		if ( !($('#beneficiary-info-form\\[2\\]').hasClass('hidden')) ) {
        			$('#beneficiary-info-form\\[2\\]').data('bootstrapValidator').resetForm(true);
        		}
            });
        }
    });
	
	// Beneficiary HKID or Passport No.
	$('#beneficiaryHkidPassport\\[0\\]').on('change', function() {
		var str = "";
		$('#beneficiaryHkidPassport\\[0\\] option:selected').each(function() {
			str = $(this).val();
			if (str == 'hkid') {
				$('#passport-inputfield-0').addClass('hidden');
				if($('#hkid-inputfield-0').hasClass('hidden')) {
					$('#hkid-inputfield-0').removeClass('hidden');
				}
			} else {
				$('#hkid-inputfield-0').addClass('hidden');
				if($('#passport-inputfield-0').hasClass('hidden')) {
					$('#passport-inputfield-0').removeClass('hidden');
				}
			}
		});
	}).change();
	$('#beneficiaryHkidPassport\\[1\\]').on('change', function() {
		var str = "";
		$('#beneficiaryHkidPassport\\[1\\] option:selected').each(function() {
			str = $(this).val();
			if (str == 'hkid') {
				$('#passport-inputfield-1').addClass('hidden');
				if($('#hkid-inputfield-1').hasClass('hidden')) {
					$('#hkid-inputfield-1').removeClass('hidden');
				}
			} else {
				$('#hkid-inputfield-1').addClass('hidden');
				if($('#passport-inputfield-1').hasClass('hidden')) {
					$('#passport-inputfield-1').removeClass('hidden');
				}
			}
		});
	}).change();
	$('#beneficiaryHkidPassport\\[2\\]').on('change', function() {
		var str = "";
		$('#beneficiaryHkidPassport\\[2\\] option:selected').each(function() {
			str = $(this).val();
			if (str == 'hkid') {
				$('#passport-inputfield-2').addClass('hidden');
				if($('#hkid-inputfield-2').hasClass('hidden')) {
					$('#hkid-inputfield-2').removeClass('hidden');
				}
			} else {
				$('#hkid-inputfield-2').addClass('hidden');
				if($('#passport-inputfield-2').hasClass('hidden')) {
					$('#passport-inputfield-2').removeClass('hidden');
				}
			}
		});
	}).change();
	
	// Beneficiary Form
	$('#beneficiary-next-btn').click(function(){
		var bootstrapValidator1 = $('#beneficiary-info-form\\[0\\]').data('bootstrapValidator');
		bootstrapValidator1.enableFieldValidators('beneficiaryPassport[0]',true, $(this).val() == 'Passport');
		bootstrapValidator1.enableFieldValidators('beneficiaryHkid[0]',true, $(this).val() == 'hkid');
		
		$('#beneficiary-info-form\\[0\\]').submit();
		
		if(isBeneficiary2Hidden() != "hidden") {
			var bootstrapValidator2 = $('#beneficiary-info-form\\[1\\]').data('bootstrapValidator');
			bootstrapValidator2.enableFieldValidators('beneficiaryPassport[1]',true, $(this).val() == 'Passport');
			bootstrapValidator2.enableFieldValidators('beneficiaryHkid[1]',true, $(this).val() == 'hkid');
			$('#beneficiary-info-form\\[1\\]').submit();
		}
	
		if(isBeneficiary3Hidden() != "hidden"){
			var bootstrapValidator3 = $('#beneficiary-info-form\\[2\\]').data('bootstrapValidator');
			bootstrapValidator3.enableFieldValidators('beneficiaryPassport[2]',true, $(this).val() == 'Passport');
			bootstrapValidator3.enableFieldValidators('beneficiaryHkid[2]',true, $(this).val() == 'hkid');
			$('#beneficiary-info-form\\[2\\]').submit();
		}
		
		if((($('#beneficiary-info-form\\[1\\] div').hasClass('has-error')) && (isBeneficiary2Hidden()!="hidden"))	||
			 (($('#beneficiary-info-form\\[0\\] div').hasClass('has-error'))) ||
			 (($('#beneficiary-info-form\\[2\\] div').hasClass('has-error')) && (isBeneficiary3Hidden()!="hidden"))) {
			//has error do nothing
			console.log('Form has error');
		} else {
			console.log('Form 1 has no error');
		}
		// Duplicate checking
		duplicateBeneficiary();
		duplicateBeneficiaryPassport();
		duplicateBeneficicaryChineseName();
		duplicateBeneficiaryEnglishName();
	});
	
	// Rate buttons
	$('#rate-0').click(function(){
		$('.rate-btn').removeClass('active');
		$('#rate-0').addClass('active');
	});
	$('#rate-2').click(function(){
		$('.rate-btn').removeClass('active');
		$('#rate-2').addClass('active');
	});
	$('#rate-3').click(function(){
		$('.rate-btn').removeClass('active');
		$('#rate-3').addClass('active');
	});
	$('#rate-4').click(function(){
		$('.rate-btn').removeClass('active');
		$('#rate-4').addClass('active');
	});

	//plan details - plan calculator
	$('#type-of-payment').on('change', function () {
		if($(this).val() == 'regular-payment') {
			$('#plan-amount-holder').removeClass('hidden');
			$('#amount-slide-holder').addClass('hidden');
			if($('#plan-dob-datepicker').val() != '') {
				$('#total-years-holder').removeClass('hidden');
			}
		} else {
			$('#plan-amount-holder').addClass('hidden');
			$('#amount-slide-holder').removeClass('hidden');
			$('#total-years-holder').addClass('hidden');
		}
	});
	$('#plan-dob-datepicker').on('change', function() {
		if($(this).val() != '') {
			var from = $(this).val().split("-");
			var birthday = new Date(from[2], from[1] - 1, from[0]);
			var current_date = new Date();
			var user_age = Number((current_date.getTime() - birthday.getTime()) / 31536000000).toFixed(0);
			var max_age = 99;
			var limit_years_pay = max_age - user_age;
			var years_string = '';
			for(var i = 1; i <= limit_years_pay; i++) {
				years_string += '<option value="'+i+'">'+i+'</option>';
			}
			$('#total-payment-years').html(years_string);
			if($('#type-of-payment').val() == 'regular-payment') {
				$('#total-years-holder').removeClass('hidden');
			} else {
				$('#total-years-holder').addClass('hidden');
			}
		} else {
			$('#total-years-holder').addClass('hidden');
		}
	});
	//method to change the minimum and maximum value of one-off premium
	var oneOffPremiumMax = 400000;
	var oneOffPremiumMin = 30000;
	$('.amount-slider').slider({
		min: oneOffPremiumMin,
		max: oneOffPremiumMax,
	});
	$('#max-value').text(commaSeparateNumber(oneOffPremiumMax));
	$('#min-value').text(commaSeparateNumber(oneOffPremiumMin));

	$('.amount-slider').on('slide', function (slideEvt) {
		var amountSelected = commaSeparateNumber($(this).val());
		$('#amount-value').text(amountSelected);
	});
	$('.amount-slider').on('change', function () {
		var amountSelected = commaSeparateNumber($(this).val());
		$('#amount-value').text(amountSelected);
	});

	
	$('.amount-slider').on('slide', function (slideEvt) {
		var test = commaSeparateNumber($(this).val());
		$('#amount-value').text(test);
	});
	$('.amount-slider').on('change', function () {
		var test = commaSeparateNumber($(this).val());
		$('#amount-value').text(test);
	});
	function commaSeparateNumber(val){
	    while (/(\d+)(\d{3})/.test(val.toString())){
	      val = val.toString().replace(/(\d+)(\d{3})/, '$1'+','+'$2');
	    }
	    return val;
	}
	//dummy condition to display error box
	var errorbox = false;

	if(errorbox) {
		//displays error box
		show_stack_bar_top('notice');
	}

	PNotify.prototype.options.styling = "bootstrap3";
	function show_stack_bar_top(type) {
		var stack_bar_top = {"dir1": "down", "dir2": "right", "push": "top", "spacing1": 0, "spacing2": 0};
	    var opts = {
			        title: "Over Here",
			        text: "Check me out. I'm in a different stack.",
			        addclass: "stack-bar-top error-box",
			        cornerclass: "",
			        width: "100%",
			        hide: false,
			        buttons: {
			       		closer: true,
			       		sticker: true	
			       	},	
			        stack: stack_bar_top
			};
	    switch (type) {
	    case 'notice':
	        opts.title = "Sorry, failed to connect to server.";
	        opts.text = "Sorry, our service is currently unavailable and we are fixing the issue. Please try again later. We apologize for the inconvenience caused.";
	        opts.type = "notice";
	        break;
	    }
	    new PNotify(opts);
	}
	
	$('#beneficiaryHkidPassport\\[0\\]').parent('.selectDiv').removeClass('is-not-active')
	$('#beneficiaryHkidPassport\\[1\\]').parent('.selectDiv').removeClass('is-not-active')
	$('#beneficiaryHkidPassport\\[2\\]').parent('.selectDiv').removeClass('is-not-active')
});

// Checkbox
function correspondenceCheckbox() {
	// Different to permanent is checked
	if (document.getElementById('diffToPermanent').checked) {
		if ($('#diffToPermanentShow').hasClass('hidden')) {
			$('#diffToPermanentShow').removeClass('hidden');
		}
	} else {
		$('#diffToPermanentShow').addClass('hidden');
	}
	// Different to residential is checked
	if (document.getElementById('diffToResidential').checked) {
		if ($('#diffToResidentialShow').hasClass('hidden')) {
			$('#diffToResidentialShow').removeClass('hidden');
		}
	} else {
		$('#diffToResidentialShow').addClass('hidden');
	}
}

//Checking HKID is valid
function isValidHKID(hkid) {
   var isValid = false;
   
   if (hkid && (hkid.length > 7)) {
	  if( hkid.charCodeAt(0) >= 97 && hkid.charCodeAt(0) <= 122) { 
		  var string = hkid.charCodeAt(0)-32;
	  	  hkid = String.fromCharCode(string)+hkid.slice(1);
	  }
	  
      if(hkid.indexOf('(') > -1) {
         var message = hkid.slice(0, hkid.indexOf('('));
         var checksum = hkid.slice((hkid.indexOf('(') + 1), hkid.lastIndexOf(')'));
         if(hkid.length > 10) {
             return false;
         }
      }
      else {
         var message = hkid.slice(0, 7);
         var checksum = hkid.slice(7, 8)
         if(hkid.length > 8) {
             return false;
         }
      }      
      checksum = isNaN(checksum) ? 10 : parseInt(checksum, 10);
      var checkCtr = message.length + 1
      var checksumTotal = 0;
      
      for (var i=0; i<message.length; i++) {
         var digit = isNaN(message[i]) ? equivalentInteger(message[i]) : parseInt(message[i], 10);
         checksumTotal += (digit * checkCtr--);
      }
      isValid = (checksum === (11 - (checksumTotal) % 11));
   }
   return isValid;
}

// HKID Characters
function equivalentInteger(hkidChar){
   var digit;
   switch(hkidChar.toUpperCase()){
      case 'A':
      case 'L':
      case 'M':
         digit = 1;
         break;
      case 'B':
      case 'M':
      case 'X':
         digit = 2;
         break;
      case 'C':
      case 'N':
      case 'Y':
         digit = 3;
         break;
      case 'D':
      case 'O':
      case 'Z':
         digit = 4;
         break;
      case 'E':
      case 'P':
         digit = 5;
         break;
      case 'F':
      case 'Q':
         digit = 6;
         break;
      case 'G':
      case 'R':
         digit = 7;
         break;
      case 'H':
      case 'S':
         digit = 8;
         break;
      case 'I':
      case 'T':
         digit = 9;
         break;
      case 'J':
      case 'U':
         digit = 10;
         break;
      case 'K':
      case 'V':
         digit = 11;
         break;
         
   }
   return digit;
}

// Maxlength checking
function maxLengthCheck(object){
	if (object.value.length > object.maxLength)
	object.value = object.value.slice(0, object.maxLength)
}
// Checking Beneficiary entitlement
function totalBeneficiaryEntitlement() {
	var doesExceed ='';
	var beneficiaryEntitlement1 =  $('#beneficiaryEntitlement\\[0\\]').val() != ""  ? $('#beneficiaryEntitlement\\[0\\]').val(): '0';
	var beneficiaryEntitlement2 =  (($('#beneficiaryEntitlement\\[1\\]').val() != "") && (typeof $('#beneficiaryEntitlement\\[1\\]').val()!='undefined')) ? $('#beneficiaryEntitlement\\[1\\]').val(): '0';
	var beneficiaryEntitlement3 =  (($('#beneficiaryEntitlement\\[2\\]').val() != "") && (typeof $('#beneficiaryEntitlement\\[2\\]').val()!='undefined')) ? $('#beneficiaryEntitlement\\[2\\]').val(): '0';
	
	var beneficiaryEntitlementSum = parseInt(beneficiaryEntitlement1) + parseInt(beneficiaryEntitlement2) + parseInt(beneficiaryEntitlement3);
	
	if(beneficiaryEntitlementSum>100 || beneficiaryEntitlementSum<100){
		doesExceed = "Exceed";
	}else{
		doesExceed = "Does not exceed";
	}
	return doesExceed;
}

// Checking if beneficiary form is valid
function isBeneficaryFormValid() {
  var beneficiaryRes1 = true; 
  var beneficiaryRes2 = true; 
  var beneficiaryRes3 = true;
  // Beneficiary Person 1
  if ($('#beneficiary-info-form\\[0\\]').length) {
	  $('#beneficiary-info-form\\[0\\]').data('bootstrapValidator').validate();
	 if ($('#beneficiary-info-form\\[0\\]').data('bootstrapValidator').isValid()) {
		beneficiaryRes1 = true;
	 } else {
		beneficiaryRes1 = false;
		$('#beneficiary-info-form\\[0\\]').data('bootstrapValidator').validate();
	 }
  }
  // Beneficiary Person 2
  if ($('#beneficiary-info-form\\[1\\]').length) {
	  $('#beneficiary-info-form\\[1\\]').data('bootstrapValidator').validate();
	 if (isBeneficiaryFormEmpty(1) || $('#beneficiary-info-form\\[1\\]').data('bootstrapValidator').isValid()) {
		beneficiaryRes2 = true;
	 } else {
		beneficiaryRes2 = false;
		$('#beneficiary-info-form\\[1\\]').data('bootstrapValidator').validate();
	 }
  }
  // Beneficiary Person 3
  if ($('#beneficiary-info-form\\[2\\]').length) {
	  $('#beneficiary-info-form\\[2\\]').data('bootstrapValidator').validate();
	 if (isBeneficiaryFormEmpty(2) || $('#beneficiary-info-form\\[2\\]').data('bootstrapValidator').isValid()) {
		beneficiaryRes3 = true;
	 } else {
		beneficiaryRes3 = false;
		$('#beneficiary-info-form\\[2\\]').data('bootstrapValidator').validate();
	 }
  }
  return beneficiaryRes1 && beneficiaryRes2 && beneficiaryRes3;
}

// Checking Beneficiary Form if empty
function isBeneficiaryFormEmpty(pos) {
  var $form = $('#beneficiary-info-form\\[' + pos +'\\]');

  if (!$('#beneficiaryLastName\\[' + pos + '\\]').val()
		&& !$('#beneficiaryFirstName\\[' + pos + '\\]').val()
		&& !$('#beneficiaryChineseName\\[' + pos +'\\]').val()
		&& (!$('#beneficiaryHkid\\[' + pos + '\\]').val() || !$('#beneficiaryHkidPassport\\[' + pos + '\\]').val())
		&& ((pos === 0) || !$('#beneficiaryEntitlement\\[' + pos + '\\]').val())
		&& !$('#beneficiaryGender\\[' + pos + '\\]').val()
		&& !$('#beneficiaryRelationship\\[' + pos + '\\]').val()
	 ) {
	  $('#beneficiary-info-form\\[' + pos +'\\]').find('#remove-beneficiary\\[' + pos +'\\]').trigger('click');
	 return true;
  }
  return false;
}

// Checking if Beneficiaries are hidden
function isBeneficiary2Hidden() {
	var isHide = "";
	if($('#beneficiary-info-form\\[1\\]').hasClass('hidden')) {
		isHide = "hidden";
	} else {
		if($('#beneficiary-info-form\\[1\\]').hasClass('hidden')) {
			isHide = "hidden";
		} else {
			isHide = "not hidden";
		}
	}
	return isHide;
}

function isBeneficiary3Hidden() {
	var isHide = "";
	if($('#beneficiary-info-form\\[2\\]').hasClass('hidden')) {
		isHide = "hidden";
	} else {
		if($('#beneficiary-info-form\\[2\\]').hasClass('hidden')) {
			isHide = "hidden";
		} else {
			isHide = "not hidden";
		}
	}
	return isHide;
}

function duplicateBeneficiary() {
	var dupStr = duplicateBeneficiaries(); 
	if(dupStr!= '') {
		var result = /\d+(?:\.\d+)?/.exec(dupStr);
		switch(result.toString()) {
			case '01':
				$('#beneficiaryDupHkidErMsg\\[0\\]').removeClass('hidden');
				$('#beneficiaryDupHkidErMsg\\[1\\]').removeClass('hidden');
				$('#beneficiaryDupHkidErMsg\\[2\\]').addClass('hidden');
				break;
			case '02':
				$('#beneficiaryDupHkidErMsg\\[0\\]').removeClass('hidden');
				$('#beneficiaryDupHkidErMsg\\[2\\]').removeClass('hidden');
				$('#beneficiaryDupHkidErMsg\\[1\\]').addClass('hidden');
				break;
			case '12':
				$('#beneficiaryDupHkidErMsg\\[1\\]').removeClass('hidden');
				$('#beneficiaryDupHkidErMsg\\[2\\]').removeClass('hidden');
				$('#beneficiaryDupHkidErMsg\\[0\\]').addClass('hidden');
				break;
			case '012':
				$('#beneficiaryDupHkidErMsg\\[0\\]').removeClass('hidden');
				$('#beneficiaryDupHkidErMsg\\[1\\]').removeClass('hidden');
				$('#beneficiaryDupHkidErMsg\\[2\\]').removeClass('hidden');
				break;
			default:
				$('#beneficiaryDupHkidErMsg\\[0\\]').addClass('hidden');
				$('#beneficiaryDupHkidErMsg\\[2\\]').addClass('hidden');
				$('#beneficiaryDupHkidErMsg\\[1\\]').addClass('hidden');
		}
	} else {
		$('#beneficiaryDupHkidErMsg\\[0\\]').addClass('hidden');
		$('#beneficiaryDupHkidErMsg\\[1\\]').addClass('hidden');
		$('#beneficiaryDupHkidErMsg\\[2\\]').addClass('hidden');
	}
}

//Checking for Duplicate Beneficiaries
function duplicateBeneficiaries(){
	var isDup = '';
	var beneficiary1 = (($('#beneficiaryHkid\\[0\\]').val() != "") && (typeof $('#beneficiaryHkid\\[0\\]').val() != "undefined") &&	($('#beneficiaryHkid\\[0\\]').hasClass('hidden')==false)) ? '1': '0';
	var beneficiary2 = (($('#beneficiaryHkid\\[1\\]').val() != "") && (typeof $('#beneficiaryHkid\\[1\\]').val() != "undefined") &&	($('#beneficiaryHkid\\[1\\]').hasClass('hidden')==false)) ? '1': '0';	
	var beneficiary3 = (($('#beneficiaryHkid\\[2\\]').val() != "") && (typeof $('#beneficiaryHkid\\[2\\]').val() != "undefined") &&	($('#beneficiaryHkid\\[2\\]').hasClass('hidden')==false)) ? '1': '0';

	var beneficiary1Val = $('#beneficiaryHkid\\[0\\]').val();		
	var beneficiary2Val = $('#beneficiaryHkid\\[1\\]').val();	
	var beneficiary3Val = $('#beneficiaryHkid\\[2\\]').val();		
	
	var beneficiary1isHidden = $('#beneficiaryHkid\\[0\\]').hasClass('hidden'); 
	var beneficiary2isHidden = $('#beneficiaryHkid\\[1\\]').hasClass('hidden'); 
	var beneficiary3isHidden = $('#beneficiaryHkid\\[2\\]').hasClass('hidden');
	
	if(((beneficiary1 == '1') && (beneficiary2 == '1')) || ((beneficiary2 == '1') && (beneficiary3 == '1')) || ((beneficiary1 == '1') && (beneficiary3 == '1'))) {		
		if((beneficiary1Val == beneficiary2Val) || (beneficiary1Val == beneficiary3Val) || (beneficiary2Val == beneficiary3Val)) {
			isDup = 'Duplicate';
		} else {
			isDup = '';
		}
		
		if ((beneficiary1Val == beneficiary2Val) && (beneficiary2Val == beneficiary3Val) && (!beneficiary1isHidden && !beneficiary2isHidden && !beneficiary3isHidden)) {
			isDup+='012';
		} else if((beneficiary1Val == beneficiary2Val) && (!beneficiary1isHidden && !beneficiary2isHidden)) {
			isDup+='01';
		} else if ((beneficiary1Val == beneficiary3Val) && (!beneficiary1isHidden && !beneficiary3isHidden)) {
			isDup+='02';
		} else if ((beneficiary2Val == beneficiary3Val) && (!beneficiary2isHidden && !beneficiary3isHidden)) {
			isDup+='12';
		} else {
			//do nothing
		}
	} else {
		//do nothing
		isDup = '';
	}
	return isDup;
}

function duplicateBeneficiaryPassport() {
	var dupStr = duplicateBeneficiariesPassport();
	if(dupStr!= '') {
		var result = /\d+(?:\.\d+)?/.exec(dupStr);
		switch(result.toString()) {
			case '01':
				$('#beneficiaryDupPassportErMsg\\[0\\]').removeClass('hidden');
				$('#beneficiaryDupPassportErMsg\\[1\\]').removeClass('hidden');
				$('#beneficiaryDupPassportErMsg\\[2\\]').addClass('hidden');
				break;
			case '02':
				$('#beneficiaryDupPassportErMsg\\[0\\]').removeClass('hidden');
				$('#beneficiaryDupPassportErMsg\\[2\\]').removeClass('hidden');
				$('#beneficiaryDupPassportErMsg\\[1\\]').addClass('hidden');
				break;
			case '12':
				$('#beneficiaryDupPassportErMsg\\[1\\]').removeClass('hidden');
				$('#beneficiaryDupPassportErMsg\\[2\\]').removeClass('hidden');
				$('#beneficiaryDupPassportErMsg\\[0\\]').addClass('hidden');
				break;
			case '012':
				$('#beneficiaryDupPassportErMsg\\[0\\]').removeClass('hidden');
				$('#beneficiaryDupPassportErMsg\\[1\\]').removeClass('hidden');
				$('#beneficiaryDupPassportErMsg\\[2\\]').removeClass('hidden');
				break;
			default:
				$('#beneficiaryDupPassportErMsg\\[0\\]').addClass('hidden');
				$('#beneficiaryDupPassportErMsg\\[1\\]').addClass('hidden');
				$('#beneficiaryDupPassportErMsg\\[2\\]').addClass('hidden');
		}
	} else {
		$('#beneficiaryDupPassportErMsg\\[0\\]').addClass('hidden');
		$('#beneficiaryDupPassportErMsg\\[1\\]').addClass('hidden');
		$('#beneficiaryDupPassportErMsg\\[2\\]').addClass('hidden');
	}
}

//Checking for Duplicate Beneficiaries
function duplicateBeneficiariesPassport() {
	var isDup = '';
	var beneficiaryPassport1 = (($('#beneficiaryPassport\\[0\\]').val() != "") && (typeof $('#beneficiaryPassport\\[0\\]').val() != "undefined") &&	($('#beneficiaryPassport\\[0\\]').hasClass('hidden') == false)) ? '1': '0';
	var beneficiaryPassport2 = (($('#beneficiaryPassport\\[1\\]').val() != "") &&	(typeof $('#beneficiaryPassport\\[1\\]').val() != "undefined") &&	($('#beneficiaryPassport\\[1\\]').hasClass('hidden') == false)) ? '1': '0';	
	var beneficiaryPassport3 = (($('#beneficiaryPassport\\[2\\]').val() != "") &&	(typeof $('#beneficiaryPassport\\[2\\]').val() != "undefined") &&	($('#beneficiaryPassport\\[2\\]').hasClass('hidden') == false)) ? '1': '0';
	
	var beneficiary1PassportVal = $('#beneficiaryPassport\\[0\\]').val();		
	var beneficiary2PassportVal = $('#beneficiaryPassport\\[1\\]').val();	
	var beneficiary3PassportVal = $('#beneficiaryPassport\\[2\\]').val();		
	
	var beneficiaryPassport1isHidden = $('#beneficiaryPassport\\[0\\]').hasClass('hidden'); 
	var beneficiaryPassport2isHidden = $('#beneficiaryPassport\\[1\\]').hasClass('hidden');
	var beneficiaryPassport3isHidden = $('#beneficiaryPassport\\[2\\]').hasClass('hidden');
	
	if(((beneficiaryPassport1 == '1') && (beneficiaryPassport2 == '1')) ||
	   ((beneficiaryPassport2 == '1') && (beneficiaryPassport3 == '1')) ||
	   ((beneficiaryPassport1 == '1') && (beneficiaryPassport3 == '1'))) {
		
		if((beneficiary1PassportVal == beneficiary2PassportVal) || (beneficiary1PassportVal == beneficiary3PassportVal) || (beneficiary2PassportVal == beneficiary3PassportVal)) {
			isDup = 'Duplicate';
		} else {
			isDup = '';
		}
		
		if ((beneficiary1PassportVal == beneficiary2PassportVal) && (beneficiary2PassportVal== beneficiary3PassportVal) && (!beneficiaryPassport1isHidden && !beneficiaryPassport2isHidden && !beneficiaryPassport3isHidden)) {
			isDup+='012';
		} else if((beneficiary1PassportVal == beneficiary2PassportVal) && (!beneficiaryPassport1isHidden && !beneficiaryPassport2isHidden)) {
			isDup+='01';
		} else if ((beneficiary1PassportVal == beneficiary3PassportVal) && (!beneficiaryPassport1isHidden && !beneficiaryPassport3isHidden)) {
			isDup+='02';
		} else if ((beneficiary2PassportVal == beneficiary3PassportVal) && (!beneficiaryPassport2isHidden && !beneficiaryPassport3isHidden)) {
			isDup+='12';
		} else {
			//do nothing
		}
	} else {
		//do nothing
		isDup = '';
	}
	return isDup;
}

function duplicateBeneficicaryChineseName() {
	var dupStr = duplicateChineseName();
	if(dupStr!= '') {
		var result = /\d+(?:\.\d+)?/.exec(dupStr);
		switch(result.toString()) {
			case '01':
				$('#beneficiaryDupChineseErMsg\\[0\\]').removeClass('hidden');
				$('#beneficiaryDupChineseErMsg\\[1\\]').removeClass('hidden');
				$('#beneficiaryDupChineseErMsg\\[2\\]').addClass('hidden');
				break;
			case '02':
				$('#beneficiaryDupChineseErMsg\\[0\\]').removeClass('hidden');
				$('#beneficiaryDupChineseErMsg\\[2\\]').removeClass('hidden');
				$('#beneficiaryDupChineseErMsg\\[1\\]').addClass('hidden');
				break;
			case '12':
				$('#beneficiaryDupChineseErMsg\\[1\\]').removeClass('hidden');
				$('#beneficiaryDupChineseErMsg\\[2\\]').removeClass('hidden');
				$('#beneficiaryDupChineseErMsg\\[0\\]').addClass('hidden');
				break;
			case '012':
				$('#beneficiaryDupChineseErMsg\\[0\\]').removeClass('hidden');
				$('#beneficiaryDupChineseErMsg\\[1\\]').removeClass('hidden');
				$('#beneficiaryDupChineseErMsg\\[2\\]').removeClass('hidden');
				break;
			default:
				$('#beneficiaryDupChineseErMsg\\[0\\]').addClass('hidden');
				$('#beneficiaryDupChineseErMsg\\[1\\]').addClass('hidden');
				$('#beneficiaryDupChineseErMsg\\[2\\]').addClass('hidden');
		}
	} else {
		$('#beneficiaryDupChineseErMsg\\[0\\]').addClass('hidden');
		$('#beneficiaryDupChineseErMsg\\[1\\]').addClass('hidden');
		$('#beneficiaryDupChineseErMsg\\[2\\]').addClass('hidden');
	}
}

//Checking for Duplicate Chinese Name
function duplicateChineseName() {
	var isDup = '';
	var chineseName1 = (($('#beneficiaryChineseName\\[0\\]').val() != "") && (typeof $('#beneficiaryChineseName\\[0\\]').val() != "undefined")) ? '1': '0';
	var chineseName2 = (($('#beneficiaryChineseName\\[1\\]').val() != "") && (typeof $('#beneficiaryChineseName\\[1\\]').val() != "undefined")) ? '1': '0';
	var chineseName3 = (($('#beneficiaryChineseName\\[2\\]').val() != "") && (typeof $('#beneficiaryChineseName\\[2\\]').val() != "undefined")) ? '1': '0';

	var chineseName1Val = $('#beneficiaryChineseName\\[0\\]').val();		
	var chineseName2Val = $('#beneficiaryChineseName\\[1\\]').val();	
	var chineseName3Val = $('#beneficiaryChineseName\\[2\\]').val();
	
	if(((chineseName1 == '1') && (chineseName2 == '1')) || ((chineseName2 == '1') && (chineseName3 == '1')) || ((chineseName1 == '1') && (chineseName3 == '1'))) {
		if((chineseName1Val == chineseName2Val) || (chineseName1Val == chineseName3Val) || (chineseName2Val == chineseName3Val)) {
			isDup = 'Duplicate';
		} else {
			isDup = '';
		}
		
		if ((chineseName1Val == chineseName2Val) && (chineseName2Val== chineseName3Val)) {
			isDup+='012';
		} else if(chineseName1Val == chineseName2Val) {
			isDup+='01';
		} else if (chineseName1Val == chineseName3Val) {
			isDup+='02';
		} else if (chineseName2Val == chineseName3Val) {
			isDup+='12';
		} else {
			//do nothing
		}
	} else {
		//do nothing
		isDup = '';
	}
	return isDup;
}

//Getting the FullName for Beneficiary 
function getBeneficiaryFullName0() {
	var fName = document.getElementById("beneficiaryFirstName[0]").value;
	var lName = document.getElementById("beneficiaryLastName[0]").value;
	document.getElementById("beneficiaryFullName[0]").value = fName + lName;
}

function getBeneficiaryFullName1() {
	var fName = document.getElementById("beneficiaryFirstName[1]").value;
	var lName = document.getElementById("beneficiaryLastName[1]").value;
	document.getElementById("beneficiaryFullName[1]").value = fName + lName;
}

function getBeneficiaryFullName2() {
	var fName = document.getElementById("beneficiaryFirstName[2]").value;
	var lName = document.getElementById("beneficiaryLastName[2]").value;
	document.getElementById("beneficiaryFullName[2]").value = fName + lName;
}

//Duplicate English Name
function duplicateEnglishName(){
	var isDup = '';
	var fullName1 = (($('#beneficiaryFullName\\[0\\]').val() != "") && (typeof $('#beneficiaryFullName\\[0\\]').val() != "undefined")) ? '1': '0';
	var fullName2 = (($('#beneficiaryFullName\\[1\\]').val() != "") && (typeof $('#beneficiaryFullName\\[1\\]').val() != "undefined")) ? '1': '0';
	var fullName3 = (($('#beneficiaryFullName\\[2\\]').val() != "") && (typeof $('#beneficiaryFullName\\[2\\]').val() != "undefined")) ? '1': '0';						
	var fullName1Val = $('#beneficiaryFullName\\[0\\]').val();
	var fullName2Val = $('#beneficiaryFullName\\[1\\]').val();
	var fullName3Val = $('#beneficiaryFullName\\[2\\]').val();
	
	if(((fullName1 == '1') && (fullName2 == '1')) || ((fullName2 == '1') && (fullName3 == '1')) || ((fullName1 == '1') && (fullName3 == '1'))) {
		if((fullName1Val == fullName2Val) || (fullName1Val == fullName3Val) || (fullName2Val == fullName3Val)) {
			isDup = 'Duplicate';
		} else {
			isDup = '';
		}
		
		if ((fullName1Val == fullName2Val) && (fullName2Val== fullName3Val)) {
			isDup+='012';
		} else if(fullName1Val == fullName2Val) {
			isDup+='01';
		} else if (fullName1Val == fullName3Val) {
			isDup+='02';
		} else if (fullName2Val == fullName3Val) {
			isDup+='12';
		} else {
			//do nothing
		}
	} else {
		//do nothing
		isDup = '';
	}
	return isDup;
}

function duplicateBeneficiaryEnglishName() {
	var dupStr = duplicateEnglishName();
	if(dupStr!= '') {
		var result = /\d+(?:\.\d+)?/.exec(dupStr);
		switch(result.toString()) {
			case '01':
				$('#beneficiaryDupNameErMsg\\[0\\]').removeClass('hidden');
				$('#beneficiaryDupNameErMsg\\[1\\]').removeClass('hidden');
				$('#beneficiaryDupNameErMsg\\[2\\]').addClass('hidden');
				break;
			case '02':
				$('#beneficiaryDupNameErMsg\\[0\\]').removeClass('hidden');
				$('#beneficiaryDupNameErMsg\\[2\\]').removeClass('hidden');
				$('#beneficiaryDupNameErMsg\\[1\\]').addClass('hidden');
				break;
			case '12':
				$('#beneficiaryDupNameErMsg\\[1\\]').removeClass('hidden');
				$('#beneficiaryDupNameErMsg\\[2\\]').removeClass('hidden');
				$('#beneficiaryDupNameErMsg\\[0\\]').addClass('hidden');
				break;
			case '012':
				$('#beneficiaryDupNameErMsg\\[0\\]').removeClass('hidden');
				$('#beneficiaryDupNameErMsg\\[1\\]').removeClass('hidden');
				$('#beneficiaryDupNameErMsg\\[2\\]').removeClass('hidden');
				break;
			default:
				$('#beneficiaryDupNameErMsg\\[0\\]').addClass('hidden');
				$('#beneficiaryDupNameErMsg\\[1\\]').addClass('hidden');
				$('#beneficiaryDupNameErMsg\\[2\\]').addClass('hidden');
		}
	} else {
		$('#beneficiaryDupNameErMsg\\[0\\]').addClass('hidden');
		$('#beneficiaryDupNameErMsg\\[1\\]').addClass('hidden');
		$('#beneficiaryDupNameErMsg\\[2\\]').addClass('hidden');
	}
}

function getSavieOnlinePlandetails() {
	
	var amount = $('#R').val();
	var amount_rp = $('#plan-amount').val();
	var paymentMode = $('#type-of-payment').val();
	var paymentYear;
	if($('#total-years-holder').is(":hidden")){
		paymentYear = 3
	}else {
		paymentYear = $("#total-payment-years").val();
	}
	
	var premium = amount;
	
	var birthOfDay = $('#plan-dob-datepicker').val();
	var birthDates=birthOfDay.split("-");
	var issueAge = jsGetAge(birthDates[2]+"-"+birthDates[1]+"-"+birthDates[0]);
	
	if('one-off-premium' == paymentMode) {
		paymentMode='SP';
		premium = amount;
	}else {
		paymentMode='RP';
		premium = amount_rp;
	}
	
	$.ajax({
		type : "POST",
		async: true,
		url : context + "/ajax/savings-insurance/getSavieOnlinePlandetails",
		data: {
			insuredAmount : premium,
			paymentType : paymentMode,
			dob : $("#plan-dob-datepicker").val(),
			promoCode : $("#promoCode").val(),
			paymentYear:paymentYear
			},
		success : function(data) {
			/* if(data != null && data.errorMsg != null && data.errorMsg != ""){
				$("#errorMsg").html(data.errorMsg);
			}else{
				$("#apiData").html(data.apiData);
			} */
			if(data.result == "success"){
				var json = $.parseJSON(JSON.stringify(data));
				jsonTableData = $.parseJSON(JSON.stringify(data));
				$total_years = json.salesIllustration.yearPlans.length;
				
				if(paymentMode == 'RP') {
				    
					var paymentYears = $('#total-payment-years').val();
					for(var i = 0; i < $total_years; i++) {
						if (json.salesIllustration.yearPlans[i].year <= 100) { // do not include year 100 data from their response
							for(var j = 0; j < 4; j++){
								//rate 0
								if(json.salesIllustration.yearPlans[i].plans[j].rate == "zero"){
									if((paymentYears <= 3 && i == 4)
											|| paymentYears == 4 && i == 3
											|| paymentYears > 4 && paymentYears == (i + 1)){
										$('#policy-year-0-0').html(i+1);
										$('#premium-change-0-0').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].totalPremium));
										$('#account-value-change-0-0').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].accountBalance));
										$('#surrender-change-0-0').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit));
										$('#death-change-0-0').html('<span data-toggle="tooltip" data-html="true" data-placement="right" title="" class=" default-pointer" data-original-title="Death Benefit (HK$) / Accidental Death Benefit (HK$)">'
												+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedDeathBenefit)
												+ ' / '
												+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit)
												+ '</span>');
									}
									if ((70 > issueAge && issueAge > 60) && i == (74 - issueAge)) {
										$('#policy-year-0-1').html(getBundle(getBundleLanguage, "savie.planDetails.Age.76"));
										$('#premium-change-0-1').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].totalPremium));
										$('#account-value-change-0-1').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].accountBalance));
										$('#surrender-change-0-1').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit));
										$('#death-change-0-1').html('<span data-toggle="tooltip" data-html="true" data-placement="right" title="" class=" default-pointer" data-original-title="Death Benefit (HK$) / Accidental Death Benefit (HK$)">'
												+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedDeathBenefit)
												+ ' / '
												+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit)
												+ '</span>');
									}else if ((issueAge < 60) && i == (64 - issueAge)) {
										$('#policy-year-0-1').html(getBundle(getBundleLanguage, "savie.planDetails.Age.66"));
										$('#premium-change-0-1').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].totalPremium));
										$('#account-value-change-0-1').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].accountBalance));
										$('#surrender-change-0-1').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit));
										$('#death-change-0-1').html('<span data-toggle="tooltip" data-html="true" data-placement="right" title="" class=" default-pointer" data-original-title="Death Benefit (HK$) / Accidental Death Benefit (HK$)">'
												+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedDeathBenefit)
												+ ' / '
												+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit)
												+ '</span>');
									}else if (70 <= issueAge) {
										alert('stick with the current display of Age 100');
									}
									if(json.salesIllustration.yearPlans[i].year == 100) {
										$('#premium-change-0-2').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].totalPremium));
										$('#account-value-change-0-2').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].accountBalance));
										$('#surrender-change-0-2').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit));
										$('#death-change-0-2').html('<span data-toggle="tooltip" data-html="true" data-placement="right" title="" class=" default-pointer" data-original-title="Death Benefit (HK$) / Accidental Death Benefit (HK$)">'
												+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedDeathBenefit)
												+ ' / '
												+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit)
												+ '</span>');
									}
								}
								//rate 2
								if(json.salesIllustration.yearPlans[i].plans[j].rate == "two"){
									if((paymentYears <= 3 && i == 4)
											|| paymentYears == 4 && i == 3
											|| paymentYears > 4 && paymentYears == (i + 1)){
										$('#policy-year-2-0').html(i+1);
										$('#premium-change-2-0').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].totalPremium));
										$('#account-value-change-2-0').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].accountBalance));
										$('#surrender-change-2-0').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit));
										$('#death-change-2-0').html('<span data-toggle="tooltip" data-html="true" data-placement="right" title="" class=" default-pointer" data-original-title="Death Benefit (HK$) / Accidental Death Benefit (HK$)">'
												+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedDeathBenefit)
												+ ' / '
												+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit)
												+ '</span>');
									}
									if ((70 > issueAge && issueAge > 60) && i == (74 - issueAge)) {
										$('#policy-year-2-1').html(getBundle(getBundleLanguage, "savie.planDetails.Age.76"));
										$('#premium-change-2-1').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].totalPremium));
										$('#account-value-change-2-1').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].accountBalance));
										$('#surrender-change-2-1').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit));
										$('#death-change-2-1').html('<span data-toggle="tooltip" data-html="true" data-placement="right" title="" class=" default-pointer" data-original-title="Death Benefit (HK$) / Accidental Death Benefit (HK$)">'
												+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedDeathBenefit)
												+ ' / '
												+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit)
												+ '</span>');
									}else if ((issueAge < 60) && i == (64 - issueAge)) {
										$('#policy-year-2-1').html(getBundle(getBundleLanguage, "savie.planDetails.Age.66"));
										$('#premium-change-2-1').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].totalPremium));
										$('#account-value-change-2-1').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].accountBalance));
										$('#surrender-change-2-1').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit));
										$('#death-change-2-1').html('<span data-toggle="tooltip" data-html="true" data-placement="right" title="" class=" default-pointer" data-original-title="Death Benefit (HK$) / Accidental Death Benefit (HK$)">'
												+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedDeathBenefit)
												+ ' / '
												+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit)
												+ '</span>');
									}else if (70 <= issueAge) {
										alert('stick with the current display of Age 100');
									}
									if(json.salesIllustration.yearPlans[i].year == 100) {
										$('#premium-change-2-2').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].totalPremium));
										$('#account-value-change-2-2').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].accountBalance));
										$('#surrender-change-2-2').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit));
										$('#death-change-2-2').html('<span data-toggle="tooltip" data-html="true" data-placement="right" title="" class=" default-pointer" data-original-title="Death Benefit (HK$) / Accidental Death Benefit (HK$)">'
												+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedDeathBenefit)
												+ ' / '
												+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit)
												+ '</span>');
									}
								}
								//rate 3
								if(json.salesIllustration.yearPlans[i].plans[j].rate == "three"){
									if((paymentYears <= 3 && i == 4)
											|| paymentYears == 4 && i == 3
											|| paymentYears > 4 && paymentYears == (i + 1)){
										$('#policy-year-3-0').html(i+1);
										$('#premium-change-3-0').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].totalPremium));
										$('#account-value-change-3-0').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].accountBalance));
										$('#surrender-change-3-0').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit));
										$('#death-change-3-0').html('<span data-toggle="tooltip" data-html="true" data-placement="right" title="" class=" default-pointer" data-original-title="Death Benefit (HK$) / Accidental Death Benefit (HK$)">'
												+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedDeathBenefit)
												+ ' / '
												+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit)
												+ '</span>');
									}
									if ((70 > issueAge && issueAge > 60) && i == (74 - issueAge)) {
										$('#policy-year-3-1').html(getBundle(getBundleLanguage, "savie.planDetails.Age.76"));
										$('#premium-change-3-1').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].totalPremium));
										$('#account-value-change-3-1').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].accountBalance));
										$('#surrender-change-3-1').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit));
										$('#death-change-3-1').html('<span data-toggle="tooltip" data-html="true" data-placement="right" title="" class=" default-pointer" data-original-title="Death Benefit (HK$) / Accidental Death Benefit (HK$)">'
												+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedDeathBenefit)
												+ ' / '
												+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit)
												+ '</span>');
									}else if ((issueAge < 60) && i == (64 - issueAge)) {
										$('#policy-year-3-1').html(getBundle(getBundleLanguage, "savie.planDetails.Age.66"));
										$('#premium-change-3-1').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].totalPremium));
										$('#account-value-change-3-1').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].accountBalance));
										$('#surrender-change-3-1').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit));
										$('#death-change-3-1').html('<span data-toggle="tooltip" data-html="true" data-placement="right" title="" class=" default-pointer" data-original-title="Death Benefit (HK$) / Accidental Death Benefit (HK$)">'
												+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedDeathBenefit)
												+ ' / '
												+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit)
												+ '</span>');
									}else if (70 <= issueAge) {
										alert('stick with the current display of Age 100');
									}
									if(json.salesIllustration.yearPlans[i].year == 100) {
										$('#premium-change-3-2').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].totalPremium));
										$('#account-value-change-3-2').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].accountBalance));
										$('#surrender-change-3-2').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit));
										$('#death-change-3-2').html('<span data-toggle="tooltip" data-html="true" data-placement="right" title="" class=" default-pointer" data-original-title="Death Benefit (HK$) / Accidental Death Benefit (HK$)">'
												+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedDeathBenefit)
												+ ' / '
												+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit)
												+ '</span>');
									}
								}
								//rate 4
								if(json.salesIllustration.yearPlans[i].plans[j].rate == "four"){
									if((paymentYears <= 3 && i == 4)
											|| paymentYears == 4 && i == 3
											|| paymentYears > 4 && paymentYears == (i + 1)){
										$('#policy-year-4-0').html(i+1);
										$('#premium-change-4-0').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].totalPremium));
										$('#account-value-change-4-0').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].accountBalance));
										$('#surrender-change-4-0').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit));
										$('#death-change-4-0').html('<span data-toggle="tooltip" data-html="true" data-placement="right" title="" class=" default-pointer" data-original-title="Death Benefit (HK$) / Accidental Death Benefit (HK$)">'
												+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedDeathBenefit)
												+ ' / '
												+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit)
												+ '</span>');
									}
									if ((70 > issueAge && issueAge > 60) && i == (74 - issueAge)) {
										$('#policy-year-4-1').html(getBundle(getBundleLanguage, "savie.planDetails.Age.76"));
										$('#premium-change-4-1').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].totalPremium));
										$('#account-value-change-4-1').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].accountBalance));
										$('#surrender-change-4-1').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit));
										$('#death-change-4-1').html('<span data-toggle="tooltip" data-html="true" data-placement="right" title="" class=" default-pointer" data-original-title="Death Benefit (HK$) / Accidental Death Benefit (HK$)">'
												+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedDeathBenefit)
												+ ' / '
												+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit)
												+ '</span>');
									}else if ((issueAge < 60) && i == (64 - issueAge)) {
										$('#policy-year-4-1').html(getBundle(getBundleLanguage, "savie.planDetails.Age.66"));
										$('#premium-change-4-1').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].totalPremium));
										$('#account-value-change-4-1').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].accountBalance));
										$('#surrender-change-4-1').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit));
										$('#death-change-4-1').html('<span data-toggle="tooltip" data-html="true" data-placement="right" title="" class=" default-pointer" data-original-title="Death Benefit (HK$) / Accidental Death Benefit (HK$)">'
												+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedDeathBenefit)
												+ ' / '
												+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit)
												+ '</span>');
									}else if (70 <= issueAge) {
										alert('stick with the current display of Age 100');
									}
									if(json.salesIllustration.yearPlans[i].year == 100) {
										$('#premium-change-4-2').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].totalPremium));
										$('#account-value-change-4-2').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].accountBalance));
										$('#surrender-change-4-2').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit));
										$('#death-change-4-2').html('<span data-toggle="tooltip" data-html="true" data-placement="right" title="" class=" default-pointer" data-original-title="Death Benefit (HK$) / Accidental Death Benefit (HK$)">'
												+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedDeathBenefit)
												+ ' / '
												+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit)
												+ '</span>');
									}
								}
								
								if(json.salesIllustration.yearPlans[i].plans[j].rate == "three"){
									if (i == 0 || i == 1 || i == 2) {
										var rowCtr = i+1;
										if(i == 2) {
											$("#3rd_policy_year").html(fmoney(json.salesIllustration.yearPlans[i].plans[j].accountBalance))
										}
										
										$('#credit-rate-change-'+rowCtr).html(fmoney(textToNumber(json.salesIllustration.yearPlans[i].plans[j].rate))+"%");
										$('#premium-'+rowCtr).html(fmoney(json.salesIllustration.yearPlans[i].plans[j].totalPremium));
										$('#account-value-'+rowCtr).html(fmoney(json.salesIllustration.yearPlans[i].plans[j].accountBalance));
										$('#surrender-'+rowCtr).html(fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit));
										$('#death-'+rowCtr).html('<span data-toggle="tooltip" data-html="true" data-placement="right" title="" class=" default-pointer" data-original-title="Death Benefit (HK$) / Accidental Death Benefit (HK$)">'
												+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedDeathBenefit)
												+ ' / '
												+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit)
												+ '</span>');
									}
								}
								if(json.salesIllustration.yearPlans[i].plans[j].rate == "four"){
									if(i==2){
										var rowCtr = 3;
										json.salesIllustration.yearPlans[i].plans[j].rate = 'three';
										
										console.log(json.salesIllustration.yearPlans[i].plans[j].rate);
										$('#credit-rate-change-'+rowCtr).html("3.3%");
										$('#premium-'+rowCtr).html(fmoney(json.salesIllustration.yearPlans[i].plans[j].totalPremium));
										$('#account-value-'+rowCtr).html(fmoney(json.salesIllustration.yearPlans[i].plans[j].accountBalance));
										$('#surrender-'+rowCtr).html(fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit));
										$('#death-'+rowCtr).html('<span data-toggle="tooltip" data-html="true" data-placement="right" title="" class=" default-pointer" data-original-title="Death Benefit (HK$) / Accidental Death Benefit (HK$)">'
												+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedDeathBenefit)
												+ ' / '
												+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit)
												+ '</span>');
									}
								}
							}
						}
					}
				
				}else {
					/* Reset Policy Year Label */
					$('#policy-year-0-0').html("5");
					$('#policy-year-2-0').html("5");
					$('#policy-year-3-0').html("5");
					$('#policy-year-4-0').html("5");
					$('#policy-year-0-1').html("10");
					$('#policy-year-2-1').html("10");
					$('#policy-year-3-1').html("10");
					$('#policy-year-4-1').html("10");

					for(var i = 0; i < $total_years; i++) {
						if (json.salesIllustration.yearPlans[i].year <= 100) { // do not include year 100 data from their response
							for(var j = 0; j < 4; j++){
								//rate 0
								if(json.salesIllustration.yearPlans[i].plans[j].rate == "zero"){
									if (i == 4) {
										$('#premium-change-0-0').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].totalPremium));
										$('#account-value-change-0-0').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].accountBalance));
										$('#surrender-change-0-0').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit));
										$('#death-change-0-0').html('<span data-toggle="tooltip" data-html="true" data-placement="right" title="" class=" default-pointer" data-original-title="Death Benefit (HK$) / Accidental Death Benefit (HK$)">'
												+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedDeathBenefit)
												+ ' / '
												+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit)
												+ '</span>');
									}
								}
								
								if(json.salesIllustration.yearPlans[i].plans[j].rate == "zero"){
									if (i == 9) {
										$('#premium-change-0-1').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].totalPremium));
										$('#account-value-change-0-1').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].accountBalance));
										$('#surrender-change-0-1').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit));
										$('#death-change-0-1').html('<span data-toggle="tooltip" data-html="true" data-placement="right" title="" class=" default-pointer" data-original-title="Death Benefit (HK$) / Accidental Death Benefit (HK$)">'
												+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedDeathBenefit)
												+ ' / '
												+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit)
												+ '</span>');
									}
								}
								if(json.salesIllustration.yearPlans[i].plans[j].rate == "zero" && json.salesIllustration.yearPlans[i].year == 100){
										$('#premium-change-0-2').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].totalPremium));
										$('#account-value-change-0-2').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].accountBalance));
										$('#surrender-change-0-2').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit));
										$('#death-change-0-2').html('<span data-toggle="tooltip" data-html="true" data-placement="right" title="" class=" default-pointer" data-original-title="Death Benefit (HK$) / Accidental Death Benefit (HK$)">'
												+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedDeathBenefit)
												+ ' / '
												+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit)
												+ '</span>');
								}
								//rate 2
								if(json.salesIllustration.yearPlans[i].plans[j].rate == "two"){
									if (i == 4) {
										$('#premium-change-2-0').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].totalPremium));
										$('#account-value-change-2-0').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].accountBalance));
										$('#surrender-change-2-0').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit));
										$('#death-change-2-0').html('<span data-toggle="tooltip" data-html="true" data-placement="right" title="" class=" default-pointer" data-original-title="Death Benefit (HK$) / Accidental Death Benefit (HK$)">'
												+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedDeathBenefit)
												+ ' / '
												+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit)
												+ '</span>');
									}
								}
								if(json.salesIllustration.yearPlans[i].plans[j].rate == "two"){
									if (i == 9) {
										$('#premium-change-2-1').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].totalPremium));
										$('#account-value-change-2-1').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].accountBalance));
										$('#surrender-change-2-1').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit));
										$('#death-change-2-1').html('<span data-toggle="tooltip" data-html="true" data-placement="right" title="" class=" default-pointer" data-original-title="Death Benefit (HK$) / Accidental Death Benefit (HK$)">'
												+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedDeathBenefit)
												+ ' / '
												+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit)
												+ '</span>');
									}
								}
								if(json.salesIllustration.yearPlans[i].plans[j].rate == "two" && json.salesIllustration.yearPlans[i].year == 100){
										$('#premium-change-2-2').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].totalPremium));
										$('#account-value-change-2-2').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].accountBalance));
										$('#surrender-change-2-2').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit));
										$('#death-change-2-2').html('<span data-toggle="tooltip" data-html="true" data-placement="right" title="" class=" default-pointer" data-original-title="Death Benefit (HK$) / Accidental Death Benefit (HK$)">'
												+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedDeathBenefit)
												+ ' / '
												+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit)
												+ '</span>');
								}
								//rate 3
								if(json.salesIllustration.yearPlans[i].plans[j].rate == "three"){
									if (i == 4) {
										$('#premium-change-3-0').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].totalPremium));
										$('#account-value-change-3-0').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].accountBalance));
										$('#surrender-change-3-0').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit));
										$('#death-change-3-0').html('<span data-toggle="tooltip" data-html="true" data-placement="right" title="" class=" default-pointer" data-original-title="Death Benefit (HK$) / Accidental Death Benefit (HK$)">'
												+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedDeathBenefit)
												+ ' / '
												+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit)
												+ '</span>');
									}
								}
								if(json.salesIllustration.yearPlans[i].plans[j].rate == "three"){
									if (i == 9) {
										
										$('#policy-year-3-1').html("10");
										$('#premium-change-3-1').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].totalPremium));
										$('#account-value-change-3-1').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].accountBalance));
										$('#surrender-change-3-1').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit));
										$('#death-change-3-1').html('<span data-toggle="tooltip" data-html="true" data-placement="right" title="" class=" default-pointer" data-original-title="Death Benefit (HK$) / Accidental Death Benefit (HK$)">'
												+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedDeathBenefit)
												+ ' / '
												+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit)
												+ '</span>');
									}
								}
								if(json.salesIllustration.yearPlans[i].plans[j].rate == "three" && json.salesIllustration.yearPlans[i].year == 100){
										$('#premium-change-3-2').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].totalPremium));
										$('#account-value-change-3-2').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].accountBalance));
										$('#surrender-change-3-2').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit));
										$('#death-change-3-2').html('<span data-toggle="tooltip" data-html="true" data-placement="right" title="" class=" default-pointer" data-original-title="Death Benefit (HK$) / Accidental Death Benefit (HK$)">'
												+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedDeathBenefit)
												+ ' / '
												+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit)
												+ '</span>');
								}
								//rate 4
								if(json.salesIllustration.yearPlans[i].plans[j].rate == "four"){
									if (i == 4) {
										$('#premium-change-4-0').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].totalPremium));
										$('#account-value-change-4-0').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].accountBalance));
										$('#surrender-change-4-0').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit));
										$('#death-change-4-0').html('<span data-toggle="tooltip" data-html="true" data-placement="right" title="" class=" default-pointer" data-original-title="Death Benefit (HK$) / Accidental Death Benefit (HK$)">'
												+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedDeathBenefit)
												+ ' / '
												+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit)
												+ '</span>');
									}
								}
								if(json.salesIllustration.yearPlans[i].plans[j].rate == "four"){
									if (i == 9) {
										$('#premium-change-4-1').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].totalPremium));
										$('#account-value-change-4-1').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].accountBalance));
										$('#surrender-change-4-1').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit));
										$('#death-change-4-1').html('<span data-toggle="tooltip" data-html="true" data-placement="right" title="" class=" default-pointer" data-original-title="Death Benefit (HK$) / Accidental Death Benefit (HK$)">'
												+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedDeathBenefit)
												+ ' / '
												+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit)
												+ '</span>');
									}
								}
								if(json.salesIllustration.yearPlans[i].plans[j].rate == "four" && json.salesIllustration.yearPlans[i].year == 100){
										$('#premium-change-4-2').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].totalPremium));
										$('#account-value-change-4-2').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].accountBalance));
										$('#surrender-change-4-2').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit));
										$('#death-change-4-2').html('<span data-toggle="tooltip" data-html="true" data-placement="right" title="" class=" default-pointer" data-original-title="Death Benefit (HK$) / Accidental Death Benefit (HK$)">'
												+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedDeathBenefit)
												+ ' / '
												+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit)
												+ '</span>');
								}
								
								if(json.salesIllustration.yearPlans[i].plans[j].rate == "three"){
									
									if (i == 0 || i == 1 || i == 2) {
										var rowCtr = i+1;
										if(i == 2) {
											$("#3rd_policy_year").html("HK$"+fmoney(json.salesIllustration.yearPlans[i].plans[j].accountBalance))
										}
										
										$('#credit-rate-change-'+rowCtr).html("2%");//fmoney(textToNumber(json.salesIllustration.yearPlans[i].plans[j].rate))
										$('#premium-'+rowCtr).html(fmoney(json.salesIllustration.yearPlans[i].plans[j].totalPremium));
										$('#account-value-'+rowCtr).html(fmoney(json.salesIllustration.yearPlans[i].plans[j].accountBalance));
										$('#surrender-'+rowCtr).html(fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit));
										$('#death-'+rowCtr).html('<span data-toggle="tooltip" data-html="true" data-placement="right" title="" class=" default-pointer" data-original-title="Death Benefit (HK$) / Accidental Death Benefit (HK$)">'
												+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedDeathBenefit)
												+ ' / '
												+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit)
												+ '</span>');
									}
								}
								if(json.salesIllustration.yearPlans[i].plans[j].rate == "four"){
									if(i==2){
										var rowCtr = 3;
										json.salesIllustration.yearPlans[i].plans[j].rate = 'three';
										
										console.log(json.salesIllustration.yearPlans[i].plans[j].rate);
										$('#credit-rate-change-'+rowCtr).html("2%");//3.3%
										$('#premium-'+rowCtr).html(fmoney(json.salesIllustration.yearPlans[i].plans[j].totalPremium));
										$('#account-value-'+rowCtr).html(fmoney(json.salesIllustration.yearPlans[i].plans[j].accountBalance));
										$('#surrender-'+rowCtr).html(fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit));
										$('#death-'+rowCtr).html('<span data-toggle="tooltip" data-html="true" data-placement="right" title="" class=" default-pointer" data-original-title="Death Benefit (HK$) / Accidental Death Benefit (HK$)">'
												+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedDeathBenefit)
												+ ' / '
												+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit)
												+ '</span>');
									}
								}
							}
						}
					}
				}
					
			}
			$('#loadingDiv').toggle();
			$('body').removeClass('modal-open');
		}
    });
}

function getTimeSlot(perTime){
	var csCenter = $("#centre").val();
	var perferredDate = $("#preferred-date").val();
	$.ajax({     
	    url:context+'/ajax/savings-insurance/getTimeSlot',     
	    type:'post',     
	    data:{    
	    	"csCenter": csCenter,
	        "perferredDate":perferredDate
   		},     
	    error:function(){       
	    },     
	    success:function(data){
	    	
	    	$("#preferred-time option").remove(); 
	    	if(data.timeSlots != null && data.timeSlots.length > 0){
		    	for(var i=0; i<data.timeSlots.length; i++) {
		    		if(data.timeSlots[i].manPower>0) {
		    			var op = "<option value='" + data.timeSlots[i].timeSlot + "'";
		    			if(perTime !=null && perTime !='' && perTime == data.timeSlots[i].timeSlot){
		    				op = op + " selected='selected'";
		    			}
		    			op = op + ">" + data.timeSlots[i].timeSlot + "</option>";
		    			$("#preferred-time").append(op);
		    		}
		    	}
	    	}
	    	else if(data.sessionError != null && data.sessionError == "sessionError"){
	    		window.location.href= context+'/'+language+'/'+'savings-insurance'; 
	    	}
	    	else {
	    		$("#preferred-time").prepend("<option value=''></option>");
	    		$('#pickAnotherCentre').modal('show');
	    	}
	    }  
	});
}

function jsGetAge(strBirthday){ 
	var returnAge;
	var strBirthdayArr=strBirthday.split("-");
	var birthYear = strBirthdayArr[2];
	var birthMonth = strBirthdayArr[1];
	var birthDay = strBirthdayArr[0];
	
	d = new Date();
	var nowYear = d.getFullYear();
	var nowMonth = d.getMonth() + 1;
	var nowDay = d.getDate();
	
	if(nowYear == birthYear){
		returnAge = 0;
	}
	else{
		var ageDiff = nowYear - birthYear ; 
		if(ageDiff > 0){
			if(nowMonth == birthMonth){
				var dayDiff = nowDay - birthDay;
				if(dayDiff < 0)
				{returnAge = ageDiff - 1;}
				else
				{returnAge = ageDiff ;}
			}else{
				var monthDiff = nowMonth - birthMonth;
				if(monthDiff < 0)
				{returnAge = ageDiff - 1;}
				else
				{returnAge = ageDiff ;}
			}
		}
		else{returnAge = -1;
		}
	}
	return returnAge;
}

//
function textToNumber(numbertxt){
	var num = 0;
	switch(numbertxt){
		case 'zero':
			num = 0;
			break;
		case 'two':
			num = 2;
			break;
		case 'three':
			num = 3;
			break;
		case 'four':
			num = 4;
			break;
	}
	return num;
}

function fmoney(s) {
   s = parseFloat((s + "").replace(/[^\d\.-]/g, "")).toFixed(0) + "";   
   var l = s.split(".")[0].split("").reverse(),   
   t = "";   
   for(i = 0; i < l.length; i ++ ) {   
      t += l[i] + ((i + 1) % 3 == 0 && (i + 1) != l.length ? "," : "");   
   }   
   return t.split("").reverse().join("");   
}

// set input field to readonly or not
// params: element id (str), isReadonly (boolean)
function setInputReadonly(elementId, isReadonly) {
	var elem = $('#' + elementId);
	if(isReadonly) {
		elem.attr('readonly', 'readonly');
		elem.addClass('readonly-field');
	} else {
		elem.removeAttr('readonly', 'readonly');
		elem.removeClass('readonly-field');
	}
	
	if(elem.val() != '' && elem.val() != null) {
		elem.parent('.so-mdl-textfield').addClass('is-not-active');
	} else {
		elem.siblings('label').addClass('readonly-field-label');
	}
}

// set select field to readonly or not
// params: element id (str), isReadonly (boolean)
function setSelectReadonly(elementId, isReadonly) {
	var elem = $('#' + elementId);
	if(isReadonly) {
		elem.attr('disabled', 'disabled');
		elem.addClass('readonly-field');
	} else {
		elem.removeAttr('disabled', 'disabled');
		elem.removeClass('readonly-field');
	}
	
	if(elem.val() != '' && elem.val() != null) {
		elem.parent('.selectDiv').addClass('is-not-active');
	}
}