var reg = /^[a-zA-Z]+$/;
var emailreg = /^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
var regex_malasia = /\+60[-]\d{2,4}[-]?\d{6,9}\b/;
var mobile_pattern = /^\d{8}$/;
var password_full_pattern = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[&%$!]).{8,}$/;
var password_pattern = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,}$/;
/* datepicker script*/

/* hkid validation script */
function IsHKID(str) {
	var strValidChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

		// basic check length
		if (str.length < 8)
			return false;

	// handling bracket
	if (str.charAt(str.length - 3) == '(' && str.charAt(str.length - 1) == ')')
		str = str.substring(0, str.length - 3) + str.charAt(str.length - 2);

	// convert to upper case
	str = str.toUpperCase();

	// regular expression to check pattern and split
	var hkidPat = /^([A-Z]{1,2})([0-9]{6})([A0-9])$/;
	var matchArray = str.match(hkidPat);

	// not match, return false
	if (matchArray == null)
		return false;

	// the character part, numeric part and check digit part
	var charPart = matchArray[1];
	var numPart = matchArray[2];
	var checkDigit = matchArray[3];

	// calculate the checksum for character part
	var checkSum = 0;
	if (charPart.length == 2) {
		checkSum += 9 * (10 + strValidChars.indexOf(charPart.charAt(0)));
		checkSum += 8 * (10 + strValidChars.indexOf(charPart.charAt(1)));
	} else {
		checkSum += 9 * 36;
		checkSum += 8 * (10 + strValidChars.indexOf(charPart));
	}

	// calculate the checksum for numeric part
	for (var i = 0, j = 7; i < numPart.length; i++, j--)
		checkSum += j * numPart.charAt(i);

	// verify the check digit
	var remaining = checkSum % 11;
	var verify = remaining == 0 ? 0 : 11 - remaining;

	return verify == checkDigit || (verify == 10 && checkDigit == 'A');
}

$(function () {
	/*get now date*/
	var nowTemp = new Date();
	var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);



	/* desktoip datepicker*/
	var checkin = $('#dp1').datepicker({
		beforeShowDay: function (date) {
			return date.valueOf() >= now.valueOf();
		},
		autoclose: true,
		todayHighlight: true,
		format: "dd MM yyyy"

	}).on('changeDate', function (ev) {
		if (ev.date.valueOf() > checkout.datepicker("getDate").valueOf() || !checkout.datepicker("getDate").valueOf()) {
			var newDate = new Date(ev.date);
			newDate.setDate(newDate.getDate());
			checkout.datepicker("update", newDate);
		}
		$('#dp2')[0].focus();
		var startDate = new Date($('#dp1').datepicker("getDate").valueOf());
		var endDate = new Date($('#dp2').datepicker("getDate").valueOf());
		document.getElementById("divPersonsDesk").style.visibility = "visible";
		document.getElementById("lblDaysDesk").innerHTML = isNaN(dateDiffInDays(startDate, endDate)) ? 0 : dateDiffInDays(startDate, endDate);

	});
	var checkout = $('#dp2').datepicker({
		beforeShowDay: function (date) {
			if (!checkin.datepicker("getDate").valueOf()) {

				return date.valueOf() >= new Date().valueOf();
			} else {
				return date.valueOf() >= checkin.datepicker("getDate").valueOf();
			}
		},
		autoclose: true,
		format: "dd MM yyyy"

	}).on('changeDate', function (ev) {
		var startDate = new Date($('#dp1').datepicker("getDate").valueOf());
		var endDate = new Date($('#dp2').datepicker("getDate").valueOf());
		document.getElementById("divPersonsDesk").style.visibility = "visible";
		document.getElementById("lblDaysDesk").innerHTML = isNaN(dateDiffInDays(startDate, endDate)) ? 0 : dateDiffInDays(startDate, endDate);

	});



	/* mobile datepicker */
	var checkin2 = $('#dp3').datepicker({
		beforeShowDay: function (date) {
			return date.valueOf() >= now.valueOf();
		},
		autoclose: true,
		todayHighlight: true,
		format: "dd MM yyyy"

	}).on('changeDate', function (ev) {
		if (ev.date.valueOf() > checkout2.datepicker("getDate").valueOf() || !checkout2.datepicker("getDate").valueOf()) {
			var newDate = new Date(ev.date);
			newDate.setDate(newDate.getDate());
			checkout2.datepicker("update", newDate);
		}
		$('#dp4')[0].focus();

		var startDate = new Date($('#dp3').datepicker("getDate").valueOf());
		var endDate = new Date($('#dp4').datepicker("getDate").valueOf());
		document.getElementById("divPersonsMob").style.visibility = "visible";
		document.getElementById("lblDaysMob").innerHTML = isNaN(dateDiffInDays(startDate, endDate)) ? 0 : dateDiffInDays(startDate, endDate);

	});
	var checkout2 = $('#dp4').datepicker({
		beforeShowDay: function (date) {
			if (!checkin2.datepicker("getDate").valueOf()) {
				return date.valueOf() >= new Date().valueOf();
			} else {
				return date.valueOf() >= checkin2.datepicker("getDate").valueOf();
			}
		},
		autoclose: true,
		format: "dd MM yyyy"

	}).on('changeDate', function (ev) {

		var startDate = new Date($('#dp3').datepicker("getDate").valueOf());
		var endDate = new Date($('#dp4').datepicker("getDate").valueOf());
		document.getElementById("divPersonsMob").style.visibility = "visible";
		document.getElementById("lblDaysMob").innerHTML = isNaN(dateDiffInDays(startDate, endDate)) ? 0 : dateDiffInDays(startDate, endDate);

	});



	/* bottom datepicker */
	var checkin3 = $('#dp5').datepicker({
		beforeShowDay: function (date) {
			return date.valueOf() >= now.valueOf();
		},
		autoclose: true,
		todayHighlight: true,
		format: "dd MM yyyy"

	}).on('changeDate', function (ev) {
		if (ev.date.valueOf() > checkout3.datepicker("getDate").valueOf() || !checkout3.datepicker("getDate").valueOf()) {
			var newDate = new Date(ev.date);
			newDate.setDate(newDate.getDate());
			checkout3.datepicker("update", newDate);
		}
		$('#dp6')[0].focus();
		var startDate = new Date($('#dp5').datepicker("getDate").valueOf());
		var endDate = new Date($('#dp6').datepicker("getDate").valueOf());
		document.getElementById("divPersonsBtm").style.visibility = "visible";
		document.getElementById("lblDaysBtm").innerHTML = isNaN(dateDiffInDays(startDate, endDate)) ? 0 : dateDiffInDays(startDate, endDate);

	});
	var checkout3 = $('#dp6').datepicker({
		beforeShowDay: function (date) {
			if (!checkin3.datepicker("getDate").valueOf()) {

				return date.valueOf() >= new Date().valueOf();
			} else {
				return date.valueOf() >= checkin3.datepicker("getDate").valueOf();
			}
		},
		autoclose: true,
		format: "dd MM yyyy"

	}).on('changeDate', function (ev) { 

		var startDate = new Date($('#dp5').datepicker("getDate").valueOf());
		var endDate = new Date($('#dp6').datepicker("getDate").valueOf());
		document.getElementById("divPersonsBtm").style.visibility = "visible";
		document.getElementById("lblDaysBtm").innerHTML = isNaN(dateDiffInDays(startDate, endDate)) ? 0 : dateDiffInDays(startDate, endDate);

	});

});//]]>  

/* No spinner */




function dateDiffInDays(a, b) {
	// Discard the time and time-zone information.
	var diffDays = (b - a) / 1000 / 60 / 60 / 24;
	return diffDays + 1;
}


/* login popup and overlay scirpt */


$("#fwd-login,#fwd-login-mob").on('click', function (e) {
	if (!$('#overlay').length) {
		$('body').append('<div id="overlay"> </div>')
	}
})
$('body').click(function (e) {
	if (!$(e.target).is('#fwd-login,#fwd-login-mob')) {
		$('#overlay').remove();
	}
})

$('#myDropdown .dropdown-menu,#myDropdownMob .dropdown-menu').on({
	"click": function (e) {
		e.stopPropagation();
	}
});
$('#myFWDropdown .dropdown-menu,#myFWDropdownMob .dropdown-menu,#myFWDropdownBtm .dropdown-menu').on({
	"click": function (e) {
		e.stopPropagation();
	}
});

/* flight plan details your details validation */

