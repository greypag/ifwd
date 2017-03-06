<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeQuoteBean"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />

<script src="<%=request.getContextPath()%>/resources/js/vendor/mobiscroll.custom-2.17.2.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/vendor/mobiscroll.i18n.en_fwd.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/vendor/mobiscroll.i18n.zh_fwd.js"></script>
<!--script src="<%=request.getContextPath()%>/resources/js/vendor/bootstrapValidator.js"></script-->
<!-- bootstrap for formValidation -->
<script src="<%=request.getContextPath()%>/resources/js/vendor/formValidation.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/vendor/formValidation-bootstrap.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/vendor/formValidation.min.css" type="text/css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/mobiscroll.custom-2.17.2.min.css" type="text/css">
<%
	String actionName="";

	if (request.getAttribute("controller") != null) {
	    actionName = request.getAttribute("controller").toString();
	}
%>
<div class="modal fade loginpopup" id="loginpopup" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div
        style="display: none; position: absolute; left: 0; top: 0; bottom: 0; right: 0; background: #000; opacity: 0.8; z-index: 1052"
        class="login-ajax-loading">
        <img
            style="width: 100px; height: 100px; position: absolute; top: 50%; left: 50%; margin-left:-50px; margin-top: -50px;"
            src="<%=request.getContextPath()%>/resources/images/ajax-loader.gif">
    </div>
	<div class="modal-dialog modal-lg">
		<div class="modal-content plan-modal">
		<div class="login-close-wrapper"><a class="close" aria-label="Close" data-dismiss="modal"><span aria-hidden="true">×</span></a></div>
			<!-- 登入 -->
                <%if(actionName== "SavieOnline" || request.getRequestURI().indexOf("/") == 0){%>
                <div class="login-info hidden login-info-savie">
                    <div class="upper-overlay">
	                    <h4 class="heading-h4">
	                    	<%if(request.getRequestURI().indexOf("/savings-insurance") > 0){%>
	                    		<fmt:message key="Savie.login.overlay.title" bundle="${msg}" />
	                    	<%} else  { %>
	                        	<fmt:message key="Landing.login.overlay.title" bundle="${msg}" />
	                        <% } %>
	                    </h4>
	                    <h5 class="heading-h5">
	                    	<%if(request.getRequestURI().indexOf("/savings-insurance") > 0){%>
	                    		<fmt:message key="Savie.login.overlay.text" bundle="${msg}" />
	                    	<%} else  { %>
	                        	<fmt:message key="Landing.login.overlay.text" bundle="${msg}" />
	                        <% } %>
	                    </h5>
                    </div>
                    <img src="<%=request.getContextPath()%>/<fmt:message key="Savie.login.overlay.image" bundle="${msg}" />" alt="Savie" class="hidden-xs hidden-sm img-responsive">
                    <img src="<%=request.getContextPath()%>/<fmt:message key="Savie.login.overlay.image.mobile" bundle="${msg}" />" alt="Savie" class="hidden-lg hidden-md img-responsive">
                </div>
                <%}%>
        <div class="login-title-wrapper"><h4 class="color-darkgray heading-h4"><fmt:message key="header.login.action" bundle="${msg}" /></h4></div>
			<form class="js_form_in_login" name="loginform" id="loginform-pop" method="post">
				<div class="login-form">
					<div class="form-container">
						<h4 class="heading-h4 color-orange">
							<fmt:message key="header.login.heading" bundle="${msg}" />
						</h4>
						<div class="form-group">
							<!--使用者名 -->
							<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
								<input type="text" name="userName"
								class="form-control gray-textbox check-emp login-input mdl-textfield__input" id="headerUserName" onkeypress="return validationUsername(event);">
							<!-- 忘記使用者名 -->
								<a id="forgotUserName" class="heading-h6"><fmt:message key="header.login.username.forget" bundle="${msg}" /></a>
								<label class="mdl-textfield__label" for="headerUserName"><fmt:message key="header.login.username" bundle="${msg}" /></label>
								<span id="errUserName" class="empHide color-red heading-h5"></span>
							</div>
						</div>

						<div class="form-group">
							<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
							<input type="password" name="password"
								class="form-control check-emp-forgotusername login-input gray-textbox mdl-textfield__input" autocomplete="off" id="headerPassword">
							<label class="mdl-textfield__label" for="headerPassword"><fmt:message key="header.login.password" bundle="${msg}" /></label>
							<!--忘記密碼 -->
								<a id="link-forgotPassword" class="heading-h6"><fmt:message key="header.login.password.forget" bundle="${msg}" /></a>
								<span id="errPass" class="empHide color-red heading-h5"></span>
							</div>
						</div>
						<div class="login-button-group">
						    <input id="fna-check" type="hidden" name="fna" value="false">
						    <input id="forcefna" type="hidden" name="forcefna" value="false">
                            <input id="nav-bar-check" type="hidden" name="isNavBar" value="true">
							<button type="button" onclick="submitLoginForm('loginform-pop');"
								class="cta-confirm cta-font cta-orange cta-padding-40 cta--orange">
								<fmt:message key="header.login.action" bundle="${msg}" />
							</button>
                            <div class="login-error-wrapper">
                                <div id="login-err-msg" class="color-red heading-h5"
                                role="alert"></div>
                            </div>
						</div>

						<h6 class="heading-h6 color-gray login-disclaimer"><fmt:message key="header.login.disclaimer" bundle="${msg}" /></h6>
					</div>





				</div>
			</form>

			<!-- ======================================== 忘記使用者(non_member)   ============================================================ -->
			<!-- ======================================== 忘記使用者(non_member)   ============================================================ -->
			<form id="forgotUserNameForm" class="js_form_in_login" name="forgotUserNameForm_non_member"	action="forgotUserNameFields" method="post" style="display: none">

				<div class="login-form">
				<div id="success-message" class="alert alert-success empHide"
					role="alert" style="display: none;">
					<P id="error1"></P>
				</div>
				<div id="login-err-msg" class="alert alert-danger" role="alert"
					style="display: none;"></div>

					<div class="form-container">
						<h4 class="heading-h4 color-orange">
							<!--Message 忘記用戶名稱 -->
							<fmt:message key="header.login.username.forget.part1"
								bundle="${msg}" />
						</h4>

						<div class="form-group" form_type="forgotUserNameForm">
							<label class="login_is_fwdmember_label"><input type="radio" class="login_is_fwdmember" name="login_is_fwdmember" value="no" checked><span class="left-space"><fmt:message key="member.registration.details.fwdmember.no" bundle="${msg}" /></span></label>
							<label class="login_is_fwdmember_label"><input type="radio" class="login_is_fwdmember" name="login_is_fwdmember" value="yes"><span class="left-space"><fmt:message key="member.registration.details.fwdmember.yes" bundle="${msg}" /></span></label>
						</div>

						<!--電話 text-------->


						<!-- 電話 inout -->
						<div class="form-group">
							<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
								<input type="tel" name="mobileNo"
									class="form-control gray-textbox check-emp-forgotusername login-input mdl-textfield__input" id="mobileNo">
								<label class="mdl-textfield__label" for="mobileNo"><fmt:message key="member.registration.details.label.mobileNo" bundle="${msg}" /></label>
									<!--  phone erro message -->
									<span id="errorEmptyMob" class="color-red heading-h5"></span>
									<!--span id="errorEmptyMob" class="hide1 empHide">
										<label class="color-red heading-h5"><fmt:message
											key="member.registration.details.label.mobileNo.errorEmptyMob"
											bundle="${msg}" />
										</label>
									</span>
									<span id="errorInvalidMob" class="hide1 empHide">
										<label class="color-red heading-h5"><fmt:message
											key="member.registration.details.label.mobileNo.errorInvalidMob"
											bundle="${msg}" />
										</label>
									</span-->
							</div>
						</div>

						<!-- -======================================================================- -->
						<!-- 電郵 text-->
						<!-- 電郵 input-->
						<div class="form-group">
							<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
							<input type="email" name="emailAddress"
                                class="form-control gray-textbox mdl-textfield__input check-emp-forgotusername login-input"
								id="emailAddress">
                                <label class="mdl-textfield__label" for="emailAddress"><fmt:message key="member.registration.details.label.emailAddress" bundle="${msg}" /></label>
		                         <!-- 電郵 Errror message -->
									<span id="errorEmptyEmailId" class="color-red heading-h5"></span>

		                        <!--span id="errorEmptyEmailId" class="hide1 empHide"><label
		                            class="color-red heading-h5"><fmt:message
		                                    key="member.registration.details.label.emailAddress.errorEmptyEmailId"
		                                    bundle="${msg}" /></label></span> <span id="errorInvalidEmailId"
		                            class="hide1 empHide"> <label class="color-red heading-h5"><fmt:message
		                                    key="member.registration.details.label.emailAddress.errorInvalidEmailId"
		                                    bundle="${msg}" /></label>
		                        </span-->
		                     </div>
						</div>


						<div class="login-button-group forgot-group">
							<button type="button" onclick="backToLogin()"
								class="cta-confirm cta-font cta-gray cta-padding-40 cta--gray">
								<fmt:message key="header.login.back" bundle="${msg}" />
							</button>

							<button type="button" onclick="getForgotUserName(this.form)"
								class="cta-confirm cta-font cta-orange cta-padding-40 cta--orange">
								<fmt:message key="header.login.action2" bundle="${msg}" />
							</button>
						</div>
	                    <div id="forgotusername-err-msg" class="alert alert-danger"
	                        role="alert" style="display: none;">
	                        <P id="error-mobile-no"></P>
	                        <P id="error-email-id"></P>
	                    </div>



					</div>
				</div>
			</form>
			<!-- 忘記使用者END -->
			
			<!-- ======================================== 忘記使用者(member)   ============================================================ -->
			<!-- ======================================== 忘記使用者(member)   ============================================================ -->



			<form id="forgotUserNameForm" class="js_form_in_login" name="forgotUserNameForm_member" action="forgotUserNameFields" method="post" style="display: none">

				<div class="login-form">
				<div id="success-message" class="alert alert-success empHide"
					role="alert" style="display: none;">
					<P id="error1"></P>
				</div>
				<div id="login-err-msg" class="alert alert-danger" role="alert"
					style="display: none;"></div>

					<div class="form-container">
					
						<h4 class="heading-h4 color-orange">
							<!--Message 忘記用戶名稱 -->
							<fmt:message key="header.login.username.forget.part1"
								bundle="${msg}" />
						</h4>

						<div class="form-group" form_type="forgotUserNameForm">
							<label class="login_is_fwdmember_label"><input type="radio" class="login_is_fwdmember" name="login_is_fwdmember" value="no"><span class="left-space"><fmt:message key="member.registration.details.fwdmember.no" bundle="${msg}" /></span></label>
							<label class="login_is_fwdmember_label"><input type="radio" class="login_is_fwdmember" name="login_is_fwdmember" value="yes" checked><span class="left-space"><fmt:message key="member.registration.details.fwdmember.yes" bundle="${msg}" /></span></label>
						</div>

						<!-- Policy Number -->
						<div class="form-group">
							<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
							<input id="PolicyNumber" type="text" name="PolicyNumber"
								class="form-control check-emp-forgotuserpassoword login-input gray-textbox mdl-textfield__input">
							<label class="mdl-textfield__label" for="PolicyNumber"><fmt:message key="member.registration.details.policy.number" bundle="${msg}" /></label>
		                        <span id="errorEmptyPolicyNumberJoinUs" class="color-red heading-h5">
		                        </span>
							</div>
						</div>
						<!-- -======================================================================- -->
						<!-- Dob input-->
						<div class="form-group">
							<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
							<input id="login_dob" type="text" name="Dob" autocomplete="off" readonly
								class="form-control check-emp-forgotuserpassoword login-input gray-textbox mdl-textfield__input">
								<label class="mdl-textfield__label" for="login_dob"><fmt:message key="member.registration.details.dob" bundle="${msg}" /></label>
		                        <!-- 電郵 Errror message -->
		                        <span id="errorEmptyDob" class="color-red heading-h5"></span>
		                       </div>
						</div>
						<!-- Doc input -->
						<div class="form-group">
							<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
							<input id="Hkid" type="text" name="Hkid"
								class="form-control check-emp-forgotuserpassoword login-input gray-textbox mdl-textfield__input">
								<label class="mdl-textfield__label" for="Hkid"><fmt:message key="member.registration.details.hkid" bundle="${msg}" /></label>
		                        <!-- 使用者ERROR -->

		                        <span id="errorEmptyHkid" class="color-red heading-h5"></span>
		                        </div>
						</div>


						<div class="login-button-group forgot-group">
							<button type="button" onclick="backToLogin()"
								class="cta-confirm cta-font cta-gray cta-padding-40 cta--gray">
								<fmt:message key="header.login.back" bundle="${msg}" />
							</button>

							<button type="button" onclick="getForgotUserName(this.form)"
								class="cta-confirm cta-font cta-orange cta-padding-40 cta--orange">
								<fmt:message key="header.login.action2" bundle="${msg}" />
							</button>
						</div>
	                    <div id="forgotusername-err-msg" class="alert alert-danger"
	                        role="alert" style="display: none;">
	                        <P id="error-mobile-no"></P>
	                        <P id="error-email-id"></P>
	                    </div>



					</div>
				</div>
			</form>

			<!-- 忘記使用者END -->


			<script>
        function getForgotUserName(form) {
        	var current_form = "form[name='"+ form.name +"']";
    		$(current_form).formValidation('validate');
        	$(current_form + ' #forgotusername-err-msg').hide();
        	$(current_form + ' #success-message').hide();
        	
			
            if ($(current_form).data('formValidation').isValid()) {
                $(current_form + ' #forgotusername-err-msg').hide();
                $('.login-ajax-loading').show();
                
                var policyNo = $('#PolicyNumber').val().trim();
				var docNo = $('#Hkid').val().trim();
				var dateString=$('#login_dob').val().trim();
				var yearStr=dateString.split("/")[2];
				var monStr=dateString.split("/")[1];
				var dateStr=dateString.split("/")[0];
				var dob=yearStr+"-"+monStr+"-"+dateStr;
				var postData={"policyNo":policyNo,"docNo":docNo,"dob":dob};
				
            	if(form.name=="forgotUserNameForm_member"){
            		$.ajax({
                        type : 'POST',
                        url : '<%=request.getContextPath()%>/api/member/forgotUserName/customer',
                        //data : $(current_form + ' input').serialize(),
                        Accept: "application/json",
                       	contentType: "application/json",
       					dataType: "json",
                        data : JSON.stringify(postData),
                        success : function(data) {
                            $('.login-ajax-loading').hide();
							if(data.message==null){
								 $(current_form + ' #success-message').html(getBundle(getBundleLanguage, "member.login.forgotUserName.success")+' '+data.userName);
	                                $(current_form + ' #success-message').show();
	                                $(current_form + ' #user-details-main').hide();
	                                $(current_form + ' #hide-field').hide();
                            }

                        },
                        error : function(xhr, status, error) {
                        	$(current_form + ' #forgotusername-err-msg').html(JSON.parse(xhr.responseText).message);
                        	$(current_form + ' #forgotusername-err-msg').show();
                            $('.login-ajax-loading').hide();
                        }
                    });
            	}else{
            		$.ajax({
                        type : 'POST',
                        url : '<%=request.getContextPath()%>/forgotUser',
                        data : $(current_form + ' input').serialize(),
                        success : function(data) {
                            $('.login-ajax-loading').hide();
                            if (data == 'fail') {
                                $(current_form + ' #forgotusername-err-msg').html(getBundle(getBundleLanguage, "member.login.fail.first"));
	                            $(current_form + ' #forgotusername-err-msg').show();
                                $(current_form + ' #user-details-main').hide();
                                $(current_form + ' #hide-field').hide();
                            } else if (data.indexOf('~~~') > -1) {
                                $(current_form + ' #success-message').html(data.slice(5, 68));
                                $(current_form + ' #success-message').show();
                                $(current_form + ' #user-details-main').hide();
                                $(current_form + ' #hide-field').hide();
                            } else if (data.indexOf('[')==0&data.indexOf(']')>0) {
                            	$(current_form + ' #success-message').html('');
                                $(current_form + ' #success-message').hide();
                                if(data.slice(2, data.length-2) == "The information you have entered is not valid, please try again"){
                                	$(current_form + ' #forgotusername-err-msg').html(getBundle(getBundleLanguage, "member.login.forgotUserName.error"));
                                }
                                else{
                                	$(current_form + ' #forgotusername-err-msg').html(data.slice(2, data.length-2));
                                }
                                $(current_form + ' #forgotusername-err-msg').show();
                            } else {
                                $(current_form + ' #success-message').html(getBundle(getBundleLanguage, "member.login.forgotUserName.success")+' '+data);
                                $(current_form + ' #success-message').show();
                            }

                        },
                        error : function(xhr, status, error) {
                            $('.login-ajax-loading').hide();
                        }
                    });
            	}
                
                
            }
        }
    </script>

			<!-- ===================================================================================================== -->
			<!-- ========================================忘記密碼(non_member)===================================================== -->
			<!-- ===================================================================================================== -->


			<form id="forgotPasswordForm" class="js_form_in_login" name="forgotPasswordForm_non_member" action="forgotPassword" method="post" style="display: none">

				<div class="login-form">
                 <div id="success-message-password" class="alert alert-success"
                     role="alert" style="display: none;">
                     <P id="error1"></P>
                 </div>


                 <div id="login-err-msg" class="alert alert-danger" role="alert"
                     style="display: none;"></div>

					<div class="form-container">
						<h4 class="heading-h4 color-orange">
							<!--Message 忘記密碼 -->
							<fmt:message key="header.login.password.forget.part1"
								bundle="${msg}" />
						</h4>

						<div class="form-group" form_type="forgotPasswordForm">
							<label class="login_is_fwdmember_label"><input type="radio" class="login_is_fwdmember" name="login_is_fwdmember" value="no" checked><span class="left-space"><fmt:message key="member.registration.details.fwdmember.no" bundle="${msg}" /></span></label>
							<label class="login_is_fwdmember_label"><input type="radio" class="login_is_fwdmember" name="login_is_fwdmember" value="yes"><span class="left-space"><fmt:message key="member.registration.details.fwdmember.yes" bundle="${msg}" /></span></label>
						</div>

						<!-- 電話 inout -->
						<div class="form-group">
							<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
							<input type="tel" name="mobileNo"
								class="form-control check-emp-forgotuserpassoword login-input gray-textbox mdl-textfield__input"
								id="mobileNo-forgotpassowrd">
							<label class="mdl-textfield__label" for="mobileNo-forgotpassowrd"><fmt:message key="member.registration.details.label.mobileNo" bundle="${msg}" /></label>
		                        <!--  phone erro message -->
									<span id="errorEmptyMob" class="color-red heading-h5"></span>
										
		                        <!--span id="errorEmptyMob-forgotPassword" class="hide1 empHide color-red heading-h5">
		                            <label class="color-red heading-h5"><fmt:message
		                                    key="member.registration.details.label.mobileNo.errorEmptyMob"
		                                    bundle="${msg}" /></label>
		                        </span>
		                        <span id="errorInvalidMob-forgotPassword" class="hide1 empHide color-red heading-h5">
		                            <label class="color-red heading-h5"><fmt:message
		                                    key="member.registration.details.label.mobileNo.errorInvalidMob"
		                                    bundle="${msg}" /></label>
		                        </span-->
							</div>
						</div>




						<!-- -======================================================================- -->




						<!-- 電郵 input-->
						<div class="form-group">
							<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
							<input type="email" name="emailAddress"
								class="form-control check-emp-forgotuserpassoword login-input gray-textbox mdl-textfield__input"
								id="emailAddress-forgotpassowrd">
								<label class="mdl-textfield__label" for="emailAddress-forgotpassowrd"><fmt:message key="member.registration.details.label.emailAddress" bundle="${msg}" /></label>
		                        <!-- 電郵 Errror message -->
									<span id="errorEmptyEmailId" class="color-red heading-h5"></span>
		                        <!--span id="errorEmptyEmailId" class="hide1 empHide color-red heading-h5"> <label
		                            class="color-red heading-h5"><fmt:message
		                                    key="member.registration.details.label.emailAddress.errorEmptyEmailId"
		                                    bundle="${msg}" /></label></span> <span id="errorEmptyEmailId-forgotpassword"
		                            class="hide1 empHide color-red heading-h5"> <label class="color-red heading-h5"><fmt:message
		                                    key="member.registration.details.label.emailAddress.errorEmptyEmailId"
		                                    bundle="${msg}" /></label>
		                        </span>
		                        <span id="errorInvalidEmailId-forgotpassword"
		                            class="hide1 empHide color-red heading-h5"> <label class="color-red heading-h5"><fmt:message
		                                    key="member.registration.details.label.emailAddress.errorInvalidEmailId"
		                                    bundle="${msg}" /></label>
		                        </span-->
		                       </div>
						</div>







						<!-- 使用者input -->

						<div class="form-group">
							<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
							<input type="text" name="userName"
								class="form-control check-emp-forgotuserpassoword login-input gray-textbox mdl-textfield__input"
								id="userName">
								<label class="mdl-textfield__label" for="userName"><fmt:message key="member.registration.details.label.userName" bundle="${msg}" /></label>
		                        <!-- 使用者ERROR -->
									<span id="errorEmptyUName" class="color-red heading-h5"></span>

		                        <!--span id="errorEmptyUName" class="hide1 empHide color-red heading-h5"> <label
		                            class="color-red heading-h5"><fmt:message
		                                    key="member.registration.details.label.userName.errorEmptyUName"
		                                    bundle="${msg}" /></label>
		                        </span>
		                        <span id="errorInvalidUName" class="hide1 empHide color-red heading-h5"> <label
		                            class="color-red heading-h5"><fmt:message
		                                    key="member.registration.details.label.userName.errorInvalidUName"
		                                    bundle="${msg}" /></label>
		                        </span-->
		                        </div>
						</div>





						<div class="login-button-group forgot-group">

							<button type="button" onclick="backToLogin()"
								class="cta-confirm cta-font cta-gray cta-padding-40 cta--gray">
								<fmt:message key="header.login.back" bundle="${msg}" />
							</button>


							<button type="button" onclick="forgotUserPassword(this.form)"
								class="cta-confirm cta-font cta-orange cta-padding-40 cta--orange">
								<fmt:message key="member.registration.details.action"
									bundle="${msg}" />
							</button>

						</div>
	                    <div id="hide-field"></div>
		                 <div id="forgotpassword-err-msg" class="color-red heading-h5"
		                     role="alert" style="display: none;">
		                     <P id="error1"></P>
		                 </div>	                    
						</div>







				</div>

			</form>
			
			<!-- ===================================================================================================== -->
			<!-- ========================================忘記密碼(member)===================================================== -->
			<!-- ===================================================================================================== -->


			<form id="forgotPasswordForm" class="js_form_in_login" name="forgotPasswordForm_member" action="forgotPassword" method="post" style="display: none">

				<div class="login-form">
                 <div id="success-message-password" class="alert alert-success"
                     role="alert" style="display: none;">
                     <P id="error1"></P>
                 </div>


                 <div id="login-err-msg" class="alert alert-danger" role="alert"
                     style="display: none;"></div>

					<div class="form-container">
						<h4 class="heading-h4 color-orange">
							<!--Message 忘記密碼 -->
							<fmt:message key="header.login.password.forget.part1"
								bundle="${msg}" />
						</h4>

						<div class="form-group" form_type="forgotPasswordForm">
							<label class="login_is_fwdmember_label"><input type="radio" class="login_is_fwdmember" name="login_is_fwdmember" value="no"><span class="left-space"><fmt:message key="member.registration.details.fwdmember.no" bundle="${msg}" /></span></label>
							<label class="login_is_fwdmember_label"><input type="radio" class="login_is_fwdmember" name="login_is_fwdmember" value="yes" checked><span class="left-space"><fmt:message key="member.registration.details.fwdmember.yes" bundle="${msg}" /></span></label>
						</div>

						<!-- Dob input-->
						<div class="form-group">
							<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
							<input id="login_dob2" type="text" name="Dob" autocomplete="off" readonly
								class="form-control check-emp-forgotuserpassoword login-input gray-textbox mdl-textfield__input">
								<label class="mdl-textfield__label" for="login_dob2"><fmt:message key="member.registration.details.dob" bundle="${msg}" /></label>
								<span id="errorEmptyDob" class="color-red heading-h5"></span>
		                       </div>
						</div>
						<!-- Doc input -->
						<div class="form-group">
							<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
							<input type="text" name="Hkid" id="Hkid2"
								class="form-control check-emp-forgotuserpassoword login-input gray-textbox mdl-textfield__input">
								<label class="mdl-textfield__label" for="Hkid"><fmt:message key="member.registration.details.hkid" bundle="${msg}" /></label>
		                        <!-- 使用者ERROR -->
									<span id="errorEmptyHkid" class="color-red heading-h5"></span>

		                        <!--span id="errorEmptyUName" class="hide1 empHide color-red heading-h5"> <label
		                            class="color-red heading-h5"><fmt:message
		                                    key="member.registration.details.label.userName.errorEmptyUName"
		                                    bundle="${msg}" /></label>
		                        </span-->
		                        </div>
						</div>

						<!-- 使用者input -->
						<div class="form-group">
							<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
							<input type="text" name="userName"
								class="form-control check-emp-forgotuserpassoword login-input gray-textbox mdl-textfield__input"
								id="forgetPass_userName">
								<label class="mdl-textfield__label" for="forgetPass_userName"><fmt:message key="member.registration.details.label.userName" bundle="${msg}" /></label>
		                        <!-- 使用者ERROR -->
									<span id="errorEmptyUName" class="color-red heading-h5"></span>

		                        <!--span id="errorEmptyUName" class="hide1 empHide color-red heading-h5"> <label
		                            class="color-red heading-h5"><fmt:message
		                                    key="member.registration.details.label.userName.errorEmptyUName"
		                                    bundle="${msg}" /></label>
		                        </span>
		                        <span id="errorInvalidUName" class="hide1 empHide color-red heading-h5"> <label
		                            class="color-red heading-h5"><fmt:message
		                                    key="member.registration.details.label.userName.errorInvalidUName"
		                                    bundle="${msg}" /></label>
		                        </span-->
		                        </div>
						</div>
						<div class="login-button-group forgot-group">

							<button type="button" onclick="backToLogin()"
								class="cta-confirm cta-font cta-gray cta-padding-40 cta--gray">
								<fmt:message key="header.login.back" bundle="${msg}" />
							</button>


							<button type="button" onclick="forgotUserPassword(this.form)"
								class="cta-confirm cta-font cta-orange cta-padding-40 cta--orange">
								<fmt:message key="member.registration.details.action"
									bundle="${msg}" />
							</button>

						</div>
	                    <div id="hide-field"></div>
		                 <div id="forgotpassword-err-msg" class="color-red heading-h5"
		                     role="alert" style="display: none;">
		                     <P id="error1"></P>
		                 </div>	                    
						</div>
				</div>

			</form>
			
        <div class="login-form-footer">
            <h5>
                <span class="color-gray heading-h5"><fmt:message key="header.login.registration.heading" bundle="${msg}" /></span>
                <a href="${pageContext.request.contextPath}/${language}/joinus" class="color-orange heading-h5"><fmt:message key="header.login.registration.action" bundle="${msg}" /></a>
            </h5>
        </div>

			<script>
	    function validForgetUserPassword(){
	    		$('#forgotpassword-err-msg').hide();
	        $('#success-message-password').hide();

	        $('#errorEmptyMob-forgotPassword').hide();
	        $('#errorInvalidMob-forgotPassword').hide();
	        $('#errorEmptyEmailId-forgotpassword').hide();
	        $('#errorInvalidEmailId-forgotpassword').hide();
	        $('#errorEmptyUName').hide();
	        $('#errorInvalidUName').hide();

	        $("#mobileNo-forgotpassowrd").removeClass("invalid-field");
	        $("#emailAddress-forgotpassowrd").removeClass("invalid-field");
	        $("#userName").removeClass("invalid-field");

	        var valid = true;

	        var mobileNo = $('#mobileNo-forgotpassowrd').val();
	        var emailId = $('#emailAddress-forgotpassowrd').val();
	        var userName = $('#userName').val();

	          // Mobile Number Validation
	        if (mobileNo.trim() == "") {
	             $('#errorEmptyMob-forgotPassword').show();
	             $("#mobileNo-forgotpassowrd").addClass("invalid-field");
	             valid = false;
	        }   else{

	            if (mobile_pattern.test(mobileNo) == false) {
	                $("#errorInvalidMob-forgotPassword").show();
	                $("#mobileNo-forgotpassowrd").addClass("invalid-field");
	                valid = false;
	            }
	        }

	        // Email Address Validation
	        if (emailId.trim() == "") {
	           $('#errorEmptyEmailId-forgotpassword').show();
	           $("#emailAddress-forgotpassowrd").addClass("invalid-field");
	            valid = false;

	        } else {
	            if (emailreg.test(emailId) == false) {
	                  $('#errorInvalidEmailId-forgotpassword').show();
	                  $("#emailAddress-forgotpassowrd").addClass("invalid-field");
	                  valid = false;
	                //document.getElementById("errorInvalidEmailId").style.display = "block";
	                //valid = false;
	            }
}

	        // UserName Validation
	        if (userName.trim() == "") {
	            $("#errorEmptyUName").show();
	            $("#userName").addClass("invalid-field");
	            valid = false;

	        } else {
	            if (isAccountNumeric(userName)) {
	            	$("#errorInvalidUName").show();
	            	$("#userName").addClass("invalid-field");
	                valid = false;
	            } else if (!plan_user.test(userName)) {
	            	$("#errorInvalidUName").show();
	            	$("#userName").addClass("invalid-field");
	                valid = false;
	            } else if(userName.length < 6 || userName.length > 50) {
	            	$("#errorInvalidUName").show();
	            	$("#userName").addClass("invalid-field");
	                valid = false;
	            }
	        }
	        return valid;
	    }


			function forgotUserPassword(form) {
				var current_form = "form[name='"+ form.name +"']";
				// $(current_form).bootstrapValidator('validate');
				$(current_form).formValidation('validate');
				$(current_form + ' #forgotpassword-err-msg').hide();
				$(current_form + ' #success-message-password').hide();

				
				var userName = $('#forgetPass_userName').val().trim();
				var docNo = $('#Hkid2').val().trim();
				var dateString=$('#login_dob2').val().trim();
				var yearStr=dateString.split("/")[2];
				var monStr=dateString.split("/")[1];
				var dateStr=dateString.split("/")[0];
				var dob=yearStr+"-"+monStr+"-"+dateStr;
				var postData={"docNo":docNo,"dob":dob,"userName":userName};
				// if ($(current_form).data('bootstrapValidator').isValid()) {
				if ($(current_form).data('formValidation').isValid()) {
					$(current_form + ' #forgotpassword-err-msg').hide();
					$('.login-ajax-loading').show();
					if(form.name=="forgotPasswordForm_member"){
						$.ajax({
							type : 'POST',
							url : '<%=request.getContextPath()%>/api/member/forgotPassword/customer',
							//data : $(current_form + ' input').serialize(),
							Accept: "application/json",
                       		contentType: "application/json",
							 data : JSON.stringify(postData),
							success : function(data) {
								$('.login-ajax-loading').hide();
								if(data.resp==true){
									$(current_form + ' #success-message-password').html(getBundle(getBundleLanguage, "member.forgotPassword.success.message"));
									$(current_form + ' #success-message-password').show();
								}else if((data.resp==false)){
									$(current_form + ' #forgotpassword-err-msg').html(getBundle(getBundleLanguage, "member.login.fail.msg"));
									$(current_form + ' #forgotpassword-err-msg').show();
								}else{
									$(current_form + ' #success-message-password').html(getBundle(getBundleLanguage, "connection.lost.message"));
									$(current_form + ' #success-message-password').show();
									$(current_form + ' #user-details-main').hide();
								}
								
								/* if (data == 'fail') {
										$(current_form + ' #forgotpassword-err-msg').html(getBundle(getBundleLanguage, "member.login.fail.msg"));
										$(current_form + ' #forgotpassword-err-msg').show();
								} else if (data == 'success') {
										$(current_form + ' #success-message-password').html(getBundle(getBundleLanguage, "member.forgotPassword.success.message"));
										$(current_form + ' #success-message-password').show();
								} else {
										$(current_form + ' #success-message-password').html(getBundle(getBundleLanguage, "connection.lost.message"));
										$(current_form + ' #success-message-password').show();
										$(current_form + ' #user-details-main').hide();
								} */
							},
							error : function(xhr, status, error) {
								$(current_form + ' #forgotpassword-err-msg').html(JSON.parse(xhr.responseText).message);
	                        	$(current_form + ' #forgotpassword-err-msg').show();
								$('.login-ajax-loading').hide();
							}
						});
					}else{
					$.ajax({
						type : 'POST',
						url : '<%=request.getContextPath()%>/forgotUserPassword',
						data : $(current_form + ' input').serialize(),
						success : function(data) {
							$('.login-ajax-loading').hide();
							if (data == 'fail') {
									$(current_form + ' #forgotpassword-err-msg').html(getBundle(getBundleLanguage, "member.login.fail.msg"));
									$(current_form + ' #forgotpassword-err-msg').show();
							} else if (data == 'success') {
									$(current_form + ' #success-message-password').html(getBundle(getBundleLanguage, "member.forgotPassword.success.message"));
									$(current_form + ' #success-message-password').show();
							} else {
									$(current_form + ' #success-message-password').html(getBundle(getBundleLanguage, "connection.lost.message"));
									$(current_form + ' #success-message-password').show();
									$(current_form + ' #user-details-main').hide();
							}
						},
						error : function(xhr, status, error) {
							$('.login-ajax-loading').hide();
						}
					});
					}
				}
			}
    </script>

		</div>


    </div>
