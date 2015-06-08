<%@page import="com.ifwd.fwdhk.model.PlanDetailsForm"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.ifwd.fwdhk.model.FlightQuoteDetails"%>
<%@page import="com.ifwd.fwdhk.model.PlanDetails"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />

<%@page import="java.util.ArrayList"%>
<%
    String authenticate = "false";
    if (session.getAttribute("authenticate") != null) {
        authenticate = session.getAttribute("authenticate").toString();
    }
%>



<script>
    $(function() {
        $("[data-toggle='tooltip']").tooltip();
    });
</script>

<script>

/* Commented because login is not compulsory */ 
<%-- function fligh	ation() {
 <%if (authenticate.equalsIgnoreCase("false")) {%>
$('#loginpopup').modal('show');
<%} else {%> 
document.freeFlight.action = "flight-confirmation";
return true;
<%}%> 
return false;
} --%>

</script>
<!-- for debug
Personal : ${planDetailsForm.getTotalPersonalTraveller()}   <br>
Adult    : ${planDetailsForm.getTotalAdultTraveller()} 		<br>
Child    : ${planDetailsForm.getTotalChildTraveller()} 		<br>
Others   : ${planDetailsForm.getTotalOtherTraveller()} 		<br>
-->

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
    
            
    if(name == "" && password == "" && password2 == ""){
        $('#freeFlightForm').submit()
    }else{
    	
    	if(name != "" && password != "" && password2 != ""){
    		$('#chk1').html('');
            $('#chk2').html('');
            
            $('#dobInvalid').html('');
    		
    		validateForm = true;
    		if (!checkMembership("Username")){
    			validateForm = false;	
    		}
    		if (!checkMembership("Password")){
    			validateForm = false;	
    		}
    		if (!checkMembership("Confirm-Password")){
    			validateForm = false;	
    		}
    		if (!validateMobile('inputMobileNo','mobileNoInvalid')){
    			validateForm = false;	
    		}    		
    		if (!validateEmail('inputEmailId','emailid')){
    			validateForm = false;	
    		}

    		var applicantDob = $("#applicantDob").val();
    		if (applicantDob.trim() == "") {
    			
    			document.getElementById("dobInvalid").innerHTML = getBundle(getBundleLanguage, "applicant.dob.notNull.message");
    	        validateForm = false;	
    	    
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
   	                    url : '<%=request.getContextPath()%>/joinus',
   	                    data : { optIn1: optIn1, optIn2: optIn2, password: password, mobile: mobile, name: name, userName: userName, email: email, ajax: "true" },
   	                    async : false,
   	                    success : function(data) {
   	                        
   	                        if (data == 'success') {                
   	                             $(".error-hide").css("display", "none");
   	                             $(".membership-wrap").css("display", "none"); 
   	                             document.getElementById("Username").value = "";
   	                             document.getElementById("Password").value = "";
   	                             document.getElementById("Confirm-Password").value = "";
   	                             
   	                             $("#link-error").click();
   	                          perventRedirect=false;
   	                             $('#freeFlightForm').submit()
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
    		}else{
    			checkMembership("Username");
    		}
    		
    		if (password == ""){
    			$('#PasswordError').text(isValidPassword($("#Password").val().trim()));
    		}else{
    			checkMembership("Password");
    		}
    		
    		
    		if (password2 == ""){
    			$('#Confirm-PasswordError').text(passMatch($('#Password').val(), $("#Confirm-Password").val().trim()));
    		}else{
    			checkMembership("Confirm-Password");
    		}
    		
    		
    	}
    	
    }
    
       return;
       
}
</script>

<% }else{%>
<script>
function activateUserAccountJoinUs() {
	perventRedirect=false;
	$('#freeFlightForm').submit();
}

</script>
<% } %> 





<!--/#main-Content-->
<section>
    <div id="cn" class="container">
        <div class="row">
            <%-- <form:form name="freeFlight" method="post"
action="flight-confirmation" onsubmit="return fPlanValid();"> --%>
            <form:form name="freeFlightForm" id="freeFlightForm"
                modelAttribute="createFlightPolicy" method="post"
                onsubmit="return createFlightFnc(this);">
                <ol class="breadcrumb pad-none">
                    <li><a href="#"><fmt:message
                                key="flight.breadcrumb1.item1" bundle="${msg}" /></a> <i
                        class="fa fa-caret-right"></i></li>
                    <li><a href="#"><fmt:message
                                key="flight.breadcrumb1.item2" bundle="${msg}" /></a> <i
                        class="fa fa-caret-right"></i></li>
                    <li><a href="#"><fmt:message
                                key="flight.breadcrumb1.item3" bundle="${msg}" /></a></li>
                    <li class="active "><i class="fa fa-caret-right"></i>
                    <fmt:message key="flight.breadcrumb1.item4" bundle="${msg}" /></li>
                </ol>
                <input type="hidden" name="planSelected"
                    value="${planDetailsForm.getPlanSelected()}">
                <div class="container ">
                    <div id="tr-steps"
                        class="col-md-12 col-lg-12 col-sm-12 col-xs-12 shop-tracking-status">
                        <div class="center wow fadeInDown animated"
                            style="visibility: visible;">
                            <h2>
                                <fmt:message key="flight.details.jumbo" bundle="${msg}" />
                            </h2>
                        </div>
                        <br>
                        <div class="order-status">
                            <div class="order-status-timeline-new">
                                <!-- class names: c0 c1 c2 c3 and c4 -->
                                <div class="order-status-timeline-completion dots-active"></div>
                                <div class="order-status-timeline-completion dots-inactive"></div>

                            </div>
                            <div
                                class="image-order-status image-order-status-new  img-circle">
                                <div class="icon">1</div>
                                <span class="status status-working"><fmt:message
                                        key="flight.breadcrumb2.item1" bundle="${msg}" /></span>
                            </div>
                            <div
                                class="image-order-status image-order-status-active active img-circle">
                                <div class="icon">2</div>
                                <span class="status"><fmt:message
                                        key="flight.breadcrumb2.item2" bundle="${msg}" /></span>
                            </div>
                            <div
                                class="image-order-status image-order-status-intransit disabled  img-circle">
                                <div class="icon">3</div>
                                <span class="status min-left"><fmt:message
                                        key="flight.breadcrumb2.item3" bundle="${msg}" /></span>
                            </div>
                        </div>
                    </div>
                </div>
                <%-- <div class="container pad-none bdr ur-opt-content gray-bg3">
