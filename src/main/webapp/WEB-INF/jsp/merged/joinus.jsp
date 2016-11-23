<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />

<script src="<%=request.getContextPath()%>/resources/js/mobiscroll.custom-2.17.2.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/mobiscroll.i18n.en_fwd.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/mobiscroll.i18n.zh_fwd.js"></script>
<!--script src="<%=request.getContextPath()%>/resources/js/bootstrapValidator.js"></script-->
<!-- bootstrap for formValidation -->
<script src="<%=request.getContextPath()%>/resources/js/vendor/formValidation.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/vendor/bootstrap.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/vendor/formValidation.min.css" type="text/css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/mobiscroll.custom-2.17.2.min.css" type="text/css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css_dir/joinus.css" type="text/css">

<script>
	$('document').ready(function(){
		bootstrapvalidate_joinus();
		global_show_bubble("form[name='joinus_form_member'] .js_bubble","form[name='joinus_form_member'] .checkboxBubble");
		global_show_bubble("form[name='joinus_form_non_member'] .js_bubble","form[name='joinus_form_non_member'] .checkboxBubble");
		
		//choose is current fwd member or not
		$('.is_fwdmember').on('change',function(){
			if($(this).val()=='yes'){
				//$('.existing_fwdmember').show();
				$("form[name='joinus_form_member']").show();
				$("form[name='joinus_form_non_member']").hide();
				//$("form[name='joinus_form_member']").bootstrapValidator('validate');
			}else{
				//$('.existing_fwdmember').hide();
				$("form[name='joinus_form_member']").hide();
				$("form[name='joinus_form_non_member']").show();
			}
		});
		//tooltip init
		$('.tooltip-icon').tooltip();
		tooltipPlacement();
		$(window).resize(function(){
			tooltipPlacement();
		});
		$('.tooltip-icon').on('shown.bs.tooltip',function(){
			var str_left = $('#'+$(this).data('id')+'+.tooltip.bottom').css('left');
			if(str_left != null){
				str_left = str_left.replace(/px/g, '');
				$('#'+$(this).data('id')+'+.tooltip.bottom').css('left',(str_left-79));
			}
		});
		
		//date from mobiscroll 
		var dateTo = new Date();
		$('#txtDob').mobiscroll().calendar({
			//dateOrder: 'ddMyy',
			display: 'bubble',
			showLabel: true,
			mode: 'scroller',
			controls: ['date'],
			//layout: 'liquid',
			//minWidth: 40,
			//minDate: dateFrom,
			maxDate: dateTo,
			//dateFormat: 'dd-mm-yyyy',
			lang: language == "en" ? "en_fwd" : "zh_fwd",
			showOnFocus: true,
			focusOnClose: false,
			onClosed: function (valueText, inst) {
				$("#txtDob").trigger('input');
				$('#txtDob').trigger('blur');
				if(valueText != "" && valueText != null){
					$("#txtDob").parent().addClass("is-dirty");
				}
			},
		});
	});
	
	//do fields validation and api call for validation
	function activateUserAccountJoinUs(form) {
		var name = form.name;
		var form_selector = "form[name='"+ name +"']";
		// $(form_selector).bootstrapValidator('validate');
		// console.log($(form_selector).data('bootstrapValidator').isValid());
		// if ($(form_selector).data('bootstrapValidator').isValid()) {
		$(form_selector).formValidation('validate');
		console.log($(form_selector).data('formValidation').isValid());
		if ($(form_selector).data('formValidation').isValid()) {
			$.ajax({
				type : 'POST',
				url : '<%=request.getContextPath()%>/{language}/joinus',
				data : $(form_selector).serialize(),
				async : false,
				success : function(data) {
					if (data == 'success') {
						$(form_selector + ' #success-message').show();
						$(form_selector + ' #joinus-err-msg').hide();
						window.location.hash = form_selector+ ' #success-message';
						$(form_selector + ' #success-message').html("User succesfully Register"); 
						if(window.top.document.referrer.indexOf("savings-insurance/plan-details-rp")>0){
							window.location.href = '<%=request.getContextPath()%>/${language}/savings-insurance/plan-details-rp?thankyou=thankyou';
						}else if(window.top.document.referrer.indexOf("savings-insurance/plan-details-sp")>0){
							window.location.href = '<%=request.getContextPath()%>/${language}/savings-insurance/plan-details-sp?thankyou=thankyou';
						}else if(window.top.document.referrer.indexOf("term-life-insurance/select-plan")>0){
							perventRedirect=false;
							ga('send', 'event', 'Login', 'Click', 'Login success');
							window.location.href= "<%=request.getContextPath()%>/${language}/term-life-insurance/select-plan?goApp=yes";
						}else if("${quarry}" == "FNA"){
							window.location.href = '<%=request.getContextPath()%>/${language}/FNA/financial-needs-analysis';
						}else {
							window.location.href = '<%=request.getContextPath()%>/${language}/account';
						}
					} else if(data == 'discover'){
						window.location.href = '<%=request.getContextPath()%>/${language}/fwdiscover';
					} else {
						$(form_selector + ' #joinus-err-msg').show();
						
						window.location.hash = form_selector + ' #joinus-err-msg';
						if (data == 'This username already in use, please try again') {
							$(form_selector + ' #joinus-err-msg').html('<fmt:message key="member.registration.fail.username.registered" bundle="${msg}" />');
						} else if (data == 'email address and mobile no. already registered') {
							$(form_selector + '# joinus-err-msg').html('<fmt:message key="member.registration.fail.emailMobile.registered" bundle="${msg}" />');
						} else {
							$(form_selector + ' #joinus-err-msg').html(data);
						}
					} 
				},
				error : function(xhr, status, error) {
				}
			});
		}
		return false;
	}
	
	//declaration checkbox
	$("#checkbox1").change(function() {
		$("#errorDeclaration").html("");
	});

