function msieversion() {
	var ua = window.navigator.userAgent;
	var msie = ua.indexOf("MSIE ");

	if (msie > 0) { // If Internet Explorer, return version number
		return parseInt(ua.substring(msie + 5, ua.indexOf(".", msie)));
	} else { // If another browser, return 0
		return 0;
	}
}
$(function() {
	if ((msieversion() > 0) && (msieversion() < 10)) {
		console.log(msieversion());
		$("#oversea_feature").find(".wow").css("visibility", "show");
		$("#oversea_feature_mob").find(".wow").css("visibility", "show");
	}
});

// <key id='Overseas.userdetails.Instituation.Error.Empty'>Please enter your
// address.</key>
function validateaddressofInstitutionLine() {
	addressline1 = $("#addressofInstitutionLine1").val();
	addressline2 = $("#addressofInstitutionLine2").val();
	addressline3 = $("#addressofInstitutionLine3").val();
	if (addressline1.trim() == "" && addressline2.trim() == ""
			&& addressline3.trim() == "") {

		$("#addressofInstitutionLine1").addClass("invalid-field");
		$("#addressofInstitutionLine2").addClass("invalid-field");
		$("#addressofInstitutionLine3").addClass("invalid-field");
		$("#addressofInstitutionInvalid").html(
				getBundle(getBundleLanguage, "Please enter your address."));
	} else {
		$("#" + 'addressofInstitutionInvalid').html('');
		$("#" + 'addressofInstitutionLine1').removeClass("invalid-field");
		$("#" + 'addressofInstitutionLine2').removeClass("invalid-field");
		$("#" + 'addressofInstitutionLine3').removeClass("invalid-field");
	}
}

function validatenameOfInstitution(){
	nameOfInstitution = $("#nameOfInstitution").val();
	if (nameOfInstitution.trim() == "") {
		$("#nameOfInstitution").addClass("invalid-field");
		$("#nameOfInstitutionInvalid").html(
				getBundle(getBundleLanguage, "Please enter name of Institution."));
	} else {
		$("#" + 'nameOfInstitutionInvalid').html('');
		$("#" + 'nameOfInstitution').removeClass("invalid-field");
	}	
}

function validatecountryOfInstitution(){
	countryOfInstitution = $("#countryOfInstitution").val();
	if (countryOfInstitution.trim() == "") {
		$("#countryOfInstitution").addClass("invalid-field");
		$("#countryOfInstitutionInvalid").html(
				getBundle(getBundleLanguage, "Please enter the country of Institution."));
	} else {
		$("#" + 'countryOfInstitutionInvalid').html('');
		$("#" + 'countryOfInstitution').removeClass("invalid-field");
	}	
}


function coverageToogle(id){
	$('#'+id).mCustomScrollbar();
	$('#'+id).css("display","block");
}

function validateCorrespondenceBorE() {
	building = $("#correspondenceAddressBuildingId").val();
	estate = $("#correspondenceAddressEstateId").val();
	if (building.trim() == "" && estate.trim() == "") {

		$("#correspondenceAddressBuildingId").addClass("invalid-field");
		$("#correspondenceAddressEstateId").addClass("invalid-field");
		$("#errorEmptyCorrespondenceAddressEstate").html(
				getBundle(getBundleLanguage,
						"Either Building or Estate must be filled in"));
	} else {
		$("#" + 'errorEmptyCorrespondenceAddressEstate').html('');
		$("#" + 'correspondenceAddressBuildingId').removeClass("invalid-field");
		$("#" + 'correspondenceAddressEstateId').removeClass("invalid-field");
	}
}
// <key id='Overseas.userdetails.applicant.Correspondence.Error.BorE'>Either
// Building or Estate must be filled in.</key>
function validateCorrespondenceDistrict() {
	district = $("#correspondenceAddressDistrict").val();

}

