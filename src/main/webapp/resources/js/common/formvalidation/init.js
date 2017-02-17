'use strict';

// function initBSVConfig(errMsgHandler) {
var initFVConfig = function(argCfg) {
	try {
        // Check "fvConfig" is passed into initFVConfig() or not, HERE is named as "argCfg" argument.
        if ( typeof argCfg === "undefined" && argCfg === null ) { throw new Error('No "fvConfig" is loaded . Please check external JS links, esp. "validators.XXX.config.js" & "helpers.js"'); }
		if ( !_.has(argCfg, 'helpers') ) { throw new Error('No Helpers is loaded [ helpers.js ] . Please check'); }
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
	var formId = argCfg.pageAutoConfig.form[0].id;
	var formInfo_fullname;
	var formInfo_hkid;
	var formInfo = {};
	if ( fvConfig.flightJSPcbInfo.counter.personalPlan === 0 ) {        // Do Family-plan below, IF fvConfig.flightJSPcbInfo.counter.personalPlan === 0
		formInfo_fullname = { 'formId': formId, 'inputId': 'inputFullName', 'errorId': 'fullnameinvalid', 'revalidateFieldName': 'adultName1' };
		formInfo_hkid = { 'formId': formId, 'inputId': 'inputTxtAppHkid', 'errorId': 'errAppHkid', 'revalidateFieldName': 'adultHKID1' };
	} else {                                                            // Do Personal-plan below
		formInfo_fullname = { 'formId': formId, 'inputId': 'inputFullName', 'errorId': 'fullnameinvalid', 'revalidateFieldName': 'personalName1' };
		formInfo_hkid = { 'formId': formId, 'inputId': 'inputTxtAppHkid', 'errorId': 'errAppHkid', 'revalidateFieldName': 'personalHKID1' };
	}
	var initAccRegister = function(){
		argCfg.helpers.attr.modifiedDOM(true, 'readonly', ['txtInsuFullName1', 'txtInsuHkid1', 'selectAgeRange1']);
		argCfg.helpers.attr.onkeypress.returnEngSpaceOnly( formInfo_fullname );
		argCfg.helpers.attr.onkeypress.returnHkidLegalCharOnly( formInfo_hkid );	

		// Login Authenticate ( i.e. Username & Password )
		if ( !argCfg.flightJSPcbInfo.isAuthenticated ) {

			argCfg.helpers.attr.modifiedDOM('off', 'autocomplete', ['Password', 'Confirm-Password']);

			// DOM [id="Username"]
			formInfo = { 'formId': formId, 'inputId': 'Username' };
			argCfg.helpers.attr.onkeypress.returnValidUsernameChar( formInfo );
			argCfg.helpers.attr.onfocus.hideMembershipError( formInfo );

			// DOM [id="Password"]
			formInfo = { 'formId': formId, 'inputId': 'Password' };
			argCfg.helpers.attr.onfocus.hideMembershipError( formInfo );

			// DOM [id="Confirm-Password"]
			formInfo = { 'formId': formId, 'inputId': 'Confirm-Password' };
			argCfg.helpers.attr.onfocus.hideMembershipError( formInfo );

			// Check fields is all-emptied or not. #Username, #Password, #Confirm-Password (Not-authenticated-case only)
			formInfo = {
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
			//console.log(formInfo);
			$.each(formInfo.fieldnamesForValidation, function(i, v) {
				var fomrInfo2 = formInfo;
				$("input[name=" + v + "]").on("blur", function() {
					console.log(formInfo);
					if ( argCfg.helpers.listener.isFieldsEmptied( formInfo ) ) {
						argCfg.helpers.fv.enable_validate_grp(true, formInfo);
						$("#"+formInfo.formId).formValidation('revalidateField', $(this).attr("name"));
					} else {
						argCfg.helpers.fv.enable_validate_grp(false, formInfo);
					};
				});
			});

		} else {
			console.log('argCfg.flightJSPcbInfo.authenticated = ' + argCfg.flightJSPcbInfo.authenticated);
		}				
	}
	
	var initEvent = function() {
		argCfg.helpers.attr.onchange.checkBox_tooltipFadeInOut('checkbox3', 'checkbox4');
	};
	
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
        	$('input, textarea').placeholder();
    		initEvent();
    		initAccRegister();        	
			// Declaration
			//var formId = argCfg.pageAutoConfig.form[0].id;
			//var formInfo = {};				// For argCfg.helpers.attr.xxx
			var datepickerConfig = {};		// For argCfg.helpers.attr.xxx
			// *Developer* if 'disabled' is assigned in DOM, the serialize string (for AJAX export) will not pass the fieldname to backend. That may cause a bug.
			// argCfg.helpers.attr.modifiedDOM(true, 'disabled', 'selectAgeRange1');
			// DOM FROM [id="inputFullName"] TO [id="adultName1"] OR  [id="personalName1"]
			var insureFieldInfo = { 'inputBoxId': 'txtInsuFullName1' , 'errMsgDOMId': 'errtxtPersonalFullName1' };
			var insureFieldInfo2 = { 'inputBoxId': 'txtInsuHkid1' , 'errMsgDOMId': 'errtxtInsuHkid1' };
			var appRelationship = {
					'isDeclared' : $('#applicantRelationship').length ? true : false,
					'relationship' : $('#applicantRelationship').val()	
			}
			$( '#'+formInfo_fullname.inputId).blur(function() {
				argCfg.helpers.attr.onblur.binding.bindingValFromA2B( '#'+formInfo_fullname.inputId, '#'+insureFieldInfo.inputBoxId );
			    $('#'+formInfo_fullname.formId).formValidation( 'revalidateField', formInfo.revalidateFieldName );
			});
			
			$( '#'+formInfo_hkid.inputId).blur(function() {
				argCfg.helpers.attr.onblur.binding.bindingValFromA2B( '#'+formInfo_hkid.inputId , '#'+insureFieldInfo2.inputBoxId );
			    $('#'+formInfo_hkid.formId).formValidation( 'revalidateField', formInfo.revalidateFieldName );
			});
			//argCfg.helpers.attr.onblur.binding.applicantName2InsuredPerson( true, formInfo_fullname, null );	// Value-binding & field revalidation
			//argCfg.helpers.attr.onkeypress.returnEngSpaceOnly( formInfo_fullname );							// Field Input control : alpha + space only
			// DOM FROM [id="inputTxtAppHkid"] TO [id="adultHKID1"] OR  [id="personalHKID1"]
			//argCfg.helpers.attr.onblur.binding.applicantHkid2InsuredPerson( true, formInfo_hkid, null );		// Value-binding & field revalidation
			//argCfg.helpers.attr.onkeypress.returnHkidLegalCharOnly( formInfo_hkid );							// Field Input control : general HKID valid chars only


			// DOM [id="applicantDob"]
			formInfo = { 'formId': formId, 'inputId': 'input_dob', 'revalidateFieldName': 'applicantDob' };
			datepickerConfig = {
		        'startView': 'decade',
		        'autoclose': true,
		        'format': 'dd-mm-yyyy',
		        'startDate': fwdConstant.date.dob_start_date, 		// Note: not UTC / GMT, should be "Wed Dec 02 1998 14:48:41 GMT+0800 (HKT)"
		        'endDate': fwdConstant.date.dob_end_date
		        // /*'language': getBundleLanguage*/
		    };
			argCfg.helpers.initDatePicker.changeDate_trigger_selectBoxValueChange( formInfo, datepickerConfig );

			// Start >>> Under Developing - the tooltip behaviour
			// [opinion #1 = most simply, but not modulized]
			//argCfg.helpers.attr.onchange.checkBox_tooltipFadeInOut('checkbox3', 'checkbox4');

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


			// Submit Form
			$(formId).onsubmit = function() {
				$('#loading-overlay').modal({ backdrop: 'static', keyboard: false });
				// fwdUtility.pages.flightCare.userLoginAjax.userLoginFnc();
		        // fwdUtility.pages.flightCare.userLoginAjax.createFlightFnc(this);
		    };

        });


		// Merge all FV configs together, !!! caution we targeted to result['fields'] only.
		var result = argCfg.schema;

		result.fields = $.extend(
				argCfg.schema.fields
				, argCfg.applicant
				, argCfg.helpers.generateConfig.flightCare( argCfg )
			);
		console.log(result);

		return result;
	};


	// Export the stream of modules
	return {
		"flightCare":	flightCare
	};
};
/*
 * Trigger the FormValidation
 */
