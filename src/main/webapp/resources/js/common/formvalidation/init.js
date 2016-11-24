'use strict';

// function initBSVConfig(errMsgHandler) {
function initFVConfig(argCfg) {

	// VALIDATION - prerequistite << start >>
	try {
        // MUST - Check "fvConfig" is passed into initFVConfig() or not, HERE is named as "argCfg" argument.
        if ( typeof argCfg === "undefined" && argCfg === null ) { throw new Error('No "fvConfig" is loaded . Please check external JS links, esp. "validators.XXX.config.js" & "helpers.js"'); }

		// MUST - Check FV customed-made helpers
		if ( !_.has(argCfg, 'helpers') ) { throw new Error('No Helpers is loaded [ helpers.js ] . Please check'); }

		// MUST - Check validating config schema
		if ( !_.has(argCfg, 'schema') ) { throw new Error('No Schema is loaded [ validators.XXX.config.js ]. Please check '); }

		// SHOULD - Assign the customed validating rules into FV << RUN "validators.custom-rule.config.js" HERE
		if ( _.has(argCfg, 'customValidatingRules') ) {
			_.assign(FormValidation.Validator, argCfg.customValidatingRules);
			console.log('FV Customed-validating rules are added.')
		}

	} catch (e) {
		// console.error(e.name.toString() + ' >>> ' + e.message);
		console.error( e.toString() );
	}
    // VALIDATION - prerequistite << end >>




	var flightCare = function() {

        // MUST - flightCare() prerequistite variables validating
        try {
            if ( !_.has(argCfg, 'travellerCounter') ) { throw new Error('The "travellerCounter" js object is missing, please check the JSP variables is passed or not.'); }
        } catch (e) {
            console.error(e.name.toString() + ' >>> ' + e.message);
        }

		// SHOULD - other deticated js code before running FV
		// --- Under Developing ---
        $(function() {

			$('input, textarea').placeholder();

			var dataSourceFieldInfo = {};

			// MUST - DOM [id="inputFullName"] is plugged "onBlur" & triggers isValidBeneFullName()
			dataSourceFieldInfo = { 'inputId': 'inputFullName', 'errorId': 'fullnameinvalid' };
			argCfg.helpers.event.isValidBeneFullName( 'applicant', true, dataSourceFieldInfo, null );
			argCfg.helpers.event.keypress.returnEngSpaceOnly( dataSourceFieldInfo.inputId );

			// MUST - DOM [id="inputTxtAppHkid"] is plugged "onBlur" & triggers isValidBeneHkid()
			// dataSourceFieldInfo = { 'inputId': 'inputTxtAppHkid', 'errorId': 'fullnameinvalid' };
			// argCfg.helpers.event.isValidBeneHkid( 'applicant', true, dataSourceFieldInfo, null );

			// MUST - DOM [id="applicantDob"] is plugged "onBlur" & triggers isValidBeneDob()
			// dataSourceFieldInfo = { 'inputId': 'applicantDob', 'errorId': 'fullnameinvalid' };
			// argCfg.helpers.event.isValidBeneDob( 'applicant', false, dataSourceFieldInfo, null );

			// This For-loop SAME AS JSP var ${inx} (i.e. defined in flight-plan-details.jsp)
			// In JS var, {Integer} 'argCfg.travellerCounter.personalPlan' (i.e. Total Personal Plan Travller)
			// for ( var i = 1; i < argCfg.travellerCounter.personalPlan+1; i++ ) (function(i) {
			//
			// 	// WON'T - Note & Demo only, because these are hidden fields
			// 	// DOM [id="personalBenefitiaryId"] is plugged "onBlur" & triggers isValidBeneFullName()
			// 	dataSourceFieldInfo = { 'inputId': 'personalBenefitiaryId'+i, 'errorId': 'err'+'personalBenefitiaryId'+i };
			// 	argCfg.helpers.event.isValidBeneFullName( 'beneficiary', true, dataSourceFieldInfo, null);
			//
			// })(i);

        });


		// Merge all FV configs together, !!! caution we only targeted to result['fields']
		var result = argCfg.schema;
		result.fields = $.extend(
				argCfg.schema.fields
				, argCfg.applicant
				, argCfg.helpers.generateData.cfgFlightCare( argCfg )
			);
		console.log(result);

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
