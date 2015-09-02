<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.ifwd.fwdhk.model.QuoteDetails"%>
<%@page import="com.ifwd.fwdhk.model.TravelQuoteBean"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="enhance" uri="http://pukkaone.github.com/jsp" %>

<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />

<%
    String authenticate = "false";
    if (request.getSession().getAttribute("authenticate") != null) {
        authenticate = request.getSession()
                .getAttribute("authenticate").toString();
    }
    
    TravelQuoteBean sessTravelQuoteBean = (TravelQuoteBean) session.getAttribute("corrTravelQuote");
    request.setAttribute("travelQuote", sessTravelQuoteBean);
%>

<script>
    $(function() {
        $("[data-toggle='tooltip']").tooltip();
    });
</script>


<script>

var getBundleLanguage = "";
var lang = UILANGUAGE;

if(lang === "EN"){
    getBundleLanguage = "en";
}else{
    if(lang === "tc"){
        getBundleLanguage = "zh";
    } 
    else{
        getBundleLanguage = "en";
    }
}

perventRedirect=true;
    
var namePlaceholder="<fmt:message key="travel.details.applicant.name.placeholder" bundle="${msg}" />";
var hkidPlaceholder="<fmt:message key="travel.details.applicant.hkid.placeholder" bundle="${msg}" />";

var insureNamePlaceholder="<fmt:message key="travel.details.insured.name.placeholder" bundle="${msg}" />";
var insureHkidPlaceholder="<fmt:message key="travel.details.insured.hkid.placeholder" bundle="${msg}" />";

var benNamePlaceholder="<fmt:message key="travel.details.insured.beneficiary.name.placeholder" bundle="${msg}" />";
var benHkidPlaceholder="<fmt:message key="travel.details.insured.beneficiary.hkid.placeholder" bundle="${msg}" />";
    

</script>




<% if (authenticate.equals("false") || authenticate.equals("direct")) { %>

<script>



function activateUserAccountJoinUs() {
	//html change, change the submit input type to button, add a onclick function
	//html change, added some error html note for user, so they know if the user name and email is not success
	
    //basic logic(how it works)    
    /*
    1. if no username or password is filled, direct submit the form
    2. if username field is filled, call the create user ajax and post data
    3. if the data has something wrong, return and show msg.
    4. if the data is correct, user created and will continue to submit the form.
    5, If user is created and the normal form data is missing, 
       the user create field html will hide, and the vaule will erase so it wont trigger the create user function again.
    */
    /*name = document.getElementById("Username").value;
    password = document.getElementById("Password").value;
    password2 = document.getElementById("Confirm-Password").value;*/
    
    name = $("#Username").val();
    password = $("#Password").val();
    password2 = $("#Confirm-Password").val();
    
    $("#UsernameError").text("");
    $("#PasswordError").text("");
    $("#Confirm-PasswordError").text("");
    $("#Username").removeClass("invalid-field");
    $("#Password").removeClass("invalid-field");
    $("#Confirm-Password").removeClass("invalid-field");
    
    //first error element
    var firstErrorElementId="";
    
    if(name == "" && password == "" && password2 == ""){
    	$('#frmYourDetails').submit()
    }else{
    	if(name != "" && password != "" && password2 != ""){
    		$('#chk1').html('');
    	    $('#chk2').html('');
    	    
    	    $('#dobInvalid').html('');
    	    
    		validateForm = true;
    		if (!checkMembership("Username")){
    			if(firstErrorElementId==""){
                    firstErrorElementId="Username";
                }
                validateForm = false;	
    		}
    		if (!checkMembership("Password")){
    			if(firstErrorElementId==""){
                    firstErrorElementId="Password";
                }
                validateForm = false;	
    		}
    		if (!checkMembership("Confirm-Password")){
    			if(firstErrorElementId==""){
                    firstErrorElementId="Confirm-Password";
                }
                validateForm = false;	
    		}
    		var applicantDob = $("#applicantDob").val();
            if (applicantDob.trim() == "") {
                
                document.getElementById("dobInvalid").innerHTML = getBundle(getBundleLanguage, "applicant.dob.notNull.message");
                $("#input_dob").addClass("invalid-field");
                if(firstErrorElementId==""){
                    firstErrorElementId="applicantDob";
                }
                validateForm = false;   
            
            }
    		if (!validateMobile('inputMobileNo','mobileNoInvalid')){
    			if(firstErrorElementId==""){
                    firstErrorElementId="inputMobileNo";
                }
                validateForm = false;	
    		}    		
    		if (!validateEmail('inputEmailId','emailid')){
    			if(firstErrorElementId==""){
                    firstErrorElementId="inputEmailId";
                }
                validateForm = false;	
    		}    
    		
    		
    		if(firstErrorElementId!=""){
    	        scrollToElement(firstErrorElementId);
    	    }
    		
        	if (!validateForm){
        		return;
        	}    		

        	optIn1 = "false"
  	        optIn2 = "false"
  	        if($('#checkbox4').is(':checked')){
  	            optIn2 = "true";    
  	        }
  	        if($('#checkbox3').is(':checked')){
  	            optIn1 = "true";    
  	        }
  	        password = document.getElementById("Password").value; 
  	        mobile = document.getElementById("inputMobileNo").value;
  	        name = document.getElementById("inputFullName").value;
  	        userName = document.getElementById("Username").value;
  	        email = document.getElementById("inputEmailId").value;
  	      
            $('#loading-overlay').modal({
              backdrop: 'static',
              keyboard: false
           })

  	       $.ajax({
  	                   type : 'POST',
  	                    url : '<%=request.getContextPath()%>/${language}/joinus',
  	                    data : { optIn1: optIn1, optIn2: optIn2, password: password, mobile: mobile, name: name, userName: userName, email: email, ajax: "true" },
  	                    async : false,
  	                    success : function(data) {
  	                        
  	                        if (data == 'success') {
  	                        	
  	                            $(".membership-wrap").css("display", "none"); 
  	                            document.getElementById("Username").value = "";
  	                            document.getElementById("Password").value = "";
  	                            document.getElementById("Confirm-Password").value = "";
  	                            
  	                            $("#link-error").click();
  	                            perventRedirect=false;
  	                             $('#frmYourDetails').submit();
  	                            return;                            
  	                        } else {
  	                        	
     	                            $("#link-error").click();
     	                            $(".error-hide").css("display", "block");
     	                            $('#loading-overlay').modal('hide');
  								if (data == 'This username already in use, please try again') {
  								    $('.error-hide').html('<fmt:message key="member.registration.fail.username.registered" bundle="${msg}" />');
  								} else if (data == 'email address and mobile no. already registered') {
  								    $('.error-hide').html('<fmt:message key="member.registration.fail.emailMobile.registered" bundle="${msg}" />');
  								} else {
  								    $('.error-hide').html(data);
  								}
     	                            return;
  	                        } 
  	                    },
  	                    error : function(xhr, status, error) {
  	                        $('#loading-overlay').modal('hide');

  	                    }
  	                });
    	}else{
    		// not all the fields filled
            if (name == ""){
                $('#UsernameError').text(isValidUsername($("#Username").val().trim()));
                $("#Username").addClass("invalid-field");
                if(firstErrorElementId==""){
                    firstErrorElementId="Username";
                } 
            }else{
            	if (!checkMembership("Username")){
                    if(firstErrorElementId==""){
                        firstErrorElementId="Username";
                    } 
                }
            }
            
            if (password == ""){
                $('#PasswordError').text(isValidPassword($("#Password").val().trim()));
                $("#Password").addClass("invalid-field");
                if(firstErrorElementId==""){
                    firstErrorElementId="Password";
                } 
            }else{
            	if (!checkMembership("Password")){
                    if(firstErrorElementId==""){
                        firstErrorElementId="Password";
                    } 
                }
            }
            
            
            if (password2 == ""){
                $('#Confirm-PasswordError').text(passMatch($('#Password').val(), $("#Confirm-Password").val().trim()));
                $("#Confirm-Password").addClass("invalid-field");
                if(firstErrorElementId==""){
                    firstErrorElementId="Confirm-Password";
                } 
            }else{
            	if (!checkMembership("Confirm-Password")){
                    if(firstErrorElementId==""){
                        firstErrorElementId="Confirm-Password";
                    } 
                }
            }
    	}
    	
    }
    
    if(firstErrorElementId!=""){
        scrollToElement(firstErrorElementId);
    }
    
    return;
       
}
</script>
<% }else{ %>

<script>
function activateUserAccountJoinUs() {
	perventRedirect=false;
	$('#frmYourDetails').submit();
}
</script>
<% } %> 

