<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<fmt:setBundle basename="motor" var="motorMsg" />
<script type="text/javascript">
var context = "${pageContext.request.contextPath}";
var language = "${language}";
var nextPage = "${nextPageFlow}";
</script>

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css_dir/motor-styles.css" type="text/css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/motor/bootstrap-switch.min.css" type="text/css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/motor/selectize.bootstrap3.css" type="text/css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/js/motor/basic.min.css" type="text/css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/vendor/formValidation.min.css" type="text/css">
<script src="<%=request.getContextPath()%>/resources/js/vendor/formValidation.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/vendor/formValidation.bootstrap.min.js"></script>

<section id="" class="motor-confirmation motor-upload">
	<!-- Breadcrumb Component Start-->
	<div class="container container-fluid container--breadcrumb">
		<c:set var="breadcrumbItems">
			breadcrumb.item.home,breadcrumb.item.protect,breadcrumb.item.motor,breadcrumb.item.upload.document
		</c:set>
		<c:set var="breadcrumbActive">3</c:set>

		<jsp:include page="/WEB-INF/jsp/merged/comp/breadcrumb.jsp">
			<jsp:param name="breadcrumbItems" value="${breadcrumbItems}"/>
			<jsp:param name="breadcrumbActive" value="${breadcrumbActive}"/>
		</jsp:include>
	</div>
	<!-- Breadcrumb Component End-->

	<div class="container no-border" id="startUploadLaterSection">
		<div class="center">
			<h2><fmt:message key="motor.start.upload.later.title" bundle="${motorMsg}" /></h2>
			<p><fmt:message key="motor.start.upload.later.desc" bundle="${motorMsg}" /></p>
		</div>
		<div class="row">
			<form name="start-upload-later-form" action="" onsubmit="return false;">
				<div class="col-xs-12 col-sm-6">
					<div class="form-group">
						<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
							<div class="help-block-wrap">
								<input type="text" name="coverNote" class="form-control input--grey mdl-textfield__input" id="coverNote">
								<label class="mdl-textfield__label" for="coverNote"><fmt:message key="motor.start.upload.later.cover.note.label" bundle="${motorMsg}" /></label>
								<span id="errorCoverNote" class="text-red"></span>
								<span class="tooltip-icon glyphicon glyphicon-exclamation-sign" data-toggle="tooltip" title="<fmt:message key='motor.start.upload.later.popup' bundle='${motorMsg}'/>"></span>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xs-12 col-sm-6">
					<div class="form-group">
						<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
							<div class="help-block-wrap">
								<input type="text" name="hkid" style="text-transform:uppercase" class="form-control input--grey mdl-textfield__input" id="hkid">
								<label class="mdl-textfield__label" for="hkid"><fmt:message key="motor.start.upload.later.hkid.label" bundle="${motorMsg}" /></label>
								<span id="errorHkid" class="text-red"></span>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xs-12 submit-btn">
					<div class="content text-center">
						<button id="submitStartLater" class="bdr-curve btn btn-primary nxt-btn" onclick="proceedToUpload(this.form);">
							<fmt:message key="motor.start.upload.later.button" bundle="${motorMsg}" />
						</button>
						<div class="errorApi">
							<span class="text-red"></span>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</section>