function fPlanValid()
{

	var flag=true;
	document.getElementById("fullnameinvalid").innerHTML = "";
	document.getElementById("errAppHkid").innerHTML = "";
	document.getElementById("emailid").innerHTML = "";    
	document.getElementById("mobileNo").innerHTML = "";
	document.getElementById("chk1").innerHTML = "";
	document.getElementById("chk2").innerHTML = "";

	var fullname = document.getElementById("inputFullName").value;
	var emailId = document.getElementById("inputEmailId").value;
	var mobileNo = document.getElementById("inputMobileNo").value;
	var appHkid = document.getElementById("inputTxtAppHkid").value;


	if (document.getElementById("checkbox1").checked == false) {
		document.getElementById("chk1").innerHTML = "Please read and accept the Declaration, Terms & Conditions before submitting the application.";
		flag = false;
	}
	if (document.getElementById("checkbox2").checked == false) {
		document.getElementById("chk2").innerHTML = "Please read and accept the Personal Information Collection Statement before submitting the application";
		flag = false;
	}

	if (fullname.trim() == "") {
		document.getElementById("fullnameinvalid").innerHTML = "Please enter your Name in English.";
		flag = false;
	}

	if (emailId.trim() == "") {
		document.getElementById("emailid").innerHTML = "Your E-mail Address is invalid.";
		flag = false;
	} else {
		if (emailreg.test(emailId) == false) {

			document.getElementById("emailid").innerHTML = "Your E-mail Address is invalid.";
			flag = false;
		}
	}

	if (appHkid.trim() == "") {
		document.getElementById("errAppHkid").innerHTML = "Please enter your HKID No.";
		flag = false;
	}else {
		var tr=IsHKID(appHkid.trim());
		if(tr==false)
		{
			document.getElementById("errAppHkid").innerHTML = "Your HKID No. is invalid.";
			flag = false;
		}
	}


	if (mobileNo.trim() == "") {
		document.getElementById("mobileNo").innerHTML = "Please enter your Mobile No.";
		flag = false;
	}else {        
		if (mobile_pattern.test(mobileNo) == false) {
			document.getElementById("mobileNo").innerHTML = "Your Mobile No. is invalid.";
			flag = false;
		}
	}


	if (document.getElementById("checkbox1").checked == false) {
		document.getElementById("chk1").innerHTML = "Please read and accept the Declaration, Terms & Conditions before submitting the application.";
		flag = false;
	}
	if (document.getElementById("checkbox2").checked == false) {
		document.getElementById("chk2").innerHTML = "Please read and accept the Personal Information Collection Statement before submitting the application";
		flag = false;
	}

	var rowCountAdult=document.getElementById("totalAdultTraveler").value;
	var rowCountChild=document.getElementById("totalCountOfChild").value;
	var rowCountOther=document.getElementById("totalCountOther").value;

	/* Adult Beneficiary validation */
	for (var i = 1; i <= parseInt(rowCountAdult) ; i++)
	{

		var fullname = document.getElementById("txtAdFullName" + i).value;
		if (fullname.trim() == "") {
			document.getElementById("errtxtAdFullName" + i).innerHTML = "Please enter Insured Person's Name in English.";
			flag = false;
		}else{
			document.getElementById("errtxtAdFullName" + i).innerHTML = "";
		}

		var age = document.getElementById("selectAgeRange" + i).value;
		if (age.trim() == "") {
			document.getElementById("errselectAgeRange" + i).innerHTML = "Please select Insured Person's Age Range.";
			flag = false;
		}else{
			document.getElementById("errselectAgeRange" + i).innerHTML = "";
		}

		var benefitiary = document.getElementById("adultsselectBenificiary" + i).value;
		if (benefitiary.trim() == "") {
			document.getElementById("erradultsselectBenificiary" + i).innerHTML = "Please enter Insured Person's Name in English.";
			flag = false;
		}else{
			document.getElementById("erradultsselectBenificiary" + i).innerHTML = "";
		}


		var hkid = document.getElementById("txtInsuHkid" + i).value;
		document.getElementById("errtxtInsuHkid" + i).innerHTML = "";
		document.getElementById("errtxtInvalidInsuHkid" + i).innerHTML = "";

		if (hkid.trim() == "") {
			document.getElementById("errtxtInsuHkid" + i).innerHTML = "Please enter Insured Person's HKID No.";
			flag = false;
		}else
		{
			var tr=IsHKID(hkid.trim());
			if(tr==false)
			{
				document.getElementById("errtxtInvalidInsuHkid" + i).innerHTML = "Insured Person's HKID No. is invalid.";
				flag = false;
			}
		}

		var selectedValue = document.getElementById("adultsselectBenificiary" + i).value;

		if(selectedValue != "SE"){
			if (document.getElementById("adultBenefitiaryId" + i).value == "")
			{
				document.getElementById("erradultBenefitiaryId" + i).innerHTML="Please enter Beneficiary Name in English.";
				flag = false;             
			}
			else
			{
				document.getElementById("erradultBenefitiaryId" + i).innerHTML = "";
			}
			if (document.getElementById("adultBenefitiaryHKId" + i).value == "") {
				document.getElementById("erradultBenefitiaryHKId" + i).innerHTML = "Beneficiary HKID No. is invalid.";
				flag = false;
			}
			else {

				document.getElementById("erradultBenefitiaryHKId" + i).innerHTML = "";
			}
		}


	}

	/* Child Beneficiary validation */
	for (var i = 1; i <= parseInt(rowCountChild) ; i++)
	{
		var hkid = document.getElementById("txtChldInsuHkid" + i).value;
		var fullname = document.getElementById("txtChldFullName" + i).value;
		var age = document.getElementById("selectchildAgeRange" + i).value;
		/*var benefitiary = document.getElementById("childselectBenificiary" + i).value;*/
		if (fullname.trim() == "") {
			document.getElementById("errtxtChldFullName" + i).innerHTML = "Please enter Insured Person's Name in English.";
			flag = false;
		}else{
			document.getElementById("errtxtChldFullName" + i).innerHTML = "";
		}

		if (age.trim() == "") {
			document.getElementById("errchildRange" + i).innerHTML = "Please select Insured Person's Age Range.";
			flag = false;
		}else{
			document.getElementById("errchildRange" + i).innerHTML = "";
		}

		/*if (benefitiary.trim() == "") {
			document.getElementById("errselectChildbenificiary" + i).innerHTML = "Please enter Insured Person's Name in English.";
			flag = false;
		}*/
		document.getElementById("errtxtChldInsuHkid" + i).innerHTML = "";
		document.getElementById("errtxtChldInsuHkid" + i).innerHTML = "";

		if (hkid.trim() == "") {
			document.getElementById("errtxtChldInsuHkid" + i).innerHTML = "Please enter Insured Person's HKID No.";
			flag = false;
		}
		else
		{
			var tr=IsHKID(hkid.trim());
			if(tr==false)
			{
				document.getElementById("errtxtChldInsuHkid" + i).innerHTML = "Insured Person's HKID No. is invalid.";
				flag = false;
			}
		}
		var selectedValue = document.getElementById("childselectBenificiary" + i).value;
		if(selectedValue != "SE"){
			if (document.getElementById("childBenefitiaryName" + i).value == "")
			{
				document.getElementById("errchildBenefitiaryName" + i).innerHTML="Please enter Beneficiary Name in English.";
				flag = false;             
			}
			else
			{
				document.getElementById("errchildBenefitiaryName" + i).innerHTML = "";
			}

			if (document.getElementById("txtchildInsuHkid" + i).value == "") {
				document.getElementById("errtxtchildInsuHkid" + i).innerHTML = "Beneficiary HKID No. is invalid.";
				flag = false;
			}
			else {
				document.getElementById("errtxtchildInsuHkid" + i).innerHTML = "";
			}
		}

	}

	/* Other Beneficiary validation */
	for (var i = 1; i <= parseInt(rowCountOther) ; i++)
	{
		var hkid = document.getElementById("txtOtherInsuHkid" + i).value;
		var fullname = document.getElementById("txtOtherFullName" + i).value;
		var age = document.getElementById("selectOtherAgeRange" + i).value;
		/*var benefitiary = document.getElementById("childselectBenificiary" + i).value;*/

		if (fullname.trim() == "") {
			document.getElementById("errtxtOtherFullName" + i).innerHTML = "Please enter Insured Person's Name in English.";
			flag = false;
		}else{
			document.getElementById("errtxtOtherFullName" + i).innerHTML = "";
		}


		if (age.trim() == "") {
			document.getElementById("errselectOtherAgeRange" + i).innerHTML = "Please select Insured Person's Age Range.";
			flag = false;
		}else{
			document.getElementById("errselectOtherAgeRange" + i).innerHTML = "";
		}

		/*if (benefitiary.trim() == "") {
			document.getElementById("errselectChildbenificiary" + i).innerHTML = "Please enter Insured Person's Name in English.";
			flag = false;
		}*/

		document.getElementById("errtxtOtherInsuHkid" + i).innerHTML = "";


		if (hkid.trim() == "") {
			document.getElementById("errtxtOtherInsuHkid" + i).innerHTML = "Please enter Insured Person's HKID No.";
			flag = false;
		}
		else
		{
			var tr=IsHKID(hkid.trim());
			if(tr==false)
			{
				document.getElementById("errtxtOtherInsuHkid" + i).innerHTML = "Insured Person's HKID No. is invalid.";
				flag = false;
			}
		}

		var selectedValue = document.getElementById("otherSelectBenificiary" + i).value;
		if(selectedValue != "SE"){
			if (document.getElementById("otherBenefitiaryName" + i).value == "")
			{
				document.getElementById("errotherBenefitiaryName" + i).innerHTML="Please enter Beneficiary Name in English.";
				flag = false;             
			}
			else
			{
				document.getElementById("errotherBenefitiaryName" + i).innerHTML = "";
				flag = false;
			}

			if (document.getElementById("txtOtherBenInsuHkid" + i).value == "") {
				document.getElementById("errtxtOtherBenInsuHkid" + i).innerHTML = "Beneficiary HKID No. is invalid.";
				flag = false;
			}
			else {
				document.getElementById("errtxtOtherBenInsuHkid" + i).innerHTML = "";
			}
		}
	}


	return flag;

}
//Travel plan details page validation
function tPlanValid()
{

	var flag=true;
	document.getElementById("fullnameinvalid").innerHTML = "";
	document.getElementById("errAppHkid").innerHTML = "";
	document.getElementById("emailid").innerHTML = "";    
	document.getElementById("mobileNo").innerHTML = "";
	document.getElementById("chk1").innerHTML = "";
	document.getElementById("chk2").innerHTML = "";

	var fullname = document.getElementById("inputFullName").value;
	var emailId = document.getElementById("inputEmailId").value;
	var mobileNo = document.getElementById("inputMobileNo").value;
	var appHkid = document.getElementById("inputTxtAppHkid").value;


	if (document.getElementById("checkbox1").checked == false) {
		document.getElementById("chk1").innerHTML = "Please read and accept the Declaration, Terms & Conditions before submitting the application.";
		flag = false;
	}
	if (document.getElementById("checkbox2").checked == false) {
		document.getElementById("chk2").innerHTML = "Please read and accept the Personal Information Collection Statement before submitting the application";
		flag = false;
	}

	if (fullname.trim() == "") {
		document.getElementById("fullnameinvalid").innerHTML = "Please enter your Name in English.";
		flag = false;
	}

	if (emailId.trim() == "") {
		document.getElementById("emailid").innerHTML = "Your E-mail Address is invalid.";
		flag = false;
	} else {
		if (emailreg.test(emailId) == false) {

			document.getElementById("emailid").innerHTML = "Your E-mail Address is invalid.";
			flag = false;
		}
	}

	/*if (appHkid.trim() == "") {
		document.getElementById("errAppHkid").innerHTML = "Please enter your HKID No.";
		flag = false;
	}else {
		var tr=IsHKID(appHkid.trim());
		if(tr==false)
		{
			document.getElementById("errAppHkid").innerHTML = "Your HKID No. is invalid.";
			flag = false;
		}
	}*/

	/**** VAlidation for HKID and Passport ***/
	var selectHkidPass = document.getElementById("selectHkidPass").value;
	if (appHkid.trim() == "") {
		if (selectHkidPass == "hkId") {
			document.getElementById("errAppHkid").innerHTML = "Please enter your HKID No.";
			flag = false;
		}
		else {
			document.getElementById("errAppHkid").innerHTML = "Your Passport No. is invalid.";
			flag = false;
		}
	}
	else {
		if (selectHkidPass == "hkId") {
			var tr = IsHKID(appHkid.trim());
			if (tr == false) {
				document.getElementById("errAppHkid").innerHTML = "Your HKID No. is invalid.";
				flag = false;
			}
		}
		else {
			var tr = chkTravelHKPass(appHkid.trim());
			if (tr == false) {
				document.getElementById("errAppHkid").innerHTML = "Your Passport No. is invalid.";
				flag = false;
			}
		}
	}


	if (mobileNo.trim() == "") {
		document.getElementById("mobileNo").innerHTML = "Please enter your Mobile No.";
		flag = false;
	}else {        
		if (mobile_pattern.test(mobileNo) == false) {
			document.getElementById("mobileNo").innerHTML = "Your Mobile No. is invalid.";
			flag = false;
		}
	}


	if (document.getElementById("checkbox1").checked == false) {
		document.getElementById("chk1").innerHTML = "Please read and accept the Declaration, Terms & Conditions before submitting the application.";
		flag = false;
	}
	if (document.getElementById("checkbox2").checked == false) {
		document.getElementById("chk2").innerHTML = "Please read and accept the Personal Information Collection Statement before submitting the application";
		flag = false;
	}

	var rowCountAdult=document.getElementById("totalAdultTraveler").value;
	var rowCountChild=document.getElementById("totalCountOfChild").value;
	var rowCountOther=document.getElementById("totalCountOther").value;

	/* Adult Beneficiary validation */
	for (var i = 1; i <= parseInt(rowCountAdult) ; i++)
	{

		var fullname = document.getElementById("txtAdFullName" + i).value;
		if (fullname.trim() == "") {
			document.getElementById("errtxtAdFullName" + i).innerHTML = "Please enter Insured Person's Name in English.";
			flag = false;
		}else{
			document.getElementById("errtxtAdFullName" + i).innerHTML = "";
		}

		var age = document.getElementById("selectAgeRange" + i).value;
		if (age.trim() == "") {
			document.getElementById("errselectAgeRange" + i).innerHTML = "Please select Insured Person's Age Range.";
			flag = false;
		}else{
			document.getElementById("errselectAgeRange" + i).innerHTML = "";
		}

		var benefitiary = document.getElementById("adultsselectBenificiary" + i).value;
		if (benefitiary.trim() == "") {
			document.getElementById("erradultsselectBenificiary" + i).innerHTML = "Please enter Insured Person's Name in English.";
			flag = false;
		}else{
			document.getElementById("erradultsselectBenificiary" + i).innerHTML = "";
		}

		var selectAdHkidPass = document.getElementById("selectAdHkidPass"+i).value;
		var hkid = document.getElementById("txtInsuHkid" + i).value;
		document.getElementById("errtxtInsuHkid" + i).innerHTML = "";
		document.getElementById("errtxtInvalidInsuHkid" + i).innerHTML = "";
		if (hkid.trim() == "") {
			if (selectAdHkidPass == "hkId") {
				document.getElementById("errtxtInsuHkid"+i).innerHTML = "Please enter Insured Person's HKID No.";
				flag = false;
			}
			else {
				document.getElementById("errtxtInsuHkid"+i).innerHTML = "Insured Person's HKID No. is invalid.";
				flag = false;
			}
		}
		else {
			if (selectAdHkidPass == "hkId") {
				var tr = IsHKID(hkid.trim());
				if (tr == false) {
					document.getElementById("errtxtInvalidInsuHkid"+i).innerHTML = "Insured Person's HKID No. is invalid.";
					flag = false;
				}
			}
			else {
				var tr = chkTravelHKPass(hkid.trim());
				if (tr == false) {
					document.getElementById("errtxtInvalidInsuHkid"+i).innerHTML = "Insured Person's Passport No. is invalid.";
					flag = false;
				}
			}
		}



		/*if (hkid.trim() == "") {
				document.getElementById("errtxtInsuHkid" + i).innerHTML = "Please enter your HKID No.";
				flag = false;
			}else
			{
				var tr=IsHKID(hkid.trim());
				if(tr==false)
				{
					document.getElementById("errtxtInvalidInsuHkid" + i).innerHTML = "Your HKID No. is invalid.";
					flag = false;
				}
			}*/

		var selectedValue = document.getElementById("adultsselectBenificiary" + i).value;

		if(selectedValue != "SE"){
			if (document.getElementById("adultBenefitiaryId" + i).value == "")
			{
				document.getElementById("erradultBenefitiaryId" + i).innerHTML="Please enter Beneficiary Name in English.";
				flag = false;             
			}
			else
			{
				document.getElementById("erradultBenefitiaryId" + i).innerHTML = "";
			}
			/*if (document.getElementById("adultBenefitiaryHKId" + i).value == "") {
				document.getElementById("erradultBenefitiaryHKId" + i).innerHTML = "Beneficiary which is blank";
				flag = false;
			}
			else {

				document.getElementById("erradultBenefitiaryHKId" + i).innerHTML = "";
			}*/
			var selectOtHkidPass = document.getElementById("selectAdBenefitiaryHkidPass"+i).value;
			var hkid = document.getElementById("adultBenefitiaryHKId" + i).value;
			document.getElementById("erradultBenefitiaryHKId" + i).innerHTML = "";
			document.getElementById("errInvalidadultBenefitiaryHKId" + i).innerHTML = "";
			if (hkid.trim() == "") {
				if (selectOtHkidPass == "hkId") {
					document.getElementById("erradultBenefitiaryHKId"+i).innerHTML = "Please enter Insured Person's HKID No.";
					flag = false;
				}
				else {
					document.getElementById("erradultBenefitiaryHKId"+i).innerHTML = "Insured Person's HKID No. is invalid";
					flag = false;
				}
			}
			else {
				if (selectOtHkidPass == "hkId") {
					var tr = IsHKID(hkid.trim());
					if (tr == false) {
						document.getElementById("errInvalidadultBenefitiaryHKId"+i).innerHTML = "Insured Person's HKID No. is invalid";
						flag = false;
					}
				}
				else {
					var tr = chkTravelHKPass(hkid.trim());
					if (tr == false) {
						document.getElementById("errInvalidadultBenefitiaryHKId"+i).innerHTML = "Insured Person's Passport No. is invalid.";
						flag = false;
					}
				}
			}
		}


	}

	/* Child Beneficiary validation */
	for (var i = 1; i <= parseInt(rowCountChild) ; i++)
	{
		var fullname = document.getElementById("txtChldFullName" + i).value;
		var age = document.getElementById("selectchildAgeRange" + i).value;
		/*var benefitiary = document.getElementById("childselectBenificiary" + i).value;*/
		if (fullname.trim() == "") {
			document.getElementById("errtxtChldFullName" + i).innerHTML = "Please enter Insured Person's Name in English.";
			flag = false;
		}else{
			document.getElementById("errtxtChldFullName" + i).innerHTML = "";
		}

		if (age.trim() == "") {
			document.getElementById("errchildRange" + i).innerHTML = "Please select Insured Person's Age Range.";
			flag = false;
		}else{
			document.getElementById("errchildRange" + i).innerHTML = "";
		}

		/*if (benefitiary.trim() == "") {
			document.getElementById("errselectChildbenificiary" + i).innerHTML = "Please enter Insured Person's Name in English.";
			flag = false;
		}*/
		/*document.getElementById("errtxtChldInsuHkid" + i).innerHTML = "";

		if (hkid.trim() == "") {
			document.getElementById("errtxtChldInsuHkid" + i).innerHTML = "Please enter your HKID No.";
			flag = false;
		}
		else
		{
			var tr=IsHKID(hkid.trim());
			if(tr==false)
			{
				document.getElementById("errtxtChldInsuHkid" + i).innerHTML = "Your HKID No. is invalid.";
				flag = false;
			}
		}*/
		
		var selectChldHkidPass = document.getElementById("selectChldHkidPass"+i).value;
		var hkid = document.getElementById("txtChldInsuHkid" + i).value;
		document.getElementById("errtxtChldInsuHkid" + i).innerHTML = "";
		document.getElementById("errtxtChldInvalidInsuHkid" + i).innerHTML = "";
		if (hkid.trim() == "") {
			if (selectChldHkidPass == "hkId") {
				document.getElementById("errtxtChldInsuHkid"+i).innerHTML = "Please enter Insured Person's HKID No.";
				flag = false;
			}
			else {
				document.getElementById("errtxtChldInsuHkid"+i).innerHTML = "Insured Person's Passport No. is invalid.";
				flag = false;
			}
		}
		else {
			if (selectChldHkidPass == "hkId") {
				var tr = IsHKID(hkid.trim());
				if (tr == false) {
					document.getElementById("errtxtChldInvalidInsuHkid"+i).innerHTML = "Insured Person's HKID No. is invalid.";
					flag = false;
				}
			}
			else {
				var tr = chkTravelHKPass(hkid.trim());
				if (tr == false) {
					document.getElementById("errtxtChldInvalidInsuHkid"+i).innerHTML = "Insured Person's Passport No. is invalid.";
					flag = false;
				}
			}
		}
		
		
		var selectedValue = document.getElementById("childselectBenificiary" + i).value;
		if(selectedValue != "SE"){
			if (document.getElementById("childBenefitiaryName" + i).value == "")
			{
				document.getElementById("errchildBenefitiaryName" + i).innerHTML="Please enter Beneficiary Name in English.";
				flag = false;             
			}
			else
			{
				document.getElementById("errchildBenefitiaryName" + i).innerHTML = "";
			}

			/*if (document.getElementById("txtchildInsuHkid" + i).value == "") {
				document.getElementById("errtxtchildInsuHkid" + i).innerHTML = "Beneficiary which is blank";
				flag = false;
			}
			else {
				document.getElementById("errtxtchildInsuHkid" + i).innerHTML = "";
			}*/
			var selectOtHkidPass = document.getElementById("selectChldBenefitiaryHkidPass"+i).value;
			var hkid = document.getElementById("txtchildInsuHkid" + i).value;
			document.getElementById("errtxtchildInsuHkid" + i).innerHTML = "";
			document.getElementById("errtxtInvalidchildInsuHkid" + i).innerHTML = "";
			if (hkid.trim() == "") {
				if (selectOtHkidPass == "hkId") {
					document.getElementById("errtxtchildInsuHkid"+i).innerHTML = "Please enter Insured Person's HKID No.";
					flag = false;
				}
				else {
					document.getElementById("errtxtchildInsuHkid"+i).innerHTML = "Insured Person's Passport No. is invalid.";
					flag = false;
				}
			}
			else {
				if (selectOtHkidPass == "hkId") {
					var tr = IsHKID(hkid.trim());
					if (tr == false) {
						document.getElementById("errtxtInvalidchildInsuHkid"+i).innerHTML = "Insured Person's HKID No. is invalid.";
						flag = false;
					}
				}
				else {
					var tr = chkTravelHKPass(hkid.trim());
					if (tr == false) {
						document.getElementById("errtxtInvalidchildInsuHkid"+i).innerHTML = "Insured Person's Passport No. is invalid.";
						flag = false;
					}
				}
			}
		}

	}

	/* Other Beneficiary validation */
	for (var i = 1; i <= parseInt(rowCountOther) ; i++)
	{
		var fullname = document.getElementById("txtOtherFullName" + i).value;
		var age = document.getElementById("selectOtherAgeRange" + i).value;
		/*var benefitiary = document.getElementById("childselectBenificiary" + i).value;*/

		if (fullname.trim() == "") {
			document.getElementById("errtxtOtherFullName" + i).innerHTML = "Please enter Insured Person's Name in English.";
			flag = false;
		}else{
			document.getElementById("errtxtOtherFullName" + i).innerHTML = "";
		}


		if (age.trim() == "") {
			document.getElementById("errselectOtherAgeRange" + i).innerHTML = "Please select Insured Person's Age Range.";
			flag = false;
		}else{
			document.getElementById("errselectOtherAgeRange" + i).innerHTML = "";
		}

		/*if (benefitiary.trim() == "") {
			document.getElementById("errselectChildbenificiary" + i).innerHTML = "Please enter Insured Person's Name in English.";
			flag = false;
		}*/

		/*document.getElementById("errtxtOtherInsuHkid" + i).innerHTML = "";


		if (hkid.trim() == "") {
			document.getElementById("errtxtOtherInsuHkid" + i).innerHTML = "Please enter your HKID No.";
			flag = false;
		}
		else
		{
			var tr=IsHKID(hkid.trim());
			if(tr==false)
			{
				document.getElementById("errtxtOtherInsuHkid" + i).innerHTML = "Your HKID No. is invalid.";
				flag = false;
			}
		}*/
		
		var selectOtHkidPass = document.getElementById("selectOtHkidPass"+i).value;
		var hkid = document.getElementById("txtOtherInsuHkid" + i).value;
		document.getElementById("errtxtOtherInsuHkid" + i).innerHTML = "";
		document.getElementById("errtxtOtherInvalidInsuHkid" + i).innerHTML = "";
		if (hkid.trim() == "") {
			if (selectOtHkidPass == "hkId") {
				document.getElementById("errtxtOtherInsuHkid"+i).innerHTML = "Please enter Insured Person's HKID No.";
				flag = false;
			}
			else {
				document.getElementById("errtxtOtherInsuHkid"+i).innerHTML = "Insured Person's Passport No. is invalid.";
				flag = false;
			}
		}
		else {
			if (selectOtHkidPass == "hkId") {
				var tr = IsHKID(hkid.trim());
				if (tr == false) {
					document.getElementById("errtxtOtherInvalidInsuHkid"+i).innerHTML = "Insured Person's HKID No. is invalid.";
					flag = false;
				}
			}
			else {
				var tr = chkTravelHKPass(hkid.trim());
				if (tr == false) {
					document.getElementById("errtxtOtherInvalidInsuHkid"+i).innerHTML = "Insured Person's Passport No. is invalid.";
					flag = false;
				}
			}
		}

		var selectedValue = document.getElementById("otherSelectBenificiary" + i).value;
		if(selectedValue != "SE"){
			if (document.getElementById("otherBenefitiaryName" + i).value == "")
			{
				document.getElementById("errotherBenefitiaryName" + i).innerHTML="Please enter Beneficiary Name in English.";
				flag = false;             
			}
			else
			{
				document.getElementById("errotherBenefitiaryName" + i).innerHTML = "";
				flag = false;
			}

			/*if (document.getElementById("txtOtherBenInsuHkid" + i).value == "") {
				document.getElementById("errtxtOtherBenInsuHkid" + i).innerHTML = "Beneficiary which is blank";
				flag = false;
			}
			else {
				document.getElementById("errtxtOtherBenInsuHkid" + i).innerHTML = "";
			}*/
			
			var selectOtHkidPass = document.getElementById("selectOtherBenefitiaryHkidPass"+i).value;
			var hkid = document.getElementById("txtOtherBenInsuHkid" + i).value;
			document.getElementById("errtxtOtherBenInsuHkid" + i).innerHTML = "";
			document.getElementById("errtxtOtherInvalidBenInsuHkid" + i).innerHTML = "";
			if (hkid.trim() == "") {
				if (selectOtHkidPass == "hkId") {
					document.getElementById("errtxtOtherBenInsuHkid"+i).innerHTML = "Please enter Insured Person's HKID No.";
					flag = false;
				}
				else {
					document.getElementById("errtxtOtherBenInsuHkid"+i).innerHTML = "Insured Person's Passport No. is invalid.";
					flag = false;
				}
			}
			else {
				if (selectOtHkidPass == "hkId") {
					var tr = IsHKID(hkid.trim());
					if (tr == false) {
						document.getElementById("errtxtOtherInvalidBenInsuHkid"+i).innerHTML = "Insured Person's HKID No. is invalid.";
						flag = false;
					}
				}
				else {
					var tr = chkTravelHKPass(hkid.trim());
					if (tr == false) {
						document.getElementById("errtxtOtherInvalidBenInsuHkid"+i).innerHTML = "Insured Person's Passport No. is invalid.";
						flag = false;
					}
				}
			}
		}
	}


	return flag;

}



