var language = "en";
var stickyHeight = 130;
var planDetailData = {};
var appInfoData = {};
var empEduInfoData = {};
var beneInfoData = {};
var underwritingSummData = {};

function isValidHKID(hkid){
	if(hkid!=''){
		var checkSumRegex = /(.{1})\s*$/;
		var checkSum = checkSumRegex.exec(hkid);
		
		console.log('CheckSum'+checkSum);
		
		var hkidCheckBit = hkid.replace(/^(.*).{1} /,'');
		var hkidCheckBitArr = hkidCheckBit.split("");
		
		var isValid='';
		var i , n , alphaEquivalentInt, hkidSum;
		for(i=hkidCheckBitArr.length,n=0 ;n>=hkidCheckBitArr.length,i>=2;i--,n++){
			
			console.log(hkidCheckBitArr[n]+":"+i);
			var sum;
			if (/[A-Z]/i.test(hkidCheckBitArr[n])) {
				alphaEquivalentInt = equivalentInteger(hkidCheckBitArr[n]);
				sum = alphaEquivalentInt*i;
				hkidSum = sum;
			}else{
				sum = hkidCheckBitArr[n]*i;
				hkidSum+=sum;
			}
			
		}
		
		console.log('Sum'+hkidSum);
		
		var hkidSumMod11 = 11- (hkidSum % 11);
		
		if(hkidSumMod11 == checkSum[1]){
			isValid= 'Valid';
			console.log('Valid');
		}else{
			isValid = 'Invalid';
			console.log('Invalid');
		}
	}
	else{
		//isValid = 'Invalid';
	}
	return isValid;
}
function equivalentInteger(hkidChar){
		var digit;
		switch(hkidChar){
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

// REDIRECT TO SPECIFIC SECTION
var _selectedSection = window.location.hash;
if (_selectedSection && (_selectedSection === '#application')) {
   $('#et-btn-before-start').removeClass('et-pad-bot-50');
   $('#et-about-yoursel-section').removeClass('hide-element');
   $('#et-btn-ay-self').removeClass('et-pad-bot-50');
   $('#et-plan-option-section').removeClass('hide-element');
   var $_appInfo = $('#et-application-first-section').removeClass('hide-element')
                     .css('margin-bottom', '190px');
   
   $('body, html').animate({
      scrollTop: ($_appInfo.offset().top - stickyHeight) + 'px'
   }, 500);
}
// END OF REDIRECT TO SPECIFIC SECTION


// Update date to 18 years before current date
var _date = new Date();
var _newdate = new Date(_date);
_newdate.setYear(_newdate.getYear() - 18);

var $planDate = $('#et-select-plan-date-input').datepicker({
   format: "dd-mm-yyyy",
   container: "#date",
   autoclose: true,
   startView: "decade"
}).datepicker('setDate', new Date(_newdate)).val('')
.on('changeDate', function(e) {
	$('#et-illu-dob').val($('#et-select-plan-date-input').val());
});

var $infoDOB = $('#sales-illu-dob').datepicker({
   format: "dd-mm-yyyy",
   autoclose: true,
   startView: 'decade'
}).on('changeDate', function(e) {
   var planDate = new Date($planDate.datepicker('getDate'));
   
   if ((planDate - e.date) !== 0) {
      $('#bdayModal').modal('show');
   }
});

// Override the default value color
$('select.gray-dropdown', '#et-application-info-section')
   .css('color', '#9ba5a7')
   .on('change', function(e) {
      var $self = $(this);
      
      $self.removeAttr('style');
   }); 
$('#et-select-plan-date-input')
   .css('color', '#9ba5a7')
   .on('change', function(e) {
      var $self = $(this);
      
      $self.removeAttr('style');
   }); 

// Active appropriate nav items
$(window).scroll(function(e) {
   var $self = $(this);
   var $stickyNav = $('.et-bind-btn-header');
   
   if ($self.scrollTop() > 2100) {
      // Update sticky menu navigator
      $stickyNav.removeClass('active')
                           .eq(1)
                           .addClass('active');
      $('#et-active-section-label').text($stickyNav.eq(1).text());
   } else {
      $stickyNav.removeClass('active')
                           .first()
                           .addClass('active');
      $('#et-active-section-label').text($stickyNav.first().text());
   }
});

$('#et-btn-change-date').on('click', function(e) {
   $('body, html').animate({
      scrollTop: ($('#et-about-yoursel-section').offset().top - stickyHeight) + 'px'
   }, 500);
});


//PLAN OPTION PROMO CODE HIDE TOGGLE
$(document).on('click', '#promocode-hide-switch', function(e) {
   if($("#promocode-hidden").hasClass('hidden-xs')) {
      $("#promocode-hidden").removeClass('hidden-xs hidden-sm');
      $(this).find('img').removeClass('reversed');
      $(this).removeClass('et-mbot-15');
   }
   else {
      $("#promocode-hidden").addClass('hidden-xs hidden-sm');
      $(this).find('img').addClass('reversed');
      $(this).addClass('et-mbot-15');
   }         
});

// Medical declaration collapse event
$('.et-collapse').on('show.bs.collapse', function(e) {
   var $target = $(e.currentTarget);
   var $prevTarget = $target.data('prev-target');
   
   if ($prevTarget) {
      $prevTarget = $('#' + $prevTarget);
      
      if ($prevTarget.attr('data-is-answered') !== 'true') {
         e.preventDefault();
      }
   } 
});

// Medical declaration button yes event
$(document).on('click', '.et-btn-medic-yes', function(e) {
   e.preventDefault();
   
   var $self = $(this);
   var $collapseSec = $self.closest('.et-collapse');
   var nextTarget = $self.data('next-target');
   
   $collapseSec.attr('data-is-answered', true);
   
   $self.addClass('btn-selected');
   
   $collapseSec.find('.et-btn-medic-no')
               .removeClass('btn-selected');
});

// Medical declaration button no event
$(document).on('click', '.et-btn-medic-no', function(e) {
   e.preventDefault();
   
   var $self = $(this);
   var $collapseSec = $self.closest('.et-collapse');
   var nextTarget = $self.data('next-target');
   
   $collapseSec.attr('data-is-answered', true);
   
   $self.addClass('btn-selected');
   
   $collapseSec.find('.et-btn-medic-yes')
               .removeClass('btn-selected');
   
   // Show the next button 
   // if all questions are answered with no
   if (isMedicAnsweredWithNo()) {
      $('#et-medical-dec-next').removeClass('hide-element');
   }
   
   // Expand next question
   if (nextTarget) {
      setTimeout(function() {
         $('a[href="#' + nextTarget + '"]').trigger('click');
      }, 50);
   }
});

// Login submit event
$('#et-login-form').on('submit', function(e) {
   e.preventDefault();
   
   // Modify the code here for 
   // the login implementation
   $('#loginModal').modal('hide');
   
   var $appInfo = $('#et-application-first-section');
   $appInfo.removeClass('hide-element')
            .css('margin-bottom', '190px');
   
   $('body, html').animate({
      scrollTop: ($appInfo.offset().top - stickyHeight) + 'px'
   }, 500);
});

// Invoke section scrolling function
scrollingToSections();

// Invoke form validations
etFormValidations();

//===================================================

/**
* Groups the scrolling to each section functions
*/
function scrollingToSections() {
   // Move to before we start section
   $('#select-plan').on('click', function(e) {
      $('body, html').animate({
         scrollTop: ($('#et-select-plan-section').offset().top - stickyHeight) + 'px'
      }, 500);
   });
   
   // Move to About your self section
   $('#et-btn-before-start').on('click', function(e) {
      var $self = $(this);
      var $aboutYourSelf = $('#et-about-yoursel-section');
      
      $self.removeClass('et-pad-bot-50');
      $aboutYourSelf.removeClass('hide-element')
                     .css('margin-bottom', '110px');
      
      $('body, html').animate({
         scrollTop: ($aboutYourSelf.offset().top - stickyHeight) + 'px'
      }, 500);
      
      // Store plan detail data 
      if ($('#et-before-yes').prop('checked')) {
         planDetailData.hasExsingInsurancePoliscy = true;
      } else if ($('#et-before-no').prop('checked')) {
         planDetailData.hasExsingInsurancePoliscy = false;
      }
   });
   
   // Move to Plan option section
   $('#et-btn-ay-self').on('click', function(e) {
      var $self = $(this);
      var $planOption = $('#et-plan-option-section');
      
      $self.removeClass('et-pad-bot-50');
      $('#et-about-yoursel-section').removeAttr('style');
      $planOption.removeClass('hide-element');
      
      if(getWidth()>=992){
         $('.et-collapse-link[aria-expanded="true"]').parent()
                                                .next()
                                                .find('.et-panel-body')
                                                .jScrollPane({showArrows: true});
      }
      
      $('body, html').animate({
         scrollTop: ($planOption.offset().top - stickyHeight) + 'px'
      }, 500);
      
      // Store plan detail data
      if ($('#et-gender-male').prop('checked')) {
         planDetailData.gender = 'Male';
      } else if ($('#et-gender-female').prop('checked')) {
         planDetailData.gender = 'Female';
      }
      
      if ($('#et-smoker-yes').prop('checked')) {
         planDetailData.isSmooker = true;
      } else if ($('#et-smoker-no').prop('checked')) {
         planDetailData.isSmooker = false;
      }
      
      planDetailData.dob = $planDate.val();
   });

   // Move to Medical declaration section
   $('#et-brn-proceed-to-application').on('click', function(e) {
      // Open login modal
      $('#loginModal').modal('show');
      
      // Store plan detail data
      planDetailData.insuranceAmount = $('#et-slider-range').text();
      
      var $appInfo = $('#et-application-first-section');
      $appInfo.removeClass('hide-element')
               .css('margin-bottom', '190px');
      
      $('body, html').animate({
         scrollTop: ($appInfo.offset().top - stickyHeight) + 'px'
      }, 500);
   });
   
   // Move to Application Info section
   $('#et-medical-dec-next').on('click', function(e) {
      var $self = $(this);
      var $target = null;
      
      if (isMedicAnswered()) {
         $target = $('#et-application-info-section');
         $target.removeClass('hide-element');
         
         $('#et-application-first-section').removeAttr('style');
         
         // Store application info data
         appInfoData.medicalDecStatus = false;
      } else {
         $target = $('#et-application-first-section');
         
         // Store application info data
         appInfoData.medicalDecStatus = true;
      }
      
      $('body, html').animate({
         scrollTop: ($target.offset().top - stickyHeight) + 'px'
      }, 500);
   });
   
   // Move to Declaration section
   $('#et-beneficiary-info-next').on('click', function(e) {
      var $self = $(this);
      var $target = '';
      
      if (isBeneficaryValid()) {
         $target = $('#et-application-second-section');
         $target.removeClass('hide-element');
         
         $('body, html').animate({
               scrollTop: ($target.offset().top - stickyHeight) + 'px'
         }, 500);
         
         // Store beneficiaries data
         storeBeneficiaryInfo();
      } else {
         $('body, html').animate({
               scrollTop: ($('#et-beneficiary-info-section').offset().top - stickyHeight) + 'px'
         }, 0);
      }
   });
   
   // Show Application Summary section
   $('#et-app-sum-proceed-btn').on('click', function(e) {
      var $self = $(this);
      var $appSum = $('#et-application-third-section');
      var $confirmSign = $('#et-declaration-proceed-btn');
      
      // Populate information in application summary
      populateAppSummPD();
      populateAppSummPI();
      populateAppSummEI();
      populateAppSummBI();
      
      // Remove confirm and sign button
      // and align view summary button to center
      $confirmSign.parent()
                  .remove();
      $self.parent()
            .removeClass('col-md-6')
            .addClass('et-selected')
      
      $appSum.removeClass('hide-element');
      
      $('body, html').animate({
         scrollTop: ($appSum.offset().top - stickyHeight) + 'px'
      }, 500);
   });
   
   // APPLICATION SUMMARY EDIT buttons
   // Move to specific sections
   $(document).on('click', '.et-app-sum-edit', function(e) {
      e.preventDefault();
      var $self = $(this);
      var $target = $($self.data('target'));
      
      $('body, html').animate({
         scrollTop: ($target.offset().top - stickyHeight) + 'px'
      }, 0);
   });
   
   // Move to signature section
   $('#et-confirm-and-sign-btn, #et-declaration-proceed-btn').on('click', function(e) {
      e.preventDefault();
      var $self = $(this);
      var $sigSection = $('#et-application-fourth-section');
      
      $sigSection.removeClass('hide-element');
      
      if (!$("#signature").find('canvas').length) {
         // Initialize signature area
         $("#signature").jSignature({
            height: '200px', 
            width: '100%',
            'decor-color': 'transparent',
         }).on('change', function(e) {
            var $self = $(this);
            
            if ($("#signature").jSignature('getData', 'native').length) {
               $self.siblings('.correct-signature')
                     .removeClass('hide-element');
            } else {
               $self.siblings('.correct-signature')
                     .addClass('hide-element');
            }
         });
         
         // Signature clear
         $(document).on('click', '#et-clear-signature', function(e) {
            e.preventDefault();
            
            $('#signature').jSignature('clear');
            $(this).parent()
                  .siblings('.correct-signature')
                  .addClass('hide-element');
         });
      }
      
      $('body, html').animate({
         scrollTop: ($sigSection.offset().top - stickyHeight) + 'px'
      }, 500);
   });
}// END OF GROUPS THE SCROLLING TO EACH SECTION FUNCTIONS  

/**
 * Form validation for application info and employment info
 */
function etFormValidations() {
   //Application Info
   $('#eliteTermsInsuredInfoForm').bootstrapValidator({
      excluded: [':disabled', ':hidden', ':not(:visible)', 
                  'input[name="savieApplicantBean[0].residentialTelNo"]', 
                  'input[name="savieApplicantBean[1].residentialTelNo"]',
                  'input[name="savieApplicantBean.firstName"]',
                  'input[name="savieApplicantBean.lastName"]',
                  'input[name="savieApplicantBean.chineseName"]'
               ],
      fields: {
         "savieApplicantBean.hkId": {
            container: '#hkidMessage',
            validators: {
               notEmpty: {
                  message: 'HKID is required.'
               },
               callback: {
                  message: 'Invalid HKID',
                  callback: function(value, validator) {
                     return isValidHKID(value);
                  }
               }
            }
         },
         "savieApplicantBean.maritalStatus": {
            container: '#maritalStatusMessage',
            validators: {
               notEmpty: {
                  message: 'Marital status is required.'
               }
            }
         },
         "savieApplicantBean.placeOfBirth": {
            container: '#placeOfBirthMessage',
            validators: {
               notEmpty: {
                  message: 'Place of birth is required.'
               }
            }
         },
         "savieApplicantBean.nationality": {
            container: '#nationalityMessage',
            validators: {
               notEmpty: {
                  message: 'Nationality is required.'
               }
            }
         },
         "savieApplicantBean[0].mobileNo": {
            container: '#mobilePrefixMessage',
            validators: {
               notEmpty: {
                  message: 'Mobile prefix is required.'
               }
            }
         },
         "savieApplicantBean[1].mobileNo": {
            container: '#mobileSuffixMessage',
            validators: {
               notEmpty: {
                  message: 'Mobile suffix is required.'
               }
            }
         },
         "savieApplicantBean.emailAddress": {
            container: '#emailMessage',
            validators: {
               notEmpty: {
                  message: 'Email address is required.' 
               },
               emailAddress: {
                  message: 'Provice a valid email address.'
               }
            }
         },
         "savieApplicantBean.permanentAddress": {
            container: '#perAddressMessage',
            validators: {
               notEmpty: {
                  message: 'Permanent address is required.' 
               }
            }
         },
         "savieApplicantBean.residentialDistrict": {
            container: '#resDistrictMessage',
            validators: {
               notEmpty: {
                  message: 'Residential address is required.' 
               }
            }
         },
         "savieApplicantBean.correspondenceDistrict": {
            container: '#correspondenceDistricttMessage',
            validators: {
               notEmpty: {
                  message: 'Correspondence address is required.' 
               }
            }
         }
      },
      submitHandler: function(validator, form, submitButton) {
         
         if (validator.isValid()) {
            
            if (!isAppFormValid()) {
               $('body, html').animate({
                  scrollTop: ($('#et-application-info-section').offset().top - stickyHeight) + 'px'
               }, 0);
               
               return false;
            }
            
            $('#et-personal-info-next').removeAttr('disabled');
            var $ben = $('#et-employment-info-section');
            
            $ben.removeClass('hide-element')
                  .css('margin-bottom', '280px');
            
            $('body, html').animate({
               scrollTop: ($ben.offset().top - stickyHeight) + 'px'
            }, 500);
            
            // Modify the codes below 
            // to manipulate the form data
            
            // Store application info data
            storeAppInfo();
            
            return false;
         } 
      }
   }).on('submit', function(e) {
      var $form = $(this);
      
      if (!$form.data('bootstrapValidator').isValid()) {   
         isAppEnFNameValid();
         isAppEnLNameValid();
         isAppChNameValid();
         isAppDobValid();
         
         $('body, html').animate({
            scrollTop: ($('#et-application-info-section').offset().top - stickyHeight) + 'px'
         }, 0);
      }
   });
   
   // Employment Info
   $('#etEmploymentInfoForm').bootstrapValidator({
      fields: {
         "savieEmploymentBean.employmentStatus": {
            container: '#employmentStatusMessage',
            validators: {
               notEmpty: {
                  message: 'Employement status is required.'
               }
            }
         },
         "savieEmploymentBean.occupation": {
            container: '#occupationMessage',
            validators: {
               notEmpty: {
                  message: 'Occupation is required.'
               }
            }
         },
         "savieEmploymentBean.liquidAssets": {
            container: '#liquidAssets',
            validators: {
               notEmpty: {
                  message: 'Liquid asset is required.'
               }
            }
         },
         "savieEmploymentBean.educationLevel": {
            container: '#educationLevelMessage',
            validators: {
               notEmpty: {
                  message: 'Education level is required.'
               }
            }
         },
         "savieEmploymentBean.natureOfBusiness": {
            container: '#natureOfBusinessMessage',
            validators: {
               notEmpty: {
                  message: 'Nature of business is required.'
               }
            }
         },
         "savieEmploymentBean.monthlyPersonalIncome": {
            container: '#monthlyIncomeMessage',
            validators: {
               notEmpty: {
                  message: 'Monthly income is required.'
               }
            }
         }
      },
      submitHandler: function(validator, form, submitButton) {
         
         if (validator.isValid()) {
            var $ben = $('#et-beneficiary-info-section');
            
            $ben.removeClass('hide-element');
            
            $('#et-employment-info-next').removeAttr('disabled');
            $('#et-employment-info-section').removeAttr('style');
            
            $('body, html').animate({
               scrollTop: ($ben.offset().top - stickyHeight) + 'px'
            }, 500);
            
            // Modify the codes below 
            // to manipulate the form data
            
            // Store employment info data
            storeEmpInfo();
            
            return false;
         } 
      }
   }).on('submit', function(e) {
      $('#et-employment-info-next').removeAttr('disabled');
      
      if (!$(this).data('bootstrapValidator').isValid()) {   
         $('body, html').animate({
            scrollTop: ($('#et-employment-info-section').offset().top - stickyHeight) + 'px'
         }, 0);
      }
   });
   
} // END OF FORM VALIDATION FOR APPLICATION INFO AND EMPLOYMENT INFO

/**
* Form Validation utility functions
*/
// Check if application info dob is not empty
function isAppDobValid() {
   var $dob = $('#sales-illu-dob');
         
   if (!$dob.val() || ($dob.val() === 'DD-MM-YYYY ')) {
      $dob.siblings('.error-msg')
            .find('.help-block')
            .removeClass('hide-element');

      return false;
   }
   
   return true;
}

// Check if application info en fname is not empty
function isAppEnFNameValid() {
   var $obj = $('#savieApplicantBean\\.firstName');
   
   if (!$obj.val() || ($obj.val() === 'Given Name ')) {
      $obj.next('.error-msg')
         .find('.help-block')
         .removeClass('hide-element');

      return false;
   }
   
   return true;
}

// Check if application info en lname is not empty
function isAppEnLNameValid() {
   var $obj = $('#savieApplicantBean\\.lastName');
   
   if (!$obj.val() || ($obj.val() === 'Last Name ')) {
      $obj.next('.error-msg')
         .find('.help-block')
         .removeClass('hide-element');

      return false;
   }
   
   return true;
}

// Check if application info ch name is not empty
function isAppChNameValid() {
   var $obj = $('#savieApplicantBean\\.chineseName');
   
   if (!$obj.val() || ($obj.val() === 'Name in Chinese ')) {
      $obj.next('.error-msg')
         .find('.help-block')
         .removeClass('hide-element');
         
      return true;
   }
   
   return false;
}

// Check custom application info validation
function isAppFormValid() {
   if (isAppEnFNameValid()) {
      return true;
   } else if (isAppEnLNameValid()) {
      return true;
   } else if (isAppChNameValid()) {
      return true;
   } else if (isAppDobValid()) {
      return true;
   }
   
   return false;
}

// Dob change event
$('#sales-illu-dob, #savieApplicantBean\\.firstName, #savieApplicantBean\\.lastName, #savieApplicantBean\\.chineseName').on('change', function(e){
   var $self = $(this);
   
   if ($self.val()) {
      $self.next('.error-msg')
            .find('.help-block')
            .addClass('hide-element');
            
      $('#et-personal-info-next').removeAttr('disabled');
   }
});

// Update employment info fields, if employment status = unemployed
$('#savieEmploymentBean\\.employmentStatus').on('change', function(e) {
   var $self = $(this);
   
   if ($self.val() === 'unemployed') {
      $('.et-emp-info-occupation-container').addClass('hide-element');
      $('.et-emp-info-nat-business-container').addClass('hide-element');
      $('.et-emp-info-mon-income-container').addClass('hide-element');
      $('.et-emp-info-liq-assets-container').removeClass('hide-element');
   } else {
      $('.et-emp-info-occupation-container').removeClass('hide-element');
      $('.et-emp-info-nat-business-container').removeClass('hide-element');
      $('.et-emp-info-mon-income-container').removeClass('hide-element');
      $('.et-emp-info-liq-assets-container').addClass('hide-element');
   }
});

// Determine if the previous question was answered
function isMedicAnswered() {
   var result = true;
   
   $('.et-collapse').each(function() {
      if ($(this).attr('data-is-answered') !== 'true') {
         result = false;
         
         return false;
      }
   });
   
   return result;
}

// Check if all medic questions are answered with no
function isMedicAnsweredWithNo() {
   var result = true;
   
   $('.et-btn-medic-no').each(function() {
      if (!$(this).hasClass('btn-selected')) {
         result = false;
         
         return false;
      }
   });
   
   return result;
}

function fnSetStyle(){
   if($('.datepicker.datepicker-dropdown').length){
      //datepicker exist
      
      var isVisible = $('.datepicker .datepicker-years table thead tr th:last-child').css("visibility");
      
      if(isVisible == "hidden"){
         //console.log('hidden');
         $('.datepicker .datepicker-years table thead tr th:last-child').removeAttr('style');
         $('.datepicker .datepicker-years table thead tr th:last-child').css(
         {"visibility":'visible !important',
         "cursor":"not-allowed"});
      }else{
         //console.log('vivible');
         $('.datepicker .datepicker-years table thead tr th:last-child').css(
         {"visibility":'visible !important',
         "cursor":"pointer"});
      }
   }else{
      //console.log('doesnot exist');
      //date picker does not exist
   }
}

// Utility function
function capitalizeFirstLetter(string) {
    return string ? string.charAt(0).toUpperCase() + string.slice(1) : '';
}
function formatToCapEachLetter(string) {
   if (!string) {
      return '';
   }
   
   var arr = string.split('-');
   
   if (arr.length > 1) {
         
      for (var i=0; i<arr.length; i++) {
         arr[i] = capitalizeFirstLetter(arr[i]);
      }
      return arr.join(' ');
   } else {
      return capitalizeFirstLetter(arr[0]);
   }
   
}

// Application Info tooltip
$('.btn-app-info-tooltip, .btn-beneficiary-tooltip').tooltip({
   trigger: 'hover focus click',
   container: 'body',
   template: 	'<div class="tooltip et-app-info-tooltip" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>',
   placement: tooltipPlacement
});
function tooltipPlacement(context, source) {
   var $source = $(source);
   var position = $source.position();
   
   if ($source.hasClass('btn-app-info-tooltip')) {
      if ((position.top >= 39) && (position.left < 230)) {
         return 'top';
      } else if ((position.top <= 6) && (position.left > 380) && (position.left < 560) && (getWidth() < 992)) {
         return 'left';
      } else {
         return 'right';
      }
   } else if ($source.hasClass('btn-beneficiary-tooltip')) {
      if (position.left < 350 ) {
         return 'left';
      } else {
         return 'right';
      }
   }
}

/**
 * Check if beneficiary form is valid
 */
function isBeneficaryValid() { 
   var res1 = true; 
   var res2 = true; 
   var res3 = true;
   
   // Person 1
   if ($('#beneficiaryInfoForm\\[0\\]').length) {
      if (isBeneficiaryFormClear(0) || $('#beneficiaryInfoForm\\[0\\]').data('bootstrapValidator').isValid()) {
         res1 = true;
      } else {
         res1 = false;
         $('#beneficiaryInfoForm\\[0\\]').data('bootstrapValidator').validate();
      }
   } 
   
   // Person 2
   if ($('#beneficiaryInfoForm\\[1\\]').length) {
      if (isBeneficiaryFormClear(1) || $('#beneficiaryInfoForm\\[1\\]').data('bootstrapValidator').isValid()) {
         res2 = true;
      } else {
         res2 = false;
         $('#beneficiaryInfoForm\\[1\\]').data('bootstrapValidator').validate();
      }
   } 
   
   // Person 3
   if ($('#beneficiaryInfoForm\\[2\\]').length) {
      if (isBeneficiaryFormClear(2) || $('#beneficiaryInfoForm\\[2\\]').data('bootstrapValidator').isValid()) {
         res3 = true;
      } else {
         res3 = false;
         $('#beneficiaryInfoForm\\[2\\]').data('bootstrapValidator').validate();
      }
   }
   
   return res1 && res2 && res3;
}
function isBeneficiaryFormClear(pos) {
   var $form = $('#beneficiaryInfoForm\\[' + pos +'\\]');
   
   if (!document.getElementById('savieBeneficiaryBean[' + pos + '].firstName').value
         && !document.getElementById('savieBeneficiaryBean[' + pos + '].lastName').value
         && !document.getElementById('savieBeneficiaryBean[' + pos +'].chineseName').value
         && (!document.getElementById('savieBeneficiaryBean[' + pos + '].hkId').value || !document.getElementById('savieBeneficiaryBean[' + pos + '].passportNo').value)
         && !document.getElementById('savieBeneficiaryBean[' + pos + '].entitlement').value
         && !document.getElementById('savieBeneficiaryBean[' + pos + '].relationship').value
      ) {
      
      return true;
   }
   
   return false;
}
   
/**
 * Populate the application summary with filled in data 
 */
function populateAppSummPD() {
   $('#etaspd-insured-amount').text('HK$ ' + planDetailData.insuranceAmount);
}
function populateAppSummPI() {
   $('#etaspi-en-lname').text(appInfoData.enLName);
   $('#etaspi-fname').text(appInfoData.enFName);
   $('#etaspi-chName').text(appInfoData.chName);
   $('#etaspi-hkid').text(appInfoData.hkid);
   $('#etaspi-gender').text(appInfoData.gender);
   $('#etaspi-is-smooker').text(planDetailData.isSmooker ? 'Smooker' : 'Non-smooker');
   $('#etaspi-marital-status').text(capitalizeFirstLetter(appInfoData.maritalStat));
   $('#etaspi-dob').text(appInfoData.dob);
   $('#etaspi-pob').text(appInfoData.pob);
   $('#etaspi-nationality').text(appInfoData.nationality);
   $('#etaspi-email').text(appInfoData.email);
  
   var _tempTelSuffix = '';
   if (appInfoData.resTelNoSuffix.length > 4) {
      _tempTelSuffix = appInfoData.resTelNoSuffix.slice(0, 4) + '-' + appInfoData.resTelNoSuffix.slice(4);
   } else {
      _tempTelSuffix = appInfoData.resTelNoSuffix;
   }
   $('#etaspi-tel-no').text('+' + appInfoData.resTelNoPrefix + ' ' + _tempTelSuffix);   
   
   var _tempMobSuffix = '';
   if (appInfoData.resTelNoSuffix.length > 4) {
      _tempMobSuffix = appInfoData.mobNoSuffix.slice(0, 4) + '-' + appInfoData.mobNoSuffix.slice(4);
   } else {
      _tempMobSuffix = appInfoData.resTelNoSuffix;
   }
   $('#etaspi-mob-no').text('+' + appInfoData.mobNoPrefix + ' ' + _tempMobSuffix);   
  
   var resAddArr = [];
   if (appInfoData.resAddL1) {
      resAddArr.push(appInfoData.resAddL1);
   }
   if (appInfoData.resAddL2) {
      resAddArr.push(appInfoData.resAddL2);
   }
   if (appInfoData.resAddL3) {
      resAddArr.push(appInfoData.resAddL3);
   }
   resAddArr.push(appInfoData.resAdd);
   $('#etaspi-res-add').text(resAddArr.join(', '));
   
   var perAddArr = [];
   if (appInfoData.perAddL1) {
      perAddArr.push(appInfoData.perAddL1);
   }
   if (appInfoData.perAddL2) {
      perAddArr.push(appInfoData.perAddL2);
   }
   if (appInfoData.perAddL3) {
      perAddArr.push(appInfoData.perAddL3);
   }
   perAddArr.push(appInfoData.perAdd);
   $('#etaspi-per-add').text(perAddArr.join(', '));
   
   if ($('#savieApplicantBean\\.addressIsSame').prop('checked')) {
      $('.et-corr-add').removeClass('hide-element');
         
      var corrAddArr = [];
      if (appInfoData.corrAddL1) {
         corrAddArr.push(appInfoData.corrAddL1);
      }
      if (appInfoData.corrAddL2) {
         corrAddArr.push(appInfoData.corrAddL2);
      }
      if (appInfoData.corrAddL2) {
         corrAddArr.push(appInfoData.corrAddL2);
      }
      corrAddArr.push(appInfoData.corrAddL);
      $('#etaspi-corr-add').text(corrAddArr.join(', '));
   } else {
      $('.et-corr-add').addClass('hide-element');
   }
}
function populateAppSummEI() {
   if (empEduInfoData.status.toLowerCase().indexOf('unemployed') > -1) {
      $('.et-stat-unemployed').removeClass('hide-element');
      $('.et-not-stat-unemployed').addClass('hide-element');
      $('#etasei-liq-asset').text(formatToCapEachLetter(empEduInfoData.liqAsset));
   } else {
      $('.et-not-stat-unemployed').removeClass('hide-element');
      $('.et-stat-unemployed').addClass('hide-element');
      $('#etasei-occupation').text(formatToCapEachLetter(empEduInfoData.occupation));
      $('#etasei-nat-business').text(formatToCapEachLetter(empEduInfoData.natBusiness));
      $('#etasei-mon-income').text(formatToCapEachLetter(empEduInfoData.monIncome));
   }
   
   $('#etasei-emp-status').text(formatToCapEachLetter(empEduInfoData.status));
   $('#etasei-edu-level').text(formatToCapEachLetter(empEduInfoData.eduLevel));
}
function populateAppSummBI() {
   // ???
   
   if ($('#name-others-now').prop('checked')) {
      // person 1
      if (beneInfoData.first) {
         $('.et-person-1').removeClass('hide-element');
         
         beneInfoData.first.enFName ? $('#etasbi-en-fname-1').text(beneInfoData.first.enFName) : '';
         beneInfoData.first.enLName ? $('#etasbi-en-lname-1').text(beneInfoData.first.enLName) : '';
         beneInfoData.first.chName ? $('#etasbi-ch-name-1').text(beneInfoData.first.chName) : '';
         (beneInfoData.first.hkid || beneInfoData.first.passNo) ? $('#etasbi-hkid-pass-1').text(beneInfoData.first.hkid ? beneInfoData.first.hkid : beneInfoData.first.passNo) : '';
         beneInfoData.first.relationship ? $('#etasbi-relationship-1').text(capitalizeFirstLetter(beneInfoData.first.relationship)) : '';
         beneInfoData.first.gender ? $('#etasbi-gender-1').text(beneInfoData.first.gender) : '';
         beneInfoData.first.entitlement ? $('#etasbi-entitlement-1').text('Person 1: ' + beneInfoData.first.entitlement + '%') : '';
      } else {
         $('.et-person-1').addClass('hide-element');
      }
      
      // person 2
      if (beneInfoData.second) {
         $('.et-person-2').removeClass('hide-element');
         
         beneInfoData.second.enFName ? $('#etasbi-en-fname-2').text(beneInfoData.second.enFName) : '';
         beneInfoData.second.enLName ? $('#etasbi-en-lname-2').text(beneInfoData.second.enLName) : '';
         beneInfoData.second.chName ? $('#etasbi-ch-name-2').text(beneInfoData.second.chName) : '';
         (beneInfoData.second.hkid || beneInfoData.first.passNo) ? $('#etasbi-hkid-pass-2').text(beneInfoData.second.hkid ? beneInfoData.second.hkid : beneInfoData.second.passNo) : '';
         beneInfoData.second.relationship ? $('#etasbi-relationship-2').text(capitalizeFirstLetter(beneInfoData.second.relationship)) : '';
         beneInfoData.second.gender ? $('#etasbi-gender-2').text(beneInfoData.second.gender) : '';
         beneInfoData.second.entitlement ? $('#etasbi-entitlement-2').text('Person 2: ' + beneInfoData.second.entitlement + '%') : '';
      } else {
         $('.et-person-2').addClass('hide-element');
      }
      
      // person 3
      if (beneInfoData.third) {
         $('.et-person-3').removeClass('hide-element');
         
         beneInfoData.third.enFName ? $('#etasbi-en-fname-3').text(beneInfoData.third.enFName) : '';
         beneInfoData.third.enLName ? $('#etasbi-en-lname-3').text(beneInfoData.third.enLName) : '';
         beneInfoData.third.chName ? $('#etasbi-ch-name-3').text(beneInfoData.third.chName) : '';
         (beneInfoData.third.hkid || beneInfoData.third.passNo) ? $('#etasbi-hkid-pass-3').text(beneInfoData.third.hkid ? beneInfoData.third.hkid : beneInfoData.third.passNo) : '';
         beneInfoData.third.relationship ? $('#etasbi-relationship-3').text(capitalizeFirstLetter(beneInfoData.third.relationship)) : '';
         beneInfoData.third.gender ? $('#etasbi-gender-3').text(beneInfoData.third.gender) : '';
         beneInfoData.third.entitlement ? $('#etasbi-entitlement-3').text('Person 3: ' + beneInfoData.third.entitlement + '%') : '';
      } else {
         $('.et-person-3').addClass('hide-element');
      }
   }
}

/**
 * Save all data from application field
 */
function storeAppInfo() {
   appInfoData.enFName = document.getElementById('savieApplicantBean.firstName').value;
   appInfoData.enLName = document.getElementById('savieApplicantBean.lastName').value;
   appInfoData.chName = document.getElementById('savieApplicantBean.chineseName').value;
   appInfoData.dob = document.getElementById('et-select-plan-date-input').value;
   
   if ($('#et-gender-male').prop('checked')) {
      appInfoData.gender = 'Male';
   } else if ($('#et-gender-female').prop('checked')) {
      appInfoData.gender = 'Female';
   }
   
   appInfoData.hkid = document.getElementById('savieApplicantBean.hkId').value;
   appInfoData.maritalStat = document.getElementById('savieApplicantBean.maritalStatus').value;
   appInfoData.pob = document.getElementById('savieApplicantBean.placeOfBirth').value;
   appInfoData.nationality = document.getElementById('savieApplicantBean.nationality').value;
   appInfoData.resTelNoPrefix = document.getElementById('residential-first').value;
   appInfoData.resTelNoSuffix = document.getElementById('residential-second').value;
   appInfoData.mobNoPrefix = document.getElementById('mobile-first').value;
   appInfoData.mobNoSuffix = document.getElementById('mobile-second').value;
   appInfoData.email = document.getElementById('savieApplicantBean.emailAddress').value;
   appInfoData.perAddL1 = document.getElementById('savieApplicantBean.permanentAddress1').value;
   appInfoData.perAddL2 = document.getElementById('savieApplicantBean.permanentAddress2').value;
   appInfoData.perAddL3 = document.getElementById('savieApplicantBean.permanentAddress3').value;
   appInfoData.perAdd = document.getElementById('savieApplicantBean.permanentAddress').value;
   appInfoData.resAddL1 = document.getElementById('savieApplicantBean.residentialAdress1').value;
   appInfoData.resAddL2 = document.getElementById('savieApplicantBean.residentialAdress2').value;
   appInfoData.resAddL3 = document.getElementById('savieApplicantBean.residentialAdress3').value;
   appInfoData.resAdd = document.getElementById('savieApplicantBean.residentialDistrict').value;
   
   // For the correspondence address
   if ($('#savieApplicantBean\\.addressIsSame').prop('checked')) {
      appInfoData.corrAddL1 = document.getElementById('savieApplicantBean.correspondenceAdress1').value;
      appInfoData.corrAddL2 = document.getElementById('savieApplicantBean.correspondenceAdress2').value;
      appInfoData.corrAddL3 = document.getElementById('savieApplicantBean.correspondenceAdress3').value;
      appInfoData.corrAddL = document.getElementById('savieApplicantBean.correspondenceDistrict').value;
   }
}

/**
 * Save all data from employee fields
 */
function storeEmpInfo() {
   empEduInfoData.status = document.getElementById('savieEmploymentBean.employmentStatus').value;
   empEduInfoData.occupation = document.getElementById('savieEmploymentBean.occupation').value;
   empEduInfoData.eduLevel = document.getElementById('savieEmploymentBean.educationLevel').value;
   empEduInfoData.natBusiness = document.getElementById('savieEmploymentBean.natureOfBusiness').value;
   empEduInfoData.monIncome = document.getElementById('savieEmploymentBean.monthlyPersonalIncome').value;
   empEduInfoData.liqAsset = document.getElementById('savieEmploymentBean.liquidAssets').value;
}

/**
 * Save all data from beneficiaries fields
 */
function storeBeneficiaryInfo() {
   if ($('#name-others-now').prop('checked')) {
      // Person 1
      beneInfoData.first = {};
      
      beneInfoData.first.enFName = document.getElementById('savieBeneficiaryBean[0].firstName').value;
      beneInfoData.first.enLName = document.getElementById('savieBeneficiaryBean[0].lastName').value;
      beneInfoData.first.chName = document.getElementById('savieBeneficiaryBean[0].chineseName').value;
      
      var benHKIDPASS = document.getElementById('beneficiaryHkidPassport[0]').value;
      
      if ((benHKIDPASS.toLowerCase().indexOf('hkid') > -1)) {
         beneInfoData.first.hkid = document.getElementById('savieBeneficiaryBean[0].hkId').value;
      } else if ((benHKIDPASS.toLowerCase().indexOf('passport') > -1)) { 
         beneInfoData.first.passNo = document.getElementById('savieBeneficiaryBean[0].passportNo').value;
      }
      
      if ($('#male-0').prop('checked')) {
         beneInfoData.first.gender = 'Male';
      } else if ($('#female-0').prop('checked')) {
         beneInfoData.first.gender = 'Female';
      }
      
      beneInfoData.first.relationship = document.getElementById('savieBeneficiaryBean[0].relationship').value;;
      beneInfoData.first.entitlement = document.getElementById('savieBeneficiaryBean[0].entitlement').value;
      
      // Person 2
      if (document.getElementById('beneficiaryInfoForm[1]') && !$('#beneficiaryInfoForm\\[1\\]').hasClass('hidden')) {
         beneInfoData.second = {};
         
         beneInfoData.second.enFName = document.getElementById('savieBeneficiaryBean[1].firstName').value;
         beneInfoData.second.enLName = document.getElementById('savieBeneficiaryBean[1].lastName').value;
         beneInfoData.second.chName = document.getElementById('savieBeneficiaryBean[1].chineseName').value;
         
         var benHKIDPASS = document.getElementById('beneficiaryHkidPassport[1]').value;
         
         if ((benHKIDPASS.toLowerCase().indexOf('hkid') > -1)) {
            beneInfoData.second.hkid = document.getElementById('savieBeneficiaryBean[1].hkId').value;
         } else if ((benHKIDPASS.toLowerCase().indexOf('passport') > -1)) { 
            beneInfoData.second.passNo = document.getElementById('savieBeneficiaryBean[1].passportNo').value;
         }
         
         if ($('#male-1').prop('checked')) {
            beneInfoData.second.gender = 'Male';
         } else if ($('#female-1').prop('checked')) {
            beneInfoData.second.gender = 'Female';
         }
         
         beneInfoData.second.relationship = document.getElementById('savieBeneficiaryBean[1].relationship').value;;
         beneInfoData.second.entitlement = document.getElementById('savieBeneficiaryBean[1].entitlement').value;
      }
      
      // Person 3
      if (document.getElementById('beneficiaryInfoForm[2]') && !$('#beneficiaryInfoForm\\[2\\]').hasClass('hidden')) {
         beneInfoData.third = {};
         
         beneInfoData.third.enFName = document.getElementById('savieBeneficiaryBean[2].firstName').value;
         beneInfoData.third.enLName = document.getElementById('savieBeneficiaryBean[2].lastName').value;
         beneInfoData.third.chName = document.getElementById('savieBeneficiaryBean[2].chineseName').value;
         
         var benHKIDPASS = document.getElementById('beneficiaryHkidPassport[2]').value;
         
         if ((benHKIDPASS.toLowerCase().indexOf('hkid') > -1)) {
            beneInfoData.third.hkid = document.getElementById('savieBeneficiaryBean[2].hkId').value;
         } else if ((benHKIDPASS.toLowerCase().indexOf('passport') > -1)) { 
            beneInfoData.third.passNo = document.getElementById('savieBeneficiaryBean[2].passportNo').value;
         }
         
         if ($('#male-2').prop('checked')) {
            beneInfoData.third.gender = 'Male';
         } else if ($('#female-2').prop('checked')) {
            beneInfoData.third.gender = 'Female';
         }
         
         beneInfoData.third.relationship = document.getElementById('savieBeneficiaryBean[2].relationship').value;;
         beneInfoData.third.entitlement = document.getElementById('savieBeneficiaryBean[2].entitlement').value;
      }
   }
}