'use strict';

// function initBSVConfig(errMsgHandler) {
function initFVConfig(argCfg) {

	// VALIDATION - prerequistite << start >>
	try {
        // MUST - Check "fvConfig" is passed into initFVConfig() or not, HERE is named as "argCfg" argument.
        if ( typeof argCfg === "undefined" && argCfg === null ) {
            throw new Error('No "fvConfig" is loaded . Please check external JS links, esp. "validators.XXX.config.js" & "helpers.js"');
        }

		// MUST - Check FV customed-made helpers
		if ( _.has(argCfg, 'helpers') ) {
			var helpers = argCfg.helpers;
		} else {
            throw new Error('No Helpers is loaded [ helpers.js ] . Please check');
		}

		// MUST - Check validating config schema
		if ( _.has(argCfg, 'schema') ) {
			var schema = argCfg.schema;
		} else {
			throw new Error('No Schema is loaded [ validators.XXX.config.js ]. Please check ');
		}

		// SHOULD - Assign the customed validating rules into FV
		if ( _.has(argCfg, 'customValidatingRules') ) {
			_.assign(FormValidation.Validator, argCfg.customValidatingRules);
			console.log('FV Customed-validating rules are added.')
			// console.log(FormValidation.Validator);
		}
	} catch (e) {
		console.error(e.name.toString() + ' >>> ' + e.message);
	}
    // VALIDATION - prerequistite << end >>




	var flightCare = function() {

        // MUST - flightCare() prerequistite variables validating
        try {
            if ( !_.has(argCfg, 'travellerCounter') ) {
                throw new Error('The "travellerCounter" js object is missing, please check the JSP variables is passed or not.');
            }
        } catch (e) {
            console.error(e.name.toString() + ' >>> ' + e.message);
        }

		// COULD - other deticated js code before running FV
        $(function() {
            var name = document.getElementById("inputFullName").value;
			// --- Under Developing ---
            console.log(name);
        });

		// Merge all FV config together, !!! caution $.extend() to result['fields'] !!!
		var result = argCfg.schema;
		result.fields = $.extend(
				argCfg.schema.fields
				, argCfg.applicant
				, helpers.genConfigFlightCare( argCfg )
			);
			
		return result;
	};

    var travelCare	= function() { return null; };
	var easyHealth	= function() { return null; };
	var easyHome 	= function() { return null; };
	var eliteTerm	= function() { return null; };


	// Export the stream of modules
	return {
		"flightCare":	flightCare,
        "travelCare":   travelCare,
		"easyHealth":	easyHealth,
		"easyHome":		easyHome,
		"eliteTerm":	eliteTerm
	};
}
