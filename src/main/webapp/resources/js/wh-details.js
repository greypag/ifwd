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
		setAtt("WhInseffectiveDate", $('#inputWhInseffectiveDate').val())
	});
	
	var checkin = $('#dpWhAppDob').datepicker({
		beforeShowDay: function (date) {
			return date.valueOf() < wh_now;
		},
		autoclose: true,
		todayHighlight: true,
		format: "dd MM yyyy",


	}).on('changeDate', function (ev) {
		setAtt("WhAppDob", $('#inputWhAppDob').val())
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
		
		setAtt("WhAppFullName", $(this).val());
	});
	
	$("#selectWhAppHKID").change(function() {
		setAtt("SelectWhAppHKID", $(this).val());
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
		setAtt("WhAppHKID", $(this).val());
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
		setAtt("WhAppMobileNO", $(this).val());
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
		setAtt("WhAppEmailAdd", $(this).val());
	});
	
	$("#selectWhInsAgeRange").change(function() {
		setAtt("WhInsAgeRange", $(this).val());
	});
	
	$("#selectWhInsBeneficary").change(function() {
		setAtt("WhInsBeneficary", $(this).val());
	});
	
	$("#selectWhInsHKID").change(function() {
		setAtt("SelectWhInsHKID", $(this).val());
	});
	
	
	$( "#inputWhInsFullName" ).on( "change blur", function() {
	    var fullname = $(this).val();
		if (fullname.trim() == "") {
			$("#whInsFullName").html( getBundle(getBundleLanguage, "insured.beneficiary.notNull.message"));//"Please enter your Name in English.";
			return false;
		}
		$("#whInsFullName").html('');
		setAtt("WhInsFullName", $(this).val());
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
		setAtt("WhInsHKID", $(this).val());
	});
	
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
	
	$( "#inputWhInsEstate" ).on( "change blur", function() {
	    var whInsEstate = $(this).val();
	    var whInsBuilding = $("#inputWhInsBuilding").val();
		if (whInsEstate.trim() == "" && whInsBuilding.trim() == "" ) {
			$("#whInsEstate").html( getBundle(getBundleLanguage, "workinghoilday.estate.message"));
			return false;
		}
		$("#whInsEstate").html('');
		setAtt("WhInsEstate", $(this).val());
	});
	
	$( "#inputWhInsBuilding" ).on( "change blur", function() {
	    var whInsBuilding = $(this).val();
	    var whInsEstate = $("#inputWhInsEstate").val();
		if (whInsBuilding.trim() == "" && whInsEstate.trim() == "" ) {
			$("#whInsBuilding").html( getBundle(getBundleLanguage, "workinghoilday.building.message"));
			return false;
		}
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
			$("#errcode").html( getBundle(getBundleLanguage, "payment.creditCard.securityCode.notNull"));//"Please enter your Name in English.";
			return false;
		}else{
			if(seccode.length<3)
			{
				$('#errcode').html(getBundle(getBundleLanguage, "payment.creditCard.securityCode.notValid"));
				return false;
			}
		}
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
	
	document.getElementById("whAppFullName").innerHTML = "";
	document.getElementById("whAppHKID").innerHTML = "";
	document.getElementById("whAppDob").innerHTML = "";
	document.getElementById("whAppMobileNO").innerHTML = "";    
	document.getElementById("whAppEmailAdd").innerHTML = "";
	document.getElementById("whInsAgeRange").innerHTML = "";
	document.getElementById("whInsBeneficary").innerHTML = "";
	document.getElementById("whInsFullName").innerHTML = "";
	document.getElementById("whInsHKID").innerHTML = "";
	document.getElementById("whInsWorkingCty").innerHTML = "";
	document.getElementById("whAppEmailAdd").innerHTML = "";
	
	document.getElementById("whInsRoom").innerHTML = "";
	document.getElementById("whInsFloor").innerHTML = "";
	document.getElementById("whInsBuilding").innerHTML = "";
	document.getElementById("whInsEstate").innerHTML = "";

	var WhAppFullName = document.getElementById("inputWhAppFullName").value;
	var WhAppHKID = document.getElementById("inputWhAppHKID").value;
	var WhAppDob = document.getElementById("inputWhAppDob").value;
	var WhAppMobileNO = document.getElementById("inputWhAppMobileNO").value;
	var WhAppEmailAdd = document.getElementById("inputWhAppEmailAdd").value;
	var WhInseffectiveDate = document.getElementById("inputWhInseffectiveDate").value;
	
	var WhInsRoom = document.getElementById("inputWhInsRoom").value;
	var WhInsFloor = document.getElementById("inputWhInsFloor").value;
	var WhInsBuilding = document.getElementById("inputWhInsBuilding").value;
	var WhInsEstate = document.getElementById("inputWhInsEstate").value;

	if (document.getElementById("checkbox1").checked == false) {
		document.getElementById("chk1").innerHTML = getBundle(getBundleLanguage, "travelcare.declaration.notChecked.message"); //"Please read and accept the Declaration, Terms & Conditions before submitting the application.";
		flag = false;
	}
	if (document.getElementById("checkbox2").checked == false) {
		document.getElementById("chk2").innerHTML = getBundle(getBundleLanguage, "homecare.tnc.notChecked.message");;//"Please read and accept the Personal Information Collection Statement before submitting the application";
		flag = false;
	}
	
	if (WhAppFullName.trim() == "") {
		document.getElementById("whAppFullName").innerHTML = getBundle(getBundleLanguage, "applicant.name.notNull.message");//"Please enter your Name in English.";
		flag = false;
	}

	if($('#selectWhAppHKID').length > 0 && ($('#selectWhAppHKID').val().toLowerCase() == 'passport' || $('#selectWhAppHKID').val().toLowerCase() == 'apppassport')){

		if (WhAppHKID.trim() == "") {
			$('#whAppHKID').html(getBundle(getBundleLanguage, "applicant.passport.notNull.message"));
			flag = false;
		}else{
			var tr = chkTravelHKPass(WhAppHKID.trim());
            var tr1 = chkTravelHKPassLen(WhAppHKID.trim());
            
			if (tr == false) {
				$('#whAppHKID').html(getBundle(getBundleLanguage, "applicant.passport.notValid.message"));
				flag = false;
			}	
			if (tr1 == false) {
				$('#whAppHKID').html(getBundle(getBundleLanguage, "applicant.passport.notValidLength.message"));
				flag = false;
			}
		}
		
	}else{ 
		if (WhAppHKID.trim() == "") {
			$('#whAppHKID').html(getBundle(getBundleLanguage, "applicant.hkId.notNull.message"));
			flag = false;
		}
		var tr=IsHKID(WhAppHKID.trim());
		if(tr==false){
			$('#whAppHKID').html(getBundle(getBundleLanguage, "applicant.hkId.notValid.message"));
			flag = false;
		}
	}
	
	if (WhAppDob.trim() == "") {
		$("#whAppDob").html(getBundle(getBundleLanguage, "workinghoilday.dob.message"));
		flag = false;
	}
		
	if (WhAppMobileNO.trim() == "") {
		$("#whAppMobileNO").html(getBundle(getBundleLanguage, "applicant.mobileNo.notNull.message"));
		flag = false;
	}else {        
		if (mobile_pattern.test(WhAppMobileNO) == false) {
			$("#whAppMobileNO").html(getBundle(getBundleLanguage, "applicant.mobileNo.notValid.message"));
			flag = false;
		}
	}
	
	if (WhAppEmailAdd.trim() == "") {
		$('#whAppEmailAdd').html(getBundle(getBundleLanguage, "applicant.email.notNull.message"));
		flag = false;
	} else {
		if (emailreg.test(WhAppEmailAdd) == false) {
			$('#whAppEmailAdd').html(getBundle(getBundleLanguage, "applicant.email.notValid.message"));
			flag = false;
		}
	}
	
	/*if (WhInsRoom.trim() == "") {
		$("#whInsRoom").html(getBundle(getBundleLanguage, "workinghoilday.room.message"));
		flag = false;
	}
	if (WhInsFloor.trim() == "") {
		$("#whInsFloor").html(getBundle(getBundleLanguage, "workinghoilday.floor.message"));
		flag = false;
	}
	if (WhInsBuilding.trim() == "") {
		$("#whInsBuilding").html(getBundle(getBundleLanguage, "workinghoilday.building.message"));
		flag = false;
	}
	if (WhInsEstate.trim() == "") {
		$("#whInsEstate").html(getBundle(getBundleLanguage, "workinghoilday.estate.message"));
		flag = false;
	}*/
	if(WhInsEstate.trim() == "" && WhInsBuilding.trim() == ""){
		$("#whInsBuilding").html(getBundle(getBundleLanguage, "workinghoilday.building.message"));
		$("#whInsEstate").html(getBundle(getBundleLanguage, "workinghoilday.estate.message"));
		flag = false;
	}
	if (WhInseffectiveDate.trim() == "") {
		$("#whInseffectiveDate").html(getBundle(getBundleLanguage, "workinghoilday.effectivedate.message"));
		flag = false;
	}
    if(wh_click)
    	return false
    else{
    	if(flag)
    		wh_click = true;
    	return flag;
    }	
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
	document.getElementById('errchk1').innerHTML="";
	/*document.getElementById('errchk2').innerHTML="";*/

	if(cardno.length<16 || !isCreditCard(cardno))
	{
		flag=false;
		$('#errcardno').html(getBundle(getBundleLanguage, "payment.creditCard.number.notValid.message"));
	}
	if(month=="" || month== 0)
	{
		flag=false;
		$('#errmonth').html(getBundle(getBundleLanguage, "payment.creditCard.expiryDate.month.notValid.message"));
	}
	if(year=="" || year == 0)
	{
		flag=false;
		$('#erryear').html(getBundle(getBundleLanguage, "payment.creditCard.expiryDate.year.notValid.message"));
	}
	if(holdername.trim()=="")
	{
		flag=false;
		$('#errname').html(getBundle(getBundleLanguage, "payment.creditCard.name.notValid.message"));
	}
	if(seccode.trim()=="")
	{
		flag=false;
		$('#errcode').html(getBundle(getBundleLanguage, "payment.creditCard.securityCode.notNull"));
	}else{
		if(seccode.length<3)
		{
			flag=false;
			$('#errcode').html(getBundle(getBundleLanguage, "payment.creditCard.securityCode.notValid"));
		}
	}
	if (document.getElementById("checkbox3").checked == false)
	{
		$('#errchk1').html(getBundle(getBundleLanguage, "payment.tnc.notChecked.message"));
		flag = false;
	}
	
	return flag;
}

