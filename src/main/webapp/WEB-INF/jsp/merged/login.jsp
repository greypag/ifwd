<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeQuoteBean"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />


<div class="modal fade bs-example-modal-lg " id="loginpopup"
		tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
		aria-hidden="true" style="display: none;">
		<div class="modal-dialog modal-lg">
			<div class="modal-content plan-modal">
				<form name="loginform" id="loginform-pop">
										<div class="login-form">
											<div
												style="display: none; position: absolute; left: 0; top: 0; bottom: 0; right: 0; background: #000; opacity: 0.8; z-index: 1000"
												id="ajax-loading">
												<img
													style="width: 100px; height: 100px; position: absolute; top: 40%; left: 40%"
													src="resources/images/ajax-loader.gif">
											</div>
											<div id="login-err-msg" class="alert alert-danger"
												role="alert" style="display: none;"></div>
											<div class="form-container">
												<h2><fmt:message key="header.login.heading" bundle="${msg}" /></h2>
												<h4 class="margin-shift">
													<fmt:message key="header.login.username" bundle="${msg}" /> <a href="forgotUserName"
														class="pull-right sub-link"><fmt:message key="header.login.username.forget" bundle="${msg}" /></a>
												</h4>

												<div class="form-group">
													<input type="text" name="userName" class="form-control"
														placeholder="" id="headerUserName">
												</div>
												<span id="errUserName" style="color: red"></span>
												
												<h4 class="margin-shift">
													<fmt:message key="header.login.password" bundle="${msg}" /> <a href="forgotPassword"
														class="pull-right sub-link"><fmt:message key="header.login.password.forget" bundle="${msg}" /></a>
												</h4>
												<div class="form-group">
													<input type="password" name="password" class="form-control" autocomplete="off"
														id="headerPassword">
												</div>
												<span id="errPass" style="color: red"></span> <br>
												<div class="row">
													<div class="col-lg-6 col-md-6">
														<button type="submit" onclick="return submitLoginForm('loginform-pop');"
															class="bdr-curve btn btn-primary btn-lg wd5"><fmt:message key="header.login.action" bundle="${msg}" /></button>
													</div>
													<h3
														class="text-left col-lg-6 col-md-6 pad-none margin-none">
														<span> <fmt:message key="header.login.registration.heading" bundle="${msg}" /></span><br> <a href="joinus">
															<fmt:message key="header.login.registration.action" bundle="${msg}" /></a>
													</h3>
													<div class="clearfix"></div>
												</div>
												<p><fmt:message key="header.login.disclaimer" bundle="${msg}" /></p>
											</div>
										</div>
									</form>
			</div>
		</div>
	</div>