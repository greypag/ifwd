'use strict';

// function initBSVConfig(errMsgHandler) {
var initFVConfig = function(argCfg) {

	// VALIDATION - prerequistite << start >>
	try {
        // Check "fvConfig" is passed into initFVConfig() or not, HERE is named as "argCfg" argument.
        if ( typeof argCfg === "undefined" && argCfg === null ) { throw new Error('No "fvConfig" is loaded . Please check external JS links, esp. "validators.XXX.config.js" & "helpers.js"'); }

		// Check FV customed-made helpers
		if ( !_.has(argCfg, 'helpers') ) { throw new Error('No Helpers is loaded [ helpers.js ] . Please check'); }

		// Check validating config schema
		if ( !_.has(argCfg, 'schema') ) { throw new Error('No Schema is loaded [ validators.XXX.config.js ]. Please check '); }

		// Assign the customed validating rules into FV << RUN "validators.custom-rule.config.js" HERE
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

        // flightCare() prerequistite variables validating
        try {
            if ( !_.has(argCfg, 'flightJSPcbInfo.counter') ) { throw new Error('The "flightJSPcbInfo.counter" js object is missing, please check the JSP variables is passed or not.'); }
        } catch (e) {
			console.error('initFVConfig().flightCare() cannot run now');
            console.error(e.toString());
        }

		// other deticated js code before running FV
        $(function() {

			// placeholder.min.js
			$('input, textarea').placeholder();

			// Defaulted here
			var formId = 'freeFlightForm';
			// For helpers.attr.xxx
			var dataSourceFieldInfo = {};
			var datepickerConfig = {};

			argCfg.helpers.attr.modifiedDOM(true, 'readonly', ['txtInsuFullName1', 'txtInsuHkid1', 'selectAgeRange1']); // Multi-fields applied attr 'readonly'
			// *Developer* if 'disabled' is true, the AJAX serialize will not pass the fieldname to backend. That may cause a bug.
			// argCfg.helpers.attr.modifiedDOM(true, 'disabled', 'selectAgeRange1');


			if ( fvConfig.flightJSPcbInfo.counter.personalPlan === 0 ) {        // Do Family-plan below, IF fvConfig.flightJSPcbInfo.counter.personalPlan === 0
				var dataSourceFieldInfo_fullname = { 'formId': formId, 'inputId': 'inputFullName', 'errorId': 'fullnameinvalid', 'revalidateFieldName': 'adultName1' };
				var dataSourceFieldInfo_hkid = { 'formId': formId, 'inputId': 'inputTxtAppHkid', 'errorId': 'errAppHkid', 'revalidateFieldName': 'adultHKID1' };
			} else {                                                            // Do Personal-plan below
				var dataSourceFieldInfo_fullname = { 'formId': formId, 'inputId': 'inputFullName', 'errorId': 'fullnameinvalid', 'revalidateFieldName': 'personalName1' };
				var dataSourceFieldInfo_hkid = { 'formId': formId, 'inputId': 'inputTxtAppHkid', 'errorId': 'errAppHkid', 'revalidateFieldName': 'personalHKID1' };
			}
			// DOM [id="inputFullName"] is plugged extra JS behaviour
			argCfg.helpers.attr.onblur.binding.applicantName2InsuredPerson( true, dataSourceFieldInfo_fullname, null );	// Value-binding & field revalidation
			argCfg.helpers.attr.onkeypress.returnEngSpaceOnly( dataSourceFieldInfo_fullname );							// Field Input control : alpha + space only
			// DOM [id="inputTxtAppHkid"] is plugged extra JS behaviour
			argCfg.helpers.attr.onblur.binding.applicantHkid2InsuredPerson( true, dataSourceFieldInfo_hkid, null );	// Value-binding & field revalidation
			argCfg.helpers.attr.onkeypress.returnHkidLegalCharOnly( dataSourceFieldInfo_hkid );						// Field Input control : general HKID valid chars only


			// DOM [id="applicantDob"] is plugged extra JS behaviour
			dataSourceFieldInfo = { 'formId': formId, 'inputId': 'input_dob', 'revalidateFieldName': 'applicantDob' };
			datepickerConfig = {
		        'startView': 'decade',
		        'autoclose': true,
		        'format': 'dd-mm-yyyy',
		        'startDate': fwdConstant.date.dob_start_date, 		// Note: not UTC / GMT, should be "Wed Dec 02 1998 14:48:41 GMT+0800 (HKT)"
		        'endDate': fwdConstant.date.dob_end_date
		        // /*'language': getBundleLanguage*/
		    };
			argCfg.helpers.initDatePicker.changeDate_trigger_selectBoxValueChange( dataSourceFieldInfo, datepickerConfig );

			// Start >>> Under Developing - the tooltip behaviour
			// [opinion #1 = most simply, but not modulized]
			argCfg.helpers.attr.onchange.checkBox_tooltipFadeInOut('checkbox3', 'checkbox4');

				// [ Testing code in "helpers.userfulBackup.js" ]
				// [opinion #2 = moderate simplicity, but not handling checkBoxNumRequired]
				// fwdUtility.pages.flightCare.fncCheckBoxTooltip({
				// 	'.flightCheckboxBubble': [ '#checkbox3', '#checkbox4' ]
				// 	, '.flightCheckboxBubble2': [ '#checkbox5', '#checkbox6' ]
				// });

				// [opinion #3 = Most complexicity, but configs are perfectly]
				// fwdUtility.pages.flightCare.fncCheckBoxTooltip([
				// 	{
				// 		'pickboxSelector': [ '.flightCheckboxBubble' ] OR '.flightCheckboxBubble'
				// 		, 'checkBoxSelector': [ '#checkbox3', '#checkbox4' ] OR '#checkbox4'
				// 		, 'checkBoxNumRequired': 1
				// 	}
				// ]);

				// Opinion #4: FV callback solution (refer to validators.flightCare.config.js, around Line #114-128)
                // (this part may solve in phase 2 revamp)
			// End >>> Under Developing - the tooltip behaviour

			// Login Authenticate ( i.e. Username & Password )
			if ( !argCfg.flightJSPcbInfo.isAuthenticated ) {

				argCfg.helpers.attr.modifiedDOM('off', 'autocomplete', ['Password', 'Confirm-Password']);

				// DOM [id="Username"] is plugged extra JS behaviour
				dataSourceFieldInfo = { 'formId': formId, 'inputId': 'Username' };
				argCfg.helpers.attr.onkeypress.returnValidUsernameChar( dataSourceFieldInfo );
				argCfg.helpers.attr.onfocus.hideMembershipError( dataSourceFieldInfo );

				// DOM [id="Password"] is plugged extra JS behaviour
				dataSourceFieldInfo = { 'formId': formId, 'inputId': 'Password' };
				argCfg.helpers.attr.onfocus.hideMembershipError( dataSourceFieldInfo );

				// DOM [id="Confirm-Password"] is plugged extra JS behaviour
				dataSourceFieldInfo = { 'formId': formId, 'inputId': 'Confirm-Password' };
				argCfg.helpers.attr.onfocus.hideMembershipError( dataSourceFieldInfo );

				// Check fields is all-emptied or not. #Username, #Password, #Confirm-Password (Not-authenticated-case only)
				dataSourceFieldInfo = {
					'formId': formId
					// Should be a selector (ID / CLASSNAME) in distinct for targeted field(s)
					, 'fieldsForValidation': [
						'#Username'
						, '#Password'
						, '#Confirm-Password'
					]
					, 'fieldnamesForValidation': [
						'userName'
						, 'password'
						, 'passwordConfirm'
					]
					// min. number of "not-empty" fields to triggers cb().
					, 'fieldsLimitedTo': 1
				};
				var _enablingValidators = function(isEnabledBoolean) {
					console.log('_enablingValidators() is run. isEnabledBoolean = [ '+isEnabledBoolean+' ]');
					var arrFieldnames = dataSourceFieldInfo.fieldnamesForValidation;
					for (var h = 0; h < arrFieldnames.length; h++) {
						(function( k ) {
							$("#"+dataSourceFieldInfo.formId).formValidation('enableFieldValidators', arrFieldnames[k], isEnabledBoolean);
						})(h);
					}
				};

				$.each(dataSourceFieldInfo.fieldnamesForValidation, function(i, v) {
					$("input[name=" + v + "]").on("blur", function() {
						if ( argCfg.helpers.listener.isFieldsEmptied( dataSourceFieldInfo ) ) {
							_enablingValidators(true);
							$("#"+dataSourceFieldInfo.formId).formValidation('revalidateField', $(this).attr("name"));
						} else {
							_enablingValidators(false);
						};
					});
				});

				// Still drafting - just for reference
				// dataSourceFieldInfo = { 'formId': formId };
				// fwdUtility.pages.flightCare.activateUserAccountJoinUs_auth( dataSourceFieldInfo );

			} else {

				// Scenario for Non-Authenticated case
				console.log('argCfg.flightJSPcbInfo.authenticated = ' + argCfg.flightJSPcbInfo.authenticated);

				// Still drafting - just for reference
				// dataSourceFieldInfo = { 'formId': formId };
				// fwdUtility.pages.flightCare.activateUserAccountJoinUs_non_auth( dataSourceFieldInfo );

			}

			// Submit Form
			$(formId).onsubmit = function() {
				console.log( fwdUtility.pages.flightCare.userLoginAjax.userLoginFnc() );
		        fwdUtility.pages.flightCare.userLoginAjax.createFlightFnc(this);
		    };

			// DOM [id="applicantDob"] is plugged extra JS behaviour
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
		// 	// DOM [id="personalBeneficiaryId"] is plugged "onBlur" & triggers isValidBeneFullName()
		// 	dataSourceFieldInfo = { 'inputId': 'personalBeneficiaryId'+i, 'errorId': 'err'+'personalBeneficiaryId'+i };
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

	var flightCare = function(fvCfgs, fcArgs) {

		// flightCare() prerequistite variables validating
        try {
			if ( Object.prototype.toString.call(fcArgs) !== '[object Object]' ) { throw new Error('The param for "runFV()" is an {Object}'); }
            if ( typeof fcArgs.formId !== 'string' && fcArgsformId !== null ) { throw new Error('The "runFV()" requires a form id {String}'); }
        } catch (e) {
			console.error('runFV().flightCare() got error, will not run.');
            console.error( e.toString() );
        }
		console.log( getBundle(getBundleLanguage, 'member.registration.fail.username.registered') );
		// Trigger the FormValidation.io library here.
		$('#' + fcArgs.formId).formValidation(argCfg)
			.on('success.form.fv', function(e, data) {
				fvCfgs.helpers.fv.successForm.flightCare({
					'e': 			e
					, 'data': 		data
					, 'fvConfig':	fvConfig
					, 'fcArgs':		fcArgs
					, 'fvCfgs':		fvCfgs
				});
				if ( data.fv ) { data.fv.disableSubmitButtons(false); }
	        })
			.on('status.field.fv', function(e, data) {
				if ( data.fv ) { data.fv.disableSubmitButtons(false); }
			})
	        .on('err.validator.fv', function(e, data) {
	            /**
	            *   $(e.target)    --> The field element
	            *   data.fv        --> The FormValidation instance
	            *   data.field     --> The field name
	            *   data.element   --> The field element
	            *   data.validator --> The current validator name
	            **/
	        	// console.log( data.fv );
	            data.element
	                .data('fv.messages')
	                .find('.help-block[data-fv-for="' + data.field + '"]').hide()       // Hide all the messages
	                .filter('[data-fv-validator="' + data.validator + '"]').show();     // Show only message associated with current validator
				if ( data.fv ) { data.fv.disableSubmitButtons(false); }
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
	            data.element.next(".help-block").addClass("text-red");
				if ( data.fv ) { data.fv.disableSubmitButtons(false); }

				// Get the first invalid field
	            // var $invalidFields = data.fv.getInvalidFields();
	            // console.log( $invalidFields );
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
