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
		//console.log(msieversion());
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
	if ((addressline1.trim() == "" && addressline2.trim() == "" && addressline3.trim() == "") || (addressline1.trim() == institueAddr1Placeholder.trim() 
			&& addressline2.trim() == institueAddr2Placeholder.trim() && addressline3.trim() == institueAddr3Placeholder.trim())) {
		$("#addressofInstitutionLine1").addClass("invalid-field");
		$("#addressofInstitutionLine2").addClass("invalid-field");
		$("#addressofInstitutionLine3").addClass("invalid-field");
		$("#addressofInstitutionInvalid").html(getBundle(getBundleLanguage, "Overseas.userdetails.Instituation.Error.Empty"));
	} else {
		$("#" + 'addressofInstitutionInvalid').html('');
		$("#" + 'addressofInstitutionLine1').removeClass("invalid-field");
		$("#" + 'addressofInstitutionLine2').removeClass("invalid-field");
		$("#" + 'addressofInstitutionLine3').removeClass("invalid-field");
	}
}

function validatenameOfInstitution(){
	nameOfInstitution = $("#nameOfInstitution").val();
	if (nameOfInstitution.trim() == "" || nameOfInstitution.trim() == institueNamePlaceholder.trim()) {
		$("#nameOfInstitution").addClass("invalid-field");
		$("#nameOfInstitutionInvalid").html(
				getBundle(getBundleLanguage, "Overseas.userdetails.Instituation.Name.Error"));
	} else {
		$("#" + 'nameOfInstitutionInvalid').html('');
		$("#" + 'nameOfInstitution').removeClass("invalid-field");
	}	
}

function validatecountryOfInstitution(){
	countryOfInstitution = $("#countryOfInstitution").val();
	//console.log(institueCountryPlaceholder);
	if (countryOfInstitution.trim() == "" || countryOfInstitution.trim()== institueCountryPlaceholder.trim()) {
		$("#countryOfInstitution").addClass("invalid-field");
		$("#countryOfInstitutionInvalid").html(
				getBundle(getBundleLanguage, "Overseas.userdetails.Instituation.Country.Error"));
	} else {
		$("#" + 'countryOfInstitutionInvalid').html('');
		$("#" + 'countryOfInstitution').removeClass("invalid-field");
	}	
}

