<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeQuoteBean"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="enhance" uri="http://pukkaone.github.com/jsp" %>
<%@page import="java.util.*"%>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<fmt:setBundle basename="wealthree" var="wealthreeMsg" />
<script type="text/javascript">
var context = "${pageContext.request.contextPath}";
var language = "${language}";
var planCode = '<%=request.getParameter("planCode")%>';
</script>
<%!
	boolean isSaleActiveClass = false;
	boolean isEservicesActiveClass = false;
%>

<link href="<%=request.getContextPath()%>/resources/css/mobiscroll.custom-2.17.2.min.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/resources/css/pnotify.custom.min.css" media="all" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/provie/provie-styles.css"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/wealthree/wealthree-customer-service-centre.css"/>

<div class="fwd-savie-wrapper savie-online-container with-breadcrumbs-steps provie-plan-appointment" id="make-an-appointment-page">			
	
	<!-- Breadcrumb Component Start-->
    <div class="container container-fluid container--breadcrumb">
		<c:set var="breadcrumbItems" value="breadcrumb.item.home"/>
		<c:set var="breadcrumbActive" value="0"/>

		<c:set var="breadcrumbItems">
			breadcrumb.item.home,breadcrumb.item.save,breadcrumb.item.wealthree,breadcrumb.item.appointment
		</c:set>
		<c:set var="breadcrumbActive">3</c:set>

		<jsp:include page="/WEB-INF/jsp/merged/comp/breadcrumb.jsp">
			<jsp:param name="breadcrumbItems" value="${breadcrumbItems}"/>
			<jsp:param name="breadcrumbActive" value="${breadcrumbActive}"/>
		</jsp:include>
	</div>
	<!-- Breadcrumb Component End-->

	<!-- StepIndicator Component Start-->

	<c:set var="stepItems" value="stepindicator.selectplan"/>
	<c:set var="stepActive" value="0"/>

	<c:set var="stepItems">
		stepindicator.selectplan,stepindicator.appointment,stepindicator.confirmation
	</c:set>
	<c:set var="stepActive">1</c:set>

	<!--<div class="container-fluid fwd-full-container browse-holder">-->
	<jsp:include page="/WEB-INF/jsp/merged/comp/step-indicator.jsp">
		<jsp:param name="stepItems" value="${stepItems}"/>
		<jsp:param name="stepActive" value="${stepActive}"/>
	</jsp:include>
	<!--</div>-->

<script>

$(function() {
   $(window).bind('scroll', function() {
      stickToHeader();
   });
});

function stickToHeader() {
   if ($('.js-sticky-bar').length > 0 ) { // check if flux div exists
      
      var stickyTarget = $('.logobox > .navbar-header');
      var stickySource = $('.js-sticky-bar');
      var thresholdHeight = stickySource.height() + $('.breadcrumbs').height(); //min scroll height to trigger sticky behavior

      if ($(window).scrollTop() >= (thresholdHeight)) {
         stickySource.addClass('sticky-bar');
         stickySource.css('top', stickyTarget.height() + 'px');
      } else {
         stickySource.removeClass('sticky-bar');
         stickySource.removeAttr('style');
         stickySource.removeAttr('style');
      }
   }
}

