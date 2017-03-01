<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />

<script src="<%=request.getContextPath()%>/resources/js/vendor/mobiscroll.custom-2.17.2.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/vendor/mobiscroll.i18n.en_fwd.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/vendor/mobiscroll.i18n.zh_fwd.js"></script>
<!--script src="<%=request.getContextPath()%>/resources/js/vendor/bootstrapValidator.js"></script-->
<!-- bootstrap for formValidation -->
<script src="<%=request.getContextPath()%>/resources/js/vendor/formValidation.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/vendor/formValidation.bootstrap.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/vendor/formValidation.min.css" type="text/css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/mobiscroll.custom-2.17.2.min.css" type="text/css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css_dir/joinus.css" type="text/css">
<style>
.temp_img{
width:60px;
}
</style>
<script>
	$('document').ready(function(){
		bootstrapvalidate_joinus();
	
	//declaration checkbox
	$("#checkbox1").change(function() {
		$("#errorDeclaration").html("");
	});

	/* 
		Direct Marketing checkbox event handle 
		Declaraed at top to prevent event propagation being stopped by other event handler.
	*/
	 
	$("#checkbox3, #checkbox4").change(function() {
		if($(this).prop('checked')) {
			$(this).val('true');
		} else {
			$(this).val('false');
		}		
	});

	$("#checkbox3_2, #checkbox4_2").change(function() {
		if($(this).prop('checked')) {
			$(this).val('On');
		} else {
			$(this).val('Off');
		}		
	});

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

	$.post = function(url, data, callback) {
	    return jQuery.ajax({
	    headers: { 
	        'Accept': 'application/json',
	        'Content-Type': 'application/json' 
	    },
	    'type': 'POST',
	    'url': url,
	    'data': JSON.stringify(data),
	    'dataType': 'json',
	    'success': callback
	    });
	};
	
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
			var dateString=$('#txtDob').val().trim();
			var yearStr=dateString.split("/")[2];
			var monStr=dateString.split("/")[1];
			var dateStr=dateString.split("/")[0];
			var dob=yearStr+"-"+monStr+"-"+dateStr;
			if(name=="joinus_form_member"){
			return $.post('<%=request.getContextPath()%>/api/member/register/member/customer',
					{
						userName: $("#txtUserName1").val(),
						mobile: $("#txtMobileNo").val(),
						password: $("#txtConfPass").val(),
						email: $("#txtEmailId").val(),
						docNo: $("#txtHkid").val(),
						policyNo: $("#txtPolicyNumber").val(),
						dob: dob,
						optOut1: ($('#checkbox3').val()=='true')?true:false,
						optOut2: ($('#checkbox4').val()=='true')?true:false
					})
					.done(function (data) {
						var resp=data.message;
						 $.ajax({
								type : 'POST',
								url : '<%=request.getContextPath()%>/joinus/registrationCustomerLogin',
								data : {userName:$("#txtUserName1").val(),password:$("#txtConfPass").val(),message:resp},
								async : false,
								success : function(data) {
									if (data == 'success') {
										$('#loadingDiv').toggle();
										
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
											$(form_selector + ' #joinus-err-msg').html('<fmt:message key="member.registration.fail.emailMobile.registered" bundle="${msg}" />');
										} else {
											$(form_selector + ' #joinus-err-msg').html(data);
										}
									} 
								},
								error : function(xhr, status, error) {
								}
							});
			      }).fail(function (err) {
			    	var resp=JSON.parse(err.responseText).message;
			        console.log(err);
			        $(form_selector + ' #joinus-err-msg').show();
			        //$(form_selector + ' #joinus-err-msg').html("User registration failed");
			        $(form_selector + ' #joinus-err-msg').html(resp);
			       
			      }); 
			}
		else{
			$.ajax({
				type : 'POST',
				url : '<%=request.getContextPath()%>/{language}/joinus',
				data : {
					fullName: $("#non-member__fullName").val(),
					mobileNo: $("#non-member__mobileNo").val(),
				    emailAddress: $("#non-member__email").val(),
				    userName: $("#non-member__userName").val(),
				    password: $("#non-member__password").val(),
				    confirmPassword: $("#non-member__confirmPassword").val(),
				    checkbox3: $('#checkbox3_2').val(),
				    checkbox4: $('#checkbox4_2').val()
				},
				async : false,
				success : function(data) {
					if (data == 'success') {
						$('#loadingDiv').toggle();
						
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
							$(form_selector + ' #joinus-err-msg').html('<fmt:message key="member.registration.fail.emailMobile.registered" bundle="${msg}" />');
						} else {
							$(form_selector + ' #joinus-err-msg').html(data);
						}
					} 
				},
				error : function(xhr, status, error) {
				}
			});
			}
		}
		return false;
	}

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
		'emailAddress': {
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
						if (value.search(/[a-zA-Z0-9\W]{8,}/) < 0) {
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
						// if (value.search(/\W/) > 0) {
							// return {
								// valid: false,
							// };
						// }
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
		})
		.on('input keyup', '[name="PolicyNumber"]', function() {
			if ($(this).val().length >= 8 && $(this).val().length <= 14) {
				$(form)
					.formValidation('enableFieldValidators', 'PolicyNumber', true, 'regexp')
					.formValidation('revalidateField', 'PolicyNumber');
			}else{
				$(form)
					.formValidation('enableFieldValidators', 'PolicyNumber', false, 'regexp')
					.formValidation('revalidateField', 'PolicyNumber');
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
								message: '<fmt:message key="member.registration.error.hkid.invalid" bundle="${msg}" />',
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
								message: '<fmt:message key="member.registration.error.hkid.empty" bundle="${msg}" />'
							},
							regexp: {
								regexp: /^[a-zA-Z0-9\-]*$/,
								message: '<fmt:message key="member.registration.error.hkid.special.chars" bundle="${msg}" />'
							}
						}
					};
	fields_1['PolicyNumber'] = {
								container: form_1 + ' #errorEmptyPolicyNumberJoinUs',
								validators: {
									notEmpty: {
										message: '<fmt:message key="member.registration.error.policyno.empty" bundle="${msg}" />'
									},
									stringLength: {
										min: 8,
										max: 14,
										message: '<fmt:message key="member.registration.error.policyno.length.message" bundle="${msg}" />'
									},
									regexp:{
										enabled: false,
										regexp: /^[a-zA-Z0-9]*-{0,1}[a-zA-Z0-9]+$/,
										message: '<fmt:message key="member.registration.error.policyno.special.chars" bundle="${msg}" />'
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
		<div class="container container-fluid container--icons">
			<div class="row"><fmt:message key="reason.item1.copy" bundle="${msg}" /></div>
			<div class="row">
				<ul>
					<li><fmt:message key="member.registration.details.icon1_des" bundle="${msg}" /></li>
					<!--li><fmt:message key="member.registration.details.icon2_des" bundle="${msg}" /></li-->
					<!--li><fmt:message key="member.registration.details.icon3_des" bundle="${msg}" /></li-->
					<li><fmt:message key="member.registration.details.icon4_des" bundle="${msg}" /></li>
					<!--li><fmt:message key="member.registration.details.icon5_des" bundle="${msg}" /></li-->
				</ul>
			</div>
		</div>
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

					<div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 regform__left">
						<div
							style="display: none; position: absolute; left: 0; top: 0; bottom: 0; right: 0; background: #000; opacity: 0.8; z-index: 1000"
							id="ajax-loading">
							<img
								style="width: 100px; height: 100px; position: absolute; top: 40%; left: 40%"
								src="<%=request.getContextPath()%>/resources/images/ajax-loader.gif">
						</div>

						<div class="registration col-lg-11 col-md-11">
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
								<input class="mdl-textfield__input registration__input" type="text" id="txtEmailId" name="emailAddress" value="${userDetails.getEmailAddress()}"
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
					
					<div class="col-lg-5 col-md-5 hidden-sm hidden-xs regform__right">
					<!--
						<div>
							<img src="<%=request.getContextPath()%>/resources/images/user.jpg" alt="" />
						</div>
					 -->
						<h2 class="h2-1 fwd-acc"><fmt:message key="reason.item1.title" bundle="${msg}" /></h2>
						<h4 class="h4-1"><fmt:message key="reason.item1.copy" bundle="${msg}" /></h4>
						<div class="icon_wrapper">
							<img class="icon_size" src="<%=request.getContextPath()%><fmt:message key="member.registration.details.icon1" bundle="${msg}" />" alt="" />
							<span><fmt:message key="member.registration.details.icon1_des" bundle="${msg}" /></span>
						</div>
						<!--div class="icon_wrapper">
							<img class="icon_size" src="<%=request.getContextPath()%><fmt:message key="member.registration.details.icon2" bundle="${msg}" />" alt="" />
							<span><fmt:message key="member.registration.details.icon2_des" bundle="${msg}" /></span>
						</div-->
						<!--div class="icon_wrapper">
							<img class="icon_size" src="<%=request.getContextPath()%><fmt:message key="member.registration.details.icon3" bundle="${msg}" />" alt="" />
							<span><fmt:message key="member.registration.details.icon3_des" bundle="${msg}" /></span>
						</div-->
						<div class="icon_wrapper">
							<img class="icon_size" src="<%=request.getContextPath()%><fmt:message key="member.registration.details.icon4" bundle="${msg}" />" alt="" />
							<span><fmt:message key="member.registration.details.icon4_des" bundle="${msg}" /></span>
						</div>
						<!--div class="icon_wrapper">
							<img class="icon_size" src="<%=request.getContextPath()%><fmt:message key="member.registration.details.icon5" bundle="${msg}" />" alt="" />
							<span><fmt:message key="member.registration.details.icon5_des" bundle="${msg}" /></span>
						</div-->
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
							<input id="checkbox3" name="checkbox3" type="checkbox" class="js_bubble optOut1" value="false"> <label
								for="checkbox3"><fmt:message key="member.registration.declarations.PDPO.option1" bundle="${msg}" /> <br>
							</label>
						</div>
						<div class="checkbox">
							<input id="checkbox4" name="checkbox4" type="checkbox" class="js_bubble optOut2" value="false"> <label
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

					<div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 regform__left">
						<div
							style="display: none; position: absolute; left: 0; top: 0; bottom: 0; right: 0; background: #000; opacity: 0.8; z-index: 1000"
							id="ajax-loading">
							<img
								style="width: 100px; height: 100px; position: absolute; top: 40%; left: 40%"
								src="<%=request.getContextPath()%>/resources/images/ajax-loader.gif">
						</div>

						<div class="registration col-lg-11 col-md-11">
							<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label registration__item">
								<input id="non-member__fullName" class="mdl-textfield__input registration__input" type="text" name="fullName" value="${userDetails.getFullName()}"
									onblur="replaceAlpha(this);"
									onkeypress="return alphaOnly(event);">
								<label class="mdl-textfield__label registration__label"><fmt:message key="member.registration.details.label.fullName" bundle="${msg}" /> <fmt:message key="member.registration.details.label.fullName.desc" bundle="${msg}" /></label>
								<span id="errorEmptyName" class="text-red"></span>
							</div>
							<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label registration__item">
								<input id="non-member__mobileNo" class="mdl-textfield__input registration__input" type="text" name="mobileNo" value="${userDetails.getMobileNo()}"
									onblur="replaceNumeric(this);"
									onkeypress="return isNumeric(event);"
									maxlength="8">
								<label class="mdl-textfield__label registration__label"><fmt:message key="member.registration.details.label.mobileNo" bundle="${msg}" /></label>
								<span id="errorEmptyMobJoinUs" class="text-red"></span>
							</div>
							<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label registration__item">
								<input id="non-member__email" class="mdl-textfield__input registration__input" type="text" name="emailAddress" value="${userDetails.getEmailAddress()}"
									maxlength="50">
								<label class="mdl-textfield__label registration__label"><fmt:message key="member.registration.details.label.emailAddress" bundle="${msg}" /></label>
								<span id="errorEmptyEmailIdJoinUs" class="text-red"></span>
							</div>
							<h3 class="black-bold"><fmt:message key="member.registration.details.header.login" bundle="${msg}" /></h3>
							<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label registration__item">
								<input id="non-member__userName" class="mdl-textfield__input registration__input" type="text" name="userName" value="${userDetails.getUserName() }"
									onkeypress="return validationUsername(event);">
								<label class="mdl-textfield__label registration__label"><fmt:message key="member.registration.details.label.username" bundle="${msg}" /></label>
								<span id="errorEmptyUNameJoinUs" class="text-red"></span>
								<span class="tooltip-icon glyphicon glyphicon-exclamation-sign" data-toggle="tooltip" data-placement="right" data-id="tooltipUserName1" id="tooltipUserName1" title="<fmt:message key='member.registration.details.label.username.help' bundle='${msg}'/>"></span>
							</div>
							<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label registration__item">
								<input id="non-member__password" class="mdl-textfield__input registration__input" type="password"  name="password"
									autocomplete="off">
								<label class="mdl-textfield__label registration__label" for="txtPass1"><fmt:message key="member.registration.details.label.password" bundle="${msg}" /></label>
								<span id="errorJoinUsPassword" class="text-red"></span>
								<span class="tooltip-icon glyphicon glyphicon-exclamation-sign" data-toggle="tooltip" data-placement="right" data-id="tooltipPass1" id="tooltipPass1" title="<fmt:message key='member.registration.details.label.password.help' bundle='${msg}'/>"></span>
							</div>
							<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label registration__item">
								<input id="non-member__confirmPassword" class="mdl-textfield__input registration__input" type="password" name="confirmPassword"
									autocomplete="off">
								<label class="mdl-textfield__label registration__label"><fmt:message key="member.registration.details.label.confirmPassword" bundle="${msg}" /></label>
								<span id="errorEmptyConfPass" class="text-red"></span>
							</div>
						</div>
					</div>
					
					<div class="col-lg-5 col-md-5 hidden-sm hidden-xs regform__right">
					<!-- 
						<div>
							<img src="<%=request.getContextPath()%>/resources/images/user.jpg" alt="" />
						</div>
					 -->
						<h2 class="h2-1 fwd-acc"><fmt:message key="reason.item1.title" bundle="${msg}" /></h2>
						<h4 class="h4-1"><fmt:message key="reason.item1.copy" bundle="${msg}" /></h4>
						<div class="icon_wrapper">
							<img class="icon_size" src="<%=request.getContextPath()%><fmt:message key="member.registration.details.icon1" bundle="${msg}" />" alt="" />
							<span><fmt:message key="member.registration.details.icon1_des" bundle="${msg}" /></span>
						</div>
						<!--div class="icon_wrapper">
							<img class="icon_size" src="<%=request.getContextPath()%><fmt:message key="member.registration.details.icon2" bundle="${msg}" />" alt="" />
							<span><fmt:message key="member.registration.details.icon2_des" bundle="${msg}" /></span>
						</div-->
						<!--div class="icon_wrapper">
							<img class="icon_size" src="<%=request.getContextPath()%><fmt:message key="member.registration.details.icon3" bundle="${msg}" />" alt="" />
							<span><fmt:message key="member.registration.details.icon3_des" bundle="${msg}" /></span>
						</div-->
						<div class="icon_wrapper">
							<img class="icon_size" src="<%=request.getContextPath()%><fmt:message key="member.registration.details.icon4" bundle="${msg}" />" alt="" />
							<span><fmt:message key="member.registration.details.icon4_des" bundle="${msg}" /></span>
						</div>
						<!--div class="icon_wrapper">
							<img class="icon_size" src="<%=request.getContextPath()%><fmt:message key="member.registration.details.icon5" bundle="${msg}" />" alt="" />
							<span><fmt:message key="member.registration.details.icon5_des" bundle="${msg}" /></span>
						</div-->
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
							<input id="checkbox3_2" name="checkbox3_2" type="checkbox" class="js_bubble optOut1" value="Off"> <label
								for="checkbox3_2"><fmt:message key="member.registration.declarations.PDPO.option1" bundle="${msg}" /> <br>
							</label>
						</div>
						<div class="checkbox">
							<input id="checkbox4_2" name="checkbox4_2" type="checkbox" class="js_bubble optOut2" value="Off"> <label
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
	
<div id="loadingDiv" class="waitingDiv" style="display: none; margin-left:auto; margin-right:auto;">
	<img style="width: 300px; height: 300px;" src="<%=request.getContextPath()%>/resources/images/loading.gif">
</div>
</body>