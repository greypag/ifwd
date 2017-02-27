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
       fvConfig['flightJSPcbInfo'] = {
               'counter': {
                   'familyPlan': {
                       'adult':    ${planDetailsForm.totalAdultTraveller}
                       , 'child':  ${planDetailsForm.totalChildTraveller}
                       , 'other':  ${planDetailsForm.totalOtherTraveller}
                   }
                   , 'personalPlan': ${planDetailsForm.totalPersonalTraveller}
               }
               , 'currentPage': {
                   'lang':             '${language}'
                   , 'contextPath':    '<%=request.getContextPath()%>'
               }
               , 'plannedDays':    ${planDetailsForm.days}
               , 'isAuthenticated':  ${!(authenticate.equals("direct") || authenticate.equals("false"))}
           };    	
    	
        $("[data-toggle='tooltip']").tooltip();
        $( "[data-toggle='tooltip']" ).on( "click", function() {
       		$(".tooltip").toggle();
       	});

        <% // if (authenticate.equals("false") || authenticate.equals("direct")) { %>
        // fwdUtility.temp.flightCareAuth();
        <% // } else {%>
        // fwdUtility.temp.flightCareActivate( {'formId': 'freeFlightForm'} );
        <% // } %>
    });
    // fwdUtility.temp.flightCareBenefitiaryIsActive();

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
if (lang === "EN") {
    getBundleLanguage = "en";
} else {
	if (lang === "tc") {
	    getBundleLanguage = "zh";
	} else {
	    getBundleLanguage = "en";
	}
}
perventRedirect = true;
</script>

