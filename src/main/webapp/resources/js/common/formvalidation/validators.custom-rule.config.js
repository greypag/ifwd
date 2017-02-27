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
        }, 'isDuplicated': {
        	'validate': function(validator, $field, options){
        		var isDuplicated, fieldName, fieldGroup = [], valArray = [];
        		fieldName = (typeof options.fieldsToCheck !== 'undefined' && options.fieldsToCheck!='') ? options.fieldsToCheck : $field.attr('name');
        		if($.isArray(fieldName)){
        			for(var i = 0; i<fieldName.length; i++){
        				fieldGroup = $.merge(fieldGroup, validator.getFieldElements(fieldName[i]));
        				//console.log(fieldGroup);
        			}
        			for(var i = 0; i<fieldGroup.length; i++){
        				//console.log(fieldGroup[i].value);
        				valArray.push(fieldGroup[i].value.toUpperCase());
        			}
        		}else{
        			fieldGroup = validator.getFieldElements(fieldName);
        			for(var i = 0; i<fieldGroup.length; i++){
        				valArray.push(fieldGroup[i].value.toUpperCase());
        			}        			
        		}
        		//console.log($field.val());
        		isDuplicated = fvConfig.helpers.fvCallback.hasDuplicatedValues($field.val().toUpperCase(), valArray);
        		if(isDuplicated==true){
        			return false;
        		}else{
        			return true;
        		}        		
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
