'use strict';

/*
 * - purposes in-drafting -
 *
 * @method gen_configFlightCare
 * @param {Object} obj
 * @return {Object} obj
 */
var gen_configFlightCare = function(obj) {
    try {
        if ( _.isEmpty(obj) ) throw new Error('1 param is required. Please check.');
    } catch(e) {
        console.error(e.name.toString() + ' >>> ' + e.message);
        return false;
    }
   //  finally { statements } // noted

   var buffer = {};
   var newKeyMap = {};

   // Private function
   var plugIdIntoKeyMap = function(index, configs) {
       var keys = _.keys(configs);
       var temp = {};

       for (var i = 0; i < keys.length; i++) {
           temp[keys[i]] = keys[i] + index;
       }
       return temp;
   };

   // Core
   var counter = obj.travellerCounter.personalPlan;
   for (i = 1; i <= counter; i++) {
       var keyMap = plugIdIntoKeyMap(i, obj.insuredPerson);
       newKeyMap = {};
       _.each( obj.insuredPerson, function(vv, ii) {
           var sub = {};
           var targetKey = 'container';

           sub[targetKey] = vv[targetKey] + i;
           // - new testing code - start -
        //    console.log(typeof vv.validators.identical);
           if (i == 1 && ii=="personalName1"){
               vv.validators.identical.enabled = true;
           }else if(i != 1 && typeof vv.validators.identical!="undefined"){
               vv.validators.identical.enabled = false;
           }
           // - new testing code - end -
           _.each(vv, function(vvv, iii) {
               if (iii !== targetKey) { sub[iii] = vv[iii]; }
           });
           newKeyMap[ keyMap[ii] ] = _.merge({}, sub);
       });
       buffer = _.merge(buffer, newKeyMap);
   }

   return buffer;
};

/*
 * Binds "onBlur" JS behaviour to targeted DOM <input> inputBox and <span> errMsg field
 *
 * @method add_isValidBeneFullName
 * @param   {Integer} index
 *          , {Boolean} insureBoolean
 *          , {String} dataSourceFieldId
 *          , {Null or Object} insureElem [Defaulted as Null]
 * @return Nil
 */
var add_isValidBeneFullName = function(index, insureBoolean, dataSourceFieldId, insureElem) {

    if ( insureElem == null ) {
        // Defined what DOM will be binded to, i.e. Insured Person inputbox
        insureElem = {   // defaulted value
            'inputBoxId': 'txtInsuFullName1'
            , 'errMsgDOMId': 'errtxtPersonalFullName1'
        };
    }
    $( '#'+dataSourceFieldId+i).blur(function() {
        console.log(' $(#'+dataSourceFieldId+i+') - onBlur JS detected -');
        fwdValidator.beneficiaryInfo.isValidBeneFullName( dataSourceFieldId+i, 'err'+dataSourceFieldId+i, insureBoolean, 'beneficiary', argCfg.placeholder, insureElem );
    });
};

/*
 * Binds "onBlur" JS behaviour to targeted DOM <input> inputBox and <span> errMsg field
 *
 * @method add_isValidBeneHkid
 * @param   {Integer} index
 *          , {Boolean} insureBoolean
 *          , {String} dataSourceFieldId
 *          , {Null or Object} insureElem [Defaulted as Null]
 * @return Nil
 */
var add_isValidBeneHkid = function(index, insureBoolean, dataSourceFieldId, insureElem) {

    if ( insureElem == null ) {
        // Defined what DOM will be binded to, i.e. Insured Person inputbox
        insureElem = {   // defaulted value
            'inputBoxId': 'txtInsuFullName1'
            , 'errMsgDOMId': 'errtxtPersonalFullName1'
        };
    }
    $( '#'+dataSourceFieldId+i).blur(function() {
        console.log(' $(#'+dataSourceFieldId+i+') - onBlur JS detected -');
        fwdValidator.beneficiaryInfo.isValidBeneFullName( dataSourceFieldId+i, 'err'+dataSourceFieldId+i, insureBoolean, 'beneficiary', argCfg.placeholder, insureElem );
    });
};

/*
 * Binds "onBlur" JS behaviour to targeted DOM <input> inputBox and <span> errMsg field
 *
 * @method add_isValidBeneDob
 * @param   {Integer} index
 *          , {Boolean} insureBoolean
 *          , {String} dataSourceFieldId
 *          , {Null or Object} insureElem [Defaulted as Null]
 * @return Nil
 */
var add_isValidBeneDob = function(index, insureBoolean, dataSourceFieldId, insureElem) {

    if ( insureElem == null ) {
        // Defined what DOM will be binded to, i.e. Insured Person inputbox
        insureElem = {   // defaulted value
            'inputBoxId': 'txtInsuFullName1'
            , 'errMsgDOMId': 'errtxtPersonalFullName1'
        };
    }
    $( '#'+dataSourceFieldId+i).blur(function() {
        console.log(' $(#'+dataSourceFieldId+i+') - onBlur JS detected -');
        fwdValidator.beneficiaryInfo.isValidBeneFullName( dataSourceFieldId+i, 'err'+dataSourceFieldId+i, insureBoolean, 'beneficiary', argCfg.placeholder, insureElem );
    });
};


/*
 * Export modules to "fvConfig" object
 */
var fvConfig = {};
fvConfig['helpers'] = {
    'generateData': {
        'cfgFlightCare'     : gen_configFlightCare
    },
    'addEventJS': {
        'isValidBeneFullName'   : add_isValidBeneFullName   // Active
        , 'isValidBeneHkid'     : add_isValidBeneHkid       // In-progress, not tested yet
        // , 'isValidBeneDob'      : add_isValidBeneDob     // Pending
    },
    'ux': {}
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
//         _.each(v, function(vv, ii) {
//             phase_dynamicKeyToObj(result[i], ii, vv);
//         });
//     });
//     return result;
// };