/*var options = {
	
	  data : [ "Abu Dhabi", "Australia", "Austria", "Belgium",
				"Brunei", "Canada", "Cuba", "Cyprus", "Denmark", "Dubai", "France",
				"Germany", "Guam", "Holland", "India", "Indonesia", "Iran",
				"Ireland", "Italy", "Japan", "Korea", "Lao P.D.R.", "Macau",
				"Malaysia", "Monaco", "Myanmar", "Nepal", "New Zealand",
				"North Korea", "Norway", "Pakistan", "People Republic of China",
				"Philippines", "Poland", "Portugal", "Russia", "Singapore",
				"South Africa", "Spain", "Sri Lanka", "Sudan", "Sweden",
				"Switzerland", "Syria", "Taiwan", "Thailand", "Turkey",
				"United Kingdom", "Vietnam" ],
	  
	  
	  list: { match: { enabled: true } }

};

//$("#countryOfInstitution").easyAutocomplete(options);

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
	$("#countryOfInstitution").autocomplete({
		source : availableTags
	});
});
*/
// <key id='Overseas.userdetails.applicant.Correspondence.Error.BorE'>Either
// Building or Estate must be filled in.</key>
/*
function coverageToggle(id){
=======


function coverageToogle(id){
>>>>>>> 452c745cbaf25cf84db2b94106f9f87da1fb9465
	$('#'+id).mCustomScrollbar();
	$('#'+id).css("display","block");
}
*/
function validateCorrespondenceBorE() {
	building = $("#correspondenceAddressBuildingId").val();
	estate = $("#correspondenceAddressEstateId").val();
	console.log();
	if ((building.trim() == "" && estate.trim() == "") || (building.trim() == appBuildingPlaceholder.trim() && estate.trim() == appEstatePlaceholder.trim())) {

		$("#correspondenceAddressBuildingId").addClass("invalid-field");
		$("#correspondenceAddressEstateId").addClass("invalid-field");
		$("#errorEmptyCorrespondenceAddressEstate").html(
				getBundle(getBundleLanguage,
						"Overseas.userdetails.applicant.Correspondence.Error.BorE"));
		$("#errorEmptyCorrespondenceAddressBuilding").html(
				getBundle(getBundleLanguage,
						"Overseas.userdetails.applicant.Correspondence.Error.BorE"));		
	} else {
		$("#" + 'errorEmptyCorrespondenceAddressBuilding').html('');
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
/*
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
*/
/*
function coverageToggle(){
	$("#summary-of-coverage").mCustomScrollbar();
	$('#summary-of-coverage').css("display","block");
}
*/
var oversea_click = false;
function validateOverseaDetails() {
	
	if ($("#inputFullName").val().trim() == namePlaceholder.trim()) {
		$("#inputFullName").val('');
	}
	if ($("#inputTxtAppHkid").val().trim() == hkidPlaceholder.trim()) {
		$("#inputTxtAppHkid").val('');
	}
	if ($("#applicantDob").val().trim() == appDobPlaceholder.trim()) {
		$("#applicantDob").val('');
	}	
	if ($("#inputMobileNo").val().trim() == appMobilePlaceholder.trim()) {
		$("#inputMobileNo").val('');
	}
	if ($("#inputEmailId").val().trim() == appEmailPlaceholder.trim()) {
		$("#inputEmailId").val('');
	}		
	if ($("#correspondenceAddressRoomId").val().trim() == appRoomPlaceholder.trim()) {
		$("#correspondenceAddressRoomId").val('');
	}
	if ($("#correspondenceAddressFloorId").val().trim() == appFloorPlaceholder.trim()) {
		$("#correspondenceAddressFloorId").val('');
	}
	if ($("#correspondenceAddressBlockId").val().trim() == appBlockPlaceholder.trim()) {
		$("#correspondenceAddressBlockId").val('');
	}
	if ($("#correspondenceAddressBuildingId").val().trim() == appBuildingPlaceholder.trim()) {
		$("#correspondenceAddressBuildingId").val('');
	}
	if ($("#correspondenceAddressEstateId").val().trim() == appEstatePlaceholder.trim()) {
		$("#correspondenceAddressEstateId").val('');
	}
	if ($("#correspondenceAddressStreetNoId").val().trim() == apprStreetNoPlaceholder.trim()) {
		$("#correspondenceAddressStreetNoId").val('');
	}	
	if ($("#correspondenceAddressStreetNameId").val().trim() == appStreetNamelaceholder.trim()) {
		$("#correspondenceAddressStreetNameId").val('');
	}	
	
	/*if ($("#applicantDistrict").val().trim() == appDobPlaceholder.trim()) {
		$("#applicantDistrict").val('');
	}*/	
	
	if ($("#txtInsuFullName1").val().trim() == insurNamePlaceholder.trim()) {
		$("#txtInsuFullName1").val('');
	}
	if ($("#txtInsuHkid1").val().trim() == insurHkidPlaceholder.trim()) {
		$("#txtInsuHkid1").val('');
	}
	if ($("#insuredDob").val().trim() == insurDobPlaceholder.trim()) {
		$("#insuredDob").val('');
	}
	if ($("#overseaDepartureDate").val().trim() == departurePlaceholder.trim()) {
		$("#overseaDepartureDate").val('');
	}
	if ($("#countryOfInstitution").val().trim() == institueCountryPlaceholder.trim()) {
		$("#countryOfInstitution").val('');
	}
	if ($("#nameOfInstitution").val().trim() == institueNamePlaceholder.trim()) {
		$("#nameOfInstitution").val('');
	}
	if ($("#addressofInstitutionLine1").val().trim() == institueAddr1Placeholder.trim()) {
		$("#addressofInstitutionLine1").val('');
	}
	if ($("#addressofInstitutionLine2").val().trim() == institueAddr2Placeholder.trim()) {
		$("#addressofInstitutionLine2").val('');
	}	
	if ($("#addressofInstitutionLine3").val().trim() == institueAddr3Placeholder.trim()) {
		$("#addressofInstitutionLine3").val('');
	}
	if ($("#beneficiaryFullName").val().trim() == namePlaceholder.trim()) {
		$("#beneficiaryFullName").val('');
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
	var appRelation = document.getElementById("applicantRelationship").value;
	var applicantBuilding = document.getElementById("correspondenceAddressBuildingId").value;
	var applicantEstate = document.getElementById("correspondenceAddressEstateId").value;
	var applicantDistrict = document.getElementById("applicantDistrict").value;
	var applicantRoom = document.getElementById("correspondenceAddressRoomId").value;
	var applicantFloor = document.getElementById("correspondenceAddressFloorId").value;
	var applicantBlock = document.getElementById("correspondenceAddressBlockId").value;
	var correspondenceAddressBuildingId = document.getElementById("correspondenceAddressBuildingId").value;
	var correspondenceAddressEstateId = document.getElementById("correspondenceAddressEstateId").value;	
	var correspondenceAddressDistrictId1 = document.getElementById("inlineCARadio3").checked;
	var correspondenceAddressDistrictId2 = document.getElementById("inlineCARadio4").checked;
	var correspondenceAddressDistrictId3 = document.getElementById("inlineCARadio5").checked;	
	
	var InsuFullName = document.getElementById("txtInsuFullName1").value;
	var InsuHkid = document.getElementById("txtInsuHkid1").value;
	var InsuDob = document.getElementById("insuredDob").value;
	
	var addressofInstitutionLine1 = document.getElementById("addressofInstitutionLine1").value;	
	var addressofInstitutionLine2 = document.getElementById("addressofInstitutionLine2").value;
	var addressofInstitutionLine3 = document.getElementById("addressofInstitutionLine3").value;
	var countryOfInstitution = document.getElementById("countryOfInstitution").value;
	var nameOfInstitution = document.getElementById("nameOfInstitution").value;
	var visacheckbox = document.getElementById("visacheckbox").checked;		
	var overseaDepartureDate = document.getElementById("overseaDepartureDate").value;
	var insuredDob = $("#overseaDepartureDate").val();
	
	var beneficiaryName = document.getElementById("beneficiaryFullName").value;
	var beneficiaryId = document.getElementById("beneficiaryID").value;
	
//	var applicantAge = calculateAge((parseDate)(applicantDob), new Date());
//	var insuredAge = calculateAge((parseDate)(InsuDob), new Date());
	
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
	if (applicantDob.trim() == "" || applicantDob.trim() == "DD-MM-YYYY") {
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

if ((correspondenceAddressBuildingId.trim() == "" && correspondenceAddressEstateId.trim()=="")){
	
		$("#correspondenceAddressBuildingId").addClass("invalid-field");	
		$("#correspondenceAddressEstateId").addClass("invalid-field");
		$("#errorEmptyCorrespondenceAddressBuilding").html( getBundle(getBundleLanguage, "Overseas.userdetails.applicant.Correspondence.Error.BorE"));
		$("#errorEmptyCorrespondenceAddressEstate").html( getBundle(getBundleLanguage, "Overseas.userdetails.applicant.Correspondence.Error.BorE"));
		flag = false;
		if(firstErrorElementId==""){
			firstErrorElementId="correspondenceAddressBuildingId";
		}		
	}
	else {
		$("#"+'errorEmptyCorrespondenceAddressEstate').html('');
		$("#"+'errorEmptyCorrespondenceAddressBuilding').html('');
		$("#"+'correspondenceAddressBuildingId').removeClass("invalid-field");
		$("#"+'correspondenceAddressEstateId').removeClass("invalid-field");
	}

	//<key id='Overseas.userdetails.applicant.Correspondence.Error.District'>Please select a district.</key>
	if(applicantDistrict.trim() == "")
	{
		$("#"+'applicantDistrictSelectWrap').addClass("invalid-field");
		$("#"+"errorEmptycorrespondenceAddressDistrict").html( getBundle(getBundleLanguage, 'Overseas.userdetails.applicant.Correspondence.Error.District')); 
		flag = false;
		if(firstErrorElementId==""){
			firstErrorElementId="applicantDistrictSelectWrap";
		}		
	}
	else {
		$("#"+'errorEmptycorrespondenceAddressDistrict').html('');
		$("#"+'applicantDistrictSelectWrap').removeClass("invalid-field");
	}	

	if (InsuFullName.trim() == ""){
		$("#txtInsuFullName1").addClass("invalid-field");	
		$("#errtxtPersonalFullName1").html( getBundle(getBundleLanguage, "Overseas.userdetails.Insured.Fullname.Error.Empty"));
		flag = false;
		if(firstErrorElementId==""){
			firstErrorElementId="txtInsuFullName1";
		}
	}
	
	if (InsuHkid.trim() == ""){
		$("#txtInsuHkid1").addClass("invalid-field");	
		$("#errtxtInsuHkid1").html( getBundle(getBundleLanguage, "Overseas.userdetails.Insured.HKID.Error.Invalid"));
		flag = false;
		if(firstErrorElementId==""){
			firstErrorElementId="txtInsuHkid1";
		}
	}
	else {
		var tr = IsHKID(InsuHkid.trim());
		if (tr == false) {
			$("#txtInsuHkid1").addClass("invalid-field");	
			$("#errtxtInsuHkid1").html( getBundle(getBundleLanguage, "Overseas.userdetails.Insured.HKID.Error.Invalid"));
			flag = false;
			if(firstErrorElementId==""){
				firstErrorElementId="txtInsuHkid1";
			}
		}
	}
	if (InsuDob.trim() == ""  || InsuDob.trim() == "DD-MM-YYYY"){
		$("#oversea_insure_dob").addClass("invalid-field");	
		$("#dobInsuredInvalid").html( getBundle(getBundleLanguage, "Overseas.userdetails.Insured.DOB.Error.Empty"));
		flag = false;
		if(firstErrorElementId==""){
			firstErrorElementId="oversea_insure_dob";
		}
	}
	else {
		$("#"+'dobInsuredInvalid').html('');
		$("#"+'oversea_insure_dob').removeClass("invalid-field");
	}
	//console.log(chkTravelHKPass(beneficiaryId.trim()));
	if($("#personalselectBenificiary").val() != "" && $("#personalselectBenificiary").val() != 'SE'){
		if (beneficiaryName.trim() == "") {
			$("#errBeneficiaryFullName").html( getBundle(getBundleLanguage, "beneficiary.name.notNull.message"));
			$("#beneficiaryFullName").addClass("invalid-field");
			if(firstErrorElementId==""){
				firstErrorElementId="beneficiaryFullName";
			}
			flag = false;
		}
		
		if($('#beneficiaryIDType').length > 0 && $('#beneficiaryIDType').val().toLowerCase() == 'passport'){
			if (beneficiaryId.trim() == "") {
				$("#errBeneficiaryID").html(getBundle(getBundleLanguage, "Overseas.userdetails.Bene.Passport.Error.Empty"));
				$("#beneficiaryID").addClass("invalid-field");
				if(firstErrorElementId==""){
					firstErrorElementId="beneficiaryID";
				}
				flag = false;
			}else{
				var tr = chkTravelHKPass(beneficiaryId.trim());
				if (tr == false) {
					$("#errBeneficiaryID").html(getBundle(getBundleLanguage, "Overseas.userdetails.Bene.Passport.Error.5to15"));
					$("#beneficiaryID").addClass("invalid-field");
					if(firstErrorElementId==""){
						firstErrorElementId="beneficiaryID";
					}
					flag = false;
				}
				
				var tr1 = chkTravelHKPassLen(beneficiaryId.trim());
				if (tr1 == false) {
					$("#errBeneficiaryID").html(getBundle(getBundleLanguage, "Overseas.userdetails.Bene.Passport.Error.5to15"));
					$("#beneficiaryID").addClass("invalid-field");
					if(firstErrorElementId==""){
						firstErrorElementId="beneficiaryID";
					}
					flag = false;
				}
				
				if(beneficiaryId.trim() == InsuHkid.trim()){
					$("#errBeneficiaryID").html(getBundle(getBundleLanguage, "beneficiary.passport.same.message"));
					$("#beneficiaryID").addClass("invalid-field");
					if(firstErrorElementId==""){
						firstErrorElementId="beneficiaryID";
					}
					flag = false;
				}
			}
		}else{ 
			if (beneficiaryId.trim() == "") {
				$("#errBeneficiaryID").html(getBundle(getBundleLanguage, "beneficiary.hkId.notNull.message"));
				$("#beneficiaryID").addClass("invalid-field");
				if(firstErrorElementId==""){
					firstErrorElementId="beneficiaryID";
				}
				flag = false;
			}else {
				var tr=IsHKID(beneficiaryId.trim());
				if(tr==false){
					$("#errBeneficiaryID").html(getBundle(getBundleLanguage, "beneficiary.hkId.notValid.message"));
					$("#beneficiaryID").addClass("invalid-field");
					if(firstErrorElementId==""){
						firstErrorElementId="beneficiaryID";
					}
					flag = false;
				}
				
				if(beneficiaryId.trim() == InsuHkid.trim()){
					$("#errBeneficiaryID").html(getBundle(getBundleLanguage, "beneficiary.hkId.same.message"));
					$("#beneficiaryID").addClass("invalid-field");
					if(firstErrorElementId==""){
						firstErrorElementId="beneficiaryID";
					}
					flag = false;
				}
			}
		}
			
	}
	
	
	if (overseaDepartureDate.trim() == "" || overseaDepartureDate.trim() == "DD-MM-YYYY") {
		$('#oversea_departure_date').addClass('invalid-field');
		$("#overseaDepartureDateInvalid").html( getBundle(getBundleLanguage, "Overseas.userdetails.institution.departure.Error.Empty"));
		flag = false;
		if(firstErrorElementId==""){
			firstErrorElementId="oversea_departure_date";
		}
	}
	else {
		$("#"+'overseaDepartureDateInvalid').html('');
		$("#"+'oversea_departure_date').removeClass("invalid-field");
	}	

	//Overseas.userdetails.Instituation.Country.NotCoveredAsia
	//Overseas.userdetails.Instituation.Country.NotCoveredAsia.url
	plan = document.getElementById("selectedPlanName").value;
	/*
	  
	asia_country_list =["Abu Dhabi","Dubai","India","Indonesia","Iran","Japan","Korea","Lao, P.D.R.","Macau","Malaysia","Myanmar","Nepal","North Korea","Pakistan","People Republic of China","Philippines","Singapore","Sri Lanka","Sudan","Taiwan","Thailand","Vietnam"];
	world_wide_country_list = [ "Abu Dhabi", "Australia", "Austria", "Belgium","Brunei", "Canada", "Cuba", "Cyprus", "Denmark", "Dubai", "France", "Germany", "Guam", "Holland", "India", "Indonesia", "Iran","Ireland", "Italy", "Japan", "Korea", "Lao P.D.R.", "Macau","Malaysia", "Monaco", "Myanmar", "Nepal", "New Zealand","North Korea", "Norway", "Pakistan", "People Republic of China","Philippines", "Poland", "Portugal", "Russia", "Singapore","South Africa", "Spain", "Sri Lanka", "Sudan", "Sweden","Switzerland", "Syria", "Taiwan", "Thailand", "Turkey","United Kingdom", "Vietnam" ];
	*/
	asia_country_list=["India","Japan","Korea","Macau","Malaysia","People Republic of China","Singapore","Taiwan","Thailand","Vietnam"];
	world_wide_country_list=["Australia","Austria","Belgium","Canada","Denmark","France","Germany","Holland", "India", "Indonesia","Ireland", "Italy", "Japan", "Korea","Macau","Malaysia","New Zealand","People Republic of China","Poland", "Portugal","Singapore","Spain","Sudan", "Sweden","Switzerland","Taiwan", "Thailand","United Kingdom", "Vietnam" ];
	
	var compare_list =[];
	var isAsia = true;
	//alert(countryOfInstitution);
	if (countryOfInstitution.trim() == '')
	{
		$("#"+'countryOfInstitution').addClass("invalid-field");
		$("#countryOfInstitutionInvalid").html( getBundle(getBundleLanguage, 'Overseas.userdetails.Instituation.Country.Error'));
		flag = false;
		if(firstErrorElementId==""){
			firstErrorElementId="countryOfInstitution";
		}
	}
	else
	{
		if($("#"+'selectedPlanName').val()=="basicA" || $("#"+'selectedPlanName').val()=="basicB" || $("#"+'selectedPlanName').val()=="medicalWorldwideA" || $("#"+'selectedPlanName').val()=="medicalWorldwideB"){
			compare_list = world_wide_country_list;
			isAsia = false;
			//console.log("worldwide");
		}else if($("#"+'selectedPlanName').val()=="medicalAsiaA" || $("#"+'selectedPlanName').val()=="medicalAsiaB"){
			compare_list = asia_country_list;
			isAsia = true;
			//console.log("asia");
		}
		//console.log(compare_list);
		//console.log(compare_list.indexOf(countryOfInstitution));
		if(compare_list.indexOf(countryOfInstitution) < 0){
			previous_action_link = window.location.href;
			previous_action_link = previous_action_link.replace("details","quote");
			$("#"+'countryOfInstitution').addClass("invalid-field");
			console.log(world_wide_country_list.indexOf(countryOfInstitution) > 0);
			if(isAsia){
				if(world_wide_country_list.indexOf(countryOfInstitution) > 0){
					$("#countryOfInstitutionInvalid").html( getBundle(getBundleLanguage, 'Overseas.userdetails.Instituation.Country.NotCoveredAsia') );
					$("#countryOfInstitutionInvalid").append("<a class='error-to-previous-page text-red' href='"+previous_action_link+"'>" + getBundle(getBundleLanguage, 'Overseas.userdetails.Instituation.Country.NotCoveredAsia.url') +"</a>" + getBundle(getBundleLanguage, 'Overseas.userdetails.Instituation.Country.NotCoveredAsia.end'));
				}else{
					$("#countryOfInstitutionInvalid").html( getBundle(getBundleLanguage, 'Overseas.userdetails.Instituation.Country.NotCoveredWorldwide') );
				}
			}else if(!(isAsia)){
				$("#countryOfInstitutionInvalid").html( getBundle(getBundleLanguage, 'Overseas.userdetails.Instituation.Country.NotCoveredWorldwide') );
			}
			flag = false;
			if(firstErrorElementId==""){
				firstErrorElementId="countryOfInstitution";
			}
		}else{
			$("#"+'countryOfInstitution').removeClass("invalid-field");
			$("#countryOfInstitutionInvalid").html( ''); 			
		}
	}

	if (nameOfInstitution.trim() == "") {
		$('#nameOfInstitutionInvalid').html(getBundle(
				getBundleLanguage, "Overseas.userdetails.Instituation.Name.Error"));
		$('#nameOfInstitution').addClass('invalid-field');
		flag = false;
		if (firstErrorElementId == "") {
			firstErrorElementId = "nameOfInstitution";
		}
	}
	else {
		$("#"+'nameOfInstitutionInvalid').html('');
		$("#"+'nameOfInstitution').removeClass("invalid-field");
	}
	
	if (addressofInstitutionLine1.trim() == "" && addressofInstitutionLine2.trim() == "" && addressofInstitutionLine3.trim() == "") {
		$("#addressofInstitutionLine1").addClass("invalid-field");	
		$("#addressofInstitutionLine2").addClass("invalid-field");
		$("#addressofInstitutionLine3").addClass("invalid-field");
		$("#addressofInstitutionInvalid").html( getBundle(getBundleLanguage, "Overseas.userdetails.Instituation.Error.Empty"));
		flag = false;
		if(firstErrorElementId==""){
			firstErrorElementId="addressofInstitutionLine1";
		}
	}
	else {
		$("#"+'addressofInstitutionInvalid').html('');
		$("#"+'addressofInstitutionLine1').removeClass("invalid-field");
		$("#"+'addressofInstitutionLine2').removeClass("invalid-field");
		$("#"+'addressofInstitutionLine3').removeClass("invalid-field");
	}
	
	if (!visacheckbox)
	{
		$("#"+'visacheckbox').addClass("invalid-field");
		$("#visacheckboxInvalid").html( getBundle(getBundleLanguage, 'Oversea.userdetails.Insured.Visa.Error')); 
		flag = false;
	}
	else
	{
		$("#"+'visacheckbox').removeClass("invalid-field");
		$("#visacheckboxInvalid").html( ''); 	
	}
	
//	if (insuredDob.trim() == "") {
//		$('#overseaDepartureDateInvalid').html(getBundle(getBundleLanguage, "Overseas.userdetails.institution.departure.Error.Empty"));
//		$('#oversea_departure_date').addClass('invalid-field');
//		if (firstErrorElementId == "") {
//			firstErrorElementId = "oversea_departure_date";
//		}
//		flag = false;
//	}
//
//	
//	if (nameOfInstitution.trim() == "") {
//		$('#nameOfInstitutionInvalid').html(getBundle(
//				getBundleLanguage, "Overseas.userdetails.Instituation.Name.Error"));
//		$('#nameOfInstitution').addClass('invalid-field');
//		if (firstErrorElementId == "") {
//			firstErrorElementId = "nameOfInstitution";
//		}
//		flag = false;
//	}
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
    var Date1 = moment(InsuDob,"DD-MM-YYYY"); 
    var Date2 = moment(moment().format("DD-MM-YYYY"),"DD-MM-YYYY");
	var Date3 =moment(overseaDepartureDate,"DD-MM-YYYY");	
	//var departAge = Date1.from(Date3).split(" ");
	//var currAge = Date1.from(Date2).split(" ");
	//console.log(Date1);
	//console.log(Date2);
	var departAge = Date3.diff(Date1,'years',true);
	var currAge = Date2.diff(Date1,'years',true);
	//console.log("DepartAge= "+departAge);
	//console.log("CurrAge= "+currAge);
	if(appRelation =="SE"){
		if(currAge > 65){
			//console.log(">65");
			$("#input_oversea_dob").addClass("invalid-field");
			$("#dobInvalid").html( getBundle(getBundleLanguage, "Overseas.userdetails.Insured.DOB.Error.12and65"));
			$("#oversea_insure_dob").addClass("invalid-field");
			$("#dobInsuredInvalid").html( getBundle(getBundleLanguage, "Overseas.userdetails.Insured.DOB.Error.12and65"));
			flag = false;
			if (firstErrorElementId == "") {firstErrorElementId = "input_oversea_dob";}		
		}else if(departAge > 65 && currAge < 65){
			$("#input_oversea_dob").addClass("invalid-field");
			$("#dobInvalid").html( getBundle(getBundleLanguage, "Overseas.userdetails.applicant.DOB.Error.65"));
			$("#oversea_insure_dob").addClass("invalid-field");
			$("#dobInsuredInvalid").html( getBundle(getBundleLanguage, "Overseas.userdetails.applicant.DOB.Error.65"));
			flag = false;
			if (firstErrorElementId == "") {firstErrorElementId = "input_oversea_dob";}	
		}else if(applicantDob.trim() =="DD-MM-YYYY" || applicantDob.trim() ==""){
			$("#input_oversea_dob").addClass("invalid-field");
			$("#dobInvalid").html( getBundle(getBundleLanguage, "Overseas.userdetails.applicant.DOB.Error.Empty"));
			$("#oversea_insure_dob").addClass("invalid-field");
			$("#dobInsuredInvalid").html( getBundle(getBundleLanguage, "Overseas.userdetails.Insured.DOB.Error.Empty"));
			flag = false;
			if (firstErrorElementId == "") {firstErrorElementId = "input_oversea_dob";}	
		}else {
			$("#input_oversea_dob").removeClass("invalid-field");
			$("#dobInvalid").html( '');
			$("#oversea_insure_dob").removeClass("invalid-field");
			$("#dobInsuredInvalid").html( '');			
		}
	}else{
		if(applicantDob.trim() !="" || applicantDob.trim() !="DD-MM-YYYY"){
			$("#input_oversea_dob").removeClass("invalid-field");
			$("#dobInvalid").html( '');			
		}		
		//console.log("insured");
		if(currAge > 65 && InsuDob!=""){
			$("#oversea_insure_dob").addClass("invalid-field");
			$("#dobInsuredInvalid").html( getBundle(getBundleLanguage, "Overseas.userdetails.Insured.DOB.Error.12and65"));
			flag = false;
			if (firstErrorElementId == "") {firstErrorElementId = "oversea_insure_dob";}		
		}else if((departAge > 65 && InsuDob!="") || (departAge < 12 && InsuDob!="")){
			$("#oversea_insure_dob").addClass("invalid-field");
			if(departAge < 12){
				$("#dobInsuredInvalid").html( getBundle(getBundleLanguage, "Overseas.userdetails.insured.DOB.Error.12"));
			}else{
				$("#dobInsuredInvalid").html( getBundle(getBundleLanguage, "Overseas.userdetails.insured.DOB.Error.65"));
			}
			flag = false;
			if (firstErrorElementId == "") {firstErrorElementId = "oversea_insure_dob";}		
		}else if(InsuDob=="" || InsuDob=="DD-MM-YYYY"){
			$("#oversea_insure_dob").addClass("invalid-field");
			$("#dobInsuredInvalid").html( getBundle(getBundleLanguage, "Overseas.userdetails.Insured.DOB.Error.Empty"));
			flag = false;
			if (firstErrorElementId == "") {firstErrorElementId = "oversea_insure_dob";}			
		}else{
			$("#oversea_insure_dob").removeClass("invalid-field");
			$("#dobInsuredInvalid").html( ''); 		
		}
	}
//	var testDate = new Date();
//	var testDate2 = parseDate(applicantDob);
//	console.log(testDate.setDate(testDate2.getDate() + 90));
//	console.log(testDate.setDate(testDate.getDate() + 90));
	//console.log(calculateAge((parseDate)(applicantDob), new Date()));
	if (firstErrorElementId != "") {
		scrollToElement(firstErrorElementId);
	}
	if (oversea_click) {
		return false;
	} else {
		
		if(flag) {
			return flag;
		}else {
			$('#loading-overlay').modal('hide');
			oversea_click = false;
			return flag
		}

	}
}

function confirmDetails(form, formId, language) {
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
						+ '/overseas-study-insurance/payment';
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
	// 65 year ago
	var dob_65_date = new Date();
	dob_65_date.setFullYear(dob_65_date.getFullYear() - 65);		
	dob_65_date.setDate(dob_65_date.getDate());
	
	//Start at 1900
	var dob_1900_date = new Date();
	dob_1900_date.setFullYear(1900,0,1);
	
	function checkInsuredPerson(value) {
		if (value != "SE") {
			document.getElementById("lock_datepicker").removeAttribute("style");
			$("#txtInsuFullName1,#txtInsuHkid1,#insuredDob").prop('readonly',
					false);
			document.getElementById("txtInsuFullName1").value = insureNamePlaceholder;
			document.getElementById("txtInsuHkid1").value = insureHkidPlaceholder;
			document.getElementById("insuredDob").value = '';
			$('#oversea_insure_dob').datepicker('setStartDate',dob_65_date);
		} else {
			$('#oversea_insure_dob').datepicker('setStartDate',dob_1900_date);
			document.getElementById("txtInsuFullName1").value = document
					.getElementById("inputFullName").value;
			document.getElementById("txtInsuHkid1").value = document
					.getElementById("inputTxtAppHkid").value;
			document.getElementById("insuredDob").value = document
					.getElementById("applicantDob").value;
			modStyle = 'cursor: not-allowed;background-color: #eee;position:absolute;width:100%;height:100%;left:0px;top:0px;background:#fff;opacity:0;filter:alpha(opacity=0)'
			document.getElementById("lock_datepicker").setAttribute('style',
					modStyle);

			$("#txtInsuFullName1,#txtInsuHkid1").prop('readonly', true);
		}
	    if(value.trim() != "")
	    {
	        $("#"+'applicantRelationship').removeClass("invalid-field");
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
			    /*
				0:'basicWorldwideA',
				1:'basicWorldwideB',
				2:'medicalWorldwideA',
				3:'medicalWorldwideB',
				4:'basicAsiaA',
				5:'basicAsiaB',
				6:'medicalAsiaA',
			    7:'medicalAsiaB'
			    */
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
$(function () {
	$("#applicantDistrict").change(function() {
		$("#errorEmptycorrespondenceAddressDistrict").html('');
		$('#applicantDistrictSelectWrap').removeClass('invalid-field');
		setAtt("selectCADistHid", $(this).val());
	});
});
//function parseDate(dateStr) {
//  var dateParts = dateStr.split("-");
//  return new Date(dateParts[2], (dateParts[1] - 1), dateParts[0]);
//}

//is valid date format
//function calculateAge (dateOfBirth, dateToCalculate) {
//    var calculateYear = dateToCalculate.getFullYear();
//    var calculateMonth = dateToCalculate.getMonth();
//    var calculateDay = dateToCalculate.getDate();
//
//    var birthYear = dateOfBirth.getFullYear();
//    var birthMonth = dateOfBirth.getMonth();
//    var birthDay = dateOfBirth.getDate();
//
//    var age = calculateYear - birthYear;
//    var ageMonth = calculateMonth - birthMonth;
//    var ageDay = calculateDay - birthDay;
//
//    if (ageMonth < 0 || (ageMonth == 0 && ageDay < 0)) {
//        age = parseInt(age) - 1;
//    }
//    return age;
//}
//
//function isDate(txtDate) {
//  var currVal = txtDate;
//  if (currVal == '')
//    return true;
//
//  //Declare Regex
//  var rxDatePattern = /^(\d{1,2})(\/|-)(\d{1,2})(\/|-)(\d{4})$/;
//  var dtArray = currVal.match(rxDatePattern); // is format OK?
//
//  if (dtArray == null)
//    return false;
//
//  //Checks for dd/mm/yyyy format.
//  var dtDay = dtArray[1];
//  var dtMonth = dtArray[3];
//  var dtYear = dtArray[5];
//
//  if (dtMonth < 1 || dtMonth > 12)
//    return false;
//  else if (dtDay < 1 || dtDay > 31)
//    return false;
//  else if ((dtMonth == 4 || dtMonth == 6 || dtMonth == 9 || dtMonth == 11) && dtDay == 31)
//    return false;
//  else if (dtMonth == 2) {
//    var isleap = (dtYear % 4 == 0 && (dtYear % 100 != 0 || dtYear % 400 == 0));
//    if (dtDay > 29 || (dtDay == 29 && !isleap))
//      return false;
//  }
//
//  return true;
//}