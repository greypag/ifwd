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

    var _isEngSpace = function(inputtxt) {

        /* Migrated from "js/fwd.js", orginal function name < function allLetter() > */
    	var letters = new RegExp(fwdConstant.regex.general.text.enSpace);
    	return inputtxt.match(letters) ? true : false;
    };

	var _isChinese = function(val){};
	var _isMatch = function(val, regexString){};
	var _isValidLength = function(val, lengthLimit){};
	var _isValidEmail = function(val){};
	var _isValidHkid = function(val){};
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

    // var _isValidBeneFullName = function (inputId, errorId, insureBoolean, inputType) {
    // (inputId, errorId) wrapped into "dataSourceFieldInfo"
    // var _isValidBeneHkid = function (insureBoolean, inputType, placeholderObj, insureFieldInfo, dataSourceFieldInfo) {
	var _isValidBeneHkid = function (inputId, selectId, errorId, insureBoolean, inputType) {
    	var placeholder='';
    	if(inputType=="applicant"){
    		placeholder=hkidPlaceholder;
    	}else if(inputType=="insured"){
    		placeholder=insureHkidPlaceholder;
    	}else if(inputType=="beneficiary"){
    		placeholder=benHkidPlaceholder;
    	}

    	if($("#"+inputId).val()==placeholder.trim()){
    		$("#"+inputId).val('');
        }

    	$('#'+inputId).val($('#'+inputId).val().toUpperCase());
    	var appHkid = $('#'+inputId).val();
    	var mySelectId = $('#'+selectId).val();
    	if($('#'+selectId).length > 0 && ($('#'+selectId).val().toLowerCase() == 'passport' || $('#'+selectId).val().toLowerCase() == 'apppassport')){
    		if (appHkid.trim() == "") {
    			$("#"+inputId).addClass("invalid-field");
    			if(inputType=="applicant"){
    				$('#'+errorId).html(getBundle(getBundleLanguage, "applicant.passport.notNull.message"));
    			}else if(inputType=="insured"){
    				$("#"+errorId).html(getBundle(getBundleLanguage, "insured.passport.lengthViolation.message"));
    			}else if(inputType=="beneficiary"){
    				$("#"+errorId).html(getBundle(getBundleLanguage, "beneficiary.passport.notNull.message"));
    			}
    			return false;
    		}else{
    			var tr = chkTravelHKPassLen(appHkid.trim());
                var tr1 = chkTravelHKPass(appHkid.trim());

    			if (tr == false) {
    				$("#"+inputId).addClass("invalid-field");
    				$('#'+errorId).html(getBundle(getBundleLanguage, "applicant.passport.notValidLength.message"));
    				return false;
    			}
    			if (tr1 == false) {
    				$("#"+inputId).addClass("invalid-field");
    				if(inputType=="applicant"){
    					$('#'+errorId).html(getBundle(getBundleLanguage, "applicant.passport.notEnglish.message"));
    				}else if(inputType=="insured"){
    					$("#"+errorId).html(getBundle(getBundleLanguage, "insured.passport.notEnglish.message"));
    				}else if(inputType=="beneficiary"){
    					$("#"+errorId).html(getBundle(getBundleLanguage, "beneficiary.passport.notValid.message"));
    				}
    				return false;
    			}
    		}
    	}else{
    		if (appHkid.trim() == "") {
    			$("#"+inputId).addClass("invalid-field");
    			if(inputType=="applicant"){
    				$('#'+errorId).html(getBundle(getBundleLanguage, "applicant.hkId.notNull.message"));
    			}else if(inputType=="insured"){
    				$("#"+errorId).html(getBundle(getBundleLanguage, "insured.hkId.notNull.message"));
    			}else if(inputType=="beneficiary"){
    				$("#"+errorId).html(getBundle(getBundleLanguage, "beneficiary.hkId.notNull.message"));
    			}
    			$("#"+inputId).val(placeholder);
    			return false;
    		}
    		var tr=IsHKID(appHkid.trim());
    		if(tr==false){
    			$("#"+inputId).addClass("invalid-field");
    			if(inputType=="applicant"){
    				$('#'+errorId).html(getBundle(getBundleLanguage, "applicant.hkId.notValid.message"));
    			}else if(inputType=="insured"){
    				$("#"+errorId).html(getBundle(getBundleLanguage, "insured.hkId.notValid.message"));
    			}else if(inputType=="beneficiary"){
    				$("#"+errorId).html(getBundle(getBundleLanguage, "beneficiary.hkId.notValid.message"));
    			}
    			return false;
    		}
    	}

    	if(insureBoolean){
    		if (document.getElementById("applicantRelationship") != null) {
    			if (document.getElementById("applicantRelationship").value == 'SE'){
    				$("#txtInsuHkid1").val(appHkid);
    				$("#txtInsuHkid1").removeClass("bmg_custom_placeholder");

    				$("#txtInsuHkid1").removeClass("invalid-field");
    				$("#errtxtInsuHkid1").html("");
    			}
    		}
    		else {
    			$("#txtInsuHkid1").val(appHkid);
    			$("#txtInsuHkid1").removeClass("bmg_custom_placeholder");

    			$("#txtInsuHkid1").removeClass("invalid-field");
    			$("#errtxtInsuHkid1").html("");
    		}
    	}
    	$('#'+errorId).html('');
    	$("#"+inputId).removeClass("invalid-field");
    };

	var _isValidBenePassport = function(val){};
	var _isValidBeneRelationship = function(val){};
	var _isValidBeneEntitlement = function(val, val2, val3){};

    // var _isValidBeneFullName = function (inputId, errorId, insureBoolean, inputType) {
    // (inputId, errorId) wrapped into "dataSourceFieldInfo"
    var _isValidBeneFullName = function (insureBoolean, personRole, placeholderObj, insureFieldInfo, dataSourceFieldInfo) {
        var localConfig = {
            'applicant': {
                'msg':         getBundle(getBundleLanguage, "applicant.name.notNull.message")
                , 'namePH':    placeholderObj.applicantName
            },
            'insured': {
                'msg':         getBundle(getBundleLanguage, "insured.name.notNull.message")
                , 'namePH':    placeholderObj.insuredName
            },
            'beneficiary': {
                'msg':         getBundle(getBundleLanguage, "beneficiary.name.notNull.message")
                , 'namePH':    placeholderObj.beneficiaryName
            }
        };

        // // Assign "placeholder" value, refer to (applicant, insured, beneficiary)
        var placeholder = '';
        _.each(localConfig, function(LCvalue, LCindex) {
            if (personRole == LCindex) { placeholder = LCvalue.namePH; }
        });

        // Truncate the field value once IF EQUAL TO placeholder value
    	if ( $("#"+dataSourceFieldInfo.inputId).val() == placeholder.trim() ) {
    		$("#"+dataSourceFieldInfo.inputId).val('');
        }

    	var fullname = $("#"+dataSourceFieldInfo.inputId).val();
    	if (fullname.trim() == "") {

    		$("#"+dataSourceFieldInfo.inputId).addClass("invalid-field");
            // Assign $("#"+dataSourceFieldInfo.errorId).html() value, refer to (applicant, insured, beneficiary)
            _.each(localConfig, function(LCvalue, LCindex) {
                if (personRole == LCindex) { $("#"+dataSourceFieldInfo.errorId).html( LCvalue.msg ); }
            });
    		// $("#"+dataSourceFieldInfo.inputId).val(placeholder);
    		return false;

    	}

        // if (allLetter(fullname) == false) {
    	if ( _isEngSpace(fullname) == false) { // Private _isEngSpace() in current file

    		$("#"+dataSourceFieldInfo.inputId).addClass("invalid-field");
            // Assign $("#"+dataSourceFieldInfo.errorId).html() value, refer to (applicant, insured, beneficiary)
            _.each(localConfig, function(LCvalue, LCindex) {
                if (personRole == LCindex) { $("#"+dataSourceFieldInfo.errorId).html( LCvalue.msg ); }
            });
    		return false;

    	}

        console.log( 'insureBoolean = ' + insureBoolean );
    	if (insureBoolean) {
            // console.log( '#applicantRelationship.val() = ' + document.getElementById("applicantRelationship") );
    		if (document.getElementById("applicantRelationship") != null) {
    			if (document.getElementById("applicantRelationship").value == 'SE'){
    				$('#'+insureFieldInfo.inputBoxId).val(fullname);
    				$('#'+insureFieldInfo.inputBoxId).removeClass("bmg_custom_placeholder");

    				$('#'+insureFieldInfo.inputBoxId).removeClass("invalid-field");
    				$('#'+insureFieldInfo.errMsgDOMId).html("");
    				$("#errtxtAdFullName1").html(""); // where? may check later
    			}
    		} else {
    			$('#'+insureFieldInfo.inputBoxId).val(fullname);
    			$('#'+insureFieldInfo.inputBoxId).removeClass("bmg_custom_placeholder");

    			$('#'+insureFieldInfo.inputBoxId).removeClass("invalid-field");
    			$('#'+insureFieldInfo.errMsgDOMId).html("");
    			$("#errtxtAdFullName1").html(""); // where? may check later
    		}
    	}

    	$("#"+dataSourceFieldInfo.errorId).html('');
    	$("#"+dataSourceFieldInfo.inputId).removeClass("invalid-field");
    };

	var _isValidMartialStatus = function(val){};
	var _isValidPromoCode = function(val){};




	/*
	 * ****************** Generic validation group ******************
	 */
	var _vadidation_generic = {
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
        'isEngSpace': _isEngSpace             // replaced allLetter() in fwd.js
		// , 'isChinese' : _isChinese
		// , 'isMatch' : _isMatch
		// , 'isValidLength' : _isValidLength
	};

	/*
	 * User account validation group
	 */
	var _vadidation_user = {
		// isValidUsername : _isValidUsername
		// , isValidEmail : _isValidEmail
		// , isValidPassword : _isValidPassword
		// , isValidConfirmPassword : _isValidConfirmPassword
	};

	/*
	 * Saive quotation validation group
	 */
	var _vadidation_savie_quote = {
		// isValidPromoCode : _isValidPromoCode
	};

	/*
	 * Personal info validation group
	 */
	var _vadidation_personal_info = {
		// isValidEmail : _isValidEmail
		// , isValidHkid : _isValidHkid
		// , isValidPassport : _isValidPassport
		// , isValidMobile : _isValidMobile
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
	var _vadidation_employment_info = {
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
	var _vadidation_beneficiary_info = {
		// isValidBeneLastName : _isValidBeneLastName
		// , isValidBeneGivenName : _isValidBeneGivenName
		// , isValidBeneChiName : _isValidBeneChiName
		// , isValidBeneHkid : _isValidBeneHkid            // replaced validateHkid() in fwd.js
		// , isValidBenePassport : _isValidBenePassport
		// , isValidBeneRelationship : _isValidBeneRelationship
		// , isValidBeneEntitlement : _isValidBeneEntitlement
        // ,
        isValidBeneFullName : _isValidBeneFullName    // replaced validateName() in fwd.js
        // , isValidBeneDob: _isValidBeneDob               // replaced validateDob() in fwd.js
	};

	/*
	 * Document upload validation group
	 */
	var _vadidation_document_upload = {};

	/*
	 * Address validation group
	 */
	var _vadidation_address = {
		// giAdd: ''
		// , lifeAdd: _isValidAddress
		// , isValidDistrict : _isValidDistrict
	};

	return {
		generic: _vadidation_generic
        // , user: _vadidation_user
        // , savieQuote: _vadidation_savie_quote
		// , personalInfo: _vadidation_personal_info
		// , employmentInfo: _vadidation_employment_info
		, beneficiaryInfo: _vadidation_beneficiary_info
		// , documentUpload: _vadidation_document_upload
	};

})(fwdConstant);
