var fwdUtility = (function() {

	/*
	 * Format Currency
	 *
	 * @method formatCurreny
	 * @param {String/Integer/Float} a number value
	 * @param {Integer} n number of decimal no. Default to be 2.
	 * @return {Float} Returns the comma seperated currency amount
	 */
	var _formatCurrency = function(a, n) {
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
	var _formatFloat = function(a, n) {
		var _decimal = (typeof(n)==='number')?n:2;
		return (isNaN(parseFloat(a)))?0:parseFloat(a).toFixed(_decimal);
	};

	// /*
	//  * Process each item in an array with callback function
	//  *
	//  * @method forEachArry
	//  * @param {Array} Array to be loop through
	//  * @param {Function} cb Callback function for each array item
	//  * @return {Array} Return a processed array
	//  */
	// function forEachArray(arr, cb) {
	// 	// To Be
	// }

	var _scrollToElement = function(elementId) {
		$('html, body').animate({
	        'scrollTop': $("#"+elementId).offset().top - 100
	    }, 1000);
	};

	var _floatingBox = function () {
		var floatingbox = $('.floatingbox');

	    if (floatingbox[0]) {
	    	var floatingboxY = floatingbox.offset().top,
	        wrapboxY = $("#quote-wrap").offset().top;
	        var topMargin = 40;

	        $(window).on('scroll', function(event) {
	        	if ($("#quote-wrap").height() > $(".floatingbox").height()) {
	        		var scrollTop = $(window).scrollTop();
	        		var wrapboxRY = wrapboxY+$("#quote-wrap").height();
	        		var floatingboxRY = scrollTop+$(".floatingbox").height()+topMargin;

	        		if (wrapboxRY > floatingboxRY) {
	        			floatingbox.stop(false).animate({
	                        top: scrollTop < floatingboxY ? 0 : scrollTop - floatingboxY + topMargin
	                    }, 100);
	        		} else {
	        			if (floatingboxRY > wrapboxRY) {
	                        floatingbox.css("top", $("#quote-wrap").height()-$(".floatingbox").height())
	                    }
	        		}
	        	}
	        });
	    }
	};

	var _dateDiffInDays = function(a, b) {
		// Discard the time and time-zone information.
		var diffDays = (b - a) / 1000 / 60 / 60 / 24;
		return diffDays + 1;
	};

	var _dateDiffInDaysFromNow = function(dat) {
	    var nowTemp = new Date();
	    var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);
	    return _dateDiffInDays(now, dat);
	};

	var _isAccountNumeric = function(num) {
	    return !isNaN(num)
	};

	var _isValidUsername = function(el) {
		var atLeastOneCharacterReg = /^[A-Za-z]+$/;
		var plan_user = /^(([a-zA-Z0-9]+)|(([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-\_]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)))$/;
		if (el.trim() == "") {
			return getBundle(getBundleLanguage, "user.username.empty.message");

			valid = false;

		} else if (_isAccountNumeric(el)) {
			return getBundle(getBundleLanguage, "user.username.notValid.message");
		} else if (!plan_user.test(el)) {
			return getBundle(getBundleLanguage, "user.username.notValid.message");
		} else if (el.length < 6 || el.length > 50) {
			return getBundle(getBundleLanguage, "user.username.length.message");
		} else {
			return true;
		}
	};

	var _isValidPassword = function(el) {
		var passwordPattern = "[a-zA-Z0-9]{8,}";
		var passwordPattern2 = "[A-Z]";
		var passwordPattern3 = "[a-z]";
		var passwordPattern4 = "[0-9]";
		var specialChar = "\\W";
		var rg = new RegExp(passwordPattern);
		var rg2 = new RegExp(passwordPattern2);
		var rg3 = new RegExp(passwordPattern3);
		var rg4 = new RegExp(passwordPattern4);
		var spChar = new RegExp(specialChar);

		if (el.trim() == "") {
			message  = getBundle(getBundleLanguage, "user.password.notNull.message");
			return message;
		} else if (!rg.test(el)) {
			message = getBundle(getBundleLanguage, "user.password.validate.message");
			return message;
		} else if (!rg2.test(el)) {
			message = getBundle(getBundleLanguage, "user.password.validate.message");
			return message;
		} else if (!rg3.test(el)) {
			message = getBundle(getBundleLanguage, "user.password.validate.message");
			return message;
		} else if (!rg4.test(el)) {
			message = getBundle(getBundleLanguage, "user.password.validate.message");
			return message;
		} else if (spChar.test(el)) {
			message = getBundle(getBundleLanguage, "user.password.validate.message");
			return message;
		}
		else {
			return true;
		}
	};

	var _checkMembership = function(field) {
		result = true;
		return result;
	};

	var _temp_flightCare = function() {
		// May go to the JS revamp phase 2

		// $("#txtStartDateDesk").blur(function() {
		// 	var dateDiff = _dateDiffInDaysFromNow(checkin.datepicker("getDate").valueOf());
		//     if(dateDiff < 0) { this.focus();return false; }
		// });
		// $("#txtEndDateDesk").blur(function() {
		// 	var dateDiff = _dateDiffInDaysFromNow(checkout.datepicker("getDate").valueOf());
		//     if(dateDiff < 0) { this.focus();return false; }
		// });
		//
		// $("#txtStartDateMob").blur(function() {
		// 	var dateDiff = _dateDiffInDaysFromNow(checkin2.datepicker("getDate").valueOf());
		//     if(dateDiff < 0) { this.focus();return false; }
		// });
		// $("#txtEndDateMob").blur(function() {
		// 	var dateDiff = _dateDiffInDaysFromNow(checkout2.datepicker("getDate").valueOf());
		//     if(dateDiff < 0) { this.focus();return false; }
		// });
		//
		// $("#txtStartDateBtm").blur(function() {
		// 	var dateDiff = _dateDiffInDaysFromNow(checkin3.datepicker("getDate").valueOf());
		//     if(dateDiff < 0) { this.focus();return false; }
		// });
		// $("#txtEndDateBtm").blur(function() {
		// 	var dateDiff = _dateDiffInDaysFromNow(checkout3.datepicker("getDate").valueOf());
		//     if(dateDiff < 0) { this.focus();return false; }
		// });
	};

	var _pages_activateUserAccountJoinUs_auth = function() {
		console.log('_pages_activateUserAccountJoinUs_auth() is loaded.');

		$('#loading-overlay').modal({backdrop: 'static',keyboard: false});

		setTimeout(function() {

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

			// if ( fwdUtility.pages.flightCare.fPlanValid() ) {
			if ( _pages_fPlanValid() ) {
				console.log( (name == "" && password == "" && password2 == "") );
				if (name == "" && password == "" && password2 == "") {
					$('#freeFlightForm').submit();
					console.log('$(\'#freeFlightForm\').submit();');
				} else {
					if(name != "" && password != "" && password2 != "") {
						$('#chk1').html('');
						$('#chk2').html('');

						$('#dobInvalid').html('');

						// validateForm = false;
						// console.log(validateForm);
						validateForm = true;

						// if ( !_checkMembership("Username") ) {
						// 	if(firstErrorElementId=="") {
						// 		firstErrorElementId="Username";
						// 	}
						// 	validateForm = false;
						// }
						// if ( !_checkMembership("Password") ) {
						// 	if(firstErrorElementId=="") {
						// 		firstErrorElementId="Password";
						// 	}
						// 	validateForm = false;
						// }
						// if ( !_checkMembership("Confirm-Password") ) {
						// 	if(firstErrorElementId=="") {
						// 		firstErrorElementId="Confirm-Password";
						// 	}
						// 	validateForm = false;
						// }
						var applicantDob = $("#applicantDob").val();

						if(firstErrorElementId!="") {
							$('#loading-overlay').modal('hide');
							_scrollToElement(firstErrorElementId);
						}

						if ( !validateForm) {
							return;
						}

						optIn1 = "false"
						optIn2 = "false"
						if($('#checkbox4').is(':checked')) {
							optIn2 = "true";
						}
						if($('#checkbox3').is(':checked')) {
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
					} else {
						// not all the fields filled
						if (name == "") {
							$('#UsernameError').text(_isValidUsername($("#Username").val().trim()));
							$("#Username").addClass("invalid-field");
							if(firstErrorElementId=="") {
								firstErrorElementId="Username";
							}
						} else {
							if ( !_checkMembership("Username")) {
								if(firstErrorElementId=="") {
									firstErrorElementId="Username";
								}
							}
						}

						if (password == "") {
							$('#PasswordError').text(_isValidPassword($("#Password").val().trim()));
							$("#Password").addClass("invalid-field");
							if(firstErrorElementId=="") {
								firstErrorElementId="Password";
							}
						} else {
							if ( !_checkMembership("Password")) {
								if(firstErrorElementId=="") {
									firstErrorElementId="Password";
								}
							}
						}
						if (password2 == "") {
							$('#Confirm-PasswordError').text(passMatch($('#Password').val(), $("#Confirm-Password").val().trim()));
							$("#Confirm-Password").addClass("invalid-field");
							if(firstErrorElementId=="") {
								firstErrorElementId="Confirm-Password";
							}
						} else {
							if ( !_checkMembership("Confirm-Password")) {
								if(firstErrorElementId=="") {
									firstErrorElementId="Confirm-Password";
								}
							}
						}
					}
				}
			}
			if (firstErrorElementId != "") {
				$('#loading-overlay').modal('hide');
				_scrollToElement(firstErrorElementId);
			}

			return;
		}, 500);
	};

	var _pages_fPlanValid = function() {
		/* flight plan details your details validation */
		var flag=true;

		//first error element
		var firstErrorElementId="";

		// bug fix - avoid unnecessary validation if the user already login
		var isLogin = document.getElementById("isLogin").value;
		if ( !isLogin) {
		   if( verifyUserBookingRegistration() === false)
			   flag = false;
		}
		if (firstErrorElementId!="") {
			_scrollToElement(firstErrorElementId);
		}
		if( !flag) {
			$('#loading-overlay').modal('hide');
		}

		return flag;

	};

	var _pages_activateUserAccountJoinUs_non_auth = function(arg) {
		console.log('_pages_activateUserAccountJoinUs_non_auth() is loaded.');
		perventRedirect = false;
		$('#loading-overlay').modal({backdrop: 'static',keyboard: false});
		setTimeout(function() {
			if ( _pages_fPlanValid() ) {
				$('#' + arg.formId).submit();
			}
		}, 500);
	};

	var _temp_flightCare_benefitiary_isActive = function() {
		console.log('fwdUtility.temp.flightCareBenefitiaryIsActive() is loaded.');
		/* For Benefitiary Div active and Inactive */
		function activeDiv(id, selected, beneFullName, beneHkId) {
			console.log('fwdUtility.temp.flightCareBenefitiaryIsActive().activeDiv is loaded.');
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
			console.log('fwdUtility.temp.flightCareBenefitiaryIsActive().activeDeactive is loaded.');
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

	// var _pages_flightCare_userLoginAjax = function(contextPath) {
	// 	console.log('fwdUtility.temp.flightCareUserLoginAjax() is loaded.');
	// 	/* UserLogin ajax function */
	// 	var _userLoginFnc = function() {
	//
	// 	    $('#ajax-loading').show();
	// 	    console.log($("#popUploginform input").serialize());
	// 	    $.ajax({
	// 	        type: "POST",
	// 	        url: contextPath + "/userLogin",
	// 	        data: $("#popUploginform input").serialize(),
	// 	        async: false,
	// 	        success: function(data) {
	// 	            $('#ajax-loading').hide();
	// 	            if (data == 'success') {
	// 	                window.location.reload();
	// 	                /* window.location.href = "getAccByUsernaneAndPassword"; */
	// 	            } else if (data == 'fail') {
	// 	                console.log(data);
	// 	                $('#ajax-loading').hide();
	// 	                $('#login-err-msg').show();
	// 	                $('#login-err-msg').html(getBundle(getBundleLanguage, "member.login.fail.first"));
	// 	            }
	//
	// 	        }
	// 	    });
	// 	    return false;
	// 	}
	// 	/* Function for create flight policy */
	//
	// 	var flight_click = false;
	//
	// 	var _createFlightFnc = function(form) {
	// 	    var flag = false;
	//
	// 	    if ( !flight_click) {
	// 	        flight_click = true;
	// 	        $.ajax({
	// 	            type: "POST",
	// 	            url: contextPath + "/${language}/flight-insurance/confirm-policy",
	// 	            data: $("#freeFlightForm").serialize(),
	// 	            async: false,
	// 	            success: function(data) {
	// 	                var result = data['result'];
	// 	                var errMsg = data['errMsgs']
	// 	                flight_click = false;
	// 	                if (result == 'success') {
	// 	                    $('#errorMessages').hide();
	// 	                    flag = true;
	// 	                    form.action = contextPath + "/${language}/flight-insurance/confirmation";
	// 	                } else {
	// 	                    flag = false;
	// 	                    $('#errorMessages').removeClass('hide');
	// 	                    $('#errorMessages').html(errMsg);
	// 	                }
	// 	            }
	// 	        });
	// 	    } else {
	// 	        flight_click = false;
	// 	        flag = false;
	// 	    }
	//
	// 	    if (flag) {
	// 	        $('#loading-overlay').modal({backdrop: 'static', keyboard: false});
	// 	    } else {
	// 	        $('#loading-overlay').modal('hide');
	// 	    }
	// 	    return flag;
	// 	};
	//
	// 	return {
	// 		'userLoginFnc': 		_userLoginFnc
	// 		, 'createFlightFnc': 	_createFlightFnc
	// 	};
	// }();

	var _sort_arrObj_byProp = function(arrayElem, propInObj) {
		var result = [];
		result = Object.values(arrayElem).sort(function(a,b) {
			return (a[propInObj] < b[propInObj]) ? 1 : ((b[propInObj] < a[propInObj]) ? -1 : 0);
		});
		return result;
	};

	return {
		'counter': {
			'dateDiffInDaysFromNow':	_dateDiffInDaysFromNow
			, 'dateDiffInDays':			_dateDiffInDays
		}
		, 'sort': {
			'arrObj': {
				'byProperty':			_sort_arrObj_byProp
			}
		}
		, 'pages': {
			'flightCare': {
				// 'userLoginAjax': 						_pages_flightCare_userLoginAjax
				'activateUserAccountJoinUs_non_auth':	_pages_activateUserAccountJoinUs_non_auth
				, 'activateUserAccountJoinUs_auth':		_pages_activateUserAccountJoinUs_auth
				, 'fPlanValid':							_pages_fPlanValid
				// , 'fncCheckBoxTooltip':			_pages_flightCare_fncCheckBoxTooltip
			}
			, 'travelCare': {}

		}
		, 'temp': {
			'flightCare':						_temp_flightCare
			, 'flightCareBenefitiaryIsActive':	_temp_flightCare_benefitiary_isActive
		}
		, 'ux': {
			'floatingBox':				_floatingBox
			, 'scrollToElement':		_scrollToElement
		}
		// , 'data': {} // role familiar with lodash, underscore, but some are dedicated to FWD
	};

})();

// --------------------  Temp for supplement functions  --------------------------

function validUser(formID) {
	var flag = true;
	var userName = $("#"+formID+" #headerUserName").val();//document.getElementById("headerUserName").value;
	var password = $("#"+formID+" #headerPassword").val();//document.getElementById("headerPassword").value;
	//document.getElementById("errUserName").innerHTML = "";
	//document.getElementById("errPass").innerHTML = "";
	$("#"+formID+" #errUserName").html("");
	$("#"+formID+" #errPass").html("");

	if ($.trim(password) == "" || $.trim(password) == $("#"+formID+" #headerPassword").attr("placeholder"))
	{
		$("#"+formID+" #headerPassword").addClass("invalid-field");
		$("#"+formID+" #errPass").html(getBundle(getBundleLanguage, "user.password.notNull.message"));
		$("#"+formID+" #errPass").attr("style","color: red;");
		flag = false;
	}
	if ($.trim(userName) == "" || $.trim(userName) == $("#"+formID+" #headerUserName").attr("placeholder")) {
		$("#"+formID+" #headerUserName").addClass("invalid-field");
		$("#"+formID+" #errUserName").html(getBundle(getBundleLanguage, "user.username.empty.message"));
		$("#"+formID+" #errUserName").attr("style","color: red;");
		flag = false;
	}
	return flag;
};