<script type="text/javascript" charset="utf-8">
	$(document).ready(function(){
		$('[data-toggle="tooltip"]').tooltip();
		bootstrapvalidate_startUploadLater();
		$('.errorApi').hide();
	});
	
	function bootstrapvalidate_startUploadLater(){
		var form_1 = "form[name='start-upload-later-form']";
		var fields_1 = generate_common_validate_fields(form_1);
		generate_validate(form_1,fields_1);
	}
	
	function generate_validate(form,fields){
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
		.on('input keyup', '[name="hkid"]', function() {
			if ($(this).val().length > 0) {
				$(form)
					.formValidation('enableFieldValidators', 'hkid', true, 'callback')
					.formValidation('revalidateField', 'hkid');
			}else{
				$(form)
					.formValidation('enableFieldValidators', 'hkid', false, 'callback')
					.formValidation('revalidateField', 'hkid');
			}
		});
	}
	
	function generate_common_validate_fields(form){
		return {
			'coverNote': {
				container: form + ' #errorCoverNote',
				validators: {
					notEmpty: {
						message: '<fmt:message key="motor.start.upload.later.cover.note.error.required" bundle="${motorMsg}" />'
					}
				}
			},
			'hkid': {
				container: form + ' #errorHkid',
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
			}
		};
	}
	
	function proceedToUpload(form) {
		$('.errorApi').html();
		$('.errorApi').hide();
		
		var name = form.name;
		var form_selector = "form[name='"+ name +"']";
		$(form_selector).formValidation('validate');
		console.log($(form_selector).data('formValidation').isValid());
		var startUploadLaterData;
		if ($(form_selector).data('formValidation').isValid()) {
			// suppose ${refNumber} should appear when email redirect to this page
			var refNumber = '${refNumber}';
			//var refNumber = 'refNumber';
			startUploadLaterData = {"applicant":
													{"hkid": $(form_selector+' #hkid').val()},
													"refNumber": refNumber,
													"coverNoteNum": $(form_selector+' #coverNote').val()
												};
			console.log(startUploadLaterData);
			$.ajax({
				type : 'POST',
				// url : '<%=request.getContextPath()%>/{language}/joinus',
				url : Site.context + '/api/iMotor/policy/fileUpload/check',
				contentType: "application/json",
				data :  JSON.stringify(startUploadLaterData),
				async : false,
				cache: false,
				success : function(data) {				
					console.log('success');
					startUploadLaterData = {	"refNumber": refNumber,
												"coverNoteNum": $(form_selector+' #coverNote').val(),
												"amountDueAmount": data.policyPremium
											};
					var $form = $("<form id='quote-form' />");
					$form.attr("action", "document-upload-later");
					$form.attr("method", "post");
					var $quote = $("<input type='hidden' name='data' />");
					
				    $quote.attr("value", JSON.stringify(startUploadLaterData));
				    $form.append($quote);
					$("body").append($form);
					$('#quote-form').submit();
				}, 
				error : function(xhr, status, error) {
					console.log('error');
				}
			});
		}
		return false;
	}
	
	/* hkid validation script */
	function IsHKID(str) {
		var strValidChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

			// basic check length
			if (str.length < 8)
				return false;

		// handling bracket
		if (str.charAt(str.length - 3) == '(' && str.charAt(str.length - 1) == ')')
			str = str.substring(0, str.length - 3) + str.charAt(str.length - 2);

		// convert to upper case
		str = str.toUpperCase();

		// regular expression to check pattern and split
		var hkidPat = /^([A-Z]{1,2})([0-9]{6})([A0-9])$/;
		var matchArray = str.match(hkidPat);
		
		var hkidPat2 = /^([A-Z]{1,2})([0-9]{6})([(])([A0-9])([)])$/;
		var matchArray2 = str.match(hkidPat2);

		// not match, return false
		if (matchArray == null && matchArray2 == null)
			return false;

		// the character part, numeric part and check digit part
		var charPart = matchArray[1];
		var numPart = matchArray[2];
		var checkDigit = matchArray[3];

		// calculate the checksum for character part
		var checkSum = 0;
		if (charPart.length == 2) {
			checkSum += 9 * (10 + strValidChars.indexOf(charPart.charAt(0)));
			checkSum += 8 * (10 + strValidChars.indexOf(charPart.charAt(1)));
		} else {
			checkSum += 9 * 36;
			checkSum += 8 * (10 + strValidChars.indexOf(charPart));
		}

		// calculate the checksum for numeric part
		for (var i = 0, j = 7; i < numPart.length; i++, j--)
			checkSum += j * numPart.charAt(i);

		// verify the check digit
		var remaining = checkSum % 11;
		var verify = remaining == 0 ? 0 : 11 - remaining;

		return verify == checkDigit || (verify == 10 && checkDigit == 'A');
	}
</script>