var details_clicked = false;
function confirmDetails(form){
	if (whDetailsValid() && details_clicked === false) {
	//if (details_clicked === false) {
		details_clicked=true;
		var inputWhAppFullName = $("#inputWhAppFullName").val();
		var selectWhAppHKID = $("#selectWhAppHKID").val();
		var inputWhAppHKID = $("#inputWhAppHKID").val();
		var inputWhAppDob = $("#inputWhAppDob").val();
		var inputWhAppMobileNO = $("#inputWhAppMobileNO").val();
		var inputWhAppEmailAdd = $("#inputWhAppEmailAdd").val();
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
			  	'whInsAgeRange':selectWhInsAgeRange,
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
			  	'whInseffectiveDate':inputWhInseffectiveDate
		    };
		var method = this.rootUrl + "/wh-summary";
		var rePage = this.rootUrl + this.rootLang + '/workingholiday-insurance/workingholiday-summary';
		$.ajaxSetup({  
	        contentType : 'application/json'  
	    });
		
		$.ajax({
			type : "POST",
			url : method,
			data : JSON.stringify(planDetailsForm),
			async : false,
			success : function(data) {
				if (data == 'success') {
					form.action=rePage;
				} else {
					console.log("fail to process payment " + data);
				}
			}
		});
		return true;
	}else {
		return false;
	}
}

function setAtt(att, value) {
	var method = this.rootUrl + "/setAtt";
	var data = {"att":att , "value": value};
	$.ajax({
		type : "POST",
		url : method,
		data : data,
		async : false,
		success : function(data) {
		}
	});
}