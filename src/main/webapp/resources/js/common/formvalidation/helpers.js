'use strict';

// Global Private Function

/*
 * Binding value from "input field A" to "input field B"
 *
 * @method [Private]    _bindingValFromA2B
 * @param  {Boolean}    insureBoolean
 * @param  {Object}     formInfo
 * @param  {Object}     insureFieldInfo
 * @return {Array}      Pattern >>> [{ 'id': 'xxx' }, ...]  [success]
 * @return {Boolean}    false   [failure]
 */
var event_bindingValFromA2B = function(aField, bField) {
    var firstField = $(aField);
    var secField = $(bField);
    if(firstField.val()!=""){
    	secField.val(firstField.val());
    }
};
/*
 * Auto grapping the <form class="js__fv"> element
 *
 * @method [Private]    _grap_formIdArray
 * @param  nil
 * @return {Array}      Pattern >>> [{ 'id': 'xxx' }, ...]  [success]
 * @return {Boolean}    false   [failure]
 */
var _grap_formIdArray = function() {
    var relatedFormElem = $(document).find('form.js__fv');
    var result = [];
    if ( relatedFormElem.length === 0 ) {
        console.error('Please apply the class ".js__fv" within <form> element');
        return false;
    } else {
        for (var i = 0; i < relatedFormElem.length; i++) {
            result.push( {
                'body': relatedFormElem[i]
                , 'id': relatedFormElem[i].id
                , 'name': relatedFormElem[i].name
            } );
        }
        console.log(result);
        // result = _.uniqBy();
    }
    return result;
}();

// ------------------------------------------------------------------------------

/*
 * Binds "onBlur" JS behaviour to Applicant Full Name inputbox
 *
 * @method  [Public] event_applicantName2InsuredPerson
 * @param   {Boolean}           insureBoolean
 * @param   {String}          formInfo
 * @param   {Null or Object}  insureFieldInfo [ defaulted: Null ]
 * @return Nil
 */
var event_applicantName2InsuredPerson = function( insureBoolean, formInfo, insureFieldInfo ) {
    // Defined what DOM will be binded to, i.e. Insured Person inputbox
    if ( insureFieldInfo == null ) {
        insureFieldInfo = { 'inputBoxId': 'txtInsuFullName1' , 'errMsgDOMId': 'errtxtPersonalFullName1' };
    }
    $( '#'+formInfo.inputId).blur(function() {
        _bindingValFromA2B(insureBoolean, formInfo, insureFieldInfo);
        $('#'+formInfo.formId).formValidation( 'revalidateField', formInfo.revalidateFieldName );
    });
};

/*
 * Binds "onBlur" JS behaviour to Applicant HKID inputBox
 *
 * @method  [Public] event_applicantHkid2InsuredPerson
 * @param   {Boolean} insureBoolean
 * @param   {String} formInfo
 * @param   {Null or Object} insureFieldInfo [ defaulted: Null ]
 * @return Nil
 */
var event_applicantHkid2InsuredPerson = function( insureBoolean, formInfo, insureFieldInfo ) {
    // Defined what DOM will be binded to, i.e. Insured Person inputbox
    if ( insureFieldInfo == null ) {
        insureFieldInfo = { 'inputBoxId': 'txtInsuHkid1' , 'errMsgDOMId': 'errtxtInsuHkid1' };
    }
    $( '#'+formInfo.inputId).blur(function() {
        _bindingValFromA2B(insureBoolean, formInfo, insureFieldInfo);
        $('#'+formInfo.formId)
            .formValidation( 'revalidateField', formInfo.revalidateFieldName );
    });
};

var event_returnEngSpaceOnly = function(o) {
    $( '#'+ o.inputId ).keypress(function(evt) {
        return fwdValidator.eventHandler.returnEngSpaceOnly(evt);
    });
};

var event_returnHkidLegalCharOnly = function(o) {
    $( '#'+ o.inputId ).keypress(function(evt) {
        return fwdValidator.eventHandler.returnHkidLegalCharOnly(evt);
    });
};

var event_returnValidUsernameChar = function(o) {
    $( '#'+ o.inputId ).keypress(function(evt) {
        return fwdValidator.eventHandler.returnValidUsernameChar(evt);
    });
};

