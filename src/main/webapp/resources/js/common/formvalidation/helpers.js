'use strict';

// Global Private Function
var _bindingValFromA2B = function(insureBoolean, dataSourceFieldInfo, insureFieldInfo) {
    var conditionalId = 'applicantRelationship';        //  oversea-plan-details.jsp >>> $('#applicantRelationship')
    var fullname = $("#"+dataSourceFieldInfo.inputId).val();

    console.log( 'insureBoolean = ' + insureBoolean );
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
 * @param   {String}          dataSourceFieldId
 * @param   {Null or Object}  insureFieldInfo [ defaulted: Null ]
 * @return Nil
 */
var event_applicantName2InsuredPerson = function( insureBoolean, dataSourceFieldInfo, insureFieldInfo ) {
    // Defined what DOM will be binded to, i.e. Insured Person inputbox
    if ( insureFieldInfo == null ) {
        insureFieldInfo = { 'inputBoxId': 'txtInsuFullName1' , 'errMsgDOMId': 'errtxtPersonalFullName1' };
    }
    $( '#'+dataSourceFieldInfo.inputId).blur(function() {
        console.log(' $(#'+dataSourceFieldInfo.inputId+') - onBlur JS detected -');
        _bindingValFromA2B(insureBoolean, dataSourceFieldInfo, insureFieldInfo);
        $('#'+dataSourceFieldInfo.formId).formValidation( 'revalidateField', dataSourceFieldInfo.revalidateFieldName );
    });
};

/*
 * Binds "onBlur" JS behaviour to Applicant HKID inputBox
 *
 * @method  [Public] event_applicantHkid2InsuredPerson
 * @param   {Boolean} insureBoolean
 * @param   {String} dataSourceFieldId
 * @param   {Null or Object} insureFieldInfo [ defaulted: Null ]
 * @return Nil
 */
var event_applicantHkid2InsuredPerson = function( insureBoolean, dataSourceFieldInfo, insureFieldInfo ) {
    // Defined what DOM will be binded to, i.e. Insured Person inputbox
    if ( insureFieldInfo == null ) {
        insureFieldInfo = { 'inputBoxId': 'txtInsuHkid1' , 'errMsgDOMId': 'errtxtInsuHkid1' };
    }
    $( '#'+dataSourceFieldInfo.inputId).blur(function() {
        console.log(' $(#'+dataSourceFieldInfo.inputId+') - onBlur JS detected -');
        _bindingValFromA2B(insureBoolean, dataSourceFieldInfo, insureFieldInfo);
        $('#'+dataSourceFieldInfo.formId).formValidation( 'revalidateField', dataSourceFieldInfo.revalidateFieldName );
    });
};

/*
 * Binds "onBlur" JS behaviour to targeted DOM <input> inputBox and <span> errMsg field
 *
 * @method add_isValidBeneDob
 * @param   {Integer} index
 * @param   {Boolean} insureBoolean
 * @param   {String} dataSourceFieldId
 * @param   {Null or Object} insureFieldInfo [ defaulted: Null ]
 * @return Nil
 */
var event_isValidBeneDob = function(index, insureBoolean, dataSourceFieldId, insureFieldInfo) {

    // IF NULL, applied the defaulted value
    if ( insureFieldInfo === null ) {
        // Defined what DOM will be binded to, i.e. Insured Person inputbox
        insureFieldInfo = { 'inputBoxId': 'txtInsuFullName1', 'errMsgDOMId': 'errtxtPersonalFullName1' };
    }
    $( '#'+dataSourceFieldId+i).blur(function() {
        console.log(' $(#'+dataSourceFieldId+i+') - onBlur JS detected -');

    });
};

var event_returnEngSpaceOnly = function(o) {
    $( '#'+ o.inputId ).keypress(function(evt) {
        console.log(' $(#' + o.inputId + ') - keypress JS detected -');
        return fwdValidator.eventHandler.returnEngSpaceOnly(evt);
    });
};

var event_returnHkidLegalCharOnly = function(o) {
    $( '#'+ o.inputId ).keypress(function(evt) {
        console.log(' $(#' + o.inputId + ') - keypress JS detected -');
        return fwdValidator.eventHandler.returnHkidLegalCharOnly(evt);
    });
};

var event_returnValidUsernameChar = function(o) {
    $( '#'+ o.inputId ).keypress(function(evt) {
        console.log(' $(#' + o.inputId + ') - keypress JS detected -');
        return fwdValidator.eventHandler.returnValidUsernameChar(evt);
    });
};

var event_returnValidEmailChar = function(o) {
    $( '#'+ o.inputId ).keypress(function(evt) {
        console.log(' $(#' + o.inputId + ') - keypress JS detected -');
        return fwdValidator.eventHandler.returnValidEmailChar(evt);
    });
};

var event_hideMembershipError = function (o) {
    $( '#'+ o.inputId ).focus(function(evt) {
        console.log(' $(#' + o.inputId + ') - onfocus JS detected -');
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
 * Shorthand json object for xxx.config.js calling
 *
 * @method  [Public] cb_hkidUniqueValidation
 * @param   Nil
 * @return  {Object} 1D object with callback(), dedicated for FV library
 */
var cb_hkidUniqueValidation = function() {
    return {
        'callback': function(value, validator, $field) {
            var $elem               = $('.js__input_hkid');
            var obj                 = {};
            var notEmptyCount       = 0;
            var duplicateRemoved    = [];

            for (var i = 0; i < $elem.length; i++) {
                var v = $elem.eq(i).val();
                if (v !== '') {
                    obj[v] = 0;
                    notEmptyCount++;
                }
            }
            for (i in obj) {
                duplicateRemoved.push(obj[i]);
            }

            // Conditions
            if (duplicateRemoved.length === 0 || _.isEmpty(value) ) {
                return {
                    valid: false,
                    message: getBundle(getBundleLanguage, 'insured.hkId.notNull.message')
                };
            } else if ( !fwdValidator.personalInfo.isValidHkid(value) ) {
                return {
                    'valid': false,
                    'message': getBundle(getBundleLanguage, "applicant.hkId.notValid.message")
                }
            } else if ( duplicateRemoved.length !== notEmptyCount ) {
                return {
                    valid: false,
                    // message: getBundle(getBundleLanguage, 'insured.hkId.duplicate.message')
                    message: getBundle(getBundleLanguage, 'duplicate_hkid_no.message')
                };
            }

            // console.log($field);
            // console.log(validator.STATUS_VALID);
            validator.updateStatus('personalHKID', validator.STATUS_VALID, 'callback');
            return true;
        }
    };
}();

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

var event_onchange_changeDate_trigger_selectBoxValueChange = function(info) {
    // birthday datepicker, only 18-85 year-old users can buy the insurance
    $( '#' + info.inputId ).datepicker({
        startView: "decade",
        autoclose: true,
        format: "dd-mm-yyyy",
        // not UTC / GMT, should be "Wed Dec 02 1998 14:48:41 GMT+0800 (HKT)"
        startDate: fwdConstant.date.dob_start_date,
        endDate: fwdConstant.date.dob_end_date
        // /*language: getBundleLanguage*/
    }).on('changeDate', function (ev) {
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

/*
 * Export modules to "fvConfig" object
 */
var fvConfig = {};
fvConfig['helpers'] = {
    'generateConfig': {
        'flightCare':            gen_configFlightCare
    }
    , 'attr': {
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
            , 'changeDate_trigger_selectBoxValueChange':    event_onchange_changeDate_trigger_selectBoxValueChange
        }
        , 'onfocus': {
            'hideMembershipError':                         event_hideMembershipError         // replaced emptyMembershipError()
        }
        // , 'onsubmit':                       event_onsubmit
    }
    , 'ux': {}
    , 'fvCallback': {
        'hkidUniqueValidation':                             cb_hkidUniqueValidation
    }
};
