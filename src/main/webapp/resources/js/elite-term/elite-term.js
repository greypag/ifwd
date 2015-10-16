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
			    $('#beneficiaryInfoFormF').serialize()+"&"+
			    $('#beneficiaryInfoFormS').serialize()+"&"+
			    $('#beneficiaryInfoFormT').serialize();
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

$('#et-upload-doc-submit-btn').on('click', function(e) {
	var uploadNow = $("input[name='upload-doc']:checked").val();
	var url = contextPath+'/'+language+'/elite-term/'+documentUploadNextPageFlow;
	if(uploadNow == 'upload-now'){
		var display = $('.passport-holder').css("display");
		var hkidflage = $('#hkid-copy-progress').css("display");
		var passportflage = $('#passport-copy-progress').css("display");
		var proofflage = $('#proof-of-address-progress').css("display");
		if(hkidflage == 'none' || proofflage == 'none'){
			return false;
		}
		if(display != 'none' && passportflage == 'none'){
//			url = url + "?passportflage=false";
			return false;
		}else{
//			url = url + "?passportflage=true";
		}
	}
	window.location.href= url;
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

function getOccupation(value,language) {
	$.get(contextPath+'/ajax/savie/application/getOccupation',
	{ 
		value : value,
		language : language
	},
	function(data) {
		$("#savieEmploymentBeanoccupation").empty();
		if(data != null){
			for(var i = 0; i < data.length; i++) {
				$("#savieEmploymentBeanoccupation").append("<option value='"+data[i].itemCode+"-"+data[i].itemDesc+"'>"+data[i].itemDesc+"</option>");
			}
		}
	})
	.fail(function(data) {
		alert(data.length);
	});
}
$('#et-select-plan-go-homepage').on('click', function(e) {
	window.location.href= contextPath+'/'+language+'/elite-term/landing';
});
