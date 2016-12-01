'use strict';

// function initBSVConfig(errMsgHandler) {
var initFVConfig = function(argCfg) {

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
            if ( !_.has(argCfg, 'flightJSPcbInfo.counter') ) { throw new Error('The "flightJSPcbInfo.counter" js object is missing, please check the JSP variables is passed or not.'); }
        } catch (e) {
			console.error('initFVConfig().flightCare() cannot run now');
            console.error(e.toString());
        }

		// MUST - other deticated js code before running FV
        $(function() {

			// placeholder.min.js
			$('input, textarea').placeholder();

			// Defaulted here
			var formId = 'freeFlightForm';
			// For helpers.attr.xxx
			var dataSourceFieldInfo = {};

			// MUST - Multi-fields applied attr 'readonly'
			argCfg.helpers.attr.readonly('enable',  ['txtInsuFullName1', 'txtInsuHkid1', 'selectAgeRange1']);

			// MUST - DOM [id="inputFullName"] is plugged extra JS behaviour
			dataSourceFieldInfo = { 'formId': formId, 'inputId': 'inputFullName', 'errorId': 'fullnameinvalid', 'revalidateFieldName': 'personalName1' };
			// MUST - Value-binding & field revalidation
			argCfg.helpers.attr.onblur.binding.applicantName2InsuredPerson( true, dataSourceFieldInfo, null );
			// MUST - Field Input control : alpha + space only
			argCfg.helpers.attr.onkeypress.returnEngSpaceOnly( dataSourceFieldInfo.inputId );

			// MUST - DOM [id="inputTxtAppHkid"] is plugged extra JS behaviour
			dataSourceFieldInfo = { 'formId': formId, 'inputId': 'inputTxtAppHkid', 'errorId': 'errAppHkid', 'revalidateFieldName': 'personalHKID1'  };
			// MUST - Value-binding & field revalidation
			argCfg.helpers.attr.onblur.binding.applicantHkid2InsuredPerson( true, dataSourceFieldInfo, null );
			// MUST - Field control : general HKID valid chars only
			argCfg.helpers.attr.onkeypress.returnHkidLegalCharOnly( dataSourceFieldInfo.inputId );

			// Under Developing - the tooltip behaviour
			argCfg.helpers.attr.onchange.checkBox_tooltipFadeInOut();

			// fwdUtility.pages.flightCare.fncCheckBoxTooltip({
			// 	'.flightCheckboxBubble': [ '#checkbox3', '#checkbox4' ]
			// 	, '.flightCheckboxBubble2': [ '#checkbox5', '#checkbox6' ]
			// });

			// fwdUtility.pages.flightCare.fncCheckBoxTooltip(
			// 	{
			// 		'pickboxSelector': '.flightCheckboxBubble'
			// 		, 'checkBoxSelector': [ '#checkbox3', '#checkbox4' ]
			// 		, 'checkBoxRequired': 1
			// 	}
			// );

			// MUST - Submit Form
			$(formId).onsubmit = function() {
		        fwdUtility.pages.flightCare.userLoginAjax.createFlightFnc(this);
		    };

			// MUST - DOM [id="applicantDob"] is plugged extra JS behaviour
			// dataSourceFieldInfo = { 'inputId': 'applicantDob', 'errorId': 'fullnameinvalid' };
			// argCfg.helpers.attr.isValidBeneDob( false, dataSourceFieldInfo, null );
        });


		// Merge all FV configs together, !!! caution we only targeted to result['fields']
		var result = argCfg.schema;

		result.fields = $.extend(
				argCfg.schema.fields
				, argCfg.applicant
				, argCfg.helpers.generateConfig.flightCare( argCfg )
			);

		console.log(result);

		return result;
	};

    var travelCare	= function() {
		// This For-loop SAME AS JSP var ${inx} (i.e. defined in flight-plan-details.jsp)
		// In JS var, {Integer} 'argCfg.flightJSPcbInfo.counter.personalPlan' (i.e. Total Personal Plan Travller)
		// for ( var i = 1; i < argCfg.flightJSPcbInfo.counter.personalPlan+1; i++ ) (function(i) {
		//
		// 	// WON'T - Note & Demo only, because these are hidden fields
		// 	// DOM [id="personalBenefitiaryId"] is plugged "onBlur" & triggers isValidBeneFullName()
		// 	dataSourceFieldInfo = { 'inputId': 'personalBenefitiaryId'+i, 'errorId': 'err'+'personalBenefitiaryId'+i };
		// 	argCfg.helpers.event.isValidBeneFullName( true, dataSourceFieldInfo, null);
		//
		// })(i);
		return null;
	};
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
};
/*
 * Trigger the FormValidation
 */
var runFV = function(argCfg) {

	var flightCare = function(fcArgs) {

		// MUST - flightCare() prerequistite variables validating
        try {
			if ( Object.prototype.toString.call(fcArgs) !== '[object Object]' ) { throw new Error('The param for "runFV()" is an {Object}'); }
            if ( typeof fcArgs.formId !== 'string' && fcArgsformId !== null ) { throw new Error('The "runFV()" requires a form id {String}'); }
        } catch (e) {
			console.error('runFV().flightCare() got error, will not run.');
            console.error( e.toString() );
        }

		// MUST - Trigger the FormValidation.io library here.
		$('#' + fcArgs.formId).formValidation(argCfg)
	        .on('err.validator.fv', function(e, data) {
	            /**
	            *   $(e.target)    --> The field element
	            *   data.fv        --> The FormValidation instance
	            *   data.field     --> The field name
	            *   data.element   --> The field element
	            *   data.validator --> The current validator name
	            **/
	            data.element
	                .data('fv.messages')
	                .find('.help-block[data-fv-for="' + data.field + '"]').hide()       // Hide all the messages
	                .filter('[data-fv-validator="' + data.validator + '"]').show();     // Show only message associated with current validator
	        })
	        .on('err.field.fv', function(e, data) {
	            /*
	             * data.field is the field name
	             * data.status is the current status of validator
	             * data.element is the field element
	             * Assume that the form uses the Bootstrap framework
	             * and has a standard structure
	             * Each pair of field and label are placed inside a .form-group element
	             */
	            data.element.next().children().addClass("text-red");
				// console.log(data.element.next());
	            // console.log(data.element);
	            // console.log( data.fv.getOptions(data.element) );
	        });
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
};
