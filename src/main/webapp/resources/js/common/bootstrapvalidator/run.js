'use strict';

// function initBSVConfig(errMsgHandler) {
function initBSVConfig(base) {

	// var "base" already defined in [ base.config.js ]
	if ( typeof base === "undefined" && base === null ) {
		console.error('Funct "initBSVConfig" warning message >>> Please import the external JS file before running th [ base.config.js ]');
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
			} else {
				console.error('Funct "mergeHelper" warning message >>> params "additional" is undefined.');
			}
			return baseCfg;
		};

		// Define module - flightCare()  --------- Start ---------
		var flightCare = function() {
			return mergeHelper( base['flightCare'] );
		};
		// Define module - flightCare()  --------- End ---------

		// Define module - easyHealth()  --------- Start ---------
		var easyHealth = function() {
			return mergeHelper( base['easyHealth'] );
		};
		// Define module - easyHealth()  --------- End ---------

		// Define module - easyHome()  --------- Start ---------
		var easyHome = function() {
			return mergeHelper( base['easyHome'] );
		};
		// Define module - easyHome()  --------- End ---------

		// Define module - eliteTerm()  --------- Start ---------
		var eliteTerm = function() {
			return mergeHelper( base['eliteTerm'] );
		};
		// Define module - eliteTerm()  --------- End ---------



		// Export the stream of modules
		return {
			"flightCare":	flightCare,
			"easyHealth":	easyHealth,
			"easyHome":		easyHome,
			"eliteTerm":	eliteTerm
		};
	}
}
