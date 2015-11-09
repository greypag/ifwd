var contextPath = context;
var language = languageP;

var getBundleLanguage = "";
var lang = UILANGUAGE;

if(lang === "EN"){
	getBundleLanguage = "en";
}else 
if(lang === "tc"){
	getBundleLanguage = "zh";
} 
else{
	getBundleLanguage = "en";
}

function getEliteTermPremium() {

	$('#loading-overlay').modal({
       backdrop: 'static',
       keyboard: false
    });

	var dob = $('#et-select-plan-date-input').val();
	var gender = $('input[name="et-gender"]:checked ').val();
	var smoke = $('input[name="et-smoker"]:checked ').val();
	var insuredAmount = $('#R2').val();
	var referralCode = $('#et-promocode').val();
	var referralCodePlaceholder = $('#et-promocode').attr('placeholder');
	referralCode = (referralCode==referralCodePlaceholder)?'':referralCode;
	
	if(dob ==null || gender ==null || smoke ==null || insuredAmount ==null){
		console.log("data error");
	}
	else{
		$.get(contextPath+'/ajax/eliteTerm/getEliteTermPremium',
		{ 
			dob : dob,
			gender: gender,
			smoke: smoke,
			insuredAmount: insuredAmount,
			referralCode:referralCode
		},
		function(data) {
			//if(data.errMsgs == null){
				
			if( data == null ){
				resetCalculatedAmt();
			} 
			else if( data.errMsgs != null ){
				resetCalculatedAmt();
			}
			else{
				if( data.effectivePeriod!=null && data.effectivePeriod=='12'){
					setCalculatedAmt(true, insuredAmount,
						data.monthlyPremium, data.dailyPremium, data.monthlyDuePremium, data.dailyDuePremium);
				}
				else{
					setCalculatedAmt(false, insuredAmount,
						data.monthlyPremium, data.dailyPremium, 0, 0);
				}
			}
				//modInsuredAmount = parseFloat(insuredAmount).toFixed(2);
				//modMonthlyPremium = parseFloat(data.monthlyPremium).toFixed(2);
				//$("#et-month-dis-amount").html(parseFloat(data.monthlyDuePremium).toFixed(2));
				//$("#et-day-dis-amount").html(parseFloat(data.dailyDuePremium).toFixed(2));
				//$("#et-month-amount").html(parseFloat(data.monthlyPremium).toFixed(2));
				//$("#et-day-amount").html(parseFloat(data.dailyPremium).toFixed(2));
				//$("#etaspd-insured-amount").html('HK$ ' + modInsuredAmount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
				//$("#etaspd-monthly-premium").html('HK$ ' + modMonthlyPremium.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
				//applyPromoReward(data.effectivePeriod);
			//}
			//else{
			//	console.log("data error");
			//}
			$('#loading-overlay').modal('hide');
		})
		.fail(function(data) {
			$('#loading-overlay').modal('hide');
		});
	}
}

$('#et-signature-proceed-btn').on('click', function(e) {
	if(!$('#eliteTermsInsuredInfoForm').data('bootstrapValidator').isValid()){
		console.log('Applicant Form validation failure');
		$('#et-medical-dec-next').click();
	}
	else if(!$('#etEmploymentInfoForm').data('bootstrapValidator').isValid()){
		console.log('Employment Form validation failure');
		$('#et-personal-info-next').click();
	}
	else if(!isBeneficaryValid()){
		console.log('Beneficiary Form validation failure');
		$('#et-employment-info-next').click();
	}
	else{
		var formdata =  $('#eliteTermsInsuredInfoForm').serialize()+"&"+
	    $('#etEmploymentInfoForm').serialize()+"&"+
	    $('#beneficiaryInfoForm\\[0\\]').serialize()+"&"+
	    $('#beneficiaryInfoForm\\[1\\]').serialize()+"&"+
	    $('#beneficiaryInfoForm\\[2\\]').serialize();
		$.ajax({
		        type: "POST",
		        url:contextPath+'/ajax/eliteTerm/createEliteTermPolicy',
		        data: formdata,
		        success:function(data){
			if(data.errMsgs == null){
				var $sigdiv = $("#signature");
				var datapair = $sigdiv.jSignature("getData", "image");
				var obj = datapair[1];
				if(datapair[1].length > signatureFileSize*1024 ){
			    	console.log("Image size exceeds limit.");
				}else if($('.correct-signature').hasClass('hide-element')){
					console.log("Need to sign");
				}else{
					$.ajax({     
			    	    url:contextPath+'/ajax/eliteTerm/uploadSignature',     
			    	    type:'post',     
			    	    data:{    
			    	    	"image" : datapair[1],
			    	    	"policyNo" : data.policyNo
			       		},     
			    	    success:function(data){
			    	    	if(data!=null && data.errMsgs == null){
			    	    		console.log("signature success");
			    	    		window.location.href= contextPath+'/'+language+'/term-life-insurance/'+selectPlanNextPageFlow;
			    			}
			    			else{
			    				console.log("data error");
			    			}
			    	    },
			       		error:function(){     
			    	    	console.log('error');     
			    	    }
			    	});
				}
			}
			else{
				console.log("data error");
			}
		},
		error:function(){
		    console.log('error');     
		}
		});
	}
});

