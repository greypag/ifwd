function checkChineseCharEmail(e) {
	if(((e.keyCode >= 48 && e.keyCode<=57) || (e.keyCode >= 65  && e.keyCode<=90) || e.keyCode==64  || e.keyCode ==45 || e.keyCode == 95 || e.keyCode == 46)){
		return true;
	}else{
		return false;
	}
}
	
function isNumberKey(evt){
	/*var charCode = (evt.which) ? evt.which : event.keyCode
	if (charCode > 31 && (charCode < 48 || charCode > 57))
		return false;
	return true;*/
	
	var charCode = (evt.which) ? evt.which : event.keyCode;
	console.log(charCode);
	// Allow: delete, backspace, tab, escape, enter
	if ($.inArray(charCode, [46, 8, 9, 27, 13, 110]) !== -1 ||
		 // Allow: Ctrl+A
		(charCode == 65 && evt.ctrlKey === true) ||
		 // Allow: Ctrl+C
		(charCode == 67 && evt.ctrlKey === true) ||
		 // Allow: Ctrl+X
		(charCode == 88 && evt.ctrlKey === true) ||
		 // Allow: home, end, left, right
		(charCode >= 35 && evt.keyCode <= 39)) {
			 // let it happen, don't do anything
			 return;
	}
	// Ensure that it is a number and stop the keypress
	if ((evt.shiftKey || (charCode < 48 || charCode > 57)) && (charCode < 96 || charCode > 105)) {
		evt.preventDefault();
	}
}   
	
	
$(function() {
	
	if(lang=='tc'){
		//Chinese
		$('#teaser-banner-mobile-ch').removeClass('hidden');
		$('#teaser-banner-desktop-ch').removeClass('hidden');
		$('#teaser-banner-mobile-en').addClass('hidden');
		$('#teaser-banner-desktop-en').addClass('hidden');
		$('#teaserEmail').removeClass('email');
		$('#teaserEmail').addClass('email-ch');
		$('#hunger-selling-banner').removeClass('hunger-selling');
		$('#hunger-selling-banner').addClass('hunger-selling-ch');
		$('#banner-text-chinese').removeClass('hidden');
		
		if($('#banner-text-english').hasClass('hidden')){
			//do nothing
		}else{
			$('#banner-text-english').addClass('hidden');
		}
		
	}else{
		//English
		$('#teaser-banner-mobile-ch').addClass('hidden');
		$('#teaser-banner-desktop-ch').addClass('hidden');
		$('#teaser-banner-mobile-en').removeClass('hidden');
		$('#teaser-banner-desktop-en').removeClass('hidden');
		$('#teaserEmail').addClass('email');
		$('#teaserEmail').removeClass('email-ch');
		$('#hunger-selling-banner').removeClass('hunger-selling-ch');
		$('#hunger-selling-banner').addClass('hunger-selling');
		$('#banner-text-english').removeClass('hidden');
		
		if($('#banner-text-chinese').hasClass('hidden')){
			//do nothing
		}else{
			$('#banner-text-chinese').addClass('hidden');
		}
	}
	
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
		var isPlaceholder = true;
		var emailIe = ($.trim($('#teaserEmail').val())) =="Please enter your email address"? "":$.trim($('#teaserEmail').val());
		// Email is required
		if ((email == "") || (emailIe == "")) {
			$('#emailAddrsMessage').html(getBundle(getBundleLanguage, "savie.interestgather.signupform.email.notNull.message")).removeClass('hideSpan');
			isErrorFlag = true;
		} else {
			$('#emailAddrsMessage').addClass('hideSpan');
			
			// Email is not valid
			if (email != "" && !checkEmail(email)) {
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
		if ($('#teaserPhoneNo').val() == $('#teaserPhoneNo').attr('placeholder')) {
			isPlaceholder=false;
			
		} else if (phone > 0 && phone < 8) {
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
			if(!isPlaceholder){
				$('#teaserPhoneNo').val('')
			}
			sendStep1Email();
		}
	});

	/*$("#teaserPhoneNo").keypress(function(event) {
        return /\d/.test(String.fromCharCode(event.keyCode));
    });*/


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

function checkEmail(email) {
    var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
    return re.test(email);
}


function sendStep1Email() {
	var teaserEmail = $("#teaserEmail").val();
	var teaserPhoneNo = $("#teaserPhoneNo").val();
	sendlead(teaserEmail,teaserPhoneNo,"","1",'ADUOIHWNJSKLNC');
}

function sendStep2Email() {
	var teaserEmail = $("#teaserEmail").val();
	var answer1 = $("#amountToSave").val();
	if(answer1 != '' && answer1 != null){
		sendlead(teaserEmail,"",answer1,"2","");
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

function sendlead(email,mobileNo,answer1,step,captcha) {
	if( affiliate == null){
		affiliate = "";
	}
	$('#teaser-sign-up-btn').prop('disabled', true);
	$.ajax({     
	    url: context+'/ajax/savie/interestGather/post',     
	    type:'post',     
	    data:{    
	    	"email": email,
	    	"mobileNo":mobileNo,
	        "answer1": answer1,
	        "affiliate":affiliate,
	        "step": step,
	        "captcha": captcha
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
		    	}else if(data.errMsgs == "captcha error"){
		    		$('#checkboxErrorMessage').html(getBundle(getBundleLanguage, "form.captcha.empty.message")).removeClass('hideSpan');
		    	}else{
		    		$('#checkboxErrorMessage').html(data.errMsgs).removeClass('hideSpan');
		    	}
		    	if(!('placeholder' in document.createElement('input')) && $('#teaserPhoneNo').val() == '') {
		    		$('#teaserPhoneNo').val($('#teaserPhoneNo').attr('placeholder'))
		    	}
	    	}
			$('#teaser-sign-up-btn').prop('disabled', false);
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

function validUser(formID)
{
	var flag = true;
	var userName = $("#"+formID+" #headerUserName").val();//document.getElementById("headerUserName").value;
	var password = $("#"+formID+" #headerPassword").val();//document.getElementById("headerPassword").value;
	//document.getElementById("errUserName").innerHTML = "";
	//document.getElementById("errPass").innerHTML = "";
	$("#"+formID+" #errUserName").html("");
	$("#"+formID+" #errPass").html("");

	if (password.trim() == "")
	{    	
		$("#"+formID+" #headerPassword").addClass("invalid-field");
		$("#"+formID+" #errPass").html(getBundle(getBundleLanguage, "user.password.notNull.message"));
		$("#"+formID+" #errPass").attr("style","color: red;");
		flag = false;
	} 
	if (userName.trim() == "") {
		$("#"+formID+" #headerUserName").addClass("invalid-field");
		$("#"+formID+" #errUserName").html(getBundle(getBundleLanguage, "user.username.empty.message"));
		$("#"+formID+" #errUserName").attr("style","color: red;");
		flag = false;
	}
	return flag;
}

function validationUsername(evt){	
	evt = (evt) ? evt : event;
	var eCode = evt.keyCode;
	var charCode = (evt.charCode) ? evt.charCode : ((evt.keyCode) ? evt.keyCode : ((evt.which) ? evt.which : 0));
	var keychar = String.fromCharCode(charCode)
	if ( (charCode >=48 && charCode <=57) || (charCode >= 65 && charCode <= 90) || (charCode >= 97 && charCode <= 122) || charCode == 127 || charCode == 8 
			|| (evt.charCode == 0 && evt.keyCode==37) || (evt.charCode == 0 && evt.keyCode==46) || (evt.charCode == 0  && evt.keyCode==39) 
			|| charCode == 45 || charCode == 95 || charCode == 46 || charCode == 64) {
		return true;
	}
	return false;
}

function getTimeSlot(){
	if($("#csCenter").val().trim() != "" && $("#datepicker").val().trim() != ""){
		var csCenter = $("#centre").val();
		var perferredDate = $("#preferred-date").val();
		$.ajax({     
		    url:context+'/ajax/savie/savings-insurance/getTimeSlot',     
		    type:'post',     
		    data:{    
		    	"csCenter": csCenter,
		        "perferredDate":perferredDate
	   		},     
		    error:function(){       
		    },     
		    success:function(data){
		    	if(data.timeSlots != null){
		    		$("#perferredTime option").remove(); 
		    		$("#perferredTime").prepend("<option value=''>请选择</option>");
			    	for(var i=0; i<data.timeSlots.length; i++) {
			    		if(data.timeSlots[i].manPower>0) {
			    			$("#perferredTime").append("<option value='" + data.timeSlots[i].timeSlot + "'>" + data.timeSlots[i].timeSlot + "</option>");
			    		}
			    	}
		    	}else {
		    		$('#pickAnotherCentre').modal('show');
		    	}
		    }  
		});
	}
}
