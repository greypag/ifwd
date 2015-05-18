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
	
	$("#inputWhAppHKID").blur(function() {
		var appHkid = $(this).val();
		if($('#selectWhAppHKID').length > 0 && ($('#selectWhAppHKID').val().toLowerCase() == 'passport' || $('#selectWhAppHKID').val().toLowerCase() == 'apppassport')){

			if (appHkid.trim() == "") {
				$('#whAppHKID').html(getBundle(getBundleLanguage, "applicant.passport.notNull.message"));
				return false;
			}else{
				var tr = chkTravelHKPass(appHkid.trim());
                var tr1 = chkTravelHKPassLen(appHkid.trim());
                
				if (tr == false) {
					$('#whAppHKID').html(getBundle(getBundleLanguage, "applicant.passport.notValid.message"));
					
					return false;
				}	
				if (tr1 == false) {
					$('#whAppHKID').html(getBundle(getBundleLanguage, "applicant.passport.notValidLength.message"));
					
					return false;						
				}
			}
			
		}else{ 
			if (appHkid.trim() == "") {
				$('#whAppHKID').html(getBundle(getBundleLanguage, "applicant.hkId.notNull.message"));//"Please enter your Name in English.";
				return false;
			}
			var tr=IsHKID(appHkid.trim());
			if(tr==false){
				$('#whAppHKID').html(getBundle(getBundleLanguage, "applicant.hkId.notValid.message"));
				return false;
			}
		}
		
		//$("#txtInsuHkid1").val($(this).val());
		$('#whAppHKID').html('');
	});
	
	$("#inputWhAppMobileNO").blur(function() {
		var mobileNo = $(this).val();
		
		if (mobileNo.trim() == "") {
			$("#whAppMobileNO").html(getBundle(getBundleLanguage, "applicant.mobileNo.notNull.message"));
			return false;
		}else {        
			if (mobile_pattern.test(mobileNo) == false) {
				$("#whAppMobileNO").html(getBundle(getBundleLanguage, "applicant.mobileNo.notValid.message"));
				return false;
			}
		}
		$("#whAppMobileNO").html("");
	});
	
	$("#inputWhAppEmailAdd").blur(function() {
		var emailId = $(this).val();
		
		if (emailId.trim() == "") {
			$("#whAppEmailAdd").html(getBundle(getBundleLanguage, "applicant.email.notNull.message"));
			return false;
		} else {
			if (emailreg.test(emailId) == false) {

				$("#whAppEmailAdd").html(getBundle(getBundleLanguage, "applicant.email.notValid.message"));
				return false;
			}
		}
		$("#whAppEmailAdd").html("");
		
	});
	
	$( "#inputWhInsFullName" ).on( "change blur", function() {
	    var fullname = $(this).val();
		if (fullname.trim() == "") {
			$("#whInsFullName").html( getBundle(getBundleLanguage, "insured.beneficiary.notNull.message"));//"Please enter your Name in English.";
			return false;
		}
		$("#whInsFullName").html('');
	});
	
	$( "#inputWhInsHKID" ).on( "change blur", function() {
		var appHkid = $(this).val();
		if($('#selectWhInsHKID').length > 0 && $('#selectWhInsHKID').val().toLowerCase() == 'passport'){
			if (appHkid.trim() == "") {
				$("#whInsHKID").html(getBundle(getBundleLanguage, "beneficiary.passport.notNull.message"));
				return false;
			}else{
				var tr = chkTravelHKPass(appHkid.trim());
				if (tr == false) {
					$("#whInsHKID").html(getBundle(getBundleLanguage, "beneficiary.passport.notValid.message"));
					return false;
				}	
			}
		}else{ 
			if (appHkid.trim() == "") {
				$("#whInsHKID").html(getBundle(getBundleLanguage, "beneficiary.hkId.notNull.message"));
				return false;
			}
			var tr=IsHKID(appHkid.trim());
			if(tr==false)
			{
				$("#whInsHKID").html(getBundle(getBundleLanguage, "beneficiary.hkId.notValid.message"));
				return false;
			}
		}
		$("#whInsHKID").html('');
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
	document.getElementById("whAppHKID").innerHTML = "";
	document.getElementById("whAppMobileNO").innerHTML = "";    
	document.getElementById("whAppEmailAdd").innerHTML = "";
	document.getElementById("whInsAgeRange").innerHTML = "";
	document.getElementById("whInsBeneficary").innerHTML = "";
	document.getElementById("whInsFullName").innerHTML = "";
	document.getElementById("whInsHKID").innerHTML = "";
	document.getElementById("whInsWorkingCty").innerHTML = "";
	document.getElementById("whAppEmailAdd").innerHTML = "";

	var fullname = document.getElementById("inputWhAppFullName").value;
	/*var emailId = document.getElementById("inputEmailId").value;
	var mobileNo = document.getElementById("inputMobileNo").value;
	var appHkid = document.getElementById("inputWhAppHKID").value;*/


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
			$('#whInsHKID').html(getBundle(getBundleLanguage, "applicant.missingHkidOrPassport.message"));
			flag = false;
		}
		else {
			$('#whInsHKID').html(getBundle(getBundleLanguage, "applicant.missingHkidOrPassport.message"));
			flag = false;
		}
	}
	else {
		if (selectHkidPass == "HKID") {
			var tr = IsHKID(appHkid.trim());
			if (tr == false) {
				$('#whInsHKID').html(getBundle(getBundleLanguage, "applicant.hkId.notValid.message"));
				flag = false;
			}
		}
		else {
			var tr = chkTravelHKPass(appHkid.trim());
			var tr1 = chkTravelHKPassLen(appHkid.trim());
			if (tr == false) {
				$('#whInsHKID').html(getBundle(getBundleLanguage, "applicant.passport.notEnglish.message"));
				
				flag = false;
			}
			if (tr1 == false) {
				$('#whInsHKID').html(getBundle(getBundleLanguage, "applicant.passport.notValidLength.message"));
				
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