function checkVisaCheckBox(value){
	if (!value){
		$("#visacheckbox").addClass("invalid-field");
		$("#visacheckboxInvalid").html("Please tick the checkbox first.");
	}
	else {
		$("#visacheckbox").removeClass("invalid-field");
		$("#visacheckboxInvalid").html("");		
	}
}
function addDistrictList(value) {
	var district = [];
	if (value == "NT") {
		district = [ "Tsuen Wan", "Kwai Chung" ];
	} else if (value == "KLN") {
		district = [ "Mong Kok", "Kwun Tong" ];
	} else {
		district = [ "Wan Chai", "Central" ]
	}
	var distirctList = document.getElementById('applicantDistrict');
	distirctList.options.length = 0;

	for (var i = 0; i < district.length; i++) {
		var opt = document.createElement('option');
		opt.innerHTML = district[i];
		opt.value = district[i];
		distirctList.appendChild(opt);
	}
}

function changeRegion(region){
	$('#amountdue').html('0');
	$('#subtotal').html('0');
	$('#plansummary').html('0');
	$('#discountAmt').html('0');
	
	if(region=='region0'){
		$('#region0').css("display","block");
		$('#region1').css("display","none");
		$('#region-btn-0').addClass("region-box-active");
		$('#region-btn-0').removeClass("region-box-inactive");
		$('#region-btn-1').addClass("region-box-inactive");
		$('#region-btn-1').removeClass("region-box-active");
		changeColorAndPrice('box2','2','txtPlanName2','txtDiscountAmount2','txtTotalDue2')
	}
	if(region=='region1'){
		$('#region0').css("display","none");
		$('#region1').css("display","block");
		$('#region-btn-0').addClass("region-box-inactive");
		$('#region-btn-0').removeClass("region-box-active");
		$('#region-btn-1').addClass("region-box-active");
		$('#region-btn-1').removeClass("region-box-inactive");
		changeColorAndPrice('box6','6','txtPlanName6','txtDiscountAmount6','txtTotalDue6');
	}
}

function coverageToogle(){
	$("#summary-of-coverage").mCustomScrollbar();
	$('#summary-of-coverage').css("display","block");
}