//--------------------------------------------------------------------------------------------------------------------
//join us page validation (but not using)
/*function validateJoinUsForm() {
	var valid = true;

	var fullName = $("#txtFullName").val();
	var mobileNo = $("#txtMobileNo").val();
	var emailId = $("#txtEmailId").val();
	var userName = $("#txtUserName1").val();
	var password = $("#txtPass1").val();
	var confirmPassword = $("#txtConfPass").val();

	document.getElementById("errorEmptyName").innerHTML = "";
	document.getElementById("errorEmptyMob").innerHTML = "";
	document.getElementById("errorEmptyEmailId").innerHTML= "";
	document.getElementById("errorEmptyUName").innerHTML = "";
	document.getElementById("errorJoinUsPassword").innerHTML = "";
	document.getElementById("errorEmptyConfPass").innerHTML= "";
	document.getElementById("chk1").innerHTML = "";
	document.getElementById("chk2").innerHTML = "";

	// FULL NAME VALIDATION
	if (fullName.trim() == "") {
		document.getElementById("errorEmptyName").innerHTML = getBundle(getBundleLanguage, "memeber.name.notNull.message"); // "Please enter your Name in English.";
		$('#txtFullName').addClass('invalid-field');
		valid = false;
	} 
	// Mobile Number Validation
	if (mobileNo.trim() == "") {
		document.getElementById("errorEmptyMob").innerHTML = getBundle(getBundleLanguage, "memeber.mobileNo.notNull.message"); // "Please enter your Mobile No.";
		$('#txtMobileNo').addClass('invalid-field');
		valid = false;
	} else {
		if (mobile_pattern.test(mobileNo) == false) {
			document.getElementById("errorEmptyMob").innerHTML = getBundle(getBundleLanguage, "memeber.mobileNo.notValid.message"); // "Please enter an 8-digit Mobile No.";
			$('#txtMobileNo').addClass('invalid-field');
			valid = false;
		}
	}

	// Email Address Validation
	if (emailId.trim() == "") {
		document.getElementById("errorEmptyEmailId").innerHTML = getBundle(getBundleLanguage, "memeber.email.notNull.message"); // "Please enter your Email Address.";
		$('#txtEmailId').addClass('invalid-field');
		valid = false;
	} else {
		if (emailreg.test(emailId) == false) {
			document.getElementById("errorEmptyEmailId").innerHTML = getBundle(getBundleLanguage, "memeber.email.notValid.message"); // "Please enter a valid Email Address.";
			$('#txtEmailId').addClass('invalid-field');
			valid = false;
		}
	}
	var reg_user = /^[a-zA-Z0-9!??@%&??)*\+,.\/;\[\\\]\^_`{|}~-]{6,50}$/;
	
	// UserName Validation
	if (userName.trim() == "") {
		document.getElementById("errorEmptyUName").innerHTML = getBundle(getBundleLanguage, "memeber.username.notNull.message"); // "Please enter your Username.";
		$('#txtUserName1').addClass('invalid-field');
		valid = false;

	} else {
		if (reg_user.test(userName) == false) {
			document.getElementById("errorEmptyUName").innerHTML= getBundle(getBundleLanguage, "memeber.username.notValidLength.message"); // "Username must be between 6 and 50 characters.";
			$('#txtUserName1').addClass('invalid-field');
			valid = false;
		}
		
	}

	// validation for Passsword
	var passWordPttrn = "[a-zA-Z0-9]{8,}";
	var specialChar = "\\W";
	var rg = new RegExp(passWordPttrn);
	var spChar = new RegExp(specialChar);
	var message = "";
	if (password.trim() == ""){
		message  = getBundle(getBundleLanguage, "memeber.password.notNull.message"); // "Please enter your Password.";
		$('#txtPass1').addClass('invalid-field');
		valid = false;
	} else if(!rg.test(password)) {  
		message += getBundle(getBundleLanguage, "memeber.password.notValidLength.message"); // "Password must be at least 8 characters and alphanumeric (both upper AND lower cases).";
		$('#txtPass1').addClass('invalid-field');
		valid = false;
	} else if(spChar.test(password)){
		message += getBundle(getBundleLanguage, "memeber.password.notValid.message"); // "\n Password must be at least 8 characters and alphanumeric (both upper AND lower cases).";
		$('#txtPass1').addClass('invalid-field');
		valid = false;
	}
	document.getElementById("errorJoinUsPassword").innerHTML = message;


	if (confirmPassword.trim() == "") {
		document.getElementById("errorEmptyConfPass").innerHTML = getBundle(getBundleLanguage, "memeber.confirmPassword.notNull.message"); // "Please Confirm Password.";
		$('#txtConfPass').addClass('invalid-field');
		valid = false;
	} else {
		if (confirmPassword !== password) {
			document.getElementById("errorEmptyConfPass").innerHTML = getBundle(getBundleLanguage, "memeber.confirmPassword.notMatch.message"); // "Passwords you entered do not match. Please enter the same Password in both fields.";
			$('#txtConfPass').addClass('invalid-field');
			valid = false;
		}
	}
	if (document.getElementById("checkbox1").checked == false)
	{
		document.getElementById("chk1").innerHTML = getBundle(getBundleLanguage, "memeber.declaration.tnc.notChecked.message"); // "Please read and accept the Declaration, Terms & Conditions before submitting the application.";

		valid = false;
	}
	if (document.getElementById("checkbox2").checked == false)
	{
		document.getElementById("chk2").innerHTML = getBundle(getBundleLanguage, "memeber.declaration.pics.notChecked.message"); // "Please read and accept the Personal Information Collection Statement before submitting the application.";

		valid = false;
	}
	return valid;
}*/

