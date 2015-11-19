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
	addressline1 = $("#addressofInstitutionLine1").attr('value');
	addressline2 = $("#addressofInstitutionLine2").attr('value');
	addressline3 = $("#addressofInstitutionLine3").attr('value');
	console.log(addressline1);
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

var options = {
	/*
	 * url: "resources/countries.json",
	 * 
	 * getValue: "name",
	 * 
	 * list: { match: { enabled: true } },
	 * 
	 * theme: "square"
	 */
	data : [ "blue", "green", "pink", "red", "yellow" ]
};

// $("#countryOfInstitution").easyAutocomplete(options);

$(function() {
	var availableTags = [ "Abu Dhabi", "Australia", "Austria", "Belgium",
			"Brunei", "Canada", "Cuba", "Cyprus", "Denmark", "Dubai", "France",
			"Germany", "Guam", "Holland", "India", "Indonesia", "Iran",
			"Ireland", "Italy", "Japan", "Korea", "Lao P.D.R.", "Macau",
			"Malaysia", "Monaco", "Myanmar", "Nepal", "New Zealand",
			"North Korea", "Norway", "Pakistan", "People Republic of China",
			"Philippines", "Poland", "Portugal", "Russia", "Singapore",
			"South Africa", "Spain", "Sri Lanka", "Sudan", "Sweden",
			"Switzerland", "Syria", "Taiwan", "Thailand", "Turkey",
			"United Kingdom", "Vietnam" ];
	/*$("#countryOfInstitution").autocomplete({
		source : availableTags
	});*/
});

// <key id='Overseas.userdetails.applicant.Correspondence.Error.BorE'>Either
// Building or Estate must be filled in.</key>
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
		changeColorAndPrice('box2','2','medicalWorldwideA','0.0','8000.0')
	}
	if(region=='region1'){
		$('#region0').css("display","none");
		$('#region1').css("display","block");
		$('#region-btn-0').addClass("region-box-inactive");
		$('#region-btn-0').removeClass("region-box-active");
		$('#region-btn-1').addClass("region-box-active");
		$('#region-btn-1').removeClass("region-box-inactive");
		changeColorAndPrice('box6','6','medicalAsiaA','0.0','5500.0');
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
		$('#input_annual_dob').addClass('invalid-field');
		if (firstErrorElementId == "") {
			firstErrorElementId = "input_annual_dob";
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
				getBundleLanguage, "travelcare.declaration.notChecked.message"); //"Please read and accept the Declaration, Terms & Conditions before submitting the application.";
		if (firstErrorElementId == "") {
			firstErrorElementId = "checkbox1";
		}
		flag = false;
	}
	if (document.getElementById("checkbox2").checked == false) {
		document.getElementById("chk2").innerHTML = getBundle(
				getBundleLanguage, "homecare.tnc.notChecked.message");
		;//"Please read and accept the Personal Information Collection Statement before submitting the application";
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