</div>












<!-- payment error popup  -->
<!-- Modal -->
<div class="modal fade bs-example-modal-lg  in" id="paymentErrorPopup"
	tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content plan-modal">
			<div class="modal-body">
				<a class="close" aria-label="Close" data-dismiss="modal"><span
					aria-hidden="true" style="font-size: 30px;">×</span></a>
				<div class="form-container" style="padding-top: 10px;">
					<br />
					<fmt:message key="payment.duplicate.error" bundle="${msg}" />
					<br /> <br /> <br />
				</div>
			</div>
		</div>
	</div>
</div>

<div id="loading-overlay" class="modal fade bs-loading-modal-lg"
	tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
	<div class="modal-dialog modal-lg loading-dialog">
		<div class="modal-content plan-modal loading-modal">
			<img src="<%=request.getContextPath()%>/resources/images/loading.gif"
				width="300" />
		</div>
	</div>
</div>



<script>
function generate_common_validate_fields_member(form){
	return {
		'Dob': {
			container: form + ' #errorEmptyDob',
			validators: {
				notEmpty: {
					message: '<fmt:message key="error.dob.empty" bundle="${msg}" />'
				}
			}
		},
		'Hkid': {
			container: form + ' #errorEmptyHkid',
			validators: {
				/*callback: {
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
				regexp: {
					regexp: /^[a-zA-Z0-9\-]*$/,
					message: '<fmt:message key="member.registration.error.hkid.special.chars" bundle="${msg}" />'
				},*/
				notEmpty: {
					message: '<fmt:message key="member.registration.error.hkid.empty" bundle="${msg}" />'
				}
			}
		}
	};
}
function generate_common_validate_fields_non_member(form){
	return {
		'mobileNo': {
			container: form + ' #errorEmptyMob',
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
			container: form + ' #errorEmptyEmailId',
			validators: {
				notEmpty: {
					message: getBundle(getBundleLanguage, "applicant.email.notNull.message")
				},
				regexp: {
					regexp: /^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/,
					message: getBundle(getBundleLanguage, "applicant.email.notValid.message")
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
		})
		.on('err.validator.fv', function(e, data) {
	          // $(e.target)    --> The field element
	          // data.fv        --> The FormValidation instance
	          // data.field     --> The field name
	          // data.element   --> The field element
	          // data.validator --> The current validator name
	
	          data.element
	              .data('fv.messages')
	              // Hide all the messages
	              .find('.help-block[data-fv-for="' + data.field + '"]').hide()
	              // Show only message associated with current validator
	              .filter('[data-fv-validator="' + data.validator + '"]').show();
	      });
}
function bootstrapvalidate(){
//forgotUserNameForm_member
	var form_1 = "form[name='forgotUserNameForm_member']";
	var fields_1 = generate_common_validate_fields_member(form_1);
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
				regexp: /^[a-zA-Z0-9]*$/,
				message: '<fmt:message key="member.registration.error.policyno.special.chars" bundle="${msg}" />'
			}
		}
	};
	generate_validate(form_1,fields_1);
	