$('#et-upload-doc-submit-btn').on('click', function(e) {
	if(!checkLogin()){
		return false;
	}
	var uploadNow = $("input[name='upload-doc']:checked").val();
	var passportFlage = true;
	var uploadLaterFlage = false;
	if(uploadNow == 'upload-now'){
		var display = $('.passport-holder').css("display");
		var hkidflage = $('#hkid-copy-progress').css("display");
		var passportflage = $('#passport-copy-progress').css("display");
		var proofflage = $('#proof-of-address-progress').css("display");
		if(hkidflage == 'none' || proofflage == 'none'){
			return false;
		}
		if(display != 'none' && passportflage == 'none'){
			return false;
		}else if(display != 'none'){
			passportFlage = true;
		}else{
			passportFlage = false;
		}
	}else{
		uploadLaterFlage = true;
	}
	sendEliteTermSendImageFlage(passportFlage,uploadLaterFlage);
});


function sendEliteTermSendImageFlage(passportFlage,uploadLaterFlage) {
	$.ajax({
		        type: "POST",
		        url:contextPath+'/ajax/eliteTerm/getEliteTermSendImageFlage',
		        data: {
					"passportFlage":passportFlage,
					"uploadLaterFlage":uploadLaterFlage
				},
		        success:function(data){
					window.location.href= contextPath+'/'+language+'/term-life-insurance/'+documentUploadNextPageFlow;
				}
		});
}

$('#et-confirmation-submit').on('click', function(e) {
	var policyNo = $('#policy-number').html();
	var agentEmail = $('#agent-email').val();
    var valid = true;
    document.getElementById("errPromoEmail").style.display = "none";
	// Email Address Validation
	if(agentEmail.trim() == "") {
		document.getElementById("errPromoEmail").style.display = "block";
		document.getElementById("errPromoEmail").innerHTML = getBundle(getBundleLanguage, "promotion.email.notNull.message");//"Your E-mail Address is invalid.";
		valid = false;

	}
	else{
		if(emailreg.test(agentEmail) == false) {
			document.getElementById("errPromoEmail").style.display = "block";
			document.getElementById("errPromoEmail").innerHTML = getBundle(getBundleLanguage, "promotion.email.notValid.message");//"Your E-mail Address is invalid.";
			valid = false;
		}
	}
	if(!valid){
		console.log("data error");
	}
	else{
		$.get(contextPath+'/ajax/eliteTerm/setEliteTermPolicyAgentEmail',
		{ 
			policyNo : policyNo,
			agentEmail : agentEmail
		},
		function(data) {
			if(data.errMsgs == null){
				console.log("data success");
			}
			else{
				console.log("data error");
			}
		})
		.fail(function(data) {
		});
	}
});

