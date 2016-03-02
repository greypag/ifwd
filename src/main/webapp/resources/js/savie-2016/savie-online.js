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
	$('input[type="text"]').keyup(function() {
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
	$('.amount-slider').slider();
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

//Applicant Info form validation
function soFormValidation() {
  $('#soInsuredInfoForm').bootstrapValidator({
	 excluded: [':disabled', ':hidden', ':not(:visible)'],
	 fields: {
		"firstName": {
		   container: '#firstNameErMsg',
		   validators: {
			  notEmpty: {
				 message: "Please enter your given name."
			  },
			  stringLength: {
				 max: 25,
				 message: "Given Name must be no more than 25 characters."
			  },
			  regexp: {
				 regexp: /^[a-zA-Z\s]*$/,
				 message: "Please enter your given name in english."
			  }
		   }
		},
		"lastName": {
		   container: '#lastNameErMsg',
		   validators: {
			  notEmpty: {
				 message: "Please enter your last name."
			  },
			  stringLength: {
				 max: 25,
				 message: "Last Name must be no more than 25 characters."
			  },
			  regexp: {
				 regexp: /^[a-zA-Z\s]*$/,
				 message: "Please enter your last name in english."
			  }
		   }
		},
		"chineseName": {
		   container: '#chineseNameErMsg',
		   validators: {
			  stringLength: {
				 max: 6,
				 message: "Chinese Name must be no more than 6 characters."
			  },
			  regexp: {
					regexp: /^[\s\u4e00-\u9eff]*$/,
					message: "Please enter a valid chinese name."
			  },
			  callback: {
				  callback: function (value, validator) {
					  return true;		                	  
				  }
			  }
		   }
		},
		"so-calendar-dob": {
		   container: '#so-calendar-dob-msg',
		   validators: {
			  notEmpty: {
				 message: "Please select your date of birth."
			  }
		   }
		},
		"gender": {
		   container: '#genderErMsg',
		   validators: {
			  notEmpty: {
				 message: "Please select your gender."
			  }
		   }
		},
		"hkId": {
		   container: '#hkidErMsg',
		   trigger: 'blur',
		   validators: {
			  notEmpty: {
				 message: "Please enter your HKID no."
			  },
			  callback: {
				 /* message: "Your HKID no. is invalid.",
				 callback: function(value, validator) {
					//return isValidHKID(value);
				 } */
				 callback: function(value, validator) {
					if(!isValidHKID(value)) {
						return {
							valid: false,
							message: "Your HKID no. is invalid.",
						}
					}
					return true;
				  }
			  }
		   }
		},
		"maritalStatus": {
		   container: '#maritalStatErMsg',
		   validators: {
			  notEmpty: {
				 message: "Please select your marital status."
			  }
		   }
		},
		"placeOfBirth": {
		   container: '#placeOfBirthErMsg',
		   validators: {
			  notEmpty: {
				 message: "Please select your place of birth."
			  }
		   }
		},
		"nationality": {
		   container: '#nationalityErMsg',
		   validators: {
			  notEmpty: {
				 message: "Please select your nationality."
			  }
		   }
		},
		"residentialNo": {
		   container: '#resTelNoErMsg',
		   validators: {
			  stringLength: {
				  min: 8,
				  max: 8,
				  message: "Please enter an 8-digit Tel No."
			   },
			   regexp: {
				  regexp: /^1[0-9]{10}$|^[235689][0-9]{7}$/,
				  message: "Your residential phone no. is invalid."
			   }
		   }
		},
		"mobileNo": {
		   container: '#mobileNoErMsg',
		   validators: {
			  notEmpty: {
				 message: "Please enter your mobile no."
			  },
			  stringLength: {
				  min: 8,
				  max: 8,
				  message: "Please enter an 8-digit Mobile No."
			   },
			   regexp: {
				  regexp: /^1[0-9]{10}$|^[5689][0-9]{7}$/,
				  message: "Your mobile no. is invalid."
			   }
		   }
		},
		"emailAddress": {
		   container: '#emailErMsg',
		   validators: {
			  notEmpty: {
				 message: "Please enter your email address."
			  },
			  regexp: {
				 regexp: /^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/,
				 message: "Your email address is invalid."
			  }
		   }
		},
		"permanentAddress1": {
			container: '#permanentAddErMsg',
			validators: {
				notEmpty: {
				  message: "Please enter your address."
				},
				regexp: {
				  regexp: /^[a-zA-Z0-9\s,-\/]*$/,
				  message: "Please enter a valid address."
				}
			}
		 },
		 "permanentDistrict": {
		   container: '#permanentDistrictErMsg',
		   validators: {
			  notEmpty: {
				 message: "Please select a district."
			  }
		   }
		},
		 "residentialAddress1": {
			container: '#residentialAddErMsg',
			validators: {
				notEmpty: {
				  message: "Please enter your address."
				},
				regexp: {
				  regexp: /^[a-zA-Z0-9\s,-\/]*$/,
				  message: "Please enter a valid address."
				}
			}
		 },
		 "residentialDistrict": {
		   container: '#residentialDistrictErMsg',
		   validators: {
			  notEmpty: {
				 message: "Please select a district."
			  }
		   }
		},
		 "correspondenceAddress1": {
			container: '#correspondenceAddErMsg',
			validators: {
				notEmpty: {
				  message: "Please enter your address."
				},
				regexp: {
				  regexp: /^[a-zA-Z0-9\s,-\/]*$/,
				  message: "Please enter a valid address."
				}
			}
		 },
		 "correspondenceDistrict": {
		   container: '#correspondenceDistrictErMsg',
		   validators: {
			  notEmpty: {
				 message: "Please select a district."
			  }
		   }
		}
	}
  }).on('success.form.bv', function(e) {
	 e.preventDefault();
  }).on('error.form.bv', function(e) {
  });
}

// Beneficiary Form validation
function soFirstBFormValidation() {
	var counter = 0;
	$('#beneficiary-info-form\\[0\\]').bootstrapValidator({
		fields: {
			'beneficiaryFirstName[0]':{
				container: '#beneficiaryFirstErMsg\\[0\\]',
				validators: {
					notEmpty: {
						message: "Please enter beneficiary's first name."
                    },
					stringLength: {
                        max: 25,
                        message: "First Name must be no more than 25 characters."
                    },
					regexp: {
						regexp: /^[a-zA-Z\s]+$/ ,
						message: "Please enter beneficiary's first name in English."
					}
				}
			},
			'beneficiaryLastName[0]':{
				container: '#beneficiaryLastErMsg\\[0\\]',
				validators: {
					notEmpty: {
						message: "Please enter beneficiary's last name."
                    },
					stringLength: {
                        max: 25,
                        message: "Last Name must be no more than 25 characters."
                    },
					regexp: {
						regexp: /^[a-zA-Z\s]+$/ ,
						message: "Please enter beneficiary's last name in English."
					}
				}
			},
			'beneficiaryChineseName[0]':{
				container: '#beneficiaryChineseNameErMsg\\[0\\]',
				validators: {
					stringLength: {
                        min: 1,
                        max: 6,
                        message: "Chinese Name must be no more than 6 characters."
                    },
					regexp: {
						regexp: /^[\s\u4e00-\u9eff]*$/,
						message: "Please enter a valid Chinese name."
					},
					trigger: 'change keyup'
				}
			},
			'beneficiaryHkidPassport[0]':{
				container: '#beneficiaryHkidPassportErMsg\\[0\\]',
				validators: {
					notEmpty: {
						message: "Please select HKID or Passport no."
                    }
				}
			},
			'beneficiaryPassport[0]':{
				container: '#beneficiaryHkidPassErMsg\\[0\\]',
				validators: {
					stringLength: {
                        min: 5,
                        max: 15,
                        message: "Passport no. must be no more than 15 characters."
                    },
					notEmpty: {
						message: "Please enter beneficiary's Passport no."
	               },
	               regexp: {
	                  regexp: /^[a-zA-Z0-9\-]*$/,
	                  message: "Beneficiary's Passport no. is invalid."
	               }
				}
			},
			'beneficiaryHkid[0]':{
				container: '#beneficiaryHkidPassErMsg\\[0\\]',
				validators: {
					notEmpty: {
						message: "Please enter beneficiary's HKID no."
					},
					callback: {
	                  callback: function(value, validator) {
						if(!isValidHKID(value)) {
							return {
								valid: false,
								message: "Beneficiary's HKID cannot be the same as applicant's HKID.",
							}
						}
						return true;
	                  }
	                }
				}
			},
			"beneficiaryGender[0]": {
			   container: '#beneficiaryGenderErMsg\\[0\\]',
			   validators: {
				  notEmpty: {
					 message: "Please select your gender."
				  }
			   }
			},
			'beneficiaryRelationship[0]':{
				container: '#beneficiaryRelationErMsg\\[0\\]',
				validators: {
					notEmpty: {
						message: "Please select beneficiary's relationship with you."
					}
				}
			},
			'beneficiaryEntitlement[0]':{
				container: '#beneficiaryEntitlementErMsg\\[0\\]',
				validators: {
					integer:{
	                	message: "Please enter Beneficiary's entitlement."
	                },
	                between:{
	                	min: 0,
	                	max: 100,
                        message: "Beneficiary's entitlement must be between 1 and 100."
                    },
					callback: {
						message: "The sum of entitlements must be 100%.",
						callback: function (value, validator, $field) {
							if(value==''){
                        		// display the range error message if it is empty
                        		$('#beneficiary-info-form\\[0\\]').data('bootstrapValidator').updateStatus('beneficiaryEntitlement[0]', 'INVALID', 'between');
                        		return true;
                        	} else {
                        		if (totalBeneficiaryEntitlement() == "Exceed"){
	                          		return false;
	                        	} else {
	                           		return true;
	                        	}
                        	}
						}
					}
				}
			}
		}
	}).on('success.form.bv', function(e) {
		e.preventDefault();
	}).on('error.form.bv', function(e) {
	});
	
	$( "#beneficiaryEntitlement\\[0\\]" ).on('change', function() {
		if(totalBeneficiaryEntitlement()!="Exceed") {
			if( !($('#beneficiaryEntitlement\\[1\\]').hasClass('hidden')) ) {
			 $('#beneficiary-info-form\\[1\\]').data('bootstrapValidator').updateStatus('beneficiaryEntitlement[1]', 'VALID');
			}
			if( !($('#beneficiaryEntitlement\\[2\\]').hasClass('hidden')) ) {
				$('#beneficiary-info-form\\[2\\]').data('bootstrapValidator').updateStatus('beneficiaryEntitlement[2]', 'VALID');
			}
		} else {
			if( !($('#beneficiaryEntitlement\\[1\\]').hasClass('hidden')) ) {
			$('#beneficiary-info-form\\[1\\]').data('bootstrapValidator').updateStatus('beneficiaryEntitlement[1]', 'INVALID','callback');
			}
			if( !($('#beneficiaryEntitlement\\[2\\]').hasClass('hidden')) ) {
				$('#beneficiary-info-form\\[2\\]').data('bootstrapValidator').updateStatus('beneficiaryEntitlement[2]', 'INVALID','callback');
			}
		}
	});
	
	//Beneficiary Info Form [1]
	$(document).on('click','#add-beneficiary-btn-1',function() {
	 $('#beneficiary-info-form\\[1\\]').bootstrapValidator({
		 fields: {
			'beneficiaryFirstName[1]':{
			    container: '#beneficiaryFirstErMsg\\[1\\]',
			    validators: {
					notEmpty: {
					  message: "Please enter beneficiary's first name."
					},
					stringLength: {
						max: 25,
						message: "First Name must be no more than 25 characters."
					},
					regexp: {
						regexp: /^[a-zA-Z\s]+$/ ,
						message: "Please enter beneficiary's first name in English."
					}
				}
			},
			'beneficiaryLastName[1]':{
				container: '#beneficiaryLastErMsg\\[1\\]',
				validators: {
					notEmpty: {
						message: "Please enter beneficiary's last name."
					},
					stringLength: {
						max: 25,
						message: "Last Name must be no more than 25 characters."
					},
					regexp: {
						regexp: /^[a-zA-Z\s]+$/ ,
						message: "Please enter beneficiary's last name in English."
					}
				}
			},
			'beneficiaryChineseName[1]':{
			   container: '#beneficiaryChineseNameErMsg\\[1\\]',
			   validators: {
					stringLength: {
						min: 1,
						max: 6,
						message: "Chinese Name must be no more than 6 characters."
					},
					regexp: {
						regexp: /^[\s\u4e00-\u9eff]*$/,
						message: "Please enter a valid Chinese name."
					},
					callback: {
						callback: function (value, validator) {
							return true;		                	  
						}
					}
				}
			},
			'beneficiaryHkidPassport[1]':{
				container: '#beneficiaryHkidPassportErMsg\\[1\\]',
				validators: {
					notEmpty: {
						message: "Please select HKID or Passport no."
                    }
				}
			},
			'beneficiaryPassport[1]':{
				container: '#beneficiaryHkidPassErMsg\\[1\\]',
				validators: {
					stringLength: {
                        min: 5,
                        max: 15,
                        message: "Passport no. must be no more than 15 characters."
                    },
					notEmpty: {
						message: "Please enter beneficiary's Passport no."
	               },
	               regexp: {
	                  regexp: /^[a-zA-Z0-9\-]*$/,
	                  message: "Beneficiary's Passport no. is invalid."
	               }
				}
			},
			'beneficiaryHkid[1]':{
				container: '#beneficiaryHkidPassErMsg\\[1\\]',
				validators: {
					notEmpty: {
						message: "Please enter beneficiary's HKID no."
					},
					callback: {
	                  callback: function(value, validator) {
						if(!isValidHKID(value)) {
							return {
								valid: false,
								message: "Beneficiary's HKID cannot be the same as applicant's HKID.",
							}
						}
						return true;
	                  }
	                }
				}
			},
			"beneficiaryGender[1]": {
			   container: '#beneficiaryGenderErMsg\\[1\\]',
			   validators: {
				  notEmpty: {
					 message: "Please select your gender."
				  }
			   }
			},
			'beneficiaryRelationship[1]':{
			   container: '#beneficiaryRelationErMsg\\[1\\]',
				validators: {
					notEmpty: {
						message: "Please select beneficiary's relationship with you."
					}
				}
			},
			'beneficiaryEntitlement[1]':{
			   container: '#beneficiaryEntitlementErMsg\\[1\\]',
			   validators: {
					integer:{
						message: "Please enter Beneficiary's entitlement."
					},
					between:{
						min: 0,
						max: 100,
						message: "Beneficiary's entitlement must be between 1 and 100."
					},
					callback: {
						message: "The sum of entitlements must be 100%.",
						callback: function (value, validator, $field) {
							if(value=='') {
								// display the range error message if it is empty
								$('#beneficiary-info-form\\[1\\]').data('bootstrapValidator').updateStatus('beneficiaryEntitlement[1]', 'INVALID', 'between');
								return true;
							} else {
								if (totalBeneficiaryEntitlement() == "Exceed") {
									return false;
								} else {
									return true;
								}
							}
						}
					}
				}
			}
		}
	}).on('success.form.bv', function(e) {
		e.preventDefault();
	}).on('error.form.bv', function(e) {
	});
	 
	$( "#beneficiaryEntitlement\\[1\\]" ).on('change', function() {
		if(totalBeneficiaryEntitlement()!="Exceed") {
			$('#beneficiary-info-form\\[0\\]').data('bootstrapValidator').updateStatus('beneficiaryEntitlement[0]', 'VALID', 'callback');
			 
			if( !($('#beneficiaryEntitlement\\[2\\]').hasClass('hidden')) ) {
				$('#beneficiary-info-form\\[2\\]').data('bootstrapValidator').updateStatus('beneficiaryEntitlement[2]', 'VALID', 'callback');
			}
		} else {
			$('#beneficiary-info-form\\[0\\]').data('bootstrapValidator').updateStatus('beneficiaryEntitlement[0]', 'INVALID','callback');
			
			if( !($('#beneficiaryEntitlement\\[2\\]').hasClass('hidden')) ) {
				$('#beneficiary-info-form\\[2\\]').data('bootstrapValidator').updateStatus('beneficiaryEntitlement[2]', 'INVALID','callback');
			}
		}
	});
	});

	//Beneficiary Info Form [2]
	$(document).on('click','#add-beneficiary-btn-2',function(){
		$('#beneficiary-info-form\\[2\\]').bootstrapValidator({
			fields: {
				'beneficiaryFirstName[2]':{
					container: '#beneficiaryFirstErMsg\\[2\\]',
					validators: {
					notEmpty: {
						message: "Please enter beneficiary's first name."
					},
					stringLength: {
						max: 25,
						message: "First Name must be no more than 25 characters."
					},
				  regexp: {
						 regexp: /^[a-zA-Z\s]+$/ ,
						 message: "Please enter beneficiary's first name in English."
					},
				}
				},
				'beneficiaryLastName[2]':{
					container: '#beneficiaryLastErMsg\\[2\\]',
					validators: {
					  notEmpty: {
						 message: "Please enter beneficiary's last name."
						   },
					  stringLength: {
							   min: 1,
							   max: 25,
							   message: "Last Name must be no more than 25 characters."
						   },
					  regexp: {
						 regexp: /^[a-zA-Z\s]+$/ ,
						 message: "Please enter beneficiary's last name in English."
					  }
					}
				},
				'beneficiaryChineseName[2]':{
					container: '#beneficiaryChineseNameErMsg\\[2\\]',
					validators: {
					  stringLength: {
						   min: 1,
						   max: 6,
						   message: "Chinese Name must be no more than 6 characters."
						   },
					  regexp: {
						 regexp: /^[\s\u4e00-\u9eff]*$/,
						 message: "Beneficiary's Chinese name is invalid."
					  },
					  callback: {
						callback: function (value, validator) {
							return true;		                	  
						}
					  }
					}
				},
				'beneficiaryHkidPassport[2]':{
					container: '#beneficiaryHkidPassportErMsg\\[2\\]',
					validators: {
						notEmpty: {
							message: "Please select HKID or Passport no."
						}
					}
				},
				'beneficiaryPassport[2]':{
					container: '#beneficiaryHkidPassErMsg\\[2\\]',
					validators: {
						stringLength: {
							min: 5,
							max: 15,
							message: "Passport no. must be no more than 15 characters."
						},
						notEmpty: {
							message: "Please enter beneficiary's Passport no."
					   },
					   regexp: {
						  regexp: /^[a-zA-Z0-9\-]*$/,
						  message: "Beneficiary's Passport no. is invalid."
					   }
					}
				},
				'beneficiaryHkid[2]':{
				container: '#beneficiaryHkidPassErMsg\\[2\\]',
				validators: {
					notEmpty: {
						message: "Please enter beneficiary's HKID no."
					},
					callback: {
	                  callback: function(value, validator) {
						if(!isValidHKID(value)) {
							return {
								valid: false,
								message: "Beneficiary's HKID cannot be the same as applicant's HKID.",
							}
						}
						return true;
	                  }
	                }
				}
			},
				"beneficiaryGender[2]": {
				   container: '#beneficiaryGenderErMsg\\[2\\]',
				   validators: {
					  notEmpty: {
						 message: "Please select your gender."
					  }
				   }
				},
				'beneficiaryRelationship[2]':{
					container: '#beneficiaryRelationErMsg\\[2\\]',
					validators: {
						notEmpty: {
							message: "Please select beneficiary's relationship with you."
						}
					}
				},
				'beneficiaryEntitlement[2]':{
					container: '#beneficiaryEntitlementErMsg\\[2\\]',
					validators: {
						integer:{
							message: "Please enter Beneficiary's entitlement."
						},
						between:{
							min: 0,
							max: 100,
							message: "Beneficiary's entitlement must be between 1 and 100."
						},
						callback: {
							message: "The sum of entitlements must be 100%.",
							callback: function (value, validator, $field) {
								if(value=='') {
									// display the range error message if it is empty
									$('#beneficiary-info-form\\[2\\]').data('bootstrapValidator').updateStatus('beneficiaryEntitlement[2]', 'INVALID', 'between');
									return true;
								} else {
									if (totalBeneficiaryEntitlement() == "Exceed") {
										return false;
									} else {
										return true;
									}
								}
							}
						}
					}
				}
			}
		}).on('success.form.bv', function(e) {
			e.preventDefault();
		}).on('error.form.bv', function(e) {
		});
		 
		$( "#beneficiaryEntitlement\\[2\\]" ).on('change', function() {
			if(totalBeneficiaryEntitlement()!="Exceed") {
				 $('#beneficiary-info-form\\[0\\]').data('bootstrapValidator').updateStatus('beneficiaryEntitlement[0]', 'VALID', 'callback');
				 
				 if( !($('#beneficiaryEntitlement\\[1\\]').hasClass('hidden')) ) {
					 $('#beneficiary-info-form\\[1\\]').data('bootstrapValidator').updateStatus('beneficiaryEntitlement[1]', 'VALID', 'callback');
				 }
			} else {
				$('#beneficiary-info-form\\[0\\]').data('bootstrapValidator').updateStatus('beneficiaryEntitlement[0]', 'INVALID', 'callback');
				
				 if( !($('#beneficiaryEntitlement\\[1\\]').hasClass('hidden')) ) {
					 $('#beneficiary-info-form\\[1\\]').data('bootstrapValidator').updateStatus('beneficiaryEntitlement[1]', 'INVALID', 'callback');
				 }
			}
		});
	});
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
	$.ajax({
		type : "POST",
		async: true,
		url : context + "/ajax/savings-insurance/getSavieOnlinePlandetails",
		data: {insuredAmount : $("#R").val(), paymentType : $("#type-of-payment").val(), dob : $("#plan-dob-datepicker").val(), promoCode : "" },
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
				
				for(var i = 0; i < $total_years; i++) {
					if (json.salesIllustration.yearPlans[i].year <= 100) { // do not include year 100 data from their response
						for(var j = 0; j < 4; j++){
							if((json.salesIllustration.yearPlans[i].plans[j].rate == "zero") && (json.salesIllustration.yearPlans[i].year == 3)){
									 guaranteed3Years = json.salesIllustration.yearPlans[i].plans[j].accountBalance;
							}
							//rate 0
							if(json.salesIllustration.yearPlans[i].plans[j].rate == "zero"){
								if (i == 0) {
									$('#premium-change-0-0').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].totalPremium));
									$('#account-value-change-0-0').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].accountBalance));
									$('#surrender-change-0-0').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit));
									$('#death-change-0-0').html('<span data-toggle="tooltip" data-html="true" data-placement="right" title="" class=" default-pointer" data-original-title="Death Benefit (HK$) / Accidental Death Benefit (HK$)">'
											+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedDeathBenefit)
											+ ' / '
											+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit)
											+ '</span>');
								}
								if (i == 4) {
									$('#premium-change-0-1').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].totalPremium));
									$('#account-value-change-0-1').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].accountBalance));
									$('#surrender-change-0-1').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit));
									$('#death-change-0-1').html('<span data-toggle="tooltip" data-html="true" data-placement="right" title="" class=" default-pointer" data-original-title="Death Benefit (HK$) / Accidental Death Benefit (HK$)">'
											+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedDeathBenefit)
											+ ' / '
											+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit)
											+ '</span>');
								}
								if (i == 9) {
									$('#premium-change-0-2').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].totalPremium));
									$('#account-value-change-0-2').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].accountBalance));
									$('#surrender-change-0-2').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit));
									$('#death-change-0-2').html('<span data-toggle="tooltip" data-html="true" data-placement="right" title="" class=" default-pointer" data-original-title="Death Benefit (HK$) / Accidental Death Benefit (HK$)">'
											+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedDeathBenefit)
											+ ' / '
											+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit)
											+ '</span>');
								}
								if (i == 19) {
									$('#premium-change-0-3').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].totalPremium));
									$('#account-value-change-0-3').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].accountBalance));
									$('#surrender-change-0-3').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit));
									$('#death-change-0-3').html('<span data-toggle="tooltip" data-html="true" data-placement="right" title="" class=" default-pointer" data-original-title="Death Benefit (HK$) / Accidental Death Benefit (HK$)">'
											+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedDeathBenefit)
											+ ' / '
											+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit)
											+ '</span>');
								}
								if (i == 54) {
									$('#premium-change-0-4').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].totalPremium));
									$('#account-value-change-0-4').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].accountBalance));
									$('#surrender-change-0-4').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit));
									$('#death-change-0-4').html('<span data-toggle="tooltip" data-html="true" data-placement="right" title="" class=" default-pointer" data-original-title="Death Benefit (HK$) / Accidental Death Benefit (HK$)">'
											+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedDeathBenefit)
											+ ' / '
											+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit)
											+ '</span>');
								}
								if (i == 59) {
									$('#premium-change-0-5').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].totalPremium));
									$('#account-value-change-0-5').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].accountBalance));
									$('#surrender-change-0-5').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit));
									$('#death-change-0-5').html('<span data-toggle="tooltip" data-html="true" data-placement="right" title="" class=" default-pointer" data-original-title="Death Benefit (HK$) / Accidental Death Benefit (HK$)">'
											+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedDeathBenefit)
											+ ' / '
											+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit)
											+ '</span>');
								}
								if(json.salesIllustration.yearPlans[i].year == 100) {
									$('#premium-change-0-6').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].totalPremium));
									$('#account-value-change-0-6').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].accountBalance));
									$('#surrender-change-0-6').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit));
									$('#death-change-0-6').html('<span data-toggle="tooltip" data-html="true" data-placement="right" title="" class=" default-pointer" data-original-title="Death Benefit (HK$) / Accidental Death Benefit (HK$)">'
											+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedDeathBenefit)
											+ ' / '
											+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit)
											+ '</span>');
								}
							}
							//rate 2
							if(json.salesIllustration.yearPlans[i].plans[j].rate == "two"){
								if (i == 0) {
									$('#premium-change-2-0').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].totalPremium));
									$('#account-value-change-2-0').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].accountBalance));
									$('#surrender-change-2-0').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit));
									$('#death-change-2-0').html('<span data-toggle="tooltip" data-html="true" data-placement="right" title="" class=" default-pointer" data-original-title="Death Benefit (HK$) / Accidental Death Benefit (HK$)">'
											+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedDeathBenefit)
											+ ' / '
											+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit)
											+ '</span>');
								}
								if (i == 4) {
									$('#premium-change-2-1').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].totalPremium));
									$('#account-value-change-2-1').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].accountBalance));
									$('#surrender-change-2-1').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit));
									$('#death-change-2-1').html('<span data-toggle="tooltip" data-html="true" data-placement="right" title="" class=" default-pointer" data-original-title="Death Benefit (HK$) / Accidental Death Benefit (HK$)">'
											+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedDeathBenefit)
											+ ' / '
											+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit)
											+ '</span>');
								}
								if (i == 9) {
									$('#premium-change-2-2').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].totalPremium));
									$('#account-value-change-2-2').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].accountBalance));
									$('#surrender-change-2-2').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit));
									$('#death-change-2-2').html('<span data-toggle="tooltip" data-html="true" data-placement="right" title="" class=" default-pointer" data-original-title="Death Benefit (HK$) / Accidental Death Benefit (HK$)">'
											+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedDeathBenefit)
											+ ' / '
											+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit)
											+ '</span>');
								}
								if (i == 19) {
									$('#premium-change-2-3').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].totalPremium));
									$('#account-value-change-2-3').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].accountBalance));
									$('#surrender-change-2-3').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit));
									$('#death-change-2-3').html('<span data-toggle="tooltip" data-html="true" data-placement="right" title="" class=" default-pointer" data-original-title="Death Benefit (HK$) / Accidental Death Benefit (HK$)">'
											+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedDeathBenefit)
											+ ' / '
											+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit)
											+ '</span>');
								}
								if (i == 54) {
									$('#premium-change-2-4').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].totalPremium));
									$('#account-value-change-2-4').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].accountBalance));
									$('#surrender-change-2-4').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit));
									$('#death-change-2-4').html('<span data-toggle="tooltip" data-html="true" data-placement="right" title="" class=" default-pointer" data-original-title="Death Benefit (HK$) / Accidental Death Benefit (HK$)">'
											+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedDeathBenefit)
											+ ' / '
											+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit)
											+ '</span>');
								}
								if (i == 59) {
									$('#premium-change-2-5').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].totalPremium));
									$('#account-value-change-2-5').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].accountBalance));
									$('#surrender-change-2-5').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit));
									$('#death-change-2-5').html('<span data-toggle="tooltip" data-html="true" data-placement="right" title="" class=" default-pointer" data-original-title="Death Benefit (HK$) / Accidental Death Benefit (HK$)">'
											+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedDeathBenefit)
											+ ' / '
											+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit)
											+ '</span>');
								}
								if(json.salesIllustration.yearPlans[i].year == 100){
									$('#premium-change-2-6').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].totalPremium));
									$('#account-value-change-2-6').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].accountBalance));
									$('#surrender-change-2-6').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit));
									$('#death-change-2-6').html('<span data-toggle="tooltip" data-html="true" data-placement="right" title="" class=" default-pointer" data-original-title="Death Benefit (HK$) / Accidental Death Benefit (HK$)">'
											+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedDeathBenefit)
											+ ' / '
											+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit)
											+ '</span>');
								}
							}
							//rate 3
							if(json.salesIllustration.yearPlans[i].plans[j].rate == "three"){
								if (i == 0) {
									$('#premium-change-3-0').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].totalPremium));
									$('#account-value-change-3-0').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].accountBalance));
									$('#surrender-change-3-0').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit));
									$('#death-change-3-0').html('<span data-toggle="tooltip" data-html="true" data-placement="right" title="" class=" default-pointer" data-original-title="Death Benefit (HK$) / Accidental Death Benefit (HK$)">'
											+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedDeathBenefit)
											+ ' / '
											+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit)
											+ '</span>');
								}
								if (i == 4) {
									$('#premium-change-3-1').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].totalPremium));
									$('#account-value-change-3-1').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].accountBalance));
									$('#surrender-change-3-1').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit));
									$('#death-change-3-1').html('<span data-toggle="tooltip" data-html="true" data-placement="right" title="" class=" default-pointer" data-original-title="Death Benefit (HK$) / Accidental Death Benefit (HK$)">'
											+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedDeathBenefit)
											+ ' / '
											+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit)
											+ '</span>');
								}
								if (i == 9) {
									$('#premium-change-3-2').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].totalPremium));
									$('#account-value-change-3-2').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].accountBalance));
									$('#surrender-change-3-2').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit));
									$('#death-change-3-2').html('<span data-toggle="tooltip" data-html="true" data-placement="right" title="" class=" default-pointer" data-original-title="Death Benefit (HK$) / Accidental Death Benefit (HK$)">'
											+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedDeathBenefit)
											+ ' / '
											+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit)
											+ '</span>');
								}
								if (i == 19) {
									$('#premium-change-3-3').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].totalPremium));
									$('#account-value-change-3-3').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].accountBalance));
									$('#surrender-change-3-3').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit));
									$('#death-change-3-3').html('<span data-toggle="tooltip" data-html="true" data-placement="right" title="" class=" default-pointer" data-original-title="Death Benefit (HK$) / Accidental Death Benefit (HK$)">'
											+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedDeathBenefit)
											+ ' / '
											+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit)
											+ '</span>');
								}
								if (i == 54) {
									$('#premium-change-3-4').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].totalPremium));
									$('#account-value-change-3-4').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].accountBalance));
									$('#surrender-change-3-4').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit));
									$('#death-change-3-4').html('<span data-toggle="tooltip" data-html="true" data-placement="right" title="" class=" default-pointer" data-original-title="Death Benefit (HK$) / Accidental Death Benefit (HK$)">'
											+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedDeathBenefit)
											+ ' / '
											+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit)
											+ '</span>');
								}
								if (i == 59) {
									$('#premium-change-3-5').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].totalPremium));
									$('#account-value-change-3-5').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].accountBalance));
									$('#surrender-change-3-5').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit));
									$('#death-change-3-5').html('<span data-toggle="tooltip" data-html="true" data-placement="right" title="" class=" default-pointer" data-original-title="Death Benefit (HK$) / Accidental Death Benefit (HK$)">'
											+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedDeathBenefit)
											+ ' / '
											+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit)
											+ '</span>');
								}
								if(json.salesIllustration.yearPlans[i].year == 100){
									$('#premium-change-3-6').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].totalPremium));
									$('#account-value-change-3-6').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].accountBalance));
									$('#surrender-change-3-6').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit));
									$('#death-change-3-6').html('<span data-toggle="tooltip" data-html="true" data-placement="right" title="" class=" default-pointer" data-original-title="Death Benefit (HK$) / Accidental Death Benefit (HK$)">'
											+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedDeathBenefit)
											+ ' / '
											+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit)
											+ '</span>');
								}
							}
							//rate 4
							if(json.salesIllustration.yearPlans[i].plans[j].rate == "four"){
								if (i == 0) {
									$('#premium-change-4-0').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].totalPremium));
									$('#account-value-change-4-0').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].accountBalance));
									$('#surrender-change-4-0').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit));
									$('#death-change-4-0').html('<span data-toggle="tooltip" data-html="true" data-placement="right" title="" class=" default-pointer" data-original-title="Death Benefit (HK$) / Accidental Death Benefit (HK$)">'
											+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedDeathBenefit)
											+ ' / '
											+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit)
											+ '</span>');
								}
								if (i == 4) {
									$('#premium-change-4-1').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].totalPremium));
									$('#account-value-change-4-1').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].accountBalance));
									$('#surrender-change-4-1').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit));
									$('#death-change-4-1').html('<span data-toggle="tooltip" data-html="true" data-placement="right" title="" class=" default-pointer" data-original-title="Death Benefit (HK$) / Accidental Death Benefit (HK$)">'
											+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedDeathBenefit)
											+ ' / '
											+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit)
											+ '</span>');
								}
								if (i == 9) {
									$('#premium-change-4-2').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].totalPremium));
									$('#account-value-change-4-2').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].accountBalance));
									$('#surrender-change-4-2').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit));
									$('#death-change-4-2').html('<span data-toggle="tooltip" data-html="true" data-placement="right" title="" class=" default-pointer" data-original-title="Death Benefit (HK$) / Accidental Death Benefit (HK$)">'
											+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedDeathBenefit)
											+ ' / '
											+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit)
											+ '</span>');
								}
								if (i == 19) {
									$('#premium-change-4-3').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].totalPremium));
									$('#account-value-change-4-3').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].accountBalance));
									$('#surrender-change-4-3').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit));
									$('#death-change-4-3').html('<span data-toggle="tooltip" data-html="true" data-placement="right" title="" class=" default-pointer" data-original-title="Death Benefit (HK$) / Accidental Death Benefit (HK$)">'
											+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedDeathBenefit)
											+ ' / '
											+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit)
											+ '</span>');
								}
								if (i == 54) {
									$('#premium-change-4-4').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].totalPremium));
									$('#account-value-change-4-4').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].accountBalance));
									$('#surrender-change-4-4').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit));
									$('#death-change-4-4').html('<span data-toggle="tooltip" data-html="true" data-placement="right" title="" class=" default-pointer" data-original-title="Death Benefit (HK$) / Accidental Death Benefit (HK$)">'
											+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedDeathBenefit)
											+ ' / '
											+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit)
											+ '</span>');
								}
								if (i == 59) {
									$('#premium-change-4-5').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].totalPremium));
									$('#account-value-change-4-5').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].accountBalance));
									$('#surrender-change-4-5').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit));
									$('#death-change-4-5').html('<span data-toggle="tooltip" data-html="true" data-placement="right" title="" class=" default-pointer" data-original-title="Death Benefit (HK$) / Accidental Death Benefit (HK$)">'
											+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedDeathBenefit)
											+ ' / '
											+ fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit)
											+ '</span>');
								}
								if(json.salesIllustration.yearPlans[i].year == 100){
									$('#premium-change-4-6').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].totalPremium));
									$('#account-value-change-4-6').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].accountBalance));
									$('#surrender-change-4-6').html(fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit));
									$('#death-change-4-6').html('<span data-toggle="tooltip" data-html="true" data-placement="right" title="" class=" default-pointer" data-original-title="Death Benefit (HK$) / Accidental Death Benefit (HK$)">'
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
									
									console.log('Credit Rate:'+textToNumber(json.salesIllustration.yearPlans[i].plans[j].rate));
									/*$('#credit-rate-'+rowCtr).html(fmoney(textToNumber(json.salesIllustration.yearPlans[i].plans[j].rate)));
									$('#premium-change-'+rowCtr).html(fmoney(json.salesIllustration.yearPlans[i].plans[j].totalPremium));
									$('#account-value-change-'+rowCtr).html(fmoney(json.salesIllustration.yearPlans[i].plans[j].accountBalance));
									$('#surrender-change-'+rowCtr).html(fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit));
									*/
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
			}
			$('#loadingDiv').toggle();
			$('body').removeClass('modal-open');
		}
    });
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