$(function() {
	$('#teaserSurvery').on('hidden.bs.modal', function (e) {
		window.location.href = 'email-submitted';
	})
	
	$('#teaser-mmodal-submit').click(function(e){
		e.preventDefault();
		window.location.href = 'email-submitted';
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
			$('#emailAddrsMessage').html("Please input email.").removeClass('hideSpan');
			isErrorFlag = true;
		} else {
			$('#emailAddrsMessage').addClass('hideSpan');
			
			// Email is not valid
			if (email != "" && !validateEmail(email)) {
				$('#emailAddrsMessage').html("Invalid email address").removeClass('hideSpan');
				isErrorFlag = true;
			} else {
				$('#emailAddrsMessage').addClass('hideSpan');
				
				// Email is duplicate
				if (email != "" && duplicateEmail(email)) {
					$('#emailAddrsMessage').html("This email address is already in use. Try another one?").removeClass('hideSpan');
					isErrorFlag = true;
				} else {
					$('#emailAddrsMessage').addClass('hideSpan');
				}
			}
		}
		
		// Phone is not empty and has 8 characters
		if (phone > 0 && phone < 8) {
			$('#phoneErrMsg').html("This telephone no. is already in use. Try another one?").removeClass('hideSpan');
			isErrorFlag = true;
		} else {
			$('#phoneErrMsg').addClass('hideSpan');

			var firstNum = $('#teaserPhoneNo').val().substr(0, 1);
			switch(firstNum) {
				case "1": case "4": case "6": case "8": case "0":
					$('#phoneErrMsg').html("Invalid telephone number.").removeClass('hideSpan');
					isErrorFlag = true;
			}
		}
		
		// Agreed terms and condition
		if (!checkTc || !checkPics) {
			$('#checkboxErrorMessage').html("In order to continue, you must agree to the Terms and Conditions.").removeClass('hideSpan');
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
		    		$('#emailAddrsMessage').html("This e-mail address is already in use. Try another?").removeClass('hideSpan');
		    	}else if(data.errMsgs == '[Please enter an 8-digit Mobile No.]'){
		    		$('#phoneErrMsg').html("Please enter an 8-digit Mobile No.").removeClass('hideSpan');
		    	}else{
		    		$('#checkboxErrorMessage').html(data.errMsgs).removeClass('hideSpan');
		    	}
	    	}     
	    }  
	});
}

