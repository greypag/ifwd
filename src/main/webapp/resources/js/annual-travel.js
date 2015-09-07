function validateAnnualTravel(form, formId,language){
	var flag = true;
	var contextPath = window.location.pathname.split("/")[1];
	document.getElementById("startDateDeskIn").innerHTML = "";
	document.getElementById("endDateDeskIn").innerHTML = "";
	document.getElementById("travelCountDeskIn").style.display = "none";
	
	/*var startDate = document.getElementById("txtStartDateDesk").value;    
	var endDate = document.getElementById("txtEndDateDesk").value;
	var travellers = document.getElementById("txtTravellersDesk").value;*/
	
	var startDate = $("#txtStartDateDesk").val();    
	var endDate = $("#txtEndDateDesk").val();
	var travellers = $("#txtTravellersDesk").val();
	
	var peopleCount = document.getElementById("lblPeopleDesk").innerHTML;

	var nowTemp = new Date();
	var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);
	
	var startDates= new Array();
	startDates=startDate.split("-");
	var new_start = new Date(startDates[2],startDates[1] - 1,startDates[0], 0, 0, 0, 0);
	
	var endDates = new Array();
	endDates = endDate.split("-");
	var new_end = new Date(endDates[2],endDates[1] - 1,endDates[0], 0, 0, 0, 0);
	
	var startdays = dateDiffInDays(now, new_start);
	var enddays = dateDiffInDays(new_start, new_end);

	if(startDate.trim()=="")
	{
		$('#startDateDeskIn').html(getBundle(getBundleLanguage, "date.policy.startDate.notValid.message"));
		flag = false;
	}
	else {
		if (startdays > 90) {
			$('#startDateDeskIn').html(getBundle(getBundleLanguage, "travelcare.policy.startDate.moreThan30Days.message"));
			flag = false;
		}
	}
	if(endDate.trim()=="")
	{
		$('#endDateDeskIn').html(getBundle(getBundleLanguage, "date.policy.endDate.notValid.message"));
		flag = false;
	}
	else {
		if (enddays > 180) {
			$('#endDateDeskIn').html(getBundle(getBundleLanguage, "date.policy.endDate.notValid.message"));
			flag = false;
		}
	}
	if(travellers.trim()=="")
	{
		document.getElementById("travelCountDeskIn").style.display = "block";
		flag = false;
	}
	if(peopleCount.trim()==""||peopleCount=="0")
	{
		document.getElementById("travelCountDeskIn").style.display = "block";
		flag = false;
	}
	var result = false;
	var formId = '#' + formId;
	var method = '/'+contextPath+'/ajax/annualTravel/prepareTravelInsuranceQuote';
	$.ajax({
		type : "POST",
		url : method,
		data : $(formId).serialize(),
		async : false,
		success : function(data) {
			if (data == 'success') {
				form.action = '/'+contextPath+'/'+language+'/annual-travel-insurance/quote';
				result = true;
			} else {
				$('#startDateDeskIn').html("api is Wrong");
				result = false;
			}
		}
	});
	return flag&&result;
}

