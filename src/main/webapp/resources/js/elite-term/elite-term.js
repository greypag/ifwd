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
    	    error:function(){     
    	    	console.log('error');     
    	    },     
    	    success:function(data){
    	    	if(data.errMsgs == null){
    	    		console.log("signature success");
    	    		window.location.href= contextPath+'/'+language+'/elite-term/'+selectPlanNextPageFlow;
    			}
    			else{
    				console.log("data error");
    			}
    	    }  
    	});
	}
});

$('#et-payment-complete-btn').on('click', function(e) {
	window.location.href= contextPath+'/'+language+'/elite-term/'+paymentNextPageFlow;
});

$('#et-upload-doc-submit-btn').on('click', function(e) {
	window.location.href= contextPath+'/'+language+'/elite-term/'+documentUploadNextPageFlow;
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

