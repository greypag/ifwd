'use strict';

// VALIDATION - prerequistite << start >>
try {
    // MUST - Check "fvConfig"
    if ( typeof fvConfig === "undefined" && fvConfig === null ) { var fvConfig = {}; }

    // COULD - Check fwdConstant : RegExp etc.
    // if ( typeof fwdConstant === "object" || fwdConstant === null ) {
    //     var regexp = fwdConstant.regex;
    // } else {
    //     throw ('No fwd-constant "RegExp" are loaded. Please check again.');
    // }

} catch (e) {
    console.error(e.name.toString() + ' >>> ' + e.message);
}
// VALIDATION - prerequistite << end >>



fvConfig['customValidatingRules'] = function() {
    return {
    	isHkid : {
    		validate: function(validator, $field, options) {
    			var value = $field.val();
    			if (value.length > 0){
    				if ( !IsHKID(value) ) { // IsHKID(), refer to "js/fwd.js"
    					return {
    		                valid: false,
    		                message: getBundle(getBundleLanguage, "applicant.hkId.notValid.message")
    					}
    				}
    			}
    			return true;
    		}
    	}
    	/*isValidDob : {
    		validate: function(validator, $field, options) {
    			$field.datepicker().on('changeDate', function (ev) {
    				if ($field.val()==''){
    					return {
    		                valid: true,
    		                message: "hahahahaha"
    					}
    				}
    				//console.log(this);
    				//$('#freeFlightForm').formValidation('revalidateField', $field);
    			});
    		}
    	}*/
    };
}();
