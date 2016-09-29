<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<body class="homepage">




	<script>
		function forgotUserPassword1() {

			if (forgotPassword() == true) {

				$('#ajax-loading').show();
				$.ajax({
							type : 'POST',
							url : '<%=request.getContextPath()%>/forgotUserPassword',
							data : $('#forgotPasswordForm1 input').serialize(),
							success : function(data) {

								$('#ajax-loading').hide();
								if (data == 'fail') {
									$('#forgotpassword-err-msg1')
											.html(getBundle(getBundleLanguage, "member.login.forgotUserName.error"));
									$('#forgotpassword-err-msg1').show();
								} else if (data == 'success') {
									$('#success-message1')
											.html(getBundle(getBundleLanguage, "member.forgotPassword.success.message"));
									$('#success-message1').show();
								} else {
									$('#success-message1').html(getBundle(getBundleLanguage, "connection.lost.message"));
									$('#success-message1').show();
									$('#user-details-main').hide();
								}

							},
							error : function(xhr, status, error) {
								$('#ajax-loading').hide();
							}
						});
			}
		}
	</script>

	<!--/#main-Content-->

	<!--Main Content-->
	<section>
		<div id="cn" class="container mob-pad">
			<div class="row">
				<ol class="breadcrumb pad-none">
					<li><fmt:message key="header.menu.home" bundle="${msg}" /></li>
					<li class="active"><i class="fa fa-caret-right"></i> <fmt:message key="header.login.password.forget.part1" bundle="${msg}" /></li>
				</ol>
				<h2 class="page-title"><fmt:message key="header.login.password.forget.part1" bundle="${msg}" /></h2>
				<div
					style="display: none; position: absolute; left: 0; top: 0; bottom: 0; right: 0; background: #000; opacity: 0.8; z-index: 1000"
					id="ajax-loading">
					<img
						style="width: 100px; height: 100px; position: absolute; top: 50%; left: 50%;"
						src="<%=request.getContextPath()%>/resources/images/ajax-loader.gif">
				</div>
				<div class="col-lg-7 col-md-7 col-xs-12 col-sm-12 margin-left">
					<form name="forgotPasswordForm1" id="forgotPasswordForm1"
						action="forgotPassword" method="post"
						commandName="forgotUserPassword">
						<div id="hide-field"></div>
						<div id="forgotpassword-err-msg1" class="alert alert-danger"
							role="alert" style="display: none;">
							<P id="error1">
						</div>
						<div id="success-message1" class="alert alert-success" role="alert"
							style="display: none;">
							<P id="error1">
						</div>
						
						
						<!-- <div class="status alert alert-success" style="display: none"></div>-->
						<div id="user-details-main">
							<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
								<table class="table forgot-form">
									<tbody>
										<tr>
											<td colspan="2" class=""><h3
													class="black-bold pad-none"><fmt:message key="member.registration.tab.details" bundle="${msg}" /></h3></td>
										</tr>
										<tr>
											<td class=""><label class="control-label"><fmt:message key="member.registration.details.label.mobileNo" bundle="${msg}" /></label></td>
											<td class=""><input type="tel" name="mobileNo"
												class="form-control" id="fMobileNo" placeholder="<fmt:message key="member.registration.details.label.mobileNo.placeholder" bundle="${msg}" />"
												onkeypress="return isNumeric(event)"
												onblur="forgotPassword();"> <span
												id="errorFEmptyMob" class="hide1"> <label
													class="text-red"><fmt:message key="member.registration.details.label.mobileNo.errorEmptyMob" bundle="${msg}" /> </label>
											</span> <span class="hide1" id="errorFInvalidMob"> <label
													class="text-red"><fmt:message key="member.registration.details.label.mobileNo.errorInvalidMob" bundle="${msg}" /></label>
											</span></td>
										</tr>
										<tr>
											<td class=""><label class="control-label lhnormal"><fmt:message key="member.registration.details.label.emailAddress" bundle="${msg}" />
											</label></td>
											<td class=""><input type="email"
												name="emailAddress" class="form-control" id="fEmailAddress"
												onkeypress="return validationEmail(event);"
												onblur="forgotPassword();"
												placeholder="<fmt:message key="member.registration.details.label.emailAddress.placeholder" bundle="${msg}" />"> <span id="errorFEmptyEmailId"
												class="hide1"> <label class="text-red"><fmt:message key="member.registration.details.label.emailAddress.errorEmptyEmailId" bundle="${msg}" /> </label>
											</span> <span id="errorFInvalidEmailId" class="hide1"> <label
													class="text-red"><fmt:message key="member.registration.details.label.emailAddress.errorInvalidEmailId" bundle="${msg}" /></label>
											</span></td>

										</tr>
										<tr>
											<td class=""><label class="control-label"><fmt:message key="member.registration.details.label.userName" bundle="${msg}" />
											</label></td>
											<td class=""><input type="text" name="userName"
												class="form-control" id="fUserName" placeholder="<fmt:message key="member.registration.details.label.userName.placeholder" bundle="${msg}" />"
												onkeypress="return validationUsername(event);"
												onblur="forgotPassword();">
												<span id="errorFEmptyUName" class="hide1"> <label
													class="text-red"><fmt:message key="member.registration.details.label.userName.errorEmptyUName" bundle="${msg}" /></label>
											</span> <span id="errorFInvalidUName" class="hide1"> <label
													class="text-red"><fmt:message key="member.registration.details.label.userName.errorInvalidUName" bundle="${msg}" /></label>
											</span></td>

										</tr>
										<tr></tr>
										<tr>
											<td colspan="2">	
												<!-- <button type="button" onclick="forgotPassword()"
												class="bdr-curve-none btn btn-primary btn-lg ">Submit</button> -->

												<button type="button" onclick="forgotUserPassword1();"
													class="bdr-curve btn btn-primary btn-lg "><fmt:message key="member.registration.details.action" bundle="${msg}" /></button>

											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</form>
				</div>
				<!--/.row-->
			</div>
			<!--/.container-->
		</div>
	</section>