<section>
    <div id="cn" class="container">
        <div class="row">
            <form:form name="frmYourDetails" id="frmYourDetails" onsubmit="return validateAnnualTravelDetails(this,'frmYourDetails','${language}');" modelAttribute="frmYourDetails" method="post" action="" >
                <ol class="breadcrumb pad-none">
                    <li><a href="#"><fmt:message key="travel.breadcrumb1.item1" bundle="${msg}" /></a> <i class="fa fa-caret-right"></i></li>
                    <li><a href="#"><fmt:message key="travel.breadcrumb1.item2" bundle="${msg}" /></a> <i class="fa fa-caret-right"></i></li>
                    <li><a href="#"><fmt:message key="travel.breadcrumb1.item3" bundle="${msg}" /></a></li>
                    <li class="active "><i class="fa fa-caret-right"></i><fmt:message key="travel.breadcrumb1.item4" bundle="${msg}" /></li>
                </ol>
                <div class="container ">
                    <div class="col-md-12 shop-tracking-status">
                        <div class="center wow fadeInDown animated"
                            style="visibility: visible;">
                            <h2><fmt:message key="travel.details.jumbo" bundle="${msg}" /></h2>
                        </div>
                        <br>
                        <div class="col-lg-12">
                            <div id="tr-wizard" class="shop-tracking-status">
                                <div class="order-status has-four">
                                    <div class="order-status-timeline-new">
                                        <div class="order-status-timeline-completion dots-active"></div>
                                        <div class="order-status-timeline-completion dots-inactive"></div>
                                        <div class="order-status-timeline-completion dots-inactive"></div>
                                    </div>
                                    <div
                                        class="image-order-status image-order-status-new active img-circle first">
                                        <span class="status color3"><fmt:message key="travel.breadcrumb2.item1" bundle="${msg}" /></span>
                                        <div class="icon">1</div>
                                    </div>

                                    <div
                                        class="image-order-status image-order-status-intransit  img-circle act second">
                                        <span class="status color2"><fmt:message key="travel.breadcrumb2.item2" bundle="${msg}" /></span>
                                        <div class="icon">2</div>
                                    </div>
                                    <div
                                        class="image-order-status image-order-status-delivered  img-circle third">
                                        <span class="status"><fmt:message key="travel.breadcrumb2.item3" bundle="${msg}" /></span>
                                        <div class="icon">3</div>
                                    </div>
                                    <div
                                        class="image-order-status image-order-status-completed  img-circle fourth">
                                        <span class="status lst-status"><fmt:message key="travel.breadcrumb2.item4" bundle="${msg}" /></span>
                                        <div class="icon">4</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="quote-wrap" class="container pad-none bdr ur-opt-content gray-bg3">
                    <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 pad-none white-bg1">
                        <br>
                        <div class="form-wrap">
                        <%
                            if (authenticate.equals("false") || authenticate.equals("direct")) {
                        %>
                        <h3 class="h2-3-existing-fwd-head bmg-detail-exist-member-head">
                        <fmt:message key="travel.details.login" bundle="${msg}" />
                        <a
                        class="tool-tip show-inline-md"
                        data-toggle="tooltip" data-placement="bottom"
                        data-toggle="tooltip" data-placement="top"
                        title="<fmt:message key="member.account.login.help" bundle="${msg}" />">
                        <img src="<%=request.getContextPath()%>/resources/images/ic.png"
                        alt=""></a>
                        </h3>
                        <a href="#" class="col-lg-3 col-md-3 col-sm-3 col-xs-3 btn-box-2 color4 login-btn" data-toggle="modal" data-target="#loginpopup"><fmt:message key="travel.details.login.action" bundle="${msg}" /></a>    
                        <div class="col-lg-9 col-md-9 col-xs-9 col-sm-9 text-left">
                            <h3 class="text-left or-continue">
                                <span><fmt:message key="travel.details.login.other.part1" bundle="${msg}" /></span>
                                <fmt:message key="travel.details.login.other.part2" bundle="${msg}" />
                            </h3>
                        </div>
                        <div class="clearfix"></div>
                        <input type="hidden" id="isLogin" value="false">
                        <%
                            }
                            else
                            {
                        %>
                            <input type="hidden" id="isLogin" value="true">
                        <%
                            }
                        %>
                        </div>

                        <br/>
                        <div class="gray-bdr"></div>
                        <!-- updated responsive design start -->
                        <div class="form-wrap">
                            <div class="big-title black-bold pad-none bmg-big-title">
                                <fmt:message key="flight.details.applicant.heading"
                                    bundle="${msg}" />
                            </div>
                            <!-- english name start -->
                           <div class="form-group float">
                               <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                   <label for="inputFullName" class="field-label bold-500"><fmt:message key="travel.details.applicant.name" bundle="${msg}" /></label>
                               </div>
                               <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                   <input type="text" name="fullName"
                                        class="form-control full-control textUpper bmg_custom_placeholder" id="inputFullName"
                                        value="<fmt:message key="travel.details.applicant.name.placeholder" bundle="${msg}" />"
	                                    onfocus="placeholderOnFocus(this,'<fmt:message key="travel.details.applicant.name.placeholder" bundle="${msg}" />');" 
	                                    onblur="placeholderOnBlur(this,'<fmt:message key="travel.details.applicant.name.placeholder" bundle="${msg}" />'); validateName('inputFullName','fullnameinvalid',true,'applicant');"
                                        onkeypress="return alphaOnly(event);" maxlength="50" />
                                    <span id="fullnameinvalid" class="text-red"></span>
                               </div>
                           </div>
                           <!-- english name end -->
                           <!-- id card starts -->
                           <div class="form-group float">
                               <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                   <label for="inputHkid" class="field-label bold-500"><fmt:message key="travel.details.applicant.hkid.option1" bundle="${msg}" /></label>
                               </div>
                               <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                   <input type="text" name="hkid" class="form-control numberinput textUpper full-control bmg_custom_placeholder" id="inputTxtAppHkid" 
                                   onkeypress=" return hkidOnkeypress(event);"
                                   value="<fmt:message key="travel.details.applicant.hkid.placeholder" bundle="${msg}" />"
                                   onfocus="placeholderOnFocus(this,'<fmt:message key="travel.details.applicant.hkid.placeholder" bundle="${msg}" />');" 
                                   onblur="placeholderOnBlur(this,'<fmt:message key="travel.details.applicant.hkid.placeholder" bundle="${msg}" />'); validateHkid('inputTxtAppHkid','selectHkidPass','errAppHkid',true,'applicant');"/>
                                       <span id="errAppHkid" class="text-red" ></span>
                               </div>
                           </div>
                           <!-- id card ends -->
                           <!-- birthday starts -->
                           <div class="form-group float">
                               <div class="field-label form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                   <label for="inputApplicantDob"
                                        class="field-label bold-500"><fmt:message key="travel.details.applicant.birthday" bundle="${msg}" /></label>
                               </div>
                               <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                    <div class="input-group date" id="input_dob"> <span class="input-group-addon in border-radius"><img src="<%=request.getContextPath()%>/resources/images/calendar.png" alt=""></span>
                                        <input name="applicantDob" type="text"  class="pointer datepicker form-control border-radius" id="applicantDob" value="${corrTravelQuote.trLeavingDate}" readonly>
                                    </div>
                                    <span id="dobInvalid" class="text-red"></span>
                               </div>
                           </div>
                           <!-- birthday ends -->
                           <!-- mobile starts -->
                           <div class="form-group float">
                               <div class="field-label form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                   <label for="inputMobileNo"
                                        class="field-label bold-500"><fmt:message key="travel.details.applicant.mobile" bundle="${msg}" /></label>
                               </div>
                               <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                    <input name="mobileNo" type="tel"
                                        class="form-control full-control" value="${userDetails.mobileNo.trim()}"
                                        id="inputMobileNo" 
                                        onkeypress="return isNumeric(event)"
                                        onblur="replaceNumeric(this); validateMobile('inputMobileNo','errMobileNo');" maxlength="8" /> 
                                    <span id="errMobileNo" class="text-red">
                                    </span>
                               </div>
                           </div>
                           <!-- mobile ends -->
                           <!-- email address starts -->
                           <div class="form-group float">
                               <div class="field-label form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                   <label for="inputEmailId"
                                        class="field-label bold-500"><fmt:message key="travel.details.applicant.email" bundle="${msg}" /></label>
                               </div>
                               <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                   <input class="form-control full-control textLower" name="emailAddress" type="email"
                                        value="${userDetails.emailAddress.trim()}" id="inputEmailId"
                                        maxlength="50" onblur="validateEmail('inputEmailId','emailid');" > <span id="emailid" class="text-red"></span>
                               </div>
                           </div>
                         </div>
                        <%
                            if (authenticate.equals("false") || "direct".equalsIgnoreCase(request.getSession()
                                    .getAttribute("authenticate").toString())) {
                        %>
                        <div class="gray-bg3-wid container membership-wrap" style="padding-top: 20px;padding-left:0px;padding-right:0px;">
                            <div class="form-wrap">
                            <div class="membership-header">
                                <h3 class="bmg-membership-header"><fmt:message key="travel.details.registration.heading" bundle="${msg}" /></h3>
                                <i class="text-grey"><fmt:message key="travel.details.registration.desc" bundle="${msg}" /></i>
                                <h3 class="error-hide" style='display:none; color:red; font-size:15px;'></h3>                                
                            </div>
                            <div class="form-group float row">
                               <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12">
                                   <label class="field-label bold-500"><fmt:message key="travel.details.registration.username" bundle="${msg}" /></label>
                               </div>
                               <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12">
                                   <input type="text"
                                            name="username" class="form-control full-control input-white"
                                            id="Username" 
                                            onfocus="emptyMembershipError();" onkeypress="return validationUsername(event);"><span
                                            id="UsernameError" class="text-red"> </span>
                               </div>
                            </div>
                            <div class="form-group float row">
                               <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12">
                                   <label
                                            class="field-label bold-500"><fmt:message key="travel.details.registration.password" bundle="${msg}" /></label>
                               </div>
                               <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12">
                                   <input type="password"
                                            name="password" class="form-control full-control input-white"
                                            id="Password" autocomplete="off"
                                            onfocus="emptyMembershipError();"> <span
                                            id="PasswordError" class="text-red"> </span>
                               </div>
                            </div>
                            <div class="form-group float row">
                               <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12">
                                   <label
                                            class="field-label bold-500"><fmt:message key="travel.details.registration.confirmPassword" bundle="${msg}" /></label>
                               </div>
                               <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12">
                                  <input type="password"
                                            class="form-control full-control input-white" id="Confirm-Password"
                                            autocomplete="off"
                                            onfocus="emptyMembershipError();"> <span id="Confirm-PasswordError"
                                            class="text-red"> </span>
                               </div>
                            </div>
                            </div>
                        </div>
                        <input type="hidden" id="isLogin" value="false">
                        <input type="hidden" id="totalTravellingDays" name="totalTravellingDays" value="${corrTravelQuote.totalTravellingDays}">
                        <%
                            }
                            else
                            {
                        %>
                            <input type="hidden" id="isLogin" value="true">
                        <%
                            }
                        %>
                        <div class="clearfix"></div>
                        <div class="form-wrap">
                            <div class="big-title black-bold" style="padding-left:0px !important;">
                                <fmt:message key="flight.details.insured.heading" bundle="${msg}" />
                            </div>
                        </div>

                            <!-- Personal -->
                            <input type="hidden" name="totalPersonalTraveller"
                                id="totalPersonalTraveller"
                                value="${corrTravelQuote.totalPersonalTraveller}">
                            <c:forEach var="inx" begin="1"
                                end="${corrTravelQuote.totalPersonalTraveller}">
                                <div class="form-wrap">
                                <div class="personaltraveller">
                                    <h4 class="bold big-title" style="padding-left:0px !important;">
                                        <fmt:message key="flight.details.insured.label.personal" bundle="${msg}" />
                                        <c:out value="${inx}"></c:out>
                                        <c:if test="${inx == 1}"><fmt:message key="travel.details.insured.firstinsuredhint" bundle="${msg}" /></c:if>
                                    </h4>
                                    <div>
                                        <!-- english name start -->
                                       <div class="form-group float">
                                           <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                               <label class="field-label bold-500"><fmt:message key="travel.details.insured.name" bundle="${msg}" /></label>
                                           </div>
                                           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                               <c:if test="${inx == 1}">
                                                  <input type="text"
                                                        id="txtInsuFullName${inx}" name="personalName"
                                                        class="form-control full-control textUpper bmg_custom_placeholder" 
                                                        value="<fmt:message key="travel.details.insured.name.placeholder" bundle="${msg}" />"
		                                                onfocus="placeholderOnFocus(this,'<fmt:message key="travel.details.insured.name.placeholder" bundle="${msg}" />');" 
		                                                onblur="placeholderOnBlur(this,'<fmt:message key="travel.details.insured.name.placeholder" bundle="${msg}" />'); validateName('txtInsuFullName${inx}','errtxtPersonalFullName${inx}',false,'insured');"
                                                        onkeypress="return alphaOnly(event);" maxlength="100" readonly="readonly"/>
                                                </c:if>
                                                <c:if test="${inx > 1}">
                                                    <input type="text"
                                                        id="txtInsuFullName${inx}" name="personalName"
                                                        class="form-control full-control textUpper bmg_custom_placeholder" 
                                                        value="<fmt:message key="travel.details.insured.name.placeholder" bundle="${msg}" />"
                                                        onfocus="placeholderOnFocus(this,'<fmt:message key="travel.details.insured.name.placeholder" bundle="${msg}" />');" 
                                                        onblur="placeholderOnBlur(this,'<fmt:message key="travel.details.insured.name.placeholder" bundle="${msg}" />'); validateName('txtInsuFullName${inx}','errtxtPersonalFullName${inx}',false,'insured');"
                                                        onkeypress="return alphaOnly(event);" maxlength="100"/>
                                                 </c:if>
                                                 <span id="errtxtPersonalFullName${inx}" class="text-red"></span>
                                           </div>
                                       </div>
                                       <!-- english name end -->
                                       <!-- id card start -->
                                       <div class="form-group float">
                                           <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                               <label class="field-label bold-500"><fmt:message key="travel.details.applicant.hkid.option1" bundle="${msg}" /></label>
                                           </div>
                                           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                               <input id="txtInsuHkid${inx}" name="personalHKID" class="form-control textUpper full-control bmg_custom_placeholder" 
                                               value="<fmt:message key="travel.details.insured.hkid.placeholder" bundle="${msg}" />" onkeypress=" return hkidOnkeypress(event);" 
                                               onfocus="placeholderOnFocus(this,'<fmt:message key="travel.details.insured.hkid.placeholder" bundle="${msg}" />');" 
                                               onblur="placeholderOnBlur(this,'<fmt:message key="travel.details.insured.hkid.placeholder" bundle="${msg}" />'); validateHkid('txtInsuHkid${inx}','selectedPersonalHkidPass${inx}','errtxtInsuHkid${inx}',false,'insured');"
                                               <c:if test="${inx == 1}">readonly="readonly"</c:if>/> 
                                                    <span id="errtxtInsuHkid${inx}" class="text-red"> </span>
                                           </div>
                                       </div>
                                       <!-- id card end -->
                                       <!-- age start -->
                                       <div class="form-group float">
                                           <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                               <label class="field-label bold-500"><fmt:message key="travel.details.insured.age" bundle="${msg}" /></label>
                                           </div>
                                           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                               <div class="styled-select">
                                                        <select
                                                            name="personalAgeRange" class="form-control soflow select-label"
                                                            id="selectAgeRange${inx}">
        
                                                            <c:choose>
                                                                <c:when
                                                                    test="${inx == 1}">
                                                                    <c:forEach
                                                                        var="ageList" items="${mapSelfType}">
                                                                        <c:choose>
                                                                            <c:when
                                                                                test="${ageList.key == '2'}">
                                                                                <option
                                                                                    value="${ageList.key}" selected>
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <option
                                                                                    value="${ageList.key}">
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                        <c:out
                                                                            value="${ageList.value}" />
                                                                        </option>
                                                                    </c:forEach>
                                                                </c:when>
                                                                <c:when
                                                                    test="${inx >1}">
                                                                    <c:forEach
                                                                        var="ageList" items="${mapAgeType}">
                                                                        <c:choose>
                                                                            <c:when
                                                                                test="${ageList.key == '2'}">
                                                                                <option
                                                                                    value="${ageList.key}" selected>
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <option
                                                                                    value="${ageList.key}">
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                        <c:out
                                                                            value="${ageList.value}" />
                                                                        </option>
                                                                    </c:forEach>
                                                                </c:when>
                                                            </c:choose>
                                                        </select>
                                                    </div>
                                                    <span id="errselectAgeRange${inx}" class="text-red">
                                                    </span>
                                           </div>
                                       </div>
                                       <!-- age end -->
                                       <!-- beneficiary start -->
                                       <div class="form-group float">
                                           <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                               <label class="field-label bold-500"><fmt:message key="travel.details.insured.beneficiary" bundle="${msg}" /></label>
                                           </div>
                                           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                               <div class="styled-select">
                                                     <select name="personalBeneficiary" id="personalselectBenificiary${inx}" 
                                                            onChange="activeDiv('personalbenificiaryId${inx}','personalselectBenificiary${inx}', 'personalBenefitiaryId${inx}', 'personalBenefitiaryHKId${inx}')"
                                                        class="form-control soflow select-label" >
                                                        <c:forEach var="relationshipList" items="${mapRelationshipCode}">
                                                        	<enhance:out escapeXml="false">
                                                            <option value="${relationshipList.key}"><c:out
                                                                    value="${relationshipList.value}" /></option>
                                                            </enhance:out>
                                                        </c:forEach>
                                                    </select>
                                                    </div>
                                                    <span id="errpersonalselectBenificiary${inx}" class="text-red"></span>
                                           </div>
                                       </div>
                                       <!-- beneficiary end -->
                                       
                                       <!-- personalbenificiaryId start -->
                                       <div class="form-group float hide" id="personalbenificiaryId${inx}">
                                           <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                               <label class="field-label bold-500"></label>
                                           </div>
                                           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                               <div class="form-label col-lg-5 col-md-5 col-sm-5 col-xs-5 pad-none">                                                    
                                                    <label class="field-label bold-500">
                                                      <fmt:message key="travel.details.insured.beneficiary.name" bundle="${msg}" />
                                                    </label>
                                               </div>
                                               <div class="col-lg-7 col-md-7 col-sm-7 col-xs-7 pad-none">
                                                   <input type="text"
                                                        name="personalBenificiaryFullName"
                                                        id="personalBenefitiaryId${inx}" class="form-control full-control textUpper bmg_custom_placeholder"
                                                        value="<fmt:message key="travel.details.insured.beneficiary.name.placeholder" bundle="${msg}" />"
                                                        onfocus="placeholderOnFocus(this,'<fmt:message key="travel.details.insured.beneficiary.name.placeholder" bundle="${msg}" />');" 
                                                        onblur="placeholderOnBlur(this,'<fmt:message key="travel.details.insured.beneficiary.name.placeholder" bundle="${msg}" />'); validateName('personalBenefitiaryId${inx}','errpersonalBenefitiaryId${inx}',false,'beneficiary');"
                                                        onkeypress="    return alphaOnly(event);" maxlength="100" />
                                                    <span id="errpersonalBenefitiaryId${inx}" class="text-red"> </span>
                                               </div>
                                               <div class="clearfix"></div>
                                           </div>
                                       </div>
                                       <!-- personalbenificiaryId end -->
                                       <!-- personalbenificiaryId b start -->
                                       <div class="form-group float hide" id="personalbenificiaryId${inx}b">
                                           <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                              <label class="field-label form-label bold-500"></label>
                                           </div>
                                           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                              <div class="form-label col-lg-5 col-md-5 col-sm-5 col-xs-5 pad-none">
                                                  <label class="field-label form-label bold-500">
                                                    <fmt:message key="travel.details.insured.beneficiary.type" bundle="${msg}" />
                                                    </label>
                                               </div>
                                               <div class="col-lg-7 col-md-7 col-sm-7 col-xs-7 pad-none">
                                                  <div class="styled-select">
                                                    <select id="selectPersonalBenefitiaryHkidPass${inx}" class="form-control soflow select-label" name="selectedPersonalBenefitiaryHkidPass" onchange="togglePlaceholder(this,'personalBenefitiaryHKId${inx}','<fmt:message key="travel.details.insured.beneficiary.hkid.placeholder" bundle="${msg}" />');">
                                                        <option value="HKID" selected="selected"><fmt:message key="travel.details.insured.beneficiary.hkid.option1" bundle="${msg}" /></option>
                                                        <option value="passport"><fmt:message key="travel.details.insured.beneficiary.hkid.option2" bundle="${msg}" /></option>
                                                    </select>
                                                    </div>
                                               </div>
                                           </div>
                                       </div>
                                       <!-- personalbenificiaryId b end -->
                                       <!-- personalbenificiaryId c start -->
                                       <div class="form-group float hide" id="personalbenificiaryId${inx}c">
                                           <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                              <label class="field-label form-label bold-500 hidden-lg hidden-md"></label>
                                           </div>
                                           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                              <div class="form-label col-lg-5 col-md-5 col-sm-5 col-xs-5 pad-none">
                                                  <label class="field-label form-label bold-500 hidden-lg hidden-md"></label>
                                               </div>
                                               <div class="col-lg-7 col-md-7 col-sm-7 col-xs-7 pad-none">
                                                  <input
                                                    id="personalBenefitiaryHKId${inx}" name="personalBenificiaryHkid"
                                                    class="form-control textUpper full-control bmg_custom_placeholder" 
                                                    value="<fmt:message key="travel.details.insured.beneficiary.hkid.placeholder" bundle="${msg}" />" onkeypress=" return hkidOnkeypress(event);" 
                                                    onfocus="placeholderOnFocus(this,'<fmt:message key="travel.details.insured.beneficiary.hkid.placeholder" bundle="${msg}" />');" 
                                                  onblur="placeholderOnBlur(this,'<fmt:message key="travel.details.insured.beneficiary.hkid.placeholder" bundle="${msg}" />'); validateHkid('personalBenefitiaryHKId${inx}','selectPersonalBenefitiaryHkidPass${inx}','errpersonalBenefitiaryHKId${inx}',false,'beneficiary');"/> <span id="errpersonalBenefitiaryHKId${inx}"
                                                    class="text-red"> </span><span id="errInvalidpersonalBenefitiaryHKId${inx}"
                                                    class="text-red"> </span>
                                               </div>
                                           </div>
                                       </div>
                                       <!-- personalbenificiaryId c end -->
                                    </div>
                                </div>
                                </div>
                            </c:forEach>
                       <div class="clearfix"></div>
							<div class="form-wrap">
								<h4 class="h4-2 bmg-disclaimer-header"><fmt:message key="travel.details.declarations.heading" bundle="${msg}" /></h4>
								<div class="declaration-content" style="margin-left: 0px;margin-right: 0px;">
								<div class="checkbox">
									<input id="checkbox1" name="checkbox1" type="checkbox"> 
									<label for="checkbox1">
										<fmt:message key="travel.details.declarations.tnc" bundle="${msg}" /> 
										<ol class="ol-disclaimer">
											<li><fmt:message key="travel.details.declarations.tnc.desc1" bundle="${msg}" /></li>
											<li><fmt:message key="travel.details.declarations.tnc.desc2" bundle="${msg}" /></li>
											<li><fmt:message key="travel.details.declarations.tnc.desc3" bundle="${msg}" /></li>
											<li><fmt:message key="travel.details.declarations.tnc.desc4" bundle="${msg}" /></li>
											<li><fmt:message key="travel.details.declarations.tnc.desc5" bundle="${msg}" /></li>
										</ol>
									</label>
								</div>	
								<span id="chk1" class="text-red"></span>		
								<div class="checkbox">
									<input id="checkbox2" name="checkbox2" type="checkbox"> <label
										for="checkbox2">
										<fmt:message key="travel.details.declarations.PICS.part1" bundle="${msg}" /> <a
										href="<fmt:message key="PICS.link" bundle="${msg}" />"
										class="sub-link" target="_blank"><fmt:message key="travel.details.declarations.PICS.part2" bundle="${msg}" /></a> <fmt:message key="travel.details.declarations.PICS.part3" bundle="${msg}" />
										</label>
								</div>
								<span id="chk2" class="text-red"></span>
								<hr/>
								<div>
									 <label>
 									<fmt:message key="travel.details.declarations.PDPO" bundle="${msg}" /> <br>
									</label>
								</div>
								 <div class="checkbox">
									<input id="checkbox3" name="checkbox3" type="checkbox"> <label
										for="checkbox3"> <fmt:message key="travel.details.declarations.PDPO.option1" bundle="${msg}" /><br>
									</label>
								</div>
								<div class="checkbox">
									<input id="checkbox4" name="checkbox4" type="checkbox"> <label
										for="checkbox4">
                                        <fmt:message key="travel.details.declarations.PDPO.option2" bundle="${msg}" /><br>
                                    </label>
                                </div>
                                
                                <div class="checkboxBubble">
                                    <fmt:message key="travel.details.declarations.PDPO.warning" bundle="${msg}" />
                                </div>

                                <script type="text/javascript">
                                function showBubble(){
                                    if($("#checkbox3").prop('checked') || $("#checkbox4").prop("checked")) {
                                        $(".checkboxBubble").fadeIn();
                                    }else{
                                        $(".checkboxBubble").fadeOut();
                                    }
                                }
                                
                                $("#checkbox3").change(function() {
                                    showBubble();
                                });
                                
                                $("#checkbox4").change(function() {
                                    showBubble();
                                });
                                </script>

                            </div>
                            </div>
                        </div>
                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12  gray-bg pad-none wht-bg3 floatingbox">
                        <div class="hidden-sm hidden-xs">
                            <div class="wd2">
                                <div class="pull-left" style="width:150px;">
                                    <h2 class="h2-3-choose" style="padding-left:0px;font-size: 24px;"><fmt:message key="travel.sidebar.summary.product" bundle="${msg}" /></h2>
                                    <h4 style="padding-left:0px;line-height: 0px;font-size: 16px;"><fmt:message key="travel.sidebar.summary.desc.part1" bundle="${msg}" /> ${planName} <fmt:message key="travel.sidebar.summary.desc.part2" bundle="${msg}" /></h4>
                                    <input type="hidden" name="selectedPlanName" value="${planName }">
                                </div>
                                
                                <div class="pull-right" style="padding-top: 45px;">
                                    <div class="text-right h2-2 h2" style="margin-top:0px;margin-bottom:0px;">
                                        <div class="hk" style="font-size: 18px;">
                                            <fmt:message key="travel.dollar" bundle="${msg}" />
                                            <div class="flightcare-hk" style="font-weight: bold;font-size: 28px;">${planPremium}</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="clearfix"></div>
                            <div class="orange-bdr"></div>
                            <div class="form-container" style="padding: 0px !important;">
                                <div style="width: 80%;margin-left: 10%;">
                                <h3 class="txt-bold">
                                    <fmt:message key="travel.sidebar.summary.option1" bundle="${msg}" /> <a href="<%=request.getContextPath()%>/${language}/annual-travel-insurance"></a>
                                </h3>
                                <h4> 
                                <div class="input-group date"> <span class="input-group-addon in border-radius"><img src="<%=request.getContextPath()%>/resources/images/calendar.png" alt=""></span>
                                         <input name="trLeavingDate" type="text" class="datepicker form-control border-radius" id="txtStartDateDesk" value="${corrTravelQuote.trLeavingDate}" readonly>
                                </div>
                             </h4>
                                <input type="hidden" name="departureDate" id="departureDate"
                                    value="01-01-2015">

                                <h3 class="txt-bold">
                                    <fmt:message key="travel.sidebar.summary.option2" bundle="${msg}" /> <a href="<%=request.getContextPath()%>/${language}/annual-travel-insurance"></a>
                                </h3>
                                <h4>
                                                    <div class="input-group date"> <span class="input-group-addon in border-radius"><span><img src="<%=request.getContextPath()%>/resources/images/calendar.png" alt=""></span></span>
                      <input name="trBackDate" type="text" class="datepicker form-control border-radius" id="txtEndDateDesk" value="${corrTravelQuote.trBackDate}" readonly>
                    </div>
                                
                                </h4>
                                <input type="hidden" name="backDate" id="backDate"
                                    value="${corrTravelQuote.trBackDate}">

                                <h3 class="txt-bold">
                                    <fmt:message key="travel.sidebar.summary.option3" bundle="${msg}" /><a href="<%=request.getContextPath()%>/${language}/annual-travel-insurance"></a>
                                </h3>
                                <h4>
                                <%                              
                                    if (sessTravelQuoteBean.getPlanSelected() != null && sessTravelQuoteBean.getPlanSelected().equals("personal"))
                                    { 
                                %>
                                        <c:if test="${ corrTravelQuote.totalPersonalTraveller!=0}">
                                            <fmt:message key="travel.summary.insured.label.personal" bundle="${msg}" />
                                            : ${corrTravelQuote.totalPersonalTraveller}
                                        </c:if>
                                        <!-- vincent, values was stored in adult print adult values though the personal plan is selected!! -->
                                        <c:if test="${corrTravelQuote.totalAdultTraveller!=0}">
                                            <fmt:message key="travel.summary.insured.label.personal" bundle="${msg}" />
                                            : ${corrTravelQuote.totalAdultTraveller}
                                        </c:if>

                                <%  }
                                    else
                                    {                                       
                                %>  

                                    <c:if test="${ corrTravelQuote.totalAdultTraveller!=0}"><fmt:message key="travel.summary.insured.label.family.parent" bundle="${msg}" />: ${corrTravelQuote.totalAdultTraveller+corrTravelQuote.totalPersonalTraveller}</c:if>
                                    <c:if test="${ corrTravelQuote.totalChildTraveller!=0}"><br><fmt:message key="travel.summary.insured.label.family.child" bundle="${msg}" />: ${corrTravelQuote.totalChildTraveller}</c:if>
                                    <c:if test="${ corrTravelQuote.totalOtherTraveller!=0}"><br><fmt:message key="travel.summary.insured.label.family.others" bundle="${msg}" />: ${corrTravelQuote.totalOtherTraveller}</c:if>
                                    <c:if test="${planDetailsForm.travellerCount!=0}"> ${planDetailsForm.travellerCount}</c:if>
                                <%  } %>
                                </h4>
                                
                                <input type="hidden" name="planSelected" value="${corrTravelQuote.planSelected}">
                                <h3 class="txt-bold">
                                    <fmt:message key="travel.sidebar.summary.option4" bundle="${msg}" /> <span>${corrTravelQuote.totalTravellingDays}</span>
                                </h3>
                                <input type="hidden" name="totalTravellingDays" value="${corrTravelQuote.totalTravellingDays}">
                                <c:if test="${referralCode!=''}">
                                    <h3><fmt:message key="travel.sidebar.summary.promocode" bundle="${msg}" /></h3>
                                    <h4>${referralCode}</h4>
                                </c:if>
                                
                               </div>
            </div>
                <div style="width: 80%;margin-left: 10%;">
                    <h3 class="h4-1-orange-b col-lg-6 col-md-6" style="padding-left:0px;font-size: 18px;"><fmt:message key="travel.sidebar.summary.subtotal" bundle="${msg}" /> </h3>
                    <h3 class="h4-1-orange-b col-lg-6 col-md-6 text-right" style="padding-right: 0px;font-size: 18px;">${planPremium}</h3>
                    <h3 class="h4-1-orange-b col-lg-6 col-md-6" style="padding-left:0px;font-size: 18px;"><fmt:message key="travel.sidebar.summary.discount" bundle="${msg}" /> </h3>
                    <h3 class="h4-1-orange-b col-lg-6 col-md-6 text-right" style="padding-right: 0px;font-size: 18px;">${planDiscount} </h3>
                </div>
                <div class="clearfix"></div>
                <div class="orange-bdr"></div>
                <div style="width: 80%;margin-left: 10%;">
                    <h3 class="h4-1-orange-b col-lg-6 col-md-6" style="padding-left:0px;font-size: 18px;"><fmt:message key="travel.sidebar.summary.amountDue" bundle="${msg}" />  </h3>
                    <h3 class="h4-1-orange-b col-lg-6 col-md-6 text-right" style="padding-right: 0px;font-size: 18px;">${planSummary}</h3>
                    <input type="hidden" name="finalDueAmount" value="${planSummary}">
                </div>
                
                <div style="width: 80%;margin-left: 10%;">
                    <div class="top35 pull-left pad-none" style="width:47%">
                         <a class="bdr-curve btn btn-primary bck-btn" onclick="perventRedirect=false;BackMe();"><fmt:message key="travel.action.back" bundle="${msg}" /> </a>
                    </div>
                    <div class="top35 pull-right pad-none" style="width:47%"> 
                        <c:choose>
