'use strict';

// VALIDATION - prerequistite << start >>
try {
    // MUST - Check "fvConfig"
    if ( typeof fvConfig === "undefined" && fvConfig === null ) { var fvConfig = {}; }

    // COULD - Check fwdConstant : RegExp etc. , calling example: fvConfig.regex.xxxx
    if ( typeof fwdConstant !== "object" && fwdConstant !== null ) { throw ('No fwd-constant.js are loaded. Please check again.'); }

} catch (e) {
    console.log('This file will not be executed.');
    console.error( e.toString() );
}
// VALIDATION - prerequistite << end >>

fvConfig['customValidatingRules'] = function() {
    return {
    	'isHkid' : {
    		'validate': function(validator, $field, options) {
    			var value = $field.val();
    			if (value.length > 0) {
                    if ( !fwdValidator.personalInfo.isValidHkid(value) ) {      // refer to fwd-validator.js
    					return {
    		                'valid': false,
    		                'message': getBundle(getBundleLanguage, "applicant.hkId.notValid.message")
    					}
    				}
    			}
    			return true;
    		}
    	}
        , 'alreadyRegistered': {
            'validate': function(validator, $field, options) {
                var value = $field.val();
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
