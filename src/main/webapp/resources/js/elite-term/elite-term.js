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
			    $('#beneficiaryInfoForm[0]').serialize()+"&"+
			    $('#beneficiaryInfoForm[1]').serialize()+"&"+
			    $('#beneficiaryInfoForm[2]').serialize();
	$.ajax({
        type: "POST",
        url:contextPath+'/ajax/eliteTerm/createEliteTermPolicy',
        data: formdata,
        success:function(data){
			if(data.errMsgs == null || data.errMsgs != null){
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
			    	    	"image" : datapair[1] 
			       		},     
			    	    success:function(data){
			    	    	if(data.errMsgs == null){
			    	    		console.log("signature success");
			    	    		window.location.href= contextPath+'/'+language+'/elite-term/'+selectPlanNextPageFlow;
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

$('#et-payment-complete-btn').on('click', function(e) {
	var creditCaredNo = $('#card-num').val();
	var expiryDate = "0319"//$('#month').val()+$('#year').val();
	var cardHolderName = $('#card-name').val(); 
	var policyNo = "1410781";
	
	if(creditCaredNo ==null || expiryDate ==null || cardHolderName ==null || policyNo ==null){
		console.log("data error");
	}
	else{
		$.get(contextPath+'/ajax/eliteTerm/finalizeEliteTermPolicy',
		{ 
			creditCaredNo : creditCaredNo,
			expiryDate: expiryDate,
			cardHolderName: cardHolderName,
			policyNo: policyNo
		},
		function(data) {
			if(data.errMsgs == null){
				window.location.href= contextPath+'/'+language+'/elite-term/'+paymentNextPageFlow;
			}
			else{
				console.log("data error");
			}
		})
		.fail(function(data) {
		});
	}
});

$('#et-upload-doc-submit-btn').on('click', function(e) {
	window.location.href= contextPath+'/'+language+'/elite-term/'+documentUploadNextPageFlow;
});

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
   if(this.value == "M"){
	   $("#pi-male-now").attr("checked",true);
	   $("#pi-female-now").attr("checked",false);
	   $("#pi-female-now").removeAttr("checked");
   }
   else{
	   $("#pi-male-now").attr("checked",false);
	   $("#pi-male-now").removeAttr("checked");
	   $("#pi-female-now").attr("checked",true);
   }
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

