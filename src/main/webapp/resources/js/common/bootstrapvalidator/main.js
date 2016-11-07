'use strict';

// function initBSVConfig(errMsgHandler) {
function initBSVConfig(base) {

	// var "base" already defined in [ base.config.js ]
	if ( typeof base === "undefined" && base === null ) {
		console.error('Please import the external JS file before running th [ base.config.js ]');
		// Export the running failure signal
		return false;
	} else {
		var mergeHelper = function(additional) {
			var baseCfg = {
				"row": base.row,
				"fields": base.fields
			};
			if ( typeof additional !== "undefined" && additional !== null ) {
				$.extend( baseCfg.fields, additional );
			}
			return baseCfg;
		};
		// Define module - flightCare()  --------- Start ---------
		var flightCare = function() {
			var objPlus = {
				"personalName": {
					"container": '#errtxtPersonalFullName1',
					"validators": {
						"notEmpty": {
							"message": getBundle(getBundleLanguage, "insured.name.notNull.message")
						},
						"onSucces": function(e, data) {
							if (!data.fv.isValidField('fullName')) {
								// Revalidate it
								data.fv.revalidateField('fullName');
							}
						}
					}
				},
				"personalHKID": {
					"container": '#errtxtInsuHkid1',
					"validators": {
						"notEmpty": {
							"message": getBundle(getBundleLanguage, "insured.hkId.notNull.message")
						}
					}
				}
			};
			return mergeHelper( objPlus );
		};
		// Define module - flightCare()  --------- End ---------

		// Define module - easyHealth()  --------- Start ---------
		var easyHealth = function() { return false; };
		// Define module - easyHealth()  --------- End ---------

		// Define module - easyHome()  --------- Start ---------
		var easyHome = function() { return false; };
		// Define module - easyHome()  --------- End ---------

		// Define module - eliteTerm()  --------- Start ---------
		var eliteTerm = function() { return false; };
		// Define module - eliteTerm()  --------- End ---------



		// Export the stream of modules
		return {
			"flightCare": 	flightCare,
			"easyHealth": 	easyHealth,
			"easyHome":		easyHome,
			"eliteTerm": 	eliteTerm
		};
	}
}