function isAlphaNumeric(evt) {
	evt = (evt) ? evt : event;
	var charCode = (evt.charCode) ? evt.charCode : ((evt.keyCode) ? evt.keyCode : ((evt.which) ? evt.which : 0));
	if (charCode > 32 && (charCode < 65 || charCode > 90) && (charCode < 97 || charCode > 122) && (charCode < 47 || charCode > 57)) {
		return false;
	}
	return true;
}
function replaceAlphaNumeric(id) {
	var string = id.value;
	string = string.replace(/[^a-zA-Z0-9 ]/g, '');
	id.value = string;
}
function isNumeric(evt) {
	var charCode = (evt.which) ? evt.which : event.keyCode
			if (charCode > 31 && (charCode < 48 || charCode > 57))
				return false;

	return true;
}
function replaceNumeric(id) {
	var string = id.value;
	string = string.replace(/[^0-9]/g, '');
	id.value = string;
}
function alphaOnly(evt) {
	evt = (evt) ? evt : event;
	var charCode = (evt.charCode) ? evt.charCode : ((evt.keyCode) ? evt.keyCode : ((evt.which) ? evt.which : 0));
	if (charCode > 32 && (charCode < 65 || charCode > 90) && (charCode < 97 || charCode > 122)) {
		return false;
	}
	return true;
}
function replaceAlpha(id) {
	var string = id.value;
	string = string.replace(/[^\sa-zA-Z]/g, '');
	id.value = string;
}