<c:if test="${ not empty errorMessage}">
<div class="alert alert-danger" role="alert">
<P>${errorMessage}</P>
</div>
</c:if>
<div --%>
                <div id="quote-wrap" class="container pad-none bdr ur-opt-content gray-bg3">
                    <div class="alert alert-danger hide" role="alert"
                        id="errorMessages"></div>
                    <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 pad-none white-bg1">
                        <br>
                        <div class="form-wrap">
                        <%
                            if (authenticate.equals("false")
                                        || authenticate.equals("direct")) {
                        %>
                        <h3 class="h2-3-existing-fwd-head bmg-detail-exist-member-head"><fmt:message key="flight.details.login" bundle="${msg}" /></h3>
                        <a href="#" class="col-lg-3 col-md-3 col-sm-3 col-xs-3 btn-box-2 color4 login-btn" data-toggle="modal" data-target="#loginpopup"><fmt:message key="flight.details.login.action" bundle="${msg}" /></a>
                        <div class="col-lg-9 col-md-9 col-sm-9 col-xs-9 text-left">
                            <h3 class="text-left or-continue">
                                <fmt:message key="flight.details.login.other.part1" bundle="${msg}" /> </span>
                                <fmt:message key="flight.details.login.other.part2" bundle="${msg}" />
                            </h3>
                        </div>
                        <%
                            }
                        %>
                        </div>
                        
                        <div class="clearfix"></div>
                        <br>
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
	                               <label for="inputFullName" class="bold-500 field-label">
	                                   <fmt:message key="flight.details.applicant.name" bundle="${msg}" />
	                               </label>
	                           </div>
	                           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
	                               <input type="text"
	                                   value="${userDetails.getFullName().trim()}" class="form-control full-control"
	                                   id="inputFullName" name="fullName"
	                                   onblur="replaceAlpha(this); validateName('inputFullName','fullnameinvalid',true,'applicant');"
	                                   onkeypress="return alphaOnly(event);" maxlength="100" /> 
	                                   <span id="fullnameinvalid" class="text-red"></span>
	                           </div>
	                       </div>
	                       <!-- english name end -->
	                       <!-- id card starts -->
	                       <div class="form-group float">
	                           <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
	                               <label for="inputFullName" class="bold-500 field-label">
	                                   <fmt:message key="flight.details.applicant.hkid" bundle="${msg}" />
	                               </label>
	                           </div>
	                           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
	                                <input type="text" name="hkid" class="form-control numberinput textUpper full-control bmg_custom_placeholder"                                     id="inputTxtAppHkid"
	                                        onkeyup="value=value.replace(/[\W]/g,'')" 
	                                        value="<fmt:message key="flight.details.applicant.hkid.placeholder" bundle="${msg}" />"
	                                         onfocus="placeholderOnFocus(this,'<fmt:message key="flight.details.applicant.hkid.placeholder" bundle="${msg}" />');" 
	                                         onblur="placeholderOnBlur(this,'<fmt:message key="flight.details.applicant.hkid.placeholder" bundle="${msg}" />'); validateHkid('inputTxtAppHkid','selectHkidPass','errAppHkid',true,'applicant');"/>
	                                 <span id="errAppHkid" class="text-red"> </span>
	                           </div>
	                       </div>
	                       <!-- id card ends -->
	                       <!-- birthday starts -->
	                       <div class="form-group float">
                               <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                   <label for="inputFullName" class="field-label bold-500">
                                       <fmt:message key="flight.details.applicant.birthday" bundle="${msg}" />
                                   </label>
                               </div>
                               <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                    <div class="input-group date" id="input_dob"> <span class="input-group-addon in border-radius"><img src="<%=request.getContextPath()%>/resources/images/calendar.png" alt=""></span>
					                    <input name="applicantDob" type="text" class="pointer datepicker form-control border-radius" id="applicantDob" value="${corrTravelQuote.getTrLeavingDate()}" readonly>
					                </div>
					                <span id="dobInvalid" class="text-red"></span>
                               </div>
                           </div>
	                       <!-- birthday ends -->
	                       <!-- mobile starts -->
	                       <div class="form-group float">
                               <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                   <label for="inputFullName" class="field-label bold-500">
                                       <fmt:message key="flight.details.applicant.mobile" bundle="${msg}" />
                                   </label>
                               </div>
                               <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                    <input type="text"
						                value="${userDetails.getMobileNo().trim()}" class="form-control full-control"
						                name="mobileNo" id="inputMobileNo"
						                onkeypress="return isNumeric(event)"
						                onblur="replaceNumeric(this); validateMobile('inputMobileNo','mobileNoInvalid');" maxlength="8" /> 
						            <span id="mobileNoInvalid" class="text-red"></span>
                               </div>
                           </div>
	                       <!-- mobile ends -->
	                       <!-- email address starts -->
	                       <div class="form-group float">
                               <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                   <label for="inputFullName" class="field-label bold-500">
                                       <fmt:message key="flight.details.applicant.email" bundle="${msg}" />
                                   </label>
                               </div>
                               <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                   <input class="form-control full-control"
					                value="${userDetails.getEmailAddress().trim()}" name="emailAddress"
					                id="inputEmailId"
					                maxlength="50" onblur="validateEmail('inputEmailId','emailid');" /> 
					                <span id="emailid" class="text-red"></span>
                               </div>
                           </div>
	                       <!-- email address ends -->
                       </div>
                       <!-- updated responsive design end -->
                        <%-- <table class="table activation-form margin-left-2 vert-middle">
                            <tbody>
                                <tr>
                                    <td colspan="2"><h3 class="black-bold">
                                            <fmt:message key="flight.details.applicant.heading"
                                                bundle="${msg}" />
                                        </h3></td>
                                </tr>
                                <tr>


                                    <td valign="middle" class="col-lg-5 col-md-5 col-sm-5 col-xs-5"><label
                                        for="inputFullName" class="bold-500"><fmt:message
                                                key="flight.details.applicant.name" bundle="${msg}" /></label></td>
                                    <td class=""><input type="text"
                                        value="${userDetails.getFullName().trim()}" class="form-control full-control"
                                        id="inputFullName" name="fullName"
                                        placeholder="<fmt:message key="flight.details.applicant.name.placeholder" bundle="${msg}" />"
                                        onblur="replaceAlpha(this); validateName('inputFullName','fullnameinvalid',true,'applicant');"
                                        onkeypress="return alphaOnly(event);" maxlength="100" /> <span
                                        id="fullnameinvalid" class="text-red"></span></td>
                                </tr>
                                <tr>
                                    <td valign="middle" class="">
                                    
                                        <label for="inputEmail3"
                                        class="bold-500"><fmt:message
                                                key="flight.details.applicant.hkid" bundle="${msg}" /></label>
                                    
                                        <div class="styled-select custom-select-label">
	                                        <select id="selectHkidPass"
	                                            name="selectedHkidPassApplicant" onchange="selected(this)"
	                                            class="soflow select-label">
	                                            <option value="HKID" selected="selected"><fmt:message key="travel.details.insured.beneficiary.hkid.option1" bundle="${msg}" /></option>
                                                <option value="passport"><fmt:message key="travel.details.insured.beneficiary.hkid.option2" bundle="${msg}" /></option>
	                                        </select>
	                                    </div>
                                    </td>
                                    <td class=""><input type="text" name="hkid"
                                        class="form-control numberinput textUpper full-control"
                                        id="inputTxtAppHkid"
                                        placeholder="<fmt:message key="flight.details.applicant.hkid.placeholder" bundle="${msg}" />" onkeyup="value=value.replace(/[\W]/g,'')" onblur="validateHkid('inputTxtAppHkid','selectHkidPass','errAppHkid',true,'applicant');"/>
                                        <span id="errAppHkid" class="text-red"> </span></td>
                                </tr>
                                <!-- Birthday starts -->
                                <tr>
                                    <td valign="middle"><label for="inputApplicantDob"
                                        class="bold-500"><fmt:message key="flight.details.applicant.birthday" bundle="${msg}" /></label></td>
                                    <td>
                                        <div class="input-group date" id="input_dob"> <span class="input-group-addon in border-radius"><img src="<%=request.getContextPath()%>/resources/images/calendar.png" alt=""></span>
                                            <input name="applicantDob" type="text" class="pointer datepicker form-control border-radius" id="applicantDob" value="${corrTravelQuote.getTrLeavingDate()}" readonly>
                                        </div>
                                        <span id="dobInvalid" class="text-red"></span>
                                    </td>
                                </tr>
                                <!-- Birthday ends -->
                                <tr>
                                    <td valign="middle" class=""><label for="inputMobileNo"
                                        class="bold-500"><fmt:message
                                                key="flight.details.applicant.mobile" bundle="${msg}" /></label></td>
                                    <td class=""><input type="text"
                                        value="${userDetails.getMobileNo().trim()}" class="form-control full-control"
                                        name="mobileNo" id="inputMobileNo"
                                        placeholder="<fmt:message key="flight.details.applicant.mobile.placeholder" bundle="${msg}" />"
                                        onkeypress="return isNumeric(event)"
                                        onblur="replaceNumeric(this); validateMobile('inputMobileNo','mobileNoInvalid');" maxlength="8" /> <span
                                        id="mobileNoInvalid" class="text-red"></span></td>
                                </tr>
                                <tr>
                                    <td valign="middle" class=""><label for="inputEmailId"
                                        class="bold-500"><fmt:message
                                                key="flight.details.applicant.email" bundle="${msg}" /></label></td>
                                    <td class=""><input class="form-control full-control"
                                        value="${userDetails.getEmailAddress().trim()}" name="emailAddress"
                                        id="inputEmailId"
                                        placeholder="<fmt:message key="flight.details.applicant.email.placeholder" bundle="${msg}" />"
                                        maxlength="50" onblur="validateEmail('inputEmailId','emailid');" /> <span id="emailid" class="text-red"></span></td>
                                </tr>
                            </tbody>
                        </table> --%>
                        <%
                            if (authenticate.equals("false")
                                        || authenticate.equals("direct")) {
                        %>
                        <div class="gray-bg3-wid container membership-wrap" style="padding-top: 20px;padding-left:0px;padding-right:0px;">
                            <div class="form-wrap">
                            <div class="membership-header">
                                <h3 class="bmg-membership-header"><fmt:message key="flight.details.registration.heading" bundle="${msg}" /></h3>
	                            <i class="text-grey"><fmt:message key="flight.details.registration.desc" bundle="${msg}" /></i>
                                <h3 class="error-hide" style='display:none; color:red; font-size:15px;'></h3>
                            </div>
                            <div class="form-group float row">
							   <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12">
							       <label for="inputFullName" class="field-label bold-500">
							           <fmt:message key="flight.details.registration.username" bundle="${msg}" />
							       </label>
							   </div>
							   <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12">
							       <input type="text" name="userName" class="form-control full-control input-white" id="Username" onfocus="emptyMembershipError();">
							       <span id="UsernameError" class="text-red"></span>
							   </div>
							</div>
							<div class="form-group float row">
                               <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12">
                                   <label for="inputEmail3" class="field-label bold-500">
                                        <fmt:message key="flight.details.registration.password" bundle="${msg}" />
                                   </label>
                               </div>
                               <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12">
                                   <input type="password"
                                            class="form-control full-control input-white" name="password" id="Password"
                                            autocomplete="off"
                                            onfocus="emptyMembershipError();">
                                            
                                            <span id="PasswordError" class="text-red"></span>
                               </div>
                            </div>
                            <div class="form-group float row">
                               <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12">
                                   <label for="inputEmail3" class="field-label bold-500">
                                        <fmt:message
                                         key="flight.details.registration.confirmPassword"
                                         bundle="${msg}" />
                                   </label>
                               </div>
                               <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12">
                                   <input type="password"
                                            class="form-control full-control input-white" name="password"
                                            id="Confirm-Password" autocomplete="off"
                                            onfocus="emptyMembershipError();">
                                            <span id="Confirm-PasswordError" class="text-red"></span>
                               </div>
                            </div>
                            </div>
                        </div>
<%--                         <div class="gray-bg3-wid">
                            <table class="table plandetail-form margin-left-2 vert-middle"
                                id="input-white">
                                <tbody>
                                    <tr>
                                        <td colspan="2" class=""><h3 class="">
                                                <fmt:message key="flight.details.registration.heading"
                                                    bundle="${msg}" />
                                            </h3> <i><fmt:message key="flight.details.registration.desc"
                                                    bundle="${msg}" /></i> <br></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" class="">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td valign="middle" class="col-lg-5 col-md-5 col-sm-5 col-xs-5"><label for="inputEmail3"
                                            class="bold-500"><fmt:message
                                                    key="flight.details.registration.username" bundle="${msg}" /></label></td>
                                        <td class=""><input type="text" name="userName"
                                            class="form-control full-control"
                                            placeholder="<fmt:message key="flight.details.registration.username.placeholder" bundle="${msg}" />"
                                            id="Username"> <span id="UsernameError"
                                            class="text-red"></span></td>
                                    </tr>
                                    <tr>
                                        <td valign="middle" class=""><label for="inputEmail3"
                                            class="bold-500"><fmt:message
                                                    key="flight.details.registration.password" bundle="${msg}" /></label></td>
                                        <td class=""><input type="password"
                                            class="form-control full-control" name="password" id="Password"
                                            autocomplete="off"
                                            placeholder="<fmt:message key="flight.details.registration.password.placeholder" bundle="${msg}" />">
                                            <span id="PasswordError" class="text-red"></span></td>
                                    </tr>
                                    <tr>
                                        <td valign="middle" class=""><label for="inputEmail3"
                                            class="bold-500"><fmt:message
                                                    key="flight.details.registration.confirmPassword"
                                                    bundle="${msg}" /></label></td>
                                        <td class=""><input type="password"
                                            class="form-control full-control" name="password"
                                            id="Confirm-Password" autocomplete="off"
                                            placeholder="<fmt:message key="flight.details.registration.confirmPassword.placeholder" bundle="${msg}" />">
                                            <span id="Confirm-PasswordError" class="text-red"></span></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div> --%>
                        <input type="hidden" id="isLogin" value="false">
                        <%
                            } else {
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
                        <!-- <h3 class="black-bold pad-none margin-left-28">
                            <fmt:message key="flight.details.insured.heading" bundle="${msg}" />
                            <br>
                        </h3> -->
                        <!-- Bellow fields are dynamically generated -->
                        <!--<c:set var="totalAdultCount" value="${0}" />
                        <c:set var="totalAdultCount"
                            value="${planDetailsForm.travellerCount + planDetailsForm.totalAdultTraveller}" />-->

                        <!-- Dynamic Loops -->
                        <!-- <div class="col-xs-12 col-sm-12 col-md-12 pad-none insure-travel"> -->
                            <!-- Personal -->
                            
                            <input type="hidden" name="totalPersonalTraveller"
                                id="totalPersonalTraveller" value="${planDetailsForm.getTotalPersonalTraveller()}">
                            <c:forEach var="inx" begin="1" end="${planDetailsForm.getTotalPersonalTraveller()}">
                                <div class="form-wrap">
                                <div class="personaltraveller">
                                    <h4 class="bold big-title" style="padding-left:0px !important;">
                                       <fmt:message key="flight.details.insured.label.personal"
                                           bundle="${msg}" />
                                       <c:out value="${inx}"></c:out>
                                    </h4>
                                    <div>
                                       <!-- english name start -->
			                           <div class="form-group float">
			                               <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
			                                   <label for="inputFullName" class="field-label bold-500">
			                                       <fmt:message key="flight.details.insured.name" bundle="${msg}" />
			                                   </label>
			                               </div>
			                               <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
			                                   <c:if test="${inx == 1}">
                                                        <input
                                                        type="text" name="personalName" id="txtInsuFullName${inx}"
                                                        value="${userDetails.getFullName().trim()}" class="form-control full-control"
                                                        onblur="replaceAlpha(this); validateName('txtInsuFullName${inx}','errtxtPersonalFullName${inx}',false,'insured');"
                                                        onkeypress="    return alphaOnly(event);" maxlength="100" />
                                                            </c:if>
                                                            <c:if test="${inx > 1}">
                                                                <input
                                                        type="text" name="personalName" id="txtInsuFullName${inx}"
                                                        value="" class="form-control full-control"
                                                        onblur="replaceAlpha(this); validateName('txtInsuFullName${inx}','errtxtPersonalFullName${inx}',false,'insured');"
                                                        onkeypress="    return alphaOnly(event);" maxlength="100" />
                                                    </c:if>
                                                    <span id="errtxtPersonalFullName${inx}" class="text-red"> </span>
			                               </div>
			                           </div>
			                           <!-- english name end -->
			                           <!-- id card start -->
                                       <div class="form-group float">
                                           <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                               <label class="field-label bold-500">
                                                   <fmt:message key="flight.details.applicant.hkid" bundle="${msg}" />
                                               </label>
                                           </div>
                                           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                               <input
                                                    id="txtInsuHkid${inx}" name="personalHKID"
                                                    class="form-control textUpper full-control bmg_custom_placeholder"
                                                     onfocus="placeholderOnFocus(this,'<fmt:message key="flight.details.insured.hkid.placeholder" bundle="${msg}" />');" 
                                                     onblur="placeholderOnBlur(this,'<fmt:message key="flight.details.insured.hkid.placeholder" bundle="${msg}" />'); validateHkid('txtInsuHkid${inx}','selectedPersonalHkidPass${inx}','errtxtInsuHkid${inx}',false,'insured');"
                                                    value="<fmt:message key="flight.details.insured.hkid.placeholder" bundle="${msg}" />" onkeyup="hkidValid(this)"/>
                                                    <span id="errtxtInsuHkid${inx}"
                                                    class="text-red"> </span>
                                           </div>
                                       </div>
                                       <!-- id card end -->
                                       <!-- age start -->
                                       <div class="form-group float">
                                           <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                               <label class="field-label bold-500"><fmt:message
                                                    key="flight.details.insured.age" bundle="${msg}" /></label>
                                           </div>
                                           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                               <div class="styled-select"><select
                                                        name="personalAgeRange" class="soflow select-label"
                                                        id="selectAgeRange${inx}">
                                                        <c:forEach var="ageList" items="${mapSelfType}">
                                                            <c:choose>
                                                                <c:when test="${ageList.key == '2'}">
                                                                    <option value="${ageList.key}" selected>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <option value="${ageList.key}">
                                                                </c:otherwise>
                                                            </c:choose>
                                                            <c:out value="${ageList.value}" />
                                                            </option>
                                                        </c:forEach>
                                                    </select></div><span id="errselectAgeRange${inx}" class="text-red">
                                                    </span>
                                           </div>
                                       </div>
                                       <!-- age end -->
                                       <!-- beneficiary start -->
                                       <div class="form-group float">
                                           <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                               <label class="field-label bold-500"><fmt:message
                                                    key="flight.details.insured.beneficiary" bundle="${msg}" /></label>
                                           </div>
                                           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                               <div class="styled-select">
                                                <select name="personalBeneficiary" class="soflow select-label" id="personalselectBenificiary${inx}" onChange="activeDiv('personalbenificiaryId${inx}','personalselectBenificiary${inx}', 'personalBenefitiaryId${inx}', 'personalBenefitiaryHKId${inx}')">
	                                                <c:forEach var="relationshipList" items="${mapRelationshipCode}">
                                                       <option value="${relationshipList.key}"><c:out value="${relationshipList.value}" /></option>
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
		                                              <fmt:message key="flight.details.insured.beneficiary.name" bundle="${msg}" />
	                                                </label>
		                                       </div>
		                                       <div class="col-lg-7 col-md-7 col-sm-7 col-xs-7 pad-none">
		                                           <input type="text"
                                                        name="personalBenificiaryFullName"
                                                        id="personalBenefitiaryId${inx}" value="" class="form-control full-control"
                                                        onblur="replaceAlpha(this); validateName('personalBenefitiaryId${inx}','errpersonalBenefitiaryId${inx}',false,'beneficiary');"
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
		                                            <fmt:message key="flight.details.insured.beneficiary.type" bundle="${msg}" />
		                                            </label>
		                                       </div>
		                                       <div class="col-lg-7 col-md-7 col-sm-7 col-xs-7 pad-none">
		                                          <div class="styled-select">
                                                    <select id="selectPersonalBenefitiaryHkidPass${inx}" class="form-control soflow select-label" name="selectedPersonalBenefitiaryHkidPass">
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
		                                          <input id="personalBenefitiaryHKId${inx}"
                                                    name="personalBenificiaryHkid" class="form-control textUpper full-control bmg_custom_placeholder"
                                                    value="<fmt:message key="flight.details.insured.beneficiary.hkid.placeholder" bundle="${msg}" />" onkeyup="hkidValid(this)" 
                                                    onfocus="placeholderOnFocus(this,'<fmt:message key="flight.details.insured.beneficiary.hkid.placeholder" bundle="${msg}" />');"
                                                    onblur="placeholderOnBlur(this,'<fmt:message key="flight.details.insured.beneficiary.hkid.placeholder" bundle="${msg}" />'); validateHkid('personalBenefitiaryHKId${inx}','selectPersonalBenefitiaryHkidPass${inx}','errpersonalBenefitiaryHKId${inx}',false,'beneficiary');"/> <span id="errpersonalBenefitiaryHKId${inx}"
                                                    class="text-red"> </span>
		                                       </div>
		                                   </div>
		                               </div>
		                               <!-- personalbenificiaryId c end -->
                                       
                                       
                                       
                                       
                                       
                                       
                                    </div>
                                    <%-- <table class="table activation-form margin-left-2 vert-middle">
                                        <tbody>
                                            <tr>
                                                <td valign="middle" class="col-lg-5 col-md-5 col-sm-5 col-xs-5">
                                                     <label class="bold-500"><fmt:message
                                                    key="flight.details.insured.name" bundle="${msg}" /></label>
                                                </td>
                                                <td class="">
                                                     <c:if test="${inx == 1}">
                                                        <input
                                                        type="text" name="personalName" id="txtInsuFullName${inx}"
                                                        value="${userDetails.getFullName().trim()}" class="form-control full-control"
                                                        placeholder="<fmt:message key="flight.details.insured.name.placeholder" bundle="${msg}" />"
                                                        onblur="replaceAlpha(this); validateName('txtInsuFullName${inx}','errtxtPersonalFullName${inx}',false,'insured');"
                                                        onkeypress="    return alphaOnly(event);" maxlength="100" />
                                                            </c:if>
                                                            <c:if test="${inx > 1}">
                                                                <input
                                                        type="text" name="personalName" id="txtInsuFullName${inx}"
                                                        value="" class="form-control full-control"
                                                        placeholder="<fmt:message key="flight.details.insured.name.placeholder" bundle="${msg}" />"
                                                        onblur="replaceAlpha(this); validateName('txtInsuFullName${inx}','errtxtPersonalFullName${inx}',false,'insured');"
                                                        onkeypress="    return alphaOnly(event);" maxlength="100" />
                                                    </c:if>
                                                    <span id="errtxtPersonalFullName${inx}" class="text-red"> </span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="middle" class="">
                                                    <label class="bold-500"><fmt:message
                                                            key="flight.details.applicant.hkid"
                                                            bundle="${msg}" /></label>
                                                    <!-- <div class="styled-select custom-select-label">
                                                        <select id="selectedPersonalHkidPass${inx}" class="form-control soflow select-label" name="selectedPersonalHkidPass">
                                                            <option value="HKID" selected="selected"><fmt:message key="travel.details.insured.beneficiary.hkid.option1" bundle="${msg}" /></option>
                                                            <option value="passport"><fmt:message key="travel.details.insured.beneficiary.hkid.option2" bundle="${msg}" /></option>
                                                        </select>
                                                    </div>-->
	                                            </td>
	                                            <td class="">
                                                         <input
                                                    id="txtInsuHkid${inx}" name="personalHKID"
                                                    class="form-control textUpper full-control"
                                                    placeholder="<fmt:message key="flight.details.insured.hkid.placeholder" bundle="${msg}" />"
                                                    value="" onkeyup="hkidValid(this)" onblur="validateHkid('txtInsuHkid${inx}','selectedPersonalHkidPass${inx}','errtxtInvalidInsuHkid${inx}',false,'insured');"/> <span id="errtxtInsuHkid${inx}"
                                                    class="text-red"> </span> <span
                                                    id="errtxtInvalidInsuHkid${inx}" class="text-red"> </span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="middle" class="">
                                                     <label class="bold-500"><fmt:message
                                                    key="flight.details.insured.age" bundle="${msg}" /></label>
                                                </td>
                                                <td class="">
                                                     <div class="styled-select"><select
                                                        name="personalAgeRange" class="soflow select-label"
                                                        id="selectAgeRange${inx}">
                                                        <c:forEach var="ageList" items="${mapSelfType}">
                                                            <c:choose>
                                                                <c:when test="${ageList.key == '2'}">
                                                                    <option value="${ageList.key}" selected>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <option value="${ageList.key}">
                                                                </c:otherwise>
                                                            </c:choose>
                                                            <c:out value="${ageList.value}" />
                                                            </option>
                                                        </c:forEach>
                                                    </select></div><span id="errselectAgeRange${inx}" class="text-red">
                                                    </span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="middle" class="">
                                                     <label class="bold-500"><fmt:message
                                                    key="flight.details.insured.beneficiary" bundle="${msg}" /></label>
                                                </td>
                                                <td class="">
                                                     <div class="styled-select"><select name="personalBeneficiary" class="soflow select-label"
                                                        id="personalselectBenificiary${inx}"
                                                        onChange="activeDiv('personalbenificiaryId${inx}','personalselectBenificiary${inx}')">
                                                        <option value="SE"><fmt:message
                                                                key="flight.details.insured.beneficiary.default"
                                                                bundle="${msg}" /></option>
                                                        <c:forEach var="relationshipList"
                                                            items="${mapRelationshipCode}">
                                                            <option value="${relationshipList.key}"><c:out
                                                                    value="${relationshipList.value}" /></option>
                                                        </c:forEach>
                                                    </select></div> <span id="errpersonalselectBenificiary${inx}" class="text-red"></span>
                                                </td>
                                            </tr>
                                            <tr id="personalbenificiaryId${inx}" class="hide">
                                                <td valign="middle" class="">
                                                     <label class="bold-500"><fmt:message
                                                key="flight.details.insured.beneficiary.name"
                                                bundle="${msg}" /></label>
                                                </td>
                                                <td class="">
                                                      <input type="text"
                                                        name="personalBenificiaryFullName"
                                                        id="personalBenefitiaryId${inx}" value="" class="form-control full-control"
                                                        placeholder="<fmt:message key="flight.details.insured.beneficiary.name.placeholder" bundle="${msg}" />"
                                                        onblur="replaceAlpha(this); validateName('personalBenefitiaryId${inx}','errpersonalBenefitiaryId${inx}',false,'beneficiary');"
                                                        onkeypress="    return alphaOnly(event);" maxlength="100" />
                                                    <span id="errpersonalBenefitiaryId${inx}" class="text-red"> </span>
                                                </td>
                                            </tr>
                                            <tr id="personalbenificiaryId${inx}b" class="hide">
                                                <td valign="middle" class="">
                                                     <label class="pad-left1 bold-500"><fmt:message
                                                            key="flight.details.insured.beneficiary.hkid"
                                                            bundle="${msg}" /></label>
                                                    <div class="styled-select custom-select-label">
                                                    <select id="selectPersonalBenefitiaryHkidPass${inx}" class="form-control soflow select-label" name="selectedPersonalBenefitiaryHkidPass">
                                                        <option value="HKID" selected="selected"><fmt:message key="travel.details.insured.beneficiary.hkid.option1" bundle="${msg}" /></option>
                                                        <option value="passport"><fmt:message key="travel.details.insured.beneficiary.hkid.option2" bundle="${msg}" /></option>
                                                    </select>
                                                    </div>
                                                </td>
                                                <td class="">
                                                      <input id="personalBenefitiaryHKId${inx}"
                                                    name="personalBenificiaryHkid" class="form-control textUpper full-control"
                                                    placeholder="<fmt:message key="flight.details.insured.beneficiary.hkid.placeholder" bundle="${msg}" />"
                                                    value="" onkeyup="hkidValid(this)" onblur="validateHkid('personalBenefitiaryHKId${inx}','selectPersonalBenefitiaryHkidPass${inx}','errpersonalBenefitiaryHKId${inx}',false,'beneficiary');"/> <span id="errpersonalBenefitiaryHKId${inx}"
                                                    class="text-red"> </span>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table> --%>
                                    <input id="personalBenefitiaryRelation${inx}" type="hidden"
                                                name="personalBenificiaryRelationship" class="form-control"
                                                value="" />
                                </div>
                                </div>
                            </c:forEach>
                            
                            <!-- adult  -->
                        
                            <input type="hidden" name="totalAdultTraveller"
                                id="totalAdultTraveler" value="${planDetailsForm.getTotalAdultTraveller()}">
                            <c:forEach var="inx" begin="1" end="${planDetailsForm.getTotalAdultTraveller()}">
                                <div class="form-wrap">
                                <div class="adulttraveller">
                                    <h4 class="bold big-title" style="padding-left:0px !important;">
                                        <fmt:message
                                            key="flight.details.insured.label.family.parent"
                                            bundle="${msg}" />
                                        <c:out value="${inx}"></c:out>
                                    </h4>
                                    <div>
                                        <!-- english name start -->
                                       <div class="form-group float">
                                           <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                               <label class="field-label bold-500"><fmt:message
                                                    key="flight.details.insured.name" bundle="${msg}" /></label>
                                           </div>
                                           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                               <c:if test="${inx == 1}">
                                                        <input
                                                        type="text" name="adultName" id="txtInsuFullName${inx}"
                                                        value="${userDetails.getFullName().trim()}" class="form-control full-control"
                                                        onblur="replaceAlpha(this); validateName('txtInsuFullName${inx}','errtxtAdFullName${inx}',false,'insured');"
                                                        onkeypress="    return alphaOnly(event);" maxlength="100" />
                                                            </c:if>
                                                            <c:if test="${inx > 1}">
                                                                <input
                                                        type="text" name="adultName" id="txtInsuFullName${inx}"
                                                        value="" class="form-control full-control"
                                                        onblur="replaceAlpha(this); validateName('txtInsuFullName${inx}','errtxtAdFullName${inx}',false,'insured');"
                                                        onkeypress="    return alphaOnly(event);" maxlength="100" />
                                                    </c:if>
                                                    <span id="errtxtAdFullName${inx}" class="text-red"> </span>
                                           </div>
                                       </div>
                                       <!-- english name end -->
                                       <!-- id card start -->
                                       <div class="form-group float">
                                           <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                               <label class="field-label bold-500"><fmt:message
                                                            key="flight.details.applicant.hkid"
                                                            bundle="${msg}" /></label>
                                           </div>
                                           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                               <input
                                                    id="txtInsuHkid${inx}" name="adultHKID"
                                                    class="form-control textUpper full-control bmg_custom_placeholder"
                                                    onfocus="placeholderOnFocus(this,'<fmt:message key="flight.details.insured.hkid.placeholder" bundle="${msg}" />');"
													onblur="placeholderOnBlur(this,'<fmt:message key="flight.details.insured.hkid.placeholder" bundle="${msg}" />'); validateHkid('txtInsuHkid${inx}','selectedAdultHkidPass${inx}','errtxtInsuHkid${inx}',false,'insured');"
                                                    value="<fmt:message key="flight.details.insured.hkid.placeholder" bundle="${msg}" />" onkeyup="value=value.replace(/[\W]/g,'')"/> <span id="errtxtInsuHkid${inx}"
                                                    class="text-red"> </span>
                                           </div>
                                       </div>
                                       <!-- id card end -->
                                       <!-- age start -->
                                       <div class="form-group float">
                                           <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                               <label class="field-label bold-500"><fmt:message
                                                    key="flight.details.insured.age" bundle="${msg}" /></label>
                                           </div>
                                           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                               <div class="styled-select"><select
                                                        name="adultAgeRange" class="soflow select-label"
                                                        id="selectAgeRange${inx}">
                                                        <c:forEach var="ageList" items="${mapSelfType}">
                                                            <c:choose>
                                                                <c:when test="${ageList.key == '2'}">
                                                                    <option value="${ageList.key}" selected>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <option value="${ageList.key}">
                                                                </c:otherwise>
                                                            </c:choose>
                                                            <c:out value="${ageList.value}" />
                                                            </option>
                                                        </c:forEach>
                                                    </select></div>
                                                    <span id="errselectAgeRange${inx}" class="text-red"></span>
                                           </div>
                                       </div>
                                       <!-- age end -->
                                       <!-- beneficiary start -->
                                       <div class="form-group float">
                                           <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                               <label class="field-label bold-500"><fmt:message
                                                    key="flight.details.insured.beneficiary" bundle="${msg}" /></label>
                                           </div>
                                           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                               <div class="styled-select">
                                               <select name="adultBeneficiary" class="soflow select-label" id="adultsselectBenificiary${inx}" onChange="activeDiv('adultsbenificiaryId${inx}','adultsselectBenificiary${inx}', 'adultBenefitiaryId${inx}', 'adultBenefitiaryHKId${inx}')">
		                                                <c:forEach var="relationshipList" items="${mapRelationshipCode}">
                                                       <option value="${relationshipList.key}"><c:out value="${relationshipList.value}" /></option>
                                                    </c:forEach>
                                               </select></div> <span id="erradultsselectBenificiary${inx}" class="text-red"></span>
                                           </div>
                                       </div>
                                       <!-- beneficiary end -->
                                       
                                       
                                       
                                       
                                       
                                       
                                       
                                       <!-- adult beneficiary start -->
                                       <div class="form-group float hide" id="adultsbenificiaryId${inx}">
                                           <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                               <label class="field-label bold-500"></label>
                                           </div>
                                           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                               <div class="form-label col-lg-5 col-md-5 col-sm-5 col-xs-5 pad-none">                                                    
                                                    <label class="field-label bold-500">
                                                      <fmt:message key="flight.details.insured.beneficiary.name" bundle="${msg}" />
                                                    </label>
                                               </div>
                                               <div class="col-lg-7 col-md-7 col-sm-7 col-xs-7 pad-none">
                                                   <input type="text"
                                                        name="adultBenificiaryFullName"
                                                        id="adultBenefitiaryId${inx}" value="" class="form-control full-control"
                                                        onblur="replaceAlpha(this); validateName('adultBenefitiaryId${inx}','erradultBenefitiaryId${inx}',false,'beneficiary');"
                                                        onkeypress="    return alphaOnly(event);" maxlength="100" />
                                                    <span id="erradultBenefitiaryId${inx}" class="text-red"> </span>
                                               </div>
                                               <div class="clearfix"></div>
                                           </div>
                                       </div>
                                       <!-- adult beneficiary end -->
                                       <!-- adult beneficiary b start -->
                                       <div class="form-group float hide" id="adultsbenificiaryId${inx}b">
                                           <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                              <label class="field-label form-label bold-500"></label>
                                           </div>
                                           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                              <div class="form-label col-lg-5 col-md-5 col-sm-5 col-xs-5 pad-none">
                                                  <label class="field-label form-label bold-500">
                                                    <fmt:message key="flight.details.insured.beneficiary.type" bundle="${msg}" />
                                                    </label>
                                               </div>
                                               <div class="col-lg-7 col-md-7 col-sm-7 col-xs-7 pad-none">
                                                  <div class="styled-select">
                                                    <select id="selectAdBenefitiaryHkidPass${inx}" class="form-control soflow select-label" name="selectedAdBenefitiaryHkidPass">
                                                        <option value="HKID" selected="selected"><fmt:message key="travel.details.insured.beneficiary.hkid.option1" bundle="${msg}" /></option>
                                                        <option value="passport"><fmt:message key="travel.details.insured.beneficiary.hkid.option2" bundle="${msg}" /></option>
                                                    </select>
                                                    </div>
                                               </div>
                                           </div>
                                       </div>
                                       <!-- adult beneficiary b end -->
                                       <!-- adult beneficiary c start -->
                                       <div class="form-group float hide" id="adultsbenificiaryId${inx}c">
                                           <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                              <label class="field-label form-label bold-500 hidden-lg hidden-md"></label>
                                           </div>
                                           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                              <div class="form-label col-lg-5 col-md-5 col-sm-5 col-xs-5 pad-none">
                                                  <label class="field-label form-label bold-500 hidden-lg hidden-md"></label>
                                               </div>
                                               <div class="col-lg-7 col-md-7 col-sm-7 col-xs-7 pad-none">
                                                  <input id="adultBenefitiaryHKId${inx}"
                                                    name="adultBenificiaryHkid" class="form-control textUpper full-control bmg_custom_placeholder"
                                                    value="<fmt:message key="flight.details.insured.beneficiary.hkid.placeholder" bundle="${msg}" />" onkeyup="hkidValid(this)" 
                                                    onfocus="placeholderOnFocus(this,'<fmt:message key="flight.details.insured.beneficiary.hkid.placeholder" bundle="${msg}" />');"
                                                    onblur="placeholderOnBlur(this,'<fmt:message key="flight.details.insured.beneficiary.hkid.placeholder" bundle="${msg}" />'); validateHkid('adultBenefitiaryHKId${inx}','selectAdBenefitiaryHkidPass${inx}','erradultBenefitiaryHKId${inx}',false,'beneficiary');"/> <span id="erradultBenefitiaryHKId${inx}"
                                                    class="text-red"> </span>
                                               </div>
                                           </div>
                                       </div>
                                       <!-- adult beneficiary c end -->
                                       
                                       
                                       
                                       
                                       
                                       
                                       
                                       
                                    </div>
                                    <%-- <table class="table activation-form margin-left-2 vert-middle">
                                        <tbody>
                                            <tr>
                                                <td valign="middle" class="col-lg-5 col-md-5 col-sm-5 col-xs-5">
                                                     <label class="bold-500"><fmt:message
                                                    key="flight.details.insured.name" bundle="${msg}" /></label>
                                                </td>
                                                <td class="">
                                                     <c:if test="${inx == 1}">
                                                        <input
                                                        type="text" name="adultName" id="txtInsuFullName${inx}"
                                                        value="${userDetails.getFullName().trim()}" class="form-control full-control"
                                                        placeholder="<fmt:message key="flight.details.insured.name.placeholder" bundle="${msg}" />"
                                                        onblur="replaceAlpha(this); validateName('txtInsuFullName${inx}','errtxtAdFullName${inx}',false,'insured');"
                                                        onkeypress="    return alphaOnly(event);" maxlength="100" />
                                                            </c:if>
                                                            <c:if test="${inx > 1}">
                                                                <input
                                                        type="text" name="adultName" id="txtInsuFullName${inx}"
                                                        value="" class="form-control full-control"
                                                        placeholder="<fmt:message key="flight.details.insured.name.placeholder" bundle="${msg}" />"
                                                        onblur="replaceAlpha(this); validateName('txtInsuFullName${inx}','errtxtAdFullName${inx}',false,'insured');"
                                                        onkeypress="    return alphaOnly(event);" maxlength="100" />
                                                    </c:if>
                                                    <span id="errtxtAdFullName${inx}" class="text-red"> </span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="middle" class="">
                                                    <label class="bold-500"><fmt:message
                                                            key="flight.details.applicant.hkid"
                                                            bundle="${msg}" /></label>
                                                    <div class="styled-select custom-select-label">
                                                        <select id="selectedAdultHkidPass${inx}" class="form-control soflow select-label" name="selectedAdultHkidPass">
                                                            <option value="HKID" selected="selected"><fmt:message key="travel.details.insured.beneficiary.hkid.option1" bundle="${msg}" /></option>
                                                            <option value="passport"><fmt:message key="travel.details.insured.beneficiary.hkid.option2" bundle="${msg}" /></option>
                                                        </select>
                                                    </div>
		                                        </td>
		                                        <td class="">
                                                         <input
                                                    id="txtInsuHkid${inx}" name="adultHKID"
                                                    class="form-control textUpper full-control"
                                                    placeholder="<fmt:message key="flight.details.insured.hkid.placeholder" bundle="${msg}" />"
                                                    value="" onkeyup="value=value.replace(/[\W]/g,'')" onblur="validateHkid('txtInsuHkid${inx}','selectedAdultHkidPass${inx}','errtxtInvalidInsuHkid${inx}',false,'insured');"/> <span id="errtxtInsuHkid${inx}"
                                                    class="text-red"> </span> <span
                                                    id="errtxtInvalidInsuHkid${inx}" class="text-red"> </span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="middle" class="">
                                                     <label class="bold-500"><fmt:message
                                                    key="flight.details.insured.age" bundle="${msg}" /></label>
                                                </td>
                                                <td class="">
                                                     <div class="styled-select"><select
                                                        name="adultAgeRange" class="soflow select-label"
                                                        id="selectAgeRange${inx}">
                                                        <c:forEach var="ageList" items="${mapSelfType}">
                                                            <c:choose>
                                                                <c:when test="${ageList.key == '2'}">
                                                                    <option value="${ageList.key}" selected>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <option value="${ageList.key}">
                                                                </c:otherwise>
                                                            </c:choose>
                                                            <c:out value="${ageList.value}" />
                                                            </option>
                                                        </c:forEach>
                                                    </select></div><span id="errselectAgeRange${inx}" class="text-red">
                                                    </span>
                                              </td>
                                            </tr>
                                            <tr>
                                                <td valign="middle" class="">
                                                     <label class="bold-500"><fmt:message
                                                    key="flight.details.insured.beneficiary" bundle="${msg}" /></label>
                                                </td>
                                                <td class="">
                                                     <div class="styled-select"><select name="adultBeneficiary" class="soflow select-label"
                                                        id="adultsselectBenificiary${inx}"
                                                        onChange="activeDiv('adultsbenificiaryId${inx}','adultsselectBenificiary${inx}')">
                                                        <option value="SE"><fmt:message
                                                                key="flight.details.insured.beneficiary.default"
                                                                bundle="${msg}" /></option>
                                                        <c:forEach var="relationshipList"
                                                            items="${mapRelationshipCode}">
                                                            <option value="${relationshipList.key}"><c:out
                                                                    value="${relationshipList.value}" /></option>
                                                        </c:forEach>
                                                    </select></div> <span id="erradultsselectBenificiary${inx}" class="text-red"></span>
                                                </td>
                                            </tr>
                                            <tr id="adultsbenificiaryId${inx}" class="hide">
                                                <td valign="middle" class="">
                                                     <label class="bold-500"><fmt:message
                                                key="flight.details.insured.beneficiary.name"
                                                bundle="${msg}" /></label>
                                                </td>
                                                <td class="">
                                                      <input type="text"
                                                        name="adultBenificiaryFullName"
                                                        id="adultBenefitiaryId${inx}" value="" class="form-control full-control"
                                                        placeholder="<fmt:message key="flight.details.insured.beneficiary.name.placeholder" bundle="${msg}" />"
                                                        onblur="replaceAlpha(this); validateName('adultBenefitiaryId${inx}','erradultBenefitiaryId${inx}',false,'beneficiary');"
                                                        onkeypress="    return alphaOnly(event);" maxlength="100" />
                                                    <span id="erradultBenefitiaryId${inx}" class="text-red"> </span>
                                                </td>
                                            </tr>
                                            <tr id="adultsbenificiaryId${inx}b" class="hide">
                                                <td valign="middle" class="">
                                                     <label class="pad-left1 bold-500"><fmt:message
                                                            key="flight.details.insured.beneficiary.hkid"
                                                            bundle="${msg}" /></label>
                                                    <div class="styled-select custom-select-label">
                                                    <select id="selectAdBenefitiaryHkidPass${inx}" class="form-control soflow select-label" name="selectedAdBenefitiaryHkidPass">
                                                        <option value="HKID" selected="selected"><fmt:message key="travel.details.insured.beneficiary.hkid.option1" bundle="${msg}" /></option>
                                                        <option value="passport"><fmt:message key="travel.details.insured.beneficiary.hkid.option2" bundle="${msg}" /></option>
                                                    </select>
                                                    </div>
                                                </td>
                                                <td class="">
                                                      <input id="adultBenefitiaryHKId${inx}"
                                                    name="adultBenificiaryHkid" class="form-control textUpper full-control"
                                                    placeholder="<fmt:message key="flight.details.insured.beneficiary.hkid.placeholder" bundle="${msg}" />"
                                                    value="" onkeyup="hkidValid(this)" onblur="validateHkid('adultBenefitiaryHKId${inx}','selectAdBenefitiaryHkidPass${inx}','erradultBenefitiaryHKId${inx}',false,'beneficiary');"/> <span id="erradultBenefitiaryHKId${inx}"
                                                    class="text-red"> </span>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table> --%>
                                    <input id="adultBenefitiaryRelation${inx}" type="hidden"
                                                name="adultBenificiaryRelationship" class="form-control"
                                                value="" />
                                </div>
                                </div>
                            </c:forEach>

                            <!-- child  -->

                            <input type="hidden" name="totalChildTraveller"
                                value="${planDetailsForm.getTotalChildTraveller()}" id="totalCountOfChild">
                            <c:forEach var="inx" begin="1" end="${planDetailsForm.getTotalChildTraveller()}">
                                <div class="form-wrap">
                                <div class="childtraveller">
                                    <h4 class="bold big-title" style="padding-left:0px !important;">
                                       <fmt:message key="flight.details.insured.label.family.child"
                                            bundle="${msg}" />
                                        <c:out value="${inx}"></c:out>
                                    </h4>
                                    <div>
                                        <!-- english name start -->
                                       <div class="form-group float">
                                           <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                               <label class="field-label bold-500"><fmt:message
                                                    key="flight.details.insured.name" bundle="${msg}" /></label>
                                           </div>
                                           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                               <input
                                                   type="text" name="childName" id="txtChldFullName${inx}"
                                                   value="" class="form-control full-control"
                                                   onblur="replaceAlpha(this); validateName('txtChldFullName${inx}','errtxtChldFullName${inx}',false,'insured');"
                                                   onkeypress="    return alphaOnly(event);" maxlength="100" />
                                               <span id="errtxtChldFullName${inx}" class="text-red"></span>
                                           </div>
                                       </div>
                                       <!-- english name end -->
                                       <!-- id card start -->
                                       <div class="form-group float">
                                           <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                               <label class="field-label bold-500"><fmt:message
                                                            key="flight.details.applicant.hkid"
                                                            bundle="${msg}" /></label>
                                           </div>
                                           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                               <input id="txtChldInsuHkid${inx}" name="childHKID"
                                                  class="form-control textUpper full-control bmg_custom_placeholder"
                                                  onfocus="placeholderOnFocus(this,'<fmt:message key="flight.details.insured.hkid.placeholder" bundle="${msg}" />');"
                                                  onblur="placeholderOnBlur(this,'<fmt:message key="flight.details.insured.hkid.placeholder" bundle="${msg}" />'); validateHkid('txtChldInsuHkid${inx}','selectedChildHkidPass${inx}','errtxtChldInsuHkid${inx}',false,'insured');"
                                                  value="<fmt:message key="flight.details.insured.hkid.placeholder" bundle="${msg}" />" onkeyup="hkidValid(this)"/> 
                                                  <span id="errtxtChldInsuHkid${inx}" class="text-red"> </span>
                                           </div>
                                       </div>
                                       <!-- id card end -->
                                       <!-- age start -->
                                       <div class="form-group float">
                                           <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                               <label class="field-label bold-500"><fmt:message
                                                    key="flight.details.insured.age" bundle="${msg}" /></label>
                                           </div>
                                           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                               <div class="styled-select">
                                                    <select name="childAgeRange" class="soflow select-label"
                                                        id="selectchildAgeRange${inx}">
                                                        <c:forEach var="ageList" items="${mapChildType}">
                                                            <c:choose>
                                                                <c:when test="${ageList.key == '1'}">
                                                                    <option value="${ageList.key}" selected>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <option value="${ageList.key}">
                                                                </c:otherwise>
                                                            </c:choose>
                                                            <c:out value="${ageList.value}" />
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                  </div> 
                                                  <span id="errchildRange${inx}" class="text-red"></span>
                                           </div>
                                       </div>
                                       <!-- age end -->
                                       <!-- beneficiary start -->
                                       <div class="form-group float">
                                           <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                               <label class="field-label bold-500"><fmt:message
                                                    key="flight.details.insured.beneficiary" bundle="${msg}" /></label>
                                           </div>
                                           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                               <div class="styled-select">
                                                   <select id="childselectBenificiary${inx}"
                                                       name="childBeneficiary"
                                                       onchange="activeDiv('childbenificiaryId${inx}','childselectBenificiary${inx}', 'childBenefitiaryName${inx}', 'txtchildInsuHkid${inx}')"
                                                       class="soflow select-label">
                                                        <c:forEach var="relationshipList" items="${mapRelationshipCode}">
                                                       <option value="${relationshipList.key}"><c:out value="${relationshipList.value}" /></option>
                                                    </c:forEach>
                                                   </select></div> <span id="errselectChildbenificiary${inx}" class="text-red"></span>
                                           </div>
                                       </div>
                                       <!-- beneficiary end -->
                                       
                                       
                                       
                                       
                                       
                                       
                                       <!-- child beneficiary start -->
                                       <div class="form-group float hide" id="childbenificiaryId${inx}">
                                           <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                               <label class="field-label bold-500"></label>
                                           </div>
                                           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                               <div class="form-label col-lg-5 col-md-5 col-sm-5 col-xs-5 pad-none">                                                    
                                                    <label class="field-label bold-500">
                                                      <fmt:message key="flight.details.insured.beneficiary.name" bundle="${msg}" />
                                                    </label>
                                               </div>
                                               <div class="col-lg-7 col-md-7 col-sm-7 col-xs-7 pad-none">
                                                   <input type="text"
                                                        name="childBenificiaryFullName"
                                                        id="childBenefitiaryName${inx}" value=""
                                                        class="form-control full-control "
                                                        onblur="replaceAlpha(this); validateName('childBenefitiaryName${inx}','errchildBenefitiaryName${inx}',false,'beneficiary');"
                                                        onkeypress="    return alphaOnly(event);" maxlength="100" />
                                                    <span id="errchildBenefitiaryName${inx}" class="text-red"></span>
                                               </div>
                                               <div class="clearfix"></div>
                                           </div>
                                       </div>
                                       <!-- child beneficiary end -->
                                       <!-- child beneficiary b start -->
                                       <div class="form-group float hide" id="childbenificiaryId${inx}b">
                                           <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                              <label class="field-label form-label bold-500"></label>
                                           </div>
                                           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                              <div class="form-label col-lg-5 col-md-5 col-sm-5 col-xs-5 pad-none">
                                                  <label class="field-label form-label bold-500">
                                                    <fmt:message key="flight.details.insured.beneficiary.type" bundle="${msg}" />
                                                    </label>
                                               </div>
                                               <div class="col-lg-7 col-md-7 col-sm-7 col-xs-7 pad-none">
                                                  <div class="styled-select">
                                                    <select id="selectAdBenefitiaryHkidPass${inx}" class="form-control soflow select-label" name="selectedAdBenefitiaryHkidPass">
                                                        <option value="HKID" selected="selected"><fmt:message key="travel.details.insured.beneficiary.hkid.option1" bundle="${msg}" /></option>
                                                        <option value="passport"><fmt:message key="travel.details.insured.beneficiary.hkid.option2" bundle="${msg}" /></option>
                                                    </select>
                                                    </div>
                                               </div>
                                           </div>
                                       </div>
                                       <!-- child beneficiary b end -->
                                       <!-- child beneficiary c start -->
                                       <div class="form-group float hide" id="childbenificiaryId${inx}c">
                                           <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                              <label class="field-label form-label bold-500 hidden-lg hidden-md"></label>
                                           </div>
                                           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                              <div class="form-label col-lg-5 col-md-5 col-sm-5 col-xs-5 pad-none">
                                                  <label class="field-label form-label bold-500 hidden-lg hidden-md"></label>
                                               </div>
                                               <div class="col-lg-7 col-md-7 col-sm-7 col-xs-7 pad-none">
                                                  <input id="txtchildInsuHkid${inx}"
                                                name="childBenificiaryHkid" class="form-control textUpper full-control bmg_custom_placeholder"
                                                value="<fmt:message key="flight.details.insured.beneficiary.hkid.placeholder" bundle="${msg}" />" onkeyup="hkidValid(this)" 
                                                onfocus="placeholderOnFocus(this,'<fmt:message key="flight.details.insured.beneficiary.hkid.placeholder" bundle="${msg}" />');"
                                                onblur="placeholderOnBlur(this,'<fmt:message key="flight.details.insured.beneficiary.hkid.placeholder" bundle="${msg}" />'); validateHkid('txtchildInsuHkid${inx}','selectChldBenefitiaryHkidPass${inx}','errtxtchildInsuHkid${inx}',false,'beneficiary');"/> <span id="errtxtchildInsuHkid${inx}"
                                                class="text-red"> </span>
                                               </div>
                                           </div>
                                       </div>
                                       <!-- child beneficiary c end -->
                                       
                                       
                                       
                                       
                                       
                                       
                                       
                                       
                                       
                                       
                                       
                                    </div>
                                </div>
                                
                                
                                
                                <%-- <div id="childtraveller">
                                    <h4 class="color1 margin-left-28">
                                        <fmt:message key="flight.details.insured.label.family.child"
                                            bundle="${msg}" />
                                        <c:out value="${inx}"></c:out>
                                    </h4>
                                    <table class="table activation-form margin-left-2 vert-middle">
                                        <tbody>
                                            <tr>
                                                <td valign="middle" class="col-lg-5 col-md-5 col-sm-5 col-xs-5">
                                                     <label class="bold-500"><fmt:message
                                                    key="flight.details.insured.name" bundle="${msg}" /></label>
                                                </td>
                                                <td class="">
                                                     <input
                                                        type="text" name="childName" id="txtChldFullName${inx}"
                                                        value="" class="form-control full-control"
                                                        placeholder="<fmt:message key="flight.details.insured.name.placeholder" bundle="${msg}" />"
                                                        onblur="replaceAlpha(this); validateName('txtChldFullName${inx}','errtxtChldFullName${inx}',false,'insured');"
                                                        onkeypress="    return alphaOnly(event);" maxlength="100" />
                                                    <span id="errtxtChldFullName${inx}" class="text-red">
                                                    </span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="middle" class="">
                                                    <label class="bold-500"><fmt:message
                                                            key="flight.details.applicant.hkid"
                                                            bundle="${msg}" /></label>
                                                    <div class="styled-select custom-select-label">
                                                        <select id="selectedChildHkidPass${inx}" class="form-control soflow select-label" name="selectedChildHkidPass">
                                                            <option value="HKID" selected="selected"><fmt:message key="travel.details.insured.beneficiary.hkid.option1" bundle="${msg}" /></option>
                                                            <option value="passport"><fmt:message key="travel.details.insured.beneficiary.hkid.option2" bundle="${msg}" /></option>
                                                        </select>
                                                    </div>
                                                </td>
                                                <td class="">
                                                         <input
                                                        id="txtChldInsuHkid${inx}" name="childHKID"
                                                        class="form-control textUpper full-control"
                                                        placeholder="<fmt:message key="flight.details.insured.hkid.placeholder" bundle="${msg}" />"
                                                        value="" onkeyup="hkidValid(this)" onblur="validateHkid('txtChldInsuHkid${inx}','selectedChildHkidPass${inx}','errtxtChldInsuHkid${inx}',false,'insured');"/> <span id="errtxtChldInsuHkid${inx}"
                                                        class="text-red"> </span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="middle" class="">
                                                    <label class="bold-500"><fmt:message
                                                    key="flight.details.insured.age" bundle="${msg}" /></label>
                                                </td>
                                                <td class="">
                                                     <t:dropdown 
                                                        defaultLabel="Select One"
                                                        onChange=""
                                                        selectables="${mapChildType}"
                                                        valueElmId="selectchildAgeRange${inx}"
                                                        valueElmName="childAgeRange"
                                                    />
                                                    <div class="styled-select">
                                                    <select name="childAgeRange" class="soflow select-label"
                                                        id="selectchildAgeRange${inx}">
                                                        <c:forEach var="ageList" items="${mapChildType}">
                                                            <c:choose>
                                                                <c:when test="${ageList.key == '1'}">
                                                                    <option value="${ageList.key}" selected>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <option value="${ageList.key}">
                                                                </c:otherwise>
                                                            </c:choose>
                                                            <c:out value="${ageList.value}" />
                                                            </option>
                                                        </c:forEach>
                                                    </select></div> <span id="errchildRange${inx}" class="text-red"></span>
                                            </td>
                                            </tr>
                                            <tr>
                                                <td valign="middle" class="">
                                                     <label class="bold-500"><fmt:message
                                                    key="flight.details.insured.beneficiary" bundle="${msg}" /></label>
                                                </td>
                                                <td class="">
                                                     <div class="styled-select">
                                                    <select id="childselectBenificiary${inx}"
                                                        name="childBeneficiary"
                                                        onchange="activeDiv('childbenificiaryId${inx}','childselectBenificiary${inx}')"
                                                        class="soflow select-label">
                                                        <option value="SE"><fmt:message
                                                                key="flight.details.insured.beneficiary.default"
                                                                bundle="${msg}" /></option>
                                                        <c:forEach var="relationshipCodeList"
                                                            items="${mapRelationshipCode}">
                                                            <option value="${relationshipCodeList.key}"><c:out
                                                                    value="${relationshipCodeList.value}" /></option>
                                                        </c:forEach>
                                                    </select></div> <span id="errselectChildbenificiary${inx}" class="text-red"></span>
                                                </td>
                                            </tr>
                                            <tr id="childbenificiaryId${inx}" class="hide">
                                                <td valign="middle" class="">
                                                     <label class="bold-500"><fmt:message
                                                key="flight.details.insured.beneficiary.name"
                                                bundle="${msg}" /></label>
                                                </td>
                                                <td class="">
                                                      <input type="text"
                                                        name="childBenificiaryFullName"
                                                        id="childBenefitiaryName${inx}" value=""
                                                        class="form-control full-control "
                                                        placeholder="<fmt:message key="flight.details.insured.beneficiary.name.placeholder" bundle="${msg}" />"
                                                        onblur="replaceAlpha(this); validateName('childBenefitiaryName${inx}','errchildBenefitiaryName${inx}',false,'beneficiary');"
                                                        onkeypress="    return alphaOnly(event);" maxlength="100" />
                                                    <span id="errchildBenefitiaryName${inx}" class="text-red"></span>
                                                </td>
                                            </tr>
                                            <tr id="childbenificiaryId${inx}b" class="hide">
                                                <td valign="middle" class="">
                                                    <div class="styled-select custom-select-label">
	                                                    <select id="selectedChldBenefitiaryHkidPass${inx}" class="form-control soflow select-label" name="selectedChldBenefitiaryHkidPass">
	                                                        <option value="HKID" selected="selected"><fmt:message key="travel.details.insured.beneficiary.hkid.option1" bundle="${msg}" /></option>
	                                                        <option value="passport"><fmt:message key="travel.details.insured.beneficiary.hkid.option2" bundle="${msg}" /></option>
	                                                    </select>
                                                    </div>
                                                </td>
                                                <td class="">
                                                      <input id="txtchildInsuHkid${inx}"
                                            name="childBenificiaryHkid" class="form-control textUpper full-control"
                                            placeholder="<fmt:message key="flight.details.insured.beneficiary.hkid.placeholder" bundle="${msg}" />"
                                            value="" onkeyup="hkidValid(this)" onblur="validateHkid('txtchildInsuHkid${inx}','selectChldBenefitiaryHkidPass${inx}','errtxtchildInsuHkid${inx}',false,'beneficiary');"/> <span id="errtxtchildInsuHkid${inx}"
                                            class="text-red"> </span>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div> --%>
                                </div>
                            </c:forEach>

                            <input type="hidden" name="totalOtherTraveller"
                                value="${planDetailsForm.getTotalOtherTraveller()}" id="totalCountOther">

                            <c:forEach var="inx" begin="1" end="${planDetailsForm.getTotalOtherTraveller()}">
                                <div class="form-wrap">
                                 <div class="otherTraveller">
                                    <h4 class="bold big-title" style="padding-left:0px !important;">
                                       <fmt:message key="flight.details.insured.label.family.others"
                                            bundle="${msg}" />
                                        <c:out value="${inx}"></c:out>
                                    </h4>
                                     <div>
                                        <!-- english name start -->
                                       <div class="form-group float">
                                           <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                               <label class="field-label bold-500"><fmt:message
                                                    key="flight.details.insured.name" bundle="${msg}" /></label>
                                           </div>
                                           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                               <input
                                                        type="text" name="otherName" id="txtOtherFullName${inx}"
                                                        value="" class="form-control full-control "
                                                        onblur="replaceAlpha(this); validateName('txtOtherFullName${inx}','errtxtOtherFullName${inx}',false,'insured');"
                                                        onkeypress="    return alphaOnly(event);" maxlength="100" />
                                                    <span id="errtxtOtherFullName${inx}" class="text-red"></span>
                                           </div>
                                       </div>
                                       <!-- english name end -->
                                       <!-- id card start -->
                                       <div class="form-group float">
                                           <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                               <label class="field-label bold-500">
                                               <fmt:message
                                                            key="flight.details.applicant.hkid"
                                                            bundle="${msg}" /></label>
                                           </div>
                                           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                               <input
                                                    id="txtOtherInsuHkid${inx}" name="otherHKID"
                                                    class="form-control textUpper full-control bmg_custom_placeholder"
                                                    onfocus="placeholderOnFocus(this,'<fmt:message key="flight.details.insured.hkid.placeholder" bundle="${msg}" />');"
                                                    onblur="placeholderOnBlur(this,'<fmt:message key="flight.details.insured.hkid.placeholder" bundle="${msg}" />'); validateHkid('txtOtherInsuHkid${inx}','selectedOtherHkidPass${inx}','errtxtOtherInsuHkid${inx}',false,'insured');"
                                                    value="<fmt:message key="flight.details.insured.hkid.placeholder" bundle="${msg}" />" onkeyup="hkidValid(this)"/><span id="errtxtOtherInsuHkid${inx}"
                                                    class="text-red"> </span>
                                           </div>
                                       </div>
                                       <!-- id card end -->
                                       <!-- age start -->
                                       <div class="form-group float">
                                           <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                               <label class="field-label bold-500"><fmt:message
                                                    key="flight.details.insured.age" bundle="${msg}" /></label>
                                           </div>
                                           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                               <div class="styled-select">
                                                    <select name="otherAgeRange" class="soflow select-label"
                                                        id="selectOtherAgeRange${inx}">
                                                   <c:forEach var="ageList" items="${mapAgeType}">
                                                       <c:choose>
                                                           <c:when test="${ageList.key == '2'}">
                                                               <option value="${ageList.key}" selected>
                                                           </c:when>
                                                           <c:otherwise>
                                                               <option value="${ageList.key}">
                                                           </c:otherwise>
                                                       </c:choose>
                                                       <c:out value="${ageList.value}" />
                                                       </option>
                                                   </c:forEach>
                                               </select>
                                               </div> <span id="errselectOtherAgeRange${inx}" class="text-red"></span>
                                           </div>
                                       </div>
                                       <!-- age end -->
                                       <!-- beneficiary start -->
                                       <div class="form-group float">
                                           <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                               <label class="field-label bold-500"><fmt:message
                                                    key="flight.details.insured.beneficiary" bundle="${msg}" /></label>
                                           </div>
                                           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                               <div class="styled-select">
                                                    <select id="otherSelectBenificiary${inx}"
                                                        name="otherBeneficiary"
                                                        onchange="activeDiv('otherbenificiaryId${inx}','otherSelectBenificiary${inx}', 'otherBenefitiaryName${inx}', 'txtOtherBenInsuHkid${inx}')"
                                                        class="form-control soflow select-label">
		                                                        <c:forEach var="relationshipList" items="${mapRelationshipCode}">
                                                       <option value="${relationshipList.key}"><c:out value="${relationshipList.value}" /></option>
                                                    </c:forEach>
                                                    </select></div> <span id="benificiary" style="display: none"> <label
                                                        style="color: red">Beneficiary which is blank</label>
                                                    </span>
                                           </div>
                                       </div>
                                       <!-- beneficiary end -->
                                       
                                       
                                       
                                       
                                       
                                       
                                       
                                       
                                       
                                       
                                       <!-- other beneficiary start -->
                                       <div class="form-group float hide" id="otherbenificiaryId${inx}">
                                           <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                               <label class="field-label bold-500"></label>
                                           </div>
                                           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                               <div class="form-label col-lg-5 col-md-5 col-sm-5 col-xs-5 pad-none">                                                    
                                                    <label class="field-label bold-500">
                                                      <fmt:message key="flight.details.insured.beneficiary.name" bundle="${msg}" />
                                                    </label>
                                               </div>
                                               <div class="col-lg-7 col-md-7 col-sm-7 col-xs-7 pad-none">
                                                   <input type="text"
                                                   name="otherBenificiaryFullName"
                                                   id="otherBenefitiaryName${inx}" value=""
                                                   class="form-control full-control "
                                                   onblur="replaceAlpha(this); validateName('otherBenefitiaryName${inx}','errotherBenefitiaryName${inx}',false,'beneficiary');"
                                                   onkeypress="    return alphaOnly(event);" maxlength="100" />
                                               <span id="errotherBenefitiaryName${inx}" class="text-red"></span>
                                               </div>
                                               <div class="clearfix"></div>
                                           </div>
                                       </div>
                                       <!-- other beneficiary end -->
                                       <!-- other beneficiary b start -->
                                       <div class="form-group float hide" id="otherbenificiaryId${inx}b">
                                           <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                              <label class="field-label form-label bold-500"></label>
                                           </div>
                                           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                              <div class="form-label col-lg-5 col-md-5 col-sm-5 col-xs-5 pad-none">
                                                  <label class="field-label form-label bold-500">
                                                    <fmt:message key="flight.details.insured.beneficiary.type" bundle="${msg}" />
                                                    </label>
                                               </div>
                                               <div class="col-lg-7 col-md-7 col-sm-7 col-xs-7 pad-none">
                                                  <div class="styled-select">
                                                    <select id="selectAdBenefitiaryHkidPass${inx}" class="form-control soflow select-label" name="selectedAdBenefitiaryHkidPass">
                                                        <option value="HKID" selected="selected"><fmt:message key="travel.details.insured.beneficiary.hkid.option1" bundle="${msg}" /></option>
                                                        <option value="passport"><fmt:message key="travel.details.insured.beneficiary.hkid.option2" bundle="${msg}" /></option>
                                                    </select>
                                                    </div>
                                               </div>
                                           </div>
                                       </div>
                                       <!-- other beneficiary b end -->
                                       <!-- other beneficiary c start -->
                                       <div class="form-group float hide" id="otherbenificiaryId${inx}c">
                                           <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                              <label class="field-label form-label bold-500 hidden-lg hidden-md"></label>
                                           </div>
                                           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                              <div class="form-label col-lg-5 col-md-5 col-sm-5 col-xs-5 pad-none">
                                                  <label class="field-label form-label bold-500 hidden-lg hidden-md"></label>
                                               </div>
                                               <div class="col-lg-7 col-md-7 col-sm-7 col-xs-7 pad-none">
                                                  <input id="txtOtherBenInsuHkid${inx}"
                                                    name="otherBenificiaryHkid" class="form-control textUpper full-control bmg_custom_placeholder"
                                                    value="<fmt:message key="flight.details.insured.beneficiary.hkid.placeholder" bundle="${msg}" />" onkeyup="hkidValid(this)" 
                                                    onfocus="placeholderOnFocus(this,'<fmt:message key="flight.details.insured.beneficiary.hkid.placeholder" bundle="${msg}" />');"
                                                    onblur="placeholderOnBlur(this,'<fmt:message key="flight.details.insured.beneficiary.hkid.placeholder" bundle="${msg}" />'); validateHkid('txtOtherBenInsuHkid${inx}','selectOtherBenefitiaryHkidPass${inx}','errtxtOtherBenInsuHkid${inx}',false,'beneficiary');"/> <span id="errtxtOtherBenInsuHkid${inx}"
                                                    class="text-red"> </span>
                                               </div>
                                           </div>
                                       </div>
                                       <!-- other beneficiary c end -->
                                       
                                       
                                       
                                       
                                       
                                     </div>
                                  </div>
                            
                            
                            
                                <%-- <div id="childtraveller">
                                    <h4 class="color1 margin-left-28">
                                        <fmt:message key="flight.details.insured.label.family.others"
                                            bundle="${msg}" />
                                        <c:out value="${inx}"></c:out>
                                    </h4>
                                    
                                    <table class="table activation-form margin-left-2 vert-middle">
                                        <tbody>
                                            <tr>
                                                <td valign="middle" class="col-lg-5 col-md-5 col-sm-5 col-xs-5">
                                                     <label class="bold-500"><fmt:message
                                                    key="flight.details.insured.name" bundle="${msg}" /></label>
                                                </td>
                                                <td class="">
                                                     <input
		                                                type="text" name="otherName" id="txtOtherFullName${inx}"
		                                                value="" class="form-control full-control "
		                                                placeholder="<fmt:message key="flight.details.insured.name.placeholder" bundle="${msg}" />"
		                                                onblur="replaceAlpha(this); validateName('txtOtherFullName${inx}','errtxtOtherFullName${inx}',false,'insured');"
		                                                onkeypress="    return alphaOnly(event);" maxlength="100" />
		                                            <span id="errtxtOtherFullName${inx}" class="text-red"></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="middle" class="">
                                                    <label class="bold-500"><fmt:message
                                                            key="flight.details.applicant.hkid"
                                                            bundle="${msg}" /></label>
                                                    <div class="styled-select custom-select-label">
                                                        <select id="selectedOtherHkidPass${inx}" class="form-control soflow select-label" name="selectedOtherHkidPass">
                                                            <option value="HKID" selected="selected"><fmt:message key="travel.details.insured.beneficiary.hkid.option1" bundle="${msg}" /></option>
                                                            <option value="passport"><fmt:message key="travel.details.insured.beneficiary.hkid.option2" bundle="${msg}" /></option>
                                                        </select>
                                                    </div>
                                                </td>
                                                <td class="">
                                                     <input
	                                                id="txtOtherInsuHkid${inx}" name="otherHKID"
	                                                class="form-control textUpper full-control"
	                                                placeholder="<fmt:message key="flight.details.insured.hkid.placeholder" bundle="${msg}" />"
	                                                value="" onkeyup="hkidValid(this)" onblur="validateHkid('txtOtherInsuHkid${inx}','selectedOtherHkidPass${inx}','errtxtOtherInsuHkid${inx}',false,'insured');"/><span id="errtxtOtherInsuHkid${inx}"
	                                                class="text-red"> </span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="middle" class="">
                                                     <label class="bold-500"><fmt:message
                                                    key="flight.details.insured.age" bundle="${msg}" /></label>
                                                </td>
                                                <td class="">
                                                     <t:dropdown 
		                                                defaultLabel="Select One"
		                                                onChange=""
		                                                selectables="${mapAgeType}"
		                                                valueElmId="selectOtherAgeRange${inx}"
		                                                valueElmName="otherAgeRange"
		                                            />
		                                            <div class="styled-select">
		                                            <select name="otherAgeRange" class="soflow select-label"
		                                                id="selectOtherAgeRange${inx}">
		                                                <c:forEach var="ageList" items="${mapAgeType}">
		                                                    <c:choose>
		                                                        <c:when test="${ageList.key == '2'}">
		                                                            <option value="${ageList.key}" selected>
		                                                        </c:when>
		                                                        <c:otherwise>
		                                                            <option value="${ageList.key}">
		                                                        </c:otherwise>
		                                                    </c:choose>
		                                                    <c:out value="${ageList.value}" />
		                                                    </option>
		                                                </c:forEach>
		                                            </select></div> <span id="errselectOtherAgeRange${inx}" class="text-red"></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="middle" class="">
                                                     <label class="bold-500"><fmt:message
                                                    key="flight.details.insured.beneficiary" bundle="${msg}" /></label>
                                                </td>
                                                <td class="">
                                                     <div class="styled-select">
		                                            <select id="otherSelectBenificiary${inx}"
		                                                name="otherBeneficiary"
		                                                onchange="activeDiv('otherbenificiaryId${inx}','otherSelectBenificiary${inx}')"
		                                                class="form-control soflow select-label">
		                                                <option value="SE"><fmt:message
		                                                        key="flight.details.insured.beneficiary.default"
		                                                        bundle="${msg}" /></option>
		                                                <c:forEach var="relationshipCodeList"
		                                                    items="${mapRelationshipCode}">
		                                                    <option value="${relationshipCodeList.key}"><c:out
		                                                            value="${relationshipCodeList.value}" /></option>
		                                                </c:forEach>
		                                            </select></div> <span id="benificiary" style="display: none"> <label
		                                                style="color: red">Beneficiary which is blank</label>
		                                            </span>
                                                </td>
                                            </tr>
                                            <tr id="otherbenificiaryId${inx}" class="hide">
                                                <td valign="middle" class="">
                                                     <label class="bold-500"><fmt:message
                                                    key="flight.details.insured.beneficiary.name"
                                                    bundle="${msg}" /></label>
                                                </td>
                                                <td class="">
                                                      <input type="text"
                                                        name="otherBenificiaryFullName"
                                                        id="otherBenefitiaryName${inx}" value=""
                                                        class="form-control full-control "
                                                        placeholder="<fmt:message key="flight.details.insured.beneficiary.name.placeholder" bundle="${msg}" />"
                                                        onblur="replaceAlpha(this); validateName('otherBenefitiaryName${inx}','errotherBenefitiaryName${inx}',false,'beneficiary');"
                                                        onkeypress="    return alphaOnly(event);" maxlength="100" />
                                                    <span id="errotherBenefitiaryName${inx}" class="text-red"></span>
                                                </td>
                                            </tr>
                                            <tr id="otherbenificiaryId${inx}b" class="hide">
                                                <td valign="middle" class="">
                                                    <div class="styled-select custom-select-label">
                                                        <select id="selectOtherBenefitiaryHkidPass${inx}" class="form-control soflow select-label" name="selectedOtherBenefitiaryHkidPass">
                                                            <option value="HKID" selected="selected"><fmt:message key="travel.details.insured.beneficiary.hkid.option1" bundle="${msg}" /></option>
                                                            <option value="passport"><fmt:message key="travel.details.insured.beneficiary.hkid.option2" bundle="${msg}" /></option>
                                                        </select>
                                                    </div>
                                                </td>
                                                <td class="">
                                                      <input id="txtOtherBenInsuHkid${inx}"
                                                    name="otherBenificiaryHkid" class="form-control textUpper full-control"
                                                    placeholder="<fmt:message key="flight.details.insured.beneficiary.hkid.placeholder" bundle="${msg}" />"
                                                    value="" onkeyup="hkidValid(this)" onblur="validateHkid('txtOtherBenInsuHkid${inx}','selectOtherBenefitiaryHkidPass${inx}','errtxtOtherBenInsuHkid${inx}',false,'beneficiary');"/> <span id="errtxtOtherBenInsuHkid${inx}"
                                                    class="text-red"> </span>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div> --%>
                                </div>
                            </c:forEach>


                            <!--Till this Line  -->

                        <div class="clearfix"></div>

                        <div class="form-wrap">
                            <h4 class="h4-2 bmg-disclaimer-header">
                                <fmt:message key="flight.details.declarations.heading"
                                    bundle="${msg}" />
                            </h4>
                            <div class="declaration-content" style="margin-left: 0px;margin-right: 0px;">
                            <div class="checkbox">
                                <input id="checkbox1" name="checkbox1" type="checkbox">
                                <label for="checkbox1"> <fmt:message
                                        key="flight.details.declarations.tnc" bundle="${msg}" />
                                    <ol class="ol-disclaimer">
                                        <li><fmt:message
                                                key="flight.details.declarations.tnc.desc1" bundle="${msg}" /></li>
                                        <li><fmt:message
                                                key="flight.details.declarations.tnc.desc2" bundle="${msg}" /></li>
                                        <li><fmt:message
                                                key="flight.details.declarations.tnc.desc3" bundle="${msg}" /></li>
                                        <li><fmt:message
                                                key="flight.details.declarations.tnc.desc4" bundle="${msg}" /></li>
                                        <li><fmt:message
                                                key="flight.details.declarations.tnc.desc5" bundle="${msg}" /></li>
                                    </ol>

                                </label>
                            </div>
                            <span id="chk1" class="text-red"> </span>


                            <div class="checkbox">
                                <input id="checkbox2" type="checkbox"> <label
                                    for="checkbox2"> <fmt:message
                                        key="flight.details.declarations.PICS.part1" bundle="${msg}" />
                                    <a
                                    href="<fmt:message key="PICS.link" bundle="${msg}" />"
                                    target="_blank" class="sub-link"> <fmt:message
                                            key="flight.details.declarations.PICS.part2" bundle="${msg}" /></a>
                                <fmt:message key="flight.details.declarations.PICS.part3"
                                        bundle="${msg}" /> <br>

                                </label>
                            </div>

                            <span id="chk2" class="text-red"> </span>
                            <hr />

                            <div>
                                <fmt:message key="flight.details.declarations.PDPO"
                                    bundle="${msg}" />
                            </div>
                            <div class="checkbox">
                                <input id="checkbox3" type="checkbox" name="checkbox3" value="true"> <label
                                    for="checkbox3"> <fmt:message
                                        key="flight.details.declarations.PDPO.option1" bundle="${msg}" /><br>
                                </label>
                            </div>

                            <div class="checkbox">
                                <input id="checkbox4" type="checkbox" name="checkbox4" value="true"> <label
                                    for="checkbox4"> <fmt:message
                                        key="flight.details.declarations.PDPO.option2" bundle="${msg}" /><br>
                                    <br>
                                </label>
                            </div>
                            
                            <div class="flightCheckboxBubble">
                                 <fmt:message key="flight.details.declarations.PDPO.warning" bundle="${msg}" />
                            </div>
                            
                            <script type="text/javascript">
                            function showBubble(){
                                if($("#checkbox3").prop('checked') || $("#checkbox4").prop("checked")) {
                                    $(".flightCheckboxBubble").fadeIn();
                                }else{
                                    $(".flightCheckboxBubble").fadeOut();
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
                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 gray-bg pad-none wht-bg3 floatingbox">
                        <!--mob-hidden-->
                        <div class="hidden-sm hidden-xs">
                            <div class="wd2">
                                <div class="pull-left" style="width:150px;">
                                    <h2 class="h2-3-choose" style="padding-left:0px;font-size: 24px;">
                                        <fmt:message key="flight.details.summary.product"
                                            bundle="${msg}" />
                                    </h2>
                                    <h4 style="padding-left:0px;line-height: 0px;font-size: 16px;">
                                        <!-- Plan Summary -->
                                    </h4>
                                </div>
                                <div class="pull-right" style="padding-top: 45px;">
                                    <div class="text-right h2-2 h2" style="margin-top:0px;margin-bottom:0px;">
                                        <div class="hk" style="font-size: 18px;">
                                            <!-- <fmt:message key="travel.dollar" bundle="${msg}" />
                                            <div class="flightcare-hk"></div> -->
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div class="orange-bdr"></div>
                            
                            <div class="form-container" style="padding: 0px !important;">
                                <div style="width: 80%;margin-left: 10%;">
                                <!-- text 出發日期 header   -->
                                <h3 class="txt-bold">
                                    <fmt:message key="flight.details.summary.option1" bundle="${msg}" /> 
                                    <!-- <span class="span2 uline">
                                    <a href="${pageContext.request.contextPath}/${language}/flight-insurance">
                                        <fmt:message key="flight.details.summary.change" bundle="${msg}" />
                                    </a>
                                    </span> -->
                                </h3>
                                                        
        
                                
                                
                             <!-- input 出發日期 -->
                     
                <!-- <div class="input-group date" id="dp1-detail-page"> <span class="input-group-addon in border-radius"><span><img src="<%=request.getContextPath()%>/resources/images/calendar.png" alt=""></span></span>
               <input name="departureDate" type="text" class="datepicker form-control border-radius" value="${planDetailsForm.getDepartureDate()}" readonly>
                </div>-->
                <div class="input-group date"> <span class="input-group-addon in border-radius"><span><img src="<%=request.getContextPath()%>/resources/images/calendar.png" alt=""></span></span>
               <input name="departureDate" type="text" class="datepicker form-control border-radius" id="txtStartDateDesk" value="${planDetailsForm.getDepartureDate()}" readonly>
                </div>
    
                

                
                <!--  onblur="chkValidFlightDepartureDate(this, 'startDateDeskIn', '');"    -->
                
                                                
                                            

                            <!-- text 返回日期  -->
                                <h3 class="txt-bold">
                                    <fmt:message key="flight.details.summary.option2" bundle="${msg}" /> 
                                    <!-- <span class="span2 uline">
                                        <a href="${pageContext.request.contextPath}/${language}/flight-insurance">
                                            <fmt:message key="flight.details.summary.change" bundle="${msg}" />
                                        </a>
                                    </span> -->
                                </h3>
                        
                            <%---------------------------------------ajax post to self page and  update session -------------%> 
                            <%---------------------------------------ajax post to  self page and  update session -------------%>   
                            
                        <%  
                            
                            if(request.getParameter("flight-startDate")!=null){
                                session.setAttribute("flight-start",request.getParameter("flight-startDate"));                              
                            }
                            if(request.getParameter("flight-endDate")!=null){
                                    session.setAttribute("flight-end",request.getParameter("flight-endDate"));                              
                             }
                            
                        %>  
                            <%---------------------------------------ajax post to  self page and  update session -------------%>   
                            <%---------------------------------------ajax post to  self page and  update session -------------%>        
                    
                                 
                        
                        
    
                        
                              <!-- input 出發日期 -->                               
                 <!-- <div class="input-group date" id="dp2-detail-page"> <span class="input-group-addon in border-radius"><span><img src="<%=request.getContextPath()%>/resources/images/calendar.png" alt=""></span></span>
                  <input name="returnDate" type="text" class="datepicker form-control border-radius" id="txtEndDateDesk"  value="${planDetailsForm.getReturnDate()}" readonly>
                 </div>-->
                 <div class="input-group date"> <span class="input-group-addon in border-radius"><span><img src="<%=request.getContextPath()%>/resources/images/calendar.png" alt=""></span></span>
                  <input name="returnDate" type="text" class="datepicker form-control border-radius" id="txtEndDateDesk"  value="${planDetailsForm.getReturnDate()}" readonly>
                 </div>  
                        
                            
                            
                            
                                
                                <h3 class="txt-bold">
                                    <fmt:message key="flight.details.summary.option3" bundle="${msg}" /> 
                                    <!-- <span class="span2 uline">
                                        <a href="${pageContext.request.contextPath}/${language}/flight-insurance">
                                            <fmt:message key="flight.details.summary.change" bundle="${msg}" />
                                        </a>
                                    </span> -->
                                </h3>
                                <h4>
                                    <c:if test="${planDetailsForm.getTotalAdultTraveller() !=0 }">
                                        <fmt:message key="flight.sidebar.summary.label.family.parent"
                                            bundle="${msg}" />: ${planDetailsForm.getTotalAdultTraveller()} <br>
                                    </c:if>
                                    <c:if test="${planDetailsForm.getTotalChildTraveller() !=0 }">
                                        <fmt:message key="flight.sidebar.summary.label.family.child"
                                            bundle="${msg}" />: ${planDetailsForm.getTotalChildTraveller()} <br>
                                    </c:if>
                                    <c:if test="${planDetailsForm.getTotalOtherTraveller() !=0}">
                                        <fmt:message key="flight.sidebar.summary.label.family.others"
                                            bundle="${msg}" />: ${planDetailsForm.getTotalOtherTraveller()} <br>
                                    </c:if>
                                    <c:if test="${planDetailsForm.getTotalPersonalTraveller() !=0}">
                                        <fmt:message key="flight.sidebar.summary.label.personal"
                                            bundle="${msg}" />: ${planDetailsForm.getTotalPersonalTraveller()}</c:if>
                                </h4>
                                <input type="hidden" name="otherInput"
                                    value="${planDetailsForm.getTotalOtherTraveller()}"> <input
                                    type="hidden" name="childInput"
                                    value="${planDetailsForm.getTotalChildTraveller()}"> <br>
                                <input type="hidden" name="days"
                                    value="${planDetailsForm.getDays()}">
                                <h3 class="txt-bold">
                                    <fmt:message key="flight.details.summary.option4"
                                        bundle="${msg}" />
                                    <span>${planDetailsForm.getDays()}</span>
                                    <fmt:message key="flight.details.summary.option5"
                                        bundle="${msg}" />
                                </h3>
                                </div>
                            </div>
                            <div class="orange-bdr"></div>
                            <div class="clearfix"></div>
                            <!-- <h3 class="h4-1-orange-b col-lg-6 col-md-6">
                                 Amount due
                            </h3> -->
                            <%-- <h3 class="h4-1-orange-b col-lg-6 col-md-6 text-right">
                                 ${planDetailsForm.getTotalDue()}
                                &nbsp;
                            </h3> --%>
                        
                        <!--mob-hidden-->
                        </div>
                        <div class="bmg_recaptcha" style="width: 80%;margin-top:20px;">
                            <div class="g-recaptcha" data-sitekey="6LfP6QcTAAAAAHlgmCoww2R_FXgjmGOZawHB2lFZ"></div>
                        </div>
                        <div class="hidden-sm hidden-xs">
                        <div style="width: 80%;margin-left: 10%;">
                            <div class="top35 pull-left pad-none" style="width:47%">
                                 <a class="bdr-curve btn btn-primary bck-btn" onclick="perventRedirect=false;BackMe();"><fmt:message key="flight.details.action.back" bundle="${msg}" /> </a>
                            </div>
                            <div class="top35 pull-right pad-none" style="width:47%"> 
                                <input type="button" onclick="return activateUserAccountJoinUs();"
                                class="bdr-curve btn btn-primary nxt-btn"
                                value="<fmt:message key="flight.details.action.next" bundle="${msg}" />" />
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <br/>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
                
                <div class="col-xs-12 hidden-md hidden-lg pad-none">
	                 <div style="width: 80%;margin-left: 10%;">
	                     <hr/>
	                 </div>
	            </div>
                
                <p class="padding1 workingholiday-plan-disclaimer">
                    <fmt:message key="flight.details.other.disclaimer.part1"
                        bundle="${msg}" />
                    <a class="sub-link"
                        href="<%=request.getContextPath()%>/resources/policy-provisions-pdf/FlightCare_Provisions_Mar_2015.pdf"
                        target="_blank"><fmt:message
                            key="flight.details.other.disclaimer.part2" bundle="${msg}" /></a>
                    <fmt:message key="flight.details.other.disclaimer.part3"
                        bundle="${msg}" />
                    <br>
                    <fmt:message key="flight.details.other.disclaimer.part4"
                        bundle="${msg}" />
                </p>
                
                <div class="col-xs-12 hidden-md hidden-lg pad-none">
				   <div style="width: 80%;margin-left: 10%;  margin-bottom: 50px;">
				        <div class="top35 pull-left pad-none" style="width:47%">
				            <a class="bdr-curve btn btn-primary bck-btn" onclick="perventRedirect=false;BackMe();"><fmt:message key="flight.details.action.back" bundle="${msg}" /> </a>
				        </div>
				        <div class="top35 pull-right pad-none" style="width:47%">
				            <input type="button" onclick="return activateUserAccountJoinUs();"
                                class="bdr-curve btn btn-primary nxt-btn"
                                value="<fmt:message key="flight.details.action.next" bundle="${msg}" />" />
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

<!--------/end- Main Content------------>

<!--Plan-login-popup-->



<div class="scroll-to-top">
    <a title="Scroll to top" href="#">
        <img src="<%=request.getContextPath()%>/resources/images/up-arrow.png" alt="Scroll to top"  />
    </a>
</div>

<script src='https://www.google.com/recaptcha/api.js'></script>

<script>



/* For Benefitiary Div active and Inactive */
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
/* END- For Benefitiary Dive active and Inactive */

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
/* Function for create flight policy */

var flight_click = false;

function createFlightFnc(form) 
{   	
    var flag = false;
    
    if (fPlanValid() && !flight_click )
    {
        flight_click = true;
        $.ajax(
        {
            type : "POST",
            url : "<%=request.getContextPath()%>/${language}/flight-insurance/confirm-policy",
            data : $("#freeFlightForm").serialize(),
            async : false,
            success : function(data) 
            {
            	flight_click = false;
                if (data == 'success') {
                    $('#errorMessages').hide();
                    flag= true;
                    form.action = "<%=request.getContextPath()%>/${language}/flight-insurance/confirmation";
                } else{
                    flag= false;
                    $('#errorMessages').removeClass('hide');
                    $('#errorMessages').html(data);
                }
        
            }
        });
    } else {
    	flight_click = false;
    	flag = false;
    }
    
    if(flag){
    	$('#loading-overlay').modal({
            backdrop: 'static',
            keyboard: false
         })
    }else{
    	$('#loading-overlay').modal('hide');
    }
    return flag;
}
</script>