var oversea_click = false;
function validateOverseaDetails(form, formId, language) {
	if ($("#inputFullName").val().trim() == namePlaceholder.trim()) {
		$("#inputFullName").val('');
	}
	if ($("#inputTxtAppHkid").val().trim() == hkidPlaceholder.trim()) {
		$("#inputTxtAppHkid").val('');
	}

	var flag = true;
	document.getElementById("fullnameinvalid").innerHTML = "";
	document.getElementById("errAppHkid").innerHTML = "";
	document.getElementById("dobInvalid").innerHTML = "";
	document.getElementById("errMobileNo").innerHTML = "";
	document.getElementById("emailid").innerHTML = "";
	document.getElementById("errorEmptyCorrespondenceAddressEstate").innerHTML = "";
	document.getElementById("chk1").innerHTML = "";
	document.getElementById("chk2").innerHTML = "";

	var fullname = document.getElementById("inputFullName").value;
	var appHkid = document.getElementById("inputTxtAppHkid").value;
	var applicantDob = document.getElementById("applicantDob").value;
	var mobileNo = document.getElementById("inputMobileNo").value;
	var emailId = document.getElementById("inputEmailId").value;
	var applicantBuilding = document.getElementById("correspondenceAddressBuildingId").value;
	var applicantEstate = document.getElementById("correspondenceAddressEstateId").value;
	var applicantDistrict = document.getElementById("applicantDistrict").value;

	var InsuFullName = document.getElementById("txtInsuFullName1").value;
	var InsuHkid = document.getElementById("txtInsuHkid1").value;
	var InsuDob = document.getElementById("insuredDob").value;
	var correspondenceAddressBuildingId = document.getElementById("correspondenceAddressBuildingId").value;
	var correspondenceAddressEstateId = document.getElementById("correspondenceAddressEstateId").value;	
	var addressofInstitutionLine1 = document.getElementById("addressofInstitutionLine1").value;	
	var addressofInstitutionLine2 = document.getElementById("addressofInstitutionLine2").value;
	var addressofInstitutionLine3 = document.getElementById("addressofInstitutionLine3").value;
	var countryOfInstitution = document.getElementById("countryOfInstitution").value;
	var correspondenceAddressDistrictId1 = document.getElementById("inlineCARadio3").checked;
	var correspondenceAddressDistrictId2 = document.getElementById("inlineCARadio4").checked;
	var correspondenceAddressDistrictId3 = document.getElementById("inlineCARadio5").checked;
	var nameOfInstitution = document.getElementById("nameOfInstitution").value;
	var visacheckbox = document.getElementById("visacheckbox").checked;		
	var inputOverseasInsuredDob = document.getElementById("inputOverseasInsuredDob").value;
	

	
	var building = $("#correspondenceAddressBuildingId").val();
	var estate = $("#correspondenceAddressEstateId").val();
	var addressline1 = $("#addressofInstitutionLine1").val();
	var addressline2 = $("#addressofInstitutionLine2").val();
	var addressline3 = $("#addressofInstitutionLine3").val();
	
	
	var building = $("#correspondenceAddressBuildingId").val();
	var estate = $("#correspondenceAddressEstateId").val();
	//var insuredDob = $("#overseaDepartureDate").val();
	var insuredDob = $("#inputOverseasInsuredDob").val();
	var countryOfInstitution = $("#countryOfInstitution").val();
	var nameOfInstitution = $("#nameOfInstitution").val();
	var addressline1 = $("#addressofInstitutionLine1").val();
	var addressline2 = $("#addressofInstitutionLine2").val();
	var addressline3 = $("#addressofInstitutionLine3").val();
	

	/*if (applicantBuilding.trim() == buildingPlaceholder.trim()) {
		applicantBuilding = '';
	}
	if (applicantEstate.trim() == estatePlaceholder.trim()) {
		applicantEstate = '';
	}*/

	var firstErrorElementId = "";
	if (fullname.trim() == "") {
		$('#fullnameinvalid').html(getBundle(
				getBundleLanguage, "applicant.name.notNull.message"));
		$('#inputFullName').addClass('invalid-field');
		if (firstErrorElementId == "") {
			firstErrorElementId = "inputFullName";
		}
		flag = false;
	}

	/** ** VAlidation for HKID and Passport ** */
	if (appHkid.trim() == "") {
		$('#errAppHkid').html(
				getBundle(getBundleLanguage, "applicant.hkId.notNull.message"));
		$('#inputTxtAppHkid').addClass('invalid-field');
		if (firstErrorElementId == "") {
			firstErrorElementId = "inputTxtAppHkid";
		}
		flag = false;
	} else {
		var tr = IsHKID(appHkid.trim());
		if (tr == false) {
			$('#errAppHkid').html(
					getBundle(getBundleLanguage,
							"applicant.hkId.notValid.message"));
			$('#inputTxtAppHkid').addClass('invalid-field');
			if (firstErrorElementId == "") {
				firstErrorElementId = "inputTxtAppHkid";
			}
			flag = false;
		}
	}
	if (applicantDob.trim() == "") {
		$('#dobInvalid').html(
				getBundle(getBundleLanguage, "applicant.dob.notNull.message"));
		$('#input_oversea_dob').addClass('invalid-field');
		if (firstErrorElementId == "") {
			firstErrorElementId = "input_oversea_dob";
		}
		flag = false;
	} else {

	}
	if (mobileNo.trim() == "") {
		$('#errMobileNo').html(
				getBundle(getBundleLanguage,
						"applicant.mobileNo.notNull.message"));
		$('#inputMobileNo').addClass('invalid-field');
		if (firstErrorElementId == "") {
			firstErrorElementId = "inputMobileNo";
		}
		flag = false;
	} else {
		if (mobile_pattern.test(mobileNo) == false) {
			$('#errMobileNo').html(
					getBundle(getBundleLanguage,
							"applicant.mobileNo.notValid.message"));
			$('#inputMobileNo').addClass('invalid-field');
			if (firstErrorElementId == "") {
				firstErrorElementId = "inputMobileNo";
			}
			flag = false;
		}
	}
	if (emailId.trim() == "") {
		$('#emailid')
				.html(
						getBundle(getBundleLanguage,
								"applicant.email.notNull.message"));
		$('#inputEmailId').addClass('invalid-field');
		if (firstErrorElementId == "") {
			firstErrorElementId = "inputEmailId";
		}
		flag = false;
	} else {
		if (emailreg.test(emailId) == false) {
			$('#emailid').html(
					getBundle(getBundleLanguage,
							"applicant.email.notValid.message"));
			$('#inputEmailId').addClass('invalid-field');
			if (firstErrorElementId == "") {
				firstErrorElementId = "inputEmailId";
			}
			flag = false;
		}
	}

if (correspondenceAddressBuildingId.trim() == "" && correspondenceAddressEstateId.trim() == ""){
	
		$("#correspondenceAddressBuildingId").addClass("invalid-field");	
		$("#correspondenceAddressEstateId").addClass("invalid-field");
		$("#errorEmptyCorrespondenceAddressEstate").html( getBundle(getBundleLanguage, "Either Building or Estate must be filled in."));
		flag = false;
	}
	else {
		$("#"+'errorEmptyCorrespondenceAddressEstate').html('');
		$("#"+'correspondenceAddressBuildingId').removeClass("invalid-field");
		$("#"+'correspondenceAddressEstateId').removeClass("invalid-field");
	}

	//<key id='Overseas.userdetails.applicant.Correspondence.Error.District'>Please select a district.</key>
	if(applicantDistrict.trim() == "")
	{
		$("#"+'applicantDistrictSelect').addClass("invalid-field");
		$("#"+"errorEmptycorrespondenceAddressDistrict").html( getBundle(getBundleLanguage, 'Please select a district.')); 
		flag = false;
	}

	if (InsuFullName.trim() == "" || InsuFullName.trim() == "SAME AS ID DOCUMENT"){
		$("#txtInsuFullName1").addClass("invalid-field");	
		$("#errtxtPersonalFullName1").html( getBundle(getBundleLanguage, "Please enter insured person's full name in English."));
		flag = false;
	}
	
	if (InsuHkid.trim() == "" || InsuHkid.trim() == "EG: X1234567 WITHOUT ()"){
		$("#txtInsuHkid1").addClass("invalid-field");	
		$("#errtxtInsuHkid1").html( getBundle(getBundleLanguage, "Please enter insured person's HKID no."));
		flag = false;
	}
	else {
		var tr = IsHKID(InsuHkid.trim());
		if (tr == false) {
			$("#txtInsuHkid1").addClass("invalid-field");	
			$("#errtxtInsuHkid1").html( getBundle(getBundleLanguage, "Your HKID no. is invalid."));
			flag = false;			
		}
	}

	if (InsuDob.trim() == ""){
		//$("#insuredDob").addClass("invalid-field");	
		$("#dobInsuredInvalid").html( getBundle(getBundleLanguage, "Please select insured person's date of birth."));
		flag = false;
	}
	
	
	if (inputOverseasInsuredDob.trim() == "") {
		$("#dobOverseasInsuredInvalid").html( getBundle(getBundleLanguage, "Please select a departure date."));
	}

	if (nameOfInstitution.trim() == "") {
	
		$("#nameOfInstitution").addClass("invalid-field");	
		$("#nameOfInstitutionInvalid").html( getBundle(getBundleLanguage, "Please enter the name of Instituation."));
		flag = false;
	}
	else {
		$("#"+'nameOfInstitutionInvalid').html('');
		$("#"+'nameOfInstitution').removeClass("invalid-field");
	}
	
	if (addressofInstitutionLine1.trim() == "" && addressofInstitutionLine2.trim() == "" && addressofInstitutionLine3.trim() == "") {
	
		$("#addressofInstitutionLine1").addClass("invalid-field");	
		$("#addressofInstitutionLine2").addClass("invalid-field");
		$("#addressofInstitutionLine3").addClass("invalid-field");
		$("#addressofInstitutionInvalid").html( getBundle(getBundleLanguage, "Please enter your address."));
		flag = false;
	}
	else {
		$("#"+'addressofInstitutionInvalid').html('');
		$("#"+'addressofInstitutionLine1').removeClass("invalid-field");
		$("#"+'addressofInstitutionLine2').removeClass("invalid-field");
		$("#"+'addressofInstitutionLine3').removeClass("invalid-field");
	}
//Overseas.userdetails.Instituation.Country.NotCoveredAsia
//Overseas.userdetails.Instituation.Country.NotCoveredAsia.url
	plan = document.getElementById("selectedPlanName").value;
	asis_country_list =["Abu Dhabi","Dubai","India","Indonesia","Iran","Japan","Korea","Lao, P.D.R.","Macau","Malaysia","Myanmar","Nepal","North Korea","Pakistan","People Republic of China","Philippines","Singapore","Sri Lanka","Sudan","Taiwan","Thailand","Vietnam"]
	console.log(asis_country_list.indexOf(countryOfInstitution));	
	//alert(countryOfInstitution);
	if (countryOfInstitution.trim() == '')
	{
		$("#"+'countryOfInstitution').addClass("invalid-field");
		$("#countryOfInstitutionInvalid").html( getBundle(getBundleLanguage, 'Please enter the Country of Institution'));
		flag = false;
	}
	else
	{
		if(plan == "medicalWorldwideA" && asis_country_list.indexOf(countryOfInstitution) < 0)
		{
			$("#"+'countryOfInstitution').addClass("invalid-field");
			$("#countryOfInstitutionInvalid").html( getBundle(getBundleLanguage, 'Selected plan does not cover this country. Please consider "Worldwide Plans".'));
			flag = false;
		}else{
			$("#"+'countryOfInstitution').removeClass("invalid-field");
			$("#countryOfInstitutionInvalid").html( ''); 			
		}
	}

	
	if (!visacheckbox)
	{
		$("#"+'visacheckbox').addClass("invalid-field");
		$("#visacheckboxInvalid").html( getBundle(getBundleLanguage, 'Please tick the checkbox first.')); 
		flag = false;
	}
	else
	{
		$("#"+'visacheckbox').removeClass("invalid-field");
		$("#visacheckboxInvalid").html( ''); 	
	}
	
		
	if (building.trim() == "" && estate.trim() == "") {
		$("#correspondenceAddressBuildingId").addClass("invalid-field");
		$("#correspondenceAddressEstateId").addClass("invalid-field");
		$("#errorEmptyCorrespondenceAddressEstate").html(
				getBundle(getBundleLanguage,
						"Either Building or Estate must be filled in"));
		if (firstErrorElementId == "") {
			firstErrorElementId = "correspondenceAddressBuildingId";
		}
		flag = false;
	}
	
	if (insuredDob.trim() == "") {
		$('#overseaDepartureDateInvalid').html(
				getBundle(getBundleLanguage, "applicant.dob.notNull.message"));
		$('#oversea_departure_date').addClass('invalid-field');
		if (firstErrorElementId == "") {
			firstErrorElementId = "oversea_departure_date";
		}
		flag = false;
	}

	if (countryOfInstitution.trim() == "") {
		$('#countryOfInstitutionInvalid').html(getBundle(
				getBundleLanguage, "applicant.country.ins.notNull.message"));
		$('#countryOfInstitution').addClass('invalid-field');
		if (firstErrorElementId == "") {
			firstErrorElementId = "countryOfInstitution";
		}
		flag = false;
	}
	
	if (nameOfInstitution.trim() == "") {
		$('#nameOfInstitutionInvalid').html(getBundle(
				getBundleLanguage, "applicant.name.ins.notNull.message"));
		$('#nameOfInstitution').addClass('invalid-field');
		if (firstErrorElementId == "") {
			firstErrorElementId = "nameOfInstitution";
		}
		flag = false;
	}
	




	if (addressline1.trim() == "" && addressline2.trim() == ""
			&& addressline3.trim() == "") {
		$("#addressofInstitutionLine1").addClass("invalid-field");
		$("#addressofInstitutionLine2").addClass("invalid-field");
		$("#addressofInstitutionLine3").addClass("invalid-field");
		$("#addressofInstitutionInvalid").html(
				getBundle(getBundleLanguage, "Please enter your address."));
		if (firstErrorElementId == "") {
			firstErrorElementId = "addressofInstitutionLine1";
		}
		flag = false;
	}

	/*if (applicantEstate.trim() == "" && applicantBuilding.trim() == "") {
		$("#errCABuilding")
				.html(
						getBundle(getBundleLanguage,
								"workinghoilday.building.message"));
		$("#errCAEstate").html(
				getBundle(getBundleLanguage, "workinghoilday.estate.message"));
		$("#inputCABuilding").addClass("invalid-field");
		$("#inputCAEstate").addClass("invalid-field");
		if (firstErrorElementId == "") {
			firstErrorElementId = "inputCABuilding";
		}
		flag = false;
	}

	if (applicantDistrict.trim() == "") {
		$("#errCADist")
				.html(
						getBundle(getBundleLanguage,
								"workinghoilday.district.message"));
		$("#inputCADistrict").addClass("invalid-field");
		if (firstErrorElementId == "") {
			firstErrorElementId = "inputCADistrict";
		}
		flag = false;
	}*/

	if (document.getElementById("checkbox1").checked == false) {
		document.getElementById("chk1").innerHTML = getBundle(
				getBundleLanguage, "travelcare.declaration.notChecked.message");
		if (firstErrorElementId == "") {
			firstErrorElementId = "checkbox1";
		}
		flag = false;
	}
	if (document.getElementById("checkbox2").checked == false) {
		document.getElementById("chk2").innerHTML = getBundle(
				getBundleLanguage, "homecare.tnc.notChecked.message");
		if (firstErrorElementId == "") {
			firstErrorElementId = "checkbox2";
		}
		flag = false;
	}
	if (firstErrorElementId != "") {
		scrollToElement(firstErrorElementId);
	}
	if (oversea_click) {
		return false;
	} else {
		if (flag) {
			oversea_click = true;
			var result = false;
			var formId = '#' + formId;
			var method = contextPath + '/ajax/oversea/prepareOverseaSummary';
			console.log($(formId).serialize());
			$.ajax({
				type : "POST",
				url : method,
				data : $(formId).serialize(),
				async : false,
				success : function(data) {
					if (data == 'success') {
						form.action = contextPath + '/' + language
								+ '/oversea-insurance/summary';
						result = true;
					} else {
						oversea_click = false;
						console.log(data);
						$("#errorMsg").html(data);
						scrollToElement("errorMsg");
					}
				}
			});
			if (!result) {
				$('#loading-overlay').modal('hide');
			}
			return result;
		} else {
			$('#loading-overlay').modal('hide');
			oversea_click = false;
			return flag
		}

	}
}