<c:when test="${language=='en'}">
           <input type="button" onclick="javascript:kenshoo_conv('Registration_Step2','${planSummary}','','Regis_Travel_Step2 EN','USD');return activateUserAccountJoinUs();" class="bdr-curve btn btn-primary nxt-btn" value=" <fmt:message key="travel.action.next" bundle="${msg}" />" />
       </c:when>
       <c:otherwise>
           <input type="button" onclick="javascript:kenshoo_conv('Registration_Step2','${planSummary}','','Regis_Travel_Step2 ZH','USD');return activateUserAccountJoinUs();" class="bdr-curve btn btn-primary nxt-btn" value=" <fmt:message key="travel.action.next" bundle="${msg}" />" />
       </c:otherwise>
</c:choose>

						                        
                    </div>
                </div>
<div class="clearfix"></div>
<br>
</div>
</div>
<div class="clearfix"></div>
</div>

<div class="col-xs-12 hidden-md hidden-lg pad-none">
     <div style="width: 80%;margin-left: 10%;">
         <hr/>
     </div>
</div>

<p class="padding1 workingholiday-plan-disclaimer"><fmt:message key="travel.main.other.disclaimer.part1" bundle="${msg}" />
<a class="sub-link" href="<%=request.getContextPath()%>/<fmt:message key="travel.provision.link" bundle="${msg}" />" target="_blank">
<fmt:message key="travel.main.other.disclaimer.part2" bundle="${msg}" /></a> 
<fmt:message key="travel.main.other.disclaimer.part5" bundle="${msg}" /> 
<a href="<fmt:message key="travel.brochure.link" bundle="${msg}" />" target="_blank"> 
    <u><fmt:message key="travel.main.other.disclaimer.part6" bundle="${msg}" /></u>
