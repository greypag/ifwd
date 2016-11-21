var customFormValidatior = {};
customFormValidatior = {
	isHkid : {
		validate: function(validator, $field, options) {
			var value = $field.val();
			if (value.length > 0){
				if (!IsHKID(value)){
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
_.assign(FormValidation.Validator, customFormValidatior);
console.log(FormValidation.Validator);