function prepareOverseaQuote() {
	var result = false;
	var formId = '#frmTravelGetQuoteDesk';
	var method = contextPath+'/ajax/oversea/prepareOverseaQuote';
	console.log($(formId).serialize());
	$.ajax({
		type : "POST",
		url : method,
		data : $(formId).serialize(),
		async : false,
		success : function(data) {
			if (data == 'success') {
				result = true;
			} else {
				console.log(data);
				$('#startDateDeskIn').html(data.errMsgs);
				result = false;
			}
		}
	});
	return result;
}


function setDropArea(id) {
		$('#selectCADistHid').find('option[value="' + id + '"]').attr(
				'selected', 'selected');

		if ($("#selectCADistHid option[value='" + id + "']").text() == "HK")
			document.getElementById("inlineCARadio3").checked = true;
		else if ($("#selectCADistHid option[value='" + id + "']").text() == "KL")
			document.getElementById("inlineCARadio4").checked = true;
		else
			document.getElementById("inlineCARadio5").checked = true;
		if (id != '') {
			$("#errCADist").html('');
			$('#inputCADistrict').removeClass('invalid-field');
		}
	}

	function checkInsuredPerson(value) {
		if (value != "SE") {
			document.getElementById("lock_datepicker").removeAttribute("style");
			$("#txtInsuFullName1,#txtInsuHkid1,#insuredDob").prop('readonly',
					false);
			document.getElementById("txtInsuFullName1").value = '';
			document.getElementById("txtInsuHkid1").value = '';
			document.getElementById("insuredDob").value = '';			
		} else {

			document.getElementById("txtInsuFullName1").value = document
					.getElementById("inputFullName").value;
			document.getElementById("txtInsuHkid1").value = document
					.getElementById("inputTxtAppHkid").value;
			document.getElementById("insuredDob").value = document
					.getElementById("applicantDob").value;
			modStyle = 'cursor: not-allowed;background-color: #eee;position:absolute;width:100%;height:100%;left:0px;top:0px;background:#fff;opacity:0;filter:alpha(opacity=0)'
			document.getElementById("lock_datepicker").setAttribute('style',
					modStyle);

			$("#txtInsuFullName1,txtInsuHkid1").prop('readonly', true);
		}
	    if(value.trim() != "")
	    {
	        $("#"+'applicantDistrictSelect').removeClass("invalid-field");
	        $("#"+"errorEmptycorrespondenceAddressDistrict").html(''); 
	    }

	}


