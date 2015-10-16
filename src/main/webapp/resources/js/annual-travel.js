$(function () {
	$( "#inputCAEstate" ).on( "blur", function() {
	    var estate = $(this).val();
	    var building = $("#inputCABuilding").val();
	    if(building.trim()==buildingPlaceholder.trim()){
	    	building='';
	    }
	    if(estate.trim()==estatePlaceholder.trim()){
	    	estate='';
	    }
	    if (estate.trim() == "" && building.trim() == "" ) {
			$("#errCAEstate").html( getBundle(getBundleLanguage, "workinghoilday.estate.message"));
			$("#inputCAEstate").addClass("invalid-field");
			return false;
		}
	    $("#inputCAEstate").removeClass("invalid-field");
	    $("#inputCABuilding").removeClass("invalid-field");
		$("#errCAEstate").html('');
		$("#errCABuilding").html('');
	});
	
	$( "#inputCABuilding" ).on( "blur", function() {
	    var building = $(this).val();
	    var estate = $("#inputCAEstate").val();
	    if(building.trim()==buildingPlaceholder.trim()){
	    	building='';
	    }
	    if(estate.trim()==estatePlaceholder.trim()){
	    	estate='';
	    }
	    if (estate.trim() == "" && building.trim() == "" ) {
			$("#errCABuilding").html( getBundle(getBundleLanguage, "workinghoilday.building.message"));
			$("#inputCABuilding").addClass("invalid-field");
			return false;
		}
	    $("#inputCAEstate").removeClass("invalid-field");
	    $("#inputCABuilding").removeClass("invalid-field");
		$("#errCAEstate").html('');
		$("#errCABuilding").html('');
	});
})

function validateAnnualTravel(form, formId,language){
	var flag = true;
	document.getElementById("startDateDeskIn").innerHTML = "";
	document.getElementById("endDateDeskIn").innerHTML = "";
	document.getElementById("travelCountDeskIn").style.display = "none";
	
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
	var method = contextPath+'/ajax/annualTravel/prepareTravelInsuranceQuote';
	console.log($(formId).serialize());
	$.ajax({
		type : "POST",
		url : method,
		data : $(formId).serialize(),
		async : false,
		success : function(data) {
			if (data == 'success') {
				form.action = contextPath+'/'+language+'/annual-travel-insurance/quote';
				result = true;
			} else {
				console.log(data);
				$('#startDateDeskIn').html(data.errMsgs);
				result = false;
			}
		}
	});
	return flag&&result;
}