/* flight page apply for no button validation */


/* Apply for now Top */
function flightValidateDesk()
{
	var flag = true;

	document.getElementById("startDateDeskIn").innerHTML = "";
	document.getElementById("endDateDeskIn").innerHTML = "";
	document.getElementById("travelCountDeskIn").style.display = "none";
	var startDate = document.getElementById("txtStartDateDesk").value;    
	var endDate = document.getElementById("txtEndDateDesk").value;
	var travellers = document.getElementById("txtTravellersDesk").value;
	var peopleCount = document.getElementById("lblPeopleDesk").innerHTML;

	var nowTemp = new Date();
	var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);
	var new_start = new Date(startDate);
	var new_end = new Date(endDate);
	var startdays = dateDiffInDays(now, new_start);
	var enddays = dateDiffInDays(new_start, new_end);
	if(startDate.trim()=="")
	{
		document.getElementById("startDateDeskIn").innerHTML = "Please select a valid Depature Date.";
		flag = false;
	}
	else {
		if (startdays > 30) {
			document.getElementById("startDateDeskIn").innerHTML = "Depature Date must be within 30 days of Application Date.";
			flag = false;
		}
	}
	if(endDate.trim()=="")
	{
		document.getElementById("endDateDeskIn").innerHTML = "Please select a valid Return Date.";
		flag = false;
	}
	else {
		if (enddays > 30) {
			document.getElementById("endDateDeskIn").innerHTML = "The maximum Period of Insurance is 30 days.";
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
	if(peopleCount.trim() > 15)
	{
		document.getElementById("travelCountDeskIn").style.display = "block";
		document.getElementById("travelCountDeskIn").innerHTML ="<span class='text-red'>Treveller's cannot be  more than 15</span>";
		flag = false;
	}
	return flag;

}

function flightValidateMob() {
	var flag = true;

	document.getElementById("startDateMobIn").innerHTML = "";
	document.getElementById("endDateMobIn").innerHTML = "";
	document.getElementById("travelCountMobIn").style.display = "none";
	var startDate = document.getElementById("txtStartDateMob").value;
	var endDate = document.getElementById("txtEndDateMob").value;
	var travellers = document.getElementById("txtTravellersMob").value;
	var peopleCount = document.getElementById("lblPeopleMob").innerHTML;
	var nowTemp = new Date();
	var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);
	var new_start = new Date(startDate);
	var new_end = new Date(endDate);
	var startdays = dateDiffInDays(now, new_start);
	var enddays = dateDiffInDays(new_start, new_end);

	if (startDate.trim() == "") {
		document.getElementById("startDateMobIn").innerHTML = "Please select a valid Depature Date.";
		flag = false;
	} else {
		if (startdays > 30) {
			document.getElementById("startDateMobIn").innerHTML = "Depature Date must be within 30 days of Application Date.";
			flag = false;
		}
	}
	if (endDate.trim() == "") {
		document.getElementById("endDateMobIn").innerHTML = "Please select a valid Return Date.";
		flag = false;
	} else {
		if (enddays > 30) {
			document.getElementById("endDateMobIn").innerHTML = "The maximum Period of Insurance is 30 days.";
			flag = false;
		}
	}
	if (travellers.trim() == "") {
		document.getElementById("travelCountMobIn").style.display = "block";
		flag = false;
	}
	if(peopleCount.trim()==""||peopleCount=="0")
	{
		document.getElementById("travelCountMobIn").style.display = "block";
		flag = false;
	}
	if(peopleCount.trim() > 15)
	{
		document.getElementById("travelCountMobIn").style.display = "block";
		document.getElementById("travelCountMobIn").innerHTML ="<span class='text-red'>Treveller's cannot be  more than 15</span>";
		flag = false;
	}
	return flag;

}
function flightValidateBtm() {
	var flag = true;

	document.getElementById("startDateBtmIn").innerHTML = "";
	document.getElementById("endDateBtmIn").innerHTML = "";
	document.getElementById("travelCountBtmIn").style.visibility = "hidden";
	var startDate = document.getElementById("txtStartDateBtm").value;
	var endDate = document.getElementById("txtEndDateBtm").value;
	var travellers = document.getElementById("txtTravellersBtm").value;
	var peopleCount = document.getElementById("lblPeopleBtm").innerHTML;
	var nowTemp = new Date();
	var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);
	var new_start = new Date(startDate);
	var new_end = new Date(endDate);
	var startdays = dateDiffInDays(now, new_start);
	var enddays = dateDiffInDays(new_start, new_end);

	if (startDate.trim() == "") {
		document.getElementById("startDateBtmIn").innerHTML = "Please select a valid Depature Date.";
		flag = false;
	}
	else
	{
		if(startdays>30)
		{
			document.getElementById("startDateBtmIn").innerHTML = "Depature Date must be within 30 days of Application Date.";
			flag = false;
		}
	}
	if (endDate.trim() == "") {
		document.getElementById("endDateBtmIn").innerHTML = "Please select a valid Return Date.";
		flag = false;
	}
	else
	{
		if (enddays > 30) {
			document.getElementById("endDateBtmIn").innerHTML = "The maximum Period of Insurance is 30 days.";
			flag = false;
		}
	}
	if (travellers.trim() == "") {
		document.getElementById("travelCountBtmIn").style.visibility = "visible";
		flag = false;
	}
	if(peopleCount.trim()==""||peopleCount=="0")
	{
		document.getElementById("travelCountBtmIn").style.visibility = "visible";
		flag = false;
	}
	if(peopleCount.trim() > 15)
	{
		document.getElementById("travelCountBtmIn").style.display = "block";
		document.getElementById("travelCountBtmIn").innerHTML ="<span class='text-red'>Treveller's cannot be  more than 15</span>";
		flag = false;
	}
	return flag;

}