</script>




		     <!--</div>-->

		<!-- StepIndicator Component End-->
       <div class="container-fluid fwd-container make-an-appointment headerStick" id="payment-page">
         <div class="row" id="appointment-form-holder">
             
               <div class="col-xs-12 col-md-6" id="left-side-form">
                   <h5><fmt:message key="wealthree.appoint.text1" bundle="${wealthreeMsg}" /></h5>
					<p class="confirm-call"><fmt:message key="wealthree.appoint.text2" bundle="${wealthreeMsg}" /></p>
					<p class="confirm-call"><fmt:message key="wealthree.appoint.text3" bundle="${wealthreeMsg}" /></p>
					<div class="">
						<div class="payment-select-wrapper">
							<p class="bank-info-select-label"><fmt:message key="wealthree.appoint.dropdown.cscentre" bundle="${wealthreeMsg}" /></p>
		                   <div class="selectDiv centreDiv gray-text-bg">
		                      <select name="centre" id="centre" class="form-control gray-dropdown">
		                        
		                      </select>
		                      <img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg">
		                   </div>
		                   <span class="error-msg centreErrMsg"></span>
		               </div>
		           </div>
		           <div class="centre-info visible-xs visible-sm" id="centre-info">
		           		<img src="/resources/images/savie/qb.jpg" class="img-centre img-responsive">
		           		<h4><fmt:message key="wealthree.appoint.address" bundle="${wealthreeMsg}" /></h4>
		           		<p class="centre-address"></p>
		           		<a target="_blank" class="viewmap-link" href="#"><fmt:message key="wealthree.appoint.viewmap" bundle="${wealthreeMsg}" /></a>
		           	</div>
		           <div class="">
						<div class="payment-select-wrapper so-mdl-textfield">
							<p class="bank-info-select-label"><fmt:message key="wealthree.appoint.dropdown.date" bundle="${wealthreeMsg}" /></p>  
		                   <div class="selectDiv preferred-date gray-text-bg">
		                      <input name="app-date" id="app-date" value="" class="form-control" />
		                      <img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg">
		                   </div>
		                   <span class="error-msg app-dateErrMsg"></span>
		                </div>
		            </div>
		            <div class="">
						<div class="payment-select-wrapper so-mdl-textfield">
							<p class="bank-info-select-label"><fmt:message key="wealthree.appoint.dropdown.time" bundle="${wealthreeMsg}" /></p>
		                    <div class="selectDiv timeslot gray-text-bg">
		                      <select name="preferred-time" id="preferred-time" class="form-control gray-dropdown">
		                          <option value="11:30"></option>
		                      </select>
		                      <img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg">
		                   </div>
		                   <span class="error-msg preferred-timeErrMsg"></span>
		                </div>
		           </div>
		           <div class="after-login">
						<div class="form-group">
                            <div class="fld-wrapper">
                                <p class="fld-label"><fmt:message key="wealthree.appoint.afterlogin.text" bundle="${wealthreeMsg}" /></p>
                                <p class="fld-val"></p>
                            </div>
                        </div>
		           </div>
		           <div class="confirm-button-group text-center">
						<button type="button" class="btn-primary js-btn-submit" id="btn-appointment-confirm"><fmt:message key="wealthree.appoint.confirm" bundle="${wealthreeMsg}" /></button>
						<span class="error-msg generalErrMsg"></span>
						<div class="login-error-wrapper">
							<div id="login-err-msg" class="color-red heading-h5" role="alert"></div>
						</div>
					</div>
		           <div class="before-login">
		           <h5><fmt:message key="wealthree.appoint.login.title" bundle="${wealthreeMsg}" /></h5>
			           <div>
							<div class="panel-group" id="accordion">
								<div class="panel">
									<div class="panel-heading">
										<h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#pan-login"><fmt:message key="wealthree.appoint.text4" bundle="${wealthreeMsg}" /><img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg"></a></h4>
									</div>
									<div id="pan-login" class="panel-collapse collapse in">
										<div class="panel-body">
											<div class="sub-pan show" id="sub-pan-login">
												<form name="form-appointment-login" id="form-appointment-login" method="post">
													<div class="form-group">
														<!--使用者名 -->
														<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
															<input type="text" name="userName" class="form-control gray-textbox check-emp login-input mdl-textfield__input" id="appointmentloginUsername">
															<label class="mdl-textfield__label" for="appointmentloginUsername"><fmt:message key="wealthree.appoint.username" bundle="${wealthreeMsg}" /></label>
															
														</div>
														<span class="error-msg userNameErrMsg"></span>
													</div>
													<!-- 忘記使用者名 -->
													<div class="text-right">
														<a class="heading-h6 btn-sub-pan-trigger" href="#sub-pan-forgot-username"><fmt:message key="wealthree.appoint.forget.username" bundle="${wealthreeMsg}" />?</a>
													</div>
													<div class="form-group">
														<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
															<input type="password" name="password" class="form-control check-emp-forgotusername login-input gray-textbox mdl-textfield__input" autocomplete="off" id="appointmentloginPassword">
															<label class="mdl-textfield__label" for="appointmentloginPassword"><fmt:message key="wealthree.appoint.password" bundle="${wealthreeMsg}" /></label>												
														</div>
														<span class="error-msg passwordErrMsg"></span>
													</div>
													<div class="text-right">
														<!--忘記密碼 -->
														<a class="heading-h6 btn-sub-pan-trigger" href="#sub-pan-forgot-pwd"><fmt:message key="wealthree.appoint.forget.password" bundle="${wealthreeMsg}" />?</a>
													</div>
													<div class="login-button-group text-center">
														<button type="button" class="btn-primary js-btn-submit" id="btn-appointment-login"><fmt:message key="wealthree.appoint.register.cta.login" bundle="${wealthreeMsg}" /></button>
														<span class="error-msg loginPanErrMsg"></span>
													</div>
												</form>
											</div>
											<div class="sub-pan" id="sub-pan-forgot-username">
												<form name="form-appointment-forgot-username" id="form-appointment-forgot-username" method="post">
													<!-- 電話 inout -->
													<div class="panel-heading">
														<h4 class="panel-title"><fmt:message key="wealthree.appoint.forget.username" bundle="${wealthreeMsg}" /><a href="#sub-pan-login" class="btn-sub-pan-trigger"><i class="glyphicon glyphicon-remove"></i></a></h4>
													</div>
													
													<div class="hide alert alert-success your_username_box">
														<span id="your_username"></span>
													</div>

													<div class="form-group">
														<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
															<input type="tel" name="mobileNo" class="form-control gray-textbox check-emp-forgotusername login-input mdl-textfield__input" id="appointmentForgotUsernameMobileNo">
															<label class="mdl-textfield__label" for="appointmentForgotUsernameMobileNo"><fmt:message key="wealthree.appoint.register.mobileno" bundle="${wealthreeMsg}" /></label>
										                </div>
										                <span class="error-msg mobileNoErrMsg"></span>

													</div>

													<div class="form-group">
														<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
															<input type="email" name="emailAddress" class="form-control gray-textbox mdl-textfield__input check-emp-forgotusername login-input" id="appointmentForgotUsernameEmailAddress" >
															<label class="mdl-textfield__label" for="appointmentForgotUsernameEmailAddress"><fmt:message key="wealthree.appoint.register.email" bundle="${wealthreeMsg}" /></label>
									                     </div>
									                     <span class="error-msg emailAddressErrMsg"></span>

													</div>


													<div class="login-button-group forgot-group text-center">
														<button type="button" class="btn-primary js-btn-submit" id="btn-appointment-forgot-username"><fmt:message key="wealthree.appoint.register.cta.submit" bundle="${wealthreeMsg}" /></button>
														<span class="error-msg forgotUsernamePanErrMsg"></span>
													</div>
							                    </form>

											</div>

											<div class="sub-pan" id="sub-pan-forgot-pwd">
												<form name="form-appointment-forgot-pwd" id="form-appointment-forgot-pwd" method="post">
													<div class="panel-heading">
														<h4 class="panel-title"><fmt:message key="wealthree.appoint.forget.password" bundle="${wealthreeMsg}" /><a href="#sub-pan-login" class="btn-sub-pan-trigger"><i class="glyphicon glyphicon-remove"></i></a></h4>
													</div>
													<!-- 電話 input -->
													<div class="form-group">
														<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
															<input type="tel" name="mobileNo" class="form-control check-emp-forgotuserpassoword login-input gray-textbox mdl-textfield__input" id="appointmentForgotPwdMobileNo">
															<label class="mdl-textfield__label" for="mobileNo-forgotpassowrd"><fmt:message key="wealthree.appoint.register.mobileno" bundle="${wealthreeMsg}" /></label>
														</div>
														<span class="error-msg mobileNoErrMsg"></span>
													</div>

													<!-- 電郵 input-->
													<div class="form-group">
														<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
															<input type="email" name="emailAddress" class="form-control check-emp-forgotuserpassoword login-input gray-textbox mdl-textfield__input" id="appointmentForgotPwdEmailAddress">
															<label class="mdl-textfield__label" for="appointmentForgotPwdEmailAddress"><fmt:message key="wealthree.appoint.register.email" bundle="${wealthreeMsg}" /></label>
														</div>
														<span class="error-msg emailAddressErrMsg"></span>
													</div>

													<!-- 使用者input -->

													<div class="form-group">
														<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
															<input type="text" name="userName" class="form-control check-emp-forgotuserpassoword login-input gray-textbox mdl-textfield__input" id="appointmentForgotPwdUsername">
															<label class="mdl-textfield__label" for="userName"><fmt:message key="wealthree.appoint.username" bundle="${wealthreeMsg}" /></label>
														</div>
														<span class="error-msg userNameErrMsg"></span>
													</div>





													<div class="login-button-group forgot-group text-center">
														<button type="button" class="btn-primary js-btn-submit" id="btn-appointment-forgot-pwd"><fmt:message key="wealthree.appoint.register.cta.submit" bundle="${wealthreeMsg}" /></button>
														<span class="error-msg forgotPwdPanErrMsg"></span>

													</div>
												</form>

											</div>

										</div>
									</div>
								</div>
								<div class="panel">
									<div class="panel-heading">
										<h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#pan-register"><fmt:message key="wealthree.appoint.register.title" bundle="${wealthreeMsg}" /><img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg"></a></h4>
									</div>
									<div id="pan-register" class="panel-collapse collapse">
										<div class="panel-body">
										<form name="form-appointment-register" id="form-appointment-register" method="post">
												<div class="form-group">
													<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
														<input type="text" name="fullName" class="form-control gray-textbox check-emp login-input mdl-textfield__input" id="appointmentRegisterFullName" data-keyblock-alphabet-space="true" autocomplete="off" maxlength="100">
														<label class="mdl-textfield__label" for="appointmentRegisterFullName"><fmt:message key="wealthree.appoint.register.name" bundle="${wealthreeMsg}" /> <span class="small-txt"><fmt:message key="wealthree.appoint.register.name.remarks" bundle="${wealthreeMsg}" /></span></label>
													</div>
													<span class="error-msg FullNameErrMsg"></span>
												</div>
												<div class="form-group">
													<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
														<input type="tel" name="mobileNo" class="form-control gray-textbox check-emp login-input mdl-textfield__input" id="appointmentRegisterMobileNo" data-keyblock-num="true">
														<label class="mdl-textfield__label" for="appointmentRegisterMobileNo"><fmt:message key="wealthree.appoint.register.mobileno" bundle="${wealthreeMsg}" /></label>
													</div>
													<span class="error-msg mobileNoErrMsg"></span>
												</div>
												<div class="form-group" data-toggle="popover" data-placement="top" data-trigger="focus" data-content="Insurance certificate will be sent to this email address">
													<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
														<input type="text" name="EmailAddress" class="form-control gray-textbox check-emp login-input mdl-textfield__input" id="appointmentRegisterEmailAddress">
														<label class="mdl-textfield__label" for="appointmentRegisterEmailAddress"><fmt:message key="wealthree.appoint.register.email" bundle="${wealthreeMsg}" /></label>
													</div>
													<span class="error-msg EmailAddressErrMsg"></span>
												</div>
												<div class="form-group">
													<!--使用者名 -->
													<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
														<input type="text" name="userName" class="form-control gray-textbox check-emp login-input mdl-textfield__input" id="appointmentRegisterUserName">
														<label class="mdl-textfield__label" for="appointmentRegisterUserName"><fmt:message key="wealthree.appoint.username" bundle="${wealthreeMsg}" /></label>
													</div>
													<span class="error-msg userNameErrMsg"></span>
												</div>
												<div class="form-group">
													<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
														<input type="password" name="password" class="form-control check-emp-forgotusername login-input gray-textbox mdl-textfield__input" autocomplete="off" id="appointmentRegisterPassword">
														<label class="mdl-textfield__label" for="appointmentRegisterPassword"><fmt:message key="wealthree.appoint.register.pw" bundle="${wealthreeMsg}" /></label>											
													</div>
													<span class="error-msg passwordErrMsg"></span>
												</div>
												<div class="form-group">
													<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
														<input type="password" name="confirmPassword" class="form-control check-emp-forgotusername login-input gray-textbox mdl-textfield__input" autocomplete="off" id="appointmentRegisterConfPass">
														<label class="mdl-textfield__label" for="appointmentRegisterConfPass"><fmt:message key="wealthree.appoint.register.confirmpw" bundle="${wealthreeMsg}" /></label>
													</div>
													<span class="error-msg confirmPasswordErrMsg"></span>
												</div>
												<div class="declaration">
													<h4><fmt:message key="wealthree.appoint.register.declaration.title" bundle="${wealthreeMsg}" /></h4>
													<div class="form-group">
														<div class="checkbox"><input id="checkbox1" name="checkbox1" type="checkbox" class=""><label for="checkbox1"><fmt:message key="wealthree.appoint.register.declaration1.text1" bundle="${wealthreeMsg}" /> <a href="https://www.fwd.com.hk/~/media/Files/FWDHK/pdf/others/fwd-online-member-en.pdf?la=en" target="blank"><fmt:message key="wealthree.appoint.register.declaration1.text2" bundle="${wealthreeMsg}" /></a> <fmt:message key="wealthree.appoint.register.declaration1.text3" bundle="${wealthreeMsg}" /></label></div>
														<span class="error-msg checkbox1ErrMsg"></span>
													</div>
													<hr>
													<p><fmt:message key="wealthree.appoint.register.declaration2.text1" bundle="${wealthreeMsg}" /></p>
													<div class="checkbox"><input id="checkbox3" name="checkbox3" type="checkbox"><label for="checkbox3"><fmt:message key="wealthree.appoint.register.declaration2.text2" bundle="${wealthreeMsg}" /></label></div> 
													<div class="checkbox"><input id="checkbox4" name="checkbox4" type="checkbox"><label for="checkbox4"><fmt:message key="wealthree.appoint.register.declaration2.text3" bundle="${wealthreeMsg}" /></label> </div>
													<div class="checkboxBubble"><fmt:message key="wealthree.appoint.register.declaration2.text4" bundle="${wealthreeMsg}" /></div>
												</div>
												<div class="login-button-group text-center">
													<button type="button" class="btn-primary js-btn-submit" id="btn-appointment-register"><fmt:message key="wealthree.appoint.register.cta.activate" bundle="${wealthreeMsg}" /></button>
													<span class="error-msg regPanErrMsg"></span>
												</div>
										</form>
										</div>
									</div>
								</div>
							</div>
			           </div> 
		           </div>    
                </div>
                <div class="col-xs-12 col-md-6" id="right-side-form">
                   <div class="centre-info visible-md visible-lg" id="centre-info">
                      <img class="img-centre img-responsive">
                      <h4><fmt:message key="wealthree.appoint.address" bundle="${wealthreeMsg}" /></h4>
                      <p class="centre-address"></p>
                      <a target="_blank" class="viewmap-link" href="#"><fmt:message key="wealthree.appoint.viewmap" bundle="${wealthreeMsg}" /></a>
                   </div>
                </div>
                <div class="col-xs-12">
                    <div class="text-center clearfix">
                      
                      
                      
                   </div>
                </div>   
             
         </div>
       </div>
	<!-- FOOTER -->
		<!--Modal in Customer Service Centre-->
		<div id="loading-overlay" class="modal fade bs-loading-modal-lg" tabindex="-1" role="dialog">
			<div class="modal-dialog modal-lg loading-dialog">
				<div class="modal-content plan-modal loading-modal">
					<img src="<%=request.getContextPath()%>/resources/images/loading.gif"
						width="300" />
				</div>
			</div>
		</div>
				
		<div class="modal fade" role="dialog" aria-labelledby="pickAnotherCentre" id="pickAnotherCentre">
			<div class="modal-dialog teaserSurvey" role="document">
				<div class="modal-content teaserSurvey">
					<div class="modal-header teaserSurvey">
						<!--<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>-->
						<h2><fmt:message key="wealthree.appoint.popup.errormsg.text1" bundle="${wealthreeMsg}" /></h2>
					</div>
					<div class="modal-body teaserSurvey">
						<p class="registered"><fmt:message key="wealthree.appoint.popup.errormsg.text2" bundle="${wealthreeMsg}" /></p>
						
						<!--<button type="submit" class="btn btn-white btn-thank-you" id="teaser-mmodal-submit">Submit</button>-->
						<button type="button" class="btn btn-orange" id="pick-another-centre-btn"><fmt:message key="wealthree.appoint.popup.errormsg.tryagain" bundle="${wealthreeMsg}" /></button>
					</div>
				</div><!-- /.modal-content -->
			</div><!-- /.modal-dialog -->	
		</div><!-- /.modal -->
		
		<!--Modal in Customer Service Centre-->
		<div class="modal fade" role="dialog" aria-labelledby="fullyBooked" id="fullyBooked" data-backdrop="static" data-keyboard="false">
			<div class="modal-dialog teaserSurvey" role="document">
				<div class="modal-content teaserSurvey">
					<div class="modal-header teaserSurvey">
						<!--<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>-->
						<h2><fmt:message key="wealthree.appoint.popup.fully.booked.title" bundle="${wealthreeMsg}" /></h2>
					</div>
					<div class="modal-body teaserSurvey">	
						<!--<button type="submit" class="btn btn-white btn-thank-you" id="teaser-mmodal-submit">Submit</button>-->
						<button type="button" class="btn btn-orange" id="fullyBooked-button"><fmt:message key="wealthree.appoint.popup.fully.booked.btn" bundle="${wealthreeMsg}" /></button>
					</div>
				</div><!-- /.modal-content -->
			</div><!-- /.modal-dialog -->	
		</div><!-- /.modal -->
		
		<!--Modal in Customer Service Centre  preferedTimeIsNull-->
		<div class="modal fade" role="dialog" aria-labelledby="preferedTimeIsNull" id="preferedTimeIsNull" data-backdrop="static" data-keyboard="false">
			<div class="modal-dialog teaserSurvey" role="document">
				<div class="modal-content teaserSurvey">
					<div class="modal-header teaserSurvey">
						<!--<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>-->
						<h2><fmt:message key="wealthree.appoint.popup.prefered.time.slot.null.title" bundle="${wealthreeMsg}" /></h2>
					</div>
					<div class="modal-body teaserSurvey">
						<!-- <p class="registered">preferedTimeIsNull</p> -->
						
						<!--<button type="submit" class="btn btn-white btn-thank-you" id="teaser-mmodal-submit">Submit</button>-->
						<button type="button" class="btn btn-orange" id="prefered-time-is-null-btn"><fmt:message key="wealthree.appoint.popup.prefered.time.slot.null.btn" bundle="${wealthreeMsg}" /></button>
					</div>
				</div><!-- /.modal-content -->
			</div><!-- /.modal-dialog -->	
		</div><!-- /.modal -->
		
		
		<!--Modal in Customer Service Centre (access code had been used)-->
		<div class="modal fade" role="dialog" aria-labelledby="accessCodeUsed" id="accessCodeUsed">
			<div class="modal-dialog teaserSurvey" role="document">
				<div class="modal-content teaserSurvey">
					<div class="modal-header teaserSurvey">
						<h2>You have submitted an appointment.</h2>
					</div>
					<div class="modal-body teaserSurvey">
						<p class="registered">Please start it over if you need to setup another one.</p>
						<button type="button" class="btn btn-orange" id="back-to-home-btn">Back to home</button>
					</div>
				</div><!-- /.modal-content -->
			</div><!-- /.modal-dialog -->	
		</div><!-- /.modal -->
		
		<!--Modal in Customer Service Centre-->
		<div class="modal fade" role="dialog" aria-labelledby="perferredTimeIsNull" id="perferredTimeIsNull">
			<div class="modal-dialog teaserSurvey" role="document">
				<div class="modal-content teaserSurvey">
					<div class="modal-header teaserSurvey">
						<!--<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>-->
						<h2>Sorry, the center or date/time you selected is not available.</h2>
					</div>
					<div class="modal-body teaserSurvey">
						<p class="registered">Please select another center or try again tomorrow.</p>
						
						<!--<button type="button" class="btn btn-white btn-thank-you" id="teaser-mmodal-submit">Submit</button>-->
						<button type="button" class="btn btn-orange" id="perferredTimeIsNull-btn">Try again</button>
					</div>
				</div><!-- /.modal-content -->
			</div><!-- /.modal-dialog -->	
		</div><!-- /.modal -->
		
		<!--Modal in Customer Service Centre (Reservation Invalid)-->
		<div class="modal fade" role="dialog" aria-labelledby="reservationInvalid" id="reservationInvalid">
			<div class="modal-dialog teaserSurvey" role="document">
				<div class="modal-content teaserSurvey">
					<div class="modal-header teaserSurvey">
						<h2><fmt:message key="savie.customerServiceCentre.reservationInvalid" bundle="${msg}" /></h2>
					</div>
					<div class="modal-body teaserSurvey">
						<p class="registered"><fmt:message key="savie.customerServiceCentre.reservationInvalid.body" bundle="${msg}" /></p>
						<button type="button" class="btn btn-orange" id="reservationInvalid-btn"><fmt:message key="savie.customerServiceCentre.modalPickAnotherCenter" bundle="${msg}" /></button>
					</div>
				</div><!-- /.modal-content -->
			</div><!-- /.modal-dialog -->	
		</div><!-- /.modal -->
		
		<!--Modal in Customer Service Centre (More than 2 tries)-->
		<div class="modal fade cs-modal" role="dialog" aria-labelledby="moreThan2Tries" id="moreThan2Tries" data-backdrop="static" data-keyboard="false">
			<div class="modal-dialog teaserSurvey cs-modal-dialog" role="document">
				<div class="modal-content teaserSurvey cs-modal-content">
					<div class="modal-header teaserSurvey cs-modal-header">
						<h2 class="cs-modal-h2"><fmt:message key="wealthree.appoint.moreThan2Triesmodalheader" bundle="${wealthreeMsg}" /></h2>
					</div>
					<div class="modal-body teaserSurvey cs-modal-body">
						<p class="registered cs-modal-p"><fmt:message key="wealthree.appoint.moreThan2Triesmodalbody" bundle="${wealthreeMsg}" /></p>
						<button type="button" class="btn btn-orange cs-modal-btn" id="moreThan2Tries-button"><fmt:message key="wealthree.appoint.moreThan2TriesmodalbtnTxt" bundle="${wealthreeMsg}" /></button>
					</div>
				</div><!-- /.modal-content -->
			</div><!-- /.modal-dialog -->	
		</div><!-- /.modal -->