//$('#et-cannot-apply-btn').on('click', function(e) {
//	var name = $('#name').val();
//	var email = $('#email').val();
//	var mobile = $('#tel').val();
//	var preferredDay = $('#day').val();
//	var preferredTimeSlot = $('#time').val();
//	var enquiryType = $('#enquiry').val();
//	var channel = $("#channel").val();
//	var product = "eliteterm";
//	
//	if(name ==null){
//		console.log("data error");
//	}
//	else{
//		$.get(contextPath+'/ajax/eliteTerm/contactCs',
//		{ 
//			name : name,
//			email : email,
//			mobile : mobile,
//			preferredDay : preferredDay,
//			preferredTimeSlot : preferredTimeSlot,
//			enquiryType : enquiryType,
//			channel : channel,
//			product : product
//		},
//		function(data) {
//			if(data.errMsgs == null){
//				$('#cannot-apply-modal').modal('hide');
//				$('#goHomepageModal').modal('show');
//				console.log("data success");
//			}
//			else{
//				console.log("data error");
//			}
//		})
//		.fail(function(data) {
//		});
//	}
//});
$('input[name="et-gender"]').on('click', function(e) {
	$('#savieApplicantBeanGender').val(this.value);
});
$('input[name="et-smoker"]').on('click', function(e) {
	$('#savieApplicantBeanSmoke').val(this.value);
});
// get resource bundle
function getBundle(lang, key) {
	var rtn; 
	loadBundles(lang, key, function(value){
		rtn = value;
	});
	return rtn;
}
function loadBundles(lang, key, fn) {
	//var u = window.location.origin+''+home+'/resources/bundle/';
   	$.i18n.properties({
        name: 'Messages',
        path: ''+home_url+'/resources/bundle/',
        mode: 'map',
        language: lang,
        cache: true,
        callback: function() {
        	fn($.i18n.prop(key)); //msg_welcome;	//$.i18n.prop("msg_welcome")      
        }
    });
}

/**
 * Generic Error Modal
 *
 * @param Object _properties:
 *    Structure:
 *       {
 *          header: 'some header text here', (if omitted default value is "Error")
 *          'body': 'some body text here' (required)
 *          'footer': 'some footer button text here' (if omitted default value is "OK")
 *       }
 */
function showErrorModal(_properties) {
   var $genModal = $('#fwd-gen-modal');
   var properties = $.isEmptyObject(_properties) ? {header: 'Error', body: 'Default Body Content', footer: 'OK'} : _properties;
   
   // Create the modal html if it's not been initialize
   if (!$genModal.length) {
      $genModal = $(['<div id="fwd-gen-modal" class="modal fade fwd-generic-modal" role="dialog">',
                        '<div class="modal-dialog">',
                           '<div class="modal-content">',
                              '<div class="modal-header">',
                                 '<button type="button" class="close" data-dismiss="modal">&times;</button>',
                                 '<h4 class="title text-center">Error</h4>',
                              '</div>',
                              '<div class="modal-body">',
                                 '<p class="content">Error</p>',
                              '</div>',
                              '<div class="modal-footer">',
                                 '<button type="button" class="btn-block btn-footer" id="et-btn-change-date" data-dismiss="modal">OK</button>',
                              '</div>',
                           '</div>',
                        '</div>',
                     '</div>'
                   ].join(''));
       
      // Append into body 
      $genModal.appendTo('body');
   }
   
   // Append title text
   if (properties.header) {
      $genModal.find('.title')
               .text(properties.header);
   }
   
   // Append body content
   if (properties.body) {
      $genModal.find('.content')
               .text(properties.body);
   }
   
   // Append footer button label
   if (properties.footer) {
      $genModal.find('.btn-footer')
               .text(properties.footer);
   }
   
   $genModal.modal('show');
}

/**
 * Add an error message to specific element
 *
 * @param string|jQuery _element - required
 * @param string _errorMsg - required
 * @param string _errorClassSelector - optional; omit the "." part of a class selector
 */
function addFormFieldError(_element, _errorMsg, _errorClassSelector) {
   if (!arguments.length) {
      throw ('Parameters _element and _errorMsg are required.');
   }
   
   var $element = (typeof _element === 'string') ? $(_element) : _element;
   
   if (!$element.length) {
      throw ('The _element parameter must be a valid selector or a valid jQuery Object');
   }
   
   var errorMsg = _errorMsg || '';
   var errorClassSelector = _errorClassSelector || '';
   
   $element.append('<small class="help-block dynamic-err-msg ' + errorClassSelector + '">' + errorMsg + '</small>');
};

/**
 * Remove an error message or all error message from specific element
 *
 * @param string|jQuery _element - required
 * @param string _errorClassSelector - optional; omit the "." part of a class selector
 * @param boolean _removeAll - optional
 */
