var contextPath = context;

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
	var dob = $('#et-select-plan-date-input').val();
	var gender = $('input[name="et-gender"]:checked ').val();
	var smoke = $('input[name="et-smoker"]:checked ').val();
	var insuredAmount = $('#R2').val();
	var referralCode = $('#et-promocode').val();
	
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
			if(data.errMsgs == null){
				$("#et-amount").html(data.monthlyPremium);
			}
			else{
				console.log("data error");
			}
		})
		.fail(function(data) {
		});
	}
}

$('#et-signature-proceed-btn').on('click', function(e) {
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
			    	console.log("签名数据过大");
				}else{
					$.ajax({     
			    	    url:contextPath+'/ajax/eliteTerm/uploadSignature',     
			    	    type:'post',     
			    	    data:{    
			    	    	"image" : datapair[1],
			    	    	"policyNo" : data.policyNo
			       		},     
			    	    success:function(data){
			    	    	if(data.errMsgs == null){
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
	
	if(agentEmail ==null){
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

$('#et-cannot-apply-btn').on('click', function(e) {
	var name = $('#name').val();
	var email = $('#email').val();
	var mobile = $('#tel').val();
	var preferredDay = "2015-09-10"//$('#day').val();
	var preferredTimeSlot = "18:00-20:00"//$('#time').val();
	var enquiryType = $('#enquiry').val();
	var channel = "channel1";
	var product = "eliteterm";
	
	if(name ==null){
		console.log("data error");
	}
	else{
		$.get(contextPath+'/ajax/eliteTerm/contactCs',
		{ 
			name : name,
			email : email,
			mobile : mobile,
			preferredDay : preferredDay,
			preferredTimeSlot : preferredTimeSlot,
			enquiryType : enquiryType,
			channel : channel,
			product : product
		},
		function(data) {
			if(data.errMsgs == null){
				$('#cannot-apply-modal').modal('hide');
				$('#goHomepageModal').modal('show');
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
        mode: 'both',
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
   var ua = window.navigator.userAgent
   var msie = ua.indexOf ( "MSIE " )

   if ( msie > 0 )      // If Internet Explorer, return version number
      return parseInt (ua.substring (msie+5, ua.indexOf (".", msie )))
   else                 // If another browser, return 0
      return 0
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
