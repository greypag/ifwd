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
    * @method   [Private]   _dataMassage
    * @param    {Integer}   insurcedPersonTotal
    * @param    {Object}    o
    * @return   {Object}
    */
   var _dataMassage = function(insurcedPersonTotal, o) {
       var buffer = {};
       var newKeyMap = {};
       for (i = 1; i <= insurcedPersonTotal; i++) {
           var keyMap = _plugIdIntoKeyMap(i, o.insuredPerson);
           newKeyMap = {};
           _.each( o.insuredPerson, function(iPersonV, iPersonI) {
               var sub = {};
               var targetKey = 'container';

               sub[targetKey] = iPersonV[targetKey] + i;
               // - new testing code - start -
               // console.log(typeof iPersonV.validators.identical);
               if ( i == 1 && iPersonI=="personalName1" ) {
                   iPersonV.validators.identical.enabled = true;
               } else if( i != 1 && typeof iPersonV.validators.identical!="undefined" ) {
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

   if ( obj.travellerCounter.personalPlan === 0 ) {

       // Family Plan
        var familyConfig = {};
        familyConfig['adult'] = _dataMassage(obj.travellerCounter.familyPlan.adult, obj);
        familyConfig['child'] = _dataMassage(obj.travellerCounter.familyPlan.child, obj);
        familyConfig['other'] = _dataMassage(obj.travellerCounter.familyPlan.other, obj);

        //    -- underdeveloping --
        console.log(familyConfig);
        _.each(familyConfig, function(fcVal, fcInd) {
           console.log(fcInd);
           console.log(fcVal);
           buffer = $.extend(buffer, fcVal);
        });
        console.log(buffer);
        //    -- underdeveloping --

    } else {

        // Personal Plan
        buffer = _dataMassage(obj.travellerCounter.personalPlan, obj);
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

var event_returnEngSpaceOnly = function(fieldId) {
    $( '#'+fieldId ).keypress(function(evt) {
        console.log(' $(#' + fieldId + ') - keypress JS detected -');
        return fwdValidator.eventHandler.returnEngSpaceOnly(evt);
    });
};

var event_returnHkidLegalCharOnly = function(fieldId) {
    $( '#'+fieldId ).keypress(function(evt) {
        console.log(' $(#' + fieldId + ') - keypress JS detected -');
        return fwdValidator.eventHandler.returnHkidLegalCharOnly(evt);
    });
};

/*
 * Export modules to "fvConfig" object
 */
var fvConfig = {};
fvConfig['helpers'] = {
    'generateData': {
        'cfgFlightCare':            gen_configFlightCare
    },
    'event': {
        'onblur': {
            'binding': {
                'applicantName2InsuredPerson':      event_applicantName2InsuredPerson
                , 'applicantHkid2InsuredPerson':    event_applicantHkid2InsuredPerson
            }
        }
        , 'onkeypress': {
            'returnEngSpaceOnly':           event_returnEngSpaceOnly
            , 'returnHkidLegalCharOnly':    event_returnHkidLegalCharOnly
        }
        // , 'isValidBeneHkid'     : event_isValidBeneHkid       // In-progress, not tested yet
        // , 'isValidBeneDob'      : event_isValidBeneDob     // Pending
    }
    , 'ux': {}
};




// var declarationCfg  = {
// 		"checkbox1": {
//         "container": "#chk1",
//         "validators": {
//             "notEmpty": {
//                 "message": getBundle(getBundleLanguage, "insured.name.notNull.message")
//             },
//             "onSucces": function(e, data) {
//                 if (!data.fv.isValidField("fullName")) {
//                     // Revalidate it
//                     data.fv.revalidateField("fullName");
//                 }
//             }
//         }
//     }
// };


// Build skelton schema (add optional validators) for object "Vr"
// var skeltonVr = function (optionalVr) {
//     var baseVrList_SetNull = [ 'notEmpty', 'regexp', 'onSuccess' ];
//     for (var i = 0; i < baseVrList_SetNull.length; i++) {
//         this[ baseVrList_SetNull[i] ] = null;
//     }
//     // add optional Vr
//     if ( typeof optionalVr !== "undefined" || optionalVr !== null ) {
//         for (k in optionalVr) {
//             if (optionalVr.hasOwnProperty(k)) {
//                 this[k] = optionalVr[k];
//             }
//         }
//     }
//     this._isLastLvl = true;
// };

// Gary: may not available in 'use strict', have to try
// var getCurrentFunctName = function ( argumentsCalleeInfo ) {
//     // Normally the argumentsCalleeInfo should be called from other function with the "arguments.callee" as the arguments / parameters to this function.
//     var fullScript = argumentsCalleeInfo.toString();
//     var ownName = fullScript.substr('function '.length);        // trim off text "function"
//     ownName = ownName.substr(0, ownName.indexOf('('));          // trim off everything after the function name
// 	return ownName;
// }

// /*
//  * Generate an ordered & structured object by catering dynamic-key
//  * - Mostly used in "validators.config.js"
//  *
//  * @method phase_OneDynamicKeyToOneObj
//  * @param {Object} object with dynamicKey  e.g. >> { "tel.mob": { 'msg': 'abcd' } }
//  * @return {Object} structured object      e.g. >> { 'tel': { 'mob': { 'msg': 'abcd' } } }
//  */
// var phase_dynamicKeyToObj = function (obj, dynamicKeyPath, value) {
//     var arrKeys = dynamicKeyPath.split('.');
//     var lastKeyIndex = arrKeys.length - 1;
//     for (var i = 0; i < lastKeyIndex; ++i) {
//         var key = arrKeys[i];
//         if (!(key in obj)) { obj[key] = {}; }
//         obj = obj[key];
//     }
//     obj[arrKeys[lastKeyIndex]] = value;
// };
//
// /*
//  * ( *** Developing & Testing *** )
//  * - Mostly used in "validators.config.js"
//  *
//  * @method phase_toVrProperties
//  * @param {String} ID or class
//  * @return {Boolean} Returns true or false for the checking
//  */
// var phase_toVrProperties = function (obj) {
//     try {
//         if ( _.isEmpty(obj) ) throw new Error('1 param is required. Please check.');
//     } catch(e) {
//         console.error(e.name.toString() + ' >>> ' + e.message);
//         return false;
//     }
//     var result = {};
//     _.each(obj, function(v, i) {
//         result[i] = {};
//         _.each(v, function(iPersonV, iPersonI) {
//             phase_dynamicKeyToObj(result[i], iPersonI, iPersonV);
//         });
//     });
//     return result;
// };
