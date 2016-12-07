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
     console.error(e);
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

    var _isAlphaSpace = function(inputtxt) {
        /* Migrated from "js/fwd.js", orginal function name < function allLetter() > */
    	var letters = new RegExp(fwdConstant.regex.general.text.enSpace);
    	return inputtxt.match(letters) ? true : false;
    };

	var _isChinese = function(val){};
	var _isMatch = function(val, regexString){};
	var _isValidLength = function(val, lengthLimit){};
	var _isValidEmail = function(val){};

    var _isValidHkid = function (str) {

        /* Migrated from "js/fwd.js", orginal function name < function IsHKID() > */
        var strValidChars = fwdConstant.text.allEngChar.uppercase;
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
    var _isValidBeneFullName = function(val){};
	var _isValidMartialStatus = function(val){};
	var _isValidPromoCode = function(val){};

    var _returnEngSpaceOnly = function(evt) {
    	evt = (evt) ? evt : event;
    	var charCode = (evt.charCode) ? evt.charCode : ((evt.keyCode) ? evt.keyCode : ((evt.which) ? evt.which : 0));
    	if((evt.charCode == 0 && evt.keyCode==37) || (evt.charCode == 0  && evt.keyCode==39) || (evt.charCode == 0  && evt.keyCode==46)){
    		return true;
    	}
    	if (charCode > 32 && (charCode < 65 || charCode > 90) && (charCode < 97 || charCode > 122)) {
    		return false;
    	}
    	return true;
    };

    var _returnValid_Username_or_Email_Char = function(evt) {
		evt = (evt) ? evt : event;
		var eCode = evt.keyCode;
		var charCode = (evt.charCode) ? evt.charCode : ((evt.keyCode) ? evt.keyCode : ((evt.which) ? evt.which : 0));
		var keychar = String.fromCharCode(charCode)
		if ( (charCode >=48 && charCode <=57) || (charCode >= 65 && charCode <= 90) || (charCode >= 97 && charCode <= 122) || charCode == 127 || charCode == 8
				|| (evt.charCode == 0 && evt.keyCode==37) || (evt.charCode == 0 && evt.keyCode==46) || (evt.charCode == 0  && evt.keyCode==39)
				|| charCode == 45 || charCode == 95 || charCode == 46 || charCode == 64) {
			return true;
		}
		return false;
	};

    var _returnHkidLegalCharOnly = function(evt) {
    	evt = (evt) ? evt : event;
    	var eCode = evt.keyCode;
    	var charCode = (evt.charCode) ? evt.charCode : ((evt.keyCode) ? evt.keyCode : ((evt.which) ? evt.which : 0));
    	var keychar = String.fromCharCode(charCode)
    	// || (charCode == 37 && eCode==37) || (charCode == 39  && eCode==39)
    	// || (charCode == 37 && keychar != "%") || (charCode == 39  && keychar != "'")
    	if ( (charCode >=48 && charCode <=57) || (charCode >= 65 && charCode <= 90) || (charCode >= 97 && charCode <= 122) || charCode == 127 || charCode == 8
    			|| (evt.charCode == 0 && evt.keyCode==37) || (evt.charCode == 0 && evt.keyCode==46) || (evt.charCode == 0  && evt.keyCode==39)) {
    		return true;
    	}
    	return false;
    };

    /*
	 * Check current device is mobile or not by Regex
	 *
	 * @method _currentDevice_isMobile
	 * @param  nil
	 * @return {Boolean} Returns true or false
	 */
    var _currentDevice_isMobile = function() {
        /* Migrated from "js/fwd.js", orginal {Boolean} name < isMobile > */
        var mobRegex = new RegExp( fwdConstant.regex.general.devices.mob );
        return mobRegex.test( navigator.userAgent) ? true : false;
    };


    /*
	 * ****************** Function groups as below ******************
	 */
	var _validation_generic = {
		// 'isChecked' : _isChecked
		// , 'isSelected' : _isSelected
		// , 'isEmpty' : _isEmpty
		// , 'isRequired' : _isRequired
		// , 'isDate' : _isDate
		// , 'isNumeric' : _isNumeric
		// , 'isArray' : _isArray
		// , 'isString' : _isString
		// , 'isAlphanumeric' : _isAlphanumeric
		// , 'isEnglish' : _isEnglish
        // ,
        'isAlphaSpace':     _isAlphaSpace             // replaced allLetter() in fwd.js
		// , 'isChinese': _isChinese
		// , 'isMatch' : _isMatch
		// , 'isValidLength' : _isValidLength
	};

	/*
	 * User account validation group
	 */
	var _validation_user = {
		// isValidUsername : _isValidUsername
		// , isValidEmail : _isValidEmail
		// , isValidPassword : _isValidPassword
		// , isValidConfirmPassword : _isValidConfirmPassword
	};

	/*
	 * Saive quotation validation group
	 */
	var _validation_savie_quote = {
		// isValidPromoCode : _isValidPromoCode
	};

	/*
	 * Personal info validation group
	 */
	var _validation_personal_info = {
		// isValidEmail : _isValidEmail
        // ,
		isValidHkid : _isValidHkid
		// , isValidPassport : _isValidPassport
		, isValidMobile : _isValidMobile
		// , isValidResidentialNo : _isValidResidentialNo
		// , isValidAge : _isValidAge
		// , isValidDob : _isValidDob
		// , isValidGender : _isValidGender
		// , isValidNationality : _isValidNationality
		// , isValidSmokingHabit : _isValidSmokingHabit
		// , isValidPob : _isValidPob
		// , isValidMartialStatus : _isValidMartialStatus
	};

	/*
	 * Employment info validation group
	 */
	var _validation_employment_info = {
		// isValidEmployStatus : _isValidEmployStatus
		// , isValidEmployerName : _isValidEmployerName
		// , isValidMonthlyIncome : _isValidMonthlyIncome
		// , isValidEducationLevel : _isValidEducationLevel
		// , isValidOccupation : _isValidOccupation
		// , isValidNob : _isValidNob
	};

	/*
	 * Beneficiary info validation group
	 */
	var _validation_beneficiary_info = {
		// 'isValidBeneLastName' : _isValidBeneLastName
		// , 'isValidBeneGivenName' : _isValidBeneGivenName
		// , 'isValidBeneChiName' : _isValidBeneChiName
		// , 'isValidBeneHkid' : _isValidBeneHkid
		// , 'isValidBenePassport' : _isValidBenePassport
		// , 'isValidBeneRelationship' : _isValidBeneRelationship
		// , 'isValidBeneEntitlement' : _isValidBeneEntitlement
        // , 'isValidBeneFullName' : _isValidBeneFullName
        // , 'isValidBeneDob': _isValidBeneDob
	};

	/*
	 * Document upload validation group
	 */
	var _validation_document_upload = {};

	/*
	 * Address validation group
	 */
	var _validation_address = {
		// giAdd: ''
		// , lifeAdd: _isValidAddress
		// , isValidDistrict : _isValidDistrict
	};

    /*
	 * Address validation group
	 */
	var _validation_eventHandler = {
        'returnEngSpaceOnly':           _returnEngSpaceOnly                    // replaced alphaOnly() in fwd.js
        , 'returnHkidLegalCharOnly':    _returnHkidLegalCharOnly               // replaced hkidOnkeypress() in fwd.js
        , 'returnValidUsernameChar':    _returnValid_Username_or_Email_Char    // replaced validationUsername() validationEmail()
        , 'returnValidEmailChar':       _returnValid_Username_or_Email_Char    // replaced validationUsername() validationEmail()
    };


    var _devices_detection = {
        'isMobile': _currentDevice_isMobile
    };

	return {
		'generic': _validation_generic
        , 'currentDevice': _devices_detection
        // , 'user': _validation_user
        // , 'savieQuote': _validation_savie_quote
		, 'personalInfo': _validation_personal_info
		// , 'employmentInfo': _validation_employment_info
		, 'beneficiaryInfo': _validation_beneficiary_info
		// , 'documentUpload': _validation_document_upload
        , 'eventHandler': _validation_eventHandler
	};

})(fwdConstant);
