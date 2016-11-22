'use strict';
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

 // VALIDATION - prerequistite << start >>
 try {
     // MUST - Check fwdConstant : RegExp etc.
     if ( typeof fwdConstant === "object" || fwdConstant === null ) {
        //  var regexp      = fwdConstant.regex;
        //  var constant    = fwdConstant.constant;
     } else {
         throw ('No fwd-constant.js are loaded. Please check again.');
     }

 } catch (e) {
     console.error(e.name.toString() + ' >>> ' + e.message);
 }
 // VALIDATION - prerequistite << end >>

var fwdValidator = (function(fwdConstant) {

	/*
	 * Check if a field is toggled. Apply to Checkbox / Radiobox
	 *
	 * @method isChecked
	 * @param {String} ID or class
	 * @return {Boolean} Returns true or false for the checking
	 */
	var _isChecked = function(selector){};

	var _isSelected = function(val){};
	var _isEmpty = function(val){};
	var _isRequired = function(val){};
	var _isDate = function(val){};
	var _isNumeric = function(val){};
	var _isArray = function(val){};
	var _isString = function(val){};
	var _isAlphanumeric = function(val){};
	var _isEnglish = function(val){};
	var _isChinese = function(val){};
	var _isMatch = function(val, regexString){};
	var _isValidLength = function(val, lengthLimit){};

	var _isValidEmail = function(val){};
	var _isValidHkid = function (str) {

		/* Migrated from "js/fwd.js", orginal function name < function IsHKID() > */

		var strValidChars = fwdConstant.constant.text.allEngChar.uppercase;
			// basic check length
			if (str.length < 8)
				return false;

		// handling bracket
		if (str.charAt(str.length - 3) == '(' && str.charAt(str.length - 1) == ')')
			str = str.substring(0, str.length - 3) + str.charAt(str.length - 2);

		str = str.toUpperCase();

		// regular expression to check pattern and split
		var hkidPattern1 = new RegExp(fwdConstant.regex.person.ssn.hkidPattern1);
		var matchArray = str.match(hkidPattern1);

		var hkidPattern2 = new RegExp(fwdConstant.regex.person.ssn.hkidPattern2);
		var matchArray2 = str.match(hkidPattern2);

		// not match, return false
		if (matchArray == null && matchArray2 == null)
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
	};

	var _isValidPassport = function(val){};
	var _isValidMobile = function(val){};
	var _isValidResidentialNo = function(val){};
	var _isValidPassword = function(val){};
	var _isValidConfirmPassword = function(pass, confirmPass){};
	var _isValidAge = function(age, min, max){};
	var _isValidDob = function(dob, min, max){};
	var _isValidGender = function(val){};
	var _isValidUsername = function(val){};
	var _isValidAddress = function(val, val2, val3){};
	var _isValidDistrict = function(val){};
	var _isValidNationality = function(val){};
	var _isValidSmokingHabit = function(val){};
	var _isValidPob = function(val){};
	var _isValidEmployStatus = function(val){};
	var _isValidEmployerName = function(val){};
	var _isValidMonthlyIncome = function(val){};
	var _isValidEducationLevel = function(val){};
	var _isValidOccupation = function(val){};
	var _isValidNob = function(val){};
	var _isValidBeneLastName = function(val){};
	var _isValidBeneGivenName = function(val){};
	var _isValidBeneChiName = function(val){};
	var _isValidBeneHkid = function(val){};
	var _isValidBenePassport = function(val){};
	var _isValidBeneRelationship = function(val){};
	var _isValidBeneEntitlement = function(val, val2, val3){};
	var _isValidMartialStatus = function(val){};
	var _isValidPromoCode = function(val){};

	/*
	 * Generic validation group
	 */
	var _vadidation_generic = {
		isChecked : _isChecked
		, isSelected : _isSelected
		, isEmpty : _isEmpty
		, isRequired : _isRequired
		, isDate : _isDate
		, isNumeric : _isNumeric
		, isArray : _isArray
		, isString : _isString
		, isAlphanumeric : _isAlphanumeric
		, isEnglish : _isEnglish
		, isChinese : _isChinese
		, isMatch : _isMatch
		, isValidLength : _isValidLength
	};

	/*
	 * User account validation group
	 */
	var _vadidation_user = {
		isValidUsername : _isValidUsername
		, isValidEmail : _isValidEmail
		, isValidPassword : _isValidPassword
		, isValidConfirmPassword : _isValidConfirmPassword
	};

	/*
	 * Saive quotation validation group
	 */
	var _vadidation_savie_quote = {
		isValidPromoCode : _isValidPromoCode
	};

	/*
	 * Personal info validation group
	 */
	var _vadidation_personal_info = {
		isValidEmail : _isValidEmail
		, isValidHkid : _isValidHkid
		, isValidPassport : _isValidPassport
		, isValidMobile : _isValidMobile
		, isValidResidentialNo : _isValidResidentialNo
		, isValidAge : _isValidAge
		, isValidDob : _isValidDob
		, isValidGender : _isValidGender
		, isValidNationality : _isValidNationality
		, isValidSmokingHabit : _isValidSmokingHabit
		, isValidPob : _isValidPob
		, isValidMartialStatus : _isValidMartialStatus
	};

	/*
	 * Employment info validation group
	 */
	var _vadidation_employment_info = {
		isValidEmployStatus : _isValidEmployStatus
		, isValidEmployerName : _isValidEmployerName
		, isValidMonthlyIncome : _isValidMonthlyIncome
		, isValidEducationLevel : _isValidEducationLevel
		, isValidOccupation : _isValidOccupation
		, isValidNob : _isValidNob
	};

	/*
	 * Beneficiary info validation group
	 */
	var _vadidation_beneficiary_info = {
		isValidBeneLastName : _isValidBeneLastName
		, isValidBeneGivenName : _isValidBeneGivenName
		, isValidBeneChiName : _isValidBeneChiName
		, isValidBeneHkid : _isValidBeneHkid
		, isValidBenePassport : _isValidBenePassport
		, isValidBeneRelationship : _isValidBeneRelationship
		, isValidBeneEntitlement : _isValidBeneEntitlement
	};

	/*
	 * Document upload validation group
	 */
	var _vadidation_document_upload = {

	};

	/*
	 * Address validation group
	 */
	var _vadidation_address = {
		giAdd: ''
		, lifeAdd: _isValidAddress
		, isValidDistrict : _isValidDistrict
	};

	return {
		generic: _vadidation_generic
		, personalInfo: _vadidation_personal_info
		, employmentInfo: _vadidation_employment_info
		, beneficiaryInfo: _vadidation_beneficiary_info
		, documentUpload: _vadidation_document_upload
		, savieQuote: _vadidation_savie_quote
	};

})(fwdConstant);
