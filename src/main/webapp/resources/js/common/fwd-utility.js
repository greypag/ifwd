var fwdUtility = (function(){

	/*
	 * Format Currency
	 *
	 * @method formatCurreny
	 * @param {String/Integer/Float} a number value
	 * @param {Integer} n number of decimal no. Default to be 2.
	 * @return {Float} Returns the comma seperated currency amount
	 */
	var _formatCurrency = function(a, n){
		var _decimal = (typeof(n)==='number')?n:2;
		return parseFloat(a).toFixed(_decimal).replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	};

	/*
	 * Format Float
	 *
	 * @method formatFloat
	 * @param {String/Integer/Float} a number value
	 * @param {Integer} n number of decimal no. Default to be 2.
	 * @return {Float} Returns the comma seperated float amount
	 */
	var _formatFloat = function(a, n){
		var _decimal = (typeof(n)==='number')?n:2;
		return (isNaN(parseFloat(a)))?0:parseFloat(a).toFixed(_decimal);
	};
	//
	// /*
	//  * Process each element in an object with callback function
	//  *
	//  * @method forEachObject
	//  * @param {Object} obj Object to be loop through
	//  * @param {Function} cb Callback function for each object key pairs
	//  * @return {Object} Return a processed object
	//  */
	// function forEachObject(obj, cb){
	// 	// To Be
	// }
	//
	// /*
	//  * Process each item in an array with callback function
	//  *
	//  * @method forEachArry
	//  * @param {Array} Array to be loop through
	//  * @param {Function} cb Callback function for each array item
	//  * @return {Array} Return a processed array
	//  */
	// function forEachArray(arr, cb){
	// 	// To Be
	// }

	var _floatingBox = function () {
		/* scrolling code starts */
		var floatingbox = $('.floatingbox');

	    if (floatingbox[0]){
	    	var floatingboxY = floatingbox.offset().top,
	        wrapboxY = $("#quote-wrap").offset().top;
	        var topMargin = 40;

	        $(window).on('scroll', function(event) {
	        	if ($("#quote-wrap").height() > $(".floatingbox").height()){
	        		var scrollTop = $(window).scrollTop();
	        		var wrapboxRY = wrapboxY+$("#quote-wrap").height();
	        		var floatingboxRY = scrollTop+$(".floatingbox").height()+topMargin;

	        		if (wrapboxRY > floatingboxRY){
	        			floatingbox.stop(false).animate({
	                        top: scrollTop < floatingboxY ? 0 : scrollTop - floatingboxY + topMargin
	                    }, 100);
	        		}else{
	        			if (floatingboxRY > wrapboxRY){
	                        floatingbox.css("top", $("#quote-wrap").height()-$(".floatingbox").height())
	                    }
	        		}
	        	}
	        });
	    }
    	/* scrolling code ends */
	};

	var _dateDiffInDays = function(a, b) {
		// Discard the time and time-zone information.
		var diffDays = (b - a) / 1000 / 60 / 60 / 24;
		return diffDays + 1;
	};

	var _dateDiffInDaysFromNow = function(dat){
	    var nowTemp = new Date();
	    var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);
	    return _dateDiffInDays(now, dat);
	};

	var _temp_flightCare = function() {



		// 35 day
		var dob_42_date = new Date();
		dob_42_date.setDate(dob_42_date.getDate()-43);

		// 18 year ago date
		var dob_end_date = new Date();
		dob_end_date.setFullYear(dob_end_date.getFullYear()-18);
		// this year
		var dob_end_date_this_year = new Date();
		// this year - 90 days
		var dob_end_date_this_year_plus_90 = new Date();
		dob_end_date_this_year_plus_90.setDate(dob_end_date_this_year_plus_90.getDate() + 90);


		// 65 year ago date
		var dob_65_date = new Date();
		dob_65_date.setFullYear(dob_end_date_this_year.getFullYear() - 65);
		dob_65_date.setDate(dob_65_date.getDate() + 1);

		// 12 year ago date
		var dob_12_date = new Date();
		dob_12_date.setFullYear(dob_12_date.getFullYear() - 12);
		dob_12_date.setDate(dob_12_date.getDate() + 90);

		// 10 year and 9 month ago date
		var dob_10_date = new Date();
		dob_10_date.setFullYear(dob_10_date.getFullYear() - 11);
		dob_10_date.setDate(dob_10_date.getDate() + 90);

		// 86 year ago date
		var dob_start_date = new Date();
		dob_start_date.setFullYear(dob_start_date.getFullYear()-86);
		dob_start_date.setDate(dob_start_date.getDate()+1);

		// 71 year ago date
		var dob_70_date = new Date();
		dob_70_date.setFullYear(dob_70_date.getFullYear()-71);
		dob_70_date.setDate(dob_70_date.getDate());

		// 70 year ago date for Annual Travel
		var dob_69_date = new Date();
		dob_69_date.setFullYear(dob_69_date.getFullYear()-70);
		//console.log(dob_69_date);
		dob_69_date.setDate(dob_69_date.getDate());

		//Start at 1900
		/*var dob_1900_date = new Date();
		dob_1900_date.setFullYear(1900,0,1);*/

		//one day before 69 year old date
		var dob_70_99_date = new Date();
		dob_70_99_date.setFullYear(dob_70_99_date.getFullYear()-69);
		dob_70_99_date.setDate(dob_70_99_date.getDate() + 1);

		// birthday datepicker, only 18-85 year-old users can buy the insurance
		$('#input_dob').datepicker({
			startView: "decade",
			autoclose: true,
			format: "dd-mm-yyyy",
			startDate: dob_start_date,
			endDate: dob_end_date
			/*language: getBundleLanguage*/
		}).on('changeDate', function (ev) {
			$("#freeFlightForm").val($("#input_dob").datepicker('getFormattedDate'));
			$('#freeFlightForm').formValidation('revalidateField', "applicantDob");
			var selected = 2;
			if(ev.date != undefined) {
				if(ev.date.valueOf() < dob_end_date.valueOf() && ev.date.valueOf() > dob_70_date.valueOf()){
					selected = 2;
				}else{
					selected = 3;
				}
				if($("#selectAgeRange1").length > 0){
					$("#selectAgeRange1").val(selected);
				}else if($("#insureDob1").length > 0){
					$("#insureDob1").val($("#applicantDob").val());
				}
			}
			//$("#dobInvalid").html("");
			//$("#input_dob").removeClass("invalid-field");
		});
		//$('#input_dob').datepicker('setDate', dob_end_date);

		$("#txtStartDateDesk").blur(function() {
			var dateDiff = _dateDiffInDaysFromNow(checkin.datepicker("getDate").valueOf());
		    if(dateDiff < 0){ this.focus();return false; }
		});
		$("#txtEndDateDesk").blur(function() {
			var dateDiff = _dateDiffInDaysFromNow(checkout.datepicker("getDate").valueOf());
		    if(dateDiff < 0){ this.focus();return false; }
		});

		$("#txtStartDateMob").blur(function() {
			var dateDiff = _dateDiffInDaysFromNow(checkin2.datepicker("getDate").valueOf());
		    if(dateDiff < 0){ this.focus();return false; }
		});
		$("#txtEndDateMob").blur(function() {
			var dateDiff = _dateDiffInDaysFromNow(checkout2.datepicker("getDate").valueOf());
		    if(dateDiff < 0){ this.focus();return false; }
		});

		$("#txtStartDateBtm").blur(function() {
			var dateDiff = _dateDiffInDaysFromNow(checkin3.datepicker("getDate").valueOf());
		    if(dateDiff < 0){ this.focus();return false; }
		});
		$("#txtEndDateBtm").blur(function() {
			var dateDiff = _dateDiffInDaysFromNow(checkout3.datepicker("getDate").valueOf());
		    if(dateDiff < 0){ this.focus();return false; }
		});
	};

	var _temp_flightCare_auth = function() {
		console.log('fwdUtility.temp.flightCareAuth() is loaded.');
		function activateUserAccountJoinUs() {
		    $('#loading-overlay').modal({backdrop: 'static',keyboard: false});

		    setTimeout(function(){

				//html change, change the submit input type to button, add a onclick function
			    //html change, added some error html note for user, so they know if the user name and email is not success

			    //basic logic(how it works)
			    /*
			    1. if no username or password is filled, direct submit the form
			    2. if username field is filled, call the create user ajax and post data
			    3. if the data has something wrong, return and show msg.
			    4. if the data is correct, user created and will continue to submit the form.
			    5, If user is created and the normal form data is missing,
			       the user create field html will hide, and the vaule will erase so it wont trigger the create user function again.
			    */

			    /*name = document.getElementById("Username").value;
			    password = document.getElementById("Password").value;
			    password2 = document.getElementById("Confirm-Password").value;*/

			    name = $("#Username").val();
			    password = $("#Password").val();
			    password2 = $("#Confirm-Password").val();

			    $("#UsernameError").text("");
			    $("#PasswordError").text("");
			    $("#Confirm-PasswordError").text("");
			    $("#Username").removeClass("invalid-field");
			    $("#Password").removeClass("invalid-field");
			    $("#Confirm-Password").removeClass("invalid-field");

			    //first error element
			    var firstErrorElementId="";

			    if(fPlanValid()){
				    if(name == "" && password == "" && password2 == ""){
				        $('#freeFlightForm').submit()
				    }else{

				    	if(name != "" && password != "" && password2 != ""){
				    		$('#chk1').html('');
				            $('#chk2').html('');

				            $('#dobInvalid').html('');

				    		validateForm = true;
				    		if (!checkMembership("Username")){
				    			if(firstErrorElementId==""){
				                    firstErrorElementId="Username";
				                }
				    			validateForm = false;
				    		}
				    		if (!checkMembership("Password")){
				    			if(firstErrorElementId==""){
				                    firstErrorElementId="Password";
				                }
				    			validateForm = false;
				    		}
				    		if (!checkMembership("Confirm-Password")){
				    			if(firstErrorElementId==""){
				                    firstErrorElementId="Confirm-Password";
				                }
				                validateForm = false;
				    		}
				    		var applicantDob = $("#applicantDob").val();
				            if (applicantDob.trim() == "") {

				                document.getElementById("dobInvalid").innerHTML = getBundle(getBundleLanguage, "applicant.dob.notNull.message");
				                $("#input_dob").addClass("invalid-field");
				                if(firstErrorElementId==""){
				                    firstErrorElementId="applicantDob";
				                }
				                validateForm = false;
				            }
				    		if (!validateMobile('inputMobileNo','mobileNoInvalid')){
				    			if(firstErrorElementId==""){
				                    firstErrorElementId="inputMobileNo";
				                }
				                validateForm = false;
				    		}
				    		if (!validateEmail('inputEmailId','emailid')){
				    			if(firstErrorElementId==""){
				                    firstErrorElementId="inputEmailId";
				                }
				                validateForm = false;
				    		}



				    		if(firstErrorElementId!=""){
				    			$('#loading-overlay').modal('hide');
				                scrollToElement(firstErrorElementId);
				            }

				        	if (!validateForm){
				        		return;
				        	}

				    		optIn1 = "false"
				   	        optIn2 = "false"
				   	        if($('#checkbox4').is(':checked')){
				   	            optIn2 = "true";
				   	        }
				   	        if($('#checkbox3').is(':checked')){
				   	            optIn1 = "true";
				   	        }
				   	        password = document.getElementById("Password").value;
				   	        mobile = document.getElementById("inputMobileNo").value;
				   	        name = document.getElementById("inputFullName").value;
				   	        userName = document.getElementById("Username").value;
				   	        email = document.getElementById("inputEmailId").value;

				   	       $.ajax({
		                        type : 'POST',
		                        url : '<%=request.getContextPath()%>/${language}/joinus',
		                        data : { optIn1: optIn1, optIn2: optIn2, password: password, mobile: mobile, name: name, userName: userName, email: email, ajax: "true" },
		                        async : false,
		                        success : function(data) {

		                            if (data == 'success') {
		                                 $(".error-hide").css("display", "none");
		                                 $(".membership-wrap").css("display", "none");
		                                 document.getElementById("Username").value = "";
		                                 document.getElementById("Password").value = "";
		                                 document.getElementById("Confirm-Password").value = "";

		                                 $("#link-error").click();
		                              perventRedirect=false;
		                                 $('#freeFlightForm').submit()
		                                return;
		                            } else {
		                            	console.log(data);
		                                $("#link-error").click();
		                                $(".error-hide").css("display", "block");
		                                $('#loading-overlay').modal('hide');
		                        	if (data == 'This username already in use, please try again') {
		                        	    $('.error-hide').html('<fmt:message key="member.registration.fail.username.registered" bundle="${msg}" />');
		                        	} else if (data == 'email address and mobile no. already registered') {
		                        	    $('.error-hide').html('<fmt:message key="member.registration.fail.emailMobile.registered" bundle="${msg}" />');
		                        	} else {
		                        	    $('.error-hide').html(data);
		                        	}
		                        	firstErrorElementId="error_hide";
		                                return;
		                            }
		                        },
		                        error : function(xhr, status, error) {
		                            $('#loading-overlay').modal('hide');
		                        }
				   	        });
				    	}else{
				    		// not all the fields filled
				    		if (name == ""){
				    			$('#UsernameError').text(isValidUsername($("#Username").val().trim()));
				    			$("#Username").addClass("invalid-field");
				    			if(firstErrorElementId==""){
				                    firstErrorElementId="Username";
				                }
				    		}else{
				    			if (!checkMembership("Username")){
				                    if(firstErrorElementId==""){
				                        firstErrorElementId="Username";
				                    }
				                }
				    		}

				    		if (password == ""){
				    			$('#PasswordError').text(isValidPassword($("#Password").val().trim()));
				    			$("#Password").addClass("invalid-field");
				                if(firstErrorElementId==""){
				                    firstErrorElementId="Password";
				                }
				    		}else{
				    			if (!checkMembership("Password")){
				                    if(firstErrorElementId==""){
				                        firstErrorElementId="Password";
				                    }
				                }
				    		}


				    		if (password2 == ""){
				    			$('#Confirm-PasswordError').text(passMatch($('#Password').val(), $("#Confirm-Password").val().trim()));
				    			$("#Confirm-Password").addClass("invalid-field");
				                if(firstErrorElementId==""){
				                    firstErrorElementId="Confirm-Password";
				                }
				    		}else{
				    			if (!checkMembership("Confirm-Password")){
				                    if(firstErrorElementId==""){
				                        firstErrorElementId="Confirm-Password";
				                    }
				                }
				    		}
				    	}
				    }
			    }
			    if(firstErrorElementId!=""){
			    	$('#loading-overlay').modal('hide');
			        scrollToElement(firstErrorElementId);
			    }

			    return;
		    }, 500);
		}
	};

	var _temp_flightCare_activate = function(arg) {
		console.log('fwdUtility.temp.flightCareActivate() is loaded.');
		function activateUserAccountJoinUs() {
			perventRedirect=false;
		    $('#loading-overlay').modal({backdrop: 'static',keyboard: false});

		    setTimeout(function(){
		    	if(fPlanValid()){
		   	    	$('#'.arg.formId).submit();
		    	}
		    }, 500);
		}
	};

	var _temp_flightCare_benefitiary_isActive = function() {
		console.log('fwdUtility.temp.flightCareBenefitiaryIsActive() is loaded.');
		/* For Benefitiary Div active and Inactive */
		function activeDiv(id, selected, beneFullName, beneHkId) {
		    var selectedValue = $('#' + selected).val();
		    if (id.indexOf('personal') > -1) {
		        activeDeactive(selectedValue, id, beneFullName, beneHkId);
		    }
		    if (id.indexOf('adult') > -1) {
		        activeDeactive(selectedValue, id, beneFullName, beneHkId);
		    }
		    if (id.indexOf('child') > -1) {
		        activeDeactive(selectedValue, id, beneFullName, beneHkId);
		    }
		    if (id.indexOf('other') > -1) {
		        activeDeactive(selectedValue, id, beneFullName, beneHkId);
		    }
		}
		function activeDeactive(selectedValue, id, beneFullName, beneHkId) {
		    if (selectedValue == "SE") {
		        $('#' + beneFullName).text('');
		        $('#' + beneHkId).text('');
		        $('#' + beneFullName).val('');
		        $('#' + beneHkId).val('');

		        $('#' + id).addClass('hide');
		        $('#' + id + 'b').addClass('hide');
		        $('#' + id + 'c').addClass('hide');

		    } else {
		        $('#' + id).removeClass('hide');
		        $('#' + id + 'b').removeClass('hide');
		        $('#' + id + 'c').removeClass('hide');

		    }
		}
		/* END- For Benefitiary Dive active and Inactive */
	};

	var _pages_flightCare_userLoginAjax = function() {
		console.log('fwdUtility.temp.flightCareUserLoginAjax() is loaded.');
		/* UserLogin ajax function */
		var _userLoginFnc = function() {

		    $('#ajax-loading').show();
		    /* var a=validUser(); */
		    /*
				if(a==true)
				{ */

		    console.log($("#popUploginform input").serialize());
		    $.ajax({
		        type: "POST",
		        url: "<%=request.getContextPath()%>/userLogin",
		        data: $("#popUploginform input").serialize(),
		        async: false,
		        success: function(data) {
		            $('#ajax-loading').hide();
		            if (data == 'success') {
		                window.location.reload();
		                /* window.location.href = "getAccByUsernaneAndPassword"; */
		            } else if (data == 'fail') {
		                console.log(data);
		                $('#ajax-loading').hide();
		                $('#login-err-msg').show();
		                $('#login-err-msg').html(getBundle(getBundleLanguage, "member.login.fail.first"));
		            }

		        }
		    });
		    /* } */
		    return false;
		}
		/* Function for create flight policy */

		var flight_click = false;

		var _createFlightFnc = function(form) {
		    var flag = false;

		    if (!flight_click) {
		        flight_click = true;
		        console.log($("#freeFlightForm").serialize());
		        $.ajax({
		            type: "POST",
		            url: "<%=request.getContextPath()%>/${language}/flight-insurance/confirm-policy",
		            data: $("#freeFlightForm").serialize(),
		            async: false,
		            success: function(data) {
		                var result = data['result'];
		                var errMsg = data['errMsgs']
		                flight_click = false;
		                if (result == 'success') {
		                    $('#errorMessages').hide();
		                    flag = true;
		                    form.action = "<%=request.getContextPath()%>/${language}/flight-insurance/confirmation";
		                } else {
		                    console.log(data);
		                    flag = false;
		                    $('#errorMessages').removeClass('hide');
		                    $('#errorMessages').html(errMsg);
		                }
		            }
		        });
		    } else {
		        flight_click = false;
		        flag = false;
		    }

		    if (flag) {
		        $('#loading-overlay').modal({backdrop: 'static', keyboard: false})
		    } else {
		        $('#loading-overlay').modal('hide');
		    }
		    return flag;
		};

		return {
			'userLoginFnc': 		_userLoginFnc
			, 'createFlightFnc': 	_createFlightFnc
		};
	}();

	// var _pages_flightCare_fncCheckBoxTooltip = function(tp) {
	// 	var _mod = function(single_tp) {
	// 		console.log(single_tp);
	// 		$(single_tp).prop('checked')
	// 	};
	// 	// var _change_listener = function(cb, tooltip, single_selector) {
	// 	// 	$(single_selector).change(function() {
	// 	// 		cb(tooltip);
	// 	// 	});
	// 	// };
	// 	// _change_listener( _mod, tp, '#checkbox3' );
	// 	var _change_listener2 = function(cb, single_selector) {
	// 		$(single_selector).change(function() {
	// 			cb();
	// 		});
	// 	};
	// 	// return (function(_tooltip){
	// 	// 	console.log(tooltip);
	//
	// 	// });
	// };

	return {
		'counter': {
			'dateDiffInDaysFromNow': _dateDiffInDaysFromNow
			, 'dateDiffInDays':		_dateDiffInDays
		}
		, 'ux': {
			'floatingBox':			_floatingBox
		}
		, 'temp': {
			'flightCare':						_temp_flightCare
			, 'flightCareAuth':					_temp_flightCare_auth
			, 'flightCareActivate':				_temp_flightCare_activate
			, 'flightCareBenefitiaryIsActive':	_temp_flightCare_benefitiary_isActive
		}
		, 'pages': {
			'flightCare': {
				'userLoginAjax': 				_pages_flightCare_userLoginAjax
				// , 'fncCheckBoxTooltip':			_pages_flightCare_fncCheckBoxTooltip
			}
			, 'travelCare': {}

		}
		// , 'data': {} // role familiar with lodash, underscore, but some are dedicated to FWD
	};

})();
