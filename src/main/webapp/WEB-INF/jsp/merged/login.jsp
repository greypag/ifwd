<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeQuoteBean"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />


<%
	String actionName="";

	if (request.getAttribute("controller") != null) {
	    actionName = request.getAttribute("controller").toString();
	}
%>
<div class="modal fade" id="loginpopup" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
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
                    <img src="<%=request.getContextPath()%>/<fmt:message key="Savie.login.overlay.image" bundle="${msg}" />" alt="Saive" class="hidden-xs hidden-sm img-responsive">
                    <img src="<%=request.getContextPath()%>/<fmt:message key="Savie.login.overlay.image.mobile" bundle="${msg}" />" alt="Saive" class="hidden-lg hidden-md img-responsive">
                </div>
                <%}%>
        <div class="login-title-wrapper"><h4 class="color-darkgray heading-h4"><fmt:message key="header.login.action" bundle="${msg}" /></h4></div>
			<form name="loginform" id="loginform-pop" method="post">
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
                            <input id="nav-bar-check" type="hidden" name="isNavBar" value="true">
							<button type="button" onclick="submitLoginForm('loginform-pop');"
								class="cta-confirm cta-font cta-orange cta-padding-40">
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












			<!-- ======================================== 忘記使用者   ============================================================ -->
			<!-- ======================================== 忘記使用者   ============================================================ -->



			<form name="forgotUserNameForm" id="forgotUserNameForm"
				action="forgotUserNameFields" method="post"
				commandName="forgotUserName" style="display: none">

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


						<!--電話 text-------->


						<!-- 電話 inout -->
						<div class="form-group">
							<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
								<input type="tel" name="mobileNo"
									class="form-control gray-textbox check-emp-forgotusername login-input mdl-textfield__input" id="mobileNo"
									onkeypress="return isNumeric(event)" onblur="forgotUserName();">
								<label class="mdl-textfield__label" for="mobileNo"><fmt:message key="member.registration.details.label.mobileNo" bundle="${msg}" /></label>
			                        <!--  phone erro message -->
			                        <span id="errorEmptyMob" class="hide1 empHide"> <label
			                            class="color-red heading-h5"><fmt:message
			                                    key="member.registration.details.label.mobileNo.errorEmptyMob"
			                                    bundle="${msg}" /></label>

			                        </span>
			                        <span id="errorInvalidMob" class="hide1 empHide"> <label
			                            class="color-red heading-h5"><fmt:message
			                                    key="member.registration.details.label.mobileNo.errorInvalidMob"
			                                    bundle="${msg}" /></label>
			                        </span>
			                </div>
						</div>

						<!-- -======================================================================- -->

						<!-- 電郵 text-->
						<!-- 電郵 input-->
						<div class="form-group">
							<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
							<input type="email" name="emailAddress"
                                class="form-control gray-textbox mdl-textfield__input check-emp-forgotusername login-input"
								id="emailAddress"
								onkeypress="return validationEmail(event);"
								onblur="forgotUserName();">
                                <label class="mdl-textfield__label" for="emailAddress"><fmt:message key="member.registration.details.label.emailAddress" bundle="${msg}" /></label>
		                         <!-- 電郵 Errror message -->

		                        <span id="errorEmptyEmailId" class="hide1 empHide"><label
		                            class="color-red heading-h5"><fmt:message
		                                    key="member.registration.details.label.emailAddress.errorEmptyEmailId"
		                                    bundle="${msg}" /></label></span> <span id="errorInvalidEmailId"
		                            class="hide1 empHide"> <label class="color-red heading-h5"><fmt:message
		                                    key="member.registration.details.label.emailAddress.errorInvalidEmailId"
		                                    bundle="${msg}" /></label>
		                        </span>
		                     </div>
						</div>


						<div class="login-button-group forgot-group">
							<button type="button" onclick="backToLogin()"
								class="cta-confirm cta-font cta-gray cta-padding-40">
								<fmt:message key="header.login.back" bundle="${msg}" />
							</button>

							<button type="button" onclick="getForgotUserName()"
								class="cta-confirm cta-font cta-orange cta-padding-40">
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
        function getForgotUserName() {
        	$('#forgotusername-err-msg').hide();
        	$('#success-message').hide();

            var validationFormVal = forgotUserName();
            if (validationFormVal == true) {
                $('#forgotusername-err-msg').hide();
                $('.login-ajax-loading').show();
                $.ajax({
                            type : 'POST',
                            url : '<%=request.getContextPath()%>/forgotUser',
                            data : $('#forgotUserNameForm input').serialize(),
                            success : function(data) {

                                $('.login-ajax-loading').hide();
                                if (data == 'fail') {
                                    $('#forgotusername-err-msg').html(getBundle(getBundleLanguage, "member.login.fail.first"));
		                            $('#forgotusername-err-msg').show();
                                    $('#user-details-main').hide();
                                    $('#hide-field').hide();
                                } else if (data.indexOf('~~~') > -1) {
                                    $('#success-message').html(data.slice(5, 68));
                                    $('#success-message').show();
                                    $('#user-details-main').hide();
                                    $('#hide-field').hide();
                                } else if (data.indexOf('[')==0&data.indexOf(']')>0) {
                                	$('#success-message').html('');
                                    $('#success-message').hide();
                                    $('#forgotusername-err-msg').html(data.slice(2, data.length-2));
                                    $('#forgotusername-err-msg').show();
                                } else {
                                    $('#success-message').html('Your Username is ' + data);
                                    $('#success-message').show();
                                }

                            },
                            error : function(xhr, status, error) {
                                $('.login-ajax-loading').hide();
                            }
                        });
            }
        }
    </script>


			<!-- ===================================================================================================== -->
			<!-- ========================================忘記密碼===================================================== -->
			<!-- ===================================================================================================== -->


			<form name="forgotPasswordForm" id="forgotPasswordForm"
				action="forgotPassword" method="post"
				commandName="forgotUserPassword" style="display: none">

				<div class="login-form">

                 <div id="forgotpassword-err-msg" class="color-red heading-h5"
                     role="alert" style="display: none;">
                     <P id="error1"></P>
                 </div>
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






						<!-- 電話 inout -->
						<div class="form-group">
							<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
							<input type="tel" name="mobileNo"
								class="form-control check-emp-forgotuserpassoword login-input gray-textbox mdl-textfield__input"
								id="mobileNo-forgotpassowrd"
								onkeypress="return isNumeric(event)"
								onblur="validForgetUserPassword();">
							<label class="mdl-textfield__label" for="mobileNo-forgotpassowrd"><fmt:message key="member.registration.details.label.mobileNo" bundle="${msg}" /></label>
		                        <!--  phone erro message -->
		                        <span id="errorEmptyMob-forgotPassword" class="hide1 empHide color-red heading-h5">
		                            <label class="color-red heading-h5"><fmt:message
		                                    key="member.registration.details.label.mobileNo.errorEmptyMob"
		                                    bundle="${msg}" /></label>
		                        </span>
		                        <span id="errorInvalidMob-forgotPassword" class="hide1 empHide color-red heading-h5">
		                            <label class="color-red heading-h5"><fmt:message
		                                    key="member.registration.details.label.mobileNo.errorInvalidMob"
		                                    bundle="${msg}" /></label>
		                        </span>
							</div>
						</div>




						<!-- -======================================================================- -->




						<!-- 電郵 input-->
						<div class="form-group">
							<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
							<input type="email" name="emailAddress"
								class="form-control check-emp-forgotuserpassoword login-input gray-textbox mdl-textfield__input"
								id="emailAddress-forgotpassowrd"
								onkeypress="return validationEmail(event);"
								onblur="validForgetUserPassword();">
								<label class="mdl-textfield__label" for="emailAddress-forgotpassowrd"><fmt:message key="member.registration.details.label.emailAddress" bundle="${msg}" /></label>
		                        <!-- 電郵 Errror message -->
		                        <span id="errorEmptyEmailId" class="hide1 empHide color-red heading-h5"> <label
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
		                        </span>
		                       </div>
						</div>







						<!-- 使用者input -->

						<div class="form-group">
							<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
							<input type="text" name="userName"
								class="form-control check-emp-forgotuserpassoword login-input gray-textbox mdl-textfield__input"
								id="userName"
								onkeypress="return validationUsername(event);"
								onblur="validForgetUserPassword();">
								<label class="mdl-textfield__label" for="userName"><fmt:message key="member.registration.details.label.userName" bundle="${msg}" /></label>
		                        <!-- 使用者ERROR -->

		                        <span id="errorEmptyUName" class="hide1 empHide color-red heading-h5"> <label
		                            class="color-red heading-h5"><fmt:message
		                                    key="member.registration.details.label.userName.errorEmptyUName"
		                                    bundle="${msg}" /></label>
		                        </span>
		                        <span id="errorInvalidUName" class="hide1 empHide color-red heading-h5"> <label
		                            class="color-red heading-h5"><fmt:message
		                                    key="member.registration.details.label.userName.errorInvalidUName"
		                                    bundle="${msg}" /></label>
		                        </span>
		                        </div>
						</div>





						<div class="login-button-group forgot-group">

							<button type="button" onclick="backToLogin()"
								class="cta-confirm cta-font cta-gray cta-padding-40">
								<fmt:message key="header.login.back" bundle="${msg}" />
							</button>


							<button type="button" onclick="forgotUserPassword()"
								class="cta-confirm cta-font cta-orange cta-padding-40">
								<fmt:message key="member.registration.details.action"
									bundle="${msg}" />
							</button>

						</div>
	                    <div id="hide-field"></div>
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


        function forgotUserPassword() {



            if( validForgetUserPassword() == true){


                $('.login-ajax-loading').show();
                $.ajax({
                            type : 'POST',
                            url : '<%=request.getContextPath()%>/forgotUserPassword',
                            data : {'emailAddress':$('#emailAddress-forgotpassowrd').val(),
                                    'mobileNo':$('#mobileNo-forgotpassowrd').val(),
                                    'userName':$('#userName').val()

                                },
                            success : function(data) {

                                $('.login-ajax-loading').hide();
                                if (data == 'fail') {
                                    $('#forgotpassword-err-msg').html(getBundle(getBundleLanguage, "member.login.fail.first"));
                                    $('#forgotpassword-err-msg').show();
                                } else if (data == 'success') {
                                    $('#success-message-password').html(getBundle(getBundleLanguage, "member.forgotPassword.success.message"));
                                    $('#success-message-password').show();
                                } else {
                                    $('#success-message-password').html(getBundle(getBundleLanguage, "connection.lost.message"));
                                    $('#success-message-password').show();
                                    $('#user-details-main').hide();
                                }

                            },
                            error : function(xhr, status, error) {
                                $('.login-ajax-loading').hide();
                            }
                        });
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

    function backToLogin(){
    	$('#loginform-pop').fadeIn();
        $('#forgotUserNameForm').hide();
        $('#forgotPasswordForm').hide();
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
	   	   $('#loginpopup').on('hidden.bs.modal', function () {
		   		console.log("fna-cnacel");
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
               $('#loginform-pop').show();
               $('#forgotUserNameForm').hide();
               $('#forgotPasswordForm').hide();


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

               $('#loginform-pop').hide();
               $('#forgotUserNameForm').fadeIn();
               $('#forgotPasswordForm').hide();
               $('.empHide').hide();

               $("#mobileNo").removeClass("invalid-field");
               $("#emailAddress").removeClass("invalid-field");

               $("#headerUserName").removeClass("invalid-field");
               $("#headerPassword").removeClass("invalid-field");

               $("#mobileNo-forgotpassowrd").removeClass("invalid-field");
               $("#emailAddress-forgotpassowrd").removeClass("invalid-field");
               $("#userName").removeClass("invalid-field");
           })


           $('#link-forgotPassword').click(function(){
                  $('#loginform-pop').hide();
                  $('#forgotUserNameForm').hide();
                  $('#forgotPasswordForm').fadeIn();
                  $('.empHide').hide();

                  $("#mobileNo").removeClass("invalid-field");
                  $("#emailAddress").removeClass("invalid-field");

                  $("#headerUserName").removeClass("invalid-field");
                  $("#headerPassword").removeClass("invalid-field");

                  $("#mobileNo-forgotpassowrd").removeClass("invalid-field");
                  $("#emailAddress-forgotpassowrd").removeClass("invalid-field");
                  $("#userName").removeClass("invalid-field");
           })


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
