'use strict';
// function initBSVConfig(errMsgHandler) {
var initFVConfig = function(argCfg) {
	 /*
	  * Flight Care FormValidation Config Generation
	  *
	  * @method [Public]    gen_configFlightCare
	  * @param  {Object}    obj
	  * @return {Object}    buffer  [success]
	  * @return {Boolean}   false   [failure]
	  */
	var gen_configFlightCare = function(obj) {

	    try {
	        if ( _.isEmpty(obj) ) throw new Error('1 param is required. Please check.');
	    } catch(e) {
	        console.error(e.name.toString() + ' >>> ' + e.message);
	        return false;
	    }
	   //  finally { statements } // noted

	   /*
	    * Add the suffix string (i.e. index) on each keys
	    *
	    * @method   [Private]           _plugIdIntoKeyMap
	    * @param    {Integer / String}  index
	    * @param    {Object}            configs
	    * @return   {Object}            temp
	    */
	   var _plugIdIntoKeyMap = function(index, configs, fieldsToSkip) {
	       var keys = _.keys(configs);
	       var temp = {};
	       for (var i = 0; i < keys.length; i++) {
	    	   var isSkip = $.inArray(keys[i], fieldsToSkip);
	    	   if(isSkip>=0){
	    		   temp[keys[i]] = keys[i];
	    	   }else{
	    		   temp[keys[i]] = keys[i] + index;
	    	   }
	       }
	       return temp;
	   };

	   /*
	    * Core progress about FV config generation
	    *
	    * @method   [Private]   _multiplyConfig
	    * @param    {Integer}   iPersonTotal ( insurcedPersonTotal )
	    * @param    {Object}    o
	    * @param    {Object}    pct ( personConfigType )
	    * @return   {Object}
	    */
	    var _multiplyConfig = function(iPersonTotal, o, pct, skip) {

	        var buffer = {};
	        var newKeyMap = {};
	        for (i = 1; i <= iPersonTotal; i++) {
	            var keyMap = _plugIdIntoKeyMap(i, o[pct], skip);
	            //console.log(keyMap);
	            newKeyMap = {};
	            _.each( o[pct], function(iPersonV, iPersonI) {
	               var sub = {};
	               var targetKey = 'container';

	               sub[targetKey] = iPersonV[targetKey] + i;
	               //console.log(iPersonI);
	               // - new testing code - start -
	               // console.log(typeof iPersonV.validators.identical);
	               if ( i == 1 && iPersonI=="personalName1" ) {
	                   iPersonV.validators.identical.enabled = true;
	               } else if ( i != 1 && typeof iPersonV.validators.identical!="undefined" ) {
	                   iPersonV.validators.identical.enabled = false;
	               }
	               // - new testing code - end -

	               _.each(iPersonV, function(iPersonV_V, iPersonV_I) {
	                   if (iPersonV_I !== targetKey) { sub[iPersonV_I] = iPersonV[iPersonV_I]; }
	               });
	               newKeyMap[ keyMap[iPersonI] ] = _.merge({}, sub);
	               //console.log(newKeyMap);
	            });
	            buffer = _.merge(buffer, newKeyMap);

	        }
	        return buffer;
	    };

	    // Core
	    var buffer = {};
	    var fieldskip = [];
	    if ( obj.flightJSPcbInfo.counter.personalPlan === 0 ) {
	       // Family Plan
	        var familyConfig = {};
	        fieldskip = ['adultHKID','childHKID','otherHKID'];
	        familyConfig['adult'] = _multiplyConfig(obj.flightJSPcbInfo.counter.familyPlan.adult, obj, 'insuredAdult', fieldskip);
	        familyConfig['child'] = _multiplyConfig(obj.flightJSPcbInfo.counter.familyPlan.child, obj, 'insuredChild', fieldskip);
	        familyConfig['other'] = _multiplyConfig(obj.flightJSPcbInfo.counter.familyPlan.other, obj, 'insuredOther', fieldskip);
	        _.each(familyConfig, function(fcVal, fcInd) {
	           buffer = $.extend(buffer, fcVal);
	        });
	    } else {
	        // Personal Plan
	    	fieldskip = ['personalHKID'];
	        buffer = _multiplyConfig(obj.flightJSPcbInfo.counter.personalPlan, obj, 'insuredPerson', fieldskip);
	    }
	    return buffer;

	};	
	
	var initDatePicker = function(info, datepickerConfig) {
	    // birthday datepicker, only 18-85 year-old users can buy the insurance
	    $( '#' + info.inputId )
	        .datepicker(datepickerConfig)
	        .on('changeDate', function (ev) {
	            $('#'+info.formId).val( $('#'+info.inputId).datepicker('getFormattedDate') );
	            $('#'+info.formId).formValidation( 'revalidateField', info.revalidateFieldName );
	            var selected = 2;
	            if (ev.date != undefined) {
	                if ( ev.date.valueOf() < fwdConstant.date.dob_end_date.valueOf()
	                    && ev.date.valueOf() > fwdConstant.date.dob_70_date.valueOf() ) {
	                    selected = 2;
	                } else {
	                    selected = 3;
	                }
	                // Check DOM item existences
	                if ($("#selectAgeRange1").length > 0) {
	                    $("#selectAgeRange1").val(selected);
	                } else if ($("#insureDob1").length > 0) {
	                    $("#insureDob1").val( $("#applicantDob").val() );
	                }
	            }
	        });
	        //$('#input_dob').datepicker('setDate', dob_end_date);
	};		
	
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
					if ( argCfg.helpers.listener.isFieldsEmptied( fomrInfo2 ) ) {
						argCfg.helpers.fv.enable_validate_grp(true, fomrInfo2);
						$("#"+fomrInfo2.formId).formValidation('revalidateField', $(this).attr("name"));
					} else {
						argCfg.helpers.fv.enable_validate_grp(false, fomrInfo2);
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
			var datepickerConfig = {};		// For argCfg.helpers.attr.xxx
			// *Developer* if 'disabled' is assigned in DOM, the serialize string (for AJAX export) will not pass the fieldname to backend. That may cause a bug.

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
			initDatePicker( formInfo, datepickerConfig );

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
				, gen_configFlightCare( argCfg )//argCfg.insuredPerson
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
		var rmIndex_Serialized = function(cfg, serializedString, fieldnameToRemoveIndex) {

		    var _removeIndex = function( stringInput, travellerCounter, fieldnameToRemoveIndex ) {
		        var temp = stringInput;
		        for (var i = 0; i < fieldnameToRemoveIndex.length; i++) {
		        	if (typeof travellerCounter==="object") {
		        		$.each( travellerCounter, function( key, value ) {
		                    for (var w = 1; w < value+1; w++) {
		                        temp = temp.replace(fieldnameToRemoveIndex[i]+w, fieldnameToRemoveIndex[i]);
		                    }
		        		});
		            } else {
			            for (var w = 1; w < travellerCounter+1; w++) {
			                temp = temp.replace(fieldnameToRemoveIndex[i]+w, fieldnameToRemoveIndex[i]);
			            }
		            }
		        }
		        return temp;
		    };

		    // Core
		    var stringBuffer = serializedString;
		    if ( cfg.counter.personalPlan === 0 ) {
		    	stringBuffer = _removeIndex( stringBuffer, cfg.counter.familyPlan, fieldnameToRemoveIndex );
		        console.log('Family Plan');
		        // ... have to develop it later

		    } else {
		        stringBuffer = _removeIndex( stringBuffer, cfg.counter.personalPlan, fieldnameToRemoveIndex );
		    }
		    return stringBuffer;
		};		
		var fv_successForm_flightCare = function( argObj ) {

		    var e           = argObj.e;
		    var data        = argObj.data;
		    var fvConfig    = argObj.fvConfig;
		    var fvCfgs      = argObj.fvCfgs;
		    var formId      = fvCfgs.pageAutoConfig.form[0].id;

		    var $form = $(e.target);
		    var fv    = $form.data('formValidation');

		    // Prevent form submission
		    e.preventDefault();

		    // Some instances you can use
		    var $form	                   = $(e.target);
		    var fv  	                   = $form.data('formValidation');
		    var flagForAccCreated          = ( $.trim( $("#Username").val())!="" && $.trim( $("#Password").val())!="" && $.trim( $("#Confirm-Password").val())!="" ) ? true : false;
		    var serializedString_withIndex = $('#'+ formId).serialize();

		    // Washing ${inx} out from VAR serializedString_withIndex
		    var fieldnameToRemoveIndex = [];
		    if ( fvConfig.flightJSPcbInfo.counter.personalPlan === 0 ) {        // Do Family-plan below, IF fvConfig.flightJSPcbInfo.counter.personalPlan === 0
		        fieldnameToRemoveIndex = [
		            'adultName', 'adultHKID', 'adultAgeRange', 'adultBeneficiary'
		            , 'childName', 'childHKID', 'childAgeRange', 'childBeneficiary'
		            , 'otherName', 'otherHKID', 'otherAgeRange', 'otherBeneficiary'
		        ];
		    } else {                                                            // Do Personal-plan below
		        fieldnameToRemoveIndex = [ 'personalName', 'personalHKID', 'personalAgeRange', 'personalBeneficiary' ];
		    }
		    var serializedString_withoutIndex = rmIndex_Serialized(
		        fvConfig.flightJSPcbInfo
		        , serializedString_withIndex
		        , fieldnameToRemoveIndex
		    );

		    var pagesAJAX = {
		        'joinus': function() {
		            $.ajax({
		                'type': "POST",
		                'url': pagesURL.conformPolicy,
		                'data': serializedString_withoutIndex,
		                'async': false,
		                'success': function(data) {
		                    if (data.result == 'success') {

		                        $('#loading-overlay').modal({ backdrop: 'static', keyboard: false });
		                        $('#errorMessages').hide();

		                        $('#' + formId).attr("action", pagesURL.confirmation);
		                        // Only fv.defaultSubmit is allowed here. Under "e.preventDefault();"
		                        fv.defaultSubmit(function(e) {      // Don't use general form.submit(function(e) {...}); etc...
		                            return true;
		                        });

		                    } else {
		                        // Exception, mostly not related
		                        $('#loading-overlay').modal('hide');
		                        $('#errorMessages').removeClass('hide');
		                        $('#errorMessages').html(data.errMsgs);

		                        console.log(data);
		                        fv.defaultSubmit(function(e) {
		                            return false;
		                        });
		                    }
		                }
		            });
		        }
		        , 'confirmation': function() {
		            $.ajax({
		                'type': "POST",
		                'url': pagesURL.conformPolicy,
		                'data': serializedString_withoutIndex,
		                'async': false,
		                'success': function(data) {
		                    if (data.result == 'success') {

		                        $('#loading-overlay').modal({ backdrop: 'static', keyboard: false });
		                        $('#errorMessages').hide();

		                        $('#' + formId).attr("action", pagesURL.confirmation);
		                        // Only fv.defaultSubmit is allowed here. Under "e.preventDefault();"
		                        fv.defaultSubmit(function(e) {      // Don't use general form.submit(function(e) {...}); etc...
		                            return true;
		                        });

		                    } else {
		                        // Exception, mostly not related
		                        $('#loading-overlay').modal('hide');
		                        $('#errorMessages').removeClass('hide');
		                        $('#errorMessages').html(data.errMsgs);

		                        console.log(data);
		                        fv.defaultSubmit(function(e) {
		                            return false;
		                        });
		                    }
		                }
		            });
		        }
		    };

		    var exportAJAXdata = {
		        'optIn1': ( $('#checkbox4').is(':checked') ? true : false )
		        , 'optIn2': ( $('#checkbox3').is(':checked') ? true : false )
		        , 'password': $('#Password').val()
		        , 'mobile': $('#inputMobileNo').val()
		        , 'name': $('#inputMobileNo').val()
		        , 'userName': $('#Username').val()
		        , 'email': $('#inputEmailId').val()
		        , 'ajax': "true"
		    };

		    // Defines the URL for below.
		    var pagesURL = {
		        'joinus': fvCfgs.flightJSPcbInfo.currentPage.contextPath + "/" + fvCfgs.flightJSPcbInfo.currentPage.lang + "/joinus"
		        , 'conformPolicy': fvCfgs.flightJSPcbInfo.currentPage.contextPath + "/" + fvCfgs.flightJSPcbInfo.currentPage.lang + "/flight-insurance/confirm-policy"
		        , 'confirmation': fvCfgs.flightJSPcbInfo.currentPage.contextPath + "/" + fvCfgs.flightJSPcbInfo.currentPage.lang + "/flight-insurance/confirmation"
		    };

		    // IF member account is going to be created ...
		    if ( flagForAccCreated ) {

		        // Core
		        $.ajax({
		            'type': 'POST',
		            'url': pagesURL.joinus,
		            'data': exportAJAXdata,
		            'async': false,
		            'success': function(res) {

		                $('#loading-overlay').modal({ backdrop: 'static', keyboard: false });
		                $('#errorMessages').hide();

		                var expectedServerRes = {
		                    'success': 			'success'
		                    , 'dupUsername': 	'This username already in use, please try again'
		                    , 'dupEmailMob': 	'email address and mobile no. already registered'
		                };
		                switch (res) {
		                    case expectedServerRes.success:
		                        pagesAJAX.joinus();
		                        break;
		                    case expectedServerRes.dupUsername:
		                        fv
		                            .updateMessage('userName', 'alreadyRegistered', getBundle(getBundleLanguage, 'member.registration.fail.username.registered'))
		                            .updateStatus('userName', 'INVALID', 'alreadyRegistered');
		                        $('#loading-overlay').modal('hide');
		                        break;
		                    case expectedServerRes.dupEmailMob:
		                        fv
		                            .updateMessage('emailAddress', 'alreadyRegistered', getBundle(getBundleLanguage, 'member.registration.fail.emailMobile.registered'))
		                            .updateStatus('emailAddress', 'INVALID', 'alreadyRegistered');
		                        fv
		                            .updateMessage('mobileNo', 'alreadyRegistered', getBundle(getBundleLanguage, 'member.registration.fail.emailMobile.registered'))
		                            .updateStatus('mobileNo', 'INVALID', 'alreadyRegistered');
		                        $('#loading-overlay').modal('hide');
		                        break;
		                    default:
		                        $('#loading-overlay').modal('hide');
		                        $(".error-hide").css("display", "block");
		                        $('.error-hide').html(res);
		                }
		            },
		            'error': function(xhr, status, error) {
		                $('#loading-overlay').modal('hide');
		            }
		        });

		    } else {
		        pagesAJAX.confirmation();
		    }
		};
		// Trigger the FormValidation.io library here.
		$('#' + formId).formValidation(argCfg)
			.on('success.form.fv', function(e, data) {
				fv_successForm_flightCare({
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
					//fwdUtility.ux.scrollToElement( $firstInvalidField.id );
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