//Travel plan details page validation
var travelp_click = false;
function validateAnnualTravelDetails(form,formId,language){
	if($("#inputFullName").val().trim()==namePlaceholder.trim()){
    	$("#inputFullName").val('');
    }
	if($("#inputTxtAppHkid").val().trim()==hkidPlaceholder.trim()){
    	$("#inputTxtAppHkid").val('');
    }
	
	if($("#inputCARoom").val().trim()==roomPlaceholder.trim()){
		$("#inputCARoom").val('');
	}
	if($("#inputCAFloor").val().trim()==floorPlaceholder.trim()){
		$("#inputCAFloor").val('');
	}
	if($("#inputCABlock").val().trim()==blockPlaceholder.trim()){
		$("#inputCABlock").val('');
	}
	if($("#inputCABuilding").val().trim()==buildingPlaceholder.trim()){
		$("#inputCABuilding").val('');
	}
	if($("#inputCAEstate").val().trim()==estatePlaceholder.trim()){
		$("#inputCAEstate").val('');
	}
	if($("#inputCAStreetNo").val().trim()==streetNoPlaceholder.trim()){
		$("#inputCAStreetNo").val('');
	}
	if($("#inputCAStreetName").val().trim()==streetNamePlaceholder.trim()){
		$("#inputCAStreetName").val('');
	}

	var flag=true;
	document.getElementById("fullnameinvalid").innerHTML = "";
	document.getElementById("errAppHkid").innerHTML = "";
	document.getElementById("emailid").innerHTML = "";    
	document.getElementById("mobileNo").innerHTML = "";
	document.getElementById("dobInvalid").innerHTML = "";
	
	document.getElementById("errCABuilding").innerHTML = "";
	document.getElementById("errCAEstate").innerHTML = "";
	
	document.getElementById("chk1").innerHTML = "";
	document.getElementById("chk2").innerHTML = "";

	var fullname = document.getElementById("inputFullName").value;
	var emailId = document.getElementById("inputEmailId").value;
	var mobileNo = document.getElementById("inputMobileNo").value;
	var appHkid = document.getElementById("inputTxtAppHkid").value;
	var applicantDob = document.getElementById("applicantDob").value;
	
	var applicantBuilding = document.getElementById("inputCABuilding").value;
	var applicantEstate = document.getElementById("inputCAEstate").value;
	var applicantDistrict = document.getElementById("selectCADist").value;
	
	if(applicantBuilding.trim()==buildingPlaceholder.trim()){
		applicantBuilding='';
    }
    if(applicantEstate.trim()==estatePlaceholder.trim()){
    	applicantEstate='';
    }
	
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
		 $('#input_annual_dob').addClass('invalid-field');
			if(firstErrorElementId==""){
				firstErrorElementId="input_annual_dob";
			}
	     flag = false;
	 } else {
		 
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

	if(applicantEstate.trim() == "" && applicantBuilding.trim() == ""){
		$("#errCABuilding").html(getBundle(getBundleLanguage, "workinghoilday.building.message"));
		$("#errCAEstate").html(getBundle(getBundleLanguage, "workinghoilday.estate.message"));
		$("#inputCABuilding").addClass("invalid-field");
		$("#inputCAEstate").addClass("invalid-field");
		if(firstErrorElementId==""){
			firstErrorElementId="inputCABuilding";
		}
		flag = false;
	}
	
	if (applicantDistrict.trim() == "") {
		$("#errCADist").html(getBundle(getBundleLanguage, "workinghoilday.district.message"));
		$("#inputCADistrict").addClass("invalid-field");
		if(firstErrorElementId==""){
			firstErrorElementId="inputCADistrict";
		}
		flag = false;
	}
	
	var rowCountPersonal=document.getElementById("totalPersonalTraveller").value;
	var rowCountAdult=document.getElementById("totalAdultTraveler").value;
	var rowCountChild=document.getElementById("totalCountOfChild").value;
	
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
				document.getElementById("errtxtInsuHkid" + i).innerHTML = getBundle(getBundleLanguage, "insured.dob.notNull.message"); // getBundle(getBundleLanguage, "insured.hkId.notValid.message");;
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
		var insureDob = document.getElementById("insureDob" + i).value;
		if (insureDob.trim() == "") {
			document.getElementById("errtxtInsuDob" + i).innerHTML = getBundle(getBundleLanguage, "insured.dob.notNull.message"); //"Please enter Insured Person's Name in English.";
			$("#input_insure_dob" + i).addClass('invalid-field');
			if(firstErrorElementId==""){
				firstErrorElementId="insureDob" + i;
			}
			flag = false;
		}else{
			document.getElementById("errtxtInsuDob" + i).innerHTML = "";
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
	/* Adult Beneficiary validation */
	for (var i = 1; i <= parseInt(rowCountAdult) ; i++)
	{
		if($("#txtInsuFullName" + i).val().trim()==insureNamePlaceholder.trim()){
	    	$("#txtInsuFullName" + i).val('');
	    }
		if($("#txtInsuHkid" + i).val().trim()==insureHkidPlaceholder.trim()){
	    	$("#txtInsuHkid" + i).val('');
	    }

		var fullname = document.getElementById("txtInsuFullName" + i).value;
		if (fullname.trim() == "") {
			document.getElementById("errtxtAdFullName" + i).innerHTML = getBundle(getBundleLanguage, "insured.name.notNull.message"); //"Please enter Insured Person's Name in English.";
			$("#txtInsuFullName" + i).addClass('invalid-field');
			if(firstErrorElementId==""){
				firstErrorElementId="txtInsuFullName" + i;
			}
			flag = false;
		}else{
			document.getElementById("errtxtAdFullName" + i).innerHTML = "";
		}

		var hkid = document.getElementById("txtInsuHkid" + i).value;
		document.getElementById("errtxtInsuHkid" + i).innerHTML = "";
        var selectedAdHkidPass = document.getElementById("selectedAdHkidPass" + i).value;
		
		if (hkid.trim() == "") {
			if (selectedAdHkidPass.toUpperCase() == 'HKID') {
				document.getElementById("errtxtInsuHkid" + i).innerHTML = getBundle(getBundleLanguage, "insured.hkId.notNull.message")
				$("#txtInsuHkid" + i).addClass('invalid-field');
				if(firstErrorElementId==""){
					firstErrorElementId="txtInsuHkid" + i;
				}
				flag = false;					
			} else {
				document.getElementById("errtxtInsuHkid" + i).innerHTML = getBundle(getBundleLanguage, "insured.passport.notNull.message")
				$("#txtInsuHkid" + i).addClass('invalid-field');
				if(firstErrorElementId==""){
					firstErrorElementId="txtInsuHkid" + i;
				}
				flag = false;
			}
			
		}
		else
		{
			if (selectedAdHkidPass.toUpperCase() == 'HKID') {
				var tr=IsHKID(hkid.trim());
				if(tr==false)
				{
					document.getElementById("errtxtInsuHkid" + i).innerHTML = getBundle(getBundleLanguage, "insured.hkId.notValid.message");;
					$("#txtInsuHkid" + i).addClass('invalid-field');
					if(firstErrorElementId==""){
						firstErrorElementId="txtInsuHkid" + i;
					}
					flag = false;
				}
			} else {
				var tr=chkTravelHKPass(hkid.trim());
				if(tr==false)
				{
					document.getElementById("errtxtInsuHkid" + i).innerHTML = getBundle(getBundleLanguage, "insured.passport.notValid.message"); // getBundle(getBundleLanguage, "insured.hkId.notValid.message");;
					$("#txtInsuHkid" + i).addClass('invalid-field');
					if(firstErrorElementId==""){
						firstErrorElementId="txtInsuHkid" + i;
					}
					flag = false;
				}
				var tr1=chkTravelHKPassLen(hkid.trim());
				if(tr1==false)
				{
					document.getElementById("errtxtInsuHkid" + i).innerHTML = getBundle(getBundleLanguage, "applicant.passport.notValidLength.message"); // getBundle(getBundleLanguage, "insured.hkId.notValid.message");;
					$("#txtInsuHkid" + i).addClass('invalid-field');
					if(firstErrorElementId==""){
						firstErrorElementId="txtInsuHkid" + i;
					}
					flag = false;
				}
			}
		}
		
		var insureDob = document.getElementById("adultDob" + i).value;
		if (insureDob.trim() == "") {
			document.getElementById("errtxtAdDob" + i).innerHTML = getBundle(getBundleLanguage, "insured.dob.notNull.message"); //"Please enter Insured Person's Name in English.";
			$("#input_adult_dob" + i).addClass('invalid-field');
			if(firstErrorElementId==""){
				firstErrorElementId="adultDob" + i;
			}
			flag = false;
		}else{
			document.getElementById("errtxtAdDob" + i).innerHTML = "";
		}
		
		if (hkid.trim() != "") {
			for (var j = 1; j <= i-1; j++)
			{
				var hkid1 = document.getElementById("txtInsuHkid" + j).value;
				if (hkid.toUpperCase() == hkid1.toUpperCase())
				{	
					$('#errtxtInsuHkid'+j).html(getBundle(getBundleLanguage, "insured.hkId.duplicate.meesage"));
					$("#txtInsuHkid" + j).addClass('invalid-field');
					if(firstErrorElementId==""){
						firstErrorElementId="txtInsuHkid" + j;
					}
					flag = false;
				}
			}
			
			for (var j=1; j<=parseInt(rowCountChild);j++){
				var hkid1 = document.getElementById("txtChldInsuHkid" + j).value;
				if (hkid.toUpperCase() == hkid1.toUpperCase()){
					$('#errtxtChldInsuHkid'+j).html(getBundle(getBundleLanguage, "insured.hkId.duplicate.meesage"));
					$("#txtChldInsuHkid" + j).addClass('invalid-field');
					if(firstErrorElementId==""){
						firstErrorElementId="txtChldInsuHkid" + j;
					}
					flag = false;
				}
			}
		}
		var selectedValue = document.getElementById("adultsselectBenificiary" + i).value;
		var HkidPass = document.getElementById("adultBenefitiaryHKId"+i).value;
		var selectAdBenefitiaryHkidPass = document.getElementById("selectAdBenefitiaryHkidPass" + i).value;
		
		if($("#adultBenefitiaryId" + i).val().trim()==benNamePlaceholder.trim()){
	    	$("#adultBenefitiaryId" + i).val('');
	    }
		if($("#adultBenefitiaryHKId" + i).val().trim()==benHkidPlaceholder.trim()){
	    	$("#adultBenefitiaryHKId" + i).val('');
	    }
		
		if(selectedValue != "SE"){
			if (document.getElementById("adultBenefitiaryId" + i).value == "")
			{
				document.getElementById("erradultBenefitiaryId" + i).innerHTML= getBundle(getBundleLanguage, "beneficiary.name.notNull.message"); // getBundle(getBundleLanguage, "beneficiary.name.notNull.message");;
				$("#adultBenefitiaryId" + i).addClass('invalid-field');
				if(firstErrorElementId==""){
					firstErrorElementId="adultBenefitiaryId" + i;
				}
				flag = false;             
			}
			else
			{
				document.getElementById("erradultBenefitiaryId" + i).innerHTML = "";
			}
			var hkida = document.getElementById("adultBenefitiaryHKId" + i).value;
			if (selectAdBenefitiaryHkidPass.toUpperCase() == 'HKID' ) {				
				if (hkida.trim() == "") {
			    	$("#erradultBenefitiaryHKId" + i).html(getBundle(getBundleLanguage, "beneficiary.hkId.notNull.message"));
			    	$("#adultBenefitiaryHKId" + i).addClass('invalid-field');
					if(firstErrorElementId==""){
						firstErrorElementId="adultBenefitiaryHKId" + i;
					}
					flag = false;
			    } else {
			    	if(IsHKID(hkida.trim())==false)
					{	
						$("#erradultBenefitiaryHKId" + i).html(getBundle(getBundleLanguage, "beneficiary.hkId.notValid.message"));
						$("#adultBenefitiaryHKId" + i).addClass('invalid-field');
						if(firstErrorElementId==""){
							firstErrorElementId="adultBenefitiaryHKId" + i;
						}
						flag = false;
					} else if (hkid.toUpperCase() == HkidPass.toUpperCase()){
						$('#erradultBenefitiaryHKId'+i).html(getBundle(getBundleLanguage, "beneficiary.hkId.duplicate.message"));
						$("#adultBenefitiaryHKId" + i).addClass('invalid-field');
						if(firstErrorElementId==""){
							firstErrorElementId="adultBenefitiaryHKId" + i;
						}
						flag = false;
					}	
			    }
			} else {
				if (hkida.trim() == "") {
					document.getElementById("erradultBenefitiaryHKId" + i).innerHTML = getBundle(getBundleLanguage, "beneficiary.passport.notNull.message"); // "Please enter Insured Person's HKID No.";
					$("#adultBenefitiaryHKId" + i).addClass('invalid-field');
					if(firstErrorElementId==""){
						firstErrorElementId="adultBenefitiaryHKId" + i;
					}
					flag = false;
				} else {
					if(chkTravelHKPassLen(hkida.trim()) == false) {
						$("#errpersonalBenefitiaryHKId" + i).html(getBundle(getBundleLanguage, "applicant.passport.notValidLength.message"));
						$("#adultBenefitiaryHKId" + i).addClass('invalid-field');
						if(firstErrorElementId==""){
							firstErrorElementId="adultBenefitiaryHKId" + i;
						}
						flag = false;
					}else if(chkTravelHKPass(hkida.trim()) == false) {
						$("#errpersonalBenefitiaryHKId" + i).html(getBundle(getBundleLanguage, "beneficiary.passport.notValid.message"));
						$("#adultBenefitiaryHKId" + i).addClass('invalid-field');
						if(firstErrorElementId==""){
							firstErrorElementId="adultBenefitiaryHKId" + i;
						}
						flag = false;
					}else if (hkida.toUpperCase() == hkid.toUpperCase()){
						$('#errpersonalBenefitiaryHKId'+i).html(getBundle(getBundleLanguage, "beneficiary.passport.duplicate.message"));
						$("#adultBenefitiaryHKId" + i).addClass('invalid-field');
						if(firstErrorElementId==""){
							firstErrorElementId="adultBenefitiaryHKId" + i;
						}
						flag = false;
					}	 
				}
			}
		} 
	}

	/* Child Beneficiary validation */
	for (var i = 1; i <= parseInt(rowCountChild) ; i++)
	{
		if($("#txtChldFullName" + i).val().trim()==insureNamePlaceholder.trim()){
	    	$("#txtChldFullName" + i).val('');
	    }
		if($("#txtChldInsuHkid" + i).val().trim()==insureHkidPlaceholder.trim()){
	    	$("#txtChldInsuHkid" + i).val('');
	    }
		
		var fullname = document.getElementById("txtChldFullName" + i).value;
		if (fullname.trim() == "") {
			document.getElementById("errtxtChldFullName" + i).innerHTML = getBundle(getBundleLanguage, "insured.name.notNull.message");
			$("#txtChldFullName" + i).addClass('invalid-field');
			if(firstErrorElementId==""){
				firstErrorElementId="txtChldFullName" + i;
			}
			flag = false;
		}else{
			document.getElementById("errtxtChldFullName" + i).innerHTML = "";
		}

		var hkid = document.getElementById("txtChldInsuHkid" + i).value;
		var selectedChldHkidPass = document.getElementById("selectedChldHkidPass" + i).value;
		if (hkid.trim() == "") {
			if (selectedChldHkidPass.toUpperCase() == 'HKID') {
				document.getElementById("errtxtChldInsuHkid" + i).innerHTML = getBundle(getBundleLanguage, "insured.hkId.notNull.message")
				$("#txtChldInsuHkid" + i).addClass('invalid-field');
				if(firstErrorElementId==""){
					firstErrorElementId="txtChldInsuHkid" + i;
				}
				flag = false;	
			} else {
				document.getElementById("errtxtChldInsuHkid" + i).innerHTML = getBundle(getBundleLanguage, "insured.passport.notNull.message")
				$("#txtChldInsuHkid" + i).addClass('invalid-field');
				if(firstErrorElementId==""){
					firstErrorElementId="txtChldInsuHkid" + i;
				}
				flag = false;	
			}
			 
		}
		else
		{
			if (selectedChldHkidPass.toUpperCase() == 'HKID') {
				var tr=IsHKID(hkid.trim());
				if(tr==false)
				{
					document.getElementById("errtxtChldInsuHkid" + i).innerHTML = getBundle(getBundleLanguage, "insured.hkId.notValid.message");;
					$("#txtChldInsuHkid" + i).addClass('invalid-field');
					if(firstErrorElementId==""){
						firstErrorElementId="txtChldInsuHkid" + i;
					}
					flag = false;
				}
			} else {
				var tr=chkTravelHKPass(hkid.trim());
				if(tr==false)
				{
					document.getElementById("errtxtChldInsuHkid" + i).innerHTML = getBundle(getBundleLanguage, "insured.passport.notValid.message"); // getBundle(getBundleLanguage, "insured.hkId.notValid.message");;
					$("#txtChldInsuHkid" + i).addClass('invalid-field');
					if(firstErrorElementId==""){
						firstErrorElementId="txtChldInsuHkid" + i;
					}
					flag = false;
				}
				var tr1=chkTravelHKPassLen(hkid.trim());
				if(tr1==false)
				{
					document.getElementById("errtxtChldInsuHkid" + i).innerHTML = getBundle(getBundleLanguage, "applicant.passport.notValidLength.message"); // getBundle(getBundleLanguage, "insured.hkId.notValid.message");;
					$("#txtChldInsuHkid" + i).addClass('invalid-field');
					if(firstErrorElementId==""){
						firstErrorElementId="txtChldInsuHkid" + i;
					}
					flag = false;
				}
			}
		}
		
		var insureDob = document.getElementById("childDob" + i).value;
		if (insureDob.trim() == "") {
			document.getElementById("errtxtChldDob" + i).innerHTML = getBundle(getBundleLanguage, "insured.dob.notNull.message"); //"Please enter Insured Person's Name in English.";
			$("#input_child_dob" + i).addClass('invalid-field');
			if(firstErrorElementId==""){
				firstErrorElementId="childDob" + i;
			}
			flag = false;
		}else{
			document.getElementById("errtxtChldDob" + i).innerHTML = "";
		}
		
		if (hkid.trim() != "") {
			for (var j = 1; j <= i-1; j++)
			{
				var hkid1 = document.getElementById("txtChldInsuHkid" + j).value;
				if (hkid.toUpperCase() == hkid1.toUpperCase())
				{	
					$('#errtxtChldInsuHkid'+j).html(getBundle(getBundleLanguage, "insured.hkId.duplicate.meesage"));
					$("#txtChldInsuHkid" + j).addClass('invalid-field');
					if(firstErrorElementId==""){
						firstErrorElementId="txtChldInsuHkid" + j;
					}
					flag = false;
				}
			}
		}
		
		var selectedValue = document.getElementById("childselectBenificiary" + i).value;
		var HkidPass = document.getElementById("txtchildInsuHkid"+i).value;
		var selectedChldBenefitiaryHkidPass = document.getElementById("selectedChldBenefitiaryHkidPass" + i).value;
		if($("#childBenefitiaryName" + i).val().trim()==benNamePlaceholder.trim()){
	    	$("#childBenefitiaryName" + i).val('');
	    }
		if($("#txtchildInsuHkid" + i).val().trim()==benHkidPlaceholder.trim()){
	    	$("#txtchildInsuHkid" + i).val('');
	    }
		
		if(selectedValue != "SE"){
			if (document.getElementById("childBenefitiaryName" + i).value == "")
			{
				document.getElementById("errchildBenefitiaryName" + i).innerHTML= getBundle(getBundleLanguage, "beneficiary.name.notNull.message"); // getBundle(getBundleLanguage, "beneficiary.name.notNull.message");;
				$("#childBenefitiaryName" + i).addClass('invalid-field');
				if(firstErrorElementId==""){
					firstErrorElementId="childBenefitiaryName" + i;
				}
				flag = false;             
			}
			else
			{
				document.getElementById("errchildBenefitiaryName" + i).innerHTML = "";
			}
			
			var hkida = document.getElementById("txtchildInsuHkid" + i).value;
			if (selectedChldBenefitiaryHkidPass.toUpperCase() == 'HKID' ) {
				if (hkida.trim() == "") {
			    	$("#errtxtchildInsuHkid" + i).html(getBundle(getBundleLanguage, "beneficiary.hkId.notNull.message"));
			    	$("#txtchildInsuHkid" + i).addClass('invalid-field');
					if(firstErrorElementId==""){
						firstErrorElementId="txtchildInsuHkid" + i;
					}
					flag = false;
			    } else {
					if(IsHKID(hkida.trim())==false)
					{	
						$("#errtxtchildInsuHkid" + i).html(getBundle(getBundleLanguage, "beneficiary.hkId.notValid.message"));
						$("#txtchildInsuHkid" + i).addClass('invalid-field');
						if(firstErrorElementId==""){
							firstErrorElementId="txtchildInsuHkid" + i;
						}
						flag = false;
					} else if (hkid.toUpperCase() == HkidPass.toUpperCase()){
						$('#errtxtchildInsuHkid'+i).html(getBundle(getBundleLanguage, "beneficiary.hkId.duplicate.message"));
						$("#txtchildInsuHkid" + i).addClass('invalid-field');
						if(firstErrorElementId==""){
							firstErrorElementId="txtchildInsuHkid" + i;
						}
						flag = false;
					}	
			    }
				
			} else {
				if (hkida.trim() == "") {
					document.getElementById("errtxtchildInsuHkid" + i).innerHTML = getBundle(getBundleLanguage, "beneficiary.passport.notNull.message"); // "Please enter Insured Person's HKID No.";
					$("#txtchildInsuHkid" + i).addClass('invalid-field');
					if(firstErrorElementId==""){
						firstErrorElementId="txtchildInsuHkid" + i;
					}
					flag = false;
				} else {
					if(chkTravelHKPassLen(hkida.trim()) == false) {
						$("#errtxtchildInsuHkid" + i).html(getBundle(getBundleLanguage, "applicant.passport.notValidLength.message"));
						$("#txtchildInsuHkid" + i).addClass('invalid-field');
						if(firstErrorElementId==""){
							firstErrorElementId="txtchildInsuHkid" + i;
						}
						flag = false;
					}else if(chkTravelHKPass(hkida.trim()) == false) {
						$("#errtxtchildInsuHkid" + i).html(getBundle(getBundleLanguage, "beneficiary.passport.notValid.message"));
						$("#txtchildInsuHkid" + i).addClass('invalid-field');
						if(firstErrorElementId==""){
							firstErrorElementId="txtchildInsuHkid" + i;
						}
						flag = false;
					}else if (hkida.toUpperCase() == hkid.toUpperCase()){
						$('#errtxtchildInsuHkid'+i).html(getBundle(getBundleLanguage, "beneficiary.passport.duplicate.message"));
						$("#txtchildInsuHkid" + i).addClass('invalid-field');
						if(firstErrorElementId==""){
							firstErrorElementId="txtchildInsuHkid" + i;
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
    	return false;
    }else{
    	if(flag){
    		travelp_click = true;
    		var result = false;
    		var formId = '#' + formId;
    		var method = contextPath+'/ajax/annualTravel/prepareTravelInsuranceTravelSummary';
    		console.log($(formId).serialize());
    		$.ajax({
    			type : "POST",
    			url : method,
    			data : $(formId).serialize(),
    			async : false,
    			success : function(data) {
    				if (data == 'success') {
    					form.action = contextPath+'/'+language+'/annual-travel-insurance/summary';
    					result = true;
    				} else {
    					console.log(data);
    					$("#errorMsg").html(data);
    					scrollToElement("errorMsg");
    					result = false;
    					travelp_click=false;
    				}
    			}
    		});
    		if(!result) {
    			$('#loading-overlay').modal('hide');
    		}
    		return result;
    	}else{
    		$('#loading-overlay').modal('hide');
    		travelp_click=false;
    		return flag
    	}
    	
    }	
	

}
