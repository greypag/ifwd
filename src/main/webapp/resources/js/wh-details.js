$(function () {
	var wh_nowTemp = new Date();
	var wh_now = new Date(wh_nowTemp.getFullYear(), wh_nowTemp.getMonth(), wh_nowTemp.getDate(), 0, 0, 0, 0);
	var wh_tillDate_from = new Date((new Date()).getTime() + 179*24*60*60*1000);
	var wh_tillDate_back = wh_nowTemp.setFullYear(wh_nowTemp.getFullYear() + 1);
	var wh_duration = $('#frmTravelGetQuote').length > 0 ? 180*24*60*60*1000 :30*24*60*60*1000;
	
	// today
	var effective_start_date = new Date();
	
	// 30 days date
	var effective_end_date = new Date();

	effective_end_date.setDate(effective_end_date.getDate()+89);

	
	$('#dpEffectiveDate').datepicker({
		autoclose: true,
		todayHighlight: true,
		format: "dd-mm-yyyy",
		startDate: effective_start_date,
		endDate: effective_end_date

	}).on('changeDate', function (ev) {
		$(".hidden-sm .form-container .topten").html($('#inputWhInseffectiveDate').val())
		setAtt("WhInseffectiveDate", $('#inputWhInseffectiveDate').val())
		$('#whInseffectiveDate').html('');
		$('#dpEffectiveDate').removeClass('invalid-field');
	});
	
//	// 18 year ago date
//	var dob_end_date = new Date();
//	dob_end_date.setFullYear(dob_end_date.getFullYear()-18);
//	
//	// 86 year ago date
//	var dob_start_date = new Date();
//	dob_start_date.setFullYear(dob_start_date.getFullYear()-30);
//	dob_start_date.setDate(dob_start_date.getDate()+1);
//		
//	$('#dpWhAppDob').datepicker({
//		beforeShowDay: function (date) {
//			return date.valueOf() < wh_now;
//		},
//		todayHighlight: true,
//		startView: "decade",
//		autoclose: true,
//		format: "dd-mm-yyyy",
//		startDate: dob_start_date,
//		endDate: dob_end_date
//
//
//	}).on('changeDate', function (ev) {
//		setAtt("WhAppDob", $('#inputWhAppDob').val())
//		$('#whAppDob').html('');
//	});
	
	// 18 year ago date
	var dob_end_date = new Date();
	dob_end_date.setFullYear(dob_end_date.getFullYear()-18);
	
	// 30 year ago date
	var dob_start_date = new Date();
	dob_start_date.setFullYear(dob_start_date.getFullYear()-31);
	dob_start_date.setDate(dob_start_date.getDate()+1);
	
	// birthday datepicker, only 18-85 year-old users can buy the insurance
	$('#dpWhAppDob').datepicker({
		startView: "decade",
		autoclose: true,
		format: "dd-mm-yyyy",
		startDate: dob_start_date,
		endDate: dob_end_date
		/*language: getBundleLanguage*/
	}).on('changeDate', function (ev) {
		setAtt("WhAppDob", $('#inputWhAppDob').val())
		$('#whAppDob').html('');
		$('#dpWhAppDob').removeClass('invalid-field');
	});
	//$('#dpWhAppDob').datepicker('setDate', dob_end_date);
	
	$("#inputFullName").blur(function() {
		var fullname = document.getElementById("inputFullName").value;
		
		if (fullname.trim() == "") {
			$("#whAppFullName").html( getBundle(getBundleLanguage, "applicant.name.notNull.message"));//"Please enter your Name in English.";
			return false;
		}
		if (allLetter(fullname) == false) {
			$("#whAppFullName").html(getBundle(getBundleLanguage, "applicant.name.notNull.message"));
			return false;
		}
		
		$("#whAppFullName").html('');
		
		setAtt("WhAppFullName", $(this).val());
	});
	
	$("#selectWhAppHKID").change(function() {
		setAtt("SelectWhAppHKID", $(this).val());
	});
	
	/*$("#inputWhAppHKID").blur(function() {
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
		setAtt("WhAppHKID", $(this).val());
	});*/
	
	$("#inputMobileNo").blur(function() {
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
		setAtt("WhAppMobileNO", $(this).val());
	});
	
	$("#inputEmailId").blur(function() {
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
		setAtt("WhAppEmailAdd", $(this).val());
	});
	
	/*$("#selectWhInsAgeRange").change(function() {
		setAtt("WhInsAgeRange", $(this).val());
	});*/
	
	$("#selectWhInsBeneficary").change(function() {
//		$("#inputWhInsFullName").val("");
//		$("#selectWhInsHKID").val("HKID");
//		$("#inputWhInsHKID").val("");
		
		setAtt("WhInsBeneficary", $(this).val());
		setAtt("SelectWhInsHKID", "");
		setAtt("WhInsFullName", "");
		setAtt("WhInsHKID", "");
	});
	
	$("#selectWhInsHKID").change(function() {
		setAtt("SelectWhInsHKID", $(this).val());
	});
	
	
	$( "#inputWhInsFullName" ).on( "blur", function() {
	    var fullname = $(this).val();
		if (fullname.trim() == "") {
			$("#whInsFullName").html( getBundle(getBundleLanguage, "insured.beneficiary.notNull.message"));//"Please enter your Name in English.";
			return false;
		}
		$("#whInsFullName").html('');
		setAtt("WhInsFullName", $(this).val());
	});
	
	/*$( "#inputWhInsHKID" ).on( "blur", function() {
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
				if(appHkid.trim() == $( "#inputWhAppHKID" ).val().trim()){
					$("#whInsHKID").html(getBundle(getBundleLanguage, "beneficiary.passport.same.message"));
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
			if(appHkid.trim() == $( "#inputWhAppHKID" ).val().trim()){
				$("#whInsHKID").html(getBundle(getBundleLanguage, "beneficiary.hkId.same.message"));
				return false;
			}
		}
		$("#whInsHKID").html('');
		setAtt("WhInsHKID", $(this).val());
	});*/
	
	$("#selectWhInsWorkingCty").change(function() {
		setAtt("WhInsWorkingCty", $(this).val());
	});
	
	$( "#inputWhInsRoom" ).on( "blur", function() {
		setAtt("WhInsRoom", $(this).val());
	});
	
	$( "#inputWhInsFloor" ).on( "blur", function() {
		setAtt("WhInsFloor", $(this).val());
	});
	
	$( "#inputWhInsBlock" ).on( "blur", function() {
		setAtt("WhInsBlock", $(this).val());
	});
	
	$( "#inputWhInsEstate" ).on( "blur", function() {
		$("#inputWhInsEstate").removeClass("invalid-field");
		$("#inputWhInsBuilding").removeClass("invalid-field");
	    var whInsEstate = $(this).val();
	    var whInsBuilding = $("#inputWhInsBuilding").val();
		if (whInsEstate.trim() == "" && whInsBuilding.trim() == "" ) {
			$("#whInsEstate").html( getBundle(getBundleLanguage, "workinghoilday.estate.message"));
			$("#inputWhInsEstate").addClass("invalid-field");
			$("#inputWhInsBuilding").addClass("invalid-field");
			return false;
		}
		$("#whInsEstate").html('');
		$("#whInsBuilding").html('');
		setAtt("WhInsEstate", $(this).val());
	});
	
	$( "#inputWhInsBuilding" ).on( "blur", function() {
		$("#inputWhInsEstate").removeClass("invalid-field");
		$("#inputWhInsBuilding").removeClass("invalid-field");
	    var whInsBuilding = $(this).val();
	    var whInsEstate = $("#inputWhInsEstate").val();
		if (whInsBuilding.trim() == "" && whInsEstate.trim() == "" ) {
			$("#whInsBuilding").html( getBundle(getBundleLanguage, "workinghoilday.building.message"));
			$("#inputWhInsEstate").addClass("invalid-field");
			$("#inputWhInsBuilding").addClass("invalid-field");
			return false;
		}
		$("#whInsEstate").html('');
		$("#whInsBuilding").html('');
		setAtt("WhInsBuilding", $(this).val());
	});
	
	$( "#inputWhInsStreetNo" ).on( "blur", function() {
		setAtt("WhInsStreetNo", $(this).val());
	});
	
	$( "#inputWhInsStreetName" ).on( "blur", function() {
		setAtt("WhInsStreetName", $(this).val());
	});
	
	$("#selectWhInsDistrict").change(function() {
		$("#whInsDistrict").html('');
		$('#inputDistrict').removeClass('invalid-field');
		setAtt("WhInsDistrict", $(this).val());
	});
	
	$("#inlineCARadio3").change(function() {
		setAtt("WhInsArea", $(this).val());
	});
	
	$("#inlineCARadio4").change(function() {
		setAtt("WhInsArea", $(this).val());
	});
	
	$("#inlineCARadio5").change(function() {
		setAtt("WhInsArea", $(this).val());
	});
	
	//payment
	$( "#seccode" ).on( "change blur", function() {
	    var seccode = $(this).val();
		if (seccode.trim() == "") {
			$("#errcode").html( getBundle(getBundleLanguage, "payment.creditCard.securityCode.notNull.message"));//"Please enter your Name in English.";
			$("#seccode").addClass("invalid-field");
			return false;
		}else{
			if(seccode.length<3)
			{
				$('#errcode').html(getBundle(getBundleLanguage, "payment.creditCard.securityCode.notValid.message"));
				$("#seccode").addClass("invalid-field");
				return false;
			}
		}
		$("#seccode").removeClass("invalid-field");
		$("#errcode").html('');
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
function whDetailsValid(){
	var flag=true;
	
	if($("#inputFullName").val()==namePlaceholder.trim()){
    	$("#inputFullName").val('');
    }
	if($("#inputWhAppHKID").val()==hkidPlaceholder.trim()){
    	$("#inputWhAppHKID").val('');
    }
	
	if($("#inputWhInsFullName").val()==benNamePlaceholder.trim()){
    	$("#inputWhInsFullName").val('');
    }
	if($("#inputWhInsHKID").val()==benHkidPlaceholder.trim()){
    	$("#inputWhInsHKID").val('');
    }
    
    
    if($("#inputWhInsRoom").val().trim()==roomPlaceholder.trim()){
    	$("#inputWhInsRoom").val('');
    }
    if($("#inputWhInsFloor").val().trim()==floorPlaceholder.trim()){
    	$("#inputWhInsFloor").val('');
    }
    if($("#inputWhInsBlock").val().trim()==blockPlaceholder.trim()){
    	$("#inputWhInsBlock").val('');
    }
    if($("#inputWhInsBuilding").val().trim()==buildingPlaceholder.trim()){
    	$("#inputWhInsBuilding").val('');
    }
    if($("#inputWhInsEstate").val().trim()==estatePlaceholder.trim()){
    	$("#inputWhInsEstate").val('');
    }
    if($("#inputWhInsStreetNo").val().trim()==streetNoPlaceholder.trim()){
    	$("#inputWhInsStreetNo").val('');
    }
    if($("#inputWhInsStreetName").val().trim()==streetNamePlaceholder.trim()){
    	$("#inputWhInsStreetName").val('');
    }
	
	document.getElementById("whAppFullName").innerHTML = "";
	document.getElementById("whAppHKID").innerHTML = "";
	document.getElementById("whAppDob").innerHTML = "";
	document.getElementById("whAppMobileNO").innerHTML = "";    
	document.getElementById("whAppEmailAdd").innerHTML = "";
	//document.getElementById("whInsAgeRange").innerHTML = "";
	document.getElementById("whInsBeneficary").innerHTML = "";
	document.getElementById("whInsFullName").innerHTML = "";
	document.getElementById("whInsHKID").innerHTML = "";
	document.getElementById("whInsWorkingCty").innerHTML = "";
	document.getElementById("whAppEmailAdd").innerHTML = "";
	document.getElementById("chk1").innerHTML = "";
	document.getElementById("chk2").innerHTML = "";
	
	var WhAppFullName = document.getElementById("inputFullName").value;
	var WhAppHKID = document.getElementById("inputWhAppHKID").value;
	var WhAppDob = document.getElementById("inputWhAppDob").value;
	var WhAppMobileNO = document.getElementById("inputMobileNo").value;
	var WhAppEmailAdd = document.getElementById("inputEmailId").value;
	var WhInsDistrict = document.getElementById("selectWhInsDistrict").value;
	var WhInseffectiveDate = document.getElementById("inputWhInseffectiveDate").value;
	var WhInsRoom = document.getElementById("inputWhInsRoom").value;
	var WhInsFloor = document.getElementById("inputWhInsFloor").value;
	var WhInsBuilding = document.getElementById("inputWhInsBuilding").value;
	var WhInsEstate = document.getElementById("inputWhInsEstate").value;
	var WhInsFullName = document.getElementById("inputWhInsFullName").value;
	var WhInsHKID = document.getElementById("inputWhInsHKID").value;
	
	if(WhAppHKID.trim()==hkidPlaceholder.trim()){
		WhAppHKID='';
    }    
    if(WhInsRoom.trim()==roomPlaceholder.trim()){
    	WhInsRoom='';
    }
    if(WhInsFloor.trim()==floorPlaceholder.trim()){
    	WhInsFloor='';
    }
    if(WhInsBuilding.trim()==buildingPlaceholder.trim()){
    	WhInsBuilding='';
    }
    if(WhInsEstate.trim()==estatePlaceholder.trim()){
    	WhInsEstate='';
    }
    if(WhInsHKID.trim()==benHkidPlaceholder.trim()){
    	WhInsHKID='';
    }
    
    
    
    //first error element
	var firstErrorElementId="";
    
    

	
	
	if (WhAppFullName.trim() == "") {
		document.getElementById("whAppFullName").innerHTML = getBundle(getBundleLanguage, "applicant.name.notNull.message");//"Please enter your Name in English.";
		$("#inputFullName").addClass("invalid-field");
		if(firstErrorElementId==""){
			firstErrorElementId="inputFullName";
		}
		flag = false;
	}

	if($('#selectWhAppHKID').length > 0 && ($('#selectWhAppHKID').val().toLowerCase() == 'passport' || $('#selectWhAppHKID').val().toLowerCase() == 'apppassport')){

		if (WhAppHKID.trim() == "") {
			$('#whAppHKID').html(getBundle(getBundleLanguage, "applicant.passport.notNull.message"));
			$("#inputWhAppHKID").addClass("invalid-field");
			if(firstErrorElementId==""){
				firstErrorElementId="inputWhAppHKID";
			}
			flag = false;
		}else{
			var tr = chkTravelHKPass(WhAppHKID.trim());
            var tr1 = chkTravelHKPassLen(WhAppHKID.trim());
            if (tr == false) {
            	$('#whAppHKID').html(getBundle(getBundleLanguage, "applicant.passport.notValid.message"));
            	$("#inputWhAppHKID").addClass("invalid-field");
            	if(firstErrorElementId==""){
        			firstErrorElementId="inputWhAppHKID";
        		}
        		flag = false;
            }	
            if (tr1 == false) {
            	$('#whAppHKID').html(getBundle(getBundleLanguage, "applicant.passport.notValidLength.message"));
            	$("#inputWhAppHKID").addClass("invalid-field");
            	if(firstErrorElementId==""){
        			firstErrorElementId="inputWhAppHKID";
        		}
        		flag = false;
            }
		}
		
	}else{ 
		if (WhAppHKID.trim() == "") {
			$('#whAppHKID').html(getBundle(getBundleLanguage, "applicant.hkId.notNull.message"));
			$("#inputWhAppHKID").addClass("invalid-field");
			if(firstErrorElementId==""){
				firstErrorElementId="inputWhAppHKID";
			}
			flag = false;
		}
		var tr=IsHKID(WhAppHKID.trim());
		if(tr==false){
			$('#whAppHKID').html(getBundle(getBundleLanguage, "applicant.hkId.notValid.message"));
			$("#inputWhAppHKID").addClass("invalid-field");
			if(firstErrorElementId==""){
				firstErrorElementId="inputWhAppHKID";
			}
			flag = false;
		}
	}
	
	if (WhAppDob.trim() == "") {
		$("#whAppDob").html(getBundle(getBundleLanguage, "applicant.dob.notNull.message"));
		$("#dpWhAppDob").addClass("invalid-field");
		if(firstErrorElementId==""){
			firstErrorElementId="dpWhAppDob";
		}
		flag = false;
	}
		
	if (WhAppMobileNO.trim() == "") {
		$("#whAppMobileNO").html(getBundle(getBundleLanguage, "applicant.mobileNo.notNull.message"));
		$("#inputMobileNo").addClass("invalid-field");
		if(firstErrorElementId==""){
			firstErrorElementId="inputMobileNo";
		}
		flag = false;
	}else {        
		if (mobile_pattern.test(WhAppMobileNO) == false) {
			$("#whAppMobileNO").html(getBundle(getBundleLanguage, "applicant.mobileNo.notValid.message"));
			$("#inputMobileNo").addClass("invalid-field");
			if(firstErrorElementId==""){
				firstErrorElementId="inputMobileNo";
			}
			flag = false;
		}
	}
	
	if (WhAppEmailAdd.trim() == "") {
		$('#whAppEmailAdd').html(getBundle(getBundleLanguage, "applicant.email.notNull.message"));
		$("#inputEmailId").addClass("invalid-field");
		if(firstErrorElementId==""){
			firstErrorElementId="inputEmailId";
		}
		flag = false;
	} else {
		if (emailreg.test(WhAppEmailAdd) == false) {
			$('#whAppEmailAdd').html(getBundle(getBundleLanguage, "applicant.email.notValid.message"));
			$("#inputEmailId").addClass("invalid-field");
			if(firstErrorElementId==""){
				firstErrorElementId="inputEmailId";
			}
			flag = false;
		}
	}
	
	if($("#selectWhInsBeneficary").val() != "" && $("#selectWhInsBeneficary").val() != 'SE'){
		if (WhInsFullName.trim() == "") {
			$("#whInsFullName").html( getBundle(getBundleLanguage, "insured.beneficiary.notNull.message"));
			$("#inputWhInsFullName").addClass("invalid-field");
			if(firstErrorElementId==""){
				firstErrorElementId="inputWhInsFullName";
			}
			flag = false;
		}
		
		if($('#selectWhInsHKID').length > 0 && $('#selectWhInsHKID').val().toLowerCase() == 'passport'){
			if (WhInsHKID.trim() == "") {
				$("#whInsHKID").html(getBundle(getBundleLanguage, "applicant.passport.notNull.message"));
				$("#inputWhInsHKID").addClass("invalid-field");
				if(firstErrorElementId==""){
					firstErrorElementId="inputWhInsHKID";
				}
				flag = false;
			}else{
				var tr = chkTravelHKPass(WhInsHKID.trim());
				if (tr == false) {
					$("#whInsHKID").html(getBundle(getBundleLanguage, "beneficiary.passport.notValid.message"));
					$("#inputWhInsHKID").addClass("invalid-field");
					if(firstErrorElementId==""){
						firstErrorElementId="inputWhInsHKID";
					}
					flag = false;
				}
				
				var tr1 = chkTravelHKPassLen(WhInsHKID.trim());
				if (tr1 == false) {
					$("#whInsHKID").html(getBundle(getBundleLanguage, "applicant.passport.notValidLength.message"));
					$("#inputWhInsHKID").addClass("invalid-field");
					if(firstErrorElementId==""){
						firstErrorElementId="inputWhInsHKID";
					}
					flag = false;
				}
				
				if(WhInsHKID.trim() == WhAppHKID.trim()){
					$("#whInsHKID").html(getBundle(getBundleLanguage, "beneficiary.passport.same.message"));
					$("#inputWhInsHKID").addClass("invalid-field");
					if(firstErrorElementId==""){
						firstErrorElementId="inputWhInsHKID";
					}
					flag = false;
				}
			}
		}else{ 
			if (WhInsHKID.trim() == "") {
				$("#whInsHKID").html(getBundle(getBundleLanguage, "beneficiary.hkId.notNull.message"));
				$("#inputWhInsHKID").addClass("invalid-field");
				if(firstErrorElementId==""){
					firstErrorElementId="inputWhInsHKID";
				}
				flag = false;
			}else {
				var tr=IsHKID(WhInsHKID.trim());
				if(tr==false){
					$("#whInsHKID").html(getBundle(getBundleLanguage, "beneficiary.hkId.notValid.message"));
					$("#inputWhInsHKID").addClass("invalid-field");
					if(firstErrorElementId==""){
						firstErrorElementId="inputWhInsHKID";
					}
					flag = false;
				}
				
				if(WhInsHKID.trim() == WhAppHKID.trim()){
					$("#whInsHKID").html(getBundle(getBundleLanguage, "beneficiary.hkId.same.message"));
					$("#inputWhInsHKID").addClass("invalid-field");
					if(firstErrorElementId==""){
						firstErrorElementId="inputWhInsHKID";
					}
					flag = false;
				}
			}
		}
			
	}
	
	if(WhInsEstate.trim() == "" && WhInsBuilding.trim() == ""){
		$("#whInsBuilding").html(getBundle(getBundleLanguage, "workinghoilday.building.message"));
		$("#whInsEstate").html(getBundle(getBundleLanguage, "workinghoilday.estate.message"));
		$("#inputWhInsBuilding").addClass("invalid-field");
		$("#inputWhInsEstate").addClass("invalid-field");
		if(firstErrorElementId==""){
			firstErrorElementId="inputWhInsBuilding";
		}
		flag = false;
	}
	
	
	if (WhInsDistrict.trim() == "") {
		$("#whInsDistrict").html(getBundle(getBundleLanguage, "workinghoilday.district.message"));
		$("#inputDistrict").addClass("invalid-field");
		if(firstErrorElementId==""){
			firstErrorElementId="inputDistrict";
		}
		flag = false;
	}
	
	if (WhInseffectiveDate.trim() == "") {
		$("#whInseffectiveDate").html(getBundle(getBundleLanguage, "workinghoilday.effectivedate.message"));
		$("#dpEffectiveDate").addClass("invalid-field");
		if(firstErrorElementId==""){
			firstErrorElementId="dpEffectiveDate";
		}
		flag = false;
	}
	
	
	if (document.getElementById("checkbox1").checked == false) {
		document.getElementById("chk1").innerHTML = getBundle(getBundleLanguage, "travelcare.declaration.notChecked.message"); //"Please read and accept the Declaration, Terms & Conditions before submitting the application.";
		if(firstErrorElementId==""){
			firstErrorElementId="checkbox1";
		}
		flag = false;
	}
	if (document.getElementById("checkbox2").checked == false) {
		document.getElementById("chk2").innerHTML = getBundle(getBundleLanguage, "homecare.tnc.notChecked.message");//"Please read and accept the Personal Information Collection Statement before submitting the application";
		if(firstErrorElementId==""){
			firstErrorElementId="checkbox2";
		}
		flag = false;
	}
	
	
	if(firstErrorElementId!=""){
		scrollToElement(firstErrorElementId);
	}
	
    /*if(wh_click)
    	return false
    else{
    	if(flag)
    		wh_click = true;
    	return flag;
    }	*/
	
	if(!flag){
		$('#loading-overlay').modal('hide');
	}
	
	return flag;
}

function whPayValid()
{

	var flag=true;
	var cardno=document.getElementById("cardnumber").value;

	var month=document.getElementById("month").value;


	var year=document.getElementById("year").value;
	var seccode=document.getElementById("seccode").value;
	var holdername=document.getElementById("holdername").value;

	document.getElementById('errcardno').innerHTML="";
	document.getElementById('errmonth').innerHTML="";
	document.getElementById('erryear').innerHTML="";
	document.getElementById('errname').innerHTML="";	
	document.getElementById('errcode').innerHTML="";
	$("#seccode").removeClass("invalid-field");
	document.getElementById('errchk1').innerHTML="";
	/*document.getElementById('errchk2').innerHTML="";*/

	
	//first error element
	var firstErrorElementId="";
	
	
	if(cardno.length<16 || !fwdPayment.isValid(cardno))
	{
		flag=false;
		$('#errcardno').html(getBundle(getBundleLanguage, "payment.creditCard.number.notValid.message"));
		$("#cardnumber").addClass("invalid-field");
		if(firstErrorElementId==""){
			firstErrorElementId="cardnumber";
		}
	}
	if(month=="" || month== 0)
	{
		flag=false;
		$('#errmonth').html(getBundle(getBundleLanguage, "payment.creditCard.expiryDate.month.notValid.message"));
		$("#inputMonth").addClass("invalid-field");
		if(firstErrorElementId==""){
			firstErrorElementId="inputMonth";
		}
	}
	if(year=="" || year == 0)
	{
		flag=false;
		$('#erryear').html(getBundle(getBundleLanguage, "payment.creditCard.expiryDate.year.notValid.message"));
		$("#inputYear").addClass("invalid-field");
		if(firstErrorElementId==""){
			firstErrorElementId="inputYear";
		}
	}
	if(holdername.trim()=="")
	{
		flag=false;
		$('#errname').html(getBundle(getBundleLanguage, "payment.creditCard.name.notValid.message"));
		$("#holdername").addClass("invalid-field");
		if(firstErrorElementId==""){
			firstErrorElementId="holdername";
		}
	}
	if(seccode.trim()=="")
	{
		flag=false;
		$('#errcode').html(getBundle(getBundleLanguage, "payment.creditCard.securityCode.notNull.message"));
		$("#seccode").addClass("invalid-field");
		if(firstErrorElementId==""){
			firstErrorElementId="seccode";
		}
	}else{
		if(seccode.length<3)
		{
			flag=false;
			$('#errcode').html(getBundle(getBundleLanguage, "payment.creditCard.securityCode.notValid.message"));
			$("#seccode").addClass("invalid-field");
			if(firstErrorElementId==""){
				firstErrorElementId="seccode";
			}
		}
	}
	if (document.getElementById("checkbox3").checked == false)
	{
		$('#errchk1').html(getBundle(getBundleLanguage, "payment.tnc.notChecked.message"));
		flag = false;
		if(firstErrorElementId==""){
			firstErrorElementId="checkbox3";
		}
	}
	
	if(firstErrorElementId!=""){
		scrollToElement(firstErrorElementId);
	}
	
	return flag;
}

var details_clicked = false;
function confirmDetails(form){
	var result =false;
	if (details_clicked === false) {
	//if (details_clicked === false) {
		
		
		
		details_clicked=true;
		var inputWhAppFullName = $("#inputFullName").val();
		var selectWhAppHKID = $("#selectWhAppHKID").val();
		var inputWhAppHKID = $("#inputWhAppHKID").val();
		var inputWhAppDob = $("#inputWhAppDob").val();
		var inputWhAppMobileNO = $("#inputMobileNo").val();
		var inputWhAppEmailAdd = $("#inputEmailId").val();
		var selectWhInsAgeRange = $("#selectWhInsAgeRange").val();
		var selectWhInsBeneficary = $("#selectWhInsBeneficary").val();
		var inputWhInsFullName = $("#inputWhInsFullName").val();
		var selectWhInsHKID = $("#selectWhInsHKID").val();
		var inputWhInsHKID = $("#inputWhInsHKID").val();
		var selectWhInsWorkingCty = $("#selectWhInsWorkingCty").val();
		var inputWhInsRoom = $("#inputWhInsRoom").val();
		var inputWhInsFloor = $("#inputWhInsFloor").val();
		var inputWhInsBlock = $("#inputWhInsBlock").val();
		var inputWhInsBuilding = $("#inputWhInsBuilding").val();
		var inputWhInsEstate = $("#inputWhInsEstate").val();
		var inputWhInsStreetNo = $("#inputWhInsStreetNo").val();
		var inputWhInsStreetName = $("#inputWhInsStreetName").val();
		var selectWhInsDistrict = $("#selectWhInsDistrict").val();
		
		
		
		
		var checkbox1 = document.getElementById("checkbox1").checked;
		var checkbox2 = document.getElementById("checkbox2").checked;
		var checkbox3 = document.getElementById("checkbox3").checked;
		var checkbox4 = document.getElementById("checkbox4").checked;
		
		var radioWhInsArea = "";
		if(document.getElementById("inlineCARadio5").checked){
			radioWhInsArea="NT";
		}else if(document.getElementById("inlineCARadio4").checked){
			radioWhInsArea="KL";
		}else {
			radioWhInsArea="HK";
		}
		
		var inputWhInseffectiveDate = $("#inputWhInseffectiveDate").val();
		
		var planDetailsForm = { 'whAppFullName': inputWhAppFullName,
			  	'selectWhAppHKID': selectWhAppHKID,
			  	'whAppHKID':inputWhAppHKID,
			  	'whAppDob':inputWhAppDob,					  	  
			  	'whAppMobileNO':inputWhAppMobileNO,
			  	'whAppEmailAdd':inputWhAppEmailAdd,
			  	'whInsAgeRange':'',
			  	'whInsBeneficary':selectWhInsBeneficary,
			  	'whInsFullName':inputWhInsFullName,
			  	'selectWhInsHKID':selectWhInsHKID,
			  	'whInsHKID':inputWhInsHKID,
			  	'whInsWorkingCty':selectWhInsWorkingCty,
			  	'whInsRoom':inputWhInsRoom,
			  	'whInsFloor':inputWhInsFloor,
			  	'whInsBlock':inputWhInsBlock,
			  	'whInsBuilding':inputWhInsBuilding,
			  	'whInsEstate':inputWhInsEstate,
			  	'whInsStreetNo':inputWhInsStreetNo,
			  	'whInsStreetName':inputWhInsStreetName,
			  	'whInsDistrict':selectWhInsDistrict,
			  	'whInsArea':radioWhInsArea,
			  	'whInseffectiveDate':inputWhInseffectiveDate,
			  	'checkbox1':checkbox1,
			  	'checkbox2':checkbox2,
			  	'checkbox3':checkbox3,
			  	'checkbox4':checkbox4
		    };
		var method = this.rootUrl + "/wh-summary";
		var rePage = this.rootUrl + this.rootLang + '/working-holiday-insurance/working-holiday-summary';
		$.ajaxSetup({  
	        contentType : 'application/json'  
	    });
		
		console.log(JSON.stringify(planDetailsForm));
		$.ajax({
			type : "POST",
			url : method,
			data : JSON.stringify(planDetailsForm),
			async : false,
			success : function(data) {
				if (data == 'success') {
					result=true;
				} else {
					console.log(data) 
					$("#errorMsg").html(data);
					details_clicked = false;
					wh_click = false;
					result=false;
				}
			}
		});
	}else {
		result=false;
	}
	
	if(!result){
		$('#loading-overlay').modal('hide');
	}
	
	return result;
}

function setAtt(att, value) {
	/*var method = this.rootUrl + "/saveAtt";
	var data = {"att":att , "value": value};
	$.ajax({
		type : "POST",
		url : method,
		data : data,
		async : false,
		success : function(data) {
		}
	});*/
}
