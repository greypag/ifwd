$(function () {
	var wh_nowTemp = new Date();
	var wh_now = new Date(wh_nowTemp.getFullYear(), wh_nowTemp.getMonth(), wh_nowTemp.getDate(), 0, 0, 0, 0);
	var wh_tillDate_from = new Date((new Date()).getTime() + 29*24*60*60*1000);
	var wh_tillDate_back = wh_nowTemp.setFullYear(wh_nowTemp.getFullYear() + 1);
	var wh_duration = $('#frmTravelGetQuote').length > 0 ? 180*24*60*60*1000 :30*24*60*60*1000;
	
	var checkin = $('#dpEffectiveDate').datepicker({
		beforeShowDay: function (date) {
			return date.valueOf() >= wh_now.valueOf() && date.valueOf() < wh_tillDate_from;
		},
		autoclose: true,
		todayHighlight: true,
		format: "dd MM yyyy",


	}).on('changeDate', function (ev) {
			var newDate = new Date(ev.date);
			newDate.setDate(newDate.getDate());
			newDate.setFullYear(newDate.getFullYear() + 1);
	});
	
	/*$("#inputWhAppFullName").keyup(function() {
		   document.getElementById("inputWhInsFullName").value = this.value;
	});*/
	
	$("#inputWhAppFullName").blur(function() {
		var fullname = document.getElementById("inputWhAppFullName").value;
		
		if (fullname.trim() == "") {
			$("#whAppFullName").html( getBundle(getBundleLanguage, "applicant.name.notNull.message"));//"Please enter your Name in English.";
			return false;
		}
		if (allLetter(fullname) == false) {
			$("#whAppFullName").html(getBundle(getBundleLanguage, "applicant.name.notNull.message"));
			return false;
		}
			
		$("#inputWhInsFullName").val($(this).val());
		$("#whAppFullName").html('');
	});
});

function dateFormate(thisDate) {
	var monthNames = [ "January", "February", "March", "April", "May", "June",
			"July", "August", "September", "October", "November", "December" ];

	var date = new Date(thisDate);
	var day = date.getDate();
	if (day < 10) {
		day = '0' + day;
	}

	var monthIndex = date.getMonth();
	var year = date.getFullYear();
	var formateDate = day + " " + monthNames[monthIndex] + " " + year;
	return formateDate;
}

//Travel plan details page validation
var wh_click = false;
function whDetailsValid()
{

	var flag=true;
	document.getElementById("whAppFullName").innerHTML = "";
	/*document.getElementById("errAppHkid").innerHTML = "";
	document.getElementById("emailid").innerHTML = "";    
	document.getElementById("mobileNo").innerHTML = "";*/

	var fullname = document.getElementById("inputWhAppFullName").value;
	/*var emailId = document.getElementById("inputEmailId").value;
	var mobileNo = document.getElementById("inputMobileNo").value;
	var appHkid = document.getElementById("inputTxtAppHkid").value;*/


	/*if (document.getElementById("checkbox1").checked == false) {
		document.getElementById("chk1").innerHTML = getBundle(getBundleLanguage, "travelcare.declaration.notChecked.message"); //"Please read and accept the Declaration, Terms & Conditions before submitting the application.";
		flag = false;
	}
	if (document.getElementById("checkbox2").checked == false) {
		document.getElementById("chk2").innerHTML = getBundle(getBundleLanguage, "homecare.tnc.notChecked.message");;//"Please read and accept the Personal Information Collection Statement before submitting the application";
		flag = false;
	}*/

	if (fullname.trim() == "") {
		document.getElementById("whAppFullName").innerHTML = getBundle(getBundleLanguage, "applicant.name.notNull.message");//"Please enter your Name in English.";
		flag = false;
	}

	if (emailId.trim() == "") {
		$('#emailid').html(getBundle(getBundleLanguage, "applicant.email.notNull.message"));
		flag = false;
	} else {
		if (emailreg.test(emailId) == false) {
			$('#emailid').html(getBundle(getBundleLanguage, "applicant.email.notValid.message"));
			flag = false;
		}
	}


	/**** VAlidation for HKID and Passport ***/
	var selectHkidPass = document.getElementById("selectHkidPass").value;
	if (appHkid.trim() == "") {
		if (selectHkidPass == "HKID") {
			$('#errAppHkid').html(getBundle(getBundleLanguage, "applicant.missingHkidOrPassport.message"));
			flag = false;
		}
		else {
			$('#errAppHkid').html(getBundle(getBundleLanguage, "applicant.missingHkidOrPassport.message"));
			flag = false;
		}
	}
	else {
		if (selectHkidPass == "HKID") {
			var tr = IsHKID(appHkid.trim());
			if (tr == false) {
				$('#errAppHkid').html(getBundle(getBundleLanguage, "applicant.hkId.notValid.message"));
				flag = false;
			}
		}
		else {
			var tr = chkTravelHKPass(appHkid.trim());
			var tr1 = chkTravelHKPassLen(appHkid.trim());
			if (tr == false) {
				$('#errAppHkid').html(getBundle(getBundleLanguage, "applicant.passport.notEnglish.message"));
				
				flag = false;
			}
			if (tr1 == false) {
				$('#errAppHkid').html(getBundle(getBundleLanguage, "applicant.passport.notValidLength.message"));
				
				flag = false;
			}			
		}
	}

	 if (mobileNo.trim() == "") 
	 {
		 	$('#errMobileNo').html(getBundle(getBundleLanguage, "applicant.mobileNo.notNull.message"));
	        flag = false;
	 }
	 else 
	 {        
	        if (mobile_pattern.test(mobileNo) == false) 
	        {
	            $('#errMobileNo').html(getBundle(getBundleLanguage, "applicant.mobileNo.notValid.message"));
	            flag = false;
	        }
	 }

    if(wh_click)
    	return false
    else{
    	if(flag)
    		wh_click = true;
    	return flag;
    }	
}