//--------------------------------------------------------------------------------------------------------------------
//Join Us Page
//Full Name

/*if($('#txtFullName').length){
	$('#txtFullName').on('blur', function(){
		if($(this).val() == ''){
			$('#errorEmptyName').text(getBundle(getBundleLanguage, "membership.fullName.empty.message"));
			$('#txtFullName').addClass('invalid-field');
		}
		else{
			$('#errorEmptyName').text('');
		}
	})
}
//Mobile
if($('#txtMobileNo').length){
	$('#txtMobileNo').on('blur', function(){
		var value = $(this).val();
		if(isMobileNo(value) != true){
			$('#errorEmptyMobJoinUs').text(isMobileNo(value));
			$('#txtMobileNo').addClass('invalid-field');
		}
		else{
			$('#errorEmptyMobJoinUs').text('');
		}
	})
}
//Email
if($('#txtEmailId').length){
	$('#txtEmailId').on('blur', function(){
		var value = $(this).val();
		if(isEmail(value) != true){
			$('#errorEmptyEmailIdJoinUs').text(isEmail(value));
			$('#txtEmailId').addClass('invalid-field');
		}
		else{
			$('#errorEmptyEmailIdJoinUs').text('');
		}
	})
}
//Username
if($('#txtUserName1').length){
	$cur = $('#txtUserName1');
	$cur.on('blur', function(){
		value = $(this).val();
		if(isValidUsername(value) !== true){
			$('#errorEmptyUNameJoinUs').text(isValidUsername(value));
			$('#txtUserName1').addClass('invalid-field');
		}else
			$('#errorEmptyUNameJoinUs').text('');
	})
}

//Password
if($('#txtPass1').length){
	$cur = $('#txtPass1');
	$cur.on('blur', function(){
		value = $(this).val();
		if(isValidPassword(value) !== true){
			$('#errorJoinUsPassword').text(isValidPassword(value));
			$('#txtPass1').addClass('invalid-field');
		}else if(value == $("#txtUserName1").val().trim()){
			$('#errorJoinUsPassword').text(getBundle(getBundleLanguage, "user.password.same.message"));
			$('#txtPass1').addClass('invalid-field');
		}else $('#errorJoinUsPassword').text('');
	})
}

//Confirm Password
if($('#txtConfPass').length && $('#txtPass1').length){
	$cur = $('#txtConfPass');
	
	$cur.on('blur', function(){
		var passwordToMatch = $('#txtPass1').val();
		value = $(this).val();	
		if(passMatch(passwordToMatch, value) !== true){
			$('#errorEmptyConfPass').text(passMatch(passwordToMatch, value));
			$('#txtConfPass').addClass('invalid-field');
		} else $('#errorEmptyConfPass').text('');
	})
}*/


/*function activateUserAccount(){
	var check = true;
	var name = $('#txtFullName').val();
	var mobile = $('#txtMobileNo').val();
	var email = $('#txtEmailId').val();
	var userName = $('#txtUserName1').val();
	var password = $('#txtPass1').val();
	var checkPassword = $('#txtConfPass').val();
	var declaration = $('#checkbox1').is(':checked');
	
	//first error element
	var firstErrorElementId="";
	
	if(name == ''){
		$('#errorEmptyName').text(getBundle(getBundleLanguage, "membership.fullName.empty.message"));
		$("#txtFullName").addClass("invalid-field");
		
		if(firstErrorElementId==""){
			firstErrorElementId="txtFullName";
		}
		check = false;
	} else {
		if(name == password){
			$('#errorEmptyName').text(getBundle(getBundleLanguage, "membership.fullName.equal.password.message"));
			$("#txtFullName").addClass("invalid-field");
			if(firstErrorElementId==""){
				firstErrorElementId="txtFullName";
			}
			check = false;
		}
	}
	
	var mobileValidateResult = isMobileNo(mobile);
	
	if(mobileValidateResult != true){
		$('#errorEmptyMobJoinUs').text(mobileValidateResult);
		$("#txtMobileNo").addClass("invalid-field");
		if(firstErrorElementId==""){
			firstErrorElementId="txtMobileNo";
		}
		check = false;
	}
	
	if(isEmail(email) !== true){
		$('#errorEmptyEmailIdJoinUs').text(isEmail(email));
		$("#txtEmailId").addClass("invalid-field");
		if(firstErrorElementId==""){
			firstErrorElementId="txtEmailId";
		}
		check = false;
	}
	
	if(isValidUsername(userName) !== true){
		$('#errorEmptyUNameJoinUs').text(isValidUsername(userName));
		$("#txtUserName1").addClass("invalid-field");
		if(firstErrorElementId==""){
			firstErrorElementId="txtUserName1";
		}
		check = false;
	};
	
	if(isValidPassword(password) !== true){
		$('#errorJoinUsPassword').text(isValidPassword(password));
		$("#txtPass1").addClass("invalid-field");
		if(firstErrorElementId==""){
			firstErrorElementId="txtPass1";
		}
		check = false;
	};
	
	if(password != "" && userName == password){
		$('#errorJoinUsPassword').text(getBundle(getBundleLanguage, "user.password.same.message"));
		$("#txtPass1").addClass("invalid-field");
		if(firstErrorElementId==""){
			firstErrorElementId="txtPass1";
		}
		check = false;
	}
	
	if(passMatch(password, checkPassword) !== true){
		$('#errorEmptyConfPass').text(passMatch(password, checkPassword));
		$("#txtConfPass").addClass("invalid-field");
		if(firstErrorElementId==""){
			firstErrorElementId="txtConfPass";
		}
		check = false;
	};
	
	if(!declaration){
		$('#errorDeclaration').text(getBundle(getBundleLanguage, "membership.declaration.notChecked.message"));
		if(firstErrorElementId==""){
			firstErrorElementId="checkbox1";
		}
		check = false;
	}
	
	if(firstErrorElementId!=""){
		scrollToElement(firstErrorElementId);
	}
	
	return check;
}*/

