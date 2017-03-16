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
    //System.out.println("------------------------------------------------------------");     
    //System.out.println( "sess Personal: " + sessTravelQuoteBean.getTotalPersonalTraveller() );
    //System.out.println( "sess Adult   : " + sessTravelQuoteBean.getTotalAdultTraveller() );
    //System.out.println( "sess Child   : " + sessTravelQuoteBean.getTotalChildTraveller() );
    //System.out.println( "sess Others  : " + sessTravelQuoteBean.getTotalOtherTraveller() );
    //System.out.println("------------------------------------------------------------");

    request.setAttribute("travelQuote", sessTravelQuoteBean);
%>
<!-- for debug
    $TravelQuote                                            <br>
    Peronsal : ${travelQuote.getTotalPersonalTraveller()}   <br>
    Adult    : ${travelQuote.getTotalAdultTraveller()}      <br>
    Child    : ${travelQuote.getTotalChildTraveller()}      <br>
    Ohters   : ${travelQuote.getTotalOtherTraveller()}      <br>
 -->


<!--/#main-Content-->


 
<!-- 

action="${pageContext.request.contextPath}/${language}/travel-insurance/travel-summary" method="post"  
-->


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
var appMobilePlaceholder = "";
var appEmailPlaceholder = "";

var insureNamePlaceholder="<fmt:message key="travel.details.insured.name.placeholder" bundle="${msg}" />";
var insureHkidPlaceholder="<fmt:message key="travel.details.insured.hkid.placeholder" bundle="${msg}" />";

var benNamePlaceholder="<fmt:message key="travel.details.insured.beneficiary.name.placeholder" bundle="${msg}" />";
var benHkidPlaceholder="<fmt:message key="travel.details.insured.beneficiary.hkid.placeholder" bundle="${msg}" />";
    

</script>

<script>
function activateUserAccountJoinUs() {
	perventRedirect=false;
    $('#loading-overlay').modal({backdrop: 'static',keyboard: false});
    
    setTimeout(function(){
    	if(tPlanValid()) {
		    $('#frmYourDetails').submit();
    	}
	}, 500);
}
</script>

<section class="product_header_path_container ">
    <div class="container">
        <div class="product_header_path_item back"><i class="fa fa-arrow-left"></i><div class="partition"></div></div>
        <div class="product_header_path_item hidden-sm hidden-xs"><fmt:message key="annual.title.planoption" bundle="${msg}" /></div>
        <div class="product_header_path_item active"><fmt:message key="annual.title.application" bundle="${msg}" /></div>
        <div class="product_header_path_item hidden-sm hidden-xs"><fmt:message key="annual.title.payment" bundle="${msg}" /><div class="partition"></div></div>
        <div class="product_header_path_item hidden-sm hidden-xs"><fmt:message key="annual.title.confirmation" bundle="${msg}" /></div>
    </div>
</section>