//forgotPasswordForm_member
	var form_2 = "form[name='forgotPasswordForm_member']";
	var fields_2 = generate_common_validate_fields_member(form_2);
	fields_2['userName'] = {
		container: form_2 + ' #errorEmptyUName',
		validators: {
			callback : {
				message : getBundle(getBundleLanguage, "user.username.notValid.message"),
				callback: function (value, validator) {
					return {
						valid : isNaN(value)
					}
				}
			},
			regexp: {
				regexp: /^(([a-zA-Z0-9]+)|(([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-\_]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)))$/,
				message: getBundle(getBundleLanguage, "user.username.notValid.message")
			},
			stringLength: {
				max: 50,
				min: 6,
				message: getBundle(getBundleLanguage, "user.username.length.message")
			},
			notEmpty: {
				message: getBundle(getBundleLanguage, "user.username.empty.message")
			}
		}
	};
	generate_validate(form_2,fields_2);
	
//forgotUserNameForm_non_member
	var form_3 = "form[name='forgotUserNameForm_non_member']";
	var fields_3 = generate_common_validate_fields_non_member(form_3);
	generate_validate(form_3,fields_3);
	
//forgotPasswordForm_non_member
	var form_4 = "form[name='forgotPasswordForm_non_member']";
	var fields_4 = generate_common_validate_fields_non_member(form_4);
	fields_4['userName'] = {
		container: form_4 + ' #errorEmptyUName',
		validators: {
			callback : {
				message : getBundle(getBundleLanguage, "user.username.notValid.message"),
				callback: function (value, validator) {
					return {
						valid : isNaN(value)
					}
				}
			},
			regexp: {
				regexp: /^(([a-zA-Z0-9]+)|(([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-\_]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)))$/,
				message: getBundle(getBundleLanguage, "user.username.notValid.message")
			},
			stringLength: {
				max: 50,
				min: 6,
				message: getBundle(getBundleLanguage, "user.username.length.message")
			},
			notEmpty: {
				message: getBundle(getBundleLanguage, "user.username.empty.message")
			}
		}
	};
	generate_validate(form_4,fields_4);
}


    function backToLogin(){
    	$(".js_form_in_login").hide();
        $('#loginform-pop').fadeIn();
        $('.empHide').hide();

        $("#mobileNo").removeClass("invalid-field");
        $("#emailAddress").removeClass("invalid-field");

        $("#loginform-pop #headerUserName").removeClass("invalid-field");
        $("#loginform-pop #headerPassword").removeClass("invalid-field");

        $("#mobileNo-forgotpassowrd").removeClass("invalid-field");
        $("#emailAddress-forgotpassowrd").removeClass("invalid-field");
        $("#userName").removeClass("invalid-field");
    }


       $(document).ready(function(){
    	   bootstrapvalidate();
           $( "#fwd-login-desk" ).on( "click", function() {
               $('#loginpopup #forcefna').val("false");
           });     	   
    	   $( "#fwd-login-mob" ).on( "click", function() {
    		   $('#loginpopup #forcefna').val("false");
    	   });    	   
	   	   $('#loginpopup').on('hidden.bs.modal', function () {
		   		//console.log("fna-cnacel");
		   		$('#loginpopup #fna-check').val("false");
	   	   })
           $('html').keyup(function(e){

                 var emp= "";
            $(".check-emp").each(function(){
               emp = emp + $(this).val();
            });




            if(emp==""){

              $('.empHide').hide();

              $("#mobileNo").removeClass("invalid-field");
              $("#emailAddress").removeClass("invalid-field");

              $("#loginform-pop #headerUserName").removeClass("invalid-field");
              $("#loginform-pop #headerPassword").removeClass("invalid-field");

              $("#mobileNo-forgotpassowrd").removeClass("invalid-field");
              $("#emailAddress-forgotpassowrd").removeClass("invalid-field");
              $("#userName").removeClass("invalid-field");
            }


            var checkEmpForgotuserName = "";
            $(".check-emp-forgotusername").each(function(){
                checkEmpForgotuserName = checkEmpForgotuserName + $(this).val();
             });


            if(checkEmpForgotuserName==""){
                $('.empHide').hide();
                $("#mobileNo").removeClass("invalid-field");
                $("#emailAddress").removeClass("invalid-field");

                $("#loginform-pop #headerUserName").removeClass("invalid-field");
                $("#loginform-pop #headerPassword").removeClass("invalid-field");

                $("#mobileNo-forgotpassowrd").removeClass("invalid-field");
                $("#emailAddress-forgotpassowrd").removeClass("invalid-field");
                $("#userName").removeClass("invalid-field");
              }

            var checkEmpForgotuserPassword = "";
            $('.check-emp-forgotuserpassoword').each(function(){
                checkEmpForgotuserPassword = checkEmpForgotuserPassword + $(this).val();
                if(checkEmpForgotuserPassword==""){
                    $('.empHide').hide();
                    $("#mobileNo").removeClass("invalid-field");
                    $("#emailAddress").removeClass("invalid-field");

                    $("#loginform-pop #headerUserName").removeClass("invalid-field");
                    $("#loginform-pop #headerPassword").removeClass("invalid-field");

                    $("#mobileNo-forgotpassowrd").removeClass("invalid-field");
                    $("#emailAddress-forgotpassowrd").removeClass("invalid-field");
                    $("#userName").removeClass("invalid-field");
                  }
            })



           })






           //--
           $('.login-btn').click(function(){
               $(".js_form_in_login").hide();
               $('#loginform-pop').show();

               $("#mobileNo").removeClass("invalid-field");
               $("#emailAddress").removeClass("invalid-field");

               $("#headerUserName").removeClass("invalid-field");
               $("#headerPassword").removeClass("invalid-field");

               $("#mobileNo-forgotpassowrd").removeClass("invalid-field");
               $("#emailAddress-forgotpassowrd").removeClass("invalid-field");
               $("#userName").removeClass("invalid-field");


               $('.login-info').addClass('hidden');
               $('#loginpopup .modal-dialog').removeClass('loginpopupext');
           })


           $('#forgotUserName').click(function(){
        	   $(".js_form_in_login").hide();
        	   $(".login_is_fwdmember[value='no']").prop("checked",true);
               $('form[name="forgotUserNameForm_non_member"]').fadeIn();
               $('.empHide').hide();

               $("#mobileNo").removeClass("invalid-field");
               $("#emailAddress").removeClass("invalid-field");

               $("#headerUserName").removeClass("invalid-field");
               $("#headerPassword").removeClass("invalid-field");

               $("#mobileNo-forgotpassowrd").removeClass("invalid-field");
               $("#emailAddress-forgotpassowrd").removeClass("invalid-field");
               $("#userName").removeClass("invalid-field");
           });


           $('#link-forgotPassword').click(function(){
        	   	  $(".js_form_in_login").hide();
        	   	  $(".login_is_fwdmember[value='no']").prop("checked",true);
                  $('form[name="forgotPasswordForm_non_member"]').fadeIn();
                  $('.empHide').hide();

                  $("#mobileNo").removeClass("invalid-field");
                  $("#emailAddress").removeClass("invalid-field");

                  $("#headerUserName").removeClass("invalid-field");
                  $("#headerPassword").removeClass("invalid-field");

                  $("#mobileNo-forgotpassowrd").removeClass("invalid-field");
                  $("#emailAddress-forgotpassowrd").removeClass("invalid-field");
                  $("#userName").removeClass("invalid-field");
           });
		   $(".login_is_fwdmember").change(function(){
			   var form = $(this).parent().parent().attr("form_type");
				if($(this).val()=='yes'){
					$(".login_is_fwdmember[value='yes']").prop("checked",true);
					$("form[name='"+ form +"_non_member']").hide();
					$("form[name='"+ form +"_member']").fadeIn();
				}else{
					$(".login_is_fwdmember[value='no']").prop("checked",true);
					$("form[name='"+ form +"_non_member']").fadeIn();
					$("form[name='"+ form +"_member']").hide();
				}			   
		   });
		 //date from mobiscroll 
			var dateTo = new Date();
		 	language = Site.language;
			$('#login_dob').mobiscroll().calendar({
				//dateOrder: 'ddMyy',
				display: 'bubble',
				showLabel: true,
				focusTrap: false,
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
					$('#login_dob').trigger('input');
					$('#login_dob').trigger('blur');
					if(valueText != "" && valueText != null){
						$('#login_dob').parent().addClass("is-dirty");
					}
				},
			    onShow: function () {
			        $(window).off('focusin');
			   }
			});
			$('#login_dob2').mobiscroll().calendar({
				//dateOrder: 'ddMyy',
				display: 'bubble',
				showLabel: true,
				focusTrap: false,
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
					$('#login_dob2').trigger('input');
					$('#login_dob2').trigger('blur');
					if(valueText != "" && valueText != null){
						$('#login_dob2').parent().addClass("is-dirty");
					}
				},
			    onShow: function () {
			        $(window).off('focusin');
			   }
			});
       })
    </script>




