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

	$('#signup-btn').click(function(e){
		e.preventDefault();
		var checkPics = $("#personal-information-statement-signup").is(":checked");
		var checkTc = $("#terms-condition-statement-signup").is(":checked");		
		var email = $.trim($('#teaserEmail').val());
		var phone = $('#teaserPhoneNo').val().length;
		var isErrorFlag = false;
		var isPlaceholder = true;
		var emailIe = ($.trim($('#teaserEmail').val())) =="Please enter your email address"? "":$.trim($('#teaserEmail').val());
		// Email is required
		if ((email == "") || (emailIe == "")) {
			$('#emailErrMsg').html(getBundle(getBundleLanguage, "savie.interestgather.signupform.email.notNull.message"));
			document.getElementById("emailErrMsg").style.visibility="visible";
			isErrorFlag = true;
		} else {
			document.getElementById("emailErrMsg").style.visibility="hidden";
			
			// Email is not valid
			if (email != "" && !checkEmail(email)) {
				$('#emailErrMsg').html(getBundle(getBundleLanguage, "savie.interestgather.signupform.email.invalid.message"));
				document.getElementById("emailErrMsg").style.visibility="visible";
				isErrorFlag = true;
			} else {
				document.getElementById("emailErrMsg").style.visibility="hidden";
				
				// Email is duplicate
				if (email != "" && duplicateEmail(email)) {
					$('#emailErrMsg').html(getBundle(getBundleLanguage, "savie.interestgather.signupform.email.used.message"));
					document.getElementById("emailErrMsg").style.visibility="visible";
					isErrorFlag = true;
				} else {
					document.getElementById("emailErrMsg").style.visibility="hidden";
				}
			}
		}
		
		// Phone is not empty and has 8 characters
		if ($('#teaserPhoneNo').val() == $('#teaserPhoneNo').attr('placeholder')) {
			isPlaceholder=false;
			
		} else if (phone > 0 && phone < 8) {
			$('#phoneErrMsg').html(getBundle(getBundleLanguage, "savie.interestgather.signupform.phoneNo.invalid.message"));
			document.getElementById("phoneErrMsg").style.visibility="visible";
			isErrorFlag = true;
		} else {
			document.getElementById("phoneErrMsg").style.visibility="hidden";

			var firstNum = $('#teaserPhoneNo').val().substr(0, 1);
			switch(firstNum) {
				case "1": case "2": case "3": case "4": case "7": case "0":
					$('#phoneErrMsg').html(getBundle(getBundleLanguage, "savie.interestgather.signupform.phoneNo.invalid.message"));
					document.getElementById("phoneErrMsg").style.visibility="visible";
					isErrorFlag = true;
			}
		}
		
		// Agreed terms and condition
		if (!checkPics && !checkTc){
			$('#checkboxErrorMessage').html(getBundle(getBundleLanguage, "savie.interestgather.signupform.PICSnTnC.message"));
			document.getElementById("checkboxErrorMessage").style.visibility="visible";
			isErrorFlag = true;
		} else if (!checkPics) {
			$('#checkboxErrorMessage').html(getBundle(getBundleLanguage, "savie.interestgather.signupform.personal.collection.message"));
			document.getElementById("checkboxErrorMessage").style.visibility="visible";
			isErrorFlag = true;
		} else if (!checkTc) {
			$('#checkboxErrorMessage').html(getBundle(getBundleLanguage, "savie.interestgather.signupform.term.conditions.message"));
			document.getElementById("checkboxErrorMessage").style.visibility="visible";
			isErrorFlag = true;
		} else {
			document.getElementById("checkboxErrorMessage").style.visibility="hidden";
		}

		if (!isErrorFlag) {
			document.getElementById("emailErrMsg").style.visibility="hidden";
			document.getElementById("phoneErrMsg").style.visibility="hidden";
			document.getElementById("checkboxErrorMessage").style.visibility="hidden";
			if(!isPlaceholder){
				$('#teaserPhoneNo').val('')
			}
			sendStep1Emailbyo2o();
		}
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

function checkEmail(email) {
    var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
    return re.test(email);
}


function sendStep1Email() {
	var teaserEmail = $("#teaserEmail").val();
	var teaserPhoneNo = $("#teaserPhoneNo").val();
	sendlead(teaserEmail,teaserPhoneNo,"","1",'ADUOIHWNJSKLNC');
}

function sendStep1Emailbyo2o() {
	var teaserEmail = $("#teaserEmail").val();
	var teaserPhoneNo = $("#teaserPhoneNo").val();
	sendleadbyo2o(teaserEmail,teaserPhoneNo,"","1",'ADUOIHWNJSKLNC');
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
		    	console.log(data.errMsgs); 
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

function sendleadbyo2o(email,mobileNo,answer1,step,captcha) {
	if( affiliate == null){
		affiliate = "";
	}
	$('#signup-btn').prop('disabled', true);
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
	    	if(data.errMsgs == null){
	    		if(step == '1'){
	    			var attachment = "";
	    			sendMessagesEmail(email,attachment);
	    			$('#signup-now-modal').modal('hide');
	    			$('#teaserSurvery').modal('show');
	    		}
	    	}else{
		    	if(data.errMsgs == 'Email already registered'){
		    		$('#emailErrMsg').html(getBundle(getBundleLanguage, "savie.interestgather.signupform.email.used.message"));
		    		document.getElementById("emailErrMsg").style.visibility="visible";
		    	}else if(data.errMsgs == getBundle(getBundleLanguage, "savie.interestgather.signupform.phoneNo.non8digit.message")){
		    		$('#phoneErrMsg').html(getBundle(getBundleLanguage, "savie.interestgather.signupform.phoneNo.non8digit.message"));
		    		document.getElementById("phoneErrMsg").style.visibility="visible";hidden
		    	}else if(data.errMsgs == "captcha error"){
		    		$('#checkboxErrorMessage').html(getBundle(getBundleLanguage, "form.captcha.empty.message"));
		    		document.getElementById("checkboxErrorMessage").style.visibility="visible";
		    	}else{
		    		$('#checkboxErrorMessage').html(data.errMsgs);
		    		document.getElementById("checkboxErrorMessage").style.visibility="visible";
		    	}
		    	if(!('placeholder' in document.createElement('input')) && $('#teaserPhoneNo').val() == '') {
		    		$('#teaserPhoneNo').val($('#teaserPhoneNo').attr('placeholder'))
		    	}
	    	}
			$('#signup-btn').prop('disabled', false);
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
        mode: 'map',
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

function getTimeSlot(perTime){
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
	    	
	    	$("#preferred-time option").remove(); 
	    	if(data.timeSlots != null && data.timeSlots.length > 0){
		    	for(var i=0; i<data.timeSlots.length; i++) {
		    		if(data.timeSlots[i].manPower>0) {
		    			var op = "<option value='" + data.timeSlots[i].timeSlot + "'";
		    			if(perTime !=null && perTime !='' && perTime == data.timeSlots[i].timeSlot){
		    				op = op + " selected='selected'";
		    			}
		    			op = op + ">" + data.timeSlots[i].timeSlot + "</option>";
		    			$("#preferred-time").append(op);
		    		}
		    	}
	    	}
	    	else if(data.sessionError != null && data.sessionError == "sessionError"){
	    		window.location.href= '${pageContext.request.contextPath}'+'/'+'${language}'+'/'+'savings-insurance'; 
	    	}
	    	else {
	    		$("#preferred-time").prepend("<option value=''></option>");
	    		$('#pickAnotherCentre').modal('show');
	    	}
	    }  
	});
}


/*function getTimeSlot(){
	var csCenter = $("#centre").val();
	var perferredDate = $("#preferred-date").val();
	if(csCenter.trim() != "" && perferredDate.trim() != ""){
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
		    		var disableTimes = new Array();
		    		var times;
		    		var startTime = "00:00";
		    		var endTime = "24:00";
		    		for(var i=0; i<data.timeSlots.length; i++) {
			    		if(data.timeSlots[i].manPower>0) {
			    			
			    			var ar_begin = startTime.split(':');
			    			var ar_end = data.timeSlots[i].timeSlot.split(':');
			    			var before = parseInt(ar_begin[0]) * 60 * 60 + parseInt(ar_begin[1]) * 60;
			    			var selected = parseInt(ar_end[0]) * 60 * 60 + parseInt(ar_end[1]) * 60;
			    			if(selected - before != 0) {
			    				times = new Array();
			    				times.push(startTime);
			    				times.push(data.timeSlots[i].timeSlot);
			    				disableTimes.push(times)
			    			}
			    			startTime = getNextTime(data.timeSlots[i].timeSlot);
			    		}
			    	}
		    		times = new Array();
		    		times.push(startTime);
		    		times.push(endTime);
    				disableTimes.push(times)
		    		
		    		$('#preferred-time').timepicker('remove');
		    		$('#preferred-time').timepicker({
						appendTo: '.timeslot',
						disableTimeRanges: disableTimes,
					});
					$('#preferred-time').timepicker('option', {'timeFormat': 'H:i' });
		    	}else {
		    		$('#pickAnotherCentre').modal('show');
		    	}
		    }  
		});
	}
}

function getNextTime(time) {
	var ar = time.split(':');
	var minute = (parseInt(ar[1]) * 60 + 30 * 60)/60
	if(minute > 60) {
		return (parseInt(ar[0]) + 1) + ":" + (minute - 60);
	}else if (minute == 60){
		return (parseInt(ar[0]) + 1) + ":00";
	}else {
		return ar[0] + ":" + minute;
	}
}*/


