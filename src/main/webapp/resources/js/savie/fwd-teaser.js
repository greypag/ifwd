$(function() {
	$('#teaserSurvery').on('hidden.bs.modal', function (e) {
		if (document.URL.indexOf('savings-insurance/') > -1) {
			window.location.href = 'email-submitted';
		} else {
			window.location.href = 'savings-insurance/email-submitted';
		}
	})
	
	$('#teaser-mmodal-submit').click(function(e){
		e.preventDefault();
		if (document.URL.indexOf('savings-insurance/') > -1) {
			window.location.href = 'email-submitted';
		} else {
			window.location.href = 'savings-insurance/email-submitted';
		}
	});
	
	$('#teaser-sign-up-btn').click(function(e){
		e.preventDefault();
		var checkPics = $("#pics-check").is(":checked");
		var checkTc = $("#tc-check").is(":checked");		
		var email = $.trim($('#teaserEmail').val());
		var phone = $('#teaserPhoneNo').val().length;
		var isErrorFlag = false;
		
		// Email is required
		if (email == "") {
			$('#emailAddrsMessage').html(getBundle(getBundleLanguage, "savie.interestgather.signupform.email.notNull.message")).removeClass('hideSpan');
			isErrorFlag = true;
		} else {
			$('#emailAddrsMessage').addClass('hideSpan');
			
			// Email is not valid
			if (email != "" && !validateEmail(email)) {
				$('#emailAddrsMessage').html(getBundle(getBundleLanguage, "savie.interestgather.signupform.email.invalid.message")).removeClass('hideSpan');
				isErrorFlag = true;
			} else {
				$('#emailAddrsMessage').addClass('hideSpan');
				
				// Email is duplicate
				if (email != "" && duplicateEmail(email)) {
					$('#emailAddrsMessage').html(getBundle(getBundleLanguage, "savie.interestgather.signupform.email.used.message")).removeClass('hideSpan');
					isErrorFlag = true;
				} else {
					$('#emailAddrsMessage').addClass('hideSpan');
				}
			}
		}
		
		// Phone is not empty and has 8 characters
		if (phone > 0 && phone < 8) {
			$('#phoneErrMsg').html(getBundle(getBundleLanguage, "savie.interestgather.signupform.phoneNo.invalid.message")).removeClass('hideSpan');
			isErrorFlag = true;
		} else {
			$('#phoneErrMsg').addClass('hideSpan');

			var firstNum = $('#teaserPhoneNo').val().substr(0, 1);
			switch(firstNum) {
				case "1": case "2": case "3": case "4": case "7": case "0":
					$('#phoneErrMsg').html(getBundle(getBundleLanguage, "savie.interestgather.signupform.phoneNo.invalid.message")).removeClass('hideSpan');
					isErrorFlag = true;
			}
		}
		
		// Agreed terms and condition
		if (!checkPics && !checkTc){
			$('#checkboxErrorMessage').html(getBundle(getBundleLanguage, "savie.interestgather.signupform.PICSnTnC.message")).removeClass('hideSpan');
			isErrorFlag = true;
		} else if (!checkPics) {
			$('#checkboxErrorMessage').html(getBundle(getBundleLanguage, "savie.interestgather.signupform.personal.collection.message")).removeClass('hideSpan');
			isErrorFlag = true;
		} else if (!checkTc) {
			$('#checkboxErrorMessage').html(getBundle(getBundleLanguage, "savie.interestgather.signupform.term.conditions.message")).removeClass('hideSpan');
			isErrorFlag = true;
		} else {
			$('#checkboxErrorMessage').addClass('hideSpan');
		}

		if (!isErrorFlag) {
			$('#emailAddrsMessage').addClass('hideSpan');
			$('#checkboxErrorMessage').addClass('hideSpan');
			$('#phoneErrMsg').addClass('hideSpan');
			sendStep1Email();
		}

	});

	$("#teaserPhoneNo").keypress(function(event) {
        return /\d/.test(String.fromCharCode(event.keyCode));
    });


});

function maxLengthReview(object) {
	if (object.value.length > object.maxLength)
	      object.value = object.value.slice(0, object.maxLength)
}

function duplicateEmail(){
	var email = $('#teaserEmail').val();
	if(email == "dup@gmail.com"){
		return true;
	}else{
		return false;
	}
	return false;
	
}

function validateEmail(email) {
    var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
    return re.test(email);
}


function sendStep1Email() {
	var teaserEmail = $("#teaserEmail").val();
	var teaserPhoneNo = $("#teaserPhoneNo").val();
	sendlead(teaserEmail,teaserPhoneNo,"","1");
}

function sendStep2Email() {
	var teaserEmail = $("#teaserEmail").val();
	var answer1 = $("#amountToSave").val();
	if(answer1 != '' && answer1 != null){
		sendlead(teaserEmail,"",answer1,"2");
	}
}

function sendMessagesEmail(email,attachment) {
	$.ajax({     
	    url:context+'/ajax/savie/messages/email',     
	    type:'post',     
	    data:{    
	    	"to": email,
	        "attachment":attachment
   		},     
	    error:function(){       
	    },     
	    success:function(data){  
	    	if(data.errMsgs != null){
		    	alert(data.errMsgs); 
	    	}      
	    }  
	});
}

function sendlead(email,mobileNo,answer1,step) {
	if( affiliate == null){
		affiliate = "";
	}
	$.ajax({     
	    url: context+'/ajax/savie/interestGather/post',     
	    type:'post',     
	    data:{    
	    	"email": email,
	    	"mobileNo":mobileNo,
	        "answer1": answer1,
	        "affiliate":affiliate,
	        "step": step    
   		},        
	    error:function(){
	    },     
	    success:function(data){ 
	    	if(data.errMsgs == null ){
	    		if(step == '1'){
	    			var attachment = "";
	    			sendMessagesEmail(email,attachment); 
	    			$('#teaserSurvery').modal('show');
	    		}
	    	}else{
		    	if(data.errMsgs == 'Email already registered'){
		    		$('#emailAddrsMessage').html(getBundle(getBundleLanguage, "savie.interestgather.signupform.email.used.message")).removeClass('hideSpan');
		    	}else if(data.errMsgs == getBundle(getBundleLanguage, "savie.interestgather.signupform.phoneNo.non8digit.message")){
		    		$('#phoneErrMsg').html(getBundle(getBundleLanguage, "savie.interestgather.signupform.phoneNo.non8digit.message")).removeClass('hideSpan');
		    	}else{
		    		$('#checkboxErrorMessage').html(data.errMsgs).removeClass('hideSpan');
		    	}
	    	}     
	    }  
	});
}

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