</div>

<!-- JS INCLUDES -->
<script type="text/javascript">
	var language = "en";
	var getpath = context;
	
	var startDate= new Date((new Date()).getTime() + 3*24*60*60*1000);
	var endDate= new Date((new Date()).getTime() + 24*24*60*60*1000);
	var sFullDate= new Date();
	var eFullDate= new Date((new Date()).getTime() - 24*60*60*1000);
	$(document).ready(function() {
		
				
		$('#pick-another-centre-btn').click(function(){
			$('#pickAnotherCentre').modal('hide');
		});
		$('#fullyBooked-button').click(function(){
			//$('#fullyBooked').modal('hide');
			window.location = '<%=request.getContextPath()%>/${language}/savings-insurance/wealthree';  
		});
		$('#moreThan2Tries-button').click(function(){
			window.location = '<%=request.getContextPath()%>/${language}/savings-insurance/wealthree';
		});
		$('#perferredTimeIsNull-btn').click(function(){
			$('#perferredTimeIsNull').modal('hide');
		});
		$('#reservationInvalid-btn').click(function(){
			$('#reservationInvalid').modal('hide');
		});
	
		$('#back-to-home-btn').click(function(){
			window.location.href= context + "/" + language + "/savings-insurance/wealthree";
		});
		$('#prefered-time-is-null-btn').click(function(){
			$('#preferedTimeIsNull').modal('hide');
		});

		return;
//Check is more than 2 tries from backend
		var isMoreThan2Tries = false;
		if(isMoreThan2Tries){
			$('#paymentForm select, #paymentForm input, #paymentForm button').prop('disabled', 'disabled');
			$('#moreThan2Tries').modal('show');
		}
		
		/* var csCenter = $("#centre").val();
		var perferredDate = $("#preferred-date").val();
		var perferredTime = $("#preferred-time").val();
		if(csCenter == "" && perferredDate == "" && perferredTime == "") {
			$('#fullyBooked').modal('show');
		} */
		//console.log('');
		//console.log('');
		
		if($("#full-date").length > 0){
			$('#fullyBooked').modal('show');
		}
		
		
		var dataQB='[2016-07-30, 2016-08-06, 2016-08-13, 2016-08-14, 2016-08-15, 2016-08-16, 2016-08-17, 2016-08-18, 2016-08-19]';
		$('#preferred-date-QB').datepicker({
		 	format: "dd-mm-yyyy",
			container: "#date",
			startDate: startDate,
			endDate: endDate,
			autoclose: true,
			beforeShowDay:function(Date){
			    var curr_date = Date.toJSON().substring(0,10);
			    if (dataQB.indexOf(curr_date)>-1){
			    	return false;        
			    }
			}
		}).on('changeDate', function (ev) {
			
			if(ev.date != null){
				$("#preferred-date-mirror").val($("#preferred-date-QB").val().trim());
				$("#preferred-date").val($("#preferred-date-QB").val().trim());
			}
			else{
				$('#preferred-date').datepicker('update', $("#preferred-date-mirror").val().trim());
			}
			if($("#centre").val().trim() != "" && $("#preferred-date-QB").val().trim() != ""){
				getTimeSlot('', '1');
			}
			else{
				$("#preferred-time").empty();
				$("#preferred-time").prepend("<option value=''></option>");
			}
		});
		
		var dataTST='[2016-08-06, 2016-08-14, 2016-08-15, 2016-08-16, 2016-08-17, 2016-08-18, 2016-08-19]';
		$('#preferred-date-TST').datepicker({
		 	format: "dd-mm-yyyy",
			container: "#date",
			startDate: startDate,
			endDate: endDate,
			autoclose: true,
			beforeShowDay:function(Date){
			    var curr_date = Date.toJSON().substring(0,10);
			    if (dataTST.indexOf(curr_date)>-1){
			    	return false;        
			    }
			}
		}).on('changeDate', function (ev) {
			if(ev.date != null){
				$("#preferred-date-mirror").val($("#preferred-date-TST").val().trim());
				$("#preferred-date").val($("#preferred-date-TST").val().trim());
			}
			else{
				$('#preferred-date').datepicker('update', $("#preferred-date-mirror").val().trim());
			}
			if($("#centre").val().trim() != "" && $("#preferred-date-TST").val().trim() != ""){
				getTimeSlot('', '1');
			}
			else{
				$("#preferred-time").empty();
				$("#preferred-time").prepend("<option value=''></option>");
			}
		});
		
		var dataSW='[2016-07-30, 2016-08-06, 2016-08-13, 2016-08-14, 2016-08-15, 2016-08-16, 2016-08-17, 2016-08-18, 2016-08-19]';
		$('#preferred-date-SW').datepicker({
		 	format: "dd-mm-yyyy",
			container: "#date",
			startDate: startDate,
			endDate: endDate,
			autoclose: true,
			beforeShowDay:function(Date){
			    var curr_date = Date.toJSON().substring(0,10);
			    if (dataSW.indexOf(curr_date)>-1){
			    	return false;        
			    }
			}
		}).on('changeDate', function (ev) {
			if(ev.date != null){
				$("#preferred-date-mirror").val($("#preferred-date-SW").val().trim());
				$("#preferred-date").val($("#preferred-date-SW").val().trim());
			}
			else{
				$('#preferred-date').datepicker('update', $("#preferred-date-mirror").val().trim());
			}
			if($("#centre").val().trim() != "" && $("#preferred-date-SW").val().trim() != ""){
				getTimeSlot('', '1');
			}
			else{
				$("#preferred-time").empty();
				$("#preferred-time").prepend("<option value=''></option>");
			}
		});
		
		var dataKF='[2016-07-29, 2016-07-30, 2016-08-05, 2016-08-06, 2016-08-12, 2016-08-13, 2016-08-14, 2016-08-15, 2016-08-16, 2016-08-17, 2016-08-18, 2016-08-19]';
		$('#preferred-date-KF').datepicker({
		 	format: "dd-mm-yyyy",
			container: "#date",
			startDate: startDate,
			endDate: endDate,
			autoclose: true,
			beforeShowDay:function(Date){
			    var curr_date = Date.toJSON().substring(0,10);
			    if (dataKF.indexOf(curr_date)>-1){
			    	return false;        
			    }
			}
		}).on('changeDate', function (ev) {
			if(ev.date != null){
				$("#preferred-date-mirror").val($("#preferred-date-KF").val().trim());
				$("#preferred-date").val($("#preferred-date-KF").val().trim());
			}
			else{
				$('#preferred-date').datepicker('update', $("#preferred-date-mirror").val().trim());
			}
			if($("#centre").val().trim() != "" && $("#preferred-date-KF").val().trim() != ""){
				getTimeSlot('', '1');
			}
			else{
				$("#preferred-time").empty();
				$("#preferred-time").prepend("<option value=''></option>");
			}
		});
		
		$("#preferred-date-TST").show();
		var serviceCentreCode = 'TST';
		setCentre(serviceCentreCode);
		
		if($("#centre").val().trim() != "" && $("#preferred-date-" + serviceCentreCode).val() != ""){
			getTimeSlot('', '1');
		}
		
		$('#centre').on('change', function() {
			var centre = $('#centre option:selected').val();
			togglePreferred('preferred-date-'+ centre)
			if($("#centre").val().trim() != "" && $("#preferred-date-"+ centre).val().trim() != ""){
				$("#preferred-date").val($("#preferred-date-"+ centre).val());
				getTimeSlot('', '1');
			}
		});

		$('#preferred-date').datepicker({
          format: "dd-mm-yyyy",
          //format: 'yy-mm-dd',
          container: "#date",
          startDate: new Date(),
          autoclose: true
       });

       $('#centre').on('change', function() {
           var centre = $('#centre option:selected').val();
           setCentre(centre);
        });
       $('.selectDiv').find('span').remove();
       console.log($('.ui-select > #centre-button > span').text());
       $('#centre-button > span').remove();
       applicationCentre();
       function applicationCentre() {
          if(getWidth()>=992) {
             var inner_centre_html = $('#inline-centre').html();

             $('#inline-centre').addClass('hidden');
             $('#right-centre').append(inner_centre_html).removeClass('hidden');
             $('#inline-centre').html('');

          }
          else {
             var inner_centre_html = $('#right-centre').html();

             $('#inline-centre').append(inner_centre_html).removeClass('hidden');
             $('#right-centre').html('');
          }
       }
       
		$('#pick-another-centre-btn').click(function(){
			$('#pickAnotherCentre').modal('hide');
		});
		$('#fullyBooked-button').click(function(){
			$('#fullyBooked').modal('hide');
			window.location = '/fwdhk/en/FNA/review';
			//window.location = '/fwdhk/en/savings-insurance/plan-details-sp?type=3';
		});
		$('#moreThan2Tries-button').click(function(){
			alert('clicked');
			//window.location = '/fwdhk/en/savings-insurance/plan-details-sp';
			window.location.href= context + "/" + language + "/savings-insurance/wealthree";
		});
		$('#perferredTimeIsNull-btn').click(function(){
			$('#perferredTimeIsNull').modal('hide');
		});
		$('#reservationInvalid-btn').click(function(){
			$('#reservationInvalid').modal('hide');
		});
	
		$('#back-to-home-btn').click(function(){
			window.location.href= context + "/" + language + "/savings-insurance";
		});
		$("#btn-cstmr-srvc-cnter-eh").on('click', function(){
	    	var planCode = "ROPHI1";
			
	    	var csCenter = $("#centre").val();
			var perferredDate = $("#preferred-date").val();
			var perferredTime = $("#preferred-time").val();
			if(csCenter == "" && perferredDate == "" && perferredTime == "") {
				$('#fullyBooked').modal('show');
			}else if(perferredTime == null || perferredTime.trim() == ""){
				$('#perferredTimeIsNull').modal('show');
			}else{
				$.ajax({     
				    url:context+'/ajax/savings-insurance/upsertAppointment',
				    type:'post',     
				    data:{    
				    	"csCenter": csCenter,
				        "perferredDate":perferredDate,
				        "perferredTime":perferredTime,
				        "planCode":planCode,
				        "remarks":"",
				        "type":"4"
			   		},     
				    error:function(){       
				    },     
				    success:function(data){
				    	if(data.errMsgs == null){
				    		//send email
				    		$("#paymentForm").attr("action", '/fwdhk/en/savings-insurance/confirmation-appointment');
					    	$("#paymentForm").submit();
				    	}else if(data.errMsgs == "Access code has already been used"){
				    		$('#accessCodeUsed').modal('show');
				    		console.log(data.errMsgs);
				    	}else if(data.errMsgs == "Reservation is invalid"){
				    		$('#reservationInvalid').modal('show');
				    		console.log(data.errMsgs);
				    	}
				    	else if(data.errMsgs == "The number of appointments must be less than 2"){
				    		//Check is more than 2 tries from backend
							$('#paymentForm select, #paymentForm input, #paymentForm button').prop('disabled', 'disabled');
							$('#moreThan2Tries').modal('show');
				    		console.log(data.errMsgs);
				    	}
				    }  
				});
			}
	   	});
	       
	    $("#btn-cstmr-srvc-cnter").on('click', function(){
	      	//window.location = '/fwdhk/en/savings-insurance/confirmation-appointment-sp';
	    	var planCode = "";
			if('' == 'SP'){
				planCode = "SAVIE-SP";
			}
			else{
				planCode = "SAVIE-RP";
			}
			
	    	var csCenter = $("#centre").val();
			var perferredDate = $("#preferred-date").val();
			var perferredTime = $("#preferred-time").val();
			if(csCenter == "" && perferredDate == "" && perferredTime == "") {
				$('#fullyBooked').modal('show');
			}else if(perferredTime == null || perferredTime.trim() == ""){
				$('#perferredTimeIsNull').modal('show');
			}else{
				$.ajax({     
				    url:context+'/ajax/savings-insurance/upsertAppointment',
				    type:'post',     
				    data:{    
				    	"csCenter": csCenter,
				        "perferredDate":perferredDate,
				        "perferredTime":perferredTime,
				        "planCode":planCode,
				        "remarks":"",
				        "type":"4",
				        "appointmentTypeId":"1"
			   		},     
				    error:function(){       
				    },     
				    success:function(data){
				    	if(data.errMsgs == null){
				    		//send email
				    		if('' == 'SP'){
				    			$("#paymentForm").attr("action", '/fwdhk/en/savings-insurance/confirmation-appointment-sp');
				    		}
				    		else{
				    			$("#paymentForm").attr("action", '/fwdhk/en/savings-insurance/confirmation-appointment-rp');
				    		}
					    	$("#paymentForm").submit();
				    	}else if(data.errMsgs == "Access code has already been used"){
				    		$('#accessCodeUsed').modal('show');
				    		console.log(data.errMsgs);
				    	}else if(data.errMsgs == "Reservation is invalid"){
				    		$('#reservationInvalid').modal('show');
				    		console.log(data.errMsgs);
				    	}
				    	else if(data.errMsgs == "The number of appointments must be less than 2"){
				    		//Check is more than 2 tries from backend
							$('#paymentForm select, #paymentForm input, #paymentForm button').prop('disabled', 'disabled');
							$('#moreThan2Tries').modal('show');
				    		console.log(data.errMsgs);
				    	}
				    }  
				});
			}
	   	});
	});
	
	function togglePreferred(id) {
		$(".col-xs-12 .preferred-date .date").hide();
		$("#"+ id).show();
	}
  
    function setCentre(centre){
    	
        if(centre == 'QB') {
           $('.centre-info').html("<img src=\"<%=request.getContextPath()%>/resources/images/savie/qb.jpg\" class=\"img-centre img-responsive\" /><h4>Address</h4><p class=\"centre-address\">13/F, Devon House, Taikoo Place, 979 King??s Road, Quarry Bay</p><a target=\"_blank\" class=\"viewmap-link\" href=\"https://www.google.com.hk/maps/search/Taikoo+Place+Devon+House%2C%20979%20King%E2%80%99s%20Road%2C%20Quarry%20Bay\">View map</a>");
        }
        
        if(centre == 'TST') {
           $('.centre-info').html("<img src=\"<%=request.getContextPath()%>/resources/images/savie/tst.jpg\" class=\"img-centre img-responsive\" /><h4>Address</h4><p class=\"centre-address\">G/F, Fontaine Building, 18 Mody Road, Tsim Sha Tsui</p><a target=\"_blank\" class=\"viewmap-link\" href=\"https://www.google.com.hk/maps/search/G%2FF%2C%20Fontaine%20Building%2C%2018%20Mody%20Road%2C%20Tsim%20Sha%20Tsui\">View map</a>");
        }
        
        if(centre == 'SW') {
           $('.centre-info').html("<img src=\"<%=request.getContextPath()%>/resources/images/savie/sw.jpg\" class=\"img-centre img-responsive\" /><h4>Address</h4><p class=\"centre-address\">1/F, FWD Financial Centre, 308 Des Voeux Road Central, Sheung Wan</p><a target=\"_blank\" class=\"viewmap-link\" href=\"https://www.google.com.hk/maps/search/1%2FF%2C%20FWD%20Financial%20Centre%2C%20308%20Des%20Voeux%20Road%20Central%2C%20Sheung%20Wan\">View map</a>");
        }
        
        if(centre == 'KF') {
           $('.centre-info').html("<img src=\"<%=request.getContextPath()%>/resources/images/savie/kf.jpg\" class=\"img-centre img-responsive\" /><h4>Address</h4><p class=\"centre-address\">Level 19, Metroplaza Tower 1, No 223 Hing Fong Road, Kwai Fong, New Territories</p><a target=\"_blank\" class=\"viewmap-link\" href=\"https://www.google.com.hk/maps/place/%E6%96%B0%E9%83%BD%E6%9C%83%E5%BB%A3%E5%A0%B4/@22.3579183,114.1244825,17z/data=!3m1!5s0x3403f8bc2d65a63f:0x64dca853ce713750!4m7!1m4!3m3!1s0x3403f8bdd231efed:0x9ea51164e774b2cc!2z6JG16Iqz6IiI6Iqz6LevMjIz6Jmf5paw6YO95pyD5buj5aC056ys5LiA5bqn!3b1!3m1!1s0x3403f8bdcd9341b3:0xf1cb3212c8930ebf?hl=zh-TW\">View map</a>");
        }
        
    }
</script>

<script src="<%=request.getContextPath()%>/resources/js/vendor/mobiscroll.custom-2.17.2.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/js/vendor/mobiscroll.i18n.en_fwd.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/js/vendor/mobiscroll.i18n.zh_fwd.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/application.common.0.3.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/wealthree/wealthree-app-uifn.js"></script>