function generate_common_validate_fields(form){
	return {
		'fullName': {
			container: form + ' #errorEmptyName',
			validators: {
				notEmpty: {
					message: getBundle(getBundleLanguage, "membership.fullName.empty.message")
				},
				different: {
					field: 'password',
					message: getBundle(getBundleLanguage, "membership.fullName.equal.password.message")
				}
			}
		},
		'mobileNo': {
			container: form + ' #errorEmptyMobJoinUs',
			validators: {
				notEmpty: {
					message: getBundle(getBundleLanguage, "applicant.mobileNo.notNull.message")
				},
				regexp: {
					regexp: /^1[0-9]{10}$|^[5689][0-9]{7}$/,
					message: getBundle(getBundleLanguage, "applicant.mobileNo.notValid.message")
				}
			}
		},
		'EmailAddress': {
			container: form + ' #errorEmptyEmailIdJoinUs',
			validators: {
				notEmpty: {
					message: getBundle(getBundleLanguage, "applicant.email.notNull.message")
				},
				regexp: {
					regexp: /^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/,
					message: getBundle(getBundleLanguage, "applicant.email.notValid.message")
				}
			}
		},
		'userName': {
			container: form + ' #errorEmptyUNameJoinUs',
			validators: {
				callback : {
					 message : getBundle(getBundleLanguage, "user.username.notValid.message"),
					 callback: function (value, validator) {
						 return {
							 valid : isNaN(value)
						 }
					 }
				},
				notEmpty: {
					message: getBundle(getBundleLanguage, "user.username.empty.message")
				},
				regexp: {
					regexp: /^(([a-zA-Z0-9]+)|(([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-\_]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)))$/,
					message: getBundle(getBundleLanguage, "user.username.notValid.message")
				},
				stringLength: {
					max: 50,
					min: 6,
					message: getBundle(getBundleLanguage, "user.username.length.message")
				 }
			}
		},
		'password': {
			container: form + ' #errorJoinUsPassword',
			validators: {
				different: {
					field: 'userName',
					message: getBundle(getBundleLanguage, "user.password.same.message")
				},
				callback:{
					message: getBundle(getBundleLanguage, "user.password.validate.message"),
					callback: function(value, password, $field){
						var passwordPattern = "[a-zA-Z0-9]{8,}";
						var passwordPattern2 = "[A-Z]";
						var passwordPattern3 = "[a-z]";
						var passwordPattern4 = "[0-9]";
						var specialChar = "\\W";
						if (value.search(/[a-zA-Z0-9]{8,}/) < 0) {
							return {
								valid: false,
							};
						}
						if (value.search(/[A-Z]/) < 0) {
							return {
								valid: false,
							};
						}
						if (value.search(/[a-z]/) < 0) {
							return {
								valid: false,
							};
						}
						if (value.search(/[0-9]/) < 0) {
							return {
								valid: false,
							};
						}
						if (value.search(/\W/) > 0) {
							return {
								valid: false,
							};
						}
						return true;
					}               

				},
				notEmpty: {
					message: getBundle(getBundleLanguage, "user.password.notNull.message")
				}	
			}
		},
		'confirmPassword': {
			container: form + ' #errorEmptyConfPass',
			validators: {
				notEmpty: {
					message: getBundle(getBundleLanguage, "user.confirmPassword.empty.message")
				},
				identical:{
					enabled: false,
					field: 'password',
					message: getBundle(getBundleLanguage, "user.confirmPassword.validate.message")
				}
			}
		},
		'checkbox1': {
			container: form + ' #errorDeclaration',
			validators: {
				choice: {
					min: 1,
					max: 1,
					message: getBundle(getBundleLanguage, "membership.declaration.notChecked.message")
				}
			}
		}
	};
}