function flightValidateDeskTravel()
{
	var flag = true;

	document.getElementById("startDateDeskIn").innerHTML = "";
	document.getElementById("endDateDeskIn").innerHTML = "";
	document.getElementById("travelCountDeskIn").style.display = "none";
	var startDate = document.getElementById("txtStartDateDesk").value;    
	var endDate = document.getElementById("txtEndDateDesk").value;
	var travellers = document.getElementById("txtTravellersDesk").value;
	var peopleCount = document.getElementById("lblPeopleDesk").innerHTML;

	var nowTemp = new Date();
	var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);
	var new_start = new Date(startDate);
	var new_end = new Date(endDate);
	var startdays = dateDiffInDays(now, new_start);
	var enddays = dateDiffInDays(new_start, new_end);
	if(startDate.trim()=="")
	{
		document.getElementById("startDateDeskIn").innerHTML = "Please select a valid Depature Date.";
		flag = false;
	}
	else {
		if (startdays > 30) {
			document.getElementById("startDateDeskIn").innerHTML = "Depature Date must be within 30 days of Application Date.";
			flag = false;
		}
	}
	if(endDate.trim()=="")
	{
		document.getElementById("endDateDeskIn").innerHTML = "Please select a valid Return Date.";
		flag = false;
	}
	else {
		if (enddays > 180) {
			document.getElementById("endDateDeskIn").innerHTML = "The maximum Period of Insurance is 180 days.";
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
	return flag;

}

function flightValidateMobTravel() {
	var flag = true;

	document.getElementById("startDateMobIn").innerHTML = "";
	document.getElementById("endDateMobIn").innerHTML = "";
	document.getElementById("travelCountMobIn").style.display = "none";
	var startDate = document.getElementById("txtStartDateMob").value;
	var endDate = document.getElementById("txtEndDateMob").value;
	var travellers = document.getElementById("txtTravellersMob").value;
	var peopleCount = document.getElementById("lblPeopleMob").innerHTML;
	var nowTemp = new Date();
	var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);
	var new_start = new Date(startDate);
	var new_end = new Date(endDate);
	var startdays = dateDiffInDays(now, new_start);
	var enddays = dateDiffInDays(new_start, new_end);

	if (startDate.trim() == "") {
		document.getElementById("startDateMobIn").innerHTML = "Please select a valid Depature Date.";
		flag = false;
	} else {
		if (startdays > 30) {
			document.getElementById("startDateMobIn").innerHTML = "Depature Date must be within 30 days of Application Date.";
			flag = false;
		}
	}
	if (endDate.trim() == "") {
		document.getElementById("endDateMobIn").innerHTML = "Please select a valid Return Date.";
		flag = false;
	} else {
		if (enddays > 180) {
			document.getElementById("endDateMobIn").innerHTML = "The maximum Period of Insurance is 180 days.";
			flag = false;
		}
	}
	if (travellers.trim() == "") {
		document.getElementById("travelCountMobIn").style.display = "block";
		flag = false;
	}
	if(peopleCount.trim()==""||peopleCount=="0")
	{
		document.getElementById("travelCountMobIn").style.display = "block";
		flag = false;
	}
	return flag;

}
function flightValidateBtmTravel() {
	var flag = true;

	document.getElementById("startDateBtmIn").innerHTML = "";
	document.getElementById("endDateBtmIn").innerHTML = "";
	document.getElementById("travelCountBtmIn").style.visibility = "hidden";
	var startDate = document.getElementById("txtStartDateBtm").value;
	var endDate = document.getElementById("txtEndDateBtm").value;
	var travellers = document.getElementById("txtTravellersBtm").value;
	var peopleCount = document.getElementById("lblPeopleBtm").innerHTML;
	var nowTemp = new Date();
	var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);
	var new_start = new Date(startDate);
	var new_end = new Date(endDate);
	var startdays = dateDiffInDays(now, new_start);
	var enddays = dateDiffInDays(new_start, new_end);

	if (startDate.trim() == "") {
		document.getElementById("startDateBtmIn").innerHTML = "Please select a valid Depature Date.";
		flag = false;
	}
	else
	{
		if(startdays>30)
		{
			document.getElementById("startDateBtmIn").innerHTML = "Depature Date must be within 30 days of Application Date.";
			flag = false;
		}
	}
	if (endDate.trim() == "") {
		document.getElementById("endDateBtmIn").innerHTML = "Please select a valid Return Date.";
		flag = false;
	}
	else
	{
		if (enddays > 180) {
			document.getElementById("endDateBtmIn").innerHTML = "The maximum Period of Insurance is 180 days.";
			flag = false;
		}
	}
	if (travellers.trim() == "") {
		document.getElementById("travelCountBtmIn").style.visibility = "visible";
		flag = false;
	}
	if(peopleCount.trim()==""||peopleCount=="0")
	{
		document.getElementById("travelCountBtmIn").style.visibility = "visible";
		flag = false;
	}
	return flag;

}