function removeFormFieldError(_element, _errorClassSelector, _removeAll) {
   if (!arguments.length) {
      throw ('Parameter _element is required.');
   }
   
   var $element = (typeof _element === 'string') ? $(_element) : _element;
   
   if (!$element.length) {
      throw ('The _element parameter must be a valid selector or a valid jQuery Object');
   }
   
   var removeAll = _removeAll || false;
   
   if (removeAll) {
      $element.find('.dynamic-err-msg')
               .remove();
   } else if ((arguments.length === 1) || ((arguments.length > 1) && !arguments[1])) { 
      $element.find('.dynamic-err-msg')
               .remove();
   } else {
      $element.find('.' + _errorClassSelector)
               .remove();
   }
}

/**
 * Function helper to determine the IE version
 * 
 * @return number
 */
function msieversion() { 
	var ua = window.navigator.userAgent;
	var msie = ua.indexOf ( "MSIE " );
	var trident = ua.indexOf('Trident/'); // IE11
	var edge = ua.indexOf('Edge/'); // IE12

   //if ( msie > 0 )      // If Internet Explorer, return version number
   //   return parseInt (ua.substring (msie+5, ua.indexOf (".", msie )))
   //else                 // If another browser, return 0
   //   return 0

	if (msie > 0) {
        // IE 10 or older => return version number
        return parseInt(ua.substring(msie + 5, ua.indexOf('.', msie)), 10);
    }

    if (trident > 0) {
        // IE 11 => return version number
        var rv = ua.indexOf('rv:');
        return parseInt(ua.substring(rv + 3, ua.indexOf('.', rv)), 10);
    }

    if (edge > 0) {
       // IE 12 => return version number
       return parseInt(ua.substring(edge + 5, ua.indexOf('.', edge)), 10);
    }

    return 0;
}

function getOccupation(value,language) {
	$.get(contextPath+'/ajax/savie/application/getOccupation',
	{ 
		value : value,
		language : language
	},
	function(data) {
		$("#savieEmploymentBean\\.occupation").empty();
		if(data != null){
			for(var i = 0; i < data.length; i++) {
				$("#savieEmploymentBean\\.occupation").append("<option value='"+data[i].itemCode+"-"+data[i].itemDesc+"'>"+data[i].itemDesc+"</option>");
			}
		}
	})
	.fail(function(data) {
		console.log("data error:"+data.length);
	});
}
$('#et-select-plan-go-homepage').on('click', function(e) {
	window.location.href= contextPath+'/'+language+'/term-life-insurance';
});

/**
* Reset calculated amount when the following input value changed:
* Gender /DOB/ smoker/ insurer amt 
* Author: Rex So
*/
function resetCalculatedAmt(){
	var actPromo = $('#et-act-promo-amount');
	var default_period_text = actPromo.find('.et-po-amount-label').data('et-default-period');
  
	$('#et-dis-promo-amount').addClass('hidden');
	$("#etaspd-insured-amount").html('HK$ ');
	$("#etaspd-monthly-premium").html('HK$ ');

	$('#et-month-amount').html('');
	$('#et-day-amount').html('');

	$('#et-month-dis-amount').html('');
 	$('#et-day-dis-amount').html('');

	actPromo.find('.top .et-po-amount-label').text(default_period_text);

	//disable proceed button
	toggleElement(false, 'et-brn-proceed-to-application');
	//hide Application section
	$('#et-application-wrapper').addClass('hide-element');
}