</a> 
<fmt:message key="travel.main.other.disclaimer.part3" bundle="${msg}" /><br>
<fmt:message key="travel.main.other.disclaimer.part4" bundle="${msg}" /></p>

<div class="col-xs-12 hidden-md hidden-lg pad-none">
   <div style="width: 80%;margin-left: 10%;  margin-bottom: 50px;">
        <div class="top35 pull-left pad-none" style="width:47%">
            <a class="bdr-curve btn btn-primary bck-btn" onclick="perventRedirect=false;BackMe();"><fmt:message key="travel.action.back" bundle="${msg}" /> </a>
        </div>
        <div class="top35 pull-right pad-none" style="width:47%">
			<c:choose>
<c:when test="${language=='en'}">
       	<input type="button" onclick="javascript:kenshoo_conv('Registration_Step2','${planSummary}','','Regis_Travel_Step2 EN','USD');$('#loading-overlay').modal({backdrop: 'static',keyboard: false});return activateUserAccountJoinUs();" class="bdr-curve btn btn-primary nxt-btn" value=" <fmt:message key="travel.action.next" bundle="${msg}" />" />
       </c:when>
       <c:otherwise>
       	<input type="button" onclick="javascript:kenshoo_conv('Registration_Step2','${planSummary}','','Regis_Travel_Step2 ZH','USD');$('#loading-overlay').modal({backdrop: 'static',keyboard: false});return activateUserAccountJoinUs();" class="bdr-curve btn btn-primary nxt-btn" value=" <fmt:message key="travel.action.next" bundle="${msg}" />" />
       </c:otherwise>