var runFV = function(argCfg) {

	var flightCare = function(fvCfgs) {

        try {
			if ( Object.prototype.toString.call(fvCfgs) !== '[object Object]' ) { throw new TypeError('The param for "runFV()" is an {Object}'); }
            // if ( typeof fvCfgs.pageAutoConfig.form[0].id !== 'string' && fvCfgs.pageAutoConfig.form[0].id !== null ) { throw new Error('The "runFV()" requires a form id {String}'); }
        } catch (e) {
			console.group('runFV().flightCare() got error, will not be run.');
			if (e.name.toString() == "TypeError") {
				console.error(e.name+": "+e.message);
		    } else {
				console.error(e);
			}
			console.groupEnd();
        }

		var formId = fvCfgs.pageAutoConfig.form[0].id;

		// Trigger the FormValidation.io library here.
		$('#' + formId).formValidation(argCfg)
			.on('success.form.fv', function(e, data) {
				fvCfgs.helpers.fv.successForm.flightCare({
					'e': 			e
					, 'data': 		data
					, 'fvConfig':	fvConfig
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
				// http://formvalidation.io/examples/showing-one-message/
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
				if ( data.fv ) {
					data.fv.disableSubmitButtons(false);
					// Get the first invalid field, and then scroll to that element by #id
		            var $firstInvalidField = ( data.fv.getInvalidFields().length > 1 ? data.fv.getInvalidFields().eq(0) : data.fv.getInvalidFields() )[0];
					$('#loading-overlay').modal('hide');
					fwdUtility.ux.scrollToElement( $firstInvalidField.id );
				}
				// console.log(data.element.next());
	            // console.log(data.element);
				// console.log( data.fv.getOptions(data.element) );
	        });

	};



	// Export the stream of modules
	return {
		"flightCare":	flightCare
	};
};