<!--/#main-Content-->
<section>
    <div id="cn" class="container">
        <div class="row">
            <%-- <form:form name="freeFlight" method="post" action="flight-confirmation" onsubmit="return fPlanValid();"> --%>
            <%-- <form:form name="freeFlightForm" id="freeFlightForm" modelAttribute="createFlightPolicy" method="post" onsubmit="return fwdUtility.pages.flightCare.userLoginAjax.createFlightFnc(this);"> --%>
            <form:form name="freeFlightForm" id="freeFlightForm" class="js__fv" modelAttribute="createFlightPolicy" method="post">
                <input type="hidden" name="planSelected" value="${planDetailsForm.planSelected}">
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
                                class="image-order-status image-order-status-intransit img-circle">
                                <div class="icon">3</div>
                                <span class="status min-left"><fmt:message
                                        key="flight.breadcrumb2.item3" bundle="${msg}" /></span>
                            </div>
                        </div>
                    </div>
                </div>
                 <ol class="breadcrumb pad-none">
                    <li><fmt:message key="flight.breadcrumb1.item1" bundle="${msg}" /><i class="fa fa-caret-right"></i></li>
                    <li><fmt:message key="flight.breadcrumb1.item2" bundle="${msg}" /><i class="fa fa-caret-right"></i></li>
                    <li><fmt:message key="flight.breadcrumb1.item3" bundle="${msg}" /></li>
                    <li class="active "><i class="fa fa-caret-right"></i>
                    <fmt:message key="flight.breadcrumb1.item4" bundle="${msg}" /></li>
                </ol>
                <div id="quote-wrap" class="container pad-none bdr ur-opt-content gray-bg3">
                    <div class="alert alert-danger hide" role="alert" id="errorMessages"></div>
                    <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 pad-none white-bg1">
                        <br>
                        <div class="form-wrap">
                        <% if (authenticate.equals("false") || authenticate.equals("direct")) { %>
                        <h3 class="h2-3-existing-fwd-head bmg-detail-exist-member-head">
                        <fmt:message key="flight.details.login" bundle="${msg}" />
                        <a class="tool-tip show-inline-md" data-toggle="tooltip" data-placement="bottom"
                            title="<fmt:message key="member.account.login.help" bundle="${msg}" />">
                            <img src="<%=request.getContextPath()%>/resources/images/ic.png" alt="">
                        </a>
                        </h3>

                        <a href="#" class="col-lg-3 col-md-3 col-sm-3 col-xs-3 btn-box-2 color4 login-btn" data-toggle="modal" data-target="#loginpopup"><fmt:message key="flight.details.login.action" bundle="${msg}" /></a>
                        <div class="col-lg-9 col-md-9 col-sm-9 col-xs-9 text-left">
                            <h3 class="text-left or-continue">
                                <fmt:message key="flight.details.login.other.part1" bundle="${msg}" /></span>
                                <fmt:message key="flight.details.login.other.part2" bundle="${msg}" />
                            </h3>
                        </div>
                        <% } %>
                        </div>

                        <div class="clearfix"></div>
                        <br>
                        <div class="gray-bdr"></div>
                        <!-- updated responsive design start -->
                        <div class="form-wrap">
                            <div class="big-title black-bold pad-none bmg-big-title">
                                <fmt:message key="flight.details.applicant.heading" bundle="${msg}" />
                            </div>
	                        <!-- english name start -->
	                       <div class="form-group float">
	                           <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
	                               <label for="inputFullName" class="bold-500 field-label">
	                                   <fmt:message key="flight.details.applicant.name" bundle="${msg}" />
	                               </label>
	                           </div>
	                           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                   <input type="text" class="form-control full-control textUpper"
                                       id="inputFullName" name="fullName" placeholder="<fmt:message key="flight.details.applicant.name.placeholder" bundle="${msg}" />"
                                       <c:choose>
										   <c:when test="${userDetails != null && userDetails.fullName != '' && userDetails.userName != '*DIRECTGI'}">
										   value="${userDetails.fullName }" readonly="readonly"
										   </c:when>
									   </c:choose>
                                       />
	                                   <span id="fullnameinvalid" class="text-red"></span>
	                           </div>
	                       </div>
	                       <!-- english name end -->
	                       <!-- id card starts -->
	                       <div class="form-group float">
	                           <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
	                               <label for="inputTxtAppHkid" class="bold-500 field-label">
	                                   <fmt:message key="flight.details.applicant.hkid" bundle="${msg}" />
	                               </label>
	                           </div>
	                           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
	                                <input type="text" name="hkid" class="form-control numberinput textUpper full-control" id="inputTxtAppHkid"
											placeholder="<fmt:message key="flight.details.applicant.hkid.placeholder" bundle="${msg}" />" />
	                                 <span id="errAppHkid" class="text-red"> </span>
	                           </div>
	                       </div>
	                       <!-- id card ends -->
	                       <!-- birthday starts -->
	                       <div class="form-group float">
                               <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                   <label for="applicantDob" class="field-label bold-500">
                                       <fmt:message key="flight.details.applicant.birthday" bundle="${msg}" />
                                   </label>
                               </div>
                               <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                    <div class="input-group date" id="input_dob"> <span class="input-group-addon in border-radius"><img src="<%=request.getContextPath()%>/resources/images/calendar.png" alt=""></span>
					                    <%--<input name="applicantDob" type="text" class="pointer datepicker form-control border-radius" id="applicantDob" value="${corrTravelQuote.trLeavingDate}" readonly>--%>
					                    <input name="applicantDob" type="text" class="pointer datepicker form-control border-radius" id="applicantDob"  readonly>
					                </div>
					                <span id="dobInvalid" class="text-red"></span>
                               </div>
                           </div>
	                       <!-- birthday ends -->
	                       <!-- mobile starts -->
	                       <div class="form-group float">
                               <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                   <label for="inputMobileNo" class="field-label bold-500">
                                       <fmt:message key="flight.details.applicant.mobile" bundle="${msg}" />
                                   </label>
                               </div>
                               <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                    <input type="tel" name="mobileNo" id="inputMobileNo" class="form-control full-control" value="${userDetails.mobileNo.trim()}"
						                <c:choose>
										    <c:when test="${userDetails != null && userDetails.userName != '' && userDetails.userName != '*DIRECTGI'}">
										    readonly="readonly"
										    </c:when>
										</c:choose> maxlength="8" />
						            <span id="mobileNoInvalid" class="text-red"></span>
                               </div>
                           </div>
	                       <!-- mobile ends -->
	                       <!-- email address starts -->
	                       <div class="form-group float">
                               <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                   <label for="inputEmailId" class="field-label bold-500">
                                       <fmt:message key="flight.details.applicant.email" bundle="${msg}" />
                                   </label>
                               </div>
                               <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                   <input type="email" class="form-control full-control textLower"
					                value="${userDetails.emailAddress.trim()}" name="emailAddress" id="inputEmailId"
					                <c:choose>
										    <c:when test="${userDetails != null && userDetails.userName != '' && userDetails.userName != '*DIRECTGI'}">
										    readonly="readonly"
										    </c:when>
										</c:choose>
					                maxlength="50" />
					                <span id="emailid" class="text-red"></span>
                               </div>
                           </div>
	                       <!-- email address ends -->
                       </div>
                       <!-- updated responsive design end -->
                       <%-- commented HTML has been moved to "flight-plan-details-temp0.jsp" --%>
                        <% if (authenticate.equals("false") || authenticate.equals("direct")) { %>
                        <div class="gray-bg3-wid container membership-wrap" style="padding-top: 20px;padding-left:0px;padding-right:0px;">
                            <div class="form-wrap">
                            <div class="membership-header">
                                <h3 class="bmg-membership-header"><fmt:message key="flight.details.registration.heading" bundle="${msg}" /></h3>
	                            <i class="text-grey"><fmt:message key="flight.details.registration.desc" bundle="${msg}" /></i>
                                <h3 id="error_hide" class="error-hide" style='display:none; color:red; font-size:15px;'></h3>
                            </div>
                            <div class="form-group float row">
							   <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12">
							       <label for="inputFullName" class="field-label bold-500">
							           <fmt:message key="flight.details.registration.username" bundle="${msg}" />
							       </label>
							   </div>
							   <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12">
							       <input type="text" name="userName" class="form-control full-control input-white" id="Username">
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
                                   <input type="password" class="form-control full-control input-white" name="password" id="Password">
                                   <span id="PasswordError" class="text-red"></span>
                               </div>
                            </div>
                            <div class="form-group float row">
                               <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12">
                                   <label for="inputEmail3" class="field-label bold-500">
                                        <fmt:message key="flight.details.registration.confirmPassword" bundle="${msg}" />
                                   </label>
                               </div>
                               <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12">
                                   <input type="password" class="form-control full-control input-white" name="passwordConfirm" id="Confirm-Password">
                                   <span id="Confirm-PasswordError" class="text-red"></span>
                               </div>
                            </div>
                            </div>
                        </div>
                        <%-- commented HTML has been moved to "flight-plan-details-temp5.jsp" --%>
                        <input type="hidden" id="applicantRelationship" value="SE">
                        <input type="hidden" id="isLogin" value="false">
                        <% } else { %>
                        <input type="hidden" id="isLogin" value="true">
                        <% } %>
                        <div class="clearfix"></div>
                        <div class="form-wrap">
                            <div class="big-title black-bold" style="padding-left:0px !important;">
                                <fmt:message key="flight.details.insured.heading" bundle="${msg}" />
                            </div>
                        </div>

                        <!-- Dynamic Loops -->
                        <!-- <div class="col-xs-12 col-sm-12 col-md-12 pad-none insure-travel"> -->
                            <!-- Personal -->

                            <input type="hidden" name="totalPersonalTraveller"
                                id="totalPersonalTraveller" value="${planDetailsForm.totalPersonalTraveller}">
                            <c:forEach var="inx" begin="1" end="${planDetailsForm.totalPersonalTraveller}">
                                <div class="form-wrap">
                                <div class="personaltraveller">
                                    <h4 class="bold big-title" style="padding-left:0px !important;">
                                       <fmt:message key="flight.details.insured.label.personal"
                                           bundle="${msg}" />
                                       <c:out value="${inx}"></c:out>
                                       <c:if test="${inx == 1}"><fmt:message key="flight.details.insured.firstinsuredhint" bundle="${msg}" /></c:if>
                                    </h4>
                                    <div>
                                       <!-- english name start -->
			                           <div class="form-group float">
			                               <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
			                                   <label for="txtInsuFullName${inx}" class="field-label bold-500">
			                                       <fmt:message key="flight.details.insured.name" bundle="${msg}" />
			                                   </label>
			                               </div>
			                               <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
			                                   <c:if test="${inx == 1}">
                                                        <input
                                                        type="text" name="personalName${inx}" id="txtInsuFullName${inx}"
                                                        class="form-control full-control textUpper"
                                                        <c:choose>
														    <c:when test="${userDetails != null && userDetails.fullName != '' && userDetails.fullName != '*DIRECTGI'}">
														    value="${userDetails.fullName }"
														    </c:when>
														</c:choose>
														placeholder="<fmt:message key="flight.details.insured.name.placeholder" bundle="${msg}" />" />
	                                          </c:if>
	                                          <c:if test="${inx > 1}">
                                                        <input
                                                        type="text" name="personalName${inx}" id="txtInsuFullName${inx}"
                                                        class="form-control full-control textUpper" placeholder="<fmt:message key="flight.details.insured.name.placeholder" bundle="${msg}" />" />
                                                    </c:if>
                                                    <span id="errtxtPersonalFullName${inx}" class="text-red"> </span>
			                               </div>
			                           </div>
			                           <!-- english name end -->
			                           <!-- id card start -->
                                       <div class="form-group float">
                                           <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                               <label for="txtInsuHkid${inx}" class="field-label bold-500">
                                                   <fmt:message key="flight.details.applicant.hkid" bundle="${msg}" />
                                               </label>
                                           </div>
                                           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                               <input
                                                    id="txtInsuHkid${inx}" name="personalHKID"
                                                    class="form-control textUpper full-control js__fv__input_hkid"
                                                    placeholder="<fmt:message key="flight.details.insured.hkid.placeholder" bundle="${msg}" />" />
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
                                                    name="personalAgeRange${inx}" class="form-control soflow select-label"
                                                    id="selectAgeRange${inx}">
                                                    <c:choose>
                                                        <c:when test="${inx == 1}">
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
                                                        </c:when>
                                                        <c:otherwise>
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
                                                        </c:otherwise>
                                                    </c:choose>

                                                    </select></div><span id="errselectAgeRange${inx}" class="text-red">
                                                    </span>
                                           </div>
                                       </div>
                                       <!-- age end -->
                                       <!-- beneficiary start -->
                                       <div class="form-group float">
                                           <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                               <label class="field-label bold-500">
                                                   <fmt:message key="flight.details.insured.beneficiary" bundle="${msg}" />
                                               </label>
                                           </div>
                                           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                               <div class="styled-select">
                                                <select name="personalBeneficiary${inx}" class="form-control soflow select-label" id="personalselectBenificiary${inx}" onChange="activeDiv('personalbenificiaryId${inx}','personalselectBenificiary${inx}', 'personalBenefitiaryId${inx}', 'personalBenefitiaryHKId${inx}')">
	                                                <option value="SE">
                                                        <fmt:message key="flight.details.insured.beneficiary.default" bundle="${msg}" />
                                                    </option>
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
                                                   <input type="text" name="personalBenificiaryFullName" id="personalBenefitiaryId${inx}" class="form-control full-control textUpper"
                                                   placeholder="<fmt:message key="flight.details.insured.beneficiary.name.placeholder" bundle="${msg}" />" />
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
                                                    <select id="selectPersonalBenefitiaryHkidPass${inx}" class="form-control soflow select-label" name="selectedPersonalBenefitiaryHkidPass"
                                                        placeholder='<fmt:message key="flight.details.insured.beneficiary.hkid.placeholder" bundle="${msg}" />'>
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
                                                   <input id="personalBenefitiaryHKId${inx}" name="personalBenificiaryHkid" class="form-control textUpper full-control"
                                                   placeholder="<fmt:message key="flight.details.insured.beneficiary.hkid.placeholder" bundle="${msg}" />"/>
                                                   <span id="errpersonalBenefitiaryHKId${inx}" class="text-red"> </span>
		                                       </div>
		                                   </div>
		                               </div>
		                               <!-- personalbenificiaryId c end -->

                                    </div>
                                    <%-- commented HTML has been moved to "flight-plan-details-temp1.jsp" --%>
                                    <input id="personalBenefitiaryRelation${inx}" type="hidden" name="personalBenificiaryRelationship" class="form-control" value="" />
                                </div>
                                </div>
                            </c:forEach>

                            <!-- adult  -->
                            <input type="hidden" name="totalAdultTraveller" id="totalAdultTraveler" value="${planDetailsForm.totalAdultTraveller}">
                            <c:forEach var="inx" begin="1" end="${planDetailsForm.totalAdultTraveller}">
                                <div class="form-wrap">
                                <div class="adulttraveller">
                                    <h4 class="bold big-title" style="padding-left:0px !important;">
                                        <fmt:message key="flight.details.insured.label.family.parent" bundle="${msg}" />
                                        <c:out value="${inx}"></c:out>
                                        <c:if test="${inx == 1}"><fmt:message key="flight.details.insured.firstinsuredhint" bundle="${msg}" /></c:if>
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
                                                        <input type="text" name="adultName${inx}" id="txtInsuFullName${inx}"
                                                        class="form-control full-control textUpper <c:if test="${!(userDetails != null && userDetails.fullName != '' && userDetails.fullName != '*DIRECTGI')}">bmg_custom_placeholder</c:if>"
                                                        <c:choose>
														    <c:when test="${userDetails != null && userDetails.fullName != '' && userDetails.fullName != '*DIRECTGI'}">
														    value="${userDetails.fullName }"
														    </c:when>
														    <c:otherwise>
	                                                        value="<fmt:message key="flight.details.insured.name.placeholder" bundle="${msg}" />"
				                                            </c:otherwise>
														</c:choose>
                                                        />
                                               </c:if>
                                               <c:if test="${inx > 1}">
                                                        <input type="text" name="adultName${inx}" id="txtInsuFullName${inx}"
                                                        class="form-control full-control textUpper"
                                                        value="<fmt:message key="flight.details.insured.name.placeholder" bundle="${msg}" />" />
                                                    </c:if>
                                                    <span id="errtxtAdFullName${inx}" class="text-red"> </span>
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
                                               <!-- onkeyup="value=value.replace(/[\W]/g,'')" -->
                                               <input id="txtInsuHkid${inx}" name="adultHKID"
                                                    class="form-control textUpper full-control js__fv__input_hkid" placeholder="<fmt:message key="flight.details.insured.hkid.placeholder" bundle="${msg}" />"/>
                                                    <span id="errtxtInsuHkid${inx}" class="text-red"> </span>
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
                                                        name="adultAgeRange${inx}" class="form-control soflow select-label"
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
                                                    </select>
                                                </div>
                                                <span id="errselectAgeRange${inx}" class="text-red"></span>
                                           </div>
                                       </div>
                                       <!-- age end -->
                                       <!-- beneficiary start -->
                                       <div class="form-group float">
                                           <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                               <label class="field-label bold-500">
                                                   <fmt:message key="flight.details.insured.beneficiary" bundle="${msg}" />
                                               </label>
                                           </div>
                                           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                               <div class="styled-select">
                                                   <select name="adultBeneficiary" class="form-control soflow select-label" id="adultsselectBenificiary${inx}" onChange="activeDiv('adultsbenificiaryId${inx}','adultsselectBenificiary${inx}', 'adultBenefitiaryId${inx}', 'adultBenefitiaryHKId${inx}')">
    	                                                <option value="SE">
                                                            <fmt:message key="flight.details.insured.beneficiary.default" bundle="${msg}" />
                                                        </option>
                                                   </select>
                                                </div>
                                                <span id="erradultsselectBenificiary${inx}" class="text-red"></span>
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
                                                   <input type="text" name="adultBenificiaryFullName"
                                                        id="adultBenefitiaryId${inx}" class="form-control full-control textUpper"
                                                        placeholder="<fmt:message key="flight.details.insured.beneficiary.name.placeholder" bundle="${msg}" />" />
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
                                                    <select id="selectAdBenefitiaryHkidPass${inx}" class="form-control soflow select-label" name="selectedAdBenefitiaryHkidPass"
                                                    placeholder='<fmt:message key="flight.details.insured.beneficiary.hkid.placeholder" bundle="${msg}" />'>
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
                                                  <input id="adultBenefitiaryHKId${inx}" name="adultBenificiaryHkid" class="form-control textUpper full-control"
                                                    placeholder="<fmt:message key="flight.details.insured.beneficiary.hkid.placeholder" bundle="${msg}" />" />
                                                    <span id="erradultBenefitiaryHKId${inx}" class="text-red"> </span>
                                               </div>
                                           </div>
                                       </div>
                                       <!-- adult beneficiary c end -->
                                    </div>
                                    <%-- commented HTML has been moved to "flight-plan-details-temp2.jsp" --%>
                                    <input id="adultBenefitiaryRelation${inx}" type="hidden" name="adultBenificiaryRelationship" class="form-control" value="" />
                                </div>
                                </div>
                            </c:forEach>

                            <!-- child  -->
                            <input type="hidden" name="totalChildTraveller"
                                value="${planDetailsForm.totalChildTraveller}" id="totalCountOfChild">
                            <c:forEach var="inx" begin="1" end="${planDetailsForm.totalChildTraveller}">
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
                                                   type="text" name="childName${inx}" id="txtChldFullName${inx}"
                                                   class="form-control full-control textUpper"
                                                   value="<fmt:message key="flight.details.insured.name.placeholder" bundle="${msg}" />" />
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
                                               <input id="txtChldInsuHkid${inx}" name="childHKID" class="form-control textUpper full-control js__fv__input_hkid"
                                               placeholder="<fmt:message key="flight.details.insured.hkid.placeholder" bundle="${msg}" />"/>
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
                                                    <select name="childAgeRange${inx}" class="form-control soflow select-label"
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
                                                       class="form-control soflow select-label">
                                                        <option value="SE"><fmt:message
														key="flight.details.insured.beneficiary.default"
														bundle="${msg}" /></option>


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
                                                   <input type="text" name="childBenificiaryFullName" id="childBenefitiaryName${inx}" class="form-control full-control textUpper"
                                                   placeholder="<fmt:message key="flight.details.insured.beneficiary.name.placeholder" bundle="${msg}" />" />
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
                                                    <select id="selectChldBenefitiaryHkidPass${inx}" class="form-control soflow select-label" name="SelectedChldBenefitiaryHkidPass"
                                                    placeholder='<fmt:message key="flight.details.insured.beneficiary.hkid.placeholder" bundle="${msg}" />'>
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
                                                   <input id="txtchildInsuHkid${inx}" name="childBenificiaryHkid" class="form-control textUpper full-control"
                                                   placeholder="<fmt:message key="flight.details.insured.beneficiary.hkid.placeholder" bundle="${msg}" />" />
                                                   <span id="errtxtchildInsuHkid${inx}" class="text-red"> </span>
                                               </div>
                                           </div>
                                       </div>
                                       <!-- child beneficiary c end -->
                                    </div>
                                </div>
                                <%-- commented HTML has been moved to "flight-plan-details-temp3.jsp" --%>
                                </div>
                            </c:forEach>

                            <input type="hidden" name="totalOtherTraveller"
                                value="${planDetailsForm.totalOtherTraveller}" id="totalCountOther">

                            <c:forEach var="inx" begin="1" end="${planDetailsForm.totalOtherTraveller}">
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
                                               <input type="text" name="otherName${inx}" id="txtOtherFullName${inx}"
                                                    class="form-control full-control textUpper"
                                                    value="<fmt:message key="flight.details.insured.name.placeholder" bundle="${msg}" />" />
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
                                               <input id="txtOtherInsuHkid${inx}" name="otherHKID" class="form-control textUpper full-control js__fv__input_hkid"
                                               placeholder="<fmt:message key="flight.details.insured.hkid.placeholder" bundle="${msg}" />"/>
                                               <span id="errtxtOtherInsuHkid${inx}" class="text-red"></span>
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
                                                    <select name="otherAgeRange${inx}" class="form-control soflow select-label"
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
		                                                        <option value="SE"><fmt:message
																key="flight.details.insured.beneficiary.default"
																bundle="${msg}" /></option>
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
                                                   <input type="text" name="otherBenificiaryFullName" id="otherBenefitiaryName${inx}" class="form-control full-control textUpper" />
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
                                                    <select id="selectOtherBenefitiaryHkidPass${inx}" class="form-control soflow select-label" name="selectedOtherBenefitiaryHkidPass"
                                                    placeholder='<fmt:message key="flight.details.insured.beneficiary.hkid.placeholder" bundle="${msg}" />'>
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
                                                   <input id="txtOtherBenInsuHkid${inx}" name="otherBenificiaryHkid" class="form-control textUpper full-control"
                                                   placeholder="<fmt:message key="flight.details.insured.beneficiary.hkid.placeholder" bundle="${msg}" />" />
                                                   <span id="errtxtOtherBenInsuHkid${inx}" class="text-red"> </span>
                                               </div>
                                           </div>
                                       </div>
                                       <!-- other beneficiary c end -->
                                     </div>
                                  </div>
                                  <%-- commented HTML has been moved to "flight-plan-details-temp4.jsp" --%>
                                </div>
                            </c:forEach>
                            <!--Till this Line  -->

                        <div class="clearfix"></div>

                        <div class="form-wrap">
                            <h4 class="h4-2 bmg-disclaimer-header">
                                <fmt:message key="flight.details.declarations.heading" bundle="${msg}" />
                            </h4>
                            <div class="declaration-content" style="margin-left: 0px;margin-right: 0px;">
                            <div class="checkbox form-group">
                                <input id="checkbox1" name="checkbox1" type="checkbox">
                                <label for="checkbox1">
                                    <fmt:message key="flight.details.declarations.tnc" bundle="${msg}" />
                                    <ol class="ol-disclaimer">
                                        <li><fmt:message key="flight.details.declarations.tnc.desc1" bundle="${msg}" /></li>
                                        <li><fmt:message key="flight.details.declarations.tnc.desc2" bundle="${msg}" /></li>
                                        <li><fmt:message key="flight.details.declarations.tnc.desc3" bundle="${msg}" /></li>
                                        <li><fmt:message key="flight.details.declarations.tnc.desc4" bundle="${msg}" /></li>
                                        <li><fmt:message key="flight.details.declarations.tnc.desc5" bundle="${msg}" /></li>
                                    </ol>
                                </label>
                                <span id="chk1" class="text-red"> </span>
                            </div>

                            <div class="checkbox form-group">
                                <input id="checkbox2" name="checkbox2" type="checkbox">
                                <label for="checkbox2">
                                    <fmt:message key="flight.details.declarations.PICS.part1" bundle="${msg}" />
                                    <a href="<fmt:message key="PICS.link" bundle="${msg}" />" target="_blank" class="sub-link">
                                        <fmt:message key="flight.details.declarations.PICS.part2" bundle="${msg}" />
                                    </a>
                                    <fmt:message key="flight.details.declarations.PICS.part3" bundle="${msg}" />
                                    <br>
                                </label>
                                <span id="chk2" class="text-red"> </span>
                            </div>

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
                                            <div class="flightcare-hk" style="font-weight: bold;font-size: 28px;"></div> -->
                                        </div>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
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
               <input name="departureDate" type="text" class="datepicker form-control border-radius" id="txtStartDateDesk" value="${planDetailsForm.departureDate}" readonly>
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
                        <div class="input-group date">
                            <span class="input-group-addon in border-radius">
                                <img src="<%=request.getContextPath()%>/resources/images/calendar.png" alt="">
                            </span>
                            <input name="returnDate" type="text" class="datepicker form-control border-radius" id="txtEndDateDesk"  value="${planDetailsForm.returnDate}" readonly>
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
                                    <c:if test="${planDetailsForm.totalAdultTraveller !=0 }">
                                        <fmt:message key="flight.sidebar.summary.label.family.parent" bundle="${msg}" />: ${planDetailsForm.totalAdultTraveller} <br>
                                    </c:if>
                                    <c:if test="${planDetailsForm.totalChildTraveller !=0 }">
                                        <fmt:message key="flight.sidebar.summary.label.family.child" bundle="${msg}" />: ${planDetailsForm.totalChildTraveller} <br>
                                    </c:if>
                                    <c:if test="${planDetailsForm.totalOtherTraveller !=0}">
                                        <fmt:message key="flight.sidebar.summary.label.family.others" bundle="${msg}" />: ${planDetailsForm.totalOtherTraveller} <br>
                                    </c:if>
                                    <c:if test="${planDetailsForm.totalPersonalTraveller !=0}">
                                        <fmt:message key="flight.sidebar.summary.label.personal" bundle="${msg}" />: ${planDetailsForm.totalPersonalTraveller}</c:if>
                                </h4>
                                <input type="hidden" name="otherInput" value="${planDetailsForm.totalOtherTraveller}">
                                <input type="hidden" name="childInput" value="${planDetailsForm.totalChildTraveller}"> <br>
                                <input type="hidden" name="days" value="${planDetailsForm.days}">
                                <h3 class="txt-bold">
                                    <fmt:message key="flight.details.summary.option4" bundle="${msg}" />
                                    <span>${planDetailsForm.days}</span>
                                    <fmt:message key="flight.details.summary.option5" bundle="${msg}" />
                                </h3>
                                </div>
                            </div>
                            <div class="orange-bdr"></div>
                            <div class="clearfix"></div>
                            <%-- <h3 class="h4-1-orange-b col-lg-6 col-md-6">Amount due</h3> --%>
                            <%-- <h3 class="h4-1-orange-b col-lg-6 col-md-6 text-right">${planDetailsForm.getTotalDue()}&nbsp;</h3> --%>

                        <!--mob-hidden-->
                        </div>
                        <div class="hidden-sm hidden-xs">
                        <div style="width: 80%;margin-left: 10%;">
                            <div class="top35 pull-left pad-none" style="width:47%">
                                 <a class="bdr-curve btn btn-primary bck-btn" onclick="perventRedirect=false;BackMe();">
                                     <fmt:message key="flight.details.action.back" bundle="${msg}" />
                                 </a>
                            </div>
                            <div class="top35 pull-right pad-none" style="width:47%">
                                <c:choose>
                                    <c:when test="${language=='en'}">
                                   	<button type="submit" onclick="javascript:kenshoo_conv('Registration_Step2','','','Regis_Flight_Step2 EN','USD');"
                                        class="bdr-curve btn btn-primary nxt-btn"/><fmt:message key="flight.details.action.next" bundle="${msg}" />
                                    </button>
                                   </c:when>
                                   <%-- <c:otherwise>
                                    <button type="submit" onclick="javascript:kenshoo_conv('Registration_Step2','','','Regis_Flight_Step2 ZH','USD');"
                                        class="bdr-curve btn btn-primary nxt-btn"/><fmt:message key="flight.details.action.next" bundle="${msg}" />
                                    </button>
                                </c:otherwise> --%>
                               </c:choose>
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
                    <fmt:message key="flight.details.other.disclaimer.part1" bundle="${msg}" />
                    <a class="sub-link" href="https://home.fwd.com.hk/gidoc/policyprovisions/FlightCare_JacketLatest.pdf" target="_blank">
                        <fmt:message key="flight.details.other.disclaimer.part2" bundle="${msg}" /></a>
                    <fmt:message key="flight.details.other.disclaimer.part3" bundle="${msg}" />
                    <br>
                    <fmt:message key="flight.details.other.disclaimer.part4" bundle="${msg}" />
                </p>

                <div class="col-xs-12 hidden-md hidden-lg pad-none">
				   <div style="width: 80%;margin-left: 10%;  margin-bottom: 50px;">
				        <div class="top35 pull-left pad-none" style="width:47%">
				            <a class="bdr-curve btn btn-primary bck-btn" onclick="perventRedirect=false;BackMe();"><fmt:message key="flight.details.action.back" bundle="${msg}" /> </a>
				        </div>
				        <div class="top35 pull-right pad-none" style="width:47%">
							<c:choose>
                                <c:when test="${language=='en'}">
                                    <input type="button" class="bdr-curve btn btn-primary nxt-btn" value="<fmt:message key="flight.details.action.next" bundle="${msg}" />" onclick="javascript:kenshoo_conv('Registration_Step2','','','Regis_Flight_Step2 EN','USD');return fwdUtility.pages.flightCare.activateUserAccountJoinUs();" />
                                </c:when>
                                <c:otherwise>
                                    <input type="button" onclick="javascript:kenshoo_conv('Registration_Step2','','','Regis_Flight_Step2 ZH','USD');return fwdUtility.pages.flightCare.activateUserAccountJoinUs();" class="bdr-curve btn btn-primary nxt-btn" value="<fmt:message key="flight.details.action.next" bundle="${msg}" />" />
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

