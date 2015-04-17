<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<body class="homepage">

	<!--/#main-Content-->
	<script src="resources/js/validation.js"></script>
	<script>
		function getForgotUserName() {
			var validationFormVal = forgotUserName();
			if (validationFormVal == true) {
				$('#forgotusername-err-msg').hide();
				$('#ajax-loading').show();
				$
						.ajax({
							type : 'POST',
							url : 'forgotUser',
							data : $('#forgotUserNameForm input').serialize(),
							success : function(data) {

								$('#ajax-loading').hide();
								if (data == 'fail') {
									$('#success-message')
											.html(
													'Provided User Account Details Does Not Exist');
									$('#success-message').show();
									$('#user-details-main').hide();
									$('#hide-field').hide();
								} else if (data.indexOf('~~~') > -1) {
									$('#success-message').html(
											data.slice(5, 68));
									$('#success-message').show();
									$('#user-details-main').hide();
									$('#hide-field').hide();
								} else {
									$('#success-message').html(
											'Your Username is ' + data);
									$('#success-message').show();
								}

							},
							error : function(xhr, status, error) {
								$('#ajax-loading').hide();
							}
						});
			}
		}
	</script>





	<section>
		<div id="cn" class="container mob-pad">
			<div class="row">

				<ol class="breadcrumb pad-none">
					<li><a href="#"><fmt:message key="header.menu.home" bundle="${msg}" /></a></li>
					<li class="active"><i class="fa fa-caret-right"></i><fmt:message key="header.login.username.forget.part1" bundle="${msg}" /></li>
				</ol>
				<h2 class="page-title"><fmt:message key="header.login.username.forget.part1" bundle="${msg}" /></h2>
				<div
					style="display: none; position: absolute; left: 0; top: 0; bottom: 0; right: 0; background: #000; opacity: 0.8; z-index: 1000"
					id="ajax-loading">
					<img
						style="width: 100px; height: 100px; position: absolute; top: 50%; left: 50%;"
						src="resources/images/ajax-loader.gif">
				</div>

				<form name="forgotUserNameForm" id="forgotUserNameForm"
					action="forgotUserNameFields" method="post"
					commandName="forgotUserName">
					<div id="hide-field"></div>

					<div id="forgotusername-err-msg" class="alert alert-danger"
						role="alert" style="display: none;">
						<P id="error-mobile-no">
						<P id="error-email-id">
					</div>

					<div id="success-message" class="alert alert-success" role="alert"
						style="display: none;">
						<P id="error1">
					</div>
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"
						id="user-details-main">
						<table class="table activation-form">
							<tbody>
								<tr>
									<td colspan="2" class="pad-none"><h3
											class="black-bold pad-none"><fmt:message key="member.registration.tab.details" bundle="${msg}" /></h3></td>
								</tr>
								<tr>
									<td class="pad-none"><label class="control-label"><fmt:message key="member.registration.details.label.mobileNo" bundle="${msg}" /></label></td>
									<td class="pad-none"><input type="text" name="mobileNo"
										class="form-control" id="mobileNo" placeholder="手機號碼">
										<span id="errorEmptyMob" class="hide1"> <label
											class="text-red">請輸入 聯絡電話.</label>
									</span> <span id="errorInvalidMob" class="hide1"> <label
											class="text-red">聯絡電話需為 8 位數字，請重新輸入</label>
									</span></td>
								</tr>
								<tr>
									<td class="pad-none"><label class="control-label"><fmt:message key="member.registration.details.label.emailAddress" bundle="${msg}" />
									</label></td>
									<td class="pad-none"><input type="email"
										name="emailAddress" class="form-control" id="emailAddress"
										placeholder="電郵地址"> <span id="errorEmptyEmailId"
										class="hide1"> <label class="text-red">請輸入電郵地址</label>
									</span> <span id="errorInvalidEmailId" class="hide1"> <label
											class="text-red">請輸入正確/有效的 電郵地址</label>
									</span></td>
								</tr>


								<tr></tr>
								<tr>
									<td colspan="2">
										<button type="button" onclick="getForgotUserName()"
											class="bdr-curve-none btn btn-primary btn-lg "><fmt:message key="header.login.action2" bundle="${msg}" /></button>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div id="success-message"></div>
					<br>
				</form>
				<div class="clearfix"></div>
			</div>
			<!--/.row-->
		</div>
		<!--/.container-->
	</section>