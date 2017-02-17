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
var _bindingValFromA2B = function(insureBoolean, formInfo, insureFieldInfo) {
    var conditionalId = 'applicantRelationship';        //  oversea-plan-details.jsp >>> $('#applicantRelationship')
    var fullname = $("#"+formInfo.inputId).val();

    if (insureBoolean) {
        if (document.getElementById(conditionalId) != null) {
            if (document.getElementById(conditionalId).value == 'SE') {
                $('#'+insureFieldInfo.inputBoxId).val(fullname);
            }
        } else {
            $('#'+insureFieldInfo.inputBoxId).val(fullname);
        }
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
  * Flight Care FormValidation Config Generation
  *
  * @method [Public]    gen_configFlightCare
  * @param  {Object}    obj
  * @return {Object}    buffer  [success]
  * @return {Boolean}   false   [failure]
  */
var gen_configFlightCare = function(obj) {

    try {
        if ( _.isEmpty(obj) ) throw new Error('1 param is required. Please check.');
    } catch(e) {
        console.error(e.name.toString() + ' >>> ' + e.message);
        return false;
    }
   //  finally { statements } // noted

   /*
    * Add the suffix string (i.e. index) on each keys
    *
    * @method   [Private]           _plugIdIntoKeyMap
    * @param    {Integer / String}  index
    * @param    {Object}            configs
    * @return   {Object}            temp
    */
   var _plugIdIntoKeyMap = function(index, configs) {
       var keys = _.keys(configs);
       var temp = {};

       for (var i = 0; i < keys.length; i++) {
           temp[keys[i]] = keys[i] + index;
       }
       return temp;
   };

   /*
    * Core progress about FV config generation
    *
    * @method   [Private]   _multiplyConfig
    * @param    {Integer}   iPersonTotal ( insurcedPersonTotal )
    * @param    {Object}    o
    * @param    {Object}    pct ( personConfigType )
    * @return   {Object}
    */
    var _multiplyConfig = function(iPersonTotal, o, pct) {

        var buffer = {};
        var newKeyMap = {};
        for (i = 1; i <= iPersonTotal; i++) {

            var keyMap = _plugIdIntoKeyMap(i, o[pct]);

            newKeyMap = {};
            _.each( o[pct], function(iPersonV, iPersonI) {
               var sub = {};
               var targetKey = 'container';

               sub[targetKey] = iPersonV[targetKey] + i;

               // - new testing code - start -
               // console.log(typeof iPersonV.validators.identical);
               if ( i == 1 && iPersonI=="personalName1" ) {
                   iPersonV.validators.identical.enabled = true;
               } else if ( i != 1 && typeof iPersonV.validators.identical!="undefined" ) {
                   iPersonV.validators.identical.enabled = false;
               }
               // - new testing code - end -

               _.each(iPersonV, function(iPersonV_V, iPersonV_I) {
                   if (iPersonV_I !== targetKey) { sub[iPersonV_I] = iPersonV[iPersonV_I]; }
               });
               newKeyMap[ keyMap[iPersonI] ] = _.merge({}, sub);
            });
            buffer = _.merge(buffer, newKeyMap);

        }
        return buffer;
    };

    // Core
    var buffer = {};
    if ( obj.flightJSPcbInfo.counter.personalPlan === 0 ) {
       // Family Plan
        var familyConfig = {};
        familyConfig['adult'] = _multiplyConfig(obj.flightJSPcbInfo.counter.familyPlan.adult, obj, 'insuredAdult');
        familyConfig['child'] = _multiplyConfig(obj.flightJSPcbInfo.counter.familyPlan.child, obj, 'insuredChild');
        familyConfig['other'] = _multiplyConfig(obj.flightJSPcbInfo.counter.familyPlan.other, obj, 'insuredOther');
        _.each(familyConfig, function(fcVal, fcInd) {
           buffer = $.extend(buffer, fcVal);
        });
    } else {
        // Personal Plan
        buffer = _multiplyConfig(obj.flightJSPcbInfo.counter.personalPlan, obj, 'insuredPerson');
    }
    return buffer;

};

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

var initDatePicker_changeDate_trigger_selectBoxValueChange = function(info, datepickerConfig) {
    // birthday datepicker, only 18-85 year-old users can buy the insurance
    $( '#' + info.inputId )
        .datepicker(datepickerConfig)
        .on('changeDate', function (ev) {
            $('#'+info.formId).val( $('#'+info.inputId).datepicker('getFormattedDate') );
            $('#'+info.formId).formValidation( 'revalidateField', info.revalidateFieldName );
            var selected = 2;
            if (ev.date != undefined) {
                if ( ev.date.valueOf() < fwdConstant.date.dob_end_date.valueOf()
                    && ev.date.valueOf() > fwdConstant.date.dob_70_date.valueOf() ) {
                    selected = 2;
                } else {
                    selected = 3;
                }
                // Check DOM item existences
                if ($("#selectAgeRange1").length > 0) {
                    $("#selectAgeRange1").val(selected);
                } else if ($("#insureDob1").length > 0) {
                    $("#insureDob1").val( $("#applicantDob").val() );
                }
            }
        });
        //$('#input_dob').datepicker('setDate', dob_end_date);
};

var other_rmIndexNum_onSerializedString = function(cfg, serializedString, fieldnameToRemoveIndex) {

    var _removeIndex = function( stringInput, travellerCounter, fieldnameToRemoveIndex ) {
        var temp = stringInput;
        for (var i = 0; i < fieldnameToRemoveIndex.length; i++) {
        	if (typeof travellerCounter==="object") {
        		$.each( travellerCounter, function( key, value ) {
                    for (var w = 1; w < value+1; w++) {
                        temp = temp.replace(fieldnameToRemoveIndex[i]+w, fieldnameToRemoveIndex[i]);
                    }
        		});
            } else {
	            for (var w = 1; w < travellerCounter+1; w++) {
	                temp = temp.replace(fieldnameToRemoveIndex[i]+w, fieldnameToRemoveIndex[i]);
	            }
            }
        }
        return temp;
    };

    // Core
    var stringBuffer = serializedString;
    if ( cfg.counter.personalPlan === 0 ) {
    	stringBuffer = _removeIndex( stringBuffer, cfg.counter.familyPlan, fieldnameToRemoveIndex );
        console.log('Family Plan');
        // ... have to develop it later

    } else {
        stringBuffer = _removeIndex( stringBuffer, cfg.counter.personalPlan, fieldnameToRemoveIndex );
    }
    return stringBuffer;
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

var fv_successForm_flightCare = function( argObj ) {

    var e           = argObj.e;
    var data        = argObj.data;
    var fvConfig    = argObj.fvConfig;
    var fvCfgs      = argObj.fvCfgs;
    var formId      = fvArgs.pageAutoConfig.form[0].id;

    var $form = $(e.target);
    var fv    = $form.data('formValidation');

    // Prevent form submission
    e.preventDefault();

    // Some instances you can use
    var $form	                   = $(e.target);
    var fv  	                   = $form.data('formValidation');
    var flagForAccCreated          = ( $.trim( $("#Username").val())!="" && $.trim( $("#Password").val())!="" && $.trim( $("#Confirm-Password").val())!="" ) ? true : false;
    var serializedString_withIndex = $('#'+ formId).serialize();

    // Washing ${inx} out from VAR serializedString_withIndex
    var fieldnameToRemoveIndex = [];
    if ( fvConfig.flightJSPcbInfo.counter.personalPlan === 0 ) {        // Do Family-plan below, IF fvConfig.flightJSPcbInfo.counter.personalPlan === 0
        fieldnameToRemoveIndex = [
            'adultName', 'adultHKID', 'adultAgeRange', 'adultBeneficiary'
            , 'childName', 'childHKID', 'childAgeRange', 'childBeneficiary'
            , 'otherName', 'otherHKID', 'otherAgeRange', 'otherBeneficiary'
        ];
    } else {                                                            // Do Personal-plan below
        fieldnameToRemoveIndex = [ 'personalName', 'personalHKID', 'personalAgeRange', 'personalBeneficiary' ];
    }
    var serializedString_withoutIndex = fvConfig.helpers.other.removeIndexNum_onSerializedString(
        fvConfig.flightJSPcbInfo
        , serializedString_withIndex
        , fieldnameToRemoveIndex
    );

    var pagesAJAX = {
        'joinus': function() {
            $.ajax({
                'type': "POST",
                'url': pagesURL.conformPolicy,
                'data': serializedString_withoutIndex,
                'async': false,
                'success': function(data) {
                    if (data.result == 'success') {

                        $('#loading-overlay').modal({ backdrop: 'static', keyboard: false });
                        $('#errorMessages').hide();

                        $('#' + formId).attr("action", pagesURL.confirmation);
                        // Only fv.defaultSubmit is allowed here. Under "e.preventDefault();"
                        fv.defaultSubmit(function(e) {      // Don't use general form.submit(function(e) {...}); etc...
                            return true;
                        });

                    } else {
                        // Exception, mostly not related
                        $('#loading-overlay').modal('hide');
                        $('#errorMessages').removeClass('hide');
                        $('#errorMessages').html(data.errMsgs);

                        console.log(data);
                        fv.defaultSubmit(function(e) {
                            return false;
                        });
                    }
                }
            });
        }
        , 'confirmation': function() {
            $.ajax({
                'type': "POST",
                'url': pagesURL.conformPolicy,
                'data': serializedString_withoutIndex,
                'async': false,
                'success': function(data) {
                    if (data.result == 'success') {

                        $('#loading-overlay').modal({ backdrop: 'static', keyboard: false });
                        $('#errorMessages').hide();

                        $('#' + formId).attr("action", pagesURL.confirmation);
                        // Only fv.defaultSubmit is allowed here. Under "e.preventDefault();"
                        fv.defaultSubmit(function(e) {      // Don't use general form.submit(function(e) {...}); etc...
                            return true;
                        });

                    } else {
                        // Exception, mostly not related
                        $('#loading-overlay').modal('hide');
                        $('#errorMessages').removeClass('hide');
                        $('#errorMessages').html(data.errMsgs);

                        console.log(data);
                        fv.defaultSubmit(function(e) {
                            return false;
                        });
                    }
                }
            });
        }
    };

    var exportAJAXdata = {
        'optIn1': ( $('#checkbox4').is(':checked') ? true : false )
        , 'optIn2': ( $('#checkbox3').is(':checked') ? true : false )
        , 'password': $('#Password').val()
        , 'mobile': $('#inputMobileNo').val()
        , 'name': $('#inputMobileNo').val()
        , 'userName': $('#Username').val()
        , 'email': $('#inputEmailId').val()
        , 'ajax': "true"
    };

    // Defines the URL for below.
    var pagesURL = {
        'joinus': fvCfgs.flightJSPcbInfo.currentPage.contextPath + "/" + fvCfgs.flightJSPcbInfo.currentPage.lang + "/joinus"
        , 'conformPolicy': fvCfgs.flightJSPcbInfo.currentPage.contextPath + "/" + fvCfgs.flightJSPcbInfo.currentPage.lang + "/flight-insurance/confirm-policy"
        , 'confirmation': fvCfgs.flightJSPcbInfo.currentPage.contextPath + "/" + fvCfgs.flightJSPcbInfo.currentPage.lang + "/flight-insurance/confirmation"
    };

    // IF member account is going to be created ...
    if ( flagForAccCreated ) {

        // Core
        $.ajax({
            'type': 'POST',
            'url': pagesURL.joinus,
            'data': exportAJAXdata,
            'async': false,
            'success': function(res) {

                $('#loading-overlay').modal({ backdrop: 'static', keyboard: false });
                $('#errorMessages').hide();

                var expectedServerRes = {
                    'success': 			'success'
                    , 'dupUsername': 	'This username already in use, please try again'
                    , 'dupEmailMob': 	'email address and mobile no. already registered'
                };
                switch (res) {
                    case expectedServerRes.success:
                        pagesAJAX.joinus();
                        break;
                    case expectedServerRes.dupUsername:
                        fv
                            .updateMessage('userName', 'alreadyRegistered', getBundle(getBundleLanguage, 'member.registration.fail.username.registered'))
                            .updateStatus('userName', 'INVALID', 'alreadyRegistered');
                        $('#loading-overlay').modal('hide');
                        break;
                    case expectedServerRes.dupEmailMob:
                        fv
                            .updateMessage('emailAddress', 'alreadyRegistered', getBundle(getBundleLanguage, 'member.registration.fail.emailMobile.registered'))
                            .updateStatus('emailAddress', 'INVALID', 'alreadyRegistered');
                        fv
                            .updateMessage('mobileNo', 'alreadyRegistered', getBundle(getBundleLanguage, 'member.registration.fail.emailMobile.registered'))
                            .updateStatus('mobileNo', 'INVALID', 'alreadyRegistered');
                        $('#loading-overlay').modal('hide');
                        break;
                    default:
                        $('#loading-overlay').modal('hide');
                        $(".error-hide").css("display", "block");
                        $('.error-hide').html(res);
                }
            },
            'error': function(xhr, status, error) {
                $('#loading-overlay').modal('hide');
            }
        });

    } else {
        pagesAJAX.confirmation();
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
        'successForm': {
            'flightCare':                       fv_successForm_flightCare
        }
        , 'errValidator':                       {}
        , 'errField':                           {}
    }
    , 'fvCallback': {
        'hkidUniqueValidation':                 cb_hkidUniqueValidation
    }
    , 'generateConfig': {
        'flightCare':                           gen_configFlightCare
    }
    , 'initDatePicker': {
        'changeDate_trigger_selectBoxValueChange':    initDatePicker_changeDate_trigger_selectBoxValueChange
    }
    , 'listener': {
        'isFieldsEmptied':                      listener_isFieldsEmptied
    }
    , 'other': {
        'removeIndexNum_onSerializedString':    other_rmIndexNum_onSerializedString
    }
    , 'ux': {}
};