<!--------/end- Main Content------------>

<!--Plan-login-popup-->



<div class="scroll-to-top">
    <a title="Scroll to top" href="#">
        <img src="<%=request.getContextPath()%>/resources/images/up-arrow.png" alt="Scroll to top"  />
    </a>
</div>

<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/common/formvalidation/helpers.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/common/formvalidation/validators.custom-rule.config.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/common/formvalidation/validators.flightCare.config.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/common/formvalidation/init.js" charset="utf-8"></script>

<script>
$(function() {
	//console.log(fvConfig);
    fwdUtility.ux.floatingBox();
    // fwdUtility.temp.flightCare(); // Phase 2 may required
    // JSP values "landing-place"
          
    var flightCfg = initFVConfig(fvConfig).flightCare();
    runFV(flightCfg).flightCare(fvConfig);

	/*var appRelationship = $("#applicantRelationship").val();
	var formId = fvConfig.pageAutoConfig.form[0].id;    
    
	var insureFieldInfo = { 'inputBoxId': 'txtInsuFullName1' , 'errMsgDOMId': 'errtxtPersonalFullName1' };
	var insureFieldInfo2 = { 'inputBoxId': 'txtInsuHkid1' , 'errMsgDOMId': 'errtxtInsuHkid1' };    
    
	if ( fvConfig.flightJSPcbInfo.counter.personalPlan === 0 ) {        // Do Family-plan below, IF fvConfig.flightJSPcbInfo.counter.personalPlan === 0
		formInfo_fullname = { 'inputId': 'inputFullName', 'revalidateFieldName': 'adultName1' };
		formInfo_hkid = { 'inputId': 'inputTxtAppHkid', 'revalidateFieldName': 'adultHKID1' };
	} else {                                                            // Do Personal-plan below
		formInfo_fullname = { 'inputId': 'inputFullName', 'revalidateFieldName': 'personalName1' };
		formInfo_hkid = { 'inputId': 'inputTxtAppHkid', 'revalidateFieldName': 'personalHKID1' };
	}*/   
});
</script>