/* join us page validation */
function validateJoinUsForm() {


	var valid = true;

	
	var fullName = $("#txtFullName").val();
	var mobileNo = $("#txtMobileNo").val();
	var emailId = $("#txtEmailId").val();
	var userName = $("#txtUserName1").val();
	var password = $("#txtPass1").val();
	var confirmPassword = $("#txtConfPass").val();


	document.getElementById("errorEmptyName").innerHTML = "";
	document.getElementById("errorEmptyMob").innerHTML = "";
	document.getElementById("errorEmptyEmailId").innerHTML= "";
	document.getElementById("errorEmptyUName").innerHTML = "";
	document.getElementById("errorJoinUsPassword").innerHTML = "";
	document.getElementById("errorEmptyConfPass").innerHTML= "";
	document.getElementById("chk1").innerHTML = "";
	document.getElementById("chk2").innerHTML = "";


	// FULL NAME VALIDATION
	if (fullName.trim() == "") {
		document.getElementById("errorEmptyName").innerHTML = "Please enter your Name in English.";

		valid = false;

	} 
	// Mobile Number Validation
	if (mobileNo.trim() == "") {
		document.getElementById("errorEmptyMob").innerHTML = "Please enter your Mobile No.";

		valid = false;

	} else {
		if (mobile_pattern.test(mobileNo) == false) {
			document.getElementById("errorEmptyMob").innerHTML = "Please enter an 8-digit Mobile No.";

			valid = false;
		}
	}

	// Email Address Validation
	if (emailId.trim() == "") {
		document.getElementById("errorEmptyEmailId").innerHTML = "Please enter your Email Address.";

		valid = false;
	} else {
		if (emailreg.test(emailId) == false) {
			document.getElementById("errorEmptyEmailId").innerHTML = "Please enter a valid Email Address.";

			valid = false;
		}
	}
	var reg_user = /^[a-zA-Z0-9!”$@%&’()*\+,.\/;\[\\\]\^_`{|}~-]{6,50}$/;
	// UserName Validation
	if (userName.trim() == "") {
		document.getElementById("errorEmptyUName").innerHTML = "Please enter your Username.";

		valid = false;

	} else {
		if (reg_user.test(userName) == false) {
			document.getElementById("errorEmptyUName").innerHTML= "Username must be between 6 and 50 characters.";
			valid = false;
		}
	}

	// validation for Passsword
	var passWordPttrn = "[a-zA-Z0-9]{8,}";
	var specialChar = "\\W";
	var rg = new RegExp(passWordPttrn);
	var spChar = new RegExp(specialChar);
	var message = "";
	if (password.trim() == ""){
		message  = "Please enter your Password.";
		valid = false;
	} else if(!rg.test(password)) {  
		message += "Password must be at least 8 characters and alphanumeric (both upper AND lower cases).";
		valid = false;
	} else if(spChar.test(password)){
		message += "\n Password must be at least 8 characters and alphanumeric (both upper AND lower cases).";
		valid = false;
	}
	document.getElementById("errorJoinUsPassword").innerHTML = message;


	if (confirmPassword.trim() == "") {
		document.getElementById("errorEmptyConfPass").innerHTML = "Please Confirm Password.";
		valid = false;
	} else {
		if (confirmPassword !== password) {
			document.getElementById("errorEmptyConfPass").innerHTML = "Passwords you entered do not match. Please enter the same Password in both fields.";
			valid = false;
		}
	}
	if (document.getElementById("checkbox1").checked == false)
	{
		document.getElementById("chk1").innerHTML = "Please read and accept the Declaration, Terms & Conditions before submitting the application.";
		valid = false;
	}
	if (document.getElementById("checkbox2").checked == false)
	{
		document.getElementById("chk2").innerHTML = "Please read and accept the Personal Information Collection Statement before submitting the application.";
		valid = false;
	}


	return valid;

}



/*  forgot password validation */
function forgotPassword()
{

	var valid = true;


	var mobileNo = document.getElementById("mobileNo").value;

	var emailId = document.getElementById("emailAddress").value; 
	var userName = document.getElementById("userName").value; 


	document.getElementById("errorEmptyMob").style.display = "none";
	document.getElementById("errorInvalidMob").style.display = "none";
	document.getElementById("errorEmptyEmailId").style.display = "none";
	document.getElementById("errorInvalidEmailId").style.display = "none";
	document.getElementById("errorEmptyUName").style.display = "none";    
	document.getElementById("errorInvalidUName").style.display = "none";

	// Mobile Number Validation
	if (mobileNo.trim() == "") {
		document.getElementById("errorEmptyMob").style.display = "block";


		valid = false;

	} else {
		if (mobile_pattern.test(mobileNo) == false) {
			document.getElementById("errorInvalidMob").style.display = "block";

			valid = false;
		}
	}

	// Email Address Validation
	if (emailId.trim() == "") {
		document.getElementById("errorEmptyEmailId").style.display = "block";

		valid = false;
	} else {
		if (emailreg.test(emailId) == false) {
			document.getElementById("errorInvalidEmailId").style.display = "block";

			valid = false;
		}
	}

	// UserName Validation
	if (userName.trim() == "") {
		document.getElementById("errorEmptyUName").style.display = "block";

		valid = false;

	} else {
		if (reg.test(userName) == false) {
			document.getElementById("errorInvalidUName").style.display = "block";
			valid = false;
		}
	}
	return valid;
}
function forgotUserName() {


	var valid = true;


	var mobileNo = document.getElementById("mobileNo").value;
	var emailId = document.getElementById("emailAddress").value;


	document.getElementById("errorEmptyMob").style.display = "none";
	document.getElementById("errorInvalidMob").style.display = "none";
	document.getElementById("errorEmptyEmailId").style.display = "none";
	document.getElementById("errorInvalidEmailId").style.display = "none";


	// Mobile Number Validation
	if (mobileNo.trim() == "") {
		document.getElementById("errorEmptyMob").style.display = "block";

		valid = false;

	} else {
		if (mobile_pattern.test(mobileNo) == false) {
			document.getElementById("errorInvalidMob").style.display = "block";

			valid = false;
		}
	}

	// Email Address Validation
	if (emailId.trim() == "") {
		document.getElementById("errorEmptyEmailId").style.display = "block";

		valid = false;
	} else {
		if (emailreg.test(emailId) == false) {
			document.getElementById("errorInvalidEmailId").style.display = "block";

			valid = false;
		}
	}

	return valid;
}
function resetPassword() {

	var flag = true;

	var pass = document.getElementById("password").value;
	var confpass = document.getElementById("confirmPassword").value;
	document.getElementById("errconfpass").innerHTML = "";
	document.getElementById("errpass").innerHTML = "";

	if (pass.trim() == "") {

		flag = false;
		document.getElementById("errpass").innerHTML = "Please enter a Password";
	}
	else {
		if (password_pattern.test(pass) == false) {
			document.getElementById("errpass").innerHTML = "Please enter a Valid Password";
			flag = false;
		}
	}

	if (confpass.trim() == "") {
		document.getElementById("errconfpass").innerHTML = "Please enter a Confirm Password";
		flag = false;
	} else {
		if (confpass !== pass) {
			document.getElementById("errconfpass").innerHTML = "Please enter a Valid Confirm Password";
			flag = false;
		}
	}
	return flag;
}

function validUser()
{
	var flag = true;
	var userName = document.getElementById("headerUserName").value;
	var password = document.getElementById("headerPassword").value;

	document.getElementById("errUserName").innerHTML = "";
	document.getElementById("errPass").innerHTML = "";

	if (password.trim() == "")
	{    	
		document.getElementById("errPass").innerHTML  = "Please enter your Password.";
		flag = false;
	} 
	if (userName.trim() == "") {
		document.getElementById("errUserName").innerHTML = "Please enter your Username.";
		flag = false;
	}

	return flag;
}




//Chat API Calling

window.$zopim||(function(d,s){var z=$zopim=function(c){z._.push(c)},$=z.s=

	d.createElement(s),e=d.getElementsByTagName(s)[0];z.set=function(o){z.set.

		_.push(o)};z._=[];z.set._=[];$.async=!0;$.setAttribute('charset','utf-8');

		$.src='//v2.zopim.com/?2pI3lESBRhfLdMU5ejqFoP9dTStJUfhE';z.t=+new Date;$.

		type='text/javascript';e.parentNode.insertBefore($,e)})(document,'script');


//travel Payment Summary Payment details//

function validatecardnumber(cardnumber) {
	// Strip spaces and dashes


	cardnumber = cardnumber.replace(/[ -]/g, '');
	// See if the card is valid
	// The regex will capture the number in one of the capturing groups
	//var match = /^(?:(4[0-9]{12}(?:[0-9]{3})?)|(5[1-5][0-9]{14})|(6(?:011|5[0-9]{2})[0-9]{12})|(3[47][0-9]{13})|(3(?:0[0-5]|[68][0-9])[0-9]{11})|((?:2131|1800|35[0-9]{3})[0-9]{11}))$/.exec(cardnumber);
	var match = /^(?:(4[0-9]{12}(?:[0-9]{3})?)|(5[1-5][0-9]{14})|(6(?:011|5[0-9]{2})[0-9]{12})|(3[47][0-9]{13})|(3(?:0[0-5]|[68][0-9])[0-9]{11})|((?:2131|1800|35[0-9]{3})[0-9]{11}))$/.exec(cardnumber);
	if (match) {
		// List of card types, in the same order as the regex capturing groups
		var types = ['Visa', 'MasterCard', 'Discover', 'American Express',
		             'Diners Club', 'JCB'];
		// Find the capturing group that matched
		// Skip the zeroth element of the match array (the overall match)
		for (var i = 1; i < match.length; i++) {
			if (match[i]) {
				// Display the card type for that group
				document.getElementById('errcardno').innerHTML = types[i - 1];
				break;
			}
		}
	} else {
		document.getElementById('errcardno').innerHTML = '(invalid card number)';
	}

}

function payValid()
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

	if(cardno.length<16)
	{
		flag=false;
		document.getElementById('errcardno').innerHTML="Credit card No. must be 16-digit.";
	}
	if(month=="Month")
	{
		flag=false;
		document.getElementById('errmonth').innerHTML="Please select your credit card's Expiry Month.";
	}
	if(year=="Year")
	{
		flag=false;
		document.getElementById('erryear').innerHTML="Please select your credit card's Expiry Year.";
	}
	if(holdername.trim()=="")
	{
		flag=false;
		document.getElementById('errname').innerHTML="Please enter Name on credit card.";
	}
	if(seccode.trim()=="")
	{
		flag=false;
		document.getElementById('errcode').innerHTML="Please enter Security Code on credit card.";
	}
	if (document.getElementById("checkbox3").checked == false)
	{
		document.getElementById("errchk1").innerHTML = "Please read and accept the Payment Authorization.";
		flag = false;
	}
	/*if (document.getElementById("checkbox2").checked == false)
	{
		document.getElementById("errchk2").innerHTML = "Please read and accept the Policy Coverage and Terms & Conditions before submitting the application.";
		flag = false;
	}*/
	return flag;
}


/*Promo popup*/
function get_promo_val()
{

	var valid = true;
	var emailId = document.getElementById("txtPromoEmail").value; 
	document.getElementById("errPromoEmail").style.display = "none";
	// Email Address Validation
	if (emailId.trim() == "") {
		document.getElementById("errPromoEmail").style.display = "block";
		document.getElementById("errPromoEmail").innerHTML = "Your E-mail Address is invalid.";
		valid = false;

	} else {

		if (emailreg.test(emailId) == false) {
			document.getElementById("errPromoEmail").style.display = "block";
			document.getElementById("errPromoEmail").innerHTML = "Your E-mail Address is invalid.";
			valid = false;
		}
	}

	return valid;
}

//Side Menu

//<![CDATA[ 
$(window).load(function(){
	$('.navmenu-fixed-left').offcanvas({
		placement: 'left',
		autohide: 'true',
		recalc: 'true'
	});
});//]]> 

function chkTravelHKPass(value) {
    var flag = true;
    var filter = /^[!”$%&’()*\+,.\/;\[\\\]\^_`{|}~-]+$/;

    var data = value.trim();
    if (data != "") {
        if (/^[A-Za-z ]+$/.test(data)) {
            //there are only characters
            flag = false;
        }
        else if (/^[0-9 ]+$/.test(data)) {
            //it contains numbers
            flag = false;
        }
        else if (filter.test(data)) {
            flag = false;
        }
    }
    else {
        flag = false;
    }
    return flag;
}

