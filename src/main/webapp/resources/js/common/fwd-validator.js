
/*
 * FWD Validatiors
 * Define standard validate functions for each input fields for GI and LIFE applications
 *
 * Validations Cover:
 * - Generic function
 * - User Acccount
 * - GI Application
 * - Life Application
 *
 *
 * Require? jQuery, loadash and etc
 *
 */
var fwdValidator = (function(){

	/*
	 * Check if a field is toggled. Apply to Checkbox / Radiobox
	 *
	 * @method isChecked
	 * @param {String} ID or class
	 * @return {Boolean} Returns true or false for the checking
	 */
	var _isChecked = function(selector){}

	var _isSelected = function(val){}
	var _isEmpty = function(val){}
	var _isRequired = function(val){}
	var _isDate = function(val){}
	var _isNumeric = function(val){}
	var _isArray = function(val){}
	var _isString = function(val){}
	var _isAlphanumeric = function(val){}
	var _isEnglish = function(val){}
	var _isChinese = function(val){}
	var _isMatch = function(val, regexString){}
	var _isValidLength = function(val, lengthLimit){}
	
	var _isValidEmail = function(val){}
	var _isValidHkid = function(val){}
	var _isValidPassport = function(val){}
	var _isValidMobile = function(val){}
	var _isValidResidentialNo = function(val){}
	var _isValidPassword = function(val){}
	var _isValidConfirmPassword = function(pass, confirmPass){}
	var _isValidAge = function(age, min, max){}
	var _isValidDob = function(dob, min, max){}
	var _isValidGender = function(val){}
	var _isValidUsername = function(val){}
	var _isValidAddress = function(val, val2, val3){}
	var _isValidDistrict = function(val){}
	var _isValidNationality = function(val){}
	var _isValidSmokingHabit = function(val){}
	var _isValidPob = function(val){}
	var _isValidEmployStatus = function(val){}
	var _isValidEmployerName = function(val){}
	var _isValidMonthlyIncome = function(val){}
	var _isValidEducationLevel = function(val){}
	var _isValidOccupation = function(val){}
	var _isValidNob = function(val){}
	var _isValidBeneLastName = function(val){}
	var _isValidBeneGivenName = function(val){}
	var _isValidBeneChiName = function(val){}
	var _isValidBeneHkid = function(val){}
	var _isValidBenePassport = function(val){}
	var _isValidBeneRelationship = function(val){}
	var _isValidBeneEntitlement = function(val, val2, val3){}
	var _isValidMartialStatus = function(val){}
	var _isValidPromoCode = function(val){}

	/*
	 * Generic validation group
	 */ 
	var _vadidation_generic = {
		isChecked : _isChecked
		isSelected : _isSelected
		isEmpty : _isEmpty
		isRequired : _isRequired
		isDate : _isDate
		isNumeric : _isNumeric
		isArray : _isArray
		isString : _isString
		isAlphanumeric : _isAlphanumeric
		isEnglish : _isEnglish
		isChinese : _isChinese
		isMatch : _isMatch
		isValidLength : _isValidLength
	}

	/*
	 * User account validation group
	 */ 
	var _vadidation_user = {
		isValidUsername : _isValidUsername,
		isValidEmail : _isValidEmail,
		isValidPassword : _isValidPassword,
		isValidConfirmPassword : _isValidConfirmPassword
	}

	/*
	 * Saive quotation validation group
	 */
	var _vadidation_savie_quote = {
		isValidPromoCode : _isValidPromoCode
	}

	/*
	 * Personal info validation group
	 */
	var _vadidation_personal_info = {
		isValidEmail : _isValidEmail,
		isValidHkid : _isValidHkid,
		isValidPassport : _isValidPassport,
		isValidMobile : _isValidMobile,
		isValidResidentialNo : _isValidResidentialNo,
		isValidAge : _isValidAge,
		isValidDob : _isValidDob,
		isValidGender : _isValidGender,
		isValidNationality : _isValidNationality,
		isValidSmokingHabit : _isValidSmokingHabit,
		isValidPob : _isValidPob,
		isValidMartialStatus : _isValidMartialStatus

	}

	/*
	 * Employment info validation group
	 */
	var _vadidation_employment_info = {
		isValidEmployStatus : _isValidEmployStatus,
		isValidEmployerName : _isValidEmployerName,
		isValidMonthlyIncome : _isValidMonthlyIncome,
		isValidEducationLevel : _isValidEducationLevel,
		isValidOccupation : _isValidOccupation,
		isValidNob : _isValidNob,

	}

	/*
	 * Beneficiary info validation group
	 */
	var _vadidation_beneficiary_info = {
		isValidBeneLastName : _isValidBeneLastName,
		isValidBeneGivenName : _isValidBeneGivenName,
		isValidBeneChiName : _isValidBeneChiName,
		isValidBeneHkid : _isValidBeneHkid,
		isValidBenePassport : _isValidBenePassport,
		isValidBeneRelationship : _isValidBeneRelationship,
		isValidBeneEntitlement : _isValidBeneEntitlement,

	}

	/*
	 * Document upload validation group
	 */
	var _vadidation_document_upload = {
		
	}

	/*
	 * Address validation group
	 */
	var _vadidation_address = {
		giAdd: '',
		lifeAdd: _isValidAddress,
		isValidDistrict : _isValidDistrict
	}

	return {
		generic: _vadidation_generic,
		personalInfo: _vadidation_personal_info,
		employmentInfo: _vadidation_employment_info,
		beneficiaryInfo: _vadidation_beneficiary_info,
		documentUpload: _vadidation_document_upload,
		savieQuote: _vadidation_savie_quote
	};

})();
