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
            
            
                       <!-- 登入 -->      
            
                            <form name="loginform" id="loginform-pop">
                                        
                                        <div class="login-form" >
                                            <div
                                                style="display: none; position: absolute; left: 0; top: 0; bottom: 0; right: 0; background: #000; opacity: 0.8; z-index: 1000"
                                                id="ajax-loading">
                                                <img
                                                    style="width: 100px; height: 100px; position: absolute; top: 40%; left: 40%"
                                                    src="<%=request.getContextPath()%>/resources/images/ajax-loader.gif">
                                            </div>
                                            <div id="login-err-msg" class="alert alert-danger empHide"
                                                role="alert" style="display: none;"></div>
                                        
                                        
                                        <a class="close" aria-label="Close" data-dismiss="modal">
                                        <span aria-hidden="true" style="font-size:30px;">×</span>
                                        </a>
                                        
                                            <div class="form-container" >
                                                <h2><fmt:message key="header.login.heading" bundle="${msg}" /></h2>
                                                <h4 class="margin-shift">
                                                <!--使用者名 -->
                                                    <fmt:message key="header.login.username" bundle="${msg}" /> 
                                                    
                                                    <!-- 忘記使用者名 -->
                                                    <a id="forgotUserName" style="cursor:pointer"
                                                        class="pull-right sub-link"><fmt:message key="header.login.username.forget" bundle="${msg}" /></a>
                                                </h4>

                                                <div class="form-group">
                                                    <input type="text" name="userName" class="form-control check-emp"
                                                        placeholder="" id="headerUserName">
                                                </div>
                                                <span id="errUserName" class="empHide" style="color: red"></span>
                                                
                                                
                                                
                                                <h4 class="margin-shift">
                                                    <fmt:message key="header.login.password" bundle="${msg}" /> 
                                                    
                                                    <!--忘記密碼 -->                                                    
                                                    <a id="link-forgotPassword" style="cursor:pointer" 
                                                        class="pull-right sub-link"><fmt:message key="header.login.password.forget" bundle="${msg}" /></a>
                                                        
                                                </h4>
                                                <div class="form-group">
                                                    <input type="password" name="password" class="form-control check-emp-forgotusername" autocomplete="off"
                                                        id="headerPassword">
                                                </div>
                                                <span id="errPass" class="empHide" style="color: red"></span> <br>
                                                <div class="row">
                                                    <div class="col-lg-6 col-md-6">
                                                        <button type="submit" onclick="return submitLoginForm('loginform-pop');"
                                                            class="bdr-curve btn btn-primary btn-lg wd5"><fmt:message key="header.login.action" bundle="${msg}" /></button>
                                                    </div>
                                                    <h3
                                                        class="text-left col-lg-6 col-md-6 pad-none margin-none">
                                                        <span> <fmt:message key="header.login.registration.heading" bundle="${msg}" /></span><br> <a href="${pageContext.request.contextPath}/joinus">
                                                            <fmt:message key="header.login.registration.action" bundle="${msg}" /></a>
                                                    </h3>
                                                    <div class="clearfix"></div>
                                                </div>
                                                <p><fmt:message key="header.login.disclaimer" bundle="${msg}" /></p>
                                            </div>
                                        </div>
                    </form>
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    <!-- ======================================== 忘記使用者   ============================================================ -->
                                    <!-- ======================================== 忘記使用者   ============================================================ -->
                                    
                                    
                                    
                        <form name="forgotUserNameForm" id="forgotUserNameForm"
                    action="forgotUserNameFields" method="post"
                    commandName="forgotUserName" style="display:none">
                        
                        
                 
                        
                            <div class="login-form"  >
                <div id="forgotusername-err-msg" class="alert alert-danger"
                        role="alert" style="display: none;">
                        <P id="error-mobile-no"></P>
                        <P id="error-email-id"></P>
                    </div>

                    <div id="success-message" class="alert alert-success empHide" role="alert"
                        style="display: none;">
                        <P id="error1"></P>
                    </div>
                            
                            
                            
                                            <div
                                                style="display: none; position: absolute; left: 0; top: 0; bottom: 0; right: 0; background: #000; opacity: 0.8; z-index: 1000"
                                                id="ajax-loading">
                                                <img
                                                    style="width: 100px; height: 100px; position: absolute; top: 40%; left: 40%"
                                                    src="<%=request.getContextPath()%>/resources/images/ajax-loader.gif">
                                            </div>
                                            <div id="login-err-msg" class="alert alert-danger"
                                                role="alert" style="display: none;"></div>
                                        
                                                                           <a class="close" aria-label="Close" data-dismiss="modal">
                                        <span aria-hidden="true" style="font-size:30px;">×</span>
                                        </a>                                                                                                         
                                            <div class="form-container" >
                                                <h2>
                                                  <!--Message 忘記用戶名稱 -->
                                                  <fmt:message key="header.login.username.forget.part1" bundle="${msg}" />                                                                                                                                           
                                                </h2>
                                                

                                                <!--電話 text-------->                                                
                                                <h4 class="margin-shift">
                                                   <fmt:message key="member.registration.details.label.mobileNo" bundle="${msg}" />                                                    
                                                </h4>
                                                
                                                
                                                <!-- 電話 inout -->
                                                <div class="form-group">                                                   
                                                        <input type="text" name="mobileNo" class="form-control  check-emp-forgotusername" id="mobileNo" placeholder="<fmt:message key="member.registration.details.label.mobileNo.placeholder" bundle="${msg}" />">                                                                                                                
                                                </div>
                                                                                        
                                               <!--  phone erro message -->
                                                                    <span id="errorEmptyMob" class="hide1 empHide"> <label
                                            class="text-red"><fmt:message key="member.registration.details.label.mobileNo.errorEmptyMob" bundle="${msg}" /></label>
                                            
                                            
                                    </span> <span id="errorInvalidMob" class="hide1 empHide"> <label
                                            class="text-red"><fmt:message key="member.registration.details.label.mobileNo.errorInvalidMob" bundle="${msg}" /></label>
                                    </span>
                                       
                                       
                                                                                                                   
                                          <!-- -======================================================================- -->
                                                                                                                                                                  
                                                
                                                <!-- 電郵 text-->                                                
                                                <h4 class="margin-shift">                                                    
                                                    <fmt:message key="member.registration.details.label.emailAddress" bundle="${msg}" />                                                                                                                                                                                                         
                                                </h4>
                                              
                                              
                                                                                                                      
                                                 <!-- 電郵 input-->                                                
                                                <div class="form-group">
                                             <input type="email"
                                        name="emailAddress" class="form-control check-emp-forgotusername" id="emailAddress"
                                        placeholder="<fmt:message key="member.registration.details.label.emailAddress.placeholder" bundle="${msg}" />"> 
                                             
                                                </div>
                                                

                                                
                                                <!-- 電郵 Errror message -->   
                                                                                            
                                                <span id="errorEmptyEmailId" class="hide1 empHide"><label class="text-red"><fmt:message key="member.registration.details.label.emailAddress.errorEmptyEmailId" bundle="${msg}" /></label></span> 

                                    
                                                 <span id="errorInvalidEmailId" class="hide1 empHide"> 
                                                     <label class="text-red"><fmt:message key="member.registration.details.label.emailAddress.errorInvalidEmailId" bundle="${msg}" /></label>
                                                 </span>
                                                
                                                
                                                 <br> 
                                                
                                  
                                                <div class="row">
                                                    <div class="col-lg-6 col-md-6">
                                                                                                              
                                                                <button type="button" onclick="getForgotUserName()" class="bdr-curve-none btn btn-primary btn-lg "><fmt:message key="header.login.action2" bundle="${msg}" /></button>                                                    
                                                    
                                                    </div>
                                                    
                                                    <div class="clearfix"></div>
                                                </div>
                                             
                                            </div>
                             </div> 
                                   
                                </form>    
                                    
                                    <!-- 忘記使用者END -->
                                    

    <script>
        function getForgotUserName() {
            var validationFormVal = forgotUserName();
            if (validationFormVal == true) {
                $('#forgotusername-err-msg').hide();
                $('#ajax-loading').show();
                $
                        .ajax({
                            type : 'POST',
                            url : '<%=request.getContextPath()%>/forgotUser',
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
                                                   
                                    
                                <!-- ===================================================================================================== -->
                                <!-- ========================================忘記密碼===================================================== -->
                                <!-- ===================================================================================================== -->                                                                  
                                    
                              
             <form name="forgotPasswordForm" id="forgotPasswordForm"
                        action="forgotPassword" method="post"
                        commandName="forgotUserPassword" style="display:none">
                        
                        
           
                        
                        
                        
                            <div class="login-form"  >
                                                                                           
                                                                           <div id="hide-field"></div>
                        <div id="forgotpassword-err-msg" class="alert alert-danger empHide"
                            role="alert" style="display: none;">
                            <P id="error1"></P>
                        </div>
                        <div id="success-message" class="alert alert-success" role="alert"
                            style="display: none;">
                            <P id="error1"></P>
                        </div>
                            
                                            <div
                                                style="display: none; position: absolute; left: 0; top: 0; bottom: 0; right: 0; background: #000; opacity: 0.8; z-index: 1000"
                                                id="ajax-loading">
                                                <img
                                                    style="width: 100px; height: 100px; position: absolute; top: 40%; left: 40%"
                                                    src="<%=request.getContextPath()%>/resources/images/ajax-loader.gif">
                                            </div>
                                            <div id="login-err-msg" class="alert alert-danger"
                                                role="alert" style="display: none;"></div>
                                        
                                                    <a class="close" aria-label="Close" data-dismiss="modal">
                                        <span aria-hidden="true" style="font-size:30px;">×</span>
                                        </a>                                         
                                        
                                                                                                                                                           
                                            <div class="form-container" >
                                                <h2>
                                                  <!--Message 忘記密碼 -->
                                                 <fmt:message key="header.login.password.forget.part1" bundle="${msg}" />                                                                                                                                       
                                                </h2>
                                                
                                                
                                                
                                                     
                                                
                                                
                                                <!--電話 text-------->                                                
                                                <h4 class="margin-shift">
                                                   <fmt:message key="member.registration.details.label.mobileNo" bundle="${msg}" />                                                    
                                                </h4>
                                                
                                                
                                                <!-- 電話 inout -->
                                                <div class="form-group">                                                   
                                                        <input type="text" name="mobileNo" class="form-control check-emp-forgotuserpassoword" id="mobileNo-forgotpassowrd" placeholder="<fmt:message key="member.registration.details.label.mobileNo.placeholder" bundle="${msg}" />">                                                                                                                
                                               
                                               
                                                </div>
                                                                                        
                                               <!--  phone erro message -->
                                                                    <span id="errorEmptyMob-forgotPassword" class="hide1 empHide"> <label
                                            class="text-red"><fmt:message key="member.registration.details.label.mobileNo.errorEmptyMob" bundle="${msg}" /></label>
                                            
                                            
                                    </span> <span id="errorInvalidMob-forgotPassword" class="hide1 empHide"> <label
                                            class="text-red"><fmt:message key="member.registration.details.label.mobileNo.errorInvalidMob" bundle="${msg}" /></label>
                                    </span>
                                       
                                       
                                                    
                                                                                                                   
                                          <!-- -======================================================================- -->
                                                                                                                                                               
                                                
                                                <!-- 電郵 text-->                                                
                                                <h4 class="margin-shift">                                                    
                                                    <fmt:message key="member.registration.details.label.emailAddress" bundle="${msg}" />                                                                                                                                                                                                         
                                                </h4>
                                              
                                              
                                                                                                                      
                                                 <!-- 電郵 input-->                                                
                                                <div class="form-group">
                                                    <input type="email"
                                                name="emailAddress" class="form-control check-emp-forgotuserpassoword" id="emailAddress-forgotpassowrd"
                                                placeholder="<fmt:message key="member.registration.details.label.emailAddress.placeholder" bundle="${msg}" />"> <span id="errorEmptyEmailId" class="hide1"> <label class="text-red"><fmt:message key="member.registration.details.label.emailAddress.errorEmptyEmailId" bundle="${msg}" /></label></span>
                                                </div>
                                                
                                                
                                                

                                                
                                                <!-- 電郵 Errror message -->                                               
                                                <span id="errorEmptyEmailId-forgotpassword" class="hide1 empHide">
                                                     <label class="text-red"><fmt:message key="member.registration.details.label.emailAddress.errorEmptyEmailId" bundle="${msg}" /></label>
                                                </span> 

                                    
                                                 <span id="errorInvalidEmailId-forgotpassword" class="hide1"> 
                                                     <label class="text-red"><fmt:message key="member.registration.details.label.emailAddress.errorInvalidEmailId" bundle="${msg}" /></label>
                                                 </span>
                                                
                                                
                                                
                                                <!-- 使用者text -->
                                                   <h4 class="margin-shift">                                                    
                                                   <fmt:message key="member.registration.details.label.userName" bundle="${msg}" />                                                                                                                                                                                                     
                                                </h4>
                                                
                                                
                                                
                                                
                                                
                                                <!-- 使用者input -->
                                                
                                                    <div class="form-group">
                                                <input type="text" name="userName"
                                                class="form-control check-emp-forgotuserpassoword" id="userName" placeholder="<fmt:message key="member.registration.details.label.userName.placeholder" bundle="${msg}" />">
                                                </div>
                                                
                                                
                                                <!-- 使用者ERROR -->
                                                
                                                 <span id="errorEmptyUName" class="hide1 empHide"> <label
                                                    class="text-red"><fmt:message key="member.registration.details.label.userName.errorEmptyUName" bundle="${msg}" /></label>
                                                 </span> 
                                            
                                            
                                            <span id="errorInvalidUName" class="hide1 empHide"> <label
                                                    class="text-red"><fmt:message key="member.registration.details.label.userName.errorInvalidUName" bundle="${msg}" /></label>
                                            </span>
                                                
                                                
                                                 <br> 
                                                
                                  
                                                <div class="row">
                                                    <div class="col-lg-6 col-md-6">
                                                                                                              
                                                                                    <button type="button" onclick="forgotUserPassword()"
                                                    class="bdr-curve-none btn btn-primary btn-lg "><fmt:message key="member.registration.details.action" bundle="${msg}" /></button>                                                    
                                                    
                                                    </div>
                                                    
                                                    <div class="clearfix"></div>
                                                </div>
                                             
                                            </div>
                             </div> 
                                   
                                </form>    
                                    
            
                                    
                                    
                                
                                
                                
                                
                        

    <script>
        function forgotUserPassword() {
            
            var valid = true;
             
            var mobileNo = $('#mobileNo-forgotpassowrd').val();
            var emailId = $('#emailAddress-forgotpassowrd').val();
            var userName = $('#userName').val();
            
            
              // Mobile Number Validation
            if (mobileNo.trim() == "") {
                 $('#errorEmptyMob-forgotPassword').show();
                 valid = false;
            }   else{
                
                if (mobile_pattern.test(mobileNo) == false) {
                    $("#errorInvalidMob-forgotPassword").show();                   
                    valid = false;
                }               
            }          
            
           
            
            
            
            
            // Email Address Validation
            if (emailId.trim() == "") {
               $('#errorEmptyEmailId-forgotpassword').show();
                valid = false;
                
            } else {
                if (emailreg.test(emailId) == false) {
                      $('#errorInvalidEmailId-forgotpassword').show();
                      valid = false;
                    //document.getElementById("errorInvalidEmailId").style.display = "block";
                    //valid = false;
                }
            }
            
            
            
            // UserName Validation
            if (userName.trim() == "") {
                $("#errorEmptyUName").show();

                valid = false;

            } else {
                if (reg.test(userName) == false) {
                    $("#errorInvalidUName").show();
                    valid = false;
                } 
            
            }
            
            
            if( valid == true){

   
                $('#ajax-loading').show();
                $
                        .ajax({
                            type : 'POST',
                            url : '<%=request.getContextPath()%>/forgotUserPassword',
                            data : {'emailAddress':$('#emailAddress-forgotpassowrd').val(),
                                    'mobileNo':$('#mobileNo-forgotpassowrd').val(),
                                    'userName':$('#userName').val()
                                                                
                                },
                            success : function(data) {

                                $('#ajax-loading').hide();
                                if (data == 'fail') {
                                    $('#forgotpassword-err-msg')
                                            .html(
                                                    'Provided User Account Details Does Not Exist');
                                    $('#forgotpassword-err-msg').show();
                                } else if (data == 'success') {
                                    $('#success-message')
                                            .html(
                                                    'Link Sent Successfully On Your Registered Mail ID');
                                    $('#success-message').show();
                                } else {
                                    $('#success-message').html(
                                            'Internet Connection Error ');
                                    $('#success-message').show();
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
                                    
            </div>
        </div>
    </div>
    <!-- payment error popup  -->
    <!-- Modal -->
	<div class="modal fade bs-example-modal-lg  in" id="paymentErrorPopup" tabindex="-1" role="dialog" aria-hidden="true">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content plan-modal">
            <div class="modal-body">
                <a class="close" aria-label="Close" data-dismiss="modal"><span aria-hidden="true" style="font-size:30px;">×</span></a>
                <div class="form-container" style="padding-top: 10px;">
                    <br/>
                    Payment error, please contact customer service hot-line 3123 3123.
                    <br/>
                    <br/>
                    <br/>
                </div>
	      </div>
	    </div>
	  </div>
	</div>
    

    
    <script>
       $(document).ready(function(){

           
           
           $('html').keyup(function(e){
                    
                 var emp= "";
            $(".check-emp").each(function(){
               emp = emp + $(this).val(); 
            });
         
            
            
            
            if(emp==""){
             
              $('.empHide').hide();                                    
            }
            
            
            var checkEmpForgotuserName = "";                       
            $(".check-emp-forgotusername").each(function(){
                checkEmpForgotuserName = checkEmpForgotuserName + $(this).val(); 
             });            
            
            
            if(checkEmpForgotuserName==""){               
                $('.empHide').hide();                                    
              }
            
            var checkEmpForgotuserPassword = "";
            $('.check-emp-forgotuserpassoword').each(function(){                
                checkEmpForgotuserPassword = checkEmpForgotuserPassword + $(this).val(); 
                if(checkEmpForgotuserPassword==""){                    
                    $('.empHide').hide();                                    
                  }                                         
            })
            
            
               
           })
           
           
           

           
           
           //--
           $('.login-btn').click(function(){              
               $('#loginform-pop').show();
               $('#forgotUserNameForm').hide();
               $('#forgotPasswordForm').hide();
               
           })
           
           
           $('#forgotUserName').click(function(){       
               
               $('#loginform-pop').hide();
               $('#forgotUserNameForm').fadeIn();
               $('#forgotPasswordForm').hide();
               $('.empHide').hide();    
               
           })
           
           
           $('#link-forgotPassword').click(function(){             
                  $('#loginform-pop').hide();
                  $('#forgotUserNameForm').hide(); 
                  $('#forgotPasswordForm').fadeIn();
                  $('.empHide').hide();    
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

    $('#ajax-loading').show();
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
            $('#ajax-loading').hide();
            if (data == 'success') {
                window.location.reload();
                /* window.location.href = "getAccByUsernaneAndPassword"; */
            } else if (data == 'fail') {
                $('#ajax-loading').hide();
                $('#login-err-msg').show();
                $('#login-err-msg').html('Please Check Login Credential');
            }

        }
    });
    /* } */
    return false;
}
function BackMe() {

    window.history.back();
}
</script>
    