var event_returnValidEmailChar = function(o) {
    $( '#'+ o.inputId ).keypress(function(evt) {
        return fwdValidator.eventHandler.returnValidEmailChar(evt);
    });
};

var event_hideMembershipError = function (o) {
    $( '#'+ o.inputId ).focus(function(evt) {
    	$(".error-hide").hide();
    });
};

/*
 * DOM attr readonly, replacing JSP code, acted by JS
 *
 * @method event_modifiedDOM
 * @param   {Boolean} switchOption
 * @param   {String or Array string} fieldIdInfo
 * @return Nil
 */
var event_modifiedDOM = function(switchOption, action, fieldIdInfo) {
    if ( Object.prototype.toString.call(fieldIdInfo) === '[object String]' ) {
        if ( switchOption === 'true' || switchOption === true ) {
            $( '#'+fieldIdInfo ).prop(action, true); // jQuery <=1.9
            $( '#'+fieldIdInfo ).attr(action, true); // jQuery 1.9+
        } else if ( switchOption === 'false' || switchOption === false ) {
            $( '#'+fieldIdInfo ).prop(action, false); // jQuery <=1.9
            $( '#'+fieldIdInfo ).attr(action, false); // jQuery 1.9+
        } else if ( switchOption === 'on' ) {
            $( '#'+fieldIdInfo ).attr(action, 'on'); // jQuery 1.9+
        } else if ( switchOption === 'off' ) {
            $( '#'+fieldIdInfo ).attr(action, 'off'); // jQuery 1.9+
        } else {
            console.error('Fucnt event_readonly() >> params "switchOption" should be "true" / "false" / "on" / "off"');
        }
    } else if ( Object.prototype.toString.call(fieldIdInfo) === '[object Array]' ) {
        for (var i = 0; i < fieldIdInfo.length; i++) {
            if ( switchOption === 'true' || switchOption === true ) {
                $( '#'+fieldIdInfo[i] ).prop(action, true); // jQuery <=1.9
                $( '#'+fieldIdInfo[i] ).attr(action, true); // jQuery 1.9+
            } else if ( switchOption === 'false' || switchOption === false ) {
                $( '#'+fieldIdInfo[i] ).prop(action, false); // jQuery <=1.9
                $( '#'+fieldIdInfo[i] ).attr(action, false); // jQuery 1.9+
            } else if ( switchOption === 'on' ) {
                $( '#'+fieldIdInfo[i] ).attr(action, 'on'); // jQuery 1.9+
            } else if ( switchOption === 'off' ) {
                $( '#'+fieldIdInfo[i] ).attr(action, 'off'); // jQuery 1.9+
            } else {
                console.error('Fucnt event_readonly() >> params "switchOption" should be "true" / "false" / "on" / "off"');
            }
        }
    } else {
        console.error('Fucnt event_readonly() >> params "fieldIdInfo" should be [object String] / [object Array]');
    }
};

/*
 * Generate the json callback() function for validation calling in "xxx.config.js"
 *
 * @method  [Public] cb_hkidUniqueValidation
 * @param   Nil
 * @return  {Object} 1D object with callback(), dedicated for FV library
 */
