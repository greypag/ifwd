
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
