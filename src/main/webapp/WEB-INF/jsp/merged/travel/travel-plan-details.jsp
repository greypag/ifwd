<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.ifwd.fwdhk.model.QuoteDetails"%>
<%@page import="com.ifwd.fwdhk.model.TravelQuoteBean"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />

<%
    String authenticate = "false";
    if (request.getSession().getAttribute("authenticate") != null) {
        authenticate = request.getSession()
                .getAttribute("authenticate").toString();
    }
    
    TravelQuoteBean sessTravelQuoteBean = (TravelQuoteBean) session.getAttribute("corrTravelQuote");
    System.out.println("------------------------------------------------------------");     
    System.out.println( "sess Personal: " + sessTravelQuoteBean.getTotalPersonalTraveller() );
    System.out.println( "sess Adult   : " + sessTravelQuoteBean.getTotalAdultTraveller() );
    System.out.println( "sess Child   : " + sessTravelQuoteBean.getTotalChildTraveller() );
    System.out.println( "sess Others  : " + sessTravelQuoteBean.getTotalOtherTraveller() );
    System.out.println("------------------------------------------------------------");

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
<section>
    <div id="cn" class="container">
        <div class="row">
        
            <form:form name="frmYourDetails" id="frmYourDetails" action="${pageContext.request.contextPath}/${language}/travel-insurance/travel-summary" method="post"
                onsubmit="return tPlanValid();" modelAttribute="frmYourDetails">
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
                                <!--
                                        There can be n '.order-status-timeline-completion'
                                        dots-inactive and dots-active color the dots -->
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
                                        class="image-order-status image-order-status-delivered  img-circle disabled third">
                                        <span class="status"><fmt:message key="travel.breadcrumb2.item3" bundle="${msg}" /></span>
                                        <div class="icon">3</div>
                                    </div>
                                    <div
                                        class="image-order-status image-order-status-completed  img-circle disabled fourth">
                                        <span class="status lst-status"><fmt:message key="travel.breadcrumb2.item4" bundle="${msg}" /></span>
                                        <div class="icon">4</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="quote-wrap" class="container pad-none bdr ur-opt-content gray-bg3">
                    <div
                        class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none white-bg1">
                        <br>
                        <%
                            if (authenticate.equals("false") || authenticate.equals("direct")) {
                        %>
                        <h3 class="margin-left-2 h2-3-existing-fwd-head"><fmt:message key="travel.details.login" bundle="${msg}" /></h3>

                        <a href="#"
                            class="col-lg-5 col-md-5 col-sm-5 col-xs-5 btn-box-2 margin-left-2 color4"
                            data-toggle="modal" data-target=".bs-example-modal-lg"><fmt:message key="travel.details.login.action" bundle="${msg}" /></a>
                        <div class="col-lg-6 col-md-6 col-xs-6 col-sm-6 text-left">
                            <h3 class="text-left or-continue">
                                <fmt:message key="travel.details.login.other.part1" bundle="${msg}" />
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


                        <div class="gray-bdr"></div>
                        <table class="table activation-form margin-left-2 vert-middle">
                            <tbody>
                                <tr>
                                    <td colspan="2"><h3
                                            class="black-bold"><fmt:message key="travel.details.applicant.heading" bundle="${msg}" /></h3></td>
                                </tr>
                                <tr>
                                    <td valign="middle" class="col-lg-5 col-md-5 col-sm-5 col-xs-5"><label
                                        for="inputFullName" class="bold-500"><fmt:message key="travel.details.applicant.name" bundle="${msg}" /></label></td>
                                    <td><input type="text" name="fullName"
                                        class="form-control full-control" id="inputFullName"
                                        value="${userDetails.getFullName()}"
                                        placeholder="<fmt:message key="travel.details.applicant.name.placeholder" bundle="${msg}" />" onblur="replaceAlpha(this);"
                                        onkeypress="return alphaOnly(event);" maxlength="100" />
                                    <span id="fullnameinvalid" class="text-red">
                                    </span></td>
                                </tr>
                                <tr>
                                    <td valign="middle">
                                    <div class="styled-select custom-select-label">
                                        <select id="selectHkidPass"
                                            name="selectedHkidPassApplicant" onchange="selected(this)"
                                            class="soflow select-label">
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
                                       <input type="text" name="hkid" class="form-control numberinput textUpper full-control" id="inputTxtAppHkid" placeholder="<fmt:message key="travel.details.applicant.hkid.placeholder" bundle="${msg}" />" onkeyup="hkidValid(this)">
                                       <span id="errAppHkid" class="text-red" ></span>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="middle"><label for="inputMobileNo"
                                        class="bold-500"><fmt:message key="travel.details.applicant.mobile" bundle="${msg}" /></label></td>
                                    <td><input name="mobileNo" type="text"
                                        class="form-control full-control" value="${userDetails.getMobileNo().trim()}"
                                        id="inputMobileNo" placeholder="<fmt:message key="travel.details.applicant.mobile.placeholder" bundle="${msg}" />"
                                        onkeypress="return isNumeric(event)"
                                        onblur="replaceNumeric(this);" maxlength="8" /> 
                                    <span id="errMobileNo" class="text-red">
                                    </span></td>
                                </tr>
                                <tr>
                                    <td valign="middle"><label for="inputEmailId"
                                        class="bold-500"><fmt:message key="travel.details.applicant.email" bundle="${msg}" /></label></td>
                                    <td><input class="form-control full-control" name="emailAddress"
                                        value="${userDetails.getEmailAddress().trim()}" id="inputEmailId"
                                        placeholder="<fmt:message key="travel.details.applicant.email.placeholder" bundle="${msg}" />" maxlength="50"> <span id="emailid" class="text-red"></span></td>
                                </tr>
                            </tbody>
                        </table>
                        <%
                            if (authenticate.equals("false") || "direct".equalsIgnoreCase(request.getSession()
                                    .getAttribute("authenticate").toString())) {
                        %>
                        <div class="gray-bg3-wid">
                            <table class="table plandetail-form margin-left-2 vert-middle"
                                id="input-white">
                                <tbody>
                                    <tr>
                                        <td colspan="2"><h3><fmt:message key="travel.details.registration.heading" bundle="${msg}" /></h3>
                                            <i><fmt:message key="travel.details.registration.desc" bundle="${msg}" /></i> <br></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="col-lg-5 col-md-5 col-sm-5 col-xs-5"><label
                                            class="bold-500"><fmt:message key="travel.details.registration.username" bundle="${msg}" /></label></td>
                                        <td><input type="text"
                                            name="username" class="form-control full-control"
                                            id="Username" placeholder="<fmt:message key="travel.details.registration.username.placeholder" bundle="${msg}" />"><span
                                            id="UsernameError" class="text-red"> </span></td>
                                    </tr>
                                    <tr>
                                        <td><label
                                            class="bold-500"><fmt:message key="travel.details.registration.password" bundle="${msg}" /></label></td>
                                        <td><input type="password"
                                            name="password" class="form-control full-control"
                                            id="Password" placeholder="<fmt:message key="travel.details.registration.password.placeholder" bundle="${msg}" />" autocomplete="off"> <span
                                            id="PasswordError" class="text-red"> </span></td>
                                    </tr>
                                    <tr>
                                        <td><label
                                            class="bold-500"><fmt:message key="travel.details.registration.confirmPassword" bundle="${msg}" /></label></td>
                                        <td><input type="password"
                                            class="form-control full-control" id="Confirm-Password"
                                            placeholder="<fmt:message key="travel.details.registration.confirmPassword.placeholder" bundle="${msg}" />" autocomplete="off"> <span id="Confirm-PasswordError"
                                            class="text-red"> </span></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
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

                        


                        <div class="col-xs-12 col-sm-12 col-md-12 pad-none insure-travel">
                            <input type="hidden" name="totalPersonalTraveller"
                                id="totalPersonalTraveller"
                                value="${corrTravelQuote.getTotalPersonalTraveller()}">
                            <c:forEach var="inx" begin="1"
                                end="${corrTravelQuote.getTotalPersonalTraveller()}">
                                <div id="personaltraveller">
                                    <h4 class="color1 top-mrg-10 margin-left-28">
                                        <fmt:message key="travel.details.insured.label.personal" bundle="${msg}" />
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
                                                        id="txtPersonalFullName${inx}" name="personalName" value="${userDetails.getFullName()}"
                                                        class="form-control full-control" placeholder="<fmt:message key="travel.details.insured.name.placeholder" bundle="${msg}" />"
                                                        onblur="replaceAlpha(this);"
                                                        onkeypress="    return alphaOnly(event);" maxlength="100" />
                                                    </c:if>
                                                    <c:if test="${inx > 1}">
                                                    <input type="text"
                                                        id="txtPersonalFullName${inx}" name="personalName" value=""
                                                        class="form-control full-control" placeholder="<fmt:message key="travel.details.insured.name.placeholder" bundle="${msg}" />"
                                                        onblur="replaceAlpha(this);"
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
                                                     <input id="txtInsuHkid${inx}" name="personalHKID" class="form-control textUpper full-control" placeholder="<fmt:message key="travel.details.insured.hkid.placeholder" bundle="${msg}" />" value="" onkeyup="hkidValid(this)"/> 
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
                                                            name="personalAgeRange" class="soflow select-label"
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
                                                        class="soflow select-label" >
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
                                                        onblur="replaceAlpha(this);"
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
                                                    value="" onkeyup="hkidValid(this)"/> <span id="errpersonalBenefitiaryHKId${inx}"
                                                    class="text-red"> </span><span id="errInvalidpersonalBenefitiaryHKId${inx}"
                                                    class="text-red"> </span>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </c:forEach>
                                
                            <input type="hidden" name="totalAdultTraveller"
                                id="totalAdultTraveler"
                                value="${corrTravelQuote.getTotalAdultTraveller()}">
                            <c:forEach var="inx" begin="1"
                                end="${corrTravelQuote.getTotalAdultTraveller()}">
                                <div id="adulttraveller">
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
                                                        id="txtAdFullName${inx}" name="adultName" value="${userDetails.getFullName()}"
                                                        class="form-control full-control" placeholder="<fmt:message key="travel.details.insured.name.placeholder" bundle="${msg}" />"
                                                        onblur="replaceAlpha(this);"
                                                        onkeypress="    return alphaOnly(event);" maxlength="100" />
                                                    </c:if>
                                                    <c:if test="${inx > 1}">
                                                    <input type="text"
                                                        id="txtAdFullName${inx}" name="adultName" value=""
                                                        class="form-control full-control" placeholder="<fmt:message key="travel.details.insured.name.placeholder" bundle="${msg}" />"
                                                        onblur="replaceAlpha(this);"
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
                                                     <input id="txtInsuHkid${inx}" name="adultHKID" class="form-control textUpper full-control" placeholder="<fmt:message key="travel.details.insured.hkid.placeholder" bundle="${msg}" />" value="" onkeyup="hkidValid(this)"/> 
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
                                                            name="adultAgeRange" class="soflow select-label"
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
                                                        class="soflow select-label" >
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
                                                        onblur="replaceAlpha(this);"
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
                                                    value="" onkeyup="hkidValid(this)"/> <span id="erradultBenefitiaryHKId${inx}"
                                                    class="text-red"> </span><span id="errInvalidadultBenefitiaryHKId${inx}"
                                                    class="text-red"> </span>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </c:forEach>

                            <!-- child  -->
                            <input type="hidden" name="totalChildTraveller"
                                id="totalCountOfChild"
                                value="${corrTravelQuote.getTotalChildTraveller()}">
                            <c:forEach var="inx" begin="1"
                                end="${corrTravelQuote.getTotalChildTraveller()}">
                                <div id="childtraveller">
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
                                                        onblur="replaceAlpha(this);"
                                                        onkeypress="    return alphaOnly(event);" maxlength="100" />
                                                    <span id="errtxtChldFullName${inx}" class="text-red"></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="styled-select custom-select-label">
                                                        <select id="selectChldHkidPass${inx}" class="form-control soflow select-label" name="selectedChldHkidPass">
                                                            <option value="HKID" selected="selected"><fmt:message key="travel.details.insured.hkid.option1" bundle="${msg}" /></option>
                                                            <option value="passport"><fmt:message key="travel.details.insured.hkid.option2" bundle="${msg}" /></option>
                                                        </select>
                                                    </div>
                                                </td>
                                                <td>
                                                    <input
                                                    id="txtChldInsuHkid${inx}" name="childHKID"
                                                    class="form-control textUpper full-control" placeholder="<fmt:message key="travel.details.insured.beneficiary.hkid.placeholder" bundle="${msg}" />"
                                                    value="" onkeyup="hkidValid(this)"/> <span id="errtxtChldInsuHkid${inx}"
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
                                                            class="soflow select-label">
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
                                                        class="soflow select-label">
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
                                                        onblur="replaceAlpha(this);"
                                                        onkeypress="    return alphaOnly(event);" maxlength="100" />
                                                    <span id="errchildBenefitiaryName${inx}" class="text-red"></span>
                                                </td>
                                            </tr>
                                            <tr id="childbenificiaryId${inx}b" class="hide">
                                                <td>
                                                    <div class="styled-select custom-select-label">
                                                        <select id="selectChildBenefitiaryHkidPass${inx}" class="form-control soflow select-label" name="selectedChldBenefitiaryHkidPass">
                                                            <option value="HKID" selected="selected"><fmt:message key="travel.details.insured.beneficiary.hkid.option1" bundle="${msg}" /></option>
                                                            <option value="passport"><fmt:message key="travel.details.insured.beneficiary.hkid.option2" bundle="${msg}" /></option>
                                                        </select>
                                                    </div>
                                                </td>
                                                <td>
                                                    <input
                                                    id="txtchildInsuHkid${inx}" name="childBenificiaryHkid"
                                                    class="form-control textUpper full-control" placeholder="<fmt:message key="travel.details.insured.beneficiary.hkid.placeholder" bundle="${msg}" />"
                                                    value="" onkeyup="hkidValid(this)"/> <span id="errtxtchildInsuHkid${inx}"
                                                    class="text-red"> </span><span id="errtxtInvalidchildInsuHkid${inx}"
                                                    class="text-red"> </span>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </c:forEach>

                            <!--other traveller-->
                            <input type="hidden" name="totalOtherTraveller"
                                id="totalCountOther"
                                value="${corrTravelQuote.getTotalOtherTraveller()}">
                            <c:forEach var="inx" begin="1"
                                end="${corrTravelQuote.getTotalOtherTraveller()}">
                                <div id="childtraveller">
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
                                                        onblur="replaceAlpha(this);"
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
                                                    value="" onkeyup="hkidValid(this)"/> <span id="errtxtOtherInsuHkid${inx}"
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
                                                        onblur="replaceAlpha(this);"
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
                                                        value="" onkeyup="hkidValid(this)"/> <span id="errtxtOtherBenInsuHkid${inx}"
                                                        class="text-red"> </span>
                                                        <span id="errtxtOtherInvalidBenInsuHkid${inx}"
                                                        class="text-red"> </span>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </c:forEach>


               </div>


                       <div class="clearfix"></div>
						<div class="spacer3"></div>
							
							<div class="declaration-content">
								<h4 class="h4-2"><fmt:message key="travel.details.declarations.heading" bundle="${msg}" /></h4>
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
                    


                    <div
                        class="col-lg-5 col-md-5 col-sm-12 col-xs-12  gray-bg pad-none wht-bg3 floatingbox">

                        <div class="hidden-sm hidden-xs">

                            <div class="wd2">
                                <div class="pull-left">
                                    <h2 class="h2-3-choose"><fmt:message key="travel.sidebar.summary.product" bundle="${msg}" /></h2>
                                    <h4><fmt:message key="travel.sidebar.summary.desc.part1" bundle="${msg}" /> ${planName} <fmt:message key="travel.sidebar.summary.desc.part2" bundle="${msg}" /></h4>
                                    <input type="hidden" name="selectedPlanName" value="${planName }">
                                </div>
                                <div class="pull-right">
                                    <div class="text-left pad-right1 h2-2 h2">
                                        <div class="hk">
                                            <fmt:message key="travel.dollar" bundle="${msg}" />
                                            <div class="flightcare-hk">${planPremium}</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div class="orange-bdr"></div>
                            <div class="form-container">
                                <h3 class="txt-bold">
                                    <fmt:message key="travel.sidebar.summary.option1" bundle="${msg}" /> <a href="<%=request.getContextPath()%>/${language}/travel-insurance"> <span
                                        class="span2 uline"><fmt:message key="travel.action.change" bundle="${msg}" /></span></a>
                                </h3>
                                <h4> 
                                <div class="input-group date" id="trval-dp1"> <span class="input-group-addon in border-radius"><span><img src="<%=request.getContextPath()%>/resources/images/calendar.png" alt=""></span></span>
                                         <input name="trLeavingDate" type="text" class="datepicker form-control border-radius" id="txtStartDateDesk" value="${corrTravelQuote.getTrLeavingDate()}" readonly>
                                </div>
                             </h4>
                                <input type="hidden" name="departureDate" id="departureDate"
                                    value="01-01-2015">

                                <h3 class="txt-bold">
                                    <fmt:message key="travel.sidebar.summary.option2" bundle="${msg}" /> <a href="<%=request.getContextPath()%>/${language}/travel-insurance"><span
                                        class="span2 uline"><fmt:message key="travel.action.change" bundle="${msg}" /></span></a>
                                </h3>
                                <h4>
                                                    <div class="input-group date" id="trval-dp2"> <span class="input-group-addon in border-radius"><span><img src="<%=request.getContextPath()%>/resources/images/calendar.png" alt=""></span></span>
                      <input name="trBackDate" type="text" class="datepicker form-control border-radius" id="txtEndDateDesk" value="${corrTravelQuote.getTrBackDate()}" readonly>
                    </div>
                                
                                </h4>
                                <input type="hidden" name="backDate" id="backDate"
                                    value="${corrTravelQuote.getTrBackDate()}">

                                <h3 class="txt-bold">
                                    <fmt:message key="travel.sidebar.summary.option3" bundle="${msg}" /><a href="<%=request.getContextPath()%>/${language}/travel-insurance"> <span
                                        class="span2 uline"><fmt:message key="travel.action.change" bundle="${msg}" /></span></a>
                                </h3>
                                <h4>
                                <%                              
                                    if (sessTravelQuoteBean.getPlanSelected() != null && sessTravelQuoteBean.getPlanSelected().equals("personal"))
                                    { 
                                %>
                                        <c:if test="${ corrTravelQuote.getTotalPersonalTraveller()!=0}">
                                            <fmt:message key="travel.summary.insured.label.personal" bundle="${msg}" />
                                            : ${corrTravelQuote.getTotalPersonalTraveller()}
                                        </c:if>
                                        <!-- vincent, values was stored in adult print adult values though the personal plan is selected!! -->
                                        <c:if test="${corrTravelQuote.getTotalAdultTraveller()!=0}">
                                            <fmt:message key="travel.summary.insured.label.personal" bundle="${msg}" />
                                            : ${corrTravelQuote.getTotalAdultTraveller()}
                                        </c:if>

                                <%  }
                                    else
                                    {                                       
                                %>  

                                    <c:if test="${ corrTravelQuote.getTotalAdultTraveller()!=0}"><fmt:message key="travel.summary.insured.label.family.parent" bundle="${msg}" />: ${corrTravelQuote.getTotalAdultTraveller()+corrTravelQuote.getTotalPersonalTraveller()}</c:if>
                                    <c:if test="${ corrTravelQuote.getTotalChildTraveller()!=0}"><br><fmt:message key="travel.summary.insured.label.family.child" bundle="${msg}" />: ${corrTravelQuote.getTotalChildTraveller()}</c:if>
                                    <c:if test="${ corrTravelQuote.getTotalOtherTraveller()!=0}"><br><fmt:message key="travel.summary.insured.label.family.others" bundle="${msg}" />: ${corrTravelQuote.getTotalOtherTraveller()}</c:if>
                                    <c:if test="${planDetailsForm.getTravellerCount()!=0}"> ${planDetailsForm.getTravellerCount()}</c:if>
                                <%  } %>
                                </h4>
                                
                                <input type="hidden" name="planSelected" value="${corrTravelQuote.getPlanSelected()}">
                                <h3 class="txt-bold">
                                    <fmt:message key="travel.sidebar.summary.option4" bundle="${msg}" /> <span>${corrTravelQuote.getTotalTravellingDays()}</span>
                                </h3>
                                <h3><fmt:message key="travel.sidebar.summary.promocode" bundle="${msg}" /></h3>
            </div>
                    <h3 class="h4-1-orange-b col-lg-6 col-md-6"><fmt:message key="travel.sidebar.summary.subtotal" bundle="${msg}" /> </h3>
                    <h3 class="h4-1-orange-b col-lg-6 col-md-6 text-right">${planPremium}</h3>
                    <h3 class="h4-1-orange-b col-lg-6 col-md-6"><fmt:message key="travel.sidebar.summary.discount" bundle="${msg}" /> </h3>
                    <h3 class="h4-1-orange-b col-lg-6 col-md-6 text-right">${planDiscount} </h3>
                    <div class="clearfix"></div>
                    <div class="orange-bdr"></div>
                    <h3 class="h4-1-orange-b col-lg-6 col-md-6"><fmt:message key="travel.sidebar.summary.amountDue" bundle="${msg}" />  </h3>
                    <h3 class="h4-1-orange-b col-lg-6 col-md-6 text-right">${planSummary}</h3>
                    <input type="hidden" name="finalDueAmount" value="${planSummary}">
            
            </div>
            
            <!--mob-->
<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pull-left">
     <a href="<%=request.getContextPath()%>/${language}/travel-insurance/quote" class="bdr-curve btn btn-primary bck-btn"><fmt:message key="travel.action.back" bundle="${msg}" /> </a>
</div>
<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pull-right"> 
    <input type="submit" class="bdr-curve-none btn btn-primary btn-next" value=" <fmt:message key="travel.action.next" bundle="${msg}" />" />
</div>
<div class="clearfix"></div>
<br>
</div>
<div class="clearfix"></div>
</div>
<p class="padding1 hidden-sm hidden-xs"><fmt:message key="travel.quote.other.disclaimer.part1" bundle="${msg}" />
<a class="sub-link" href="<%=request.getContextPath()%>/<fmt:message key="travel.provision.link" bundle="${msg}" />" target="_blank">
<fmt:message key="travel.quote.other.disclaimer.part2" bundle="${msg}" /></a> 
<fmt:message key="travel.quote.other.disclaimer.part3" bundle="${msg}" />
<fmt:message key="travel.quote.other.disclaimer.part4" bundle="${msg}" /></p>
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
                <input type="text" class="form-control" placeholder="" id="txtPromoEmail">
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
    function activeDiv(id, selected) {
        var selectedValue = $('#' + selected).val();
        if (id.indexOf('personal') > -1) {
            activeDeactive(selectedValue, id);
        }
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
            $('#' + id + 'b').addClass('hide');
        } else {
            $('#' + id).removeClass('hide');
            $('#' + id + 'b').removeClass('hide');
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