function generate_validate(form,fields){
	// $(form).bootstrapValidator({
	$(form).formValidation({
		excluded: [
			':disabled', ':hidden', ':not(:visible)'
		],
		fields: fields
		}).on('success.form.bv', function (e) {
			//e.preventDefault();
		
		}).on('error.form.bv', function (e) {
		
		}).on('error.field.bv', function(e, data) {
		    if (data.bv.getSubmitButton()) {
		        data.bv.disableSubmitButtons(false);
		    }
		})
		.on('success.field.bv', function(e, data) {
		    if (data.bv.getSubmitButton()) {
		        data.bv.disableSubmitButtons(false);
		    }
		}).on('error.validator.bv', function(e, data) {
	        // $(e.target)    --> The field element
	        // data.bv        --> The BootstrapValidator instance
	        // data.field     --> The field name
	        // data.element   --> The field element
	        // data.validator --> The current validator name

	        data.element
	            .data('bv.messages')
	            // Hide all the messages
	            .find('.help-block[data-bv-for="' + data.field + '"]').hide()
	            // Show only message associated with current validator
	            .filter('[data-bv-validator="' + data.validator + '"]').show();
	    })
		.on('input keyup', '[name="confirmPassword"]', function() {
			if ($(this).val().length > 0) {
				$(form)
					.formValidation('enableFieldValidators', 'confirmPassword', true, 'identical')
					.formValidation('revalidateField', 'confirmPassword');
			}else{
				$(form)
					.formValidation('enableFieldValidators', 'confirmPassword', false, 'identical')
					.formValidation('revalidateField', 'confirmPassword');
			}
		})
		.on('input keyup', '[name="Hkid"]', function() {
			if ($(this).val().length > 0) {
				$(form)
					.formValidation('enableFieldValidators', 'Hkid', true, 'callback')
					.formValidation('revalidateField', 'Hkid');
			}else{
				$(form)
					.formValidation('enableFieldValidators', 'Hkid', false, 'callback')
					.formValidation('revalidateField', 'Hkid');
			}
		});
}
function bootstrapvalidate_joinus(){
	var form_1 = "form[name='joinus_form_member']";
	var fields_1 = generate_common_validate_fields(form_1);
	
	fields_1['Dob'] = {
						container: form_1 + ' #errorEmptyDobJoinUs',
						validators: {
							notEmpty: {
								message: '<fmt:message key="error.dob.empty" bundle="${msg}" />'
							}
						}
					};
	fields_1['Hkid'] = {
						container: form_1 + ' #errorEmptyHkidJoinUs',
						validators: {
							callback: {
								enabled: false,
								message: '<fmt:message key="error.hkid.invalid" bundle="${msg}" />',
								callback: function (value, validator) {
									if(IsHKID(value)){
										if(typeof getSavieReferralDiscount != 'function'){
											return true;
										}else{
											if(getSavieReferralDiscount()=="0"){
												return false;
											}else{
												return true;
											}
										}
									}else{
										return false;
									}
								}
							},
							notEmpty: {
								message: '<fmt:message key="error.hkid.empty" bundle="${msg}" />'
							},
							regexp: {
								regexp: /^[a-zA-Z0-9\-]*$/,
								message: '<fmt:message key="error.hkid.special.chars" bundle="${msg}" />'
							}
						}
					};
	fields_1['PolicyNumber'] = {
								container: form_1 + ' #errorEmptyPolicyNumberJoinUs',
								validators: {
									notEmpty: {
										message: '<fmt:message key="error.policyno.empty" bundle="${msg}" />'
									},
									stringLength: {
										max: 14,
										message: getBundle(getBundleLanguage, "error.policyno.length.message")
									},
									regexp:{
										regexp: /^[a-zA-Z0-9]*$/,
										message: '<fmt:message key="error.policyno.special.chars" bundle="${msg}" />'
									}
								}
							}; 
	
	generate_validate(form_1,fields_1);
	
	var form_2 = "form[name='joinus_form_non_member']";
	var fields_2 = generate_common_validate_fields(form_2);
	generate_validate(form_2,fields_2);
	
}

//--------------------------------------------------------------------------------------------------------------------
//functions 
function tooltipPlacement(){
	if($(document).width()<992){
		$('.tooltip-icon').each(function(){
			$(this).data('bs.tooltip').options.placement = 'bottom';
		});
	}else{
		$('.tooltip-icon').each(function(){
			$(this).data('bs.tooltip').options.placement = 'right';
		});
	}
}
</script>