var cb_hkidUniqueValidation = function(pageConfigInfo) {
    var formId          = pageConfigInfo.form[0].id;
    return {
        'message': 'lkjfaklsdjfla'
        , 'callback': function(value, validator, $field) {
            // Private function declars
            var _frequencyAnalysing = function(arrayElem, propInObj) {
                var current         = null;
                var buffCount       = 0;
                var buffElem        = [];
                var templateItem    = { 'value': null , '$elem': [] }; // 'time': 0,
                var results         = [];

                // Sorting the Object by particular property
                var sortedArrayElem = fwdUtility.sort.arrObj.byProperty(arrayElem, propInObj);
                // Analysing the Frequency
                for (var i = 0; i < sortedArrayElem.length; i++) {
                    if (sortedArrayElem[i][propInObj] != ( _.has(current, propInObj) ? current[propInObj] : null ) ) {
                        if (buffCount > 0) {
                            templateItem = {
                                'value': ( _.has(current, propInObj) ? current[propInObj] : null ) // , 'time': buffCount
                                , '$elem': buffElem
                            };
                            results.push(templateItem);
                        }
                        current = sortedArrayElem[i];
                        buffCount = 1;
                        buffElem = sortedArrayElem[i]['$elem'];
                    } else {
                        buffCount++;
                        buffElem.push( sortedArrayElem[i]['$elem'][0] );
                    }
                }
                if (buffCount > 0) {
                    templateItem = {
                        'value': ( _.has(current, propInObj) ? current[propInObj] : null ) // , 'time': buffCount
                        , '$elem': current['$elem']
                    };
                    results.push(templateItem);
                }
                return results;
            }; // End Private Function >>> _frequencyAnalysing()

            // Variables declars
            var resultConfig = {
                'empty': {
                    'valid': false,
                    'message': getBundle(getBundleLanguage, 'insured.hkId.notNull.message')
                }
                , 'invalid': {
                    'valid': false,
                    'message': getBundle(getBundleLanguage, "applicant.hkId.notValid.message")
                }
                , 'duplicated': {
                    'valid': false,
                    'message': getBundle(getBundleLanguage, 'duplicate_hkid_no.message') + ' [' + value.toUpperCase() + ']'
                    // OR getBundle(getBundleLanguage, 'insured.hkId.duplicate.message')
                }
                , 'validCurrentField_and_allFields_matched_numberOf_duplicatorTorlerance': true
                , 'validCurrentField_but_allFields_notMatched_numberOf_duplicatorTorlerance': true
            };
            var $elem                   = $('.js__fv__input_hkid');
            var composedElem            = [];
            var duplicatorTorlerance    = 1; // Defaulted 1, only unique value is allowed
            var indicator               = null;

            // Core Codes
            for (var i = 0; i < $elem.length; i++) {
                var v = $elem.eq(i).val().toUpperCase();
                composedElem.push({
                    'value': v
                    , '$elem': $elem.eq(i)
                    , '$allElem': $elem
                });
            }
            var analysedElemGrp = _frequencyAnalysing(composedElem, 'value');
            if ( analysedElemGrp.length === composedElem.length ) {
                // Gary: Still have space to fine-tune here, hardcode
                if ( fvConfig.flightJSPcbInfo.counter.personalPlan === 0 ) {        // Do Family-plan below, IF fvConfig.flightJSPcbInfo.counter.personalPlan === 0
                    var formInfo_hkid = { 'formId': formId, 'inputId': 'inputTxtAppHkid', 'errorId': 'errAppHkid', 'revalidateFieldName': 'adultHKID1' };
                } else {
                    var formInfo_hkid = { 'formId': formId, 'inputId': 'inputTxtAppHkid', 'errorId': 'errAppHkid', 'revalidateFieldName': 'personalHKID1' };
                }
                validator.updateStatus(formInfo_hkid.revalidateFieldName, validator.STATUS_VALID, 'callback');
                indicator = 'validCurrentField_and_allFields_matched_numberOf_duplicatorTorlerance';
            } else {
                var isFieldValueDuplicatedFound = false;
                for (var i = 0; i < analysedElemGrp.length; i++) {
                    if ( isFieldValueDuplicatedFound === false ) {
                        isFieldValueDuplicatedFound = ( analysedElemGrp[i].value === value.toUpperCase() && analysedElemGrp[i]['$elem'].length > duplicatorTorlerance ) ? true : false;
                    }
                }
                if ( _.isEmpty(value) ) {
                    indicator = 'empty';
                } else if ( !fwdValidator.personalInfo.isValidHkid(value) ) {
                    indicator = 'invalid';
                } else if ( isFieldValueDuplicatedFound ) {
                    indicator = 'duplicated';
                } else {
                    indicator = 'validCurrentField_but_allFields_notMatched_numberOf_duplicatorTorlerance';
                }
            }
            return resultConfig[indicator];

        } // End of Function >>> callback(value, validator, $field)
    };
};