function setValue(result) {
	var selValue = document.getElementById("inputseletedplanname").value;
	if(result['errMsgs'] !== null){
		$("#errPromoCode").html(getBundle(getBundleLanguage, "system.promotion.error.notValid.message"));
		$('#inputPromo').addClass('invalid-field');
	}else{
		$("#errPromoCode").html("");
		$('#inputPromo').removeClass('invalid-field');
			
		$("#subtotal").html(numeral(result[selValue].grossPremium).format('0,0.00'));
		$("#plansummary").html(numeral(result[selValue].grossPremium).format('0,0.00'));
		
		$('#selectPlanPremium').val(numeral(result[selValue].grossPremium).format('0,0.00'));
		$("#discountAmt").html(numeral(result[selValue].discountAmount).format('0,0.00'));
		$('#selectedAmountDue').val(numeral(result[selValue].totalDue).format('0,0.00'));
		$('#selectedDiscountAmt').val(numeral(result[selValue].discountAmount).format('0,0.00'));
        
        $('#txtDiscountAmount').val(numeral(result[selValue].discountAmount).format('0,0.00'));
		$("#amountdue").html(numeral(result[selValue].totalDue).format('0,0.00'));
        
		var map={
				0:'basicA',
				1:'basicB',
				2:'medicalWorldwideA',
				3:'medicalWorldwideB',
				4:'basicA',
				5:'basicB',
				6:'medicalAsiaA',
			    7:'medicalAsiaB'
			};
		
		for(var i = 0; i < 8; i++) {
			$("#total"+i).html(numeral(result[map[i]].totalDue).format('0,0.00'));
		}
	}
}

function validateValue(id, invalid, placeholder, message) {
	var value = $("#" + id).val();
	if (value.trim() == "" || value == placeholder) {
		$('#'+invalid).html(getBundle(
				getBundleLanguage, message));
		$('#'+id).addClass('invalid-field');
	}else {
		$('#'+invalid).html("");
		$('#'+id).removeClass('invalid-field');
	}
}