<body class="homepage">
	<!--   Main Content-->
	<section id="contact-page">
 
		<!-- Breadcrumb Component Start-->
		<div class="container container-fluid container--breadcrumb">
			<c:set var="breadcrumbItems">
				breadcrumb.item.home,breadcrumb.item.joinus
			</c:set>
			<c:set var="breadcrumbActive">1</c:set>
			<c:set var="breadcrumbBold">true</c:set>

			<jsp:include page="/WEB-INF/jsp/merged/comp/breadcrumb.jsp">
				<jsp:param name="breadcrumbItems" value="${breadcrumbItems}"/>
				<jsp:param name="breadcrumbActive" value="${breadcrumbActive}"/>
				<jsp:param name="breadcrumbBold" value="${breadcrumbBold}"/>
			</jsp:include>
		</div>
		<!-- Breadcrumb Component End-->

		<div class="container container-fluid container--regform" id="joinus_form">
			<div class="row padding-15">
				<h3 class="black-bold"><fmt:message key="member.registration.details.header" bundle="${msg}" /></h3>
				<div><fmt:message key="member.registration.details.fwdmember.desc" bundle="${msg}" /></div>
				<div class="col-xs-12 radio-wrapper">
					<div class="col-sm-6 col-xs-12 radio-choice">
						<label><input type="radio" id="is_fwdmember_yes" class="is_fwdmember" name="is_fwdmember" value="yes" checked><fmt:message key="member.registration.details.fwdmember.yes" bundle="${msg}" /></label>
					</div>
					<div class="col-sm-6 col-xs-12 radio-choice">
						<label><input type="radio" id="is_fwdmember_no" class="is_fwdmember" name="is_fwdmember" value="no"><fmt:message key="member.registration.details.fwdmember.no" bundle="${msg}" /></label>
					</div>
				</div>
			</div>
			<div class="row">
				<!-- member form -->
				<form modelAttribute="userDetails" class="form-horizontal" name="joinus_form_member" role="form" action="" onsubmit="return false">
					<div id="joinus-err-msg" class="alert alert-danger" role="alert"
						style="display: none;">
						<P id="error1">
					</div>
					<div id="success-message" class="alert alert-success" role="alert"
						style="display: none;">
						<P id="error1">
					</div>

					<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 regform__left">
						<div
							style="display: none; position: absolute; left: 0; top: 0; bottom: 0; right: 0; background: #000; opacity: 0.8; z-index: 1000"
							id="ajax-loading">
							<img
								style="width: 100px; height: 100px; position: absolute; top: 40%; left: 40%"
								src="<%=request.getContextPath()%>/resources/images/ajax-loader.gif">
						</div>

						<div class="registration col-lg-10 col-md-10">
							<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label registration__item">
								<input class="mdl-textfield__input registration__input" type="text" name="fullName" value="${userDetails.getFullName()}"
									onblur="replaceAlpha(this);"
									onkeypress="return alphaOnly(event);"
									maxlength="100">
								<label class="mdl-textfield__label registration__label"><fmt:message key="member.registration.details.label.fullName" bundle="${msg}" /></label>
								<span id="errorEmptyName" class="text-red"></span>
								<span class="tooltip-icon glyphicon glyphicon-exclamation-sign" data-toggle="tooltip" data-placement="right" data-id="tooltipFullName" id="tooltipFullName" title="<fmt:message key='member.registration.details.label.fullName.desc' bundle='${msg}'/>"></span>
							</div>
							<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label registration__item">
								<input class="mdl-textfield__input registration__input" type="text" id="txtMobileNo" name="mobileNo" value="${userDetails.getMobileNo()}"
									onblur="replaceNumeric(this);"
									onkeypress="return isNumeric(event);"
									maxlength="8">
								<label class="mdl-textfield__label registration__label" for="txtMobileNo"><fmt:message key="member.registration.details.label.mobileNo" bundle="${msg}" /></label>
								<span id="errorEmptyMobJoinUs" class="text-red"></span>
							</div>
							<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label registration__item">
								<input class="mdl-textfield__input registration__input" type="text" id="txtEmailId" name="EmailAddress" value="${userDetails.getEmailAddress()}"
									maxlength="50">
								<label class="mdl-textfield__label registration__label" for="txtEmailId"><fmt:message key="member.registration.details.label.emailAddress" bundle="${msg}" /></label>
								<span id="errorEmptyEmailIdJoinUs" class="text-red"></span>
							</div>
							<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label registration__item existing_fwdmember">
								<input class="mdl-textfield__input registration__input" type="text" id="txtPolicyNumber" name="PolicyNumber" value=""
									><!--userDetails.getPolicyNumber()-->
								<label class="mdl-textfield__label registration__label" for="txtPolicyNumber"><fmt:message key="member.registration.details.policy.number" bundle="${msg}" /></label>
								<span id="errorEmptyPolicyNumberJoinUs" class="text-red"></span>
								<span class="tooltip-icon glyphicon glyphicon-exclamation-sign" data-toggle="tooltip" data-placement="right" data-id="tooltipPolicyNumber" id="tooltipPolicyNumber" title="<fmt:message key='member.registration.details.policy.number.tooltip' bundle='${msg}'/>"></span>
							</div>
							<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label registration__item existing_fwdmember">
								<input class="mdl-textfield__input registration__input" type="text" id="txtDob" name="Dob" value=""
									>
								<label class="mdl-textfield__label registration__label" for="txtDob"><fmt:message key="member.registration.details.dob" bundle="${msg}" /></label>
								<span id="errorEmptyDobJoinUs" class="text-red"></span>
							</div>
							<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label registration__item existing_fwdmember">
								<input class="mdl-textfield__input registration__input" type="text" id="txtHkid" name="Hkid" value=""
									maxlength="50"><!--userDetails.getHkid()-->
								<label class="mdl-textfield__label registration__label" for="txtHkid"><fmt:message key="member.registration.details.hkid" bundle="${msg}" /></label>
								<span id="errorEmptyHkidJoinUs" class="text-red"></span>
								<span class="tooltip-icon glyphicon glyphicon-exclamation-sign" data-toggle="tooltip" data-placement="right" data-id="tooltipHkid" id="tooltipHkid" title="<fmt:message key='member.registration.details.hkid.tooltip' bundle='${msg}'/>"></span>
							</div>
							
							<h3 class="black-bold"><fmt:message key="member.registration.details.header.login" bundle="${msg}" /></h3>
							<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label registration__item">
								<input class="mdl-textfield__input registration__input" type="text" id="txtUserName1" name="userName" value="${userDetails.getUserName() }"
									onkeypress="return validationUsername(event);">
								<label class="mdl-textfield__label registration__label" for="txtUserName1"><fmt:message key="member.registration.details.label.username" bundle="${msg}" /></label>
								<span id="errorEmptyUNameJoinUs" class="text-red"></span>
								<span class="tooltip-icon glyphicon glyphicon-exclamation-sign" data-toggle="tooltip" data-placement="right" data-id="tooltipUserName1" id="tooltipUserName1" title="<fmt:message key='member.registration.details.label.username.help' bundle='${msg}'/>"></span>
							</div>
							<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label registration__item">
								<input class="mdl-textfield__input registration__input" type="password" id="txtPass1" name="password"
									autocomplete="off">
								<label class="mdl-textfield__label registration__label" for="txtPass1"><fmt:message key="member.registration.details.label.password" bundle="${msg}" /></label>
								<span id="errorJoinUsPassword" class="text-red"></span>
								<span class="tooltip-icon glyphicon glyphicon-exclamation-sign" data-toggle="tooltip" data-placement="right" data-id="tooltipPass1" id="tooltipPass1" title="<fmt:message key='member.registration.details.label.password.help' bundle='${msg}'/>"></span>
							</div>
							<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label registration__item">
								<input class="mdl-textfield__input registration__input" type="password" id="txtConfPass" name="confirmPassword"
								autocomplete="off">
								<label class="mdl-textfield__label registration__label" for="txtConfPass"><fmt:message key="member.registration.details.label.confirmPassword" bundle="${msg}" /></label>
								<span id="errorEmptyConfPass" class="text-red"></span>
							</div>
						</div>
					</div>
					
					<div class="col-lg-4 col-md-4 hidden-sm hidden-xs regform__right">
						<div>
							<img src="<%=request.getContextPath()%>/resources/images/user.jpg" alt="" />
						</div>
						<h2 class="h2-1 fwd-acc"><fmt:message key="reason.item1.title" bundle="${msg}" /></h2>
						<h4 class="h4-1"><fmt:message key="reason.item1.copy" bundle="${msg}" /></h4>
					</div>

					<div class="clearfix"></div>
					<h4 class="col-xs-12 h4-2 declaration-head"><fmt:message key="member.registration.declarations.header" bundle="${msg}" /></h4>
					<div class="col-xs-12 declaration-content">
						<div class="checkbox">
							<input id="checkbox1" type="checkbox" name="checkbox1">
							<label for="checkbox1"> <fmt:message key="member.registration.declarations.PICS.part1" bundle="${msg}" />
								<a href="<fmt:message key="member.PICS.link" bundle="${msg}" />"  target="_blank" class="sub-link">
									<fmt:message key="member.registration.declarations.PICS.part2" bundle="${msg}" />
								</a>
								<fmt:message key="member.registration.declarations.PICS.part3" bundle="${msg}" />
								<p><span id="errorDeclaration" class="text-red"></span></p>
								<hr class="move-left">
								<div class="move-left"><fmt:message key="member.registration.declarations.PDPO" bundle="${msg}" /></div>
							</label>
						</div>
						<span id="chk2" style="display: none"> <label
							class="text-red"><fmt:message key="member.registration.declarations.PDPO.error" bundle="${msg}" /></label>
						</span>
						<div class="checkbox">
							<input id="checkbox3" name="checkbox3" type="checkbox" class="js_bubble"> <label
								for="checkbox3"><fmt:message key="member.registration.declarations.PDPO.option1" bundle="${msg}" /> <br>
							</label>
						</div>
						<div class="checkbox">
							<input id="checkbox4" name="checkbox4" type="checkbox" class="js_bubble"> <label
								for="checkbox4"><fmt:message key="member.registration.declarations.PDPO.option2" bundle="${msg}" /> <br>
								<br>
							</label>
						</div>
						<div class="checkboxBubble">
							<fmt:message key="general.declarations.PDPO.warning" bundle="${msg}" />
						</div>
					</div>
					<div class="col-xs-12 act">
						<button class="btn btn-lg act__btn cta--orange" onclick="activateUserAccountJoinUs(this.form)">
							<fmt:message key="member.registration.activate" bundle="${msg}" />
						</button>
					</div>
				</form>
				<!-- end member form -->
				
				<!-- non member form -->
				<form modelAttribute="userDetails" class="form-horizontal joinus_form_non_member" name="joinus_form_non_member" role="form" action="" onsubmit="return false">
					<div id="joinus-err-msg" class="alert alert-danger" role="alert"
						style="display: none;">
						<P id="error1">
					</div>
					<div id="success-message" class="alert alert-success" role="alert"
						style="display: none;">
						<P id="error1">
					</div>

					<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 regform__left">
						<div
							style="display: none; position: absolute; left: 0; top: 0; bottom: 0; right: 0; background: #000; opacity: 0.8; z-index: 1000"
							id="ajax-loading">
							<img
								style="width: 100px; height: 100px; position: absolute; top: 40%; left: 40%"
								src="<%=request.getContextPath()%>/resources/images/ajax-loader.gif">
						</div>

						<div class="registration col-lg-10 col-md-10">
							<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label registration__item">
								<input class="mdl-textfield__input registration__input" type="text" name="fullName" value="${userDetails.getFullName()}"
									onblur="replaceAlpha(this);"
									onkeypress="return alphaOnly(event);">
								<label class="mdl-textfield__label registration__label"><fmt:message key="member.registration.details.label.fullName" bundle="${msg}" /> <fmt:message key="member.registration.details.label.fullName.desc" bundle="${msg}" /></label>
								<span id="errorEmptyName" class="text-red"></span>
							</div>
							<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label registration__item">
								<input class="mdl-textfield__input registration__input" type="text" name="mobileNo" value="${userDetails.getMobileNo()}"
									onblur="replaceNumeric(this);"
									onkeypress="return isNumeric(event);"
									maxlength="8">
								<label class="mdl-textfield__label registration__label"><fmt:message key="member.registration.details.label.mobileNo" bundle="${msg}" /></label>
								<span id="errorEmptyMobJoinUs" class="text-red"></span>
							</div>
							<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label registration__item">
								<input class="mdl-textfield__input registration__input" type="text" name="EmailAddress" value="${userDetails.getEmailAddress()}"
									maxlength="50">
								<label class="mdl-textfield__label registration__label"><fmt:message key="member.registration.details.label.emailAddress" bundle="${msg}" /></label>
								<span id="errorEmptyEmailIdJoinUs" class="text-red"></span>
							</div>
							<h3 class="black-bold"><fmt:message key="member.registration.details.header.login" bundle="${msg}" /></h3>
							<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label registration__item">
								<input class="mdl-textfield__input registration__input" type="text" name="userName" value="${userDetails.getUserName() }"
									onkeypress="return validationUsername(event);">
								<label class="mdl-textfield__label registration__label"><fmt:message key="member.registration.details.label.username" bundle="${msg}" /></label>
								<span id="errorEmptyUNameJoinUs" class="text-red"></span>
								<span class="tooltip-icon glyphicon glyphicon-exclamation-sign" data-toggle="tooltip" data-placement="right" data-id="tooltipUserName1" id="tooltipUserName1" title="<fmt:message key='member.registration.details.label.username.help' bundle='${msg}'/>"></span>
							</div>
							<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label registration__item">
								<input class="mdl-textfield__input registration__input" type="password"  name="password"
									autocomplete="off">
								<label class="mdl-textfield__label registration__label" for="txtPass1"><fmt:message key="member.registration.details.label.password" bundle="${msg}" /></label>
								<span id="errorJoinUsPassword" class="text-red"></span>
								<span class="tooltip-icon glyphicon glyphicon-exclamation-sign" data-toggle="tooltip" data-placement="right" data-id="tooltipPass1" id="tooltipPass1" title="<fmt:message key='member.registration.details.label.password.help' bundle='${msg}'/>"></span>
							</div>
							<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label registration__item">
								<input class="mdl-textfield__input registration__input" type="password" name="confirmPassword"
									autocomplete="off">
								<label class="mdl-textfield__label registration__label"><fmt:message key="member.registration.details.label.confirmPassword" bundle="${msg}" /></label>
								<span id="errorEmptyConfPass" class="text-red"></span>
							</div>
						</div>
					</div>
					
					<div class="col-lg-4 col-md-4 hidden-sm hidden-xs regform__right">
						<div>
							<img src="<%=request.getContextPath()%>/resources/images/user.jpg" alt="" />
						</div>
						<h2 class="h2-1 fwd-acc"><fmt:message key="reason.item1.title" bundle="${msg}" /></h2>
						<h4 class="h4-1"><fmt:message key="reason.item1.copy" bundle="${msg}" /></h4>
					</div>

					<div class="clearfix"></div>
					<h4 class="col-xs-12 h4-2 declaration-head"><fmt:message key="member.registration.declarations.header" bundle="${msg}" /></h4>
					<div class="col-xs-12 declaration-content">
						<div class="checkbox">
							<input id="checkbox1_2" type="checkbox" name="checkbox1">
							<label for="checkbox1_2"> <fmt:message key="member.registration.declarations.PICS.part1" bundle="${msg}" />
								<a href="<fmt:message key="member.PICS.link" bundle="${msg}" />"  target="_blank" class="sub-link">
									<fmt:message key="member.registration.declarations.PICS.part2" bundle="${msg}" />
								</a>
								<fmt:message key="member.registration.declarations.PICS.part3" bundle="${msg}" />
								<p><span id="errorDeclaration" class="text-red"></span></p>
								<hr class="move-left">
								<div class="move-left"><fmt:message key="member.registration.declarations.PDPO" bundle="${msg}" /></div>
							</label>
						</div>
						<span id="chk2" style="display: none"> <label
							class="text-red"><fmt:message key="member.registration.declarations.PDPO.error" bundle="${msg}" /></label>
						</span>
						<div class="checkbox">
							<input id="checkbox3_2" name="checkbox3_2" type="checkbox" class="js_bubble"> <label
								for="checkbox3_2"><fmt:message key="member.registration.declarations.PDPO.option1" bundle="${msg}" /> <br>
							</label>
						</div>
						<div class="checkbox">
							<input id="checkbox4_2" name="checkbox4_2" type="checkbox" class="js_bubble"> <label
								for="checkbox4_2"><fmt:message key="member.registration.declarations.PDPO.option2" bundle="${msg}" /> <br>
								<br>
							</label>
						</div>
						<div class="checkboxBubble">
							<fmt:message key="general.declarations.PDPO.warning" bundle="${msg}" />
						</div>
					</div>
					<div class="col-xs-12 act">
						<button class="btn btn-lg act__btn cta--orange" onclick="activateUserAccountJoinUs(this.form)">
							<fmt:message key="member.registration.activate" bundle="${msg}" />
						</button>
					</div>
				</form>
				<!-- non member form -->
			</div>
		</div>
		<!--/.container-->
	</section>
</body>