/**
* Generic function to display calculated amount 
* e.g. setCalculatedAmt(true, 12000000, 630.12, 21.20, 540.70, 18.02);
* Author: Rex So
*/
function setCalculatedAmt(bDiscount, insuredAmt, oriMonthlyAmt, oriDailyAmt, disMonthlyAmt, disDailyAmt){
	var actPromo = $('#et-act-promo-amount');
	var disPromo = $('#et-dis-promo-amount');
	var default_period_text = actPromo.find('.et-po-amount-label').data('et-default-period');
	var discount_period_text = actPromo.find('.et-po-amount-label').data('et-discount-period');
  
	var modInsuredAmount = parseFloat(insuredAmt).toFixed(2);
	var modMonthlyPremium = parseFloat(oriMonthlyAmt).toFixed(2);
	$("#et-month-amount").html(parseFloat(oriMonthlyAmt).toFixed(2));
	$("#et-day-amount").html(parseFloat(oriDailyAmt).toFixed(2));
	$("#etaspd-insured-amount").html('HK$ ' + modInsuredAmount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
	$("#etaspd-monthly-premium").html('HK$ ' + modMonthlyPremium.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
  
	if(bDiscount){
		$("#et-month-dis-amount").html(parseFloat(disMonthlyAmt).toFixed(2));
		$("#et-day-dis-amount").html(parseFloat(disDailyAmt).toFixed(2));
		actPromo.find('.top .et-po-amount-label').text(discount_period_text);
		$('#et-dis-promo-amount').removeClass('hidden');
 	} else{
 		actPromo.find('.top .et-po-amount-label').text(default_period_text);
 		$('#et-dis-promo-amount').addClass('hidden');
 	}

 	//enable proceed button
	toggleElement(true, 'et-brn-proceed-to-application');
	//show Application section
	$('#et-application-wrapper').removeClass('hide-element');
}

/**
* Enable/Disable html input element
* Author: Rex So
*/
function toggleElement(bEnable, id){
	if( bEnable ){
		$('#' + id ).removeAttr('disabled');
	} else{
		$('#' + id ).attr('disabled','disabled');
	}
}

/**
* Show/Hide html element
* Author: Rex So
*/
function showElement(bShow, id){
	if( bShow ){
		$('#' + id ).removeClass('hide-element');
	} else {
		$('#' + id ).addClass('hide-element');
	}
}

/**
* Batch show/hide Elite term section
* parameters: step
* 0 = Before we start
* 1 = About yourself
* 2 = Plan option
* 3 = Medical Declarations
* 4 = Application Form
* 5 = Employment Status
* 6 = Beneficiary
* 7 = Declarations	
* 8 = Summary
* 9 = Signature
* Author: Rex So
*/
function backToStep(step){
	switch(step){
		case 0: showAppSection(1,0,0,0,0,0,0,0,0,0); break;
		case 1: showAppSection(1,1,0,0,0,0,0,0,0,0); break;
		case 2: showAppSection(1,1,1,0,0,0,0,0,0,0); break;
		case 3: showAppSection(0,0,0,1,0,0,0,0,0,0); break;
		case 4: showAppSection(0,0,0,1,1,0,0,0,0,0); break;
		case 5: showAppSection(0,0,0,1,1,1,0,0,0,0); break;
		case 6: showAppSection(0,0,0,1,1,1,1,0,0,0); break;
		case 7: showAppSection(0,0,0,1,1,1,1,1,0,0); break;
		case 8: showAppSection(0,0,0,1,1,1,1,1,1,0); break;
		case 9: showAppSection(0,0,0,1,1,1,1,1,1,1); break;
		default: showAppSection(1,0,0,0,0,0,0,0,0,0); break;
	}
}

/**
* Show/Hide Elite term section
* parameters: Boolean to display sections
* 0 = Before we start
* 1 = About yourself
* 2 = Plan option
* 3 = Medical Declarations
* 4 = Application Form
* 5 = Employment Status
* 6 = Beneficiary
* 7 = Declarations	
* 8 = Summary
* 9 = Signature
* Author: Rex So
*/
function showAppSection(b0,b1,b2,b3,b4,b5,b6,b7,b8,b9){
	var sectionName = { 
		0: 'et-select-plan-section'
		,1: 'et-about-yoursel-section'
		,2: 'et-plan-option-section'
		,3: 'et-medical-declaration'
		,4: 'et-application-info-section'
		,5: 'et-employment-info-section'
		,6: 'et-beneficiary-info-section'
		,7: 'et-application-second-section'
		,8: 'et-application-third-section'
		,9: 'et-application-fourth-section'
	}

	for( var i=0; i<arguments.length; i++){
		if(arguments[i]){
			$('#' + sectionName[i]).removeClass('hide-element');
		} else {
			$('#' + sectionName[i]).addClass('hide-element');
		}
	}
}


/**
* On Document Ready
* Apply generic scripts
*
*/

$(document).ready(function(){

	/**
	*  Select List Default color
	*  Assume the default option is disabled
	*/
	$('select').on('change', function(){
		if( $(this).val() ){
			$(this).css('color', '#000');
		} else {
			$(this).css('color', '#ccc');
		}
	})
});