//Travel plan details page validation
var travelp_click = false;
function validateAnnualTravelDetails(form,formId,language)
{
	if($("#inputFullName").val().trim()==namePlaceholder.trim()){
    	$("#inputFullName").val('');
    }
	if($("#inputTxtAppHkid").val().trim()==hkidPlaceholder.trim()){
    	$("#inputTxtAppHkid").val('');
    }

	var flag=true;
	document.getElementById("fullnameinvalid").innerHTML = "";
	document.getElementById("errAppHkid").innerHTML = "";
	document.getElementById("emailid").innerHTML = "";    
	document.getElementById("mobileNo").innerHTML = "";
	document.getElementById("dobInvalid").innerHTML = "";
	
	document.getElementById("chk1").innerHTML = "";
	document.getElementById("chk2").innerHTML = "";

	var fullname = document.getElementById("inputFullName").value;
	var emailId = document.getElementById("inputEmailId").value;
	var mobileNo = document.getElementById("inputMobileNo").value;
	var appHkid = document.getElementById("inputTxtAppHkid").value;
	var applicantDob = document.getElementById("applicantDob").value;
	
	var firstErrorElementId="";

	if (fullname.trim() == "") {
		document.getElementById("fullnameinvalid").innerHTML = getBundle(getBundleLanguage, "applicant.name.notNull.message");//"Please enter your Name in English.";
		$('#inputFullName').addClass('invalid-field');
		if(firstErrorElementId==""){
			firstErrorElementId="inputFullName";
		}
		flag = false;
	}
	
	/**** VAlidation for HKID and Passport ***/
	if (appHkid.trim() == "") {
		$('#errAppHkid').html(getBundle(getBundleLanguage, "applicant.hkId.notNull.message"));
		$('#inputTxtAppHkid').addClass('invalid-field');
		if(firstErrorElementId==""){
			firstErrorElementId="inputTxtAppHkid";
		}
		flag = false;
	}
	else {
		var tr = IsHKID(appHkid.trim());
		if (tr == false) {
			$('#errAppHkid').html(getBundle(getBundleLanguage, "applicant.hkId.notValid.message"));
			$('#inputTxtAppHkid').addClass('invalid-field');
			if(firstErrorElementId==""){
				firstErrorElementId="inputTxtAppHkid";
			}
			flag = false;
		}
	}
	
	if (applicantDob.trim() == "") 
	 {
		 $('#dobInvalid').html(getBundle(getBundleLanguage, "applicant.dob.notNull.message"));
		 $('#input_dob').addClass('invalid-field');
			if(firstErrorElementId==""){
				firstErrorElementId="input_dob";
			}
	     flag = false;
	 } else {
		 var age = document.getElementById("selectAgeRange1").value;
		 var today = new Date();

		 var applicantDobs = new Array();
		 applicantDobs = applicantDob.split("-");
		 var applicantDob1 = new Date(applicantDobs[2],applicantDobs[1] - 1,applicantDobs[0], 0, 0, 0, 0);
		 var applicantDobDate = new Date(applicantDob1);
		 
		 var insured1Hkid = document.getElementById("txtInsuHkid1").value;
		 
		 var difference = Math.abs(today - applicantDobDate);
		 difference = Math.floor((difference + 1000 * 3600 * 24) / (1000 * 3600 * 24 * 365.25)); 
		 //difference = Math.floor(difference / (1000 * 3600 * 24 * 365.26));
		 
		 if (age == 1) {
			 if ( difference > 18) {
				 $('#dobInvalid').html(getBundle(getBundleLanguage, "applicant.dob.notValid.message"));
				 $("#input_dob").addClass("invalid-field");
			        if(firstErrorElementId==""){
						firstErrorElementId="input_dob";
					}
			     flag = false;		 
			 }  
		 } else if (age == 2) {
			 if ( difference < 18 || difference > 70) {
				 $('#dobInvalid').html(getBundle(getBundleLanguage, "applicant.dob.notValid.message"));
				 $("#input_dob").addClass("invalid-field");
			        if(firstErrorElementId==""){
						firstErrorElementId="input_dob";
					}
			     flag = false;		 
			 }
		 } else if (age == 3) {
			 if ( difference < 71 || difference > 85) {
				 $('#dobInvalid').html(getBundle(getBundleLanguage, "applicant.dob.notValid.message"));
				 $("#input_dob").addClass("invalid-field");
			        if(firstErrorElementId==""){
						firstErrorElementId="input_dob";
					}
			     flag = false;		 
			 }
		 }
		 
	 }
	
	if (mobileNo.trim() == "") 
	 {
		 	$('#errMobileNo').html(getBundle(getBundleLanguage, "applicant.mobileNo.notNull.message"));
		 	$('#inputMobileNo').addClass('invalid-field');
			if(firstErrorElementId==""){
				firstErrorElementId="inputMobileNo";
			}
	        flag = false;
	 }
	 else 
	 {        
	        if (mobile_pattern.test(mobileNo) == false) 
	        {
	            $('#errMobileNo').html(getBundle(getBundleLanguage, "applicant.mobileNo.notValid.message"));
	            $('#inputMobileNo').addClass('invalid-field');
	    		if(firstErrorElementId==""){
	    			firstErrorElementId="inputMobileNo";
	    		}
	            flag = false;
	        }
	 }

	if (emailId.trim() == "") {
		$('#emailid').html(getBundle(getBundleLanguage, "applicant.email.notNull.message"));
		$('#inputEmailId').addClass('invalid-field');
		if(firstErrorElementId==""){
			firstErrorElementId="inputEmailId";
		}
		flag = false;
	} else {
		if (emailreg.test(emailId) == false) {
			$('#emailid').html(getBundle(getBundleLanguage, "applicant.email.notValid.message"));
			$('#inputEmailId').addClass('invalid-field');
			if(firstErrorElementId==""){
				firstErrorElementId="inputEmailId";
			}
			flag = false;
		}
	}

	var rowCountPersonal=document.getElementById("totalPersonalTraveller").value;
	

	for (var i = 1; i <= parseInt(rowCountPersonal) ; i++)
	{
		if($("#txtInsuFullName" + i).val().trim()==insureNamePlaceholder.trim()){
	    	$("#txtInsuFullName" + i).val('');
	    }
		if($("#txtInsuHkid" + i).val().trim()==insureHkidPlaceholder.trim()){
	    	$("#txtInsuHkid" + i).val('');
	    }
		
		var fullname = document.getElementById("txtInsuFullName" + i).value;
		if (fullname.trim() == "") {
			document.getElementById("errtxtPersonalFullName" + i).innerHTML = getBundle(getBundleLanguage, "insured.name.notNull.message"); //"Please enter Insured Person's Name in English.";
			$("#txtInsuFullName" + i).addClass('invalid-field');
			if(firstErrorElementId==""){
				firstErrorElementId="txtInsuFullName" + i;
			}
			flag = false;
		}else{
			document.getElementById("errtxtPersonalFullName" + i).innerHTML = "";
		}
		
		var age = document.getElementById("selectAgeRange" + i).value;
		if (age.trim() == "" || age.trim() == 0) {
			document.getElementById("errselectAgeRange" + i).innerHTML = getBundle(getBundleLanguage, "insured.age.notValid.message");
			$("#selectAgeRange" + i).addClass('invalid-field');
			if(firstErrorElementId==""){
				firstErrorElementId="selectAgeRange" + i;
			}
			flag = false;
		}else{
			document.getElementById("errselectAgeRange" + i).innerHTML = "";
		}
		var hkid = document.getElementById("txtInsuHkid" + i).value;
		document.getElementById("errtxtInsuHkid" + i).innerHTML = "";
		
		if (hkid.trim() == "") {
			document.getElementById("errtxtInsuHkid" + i).innerHTML = getBundle(getBundleLanguage, "insured.hkId.notNull.message"); // "Please enter Insured Person's HKID No.";
			$("#txtInsuHkid" + i).addClass('invalid-field');
			if(firstErrorElementId==""){
				firstErrorElementId="txtInsuHkid" + i;
			}
			flag = false;	
			
		}else{
			var tr=IsHKID(hkid.trim());
			if(tr==false)
			{
				document.getElementById("errtxtInsuHkid" + i).innerHTML = getBundle(getBundleLanguage, "insured.hkId.notValid.message"); // getBundle(getBundleLanguage, "insured.hkId.notValid.message");;
				$("#txtInsuHkid" + i).addClass('invalid-field');
				if(firstErrorElementId==""){
					firstErrorElementId="txtInsuHkid" + i;
				}
				flag = false;
			}
			
		}
		if (hkid.trim() != "") {
			for (var j = 1; j <= i-1; j++){
				var hkid1 = document.getElementById("txtInsuHkid" + j).value;
				if (hkid.toUpperCase() == hkid1.toUpperCase()){	
					$('#errtxtInsuHkid'+j).html(getBundle(getBundleLanguage, "insured.hkId.duplicate.meesage"));
					$("#txtInsuHkid" + j).addClass('invalid-field');
					if(firstErrorElementId==""){
						firstErrorElementId="txtInsuHkid" + j;
					}
					flag = false;
				}
			}
		}
		var selectedValue = document.getElementById("personalselectBenificiary" + i).value;
		var HkidPass = document.getElementById("personalBenefitiaryHKId"+i).value;
		var selectPersonalBenefitiaryHkidPass = document.getElementById("selectPersonalBenefitiaryHkidPass" + i).value;
		
		
		
		if($("#personalBenefitiaryId" + i).val().trim()==benNamePlaceholder.trim()){
	    	$("#personalBenefitiaryId" + i).val('');
	    }
		if($("#personalBenefitiaryHKId" + i).val().trim()==benHkidPlaceholder.trim()){
	    	$("#personalBenefitiaryHKId" + i).val('');
	    }
		
		if(selectedValue != "SE"){
			

			if (document.getElementById("personalBenefitiaryId" + i).value.trim() == "")
			{
				document.getElementById("errpersonalBenefitiaryId" + i).innerHTML= getBundle(getBundleLanguage, "beneficiary.name.notNull.message"); // getBundle(getBundleLanguage, "beneficiary.name.notNull.message");;
				$("#personalBenefitiaryId" + i).addClass('invalid-field');
				if(firstErrorElementId==""){
					firstErrorElementId="personalBenefitiaryId" + i;
				}
				flag = false;             
			}
			else
			{
				document.getElementById("errpersonalBenefitiaryId" + i).innerHTML = "";
			}
			
			var hkida = document.getElementById("personalBenefitiaryHKId" + i).value;
			
			if (selectPersonalBenefitiaryHkidPass.toUpperCase() == 'HKID' ) {
				if (hkida.trim() == "") {
			    	$("#errpersonalBenefitiaryHKId" + i).html(getBundle(getBundleLanguage, "beneficiary.hkId.notNull.message"));
			    	$("#personalBenefitiaryHKId" + i).addClass('invalid-field');
					if(firstErrorElementId==""){
						firstErrorElementId="personalBenefitiaryHKId" + i;
					}
					flag = false;
			    } else {
			    	if(IsHKID(hkida.trim())==false)
					{	
						$("#errpersonalBenefitiaryHKId" + i).html(getBundle(getBundleLanguage, "beneficiary.hkId.notValid.message"));
						$("#personalBenefitiaryHKId" + i).addClass('invalid-field');
						if(firstErrorElementId==""){
							firstErrorElementId="personalBenefitiaryHKId" + i;
						}
						flag = false;
					} else if (hkida.toUpperCase() == hkid.toUpperCase()){
						$('#errpersonalBenefitiaryHKId'+i).html(getBundle(getBundleLanguage, "beneficiary.hkId.duplicate.message"));
						$("#personalBenefitiaryHKId" + i).addClass('invalid-field');
						if(firstErrorElementId==""){
							firstErrorElementId="personalBenefitiaryHKId" + i;
						}
						flag = false;
					}	
			    }
					
				
			} else {
				if (hkida.trim() == "") {
					document.getElementById("errpersonalBenefitiaryHKId" + i).innerHTML = getBundle(getBundleLanguage, "beneficiary.passport.notNull.message"); // "Please enter Insured Person's HKID No.";
					$("#personalBenefitiaryHKId" + i).addClass('invalid-field');
					if(firstErrorElementId==""){
						firstErrorElementId="personalBenefitiaryHKId" + i;
					}
					flag = false;
				} else {
					if(chkTravelHKPassLen(hkida.trim()) == false) {
						$("#errpersonalBenefitiaryHKId" + i).html(getBundle(getBundleLanguage, "applicant.passport.notValidLength.message"));
						$("#personalBenefitiaryHKId" + i).addClass('invalid-field');
						if(firstErrorElementId==""){
							firstErrorElementId="personalBenefitiaryHKId" + i;
						}
						flag = false;
					}else if(chkTravelHKPass(hkida.trim()) == false) {
						$("#errpersonalBenefitiaryHKId" + i).html(getBundle(getBundleLanguage, "beneficiary.passport.notValid.message"));
						$("#personalBenefitiaryHKId" + i).addClass('invalid-field');
						if(firstErrorElementId==""){
							firstErrorElementId="personalBenefitiaryHKId" + i;
						}
						flag = false;
					}else if (hkida.toUpperCase() == hkid.toUpperCase()){
						$('#errpersonalBenefitiaryHKId'+i).html(getBundle(getBundleLanguage, "beneficiary.passport.duplicate.message"));
						$("#personalBenefitiaryHKId" + i).addClass('invalid-field');
						if(firstErrorElementId==""){
							firstErrorElementId="txtInsuFullName" + i;
						}
						flag = false;
					}	 
				}
			}
		}
	}
	
	if (document.getElementById("checkbox1").checked == false) {
		document.getElementById("chk1").innerHTML = getBundle(getBundleLanguage, "travelcare.declaration.notChecked.message"); //"Please read and accept the Declaration, Terms & Conditions before submitting the application.";
		if(firstErrorElementId==""){
			firstErrorElementId="checkbox1";
		}
		flag = false;
	}
	if (document.getElementById("checkbox2").checked == false) {
		document.getElementById("chk2").innerHTML = getBundle(getBundleLanguage, "homecare.tnc.notChecked.message");;//"Please read and accept the Personal Information Collection Statement before submitting the application";
		if(firstErrorElementId==""){
			firstErrorElementId="checkbox2";
		}
		flag = false;
	}
	
	if(firstErrorElementId!=""){
		scrollToElement(firstErrorElementId);
	}
	
	
    if(travelp_click){
    	$('#loading-overlay').modal('hide');
    	return false;
    }else{
    	if(flag){
    		travelp_click = true;
    		$('#loading-overlay').modal({
	           backdrop: 'static',
	           keyboard: false
	        })
    	}else{
    		$('#loading-overlay').modal('hide');
    	}
    	
    	var contextPath = window.location.pathname.split("/")[1];
    	var result = false;
    	var formId = '#' + formId;
    	var method = '/'+contextPath+'/ajax/annualTravel/prepareTravelInsuranceTravelSummary';
    	$.ajax({
    		type : "POST",
    		url : method,
    		data : $(formId).serialize(),
    		async : false,
    		success : function(data) {
    			if (data == 'success') {
    				form.action = '/'+contextPath+'/'+language+'/annual-travel-insurance/summary';
    				result = true;
    			} else {
    				result = false;
    			}
    		}
    	});
    	return flag&&result;
    }	
	

}