var event_checkBox_tooltipFadeInOut = function(opt1, opt2) {
	var _showBubbleTooltip = function () {
		if($("#"+opt1).prop('checked') || $("#"+opt2).prop("checked")) {
			$(".flightCheckboxBubble").fadeIn();
		}else{
			$(".flightCheckboxBubble").fadeOut();
		}
	};
	$("#"+opt1).change(function() {
		_showBubbleTooltip();
	});
	$("#"+opt2).change(function() {
		_showBubbleTooltip();
	});
};

// Check fields is all-emptied or not, returns TRUE / FALSE
var listener_isFieldsEmptied= function( dInfo ) {
    var arrFields   = dInfo.fieldsForValidation;
    var isNotEmpty = false;
    for (var i = 0; i < arrFields.length; i++) {
        if ( $.trim( $(arrFields[i]).val() ) !== '' ) {
            isNotEmpty = true;
        } else {
        	if (i > 0 && isNotEmpty==true) {
        		isNotEmpty == true;
        	} else {
        		isNotEmpty = false;
        	}
        }
        /*
        (function( w ) {
            $(document).on('change', arrFields[w], function() {
                if ( $.trim( $(arrFields[w]).val() ) !== '' ) {
                    isNotEmptyCounter = isNotEmptyCounter + 1;
                }
                if ( isNotEmptyCounter >= dInfo.fieldsLimitedTo ) {
                    return true;
                } else {
                    return false;
                }
            });
        })(i);
        */
    }
    return isNotEmpty;
};

var fv_enablingValidators = function(isEnabledBoolean, fieldArray) {
	console.log('_enablingValidators() is run. isEnabledBoolean = [ '+isEnabledBoolean+' ]');
	var arrFieldnames = fieldArray.fieldnamesForValidation;
	for (var h = 0; h < arrFieldnames.length; h++) {
		(function( k ) {
			$("#"+fieldArray.formId).formValidation('enableFieldValidators', arrFieldnames[k], isEnabledBoolean);
		})(h);
	}
};

/*
 * Export modules to "fvConfig" object
 */
var fvConfig = {};
// private function _grap_formIdArray(), grapping the <form class="js__fv"> element
fvConfig['pageAutoConfig'] = {
    'form': _grap_formIdArray
};

fvConfig['helpers'] = {
    'attr': {
        'onblur': {
            'binding': {
                'applicantName2InsuredPerson':      event_applicantName2InsuredPerson
                , 'applicantHkid2InsuredPerson':    event_applicantHkid2InsuredPerson
                , 'bindingValFromA2B':				event_bindingValFromA2B
            }
        }
        , 'onkeypress': {
            'returnEngSpaceOnly':                           event_returnEngSpaceOnly
            , 'returnHkidLegalCharOnly':                    event_returnHkidLegalCharOnly
            , 'returnValidUsernameChar':                    event_returnValidUsernameChar    // replaced validationUsername() validationEmail()
            , 'returnValidEmailChar':                       event_returnValidEmailChar       // replaced validationUsername() validationEmail()
        }
        , 'modifiedDOM':                                    event_modifiedDOM
        , 'onchange': {
            'checkBox_tooltipFadeInOut':                    event_checkBox_tooltipFadeInOut
        }
        , 'onfocus': {
            'hideMembershipError':                          event_hideMembershipError         // replaced emptyMembershipError()
        }
        // , 'onsubmit':                       event_onsubmit
    }
    , 'fv': {
        /*'successForm': {
            'flightCare':                       fv_successForm_flightCare
        },*/
    	'enable_validate_grp':					fv_enablingValidators
        , 'errValidator':                       {}
        , 'errField':                           {}
    }
    , 'fvCallback': {
        'hkidUniqueValidation':                 cb_hkidUniqueValidation
    }
    /*, 'generateConfig': {
        'flightCare':                           gen_configFlightCare
    }
    , 'initDatePicker': {
        'changeDate_trigger_selectBoxValueChange':    initDatePicker_changeDate_trigger_selectBoxValueChange
    }*/
    , 'listener': {
        'isFieldsEmptied':                      listener_isFieldsEmptied
    }
    /*, 'other': {
        'removeIndexNum_onSerializedString':    other_rmIndexNum_onSerializedString
    }*/
    , 'ux': {}
};