<section>
    <div id="cn" class="container">
        <div class="row">
            <form:form name="frmYourDetails" id="frmYourDetails" modelAttribute="frmYourDetails" method="post" action="${pageContext.request.contextPath}/${language}/travel-insurance/travel-summary" >
                <ol class="breadcrumb pad-none">
                    <li><fmt:message key="travel.breadcrumb1.item1" bundle="${msg}" /><i class="fa fa-caret-right"></i></li>
                    <li><fmt:message key="home.breadcrumb1.type1" bundle="${msg}" /><i class="fa fa-caret-right"></i></li>
                    <li><fmt:message key="travel.breadcrumb1.item2" bundle="${msg}" /></li>
                    <li class="active "><i class="fa fa-caret-right"></i><fmt:message key="travel.breadcrumb1.item4" bundle="${msg}" /></li>
                </ol>
                <%
                    if (authenticate.equals("false") || "direct".equalsIgnoreCase(request.getSession()
                        .getAttribute("authenticate").toString())) {
                %>
                <div class="product_plan_details_member_title white-bg1">
                    <h3 class="pull-left h2-3-existing-fwd-head bmg-detail-exist-member-head">
                    <fmt:message key="travel.details.login" bundle="${msg}" />
                    <a class="tool-tip show-inline-md"
                    data-toggle="tooltip" data-placement="bottom"
                    title="<fmt:message key="member.account.login.help" bundle="${msg}" />">
                    <img src="<%=request.getContextPath()%>/resources/images/ic.png"
                    alt=""></a>
                    </h3>
                    <div class="pull-left">
                        <a href="#" class="pull-left btn-box-2 color4 login-btn" data-toggle="modal" data-target="#loginpopup"><fmt:message key="travel.details.login.action" bundle="${msg}" /></a>    
                        <div class="pull-left text-left">
                            <h3 class="text-left or-continue">
                                <span style="margin-left:10px;margin-right:10px;"><fmt:message key="travel.details.login.other.part1" bundle="${msg}" /></span>
                                <fmt:message key="travel.details.login.other.part2" bundle="${msg}" />
                            </h3>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <%
                    }
                %>
                <div id="quote-wrap" class="container pad-none bdr ur-opt-content gray-bg3">
                    <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 pad-none white-bg1">
                        <br/>
                        <!-- <div class="gray-bdr"></div> -->
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
                                   <!-- <input type="text" name="fullName"
                                        class="form-control full-control textUpper" id="inputFullName"
                                        value="${userDetails.fullName}"
                                        onblur="replaceAlpha(this); validateName('inputFullName','fullnameinvalid',true,'applicant');"
                                        onkeypress="return alphaOnly(event);" maxlength="50" <c:if test="${authenticate == 'true'}">readonly="readonly"</c:if> />-->
                                   <input type="text" name="fullName"
                                        class="js-field-fullname form-control full-control textUpper <c:if test="${!(userDetails != null && userDetails.fullName != '' && userDetails.userName != '*DIRECTGI')}">bmg_custom_placeholder</c:if>" id="inputFullName"
                                        <c:choose>
										    <c:when test="${userDetails != null && userDetails.fullName != '' && userDetails.userName != '*DIRECTGI'}">
										    value="${userDetails.fullName }" readonly="readonly"
										    </c:when>
										    <c:otherwise>
                                            value="<fmt:message key="travel.details.applicant.name.placeholder" bundle="${msg}" />"
                                            </c:otherwise>
										</c:choose>
	                                    onfocus="placeholderOnFocus(this,'<fmt:message key="travel.details.applicant.name.placeholder" bundle="${msg}" />');" 
	                                    onblur="placeholderOnBlur(this,'<fmt:message key="travel.details.applicant.name.placeholder" bundle="${msg}" />'); validateName('inputFullName','fullnameinvalid',true,'applicant');"
                                        onkeypress="return alphaOnly(event);" maxlength="50" />
                                    <span id="fullnameinvalid" class="text-red"></span>
                               </div>
                           </div>
                           <!-- english name end -->
                           <!-- id card starts -->
                           <div class="form-group float">
                               <div class="field-label form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                <label class="field-label bold-500">
                                    <fmt:message key="travel.details.insured.beneficiary.hkid.option1" bundle="${msg}" />
                                    <input type="hidden" name="selectedHkidPassApplicant" id="selectHkidPass" value="HKID" />
                                </label>
                               </div>
                               <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                   <input type="text" name="hkid" class="js-field-hkid form-control numberinput textUpper full-control bmg_custom_placeholder" id="inputTxtAppHkid" 
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
                                        class="js-field-mobile field-label bold-500"><fmt:message key="travel.details.applicant.mobile" bundle="${msg}" /></label>
                               </div>
                               <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                    <input name="mobileNo" type="tel"
                                        class="form-control full-control" value="${userDetails.mobileNo.trim()}"
                                        id="inputMobileNo"
                                        <c:choose>
										    <c:when test="${userDetails != null && userDetails.userName != '' && userDetails.userName != '*DIRECTGI'}">
										    readonly="readonly"
										    </c:when>
										</c:choose>
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
                                        <c:choose>
										    <c:when test="${userDetails != null && userDetails.userName != '' && userDetails.userName != '*DIRECTGI'}">
										    readonly="readonly"
										    </c:when>
										</c:choose>
                                        maxlength="50" onblur="validateEmail('inputEmailId','emailid');" > <span id="emailid" class="text-red"></span>
                               </div>
                           </div>
                           <!-- email address ends -->
                         </div>
                         <!-- updated responsive design end -->
                        <%-- <table class="table activation-form margin-left-2 vert-middle">
                            <tbody>
                                <tr>
                                    <td colspan="2"><h3
                                            class="black-bold"><fmt:message key="travel.details.applicant.heading" bundle="${msg}" /></h3></td>
                                </tr>
                                <tr>
                                    <td valign="middle" class="col-lg-5 col-md-5 col-sm-5 col-xs-4"><label
                                        for="inputFullName" class="bold-500"><fmt:message key="travel.details.applicant.name" bundle="${msg}" /></label></td>
                                    <td><input type="text" name="fullName"
                                        class="form-control full-control" id="inputFullName"
                                        value="${userDetails.getFullName()}"
                                        placeholder="<fmt:message key="travel.details.applicant.name.placeholder" bundle="${msg}" />" onblur="replaceAlpha(this); validateName('inputFullName','fullnameinvalid',true,'applicant');"
                                        onkeypress="return alphaOnly(event);" maxlength="100" />
                                    <span id="fullnameinvalid" class="text-red">
                                    </span></td>
                                </tr>
                                <tr>
                                    <td valign="middle">
                                    <div class="styled-select custom-select-label">
                                        <select id="selectHkidPass"
                                            name="selectedHkidPassApplicant" onchange="selected(this)"
                                            class="form-control soflow select-label">
                                            <c:forEach var="hkidList"
                                                items="${mapHkId}">
                                                <option
                                                    value="${hkidList.key}">
                                                    <c:out
                                                        value="${hkidList.value}" />
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </div>

                                    </td>
                                    <td>
                                       <input type="text" name="hkid" class="form-control numberinput textUpper full-control" id="inputTxtAppHkid" placeholder="<fmt:message key="travel.details.applicant.hkid.placeholder" bundle="${msg}" />" onkeyup="hkidValid(this)" onblur="validateHkid('inputTxtAppHkid','selectHkidPass','errAppHkid',true,'applicant');"/>
                                       <span id="errAppHkid" class="text-red" ></span>
                                    </td>
                                </tr>
                                <!-- Birthday starts -->
                                <tr>
                                    <td valign="middle"><label for="inputApplicantDob"
                                        class="bold-500"><fmt:message key="travel.details.applicant.birthday" bundle="${msg}" /></label></td>
                                    <td>
                                        <div class="input-group date" id="input_dob"> <span class="input-group-addon in border-radius"><img src="<%=request.getContextPath()%>/resources/images/calendar.png" alt=""></span>
                                            <input name="applicantDob" type="text"  class="pointer datepicker form-control border-radius" id="applicantDob" value="${corrTravelQuote.getTrLeavingDate()}" readonly>
                                        </div>
                                        <span id="dobInvalid" class="text-red"></span>           
                                    </td>
                                </tr>
                                <!-- Birthday ends -->
                                <tr>
                                    <td valign="middle"><label for="inputMobileNo"
                                        class="bold-500"><fmt:message key="travel.details.applicant.mobile" bundle="${msg}" /></label></td>
                                    <td><input name="mobileNo" type="text"
                                        class="form-control full-control" value="${userDetails.getMobileNo().trim()}"
                                        id="inputMobileNo" placeholder="<fmt:message key="travel.details.applicant.mobile.placeholder" bundle="${msg}" />"
                                        onkeypress="return isNumeric(event)"
                                        onblur="replaceNumeric(this); validateMobile('inputMobileNo','errMobileNo');" maxlength="8" /> 
                                    <span id="errMobileNo" class="text-red">
                                    </span></td>
                                </tr>
                                <tr>
                                    <td valign="middle"><label for="inputEmailId"
                                        class="bold-500"><fmt:message key="travel.details.applicant.email" bundle="${msg}" /></label></td>
                                    <td><input class="form-control full-control" name="emailAddress"
                                        value="${userDetails.getEmailAddress().trim()}" id="inputEmailId"
                                        placeholder="<fmt:message key="travel.details.applicant.email.placeholder" bundle="${msg}" />" maxlength="50" onblur="validateEmail('inputEmailId','emailid');"> <span id="emailid" class="text-red"></span></td>
                                </tr>
                            </tbody>
                        </table> --%>
                        
                        <div class="clearfix"></div>
                        <div class="form-wrap">
                            <div class="big-title black-bold" style="padding-left:0px !important;">
                                <fmt:message key="flight.details.insured.heading" bundle="${msg}" />
                            </div>
                        </div>
                        


                       <!--  <div class="col-xs-12 col-sm-12 col-md-12 pad-none insure-travel">
                        	<h3 class="black-bold pad-none margin-left-28">
	                           <fmt:message key="flight.details.insured.heading" bundle="${msg}" />
	                           <br>
	                       </h3> -->
                        
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
                                                  <!-- <input type="text"
                                                        id="txtInsuFullName${inx}" name="personalName" value="${userDetails.fullName}"
                                                        class="form-control full-control textUpper" 
                                                        onblur="replaceAlpha(this); validateName('txtInsuFullName${inx}','errtxtPersonalFullName${inx}',false,'insured');"
                                                        onkeypress="return alphaOnly(event);" maxlength="100" readonly="readonly"/> -->
                                                  <input type="text"
                                                        id="txtInsuFullName${inx}" name="personalName"
                                                        class="js-field-fullname form-control full-control textUpper <c:if test="${!(userDetails != null && userDetails.userName != '' && userDetails.userName != '*DIRECTGI')}">bmg_custom_placeholder</c:if>" 
                                                        <c:choose>
														    <c:when test="${userDetails != null && userDetails.userName != '' && userDetails.userName != '*DIRECTGI'}">
														    value="${userDetails.fullName }"
														    </c:when>
														    <c:otherwise>
	                                                        value="<fmt:message key="travel.details.insured.name.placeholder" bundle="${msg}" />"
				                                            </c:otherwise>
														</c:choose>
                                                        
		                                                onfocus="placeholderOnFocus(this,'<fmt:message key="travel.details.insured.name.placeholder" bundle="${msg}" />');" 
		                                                onblur="placeholderOnBlur(this,'<fmt:message key="travel.details.insured.name.placeholder" bundle="${msg}" />'); validateName('txtInsuFullName${inx}','errtxtPersonalFullName${inx}',false,'insured');"
                                                        onkeypress="return alphaOnly(event);" maxlength="100" readonly="readonly"/>
                                                </c:if>
                                                <c:if test="${inx > 1}">
                                                    <!-- <input type="text"
                                                        id="txtInsuFullName${inx}" name="personalName" value=""
                                                        class="form-control full-control textUpper" 
                                                        onblur="replaceAlpha(this); validateName('txtInsuFullName${inx}','errtxtPersonalFullName${inx}',false,'insured');"
                                                        onkeypress="return alphaOnly(event);" maxlength="100"/> -->
                                                    <input type="text"
                                                        id="txtInsuFullName${inx}" name="personalName"
                                                        class="js-field-fullname form-control full-control textUpper bmg_custom_placeholder" 
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
                                               <c:if test="${inx == 1}">
                                                   <label class="field-label bold-500"><fmt:message key="travel.details.insured.beneficiary.hkid.option1" bundle="${msg}" /></label>
                                                   <input id="selectedPersonalHkidPass${inx}" name="selectedPersonalHkidPass" value="HKID" type="hidden" />
                                               </c:if>
                                               <c:if test="${inx > 1}">
                                                   <div class=" bmg-label-styled-select styled-select">
                                                       <select id="selectedPersonalHkidPass${inx}" class="form-control soflow select-label" name="selectedPersonalHkidPass" onchange="togglePlaceholder(this,'txtInsuHkid${inx}','<fmt:message key="travel.details.insured.hkid.placeholder" bundle="${msg}" />');">
	                                                       <option value="HKID" selected="selected"><fmt:message key="travel.details.insured.hkid.option1" bundle="${msg}" /></option>
	                                                       <option value="passport"><fmt:message key="travel.details.insured.hkid.option2" bundle="${msg}" /></option>
	                                                   </select>
                                                   </div>
                                               </c:if>
                                           </div>
                                           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                               <input id="txtInsuHkid${inx}" name="personalHKID" class="js-field-hkid form-control textUpper full-control bmg_custom_placeholder" 
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
                                                        id="personalBenefitiaryId${inx}" class="js-field-fullname form-control full-control textUpper bmg_custom_placeholder"
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
                                                    class="js-field-hkid form-control textUpper full-control bmg_custom_placeholder" 
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
                                    <%-- <table class="table activation-form margin-left-2 vert-middle">
                                        <tbody>
                                            <tr>
                                                <td class="col-lg-5 col-md-5 col-sm-5 col-xs-4">
                                                     <label class="bold-500"><fmt:message key="travel.details.insured.name" bundle="${msg}" /></label>
                                                </td>
                                                <td>
                                                     <c:if test="${inx == 1}">
                                                    <input type="text"
                                                        id="txtInsuFullName${inx}" name="personalName" value="${userDetails.getFullName()}"
                                                        class="form-control full-control" placeholder="<fmt:message key="travel.details.insured.name.placeholder" bundle="${msg}" />"
                                                        onblur="replaceAlpha(this); validateName('txtInsuFullName${inx}','errtxtPersonalFullName${inx}',false,'insured');"
                                                        onkeypress="    return alphaOnly(event);" maxlength="100" />
                                                    </c:if>
                                                    <c:if test="${inx > 1}">
                                                    <input type="text"
                                                        id="txtInsuFullName${inx}" name="personalName" value=""
                                                        class="form-control full-control" placeholder="<fmt:message key="travel.details.insured.name.placeholder" bundle="${msg}" />"
                                                        onblur="replaceAlpha(this); validateName('txtInsuFullName${inx}','errtxtPersonalFullName${inx}',false,'insured');"
                                                        onkeypress="    return alphaOnly(event);" maxlength="100" />
                                                    </c:if>
                                                    <span id="errtxtPersonalFullName${inx}" class="text-red"></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                     <div class="styled-select custom-select-label">
                                                        <select id="selectedPersonalHkidPass${inx}" class="form-control soflow select-label" name="selectedPersonalHkidPass">
                                                            <option value="HKID" selected="selected"><fmt:message key="travel.details.insured.hkid.option1" bundle="${msg}" /></option>
                                                            <option value="passport"><fmt:message key="travel.details.insured.hkid.option2" bundle="${msg}" /></option>
                                                        </select>
                                                    </div>
                                                </td>
                                                <td class="">
                                                     <input id="txtInsuHkid${inx}" name="personalHKID" class="form-control textUpper full-control" placeholder="<fmt:message key="travel.details.insured.hkid.placeholder" bundle="${msg}" />" value="" onkeyup="hkidValid(this)" onblur="validateHkid('txtInsuHkid${inx}','selectedPersonalHkidPass${inx}','errtxtInvalidInsuHkid${inx}',false,'insured');"/> 
                                                    <span id="errtxtInsuHkid${inx}" class="text-red"> </span> 
                                                    <span id="errtxtInvalidInsuHkid${inx}" class="text-red"> </span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                     <label class="bold-500"><fmt:message key="travel.details.insured.age" bundle="${msg}" /></label>
                                                </td>
                                                <td>
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
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                     <label class="bold-500"><fmt:message key="travel.details.insured.beneficiary" bundle="${msg}" /></label>
                                                </td>
                                                <td>
                                                     <div class="styled-select">
                                                     <select name="personalBeneficiary" id="personalselectBenificiary${inx}" 
                                                            onChange="activeDiv('personalbenificiaryId${inx}','personalselectBenificiary${inx}')"
                                                        class="form-control soflow select-label" >
                                                        <option value="SE"><fmt:message key="travel.details.insured.beneficiary.default" bundle="${msg}" /></option>
                                                        <c:forEach var="relationshipList" items="${mapRelationshipCode}">
                                                            <option value="${relationshipList.key}"><c:out
                                                                    value="${relationshipList.value}" /></option>
                                                        </c:forEach>
                                                    </select>
                                                    </div>
                                                    <span id="errpersonalselectBenificiary${inx}" class="text-red"></span>
                                                </td>
                                            </tr>
                                            <tr id="personalbenificiaryId${inx}" class="hide">
                                                <td>
                                                     <label class="bold-500"><fmt:message key="travel.details.insured.beneficiary.name" bundle="${msg}" /></label>
                                                </td>
                                                <td>
                                                     <input type="text"
                                                        name="personalBenificiaryFullName"
                                                        id="personalBenefitiaryId${inx}" value=""
                                                        class="form-control full-control " placeholder="<fmt:message key="travel.details.insured.beneficiary.name.placeholder" bundle="${msg}" />"
                                                        onblur="replaceAlpha(this); validateName('personalBenefitiaryId${inx}','errpersonalBenefitiaryId${inx}',false,'beneficiary');"
                                                        onkeypress="    return alphaOnly(event);" maxlength="100" />
                                                    <span id="errpersonalBenefitiaryId${inx}" class="text-red">
                                                    </span>
                                                </td>
                                            </tr>
                                            <tr id="personalbenificiaryId${inx}b" class="hide">
                                                <td>
                                                    <div class="styled-select custom-select-label">
                                                    <select id="selectPersonalBenefitiaryHkidPass${inx}" class="form-control soflow select-label" name="selectedPersonalBenefitiaryHkidPass">
                                                        <option value="HKID" selected="selected"><fmt:message key="travel.details.insured.beneficiary.hkid.option1" bundle="${msg}" /></option>
                                                        <option value="passport"><fmt:message key="travel.details.insured.beneficiary.hkid.option2" bundle="${msg}" /></option>
                                                    </select>
                                                    </div>
                                                </td>
                                                <td>
                                                     <input
                                                    id="personalBenefitiaryHKId${inx}" name="personalBenificiaryHkid"
                                                    class="form-control textUpper full-control" placeholder="<fmt:message key="travel.details.insured.beneficiary.hkid.placeholder" bundle="${msg}" />"
                                                    value="" onkeyup="hkidValid(this)" onblur="validateHkid('personalBenefitiaryHKId${inx}','selectPersonalBenefitiaryHkidPass${inx}','errpersonalBenefitiaryHKId${inx}',false,'beneficiary');"/> <span id="errpersonalBenefitiaryHKId${inx}"
                                                    class="text-red"> </span><span id="errInvalidpersonalBenefitiaryHKId${inx}"
                                                    class="text-red"> </span>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table> --%>
                                </div>
                                </div>
                            </c:forEach>
                             
                            <!-- adult  -->
                            
                            <input type="hidden" name="totalAdultTraveller"
                                id="totalAdultTraveler"
                                value="${corrTravelQuote.totalAdultTraveller}">
                            <c:forEach var="inx" begin="1"
                                end="${corrTravelQuote.totalAdultTraveller}">
                                <div class="form-wrap">
                                <div class="adulttraveller">
                                    <h4 class="bold big-title" style="padding-left:0px !important;">
                                        <fmt:message
                                            key="flight.details.insured.label.family.parent"
                                            bundle="${msg}" />
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
                                                    <!-- <input type="text"
                                                        id="txtInsuFullName${inx}" name="adultName" value="${userDetails.fullName}"
                                                        class="form-control full-control textUpper" 
                                                        onblur="replaceAlpha(this); validateName('txtInsuFullName${inx}','errtxtAdFullName${inx}',false,'insured');"
                                                        onkeypress="    return alphaOnly(event);" maxlength="100" readonly="readonly"/> -->
                                                    <input type="text"
                                                        id="txtInsuFullName${inx}" name="adultName"
                                                        class="js-field-fullname form-control full-control textUpper <c:if test="${!(userDetails != null && userDetails.userName != '' && userDetails.userName != '*DIRECTGI')}">bmg_custom_placeholder</c:if>" 
                                                        <c:choose>
														    <c:when test="${userDetails != null && userDetails.userName != '' && userDetails.userName != '*DIRECTGI'}">
														    value="${userDetails.fullName }"
														    </c:when>
														    <c:otherwise>
	                                                        value="<fmt:message key="travel.details.insured.name.placeholder" bundle="${msg}" />"
				                                            </c:otherwise>
														</c:choose>
                                                        onfocus="placeholderOnFocus(this,'<fmt:message key="travel.details.insured.name.placeholder" bundle="${msg}" />');" 
                                                        onblur="placeholderOnBlur(this,'<fmt:message key="travel.details.insured.name.placeholder" bundle="${msg}" />'); validateName('txtInsuFullName${inx}','errtxtAdFullName${inx}',false,'insured');"
                                                        onkeypress="    return alphaOnly(event);" maxlength="100" readonly="readonly"/>
                                                    </c:if>
                                                    <c:if test="${inx > 1}">
                                                    <!-- <input type="text"
                                                        id="txtInsuFullName${inx}" name="adultName" value=""
                                                        class="form-control full-control textUpper" 
                                                        onblur="replaceAlpha(this); validateName('txtInsuFullName${inx}','errtxtAdFullName${inx}',false,'insured');"
                                                        onkeypress="    return alphaOnly(event);" maxlength="100"/> -->
                                                    <input type="text"
                                                        id="txtInsuFullName${inx}" name="adultName"
                                                        class="js-field-fullname form-control full-control textUpper bmg_custom_placeholder" 
                                                        value="<fmt:message key="travel.details.insured.name.placeholder" bundle="${msg}" />"
                                                        onfocus="placeholderOnFocus(this,'<fmt:message key="travel.details.insured.name.placeholder" bundle="${msg}" />');" 
                                                        onblur="placeholderOnBlur(this,'<fmt:message key="travel.details.insured.name.placeholder" bundle="${msg}" />'); validateName('txtInsuFullName${inx}','errtxtAdFullName${inx}',false,'insured');"
                                                        onkeypress="    return alphaOnly(event);" maxlength="100"/>
                                                    </c:if>
                                                    <span id="errtxtAdFullName${inx}" class="text-red"></span>
                                           </div>
                                       </div>
                                       <!-- english name end -->
                                       <!-- id card start -->
                                       <div class="form-group float">
                                           <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                               <c:if test="${inx == 1}">
                                                   <label class="field-label bold-500">
                                                       <fmt:message key="travel.details.insured.hkid.option1" bundle="${msg}" />
                                                       <input type="hidden" name="selectedAdHkidPass" id="selectedAdHkidPass${inx}" value="HKID" />
                                                   </label>
                                               </c:if>
                                               <c:if test="${inx > 1}">
                                                   <div class="bmg-label-styled-select styled-select">
                                                       <select id="selectedAdHkidPass${inx}" class="form-control soflow select-label" name="selectedAdHkidPass" onchange="togglePlaceholder(this,'txtInsuHkid${inx}','<fmt:message key="travel.details.insured.hkid.placeholder" bundle="${msg}" />');">
                                                           <option value="HKID" selected="selected"><fmt:message key="travel.details.insured.hkid.option1" bundle="${msg}" /></option>
                                                           <option value="passport"><fmt:message key="travel.details.insured.hkid.option2" bundle="${msg}" /></option>
                                                       </select>
                                                   </div>
                                               </c:if>
                                           </div>
                                           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                               <input id="txtInsuHkid${inx}" name="adultHKID" class="js-field-hkid form-control textUpper full-control bmg_custom_placeholder" 
                                               value="<fmt:message key="travel.details.insured.hkid.placeholder" bundle="${msg}" />" onkeypress=" return hkidOnkeypress(event);"
                                               onfocus="placeholderOnFocus(this,'<fmt:message key="travel.details.insured.hkid.placeholder" bundle="${msg}" />');" 
                                               onblur="placeholderOnBlur(this,'<fmt:message key="travel.details.insured.hkid.placeholder" bundle="${msg}" />'); validateHkid('txtInsuHkid${inx}','selectedAdHkidPass${inx}','errtxtInsuHkid${inx}',false,'insured');"
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
                                                            name="adultAgeRange" class="form-control soflow select-label"
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
                                                   <select name="adultBeneficiary" id="adultsselectBenificiary${inx}" 
                                                          onChange="activeDiv('adultsbenificiaryId${inx}','adultsselectBenificiary${inx}', 'adultBenefitiaryId${inx}', 'adultBenefitiaryHKId${inx}')"
                                                      class="form-control soflow select-label" >
                                                      <c:forEach var="relationshipList" items="${mapRelationshipCode}">
                                                      	<enhance:out escapeXml="false">
                                                          <option value="${relationshipList.key}"><c:out
                                                                  value="${relationshipList.value}" /></option>
                                                        </enhance:out>
                                                      </c:forEach>
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
                                                      <fmt:message key="travel.details.insured.beneficiary.name" bundle="${msg}" />
                                                    </label>
                                               </div>
                                               <div class="col-lg-7 col-md-7 col-sm-7 col-xs-7 pad-none">
                                                   <input type="text"
	                                                  name="adultBenificiaryFullName"
	                                                  id="adultBenefitiaryId${inx}"
	                                                  class="js-field-fullname form-control full-control textUpper bmg_custom_placeholder" 
	                                                  value="<fmt:message key="travel.details.insured.beneficiary.name.placeholder" bundle="${msg}" />"
                                                      onfocus="placeholderOnFocus(this,'<fmt:message key="travel.details.insured.beneficiary.name.placeholder" bundle="${msg}" />');" 
                                                      onblur="placeholderOnBlur(this,'<fmt:message key="travel.details.insured.beneficiary.name.placeholder" bundle="${msg}" />'); validateName('adultBenefitiaryId${inx}','erradultBenefitiaryId${inx}',false,'beneficiary');"
	                                                  onkeypress="    return alphaOnly(event);" maxlength="100" />
	                                              <span id="erradultBenefitiaryId${inx}" class="text-red">
	                                              </span>
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
                                                    <fmt:message key="travel.details.insured.beneficiary.type" bundle="${msg}" />
                                                    </label>
                                               </div>
                                               <div class="col-lg-7 col-md-7 col-sm-7 col-xs-7 pad-none">
                                                  <div class="styled-select">
                                                    <select id="selectAdBenefitiaryHkidPass${inx}" class="form-control soflow select-label" name="selectedAdBenefitiaryHkidPass" onchange="togglePlaceholder(this,'adultBenefitiaryHKId${inx}','<fmt:message key="travel.details.insured.beneficiary.hkid.placeholder" bundle="${msg}" />');">
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
                                                  <input
                                                    id="adultBenefitiaryHKId${inx}" name="adultBenificiaryHkid"
                                                    class="js-field-hkid form-control textUpper full-control bmg_custom_placeholder"
                                                    value="<fmt:message key="travel.details.insured.beneficiary.hkid.placeholder" bundle="${msg}" />" onkeypress=" return hkidOnkeypress(event);" 
                                                    onfocus="placeholderOnFocus(this,'<fmt:message key="travel.details.insured.beneficiary.hkid.placeholder" bundle="${msg}" />');" 
                                                  onblur="placeholderOnBlur(this,'<fmt:message key="travel.details.insured.beneficiary.hkid.placeholder" bundle="${msg}" />'); validateHkid('adultBenefitiaryHKId${inx}','selectAdBenefitiaryHkidPass${inx}','erradultBenefitiaryHKId${inx}',false,'beneficiary');"/> <span id="erradultBenefitiaryHKId${inx}"
                                                    class="text-red"> </span><span id="errInvalidadultBenefitiaryHKId${inx}"
                                                    class="text-red"> </span>
                                               </div>
                                           </div>
                                       </div>
                                       <!-- adult beneficiary c end -->
                                       
                                       
                                       
                                       
                                       
                                       
                                       
                                    </div>
                                 </div>
                                <%-- <div id="adulttraveller">
                                    <h4 class="color1 top-mrg-10 margin-left-28">
                                        <fmt:message key="travel.details.insured.label.family.parent" bundle="${msg}" />
                                        <c:out value="${inx}"></c:out>
                                    </h4>
                                    
                                    <table class="table activation-form margin-left-2 vert-middle">
                                        <tbody>
                                            <tr>
                                                <td class="col-lg-5 col-md-5 col-sm-5 col-xs-5">
                                                     <label class="bold-500"><fmt:message key="travel.details.insured.name" bundle="${msg}" /></label>
                                                </td>
                                                <td>
                                                     <c:if test="${inx == 1}">
                                                    <input type="text"
                                                        id="txtInsuFullName${inx}" name="adultName" value="${userDetails.getFullName()}"
                                                        class="form-control full-control" placeholder="<fmt:message key="travel.details.insured.name.placeholder" bundle="${msg}" />"
                                                        onblur="replaceAlpha(this); validateName('txtInsuFullName${inx}','errtxtAdFullName${inx}',false,'insured');"
                                                        onkeypress="    return alphaOnly(event);" maxlength="100" />
                                                    </c:if>
                                                    <c:if test="${inx > 1}">
                                                    <input type="text"
                                                        id="txtInsuFullName${inx}" name="adultName" value=""
                                                        class="form-control full-control" placeholder="<fmt:message key="travel.details.insured.name.placeholder" bundle="${msg}" />"
                                                        onblur="replaceAlpha(this); validateName('txtInsuFullName${inx}','errtxtAdFullName${inx}',false,'insured');"
                                                        onkeypress="    return alphaOnly(event);" maxlength="100" />
                                                    </c:if>
                                                    <span id="errtxtAdFullName${inx}" class="text-red"></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                     <div class="styled-select custom-select-label">
                                                        <select id="selectedAdHkidPass${inx}" class="form-control soflow select-label" name="selectedAdHkidPass">
                                                            <option value="HKID" selected="selected"><fmt:message key="travel.details.insured.hkid.option1" bundle="${msg}" /></option>
                                                            <option value="passport"><fmt:message key="travel.details.insured.hkid.option2" bundle="${msg}" /></option>
                                                        </select>
                                                    </div>
                                                </td>
                                                <td class="">
                                                     <input id="txtInsuHkid${inx}" name="adultHKID" class="form-control textUpper full-control" placeholder="<fmt:message key="travel.details.insured.hkid.placeholder" bundle="${msg}" />" value="" onkeyup="hkidValid(this)" onblur="validateHkid('txtInsuHkid${inx}','selectedAdHkidPass${inx}','errtxtInvalidInsuHkid${inx}',false,'insured');"/> 
                                                    <span id="errtxtInsuHkid${inx}" class="text-red"> </span> 
                                                    <span id="errtxtInvalidInsuHkid${inx}" class="text-red"> </span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                     <label class="bold-500"><fmt:message key="travel.details.insured.age" bundle="${msg}" /></label>
                                                </td>
                                                <td>
                                                     <div class="styled-select">
                                                        <select
                                                            name="adultAgeRange" class="form-control soflow select-label"
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
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                     <label class="bold-500"><fmt:message key="travel.details.insured.beneficiary" bundle="${msg}" /></label>
                                                </td>
                                                <td>
                                                     <div class="styled-select">
                                                     <select name="adultBeneficiary" id="adultsselectBenificiary${inx}" 
                                                            onChange="activeDiv('adultsbenificiaryId${inx}','adultsselectBenificiary${inx}')"
                                                        class="form-control soflow select-label" >
                                                        <option value="SE"><fmt:message key="travel.details.insured.beneficiary.default" bundle="${msg}" /></option>
                                                        <c:forEach var="relationshipList" items="${mapRelationshipCode}">
                                                            <option value="${relationshipList.key}"><c:out
                                                                    value="${relationshipList.value}" /></option>
                                                        </c:forEach>
                                                    </select>
                                                    </div>
                                                    <span id="erradultsselectBenificiary${inx}" class="text-red"></span>
                                                </td>
                                            </tr>
                                            <tr id="adultsbenificiaryId${inx}" class="hide">
                                                <td>
                                                     <label class="bold-500"><fmt:message key="travel.details.insured.beneficiary.name" bundle="${msg}" /></label>
                                                </td>
                                                <td>
                                                     <input type="text"
                                                        name="adultBenificiaryFullName"
                                                        id="adultBenefitiaryId${inx}" value=""
                                                        class="form-control full-control " placeholder="<fmt:message key="travel.details.insured.beneficiary.name.placeholder" bundle="${msg}" />"
                                                        onblur="replaceAlpha(this); validateName('adultBenefitiaryId${inx}','erradultBenefitiaryId${inx}',false,'beneficiary');"
                                                        onkeypress="    return alphaOnly(event);" maxlength="100" />
                                                    <span id="erradultBenefitiaryId${inx}" class="text-red">
                                                    </span>
                                                </td>
                                            </tr>
                                            <tr id="adultsbenificiaryId${inx}b" class="hide">
                                                <td>
                                                    <div class="styled-select custom-select-label">
                                                    <select id="selectAdBenefitiaryHkidPass${inx}" class="form-control soflow select-label" name="selectedAdBenefitiaryHkidPass">
                                                        <option value="HKID" selected="selected"><fmt:message key="travel.details.insured.beneficiary.hkid.option1" bundle="${msg}" /></option>
                                                        <option value="passport"><fmt:message key="travel.details.insured.beneficiary.hkid.option2" bundle="${msg}" /></option>
                                                    </select>
                                                    </div>
                                                </td>
                                                <td>
                                                     <input
                                                    id="adultBenefitiaryHKId${inx}" name="adultBenificiaryHkid"
                                                    class="form-control textUpper full-control" placeholder="<fmt:message key="travel.details.insured.beneficiary.hkid.placeholder" bundle="${msg}" />"
                                                    value="" onkeyup="hkidValid(this)" onblur="validateHkid('adultBenefitiaryHKId${inx}','selectAdBenefitiaryHkidPass${inx}','erradultBenefitiaryHKId${inx}',false,'beneficiary');"/> <span id="erradultBenefitiaryHKId${inx}"
                                                    class="text-red"> </span><span id="errInvalidadultBenefitiaryHKId${inx}"
                                                    class="text-red"> </span>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div> --%>
                                </div>
                            </c:forEach>

                            <!-- child  -->
                            
                            <input type="hidden" name="totalChildTraveller"
                                id="totalCountOfChild"
                                value="${corrTravelQuote.totalChildTraveller}">
                            <c:forEach var="inx" begin="1"
                                end="${corrTravelQuote.totalChildTraveller}">
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
                                               <label class="field-label bold-500"><fmt:message key="travel.details.insured.name" bundle="${msg}" /></label>
                                           </div>
                                           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                               <input type="text"
                                                        name="childName" id="txtChldFullName${inx}"
                                                        class="js-field-fullname form-control full-control textUpper bmg_custom_placeholder"
                                                        value="<fmt:message key="travel.details.insured.name.placeholder" bundle="${msg}" />"
                                                        onfocus="placeholderOnFocus(this,'<fmt:message key="travel.details.insured.name.placeholder" bundle="${msg}" />');" 
                                                        onblur="placeholderOnBlur(this,'<fmt:message key="travel.details.insured.name.placeholder" bundle="${msg}" />'); validateName('txtChldFullName${inx}','errtxtChldFullName${inx}',false,'insured');"
                                                        onkeypress="    return alphaOnly(event);" maxlength="100" />
                                                    <span id="errtxtChldFullName${inx}" class="text-red"></span>
                                           </div>
                                       </div>
                                       <!-- english name end -->
                                       <!-- id card start -->
                                       <div class="form-group float">
                                           <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                                <label class="field-label form-label bold-500 hidden-lg hidden-md"><fmt:message
                                                          key="travel.details.insured.hkid"
                                                          bundle="${msg}" /></label>
                                               <div class="bmg-label-styled-select styled-select">
                                                  <select id="selectedChldHkidPass${inx}" class="form-control soflow select-label" name="selectedChldHkidPass" onchange="togglePlaceholder(this,'txtChldInsuHkid${inx}','<fmt:message key="travel.details.insured.hkid.placeholder" bundle="${msg}" />');">
                                                      <option value="HKID" selected="selected"><fmt:message key="travel.details.insured.hkid.option1" bundle="${msg}" /></option>
                                                      <option value="passport"><fmt:message key="travel.details.insured.hkid.option2" bundle="${msg}" /></option>
                                                  </select>
                                              </div>
                                           </div>
                                           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                               <input
                                                    id="txtChldInsuHkid${inx}" name="childHKID"
                                                    class="js-field-hkid form-control textUpper full-control bmg_custom_placeholder"
                                                    value="<fmt:message key="travel.details.insured.hkid.placeholder" bundle="${msg}" />" onkeypress=" return hkidOnkeypress(event);" 
                                                    onfocus="placeholderOnFocus(this,'<fmt:message key="travel.details.insured.hkid.placeholder" bundle="${msg}" />');" 
                                                    onblur="placeholderOnBlur(this,'<fmt:message key="travel.details.insured.hkid.placeholder" bundle="${msg}" />'); validateHkid('txtChldInsuHkid${inx}','selectedChldHkidPass${inx}','errtxtChldInsuHkid${inx}',false,'insured');"/> <span id="errtxtChldInsuHkid${inx}"
                                                    class="text-red"> </span><span
                                                    id="errtxtChldInvalidInsuHkid${inx}" class="text-red"> </span>                                           </div>
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
                                                      name="childAgeRange" id="selectchildAgeRange${inx}"
                                                      class="form-control soflow select-label">
                                                      <c:forEach var="ageList" items="${mapChildType}">
                                                          <c:choose> 
                                                            <c:when test="${ageList.key == '1'}">
                                                              <option value="${ageList.key}" selected>
                                                            </c:when>
                                                            <c:otherwise>
                                                              <option value="${ageList.key}">
                                                            </c:otherwise>
                                                          </c:choose>
                                                          <c:out value="${ageList.value}" /></option>
                                                      </c:forEach>
                                                  </select>
                                              </div> <span id="errchildRange${inx}" class="text-red"></span>
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
                                                    <select
                                                        id="childselectBenificiary${inx}" name="childBeneficiary"
                                                        onchange="activeDiv('childbenificiaryId${inx}','childselectBenificiary${inx}', 'childBenefitiaryName${inx}', 'txtchildInsuHkid${inx}')"
                                                        class="form-control soflow select-label">
                                                        <c:forEach var="relationshipCodeList" items="${mapRelationshipCode}">
                                                        <enhance:out escapeXml="false">
                                                            <option value="${relationshipCodeList.key}"><c:out
                                                                    value="${relationshipCodeList.value}" /></option>
                                                        </enhance:out>
                                                        </c:forEach>
                                                    </select>
                                                    </div>
                                                     <span id="errselectChildbenificiary${inx}" class="text-red"></span>
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
                                                      <fmt:message key="travel.details.insured.beneficiary.name" bundle="${msg}" />
                                                    </label>
                                               </div>
                                               <div class="col-lg-7 col-md-7 col-sm-7 col-xs-7 pad-none">
                                                   <input type="text"
                                                    name="childBenificiaryFullName"
                                                    id="childBenefitiaryName${inx}"
                                                    class="js-field-fullname form-control full-control textUpper bmg_custom_placeholder" 
                                                    value="<fmt:message key="travel.details.insured.beneficiary.name.placeholder" bundle="${msg}" />"
                                                    onfocus="placeholderOnFocus(this,'<fmt:message key="travel.details.insured.beneficiary.name.placeholder" bundle="${msg}" />');" 
                                                    onblur="placeholderOnBlur(this,'<fmt:message key="travel.details.insured.beneficiary.name.placeholder" bundle="${msg}" />'); validateName('childBenefitiaryName${inx}','errchildBenefitiaryName${inx}',false,'beneficiary');"
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
                                                    <fmt:message key="travel.details.insured.beneficiary.type" bundle="${msg}" />
                                                    </label>
                                               </div>
                                               <div class="col-lg-7 col-md-7 col-sm-7 col-xs-7 pad-none">
                                                  <div class="styled-select">
                                                    <select id="selectedChldBenefitiaryHkidPass${inx}" class="form-control soflow select-label" name="SelectedChldBenefitiaryHkidPass" onchange="togglePlaceholder(this,'txtchildInsuHkid${inx}','<fmt:message key="travel.details.insured.beneficiary.hkid.placeholder" bundle="${msg}" />');">
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
                                                  <input
                                                    id="txtchildInsuHkid${inx}" name="childBenificiaryHkid"
                                                    class="js-field-hkid form-control textUpper full-control bmg_custom_placeholder" 
                                                    value="<fmt:message key="travel.details.insured.beneficiary.hkid.placeholder" bundle="${msg}" />" onkeypress=" return hkidOnkeypress(event);" 
                                                    onfocus="placeholderOnFocus(this,'<fmt:message key="travel.details.insured.beneficiary.hkid.placeholder" bundle="${msg}" />');" 
                                                  onblur="placeholderOnBlur(this,'<fmt:message key="travel.details.insured.beneficiary.hkid.placeholder" bundle="${msg}" />'); validateHkid('txtchildInsuHkid${inx}','selectedChldBenefitiaryHkidPass${inx}','errtxtchildInsuHkid${inx}',false,'beneficiary');"/> <span id="errtxtchildInsuHkid${inx}"
                                                    class="text-red"> </span><span id="errtxtInvalidchildInsuHkid${inx}"
                                                    class="text-red"> </span>
                                               </div>
                                           </div>
                                       </div>
                                       <!-- child beneficiary c end -->
                                       
                                       
                                       
                                       
                                       
                                       
                                       
                                       
                                       
                                       
                                       
                                       
                                       
                                    </div>
                                </div>
                                <%-- <div id="childtraveller">
                                    <h4 class="color1 top-mrg-10 margin-left-28">
                                        <fmt:message key="travel.details.insured.label.family.child" bundle="${msg}" /> 
                                        <c:out value="${inx}"></c:out>
                                    </h4>
                                    
                                    
                                    <table class="table activation-form margin-left-2 vert-middle">
                                        <tbody>
                                            <tr>
                                                <td class="col-lg-5 col-md-5 col-sm-5 col-xs-5">
                                                    <label class="bold-500"><fmt:message key="travel.details.insured.name" bundle="${msg}" /></label>
                                                </td>
                                                <td>
                                                    <input type="text"
                                                        name="childName" id="txtChldFullName${inx}" value=""
                                                        class="form-control full-control " placeholder="<fmt:message key="travel.details.insured.name.placeholder" bundle="${msg}" />"
                                                        onblur="replaceAlpha(this); validateName('txtChldFullName${inx}','errtxtChldFullName${inx}',false,'insured');"
                                                        onkeypress="    return alphaOnly(event);" maxlength="100" />
                                                    <span id="errtxtChldFullName${inx}" class="text-red"></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="styled-select custom-select-label">
                                                        <select id="selectedChldHkidPass${inx}" class="form-control soflow select-label" name="selectedChldHkidPass">
                                                            <option value="HKID" selected="selected"><fmt:message key="travel.details.insured.hkid.option1" bundle="${msg}" /></option>
                                                            <option value="passport"><fmt:message key="travel.details.insured.hkid.option2" bundle="${msg}" /></option>
                                                        </select>
                                                    </div>
                                                </td>
                                                <td>
                                                    <input
                                                    id="txtChldInsuHkid${inx}" name="childHKID"
                                                    class="form-control textUpper full-control" placeholder="<fmt:message key="travel.details.insured.beneficiary.hkid.placeholder" bundle="${msg}" />"
                                                    value="" onkeyup="hkidValid(this)" onblur="validateHkid('txtChldInsuHkid${inx}','selectedChildHkidPass${inx}','errtxtChldInsuHkid${inx}',false,'insured');"/> <span id="errtxtChldInsuHkid${inx}"
                                                    class="text-red"> </span><span
                                                    id="errtxtChldInvalidInsuHkid${inx}" class="text-red"> </span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label class="bold-500"><fmt:message key="travel.details.insured.age" bundle="${msg}" /></label>
                                                </td>
                                                <td>
                                                    <div class="styled-select">
                                                        <select
                                                            name="childAgeRange" id="selectchildAgeRange${inx}"
                                                            class="form-control soflow select-label">
                                                            <c:forEach var="ageList" items="${mapChildType}">
                                                                <c:choose> 
                                                                  <c:when test="${ageList.key == '1'}">
                                                                    <option value="${ageList.key}" selected>
                                                                  </c:when>
                                                                  <c:otherwise>
                                                                    <option value="${ageList.key}">
                                                                  </c:otherwise>
                                                                </c:choose>
                                                                <c:out value="${ageList.value}" /></option>
                                                            </c:forEach>
                                                        </select>
                                                    </div> <span id="errchildRange${inx}" class="text-red"></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label class="bold-500"><fmt:message key="travel.details.insured.beneficiary" bundle="${msg}" /></label>
                                                </td>
                                                <td>
                                                    <div class="styled-select">
                                                    <select
                                                        id="childselectBenificiary${inx}" name="childBeneficiary"
                                                        onchange="activeDiv('childbenificiaryId${inx}','childselectBenificiary${inx}')"
                                                        class="form-control soflow select-label">
                                                        <option value="SE"><fmt:message key="travel.details.insured.beneficiary.default" bundle="${msg}" /></option>
                                                        <c:forEach var="relationshipCodeList" items="${mapRelationshipCode}">
                                                            <option value="${relationshipCodeList.key}"><c:out
                                                                    value="${relationshipCodeList.value}" /></option>
                                                        </c:forEach>
                                                    </select>
                                                    </div>
                                                     <span id="errselectChildbenificiary${inx}" class="text-red"></span>
                                                </td>
                                            </tr>
                                            <tr id="childbenificiaryId${inx}" class="hide">
                                                <td>
                                                    <label class="bold-500"><fmt:message key="travel.details.insured.beneficiary.name" bundle="${msg}" /></label>
                                                </td>
                                                <td>
                                                    <input type="text"
                                                        name="childBenificiaryFullName"
                                                        id="childBenefitiaryName${inx}" value=""
                                                        class="form-control full-control " placeholder="<fmt:message key="travel.details.insured.beneficiary.name.placeholder" bundle="${msg}" />"
                                                        onblur="replaceAlpha(this); validateName('childBenefitiaryName${inx}','errchildBenefitiaryName${inx}',false,'beneficiary');"
                                                        onkeypress="    return alphaOnly(event);" maxlength="100" />
                                                    <span id="errchildBenefitiaryName${inx}" class="text-red"></span>
                                                </td>
                                            </tr>
                                            <tr id="childbenificiaryId${inx}b" class="hide">
                                                <td>
                                                    <div class="styled-select custom-select-label">
                                                        <select id="selectedChldBenefitiaryHkidPass${inx}" class="form-control soflow select-label" name="selectedChldBenefitiaryHkidPass">
                                                            <option value="HKID" selected="selected"><fmt:message key="travel.details.insured.beneficiary.hkid.option1" bundle="${msg}" /></option>
                                                            <option value="passport"><fmt:message key="travel.details.insured.beneficiary.hkid.option2" bundle="${msg}" /></option>
                                                        </select>
                                                    </div>
                                                </td>
                                                <td>
                                                    <input
                                                    id="txtchildInsuHkid${inx}" name="childBenificiaryHkid"
                                                    class="form-control textUpper full-control" placeholder="<fmt:message key="travel.details.insured.beneficiary.hkid.placeholder" bundle="${msg}" />"
                                                    value="" onkeyup="hkidValid(this)" onblur="validateHkid('txtchildInsuHkid${inx}','selectedChldBenefitiaryHkidPass${inx}','errtxtchildInsuHkid${inx}',false,'beneficiary');"/> <span id="errtxtchildInsuHkid${inx}"
                                                    class="text-red"> </span><span id="errtxtInvalidchildInsuHkid${inx}"
                                                    class="text-red"> </span>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div> --%>
                                </div>
                            </c:forEach>

                            <!--other traveller-->
                            <input type="hidden" name="totalOtherTraveller"
                                id="totalCountOther"
                                value="${corrTravelQuote.totalOtherTraveller}">
                            
                            <c:forEach var="inx" begin="1"
                                end="${corrTravelQuote.totalOtherTraveller}">
                                <div class="form-wrap">
                                <div class="otherTraveller">
                                    <h4 class="bold big-title" style="padding-left:0px !important;">
                                       <fmt:message key="travel.details.insured.label.family.others"
                                            bundle="${msg}" />
                                        <c:out value="${inx}"></c:out>
                                    </h4>
                                     <div>
                                        <!-- english name start -->
                                       <div class="form-group float">
                                           <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                               <label class="field-label bold-500"><fmt:message key="travel.details.insured.name" bundle="${msg}" /></label>
                                           </div>
                                           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                               <input type="text"
                                                        name="otherName" id="txtOtherFullName${inx}"
                                                        class="js-field-fullname form-control full-control textUpper bmg_custom_placeholder" 
                                                        value="<fmt:message key="travel.details.insured.name.placeholder" bundle="${msg}" />"
                                                        onfocus="placeholderOnFocus(this,'<fmt:message key="travel.details.insured.name.placeholder" bundle="${msg}" />');" 
                                                        onblur="placeholderOnBlur(this,'<fmt:message key="travel.details.insured.name.placeholder" bundle="${msg}" />'); validateName('txtOtherFullName${inx}','errtxtOtherFullName${inx}',false,'insured');"
                                                        onkeypress="    return alphaOnly(event);" maxlength="100" />
                                                    <span id="errtxtOtherFullName${inx}" class="text-red"></span>
                                           </div>
                                       </div>
                                       <!-- english name end -->
                                       <!-- id card start -->
                                       <div class="form-group float">
                                           <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                                <label class="field-label form-label bold-500 hidden-lg hidden-md"><fmt:message
                                                          key="travel.details.insured.hkid"
                                                          bundle="${msg}" /></label>
                                               <div class="bmg-label-styled-select styled-select">
                                                    <select id="selectOtHkidPass${inx}" class="form-control soflow select-label" name="selectedOtHkidPass" onchange="togglePlaceholder(this,'txtOtherInsuHkid${inx}','<fmt:message key="travel.details.insured.hkid.placeholder" bundle="${msg}" />');">
                                                        <option value="HKID" selected="selected"><fmt:message key="travel.details.insured.hkid.option1" bundle="${msg}" /></option>
                                                        <option value="passport"><fmt:message key="travel.details.insured.hkid.option2" bundle="${msg}" /></option>
                                                    </select>
                                                </div>
                                           </div>
                                           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                              <input
                                                    id="txtOtherInsuHkid${inx}" name="otherHKID"
                                                    class="js-field-hkid form-control textUpper full-control bmg_custom_placeholder"
                                                    value="<fmt:message key="travel.details.insured.hkid.placeholder" bundle="${msg}" />" onkeypress=" return hkidOnkeypress(event);" 
                                                    onfocus="placeholderOnFocus(this,'<fmt:message key="travel.details.insured.hkid.placeholder" bundle="${msg}" />');" 
                                                    onblur="placeholderOnBlur(this,'<fmt:message key="travel.details.insured.hkid.placeholder" bundle="${msg}" />'); validateHkid('txtOtherInsuHkid${inx}','selectOtHkidPass${inx}','errtxtOtherInsuHkid${inx}',false,'insured');"/> <span id="errtxtOtherInsuHkid${inx}"
                                                    class="text-red"> </span><span
                                                    id="errtxtOtherInvalidInsuHkid${inx}" class="text-red"> </span>
                                           </div>
                                       </div>
                                       <!-- id card end -->
                                       <!-- age start -->
                                       <div class="form-group float">
                                           <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                               <label class="field-label bold-500"><fmt:message key="travel.details.insured.age" bundle="${msg}" /></label>
                                           </div>
                                           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                               <div class="styled-select"><select
                                                        name="otherAgeRange" class="form-control soflow select-label"
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
                                                            <c:out value="${ageList.value}" /></option>
                                                        </c:forEach>
                                                    </select></div> <span id="errselectOtherAgeRange${inx}" class="text-red"></span>
                                           </div>
                                       </div>
                                       <!-- age end -->
                                       <!-- beneficiary start -->
                                       <div class="form-group float">
                                           <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                                <label class="field-label bold-500"><fmt:message key="travel.details.insured.beneficiary" bundle="${msg}" /></label>                                           </div>
                                           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                              <div class="styled-select"><select id="otherSelectBenificiary${inx}" name="otherBeneficiary"
                                                        onchange="activeDiv('otherbenificiaryId${inx}','otherSelectBenificiary${inx}', 'otherBenefitiaryName${inx}', 'txtOtherBenInsuHkid${inx}')"
                                                        class="form-control soflow select-label">
                                                        <c:forEach var="relationshipCodeList" items="${mapRelationshipCode}">
                                                        <enhance:out escapeXml="false">
                                                            <option value="${relationshipCodeList.key}"><c:out
                                                                    value="${relationshipCodeList.value}" /></option>
                                                        </enhance:out>
                                                        </c:forEach>
                                                    </select></div><span id="benificiary" style="display: none"> <label
                                                        class="text-red"></label>
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
                                                      <fmt:message key="travel.details.insured.beneficiary.name" bundle="${msg}" />
                                                    </label>
                                               </div>
                                               <div class="col-lg-7 col-md-7 col-sm-7 col-xs-7 pad-none">
                                                   <input type="text"
                                                        name="otherBenificiaryFullName"
                                                        id="otherBenefitiaryName${inx}"
                                                        class="js-field-fullname form-control full-control textUpper bmg_custom_placeholder" 
                                                        value="<fmt:message key="travel.details.insured.beneficiary.name.placeholder" bundle="${msg}" />"
                                                        onfocus="placeholderOnFocus(this,'<fmt:message key="travel.details.insured.beneficiary.name.placeholder" bundle="${msg}" />');" 
                                                        onblur="placeholderOnBlur(this,'<fmt:message key="travel.details.insured.beneficiary.name.placeholder" bundle="${msg}" />'); validateName('otherBenefitiaryName${inx}','errotherBenefitiaryName${inx}',false,'beneficiary');"
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
                                                    <fmt:message key="travel.details.insured.beneficiary.type" bundle="${msg}" />
                                                    </label>
                                               </div>
                                               <div class="col-lg-7 col-md-7 col-sm-7 col-xs-7 pad-none">
                                                  <div class="styled-select">
                                                    <select id="selectOtherBenefitiaryHkidPass${inx}" class="form-control soflow select-label" name="SelectedOtherBenefitiaryHkidPass" onchange="togglePlaceholder(this,'txtOtherBenInsuHkid${inx}','<fmt:message key="travel.details.insured.beneficiary.hkid.placeholder" bundle="${msg}" />');">
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
                                                  <input
                                                  id="txtOtherBenInsuHkid${inx}" name="otherBenificiaryHkid"
                                                  class="js-field-hkid form-control textUpper full-control bmg_custom_placeholder" 
                                                  value="<fmt:message key="travel.details.insured.beneficiary.hkid.placeholder" bundle="${msg}" />" onkeypress=" return hkidOnkeypress(event);" 
                                                  onfocus="placeholderOnFocus(this,'<fmt:message key="travel.details.insured.beneficiary.hkid.placeholder" bundle="${msg}" />');" 
                                                  onblur="placeholderOnBlur(this,'<fmt:message key="travel.details.insured.beneficiary.hkid.placeholder" bundle="${msg}" />'); validateHkid('txtOtherBenInsuHkid${inx}','selectOtherBenefitiaryHkidPass${inx}','errtxtOtherBenInsuHkid${inx}',false,'beneficiary');"/> <span id="errtxtOtherBenInsuHkid${inx}"
                                                  class="text-red"> </span>
                                                  <span id="errtxtOtherInvalidBenInsuHkid${inx}"
                                                  class="text-red"> </span>
                                               </div>
                                           </div>
                                       </div>
                                       <!-- other beneficiary c end -->
                                       
                                       
                                       
                                       
                                       
                                       
                                       
                                       
                                       
                                       
                                     </div>
                                 </div>
                                <%-- <div id="childtraveller">
                                    <h4 class="color1 top-mrg-10 margin-left-28">
                                        <fmt:message key="travel.details.insured.label.family.others" bundle="${msg}" />
                                        <c:out value="${inx}"></c:out>
                                    </h4>
                                    
                                    <table class="table activation-form margin-left-2 vert-middle">
                                        <tbody>
                                            <tr>
                                                <td class="col-lg-5 col-md-5 col-sm-5 col-xs-5">
                                                    <label class="bold-500"><fmt:message key="travel.details.insured.name" bundle="${msg}" /> </label>
                                                </td>
                                                <td>
                                                    <input type="text"
                                                        name="otherName" id="txtOtherFullName${inx}" value=""
                                                        class="form-control full-control " placeholder="<fmt:message key="travel.details.insured.name.placeholder" bundle="${msg}" />"
                                                        onblur="replaceAlpha(this); validateName('txtOtherFullName${inx}','errtxtOtherFullName${inx}',false,'insured');"
                                                        onkeypress="    return alphaOnly(event);" maxlength="100" />
                                                    <span id="errtxtOtherFullName${inx}" class="text-red"></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="styled-select custom-select-label">
                                                        <select id="selectOtHkidPass${inx}" class="form-control soflow select-label" name="selectedOtHkidPass">
                                                            <option value="HKID" selected="selected"><fmt:message key="travel.details.insured.hkid.option1" bundle="${msg}" /></option>
                                                            <option value="passport"><fmt:message key="travel.details.insured.hkid.option2" bundle="${msg}" /></option>
                                                        </select>
                                                    </div>
                                                </td>
                                                <td>
                                                    <input
                                                    id="txtOtherInsuHkid${inx}" name="otherHKID"
                                                    class="form-control textUpper full-control" placeholder="<fmt:message key="travel.details.insured.hkid.placeholder" bundle="${msg}" />"
                                                    value="" onkeyup="hkidValid(this)" onblur="validateHkid('txtOtherInsuHkid${inx}','selectOtHkidPass${inx}','errtxtOtherInsuHkid${inx}',false,'insured');"/> <span id="errtxtOtherInsuHkid${inx}"
                                                    class="text-red"> </span><span
                                                    id="errtxtOtherInvalidInsuHkid${inx}" class="text-red"> </span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label class="bold-500"><fmt:message key="travel.details.insured.age" bundle="${msg}" /></label>
                                                </td>
                                                <td>
                                                    <div class="styled-select"><select
                                                        name="otherAgeRange" class="form-control soflow select-label"
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
                                                            <c:out value="${ageList.value}" /></option>
                                                        </c:forEach>
                                                    </select></div> <span id="errselectOtherAgeRange${inx}" class="text-red"></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label class="bold-500"><fmt:message key="travel.details.insured.beneficiary" bundle="${msg}" /></label>
                                                </td>
                                                <td>
                                                    <div class="styled-select"><select id="otherSelectBenificiary${inx}" name="otherBeneficiary"
                                                        onchange="activeDiv('otherbenificiaryId${inx}','otherSelectBenificiary${inx}')"
                                                        class="form-control soflow select-label">
                                                        <option value="SE"><fmt:message key="travel.details.insured.beneficiary.default" bundle="${msg}" /></option>
                                                        <c:forEach var="relationshipCodeList" items="${mapRelationshipCode}">
                                                            <option value="${relationshipCodeList.key}"><c:out
                                                                    value="${relationshipCodeList.value}" /></option>
                                                        </c:forEach>
                                                    </select></div><span id="benificiary" style="display: none"> <label
                                                        class="text-red">?��?人是空白</label>
                                                    </span>
                                                </td>
                                            </tr>
                                            <tr id="otherbenificiaryId${inx}" class="hide">
                                                <td>
                                                    <label class="bold-500"><fmt:message key="travel.details.insured.beneficiary.name" bundle="${msg}" /></label>
                                                </td>
                                                <td>
                                                    <input type="text"
                                                        name="otherBenificiaryFullName"
                                                        id="otherBenefitiaryName${inx}" value=""
                                                        class="form-control full-control " placeholder="<fmt:message key="travel.details.insured.beneficiary.name.placeholder" bundle="${msg}" />"
                                                        onblur="replaceAlpha(this); validateName('otherBenefitiaryName${inx}','errotherBenefitiaryName${inx}',false,'beneficiary');"
                                                        onkeypress="    return alphaOnly(event);" maxlength="100" />
                                                    <span id="errotherBenefitiaryName${inx}" class="text-red"></span>
                                                </td>
                                            </tr>
                                            <tr id="otherbenificiaryId${inx}b" class="hide">
                                                <td>
                                                    <div class="styled-select custom-select-label">
                                                        <select id="selectOtherBenefitiaryHkidPass${inx}" class="form-control soflow select-label" name="selectedOtherBenefitiaryHkidPass">
                                                            <option value="HKID" selected="selected"><fmt:message key="travel.details.insured.beneficiary.hkid.option1" bundle="${msg}" /></option>
                                                            <option value="passport"><fmt:message key="travel.details.insured.beneficiary.hkid.option2" bundle="${msg}" /></option>
                                                        </select>
                                                    </div>
                                                </td>
                                                <td>
                                                    <input
                                                        id="txtOtherBenInsuHkid${inx}" name="otherBenificiaryHkid"
                                                        class="form-control textUpper full-control" placeholder="<fmt:message key="travel.details.insured.beneficiary.hkid.placeholder" bundle="${msg}" />"
                                                        value="" onkeyup="hkidValid(this)" onblur="validateHkid('txtOtherBenInsuHkid${inx}','selectOtherBenefitiaryHkidPass${inx}','errtxtOtherBenInsuHkid${inx}',false,'beneficiary');"/> <span id="errtxtOtherBenInsuHkid${inx}"
                                                        class="text-red"> </span>
                                                        <span id="errtxtOtherInvalidBenInsuHkid${inx}"
                                                        class="text-red"> </span>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div> --%>
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
                            
                            <%
                            if (authenticate.equals("false") || "direct".equalsIgnoreCase(request.getSession()
                                    .getAttribute("authenticate").toString())) {
                        %>
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
                        <div class="form-wrap" style="margin-bottom: 10px;">
                        <h4 class="h4-4 product_landing_download_button pull-left">
                            <i class="fa fa-download"></i> <a
                                href="<fmt:message key="travel.brochure.link" bundle="${msg}" />"
                                target="_blank"><fmt:message key="annual.common.productbrochure" bundle="${msg}" />   </a>
                        </h4>
                        <h4 class="h4-4 product_landing_download_button pull-left">
                            <i class="fa fa-download"></i> <a
                                href="https://home.fwd.com.hk/gidoc/policyprovisions/TravelCare_Insurance_JacketLatest.pdf"
                                target="_blank"><fmt:message key="annual.common.policyprovisions" bundle="${msg}" />   </a>
                        </h4>
                        <div class="clearfix"></div>
                        </div>  
                            
                        </div>
                    


                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12  gray-bg pad-none wht-bg3 floatingbox">

                        <div class="hidden-sm hidden-xs">

                            <div class="wd2">
                                <div class="pull-left" style="width:145px;">
                                    <h2 class="h2-3-choose" style="padding-left:0px;font-size: 24px;margin-bottom:0px;"><fmt:message key="travel.sidebar.summary.product" bundle="${msg}" /></h2>
                                    <h2 class="h2-3-choose" style="padding-left:0px;font-size: 24px;margin-top:0px;"><fmt:message key="travel.sidebar.summary.product.single" bundle="${msg}" /></h2>
                                    <h4 style="padding-left:0px;line-height: 0px;font-size: 16px;"><fmt:message key="travel.sidebar.summary.desc.part1" bundle="${msg}" /> ${planName}</h4>
                                    <input type="hidden" name="selectedPlanName" value="${planName }">
                                </div>
                                
                                <div class="pull-right" style="padding-top: 80px;">
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
                                    <fmt:message key="travel.sidebar.summary.option1" bundle="${msg}" /> <a href="<%=request.getContextPath()%>/${language}/travel-insurance"></a>
                                </h3>
                                <h4> 
                                <div class="input-group date"> <span class="input-group-addon in border-radius"><img src="<%=request.getContextPath()%>/resources/images/calendar.png" alt=""></span>
                                         <input name="trLeavingDate" type="text" class="datepicker form-control border-radius" id="txtStartDateDesk" value="${corrTravelQuote.trLeavingDate}" readonly>
                                </div>
                             </h4>
                                <input type="hidden" name="departureDate" id="departureDate"
                                    value="${corrTravelQuote.trLeavingDate}">

                                <h3 class="txt-bold">
                                    <fmt:message key="travel.sidebar.summary.option2" bundle="${msg}" /> <a href="<%=request.getContextPath()%>/${language}/travel-insurance"></a>
                                </h3>
                                <h4>
                                                    <div class="input-group date"> <span class="input-group-addon in border-radius"><span><img src="<%=request.getContextPath()%>/resources/images/calendar.png" alt=""></span></span>
                      <input name="trBackDate" type="text" class="datepicker form-control border-radius" id="txtEndDateDesk" value="${corrTravelQuote.trBackDate}" readonly>
                    </div>
                                
                                </h4>
                                <input type="hidden" name="backDate" id="backDate"
                                    value="${corrTravelQuote.trBackDate}">

                                <div>
                                    <div class="numOfDays col-xs-6 col-sm-6 col-md-6 col-lg-6 pad-none">
	                                    <h3>
	                                    	<fmt:message key="travel.sidebar.summary.option4" bundle="${msg}" />
	                                    </h3>
	                                </div>
	                                <div class="numOfDays col-xs-6 col-sm-6 col-md-6 col-lg-6 pad-none">
                                        <h3 style="text-align: right;font-weight: normal;">
                                        	${corrTravelQuote.totalTravellingDays} 
	                                    	<fmt:message key="travel.sidebar.summary.option5" bundle="${msg}" />
                                        </h3>
                                    </div>

                                    <div class="clearfix"></div>

                                    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 pad-none">
                                        <h3><fmt:message key="annual.quote.care.numberoftraveller" bundle="${msg}" /></h3>
                                    </div>
                                    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 pad-none">
                                        <h3 style="text-align: right;font-weight: normal;">
                                            <%                              
                                                if (sessTravelQuoteBean.getPlanSelected() != null && sessTravelQuoteBean.getPlanSelected().equals("personal"))
                                                { 
                                            %>
                                                    <c:if test="${ corrTravelQuote.totalPersonalTraveller!=0}">
                                                        ${corrTravelQuote.totalPersonalTraveller} <fmt:message key="travel.summary.insured.label.personal" bundle="${msg}" />
                                                    </c:if>
                                                    <!-- vincent, values was stored in adult print adult values though the personal plan is selected!! -->
                                                    <c:if test="${corrTravelQuote.totalAdultTraveller!=0}">
                                                        ${corrTravelQuote.totalAdultTraveller} <fmt:message key="travel.summary.insured.label.personal" bundle="${msg}" />
                                                    </c:if>
            
                                            <%  }
                                                else
                                                {                                       
                                            %>  
            
                                                <c:if test="${ corrTravelQuote.totalAdultTraveller!=0}">${corrTravelQuote.totalAdultTraveller+corrTravelQuote.totalPersonalTraveller} <fmt:message key="travel.summary.insured.label.family.parent" bundle="${msg}" /><br/></c:if>
                                                <c:if test="${ corrTravelQuote.totalChildTraveller!=0}">${corrTravelQuote.totalChildTraveller} <fmt:message key="travel.summary.insured.label.family.child" bundle="${msg}" /><br/></c:if>
                                                <c:if test="${ corrTravelQuote.totalOtherTraveller!=0}">${corrTravelQuote.totalOtherTraveller} <fmt:message key="travel.summary.insured.label.family.others" bundle="${msg}" /><br/></c:if>
                                                <c:if test="${planDetailsForm.travellerCount!=0}"> ${planDetailsForm.travellerCount}</c:if>
                                            <%  } %>
                                        </h3>
                                    </div>

                                    <div class="clearfix"></div>

                                </div>

                                <h3 class="txt-bold" style="display:none;">
                                    <fmt:message key="travel.sidebar.summary.option3" bundle="${msg}" /><a href="<%=request.getContextPath()%>/${language}/travel-insurance"></a>
                                </h3>
                                
                                
                                <input type="hidden" name="planSelected" value="${corrTravelQuote.planSelected}">
                                <h3 class="txt-bold" style="display:none;">
                                    <fmt:message key="travel.sidebar.summary.option4" bundle="${msg}" /> <span>${corrTravelQuote.totalTravellingDays}</span>
                                </h3>
                                <input type="hidden" name="totalTravellingDays" value="${corrTravelQuote.totalTravellingDays}">
                                
                               </div>
            </div>
            <div class="orange-bdr"></div>
                <div style="width: 80%;margin-left: 10%;">
                    <c:if test="${referralCode!=''}">
                        <h3 style="margin-bottom:0px;"><fmt:message key="travel.sidebar.summary.promocode" bundle="${msg}" /></h3>
                        <h4 class="pad-none" style="color:#999;font-size: 22px;margin-top: 0px;">${referralCode}</h4>
                    </c:if>
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
                    <input type="hidden" name="finalOriginalAmount" value="${planPremium}">
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

<p class="padding1 workingholiday-plan-disclaimer"><br>
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
    console.log($("#popUploginform input").serialize());
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
            	console.log(data);
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
	$('select[id^="adultsselectBenificiary"]').each(function(i) {
		var index = i + 1;
		activeDiv('adultsbenificiaryId' + index,'adultsselectBenificiary' + index, 'adultBenefitiaryId' + index, 'adultBenefitiaryHKId' + index);
	});
	$('select[id^="childselectBenificiary"]').each(function(i) {
		var index = i + 1;
		activeDiv('childbenificiaryId' + index,'childselectBenificiary' + index, 'childBenefitiaryName' + index, 'txtchildInsuHkid' + index);
	});
	$('select[id^="otherSelectBenificiary"]').each(function(i) {
		var index = i + 1;
		activeDiv('otherbenificiaryId' + index,'otherSelectBenificiary' + index, 'otherBenefitiaryName' + index, 'txtOtherBenInsuHkid' + index);
	});
};
</script>