</c:choose>

        </div>
        <div class="clearfix"></div>
    </div>
</div>

</form:form>
</div>
<!--/.row-->
</div>
<!--/.container-->

</section>

<!--Plan-login-popup-->
<!--Get promotion code popup-->
 <div class="modal fade bs-promo-modal-lg " tabindex="-1" role="dialog"  aria-hidden="true" style="display: none;">
      <div class="modal-dialog modal-lg">
        <div class="modal-content plan-modal">
          <div class="login-form">
            <div class="form-container">
              <h2><fmt:message key="promotion.get.code" bundle="${msg}" /></h2>
              <h4><fmt:message key="promotion.get.code.email" bundle="${msg}" /> </h4>
              <div class="form-group">
                <input type="email" class="form-control" placeholder="" id="txtPromoEmail">
              </div>
              <span id="errPromoEmail" class="text-red"></span>
               <br>
              
              <div class="row"> 
               <div class="col-lg-6 col-md-6">
                  <a class="bdr-curve btn btn-primary btn-lg wd5" href="#" onclick="return get_promo_val()"><fmt:message key="promotion.get.code.action" bundle="${msg}" /></a> 
               </div>
               <div class="col-md-2">
               <br>
               </div>
               <div class="col-lg-4 col-md-4">
               <!--     <a class="bdr-curve btn btn-primary btn-lg promo-pop-close wd5" href="#" data-dismiss="modal">Close </a>  -->
               </div>
               <br>
               <br>
               <div class="col-md-12">
                  <p><fmt:message key="promotion.get.code.disclaimer" bundle="${msg}" /></p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    </div>
    