//HOME CARE VALIDATION
function hc_planValid() {
    var flag = true;
    
    document.getElementById("appfullname").innerHTML = "";
    var appFullName = document.getElementById("inputFullName").value;
    
    document.getElementById("errAppHkid").innerHTML = "";
    var appHkid = document.getElementById("txtAppHkid").value;
    
    document.getElementById("errMobileNo").innerHTML = "";
    var mobileNo = document.getElementById("inputMobileNo").value;
    
    document.getElementById("errEmailid").innerHTML = "";
    var EmailId = document.getElementById("inputEmailId").value;
    
    /*document.getElementById("errRegUser").innerHTML = "";
    var RegUserName = document.getElementById("inputRegUserName").value;
    alert('jdj');
    document.getElementById("errRegPass").innerHTML = "";
    var RegPass = document.getElementById("inputRegPass").value;
    document.getElementById("errRegCPass").innerHTML = "";
    var RegCPass = document.getElementById("inputRegCPass").value;*/
    // corrosponding address
    document.getElementById("errCABuilding").innerHTML = "";
    var CABuilding = document.getElementById("inputCABuilding").value;
    document.getElementById("errCAEstate").innerHTML = "";
    var CAEstate = document.getElementById("inputCAEstate").value;
    // address details
    document.getElementById("errABuilding").innerHTML = "";
    var ABuilding = document.getElementById("inputABuilding").value;
    document.getElementById("errAEstate").innerHTML = "";
    var AEstate = document.getElementById("inputAEstate").value;
    document.getElementById("errNFA").innerHTML = "";
    var NFA = document.getElementById("selectNFA").value;
    document.getElementById("errEffDate").innerHTML = "";
    var EffDate = document.getElementById("txtEffDate").value;
    var nowTemp = new Date();
    var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);
    var new_start = new Date(EffDate);
    var startdays = dateDiffInDays(now, new_start);
    document.getElementById("chk1").innerHTML = "";
    document.getElementById("chk2").innerHTML = "";
    /**** VAlidation for HKID and Passport ***/
	var selectHkidPass = document.getElementById("selectHkidPass").value;
    if (appHkid.trim() == "") {
        document.getElementById("errAppHkid").innerHTML = "Please fill in your HKID or Passport No.";
        flag = false;
    }
    else {
        if (selectHkidPass == "hkId") {
            var tr = IsHKID(appHkid.trim());
            if (tr == false) {
                document.getElementById("errAppHkid").innerHTML = "Your HKID No. is invalid.";
                flag = false;
            }
        }
        else {
            var tr = chkTravelHKPass(appHkid.trim());
            if (tr == false) {
                document.getElementById("errAppHkid").innerHTML = "Your Passport No. is invalid.";
                flag = false;
            }
        }
    }
    if (appFullName.trim() == "") {
        document.getElementById("appfullname").innerHTML = "Please enter your Name.";
        flag = false;
    }
    /*if (appHkid.trim() == "") {
        document.getElementById("errAppHkid").innerHTML = "Please enter your HKID No.";
        flag = false;
    }
    else {
        var tr = IsHKID(appHkid.trim());
        
        if (tr == false) {
            document.getElementById("errAppHkid").innerHTML = "Your HKID No. is invalid.";
            flag = false;
        }
    }*/
    if (mobileNo.trim() == "") {
        document.getElementById("errMobileNo").innerHTML = "Please enter your Mobile No.";
        flag = false;
    }
    else {
        if (mobile_pattern.test(mobileNo) == false) {
            
            document.getElementById("errMobileNo").innerHTML = "Please enter an 8-digit Mobile No.";
            flag = false;
            
        }
    }
    
    if (EmailId.trim() == "") {
        document.getElementById("errEmailid").innerHTML = "Your E-mail Address is invalid.";
        flag = false;
    }
    else {
        if (emailreg.test(EmailId) == false) {
            document.getElementById("errEmailid").innerHTML = "Your E-mail Address is invalid.";
            flag = false;
        }
    } 
    /*if (RegUserName.trim() != "") {
        if (reg.test(RegUserName) == false) {
            document.getElementById("errRegUser").innerHTML = "Please enter an Username";
            flag = false;
        }
    }
    if (RegPass.trim() != "") {
        if (password_pattern.test(RegPass) == false) {
            document.getElementById("errRegPass").innerHTML = "Please enter a Valid Password";
            flag = false;
        }
        if (RegCPass !== RegPass) {
            document.getElementById("errRegCPass").innerHTML = "Password does not match";
            flag = false;
        }
    }*/
    if (CABuilding.trim() == "") {
        document.getElementById("errCABuilding").innerHTML = "Name of Building is invalid.";
        flag = false;
    }
    if (CAEstate.trim() == "") {
        document.getElementById("errCAEstate").innerHTML = "Name of Estate in invalid.";
        flag = false;
    }
    if (ABuilding.trim() == "") {
        document.getElementById("errABuilding").innerHTML = "Please enter your Corresponding Address.";
        flag = false;
    }
    if (CAEstate.trim() == "") {
        document.getElementById("errAEstate").innerHTML = "Name of Estate in invalid.";
        flag = false;
    } 
    if (NFA.trim() == "") {
        document.getElementById("errNFA").innerHTML = "Please select Net Floor Area.";
        flag = false;
    }
    if (EffDate.trim() == "") {
        document.getElementById("errEffDate").innerHTML = "Effective Date must be within 60 days of Application Date.";
        flag = false;
    }
    else {
        if (startdays > 60) {
            document.getElementById("errEffDate").innerHTML = "Effective Date must be within 60 days of Application Date.";
            flag = false;
        }
    }
    if (document.getElementById("checkbox1").checked == false) {
        document.getElementById("chk1").innerHTML = "Please read and accept the Declaration, Terms & Conditions before submitting the application.";
        flag = false;
    }
    if (document.getElementById("checkbox2").checked == false) {
        document.getElementById("chk2").innerHTML = "Please read and accept the Personal Information Collection Statement before submitting the application.";
        flag = false;
    }
    
    return flag;
}


////home care page validation
function msgAlertDesk() {
    var flag = true;
   
var cnt=document.getElementById("lblCount").value;
for(var i=1;i<=parseInt(cnt);i++)
	{
	if(i==1)
	{
    if (document.getElementById("inlineDeskRadio1"+i).checked) {
        flag = true;
    }
    else
    	flag= false;
	}
    else
    	{
    if (document.getElementById("inlineDeskRadio2"+i).checked) {
        flag = true;
    }
    else 
    	flag=false;
    	}
	}
    if (flag == false) {
    	
        alert("Thank you for your interests in our products, sorry that we are unable to accept your application online. For any enquiry, please call our customer service hotline at 3123 3123.");
    
	}
    return flag;
    
}