<!--/ Get promotion code popup-->

<script>
    function activeDiv(id, selected) {
        var selectedValue = $('#' + selected).val();
        if (id.indexOf('adult') > -1) {
            activeDeactive(selectedValue, id);
        }
        if (id.indexOf('child') > -1) {
            activeDeactive(selectedValue, id);
        }
        if (id.indexOf('other') > -1) {
            activeDeactive(selectedValue, id);
        }

    }
    function activeDeactive(selectedValue, id) {
        if (selectedValue == "SE") {
            $('#' + id).addClass('hide');
        } else {
            $('#' + id).removeClass('hide');
        }
    }

    function selected(id){
        $('#selectedAdHkidPass1').val(id.value);
    }
</script>

<script>

/* UserLogin ajax function */
function userLoginFnc() {

    /* var a=validUser(); */
    /*
    if(a==true)
    { */
    $.ajax({
        type : "POST",
        url : "<%=request.getContextPath()%>/userLogin",
        data : $("#popUploginform input").serialize(),
        async : false,
        success : function(data) {
            if (data.loginResult == 'success') {
            	window.location.href=window.location.href;
                //window.location.reload();
            } else if (data.loginResult == 'fail') {
                $('.login-ajax-loading').hide();
                $('#login-err-msg').show();
                $('#login-err-msg').html(getBundle(getBundleLanguage, "member.login.fail.first"));
            }
        }
    });
    /* } */
    return false;
}
function BackMe() {

    window.history.back();
}

var perventRedirect=false;
//window.onbeforeunload = function() {
//	if(perventRedirect){
//		return "<fmt:message key="index.leavePage.desc" bundle="${msg}" />";
//	}
//}
</script>