<!--/ Get promotion code popup-->

<div class="scroll-to-top">
    <a title="Scroll to top" href="#">
        <img src="<%=request.getContextPath()%>/resources/images/up-arrow.png" alt="Scroll to top"  />
    </a>
</div>

<script>
    function activeDiv(id, selected, beneFullName, beneHkId) {
        var selectedValue = $('#' + selected).val();
        if (id.indexOf('personal') > -1) {
            activeDeactive(selectedValue, id, beneFullName, beneHkId);
        }
        if (id.indexOf('adult') > -1) {
            activeDeactive(selectedValue, id, beneFullName, beneHkId);
        }
        if (id.indexOf('child') > -1) {
            activeDeactive(selectedValue, id, beneFullName, beneHkId);
        }
        if (id.indexOf('other') > -1) {
            activeDeactive(selectedValue, id, beneFullName, beneHkId);
        }
    }
    function activeDeactive(selectedValue, id, beneFullName, beneHkId) {
        if (selectedValue == "SE") {
        	$('#' + beneFullName).text('');
            $('#' + beneHkId).text('');
            $('#' + beneFullName).val('');
            $('#' + beneHkId).val('');
            
            $('#' + id).addClass('hide');
            $('#' + id + 'b').addClass('hide');
            $('#' + id + 'c').addClass('hide');
            
        } else {
            $('#' + id).removeClass('hide');
            $('#' + id + 'b').removeClass('hide');
            $('#' + id + 'c').removeClass('hide');
            
        }
    }

    function selected(id){
        $('#selectedAdHkidPass1').val(id.value);
        $('#selectedPersonalHkidPass1').val(id.value);
    }
</script>

<script>

/* UserLogin ajax function */
function userLoginFnc() {

    $('#ajax-loading').show();
    $.ajax({
        type : "POST",
        url : "<%=request.getContextPath()%>/userLogin",
        data : $("#popUploginform input").serialize(),
        async : false,
        success : function(data) {
            $('#ajax-loading').hide();
            if (data == 'success') {
            	window.location.reload();
            } else if (data == 'fail') {
                $('#ajax-loading').hide();
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
</script>
<script>
window.onload = function(){
	$('select[id^="personalselectBenificiary"]').each(function(i) {
		var index = i + 1;
		activeDiv('personalbenificiaryId' + index,'personalselectBenificiary' + index, 'personalBenefitiaryId' + index, 'personalBenefitiaryHKId' + index);
	});
};
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/annual-travel.js"></script>