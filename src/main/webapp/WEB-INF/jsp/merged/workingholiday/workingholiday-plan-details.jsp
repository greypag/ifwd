<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.ifwd.fwdhk.model.QuoteDetails"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="enhance" uri="http://pukkaone.github.com/jsp" %>
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<%@page import="java.util.*"%>
<%@page	import="com.ifwd.fwdhk.model.DistrictBean,com.ifwd.fwdhk.model.WorkingHolidayDetailsBean"%>


<%
	String authenticate = "false";
	if (request.getSession().getAttribute("authenticate") != null) {
		authenticate = request.getSession()
				.getAttribute("authenticate").toString();
	}
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="">
<script>
	this.rootUrl="<%=request.getContextPath()%>";
	this.rootLang="/<%=session.getAttribute("language").toString()%>";
	
	function setDropArea(id) {
		$('#selectCADistHid').find('option[value="' + id + '"]').attr('selected', 'selected');
		
		if ($("#selectCADistHid option[value='"+id+"']").text() == "HK")
            document.getElementById("inlineCARadio3").checked = true;
        else if ($("#selectCADistHid option[value='"+id+"']").text() == "KL")
            document.getElementById("inlineCARadio4").checked = true;
        else
            document.getElementById("inlineCARadio5").checked = true;
	}
	
	
	var namePlaceholder="<fmt:message key="workingholiday.details.applicant.name.placeholder" bundle="${msg}" />";
	var hkidPlaceholder="<fmt:message key="workingholiday.details.applicant.hkid.placeholder" bundle="${msg}" />";
	var appMobilePlaceholder = "";
	var appEmailPlaceholder = "";
	
	var benNamePlaceholder="<fmt:message key="workingholiday.details.insured.beneficiary.name.placeholder" bundle="${msg}" />";
	var benHkidPlaceholder="<fmt:message key="workingholiday.details.insured.beneficiary.hkid.placeholder" bundle="${msg}" />";

	var roomPlaceholder="<fmt:message key="home.details.registration.insuaddress.room.placeholder" bundle="${msg}" />";
	var floorPlaceholder="<fmt:message key="home.details.registration.insuaddress.floor.placeholder" bundle="${msg}" />";
	var blockPlaceholder="<fmt:message key="home.details.registration.insuaddress.block.placeholder" bundle="${msg}" />";
	var buildingPlaceholder="<fmt:message key="home.details.registration.insuaddress.building.placeholder" bundle="${msg}" />";
	var estatePlaceholder="<fmt:message key="home.details.registration.insuaddress.estate.placeholder" bundle="${msg}" />";
	var streetNoPlaceholder="<fmt:message key="home.details.registration.insuaddress.streetNo.placeholder" bundle="${msg}" />";
	var streetNamePlaceholder="<fmt:message key="home.details.registration.insuaddress.streetName.placeholder" bundle="${msg}" />";
</script>

<script>
function activateUserAccountJoinUs() {
    perventRedirect=false;
    $('#loading-overlay').modal({backdrop: 'static',keyboard: false});
    
    setTimeout(function(){
    	if(whDetailsValid()){
            $('#frmYourDetails').submit();
    	}
    }, 500);
}
</script>

</head>
<body>
<!--/#main-Content-->
<section>
	<div id="cn" class="container">
		<div class="row">

			<form:form name="frmYourDetails" id="frmYourDetails"
			    action="${pageContext.request.contextPath}/${language}/working-holiday-insurance/working-holiday-summary" method="post"
				onsubmit="return confirmDetails(this);">
				<div class="container ">
					<div class="col-md-12 shop-tracking-status">
						<div class="center wow fadeInDown animated"
							style="visibility: visible;">
							<h2 class="workingholiday-plan-jumbo-header">
								<fmt:message key="workingholiday.details.jumbo" bundle="${msg}" />
							</h2>
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
										<span class="status color3"><fmt:message
												key="workingholiday.breadcrumb2.item1" bundle="${msg}" /></span>
										<div class="icon">1</div>
									</div>

									<div
										class="image-order-status image-order-status-intransit  img-circle act second">
										<span class="status color2"><fmt:message
												key="workingholiday.breadcrumb2.item2" bundle="${msg}" /></span>
										<div class="icon">2</div>
									</div>
									<div
										class="image-order-status image-order-status-delivered  img-circle third">
										<span class="status"><fmt:message
												key="workingholiday.breadcrumb2.item3" bundle="${msg}" /></span>
										<div class="icon">3</div>
									</div>
									<div
										class="image-order-status image-order-status-completed  img-circle fourth">
										<span class="status lst-status"><fmt:message
												key="workingholiday.breadcrumb2.item4" bundle="${msg}" /></span>
										<div class="icon">4</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
                <ol class="breadcrumb pad-none">
                    <li><fmt:message
                                key="workingholiday.breadcrumb1.item1" bundle="${msg}" /> <i
                        class="fa fa-caret-right"></i></li>
                   <li><fmt:message key="home.breadcrumb1.type1" bundle="${msg}" /> <i class="fa fa-caret-right"></i></li>                        
                    <li><fmt:message
                                key="workingholiday.breadcrumb1.item2" bundle="${msg}" /> <i
                        class="fa fa-caret-right"></i></li>
                    <!--<li><a href="#"><fmt:message
                                key="workingholiday.breadcrumb1.item3" bundle="${msg}" /></a></li>-->
                    <li class="active "><i class="fa fa-caret-right"></i>
                    <fmt:message key="workingholiday.breadcrumb1.item4" bundle="${msg}" /></li>
                </ol>				
				<div id="quote-wrap"
					class="container pad-none bdr ur-opt-content gray-bg3">











					<div
						class="col-lg-8 col-md-8 col-xs-12 col-sm-12 pad-none white-bg1">
						<br>
						<div class="form-wrap">
							<%
								if (authenticate.equals("false")
											|| authenticate.equals("direct")) {
							%>
							<h3 class="h2-3-existing-fwd-head bmg-detail-exist-member-head">
								<fmt:message key="workingholiday.details.login" bundle="${msg}" />
								<!--
		                        278
		                        --> 
		                        <a 
		                        class="tool-tip show-inline-md"
		                        data-toggle="tooltip" data-placement="bottom"
		                        title="<fmt:message key="member.account.login.help" bundle="${msg}" />">
		                        <img src="<%=request.getContextPath()%>/resources/images/ic.png"
		                        alt=""></a>
							</h3>
							<a href="#"
								class="col-lg-3 col-md-3 col-sm-3 col-xs-3 btn-box-2 color4 login-btn"
								data-toggle="modal" data-target="#loginpopup"><fmt:message
									key="workingholiday.details.login.action" bundle="${msg}" /></a>
							<div class="col-lg-9 col-md-9 col-xs-9 col-sm-9 text-left">
								<h3 class="text-left or-continue">
									<fmt:message key="workingholiday.details.login.other.part1"
										bundle="${msg}" />
									<fmt:message key="workingholiday.details.login.other.part2"
										bundle="${msg}" />
								</h3>
							</div>
							<%
								} else {
							%>
							<input type="hidden" id="isLogin" value="true">
							<%
								}
							%>
						</div>

						<div class="clearfix"></div>
						<br />
						<div class="gray-bdr"></div>
						<!-- updated responsive design start -->
						<div class="form-wrap">
							<div class="big-title black-bold pad-none bmg-big-title">
								<fmt:message key="home.details.applicant.heading"
									bundle="${msg}" />
							</div>
							<div class="form-group float">
								<span id="errorMsg"  class="text-red">${errormsg}</span>
							</div>
							<!-- english name start -->
							<div class="form-group float">
								<div
									class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
									<label for="inputFullName" class="field-label bold-500">
										<fmt:message key="workingholiday.details.applicant.name"
											bundle="${msg}" />
									</label>
								</div>
								<div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
									<!-- <input type="text" class="form-control full-control textUpper"
										id="inputFullName" name="whAppFullName"
										value="${userDetails.fullName}"
										onblur="replaceAlpha(this); chkNotNullApplicantName(this, 'inputFullName');"
										onkeypress=" return alphaOnly(event);" maxlength="50" /> -->
									<input type="text" class="js-field-fullname form-control full-control textUpper <c:if test="${!(userDetails != null && userDetails.fullName != '' && userDetails.userName != '*DIRECTGI')}">bmg_custom_placeholder</c:if>"
                                        id="inputFullName" name="whAppFullName"
                                        <c:choose>
										    <c:when test="${userDetails != null && userDetails.fullName != '' && userDetails.userName != '*DIRECTGI'}">
										    value="${userDetails.fullName }" readonly="readonly"
										    </c:when>
										    <c:otherwise>
										    value="<fmt:message key="workingholiday.details.applicant.name.placeholder" bundle="${msg}" />"
                                            </c:otherwise>
										</c:choose>
                                        onfocus="placeholderOnFocus(this,'<fmt:message key="workingholiday.details.applicant.name.placeholder" bundle="${msg}" />');" 
                                        onblur="placeholderOnBlur(this,'<fmt:message key="workingholiday.details.applicant.name.placeholder" bundle="${msg}" />'); chkNotNullApplicantName(this, 'inputFullName', namePlaceholder);"
                                        onkeypress=" return alphaOnly(event);" maxlength="50" />
							         <span id="whAppFullName" class="text-red"></span>
								</div>
							</div>
							<!-- english name end -->
							<!-- id card starts -->
							<div class="form-group float">
								<div
									class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
									<div class="bmg-label-styled-select styled-select">
										<select name="selectWhAppHKID" id="selectWhAppHKID"
											class="form-control soflow select-label"
											onchange="selected(this); togglePlaceholder(this,'inputWhAppHKID','<fmt:message key="workingholiday.details.applicant.hkid.placeholder" bundle="${msg}" />');">
											<c:forEach var="hkidList" items="${mapHkId}">
												<option
                                                    value="${hkidList.key}">
                                                    <c:out
                                                        value="${hkidList.value}" />
                                                </option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
									<input type="text" name="whAppHKID"
                                           value="<fmt:message key="workingholiday.details.applicant.hkid.placeholder" bundle="${msg}" />"
									   class="js-field-hkid form-control numberinput textUpper full-control bmg_custom_placeholder"
										id="inputWhAppHKID"
										onfocus="placeholderOnFocus(this,'<fmt:message key="workingholiday.details.applicant.hkid.placeholder" bundle="${msg}" />');"
										onblur="placeholderOnBlur(this,'<fmt:message key="workingholiday.details.applicant.hkid.placeholder" bundle="${msg}" />'); 
                                        chkValidApplicantHkId(this, 'whAppHKID', 'selectWhAppHKID');"
										onkeypress=" return hkidOnkeypress(event);"> <span id="whAppHKID"
										class="text-red"></span>
								</div>
							</div>
							<!-- id card ends -->
							<!-- birthday starts -->
							<div class="form-group float">
								<div
									class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
									<label for="inputWhAppDob" class="field-label bold-500">
										<fmt:message key="workingholiday.details.applicant.dob"
											bundle="${msg}" />
									</label>
								</div>
								<div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
									<div class="input-group date" id="dpWhAppDob">
										<span class="input-group-addon in border-radius"><img
											src="<%=request.getContextPath()%>/resources/images/calendar.png"
											alt=""></span> 
										<input name="whAppDob" type="text"
											class="datepicker form-control border-radius"
											id="inputWhAppDob"
											readonly>
									</div>
									<span id="whAppDob" class="text-red"> </span>
								</div>
							</div>
							<!-- birthday ends -->
							<!-- mobile starts -->
							<div class="form-group float">
								<div
									class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
									<label for="inputMobileNo" class="field-label bold-500">
										<fmt:message key="workingholiday.details.applicant.mobile"
											bundle="${msg}" />
									</label>
								</div>
								<div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
									<input type="tel" class="form-control full-control"
										id="inputMobileNo" name="whAppMobileNO"
										value="${userDetails.mobileNo}"
										<c:choose>
										    <c:when test="${userDetails != null && userDetails.userName != '' && userDetails.userName != '*DIRECTGI'}">
										    readonly="readonly"
										    </c:when>
										</c:choose>
										onkeypress="return isNumeric(event)"
										onblur="replaceNumeric(this); chkValidApplicantMobileNo(this, 'whAppMobileNO');"
										maxlength="8" /> <span id="whAppMobileNO" class="text-red"></span>
								</div>
							</div>
							<!-- mobile ends -->
							<!-- email address starts -->
							<div class="form-group float">
								<div
									class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
									<label for="inputEmailId" class="field-label bold-500">
										<fmt:message key="workingholiday.details.applicant.email"
											bundle="${msg}" />
									</label>
								</div>
								<div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
									<input class="form-control full-control textLower" id="inputEmailId"
										name="whAppEmailAdd" type="email"
										value="${userDetails.emailAddress}"
										<c:choose>
										    <c:when test="${userDetails != null && userDetails.userName != '' && userDetails.userName != '*DIRECTGI'}">
										    readonly="readonly"
										    </c:when>
										</c:choose>
										onblur="chkValidApplicantEmail(this, 'whAppEmailAdd');"
										onkeypress="return validationEmail(event);"
										maxlength="50"> <span id="whAppEmailAdd"
										class="text-red"> </span>
								</div>
							</div>
							<!-- email address ends -->

							<%-- <div class="form-group float">
                                   <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                       <label for="whInsAgeRange" class="field-label bold-500">
                                           <fmt:message key="workingholiday.details.insured.beneficiary.age" bundle="${msg}" />
                                       </label>
                                   </div>
                                   <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                        <div class="styled-select">
                                       <select name="whInsAgeRange" class="form-control soflow select-label" id="selectWhInsAgeRange">
                                            <c:forEach
                                                var="ageList" items="${mapSelfType}">
                                                <c:choose>
                                                    <c:when
                                                        test="${(ageList.key == '2' && workingHolidayPlanDetailsForm.getWhInsAgeRange() == '') || workingHolidayPlanDetailsForm.getWhInsAgeRange() == ageList.key}">
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
                                        </select>
                                        </div>
                                        <span id="whInsAgeRange" class="text-red"></span>
                                   </div>
                               </div> --%>

							<!-- beneficiary start -->
							<div class="form-group float">
								<div
									class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
									<label for="selectWhInsBeneficary" class="field-label bold-500"><fmt:message
											key="workingholiday.details.insured.beneficiary.beneficiary"
											bundle="${msg}" /></label>
								</div>
								<div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
									<div class="styled-select">
										<select name="whInsBeneficary" id="selectWhInsBeneficary"
											onChange="activeDiv('whbenificiaryId','selectWhInsBeneficary')"
											class="form-control soflow select-label">
	                                        <c:forEach var="relationshipList" items="${mapRelationshipCode}">
	                                        	<enhance:out escapeXml="false">
	                                            <option value="${relationshipList.key}"><c:out
	                                                    value="${relationshipList.value}" /></option>
	                                            </enhance:out>
	                                        </c:forEach>
										</select>
									</div>
									<span id="whInsBeneficary" class="text-red"></span>
								</div>
							</div>
							<!-- beneficiary end -->
							<!-- personalbenificiaryId start -->
							<div
								class="form-group float <c:if test="${workingHolidayPlanDetailsForm == null || workingHolidayPlanDetailsForm.whInsBeneficary == null || workingHolidayPlanDetailsForm.whInsBeneficary == 'SE'}">hide</c:if>"
								id="whbenificiaryId">
								<div
									class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
									<label for="inputWhInsFullName" class="field-label bold-500"></label>
								</div>
								<div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
									<div
										class="form-label col-lg-5 col-md-5 col-sm-5 col-xs-5 pad-none">
										<label for="inputWhInsFullName" class="field-label bold-500">
											<fmt:message
												key="workingholiday.details.insured.beneficiary.name"
												bundle="${msg}" />
										</label>
									</div>
									<div class="col-lg-7 col-md-7 col-sm-7 col-xs-7 pad-none">
										<input type="text" name="whInsFullName"
											id="inputWhInsFullName"
											class="js-field-fullname form-control full-control textUpper bmg_custom_placeholder"
											value="<fmt:message key="workingholiday.details.insured.beneficiary.name.placeholder" bundle="${msg}" />"
											onfocus="placeholderOnFocus(this,'<fmt:message key="workingholiday.details.insured.beneficiary.name.placeholder" bundle="${msg}" />');"
                                            onblur="placeholderOnBlur(this,'<fmt:message key="workingholiday.details.insured.beneficiary.name.placeholder" bundle="${msg}" />'); validateName('inputWhInsFullName','whInsFullName',false,'beneficiary');"
											onkeypress="    return alphaOnly(event);" maxlength="100" />
										<span id="whInsFullName" class="text-red"> </span>
									</div>
									<div class="clearfix"></div>
								</div>
							</div>
							<!-- personalbenificiaryId end -->
							<!-- personalbenificiaryId b start -->
							<div
								class="form-group float <c:if test="${workingHolidayPlanDetailsForm == null || workingHolidayPlanDetailsForm.whInsBeneficary == null || workingHolidayPlanDetailsForm.whInsBeneficary == 'SE'}">hide</c:if>"
								id="whbenificiaryIdb">
								<div
									class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
									<label for="inputWhInsHKID"
										class="field-label form-label bold-500"></label>
								</div>
								<div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
									<div
										class="form-label col-lg-5 col-md-5 col-sm-5 col-xs-5 pad-none">
										<label for="inputWhInsHKID"
											class="field-label form-label bold-500"> <fmt:message
												key="workingholiday.details.insured.beneficiary.type"
												bundle="${msg}" />
										</label>
									</div>
									<div class="col-lg-7 col-md-7 col-sm-7 col-xs-7 pad-none">
										<div class="styled-select">
											<select id="selectWhInsHKID" name="selectWhInsHKID"
												class="form-control soflow select-label" onchange="togglePlaceholder(this,'inputWhInsHKID','<fmt:message key="workingholiday.details.insured.beneficiary.hkid.placeholder" bundle="${msg}" />');">
												<c:forEach var="hkidList" items="${mapHkId}">
													<option value="${hkidList.key}">
														<c:out value="${hkidList.value}" />
													</option>
												</c:forEach>
											</select>
										</div>
									</div>
								</div>
							</div>
							<!-- personalbenificiaryId b end -->
							<!-- personalbenificiaryId c start -->
							<div
								class="form-group float <c:if test="${workingHolidayPlanDetailsForm == null || workingHolidayPlanDetailsForm.whInsBeneficary == null || workingHolidayPlanDetailsForm.whInsBeneficary == 'SE'}">hide</c:if>"
								id="whbenificiaryIdc">
								<div
									class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
									<label for="inputWhInsHKID"
										class="field-label form-label bold-500 hidden-lg hidden-md"></label>
								</div>
								<div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
									<div
										class="form-label col-lg-5 col-md-5 col-sm-5 col-xs-5 pad-none">
										<label for="inputWhInsHKID"
											class="field-label form-label bold-500 hidden-lg hidden-md"></label>
									</div>
									<div class="col-lg-7 col-md-7 col-sm-7 col-xs-7 pad-none">
										<input id="inputWhInsHKID" name="whInsHKID"										
											class="js-field-hkid form-control textUpper full-control bmg_custom_placeholder"
											value="<fmt:message key="workingholiday.details.insured.beneficiary.hkid.placeholder" bundle="${msg}" />"
											onkeypress=" return hkidOnkeypress(event);"
											onfocus="placeholderOnFocus(this,'<fmt:message key="workingholiday.details.insured.beneficiary.hkid.placeholder" bundle="${msg}" />');"
											onblur="placeholderOnBlur(this,'<fmt:message key="workingholiday.details.insured.beneficiary.hkid.placeholder" bundle="${msg}" />'); validateHkid('inputWhInsHKID','selectWhInsHKID','whInsHKID',false,'beneficiary');" />
										<span id="whInsHKID" class="text-red"> </span>
									</div>
								</div>
							</div>
							<!-- personalbenificiaryId c end -->

							<div class="form-group float">
								<div
									class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
									<label for="selectWhInsWorkingCty" class="field-label bold-500">
										<fmt:message
											key="workingholiday.details.insured.beneficiary.country"
											bundle="${msg}" />
									</label>
								</div>
								<div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
									<div class="styled-select">
										<select id="selectWhInsWorkingCty" name="whInsWorkingCty"
											class="form-control soflow select-label">
											<c:forEach var="country" items="${countryInfo}">
												<option value="${country.key}">
												    <c:out value="${country.value}" />
												</option>
											</c:forEach>
										</select>
									</div>
									<span id="whInsWorkingCty" class="text-red"> </span>
								</div>
							</div>





							<div class="form-group float">
								<div
									class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
									<label class="field-label bold-500"><fmt:message
											key="home.details.registration.corraddress" bundle="${msg}" /></label>
								</div>
								<div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
									<!-- room, floor, block start -->
									<div class="row form-group">
										<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
											<input type="text" class="js-field-address form-control full-control bmg_custom_placeholder textUpper"
												id="inputWhInsRoom" name="whInsRoom"
												placeholder="<fmt:message key="home.details.registration.corraddress.room.placeholder" bundle="${msg}" />"												
												onfocus="placeholderOnFocus(this,'<fmt:message key="home.details.registration.corraddress.room.placeholder" bundle="${msg}" />');"
												onblur="placeholderOnBlur(this,'<fmt:message key="home.details.registration.corraddress.room.placeholder" bundle="${msg}" />');"
												onkeypress="    return isAlphaNumeric(event);"
												maxlength="10" />
										</div>
										<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
											<input type="text" class="js-field-address form-control full-control bmg_custom_placeholder textUpper"
												id="inputWhInsFloor" name="whInsFloor"
                                                placeholder="<fmt:message key="home.details.registration.corraddress.floor.placeholder" bundle="${msg}" />"
												
												onfocus="placeholderOnFocus(this,'<fmt:message key="home.details.registration.corraddress.floor.placeholder" bundle="${msg}" />');"
												onblur="placeholderOnBlur(this,'<fmt:message key="home.details.registration.corraddress.floor.placeholder" bundle="${msg}" />');"
												onkeypress="    return isAlphaNumeric(event);" maxlength="5" />
										</div>
										<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
											<input type="text" class="js-field-address form-control full-control bmg_custom_placeholder textUpper"
												id="inputWhInsBlock" name="whInsBlock"
                                                   placeholder="<fmt:message key="home.details.registration.corraddress.block.placeholder" bundle="${msg}" />"
												
												onfocus="placeholderOnFocus(this,'<fmt:message key="home.details.registration.corraddress.block.placeholder" bundle="${msg}" />');"
												onblur="placeholderOnBlur(this,'<fmt:message key="home.details.registration.corraddress.block.placeholder" bundle="${msg}" />');"
												onkeypress="    return isAlphaNumeric(event);" maxlength="5" />
										</div>
									</div>
									<!--  room, floor, block end -->
									<!-- building, estate start -->
									<div class="row form-group">
										<div class="col-xs-12">
											<input type="text" class="js-field-address form-control full-control bmg_custom_placeholder textUpper"
												id="inputWhInsBuilding" name="whInsBuilding"
                                                   placeholder="<fmt:message key="home.details.registration.corraddress.building.placeholder" bundle="${msg}" />"
												
												onfocus="placeholderOnFocus(this,'<fmt:message key="home.details.registration.corraddress.building.placeholder" bundle="${msg}" />');"
												onblur="placeholderOnBlur(this,'<fmt:message key="home.details.registration.corraddress.building.placeholder" bundle="${msg}" />'); chkNotNullCABuilding(this, 'whInsBuilding');"
												onkeypress="return isAlphaNumeric(event);" maxlength="50" />
											<span id="whInsBuilding" class="text-red"> </span>
										</div>
									</div>
									<div class="row form-group">
										<div class="col-xs-12">
											<input type="text" class="js-field-address form-control full-control bmg_custom_placeholder textUpper"
												id="inputWhInsEstate" name="whInsEstate"
                                                   placeholder="<fmt:message key="home.details.registration.corraddress.estate.placeholder" bundle="${msg}" />"
												
												onfocus="placeholderOnFocus(this,'<fmt:message key="home.details.registration.corraddress.estate.placeholder" bundle="${msg}" />');"
												onblur="placeholderOnBlur(this,'<fmt:message key="home.details.registration.corraddress.estate.placeholder" bundle="${msg}" />'); chkNotNullCAEstate(this, 'whInsEstate');"
												onkeypress="    return isAlphaNumeric(event);"
												maxlength="50" /> <span id="whInsEstate" class="text-red">
											</span>
										</div>
									</div>
									<!-- building, estate end -->
									<!-- street no., street name start -->
									<div class="row form-group">
										<div class="col-xs-12">
											<input type="text" class="js-field-address form-control full-control bmg_custom_placeholder textUpper"
												id="inputWhInsStreetNo" name="whInsStreetNo"
                                                   placeholder="<fmt:message key="home.details.registration.corraddress.streetNo.placeholder" bundle="${msg}" />"
												
												onfocus="placeholderOnFocus(this,'<fmt:message key="home.details.registration.corraddress.streetNo.placeholder" bundle="${msg}" />');"
												onblur="placeholderOnBlur(this,'<fmt:message key="home.details.registration.corraddress.streetNo.placeholder" bundle="${msg}" />');"
												onkeypress="" maxlength="5" />
										</div>
									</div>
									<div class="row form-group">
										<div class="col-xs-12">
											<input type="text" class="js-field-address form-control full-control bmg_custom_placeholder textUpper"
												id="inputWhInsStreetName" name="whInsStreetName"
                                                   placeholder="<fmt:message key="home.details.registration.corraddress.streetName.placeholder" bundle="${msg}" />"
												
												onfocus="placeholderOnFocus(this,'<fmt:message key="home.details.registration.corraddress.streetName.placeholder" bundle="${msg}" />');"
												onblur="placeholderOnBlur(this,'<fmt:message key="home.details.registration.corraddress.streetName.placeholder" bundle="${msg}" />');"
												onkeypress="    return isAlphaNumeric(event);"
												maxlength="50" />
										</div>
									</div>
									<!-- street no., street name end -->
									<!-- district start -->
									<div class="row form-group">
										<div class="col-xs-12">
											<div class="styled-select" id="inputDistrict">
												<select name="whInsDistrict"
													class="form-control soflow full-control"
													id="selectWhInsDistrict" onchange="setDropArea(this.value)">
													<option value=""><fmt:message
															key="home.details.registration.district" bundle="${msg}" /></option>
													<%
														List lst = (List) request.getAttribute("districtList");
															Iterator itr = lst.iterator();
															int i = 1;
															while (itr.hasNext()) {
																DistrictBean districtList = (DistrictBean) itr.next();
													%>
													<option value="<%=districtList.getCode()%>"><%=districtList.getDescription()%></option>
													<%
														}
													%>
												</select>
											</div>
											<div class="hidden">
												<select name="applicantDistrictHid"
													class="form-control soflow full-control"
													id="selectCADistHid">
													<option value=""><fmt:message
															key="home.details.registration.district" bundle="${msg}" /></option>
													<%
														List lst1 = (List) request.getAttribute("districtList");
															Iterator itr1 = lst1.iterator();
															while (itr1.hasNext()) {
																DistrictBean districtList = (DistrictBean) itr1.next();
													%>
													<option value="<%=districtList.getCode()%>"><%=districtList.getArea()%></option>
													<%
														}
													%>
												</select>
											</div>
											<span id="whInsDistrict" class="text-red"> </span>
										</div>
									</div>
									<!-- district end -->
									<!-- location start -->
									<div class="row form-group">
										<div class="col-xs-12">
											<div class="col-xs-4">
												<label class="radio-inline homecare-lb"> <input
													type="radio" name="whInsArea" id="inlineCARadio3"
													value="HK"
													class="home-input1"> <span><fmt:message
															key="home.details.registration.hk" bundle="${msg}" /> </span>
												</label>
											</div>
											<div class="col-xs-4">
												<label class="radio-inline homecare-lb"> <input
													type="radio" name="whInsArea" id="inlineCARadio4"
													value="KL"
													class="home-input1"> <span> <fmt:message
															key="home.details.registration.kln" bundle="${msg}" /></span>
												</label>
											</div>
											<div class="col-xs-4">
												<label class="radio-inline"> <input type="radio"
													name="whInsArea" id="inlineCARadio5" value="NT"
													class="home-input1"> <span> <fmt:message
															key="home.details.registration.nt" bundle="${msg}" /></span>
												</label>
											</div>
										</div>
									</div>
									<!-- location start -->
								</div>
							</div>

							<div class="form-group float">
								<div
									class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
									<label for="inputWhInseffectiveDate"
										class="control-label bold-500 lhnormal"><fmt:message
											key="workingholiday.details.insured.beneficiary.effective"
											bundle="${msg}" /></label>
								</div>
								<div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
									<div class="input-group date" id="dpEffectiveDate">
										<span class="input-group-addon in border-radius"><span><img
												src="<%=request.getContextPath()%>/resources/images/calendar.png"
												alt=""></span></span> <input name="whInseffectiveDate" type="text"
											class="datepicker form-control border-radius"
											id="inputWhInseffectiveDate"
											readonly>
									</div>
									<span id="whInseffectiveDate" class="text-red"></span>
								</div>
							</div>



                            <div class="form-group float">
                                <div class="form-label col-lg-12 col-md-12 col-sm-12 col-xs-12 pad-none">
                                    <fmt:message key="workingholiday.details.insured.beneficiary.effective.disclaimer" bundle="${msg}" />
                                </div>
                            </div>
                            
                            
                            
						</div>
						<div class="clearfix"></div>
						<%
							if (authenticate.equals("false")
										|| "direct".equalsIgnoreCase(request.getSession()
												.getAttribute("authenticate").toString())) {
						%>
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
							<h4 class="h4-2 bmg-disclaimer-header">
								<fmt:message key="workingholiday.details.declarations.heading"
									bundle="${msg}" />
							</h4>
							<div class="declaration-content"
								style="margin-left: 0px; margin-right: 0px;">
								<div class="checkbox">
									<input id="checkbox1" name="declarration" type="checkbox">
									<label for="checkbox1"> <fmt:message
											key="workingholiday.details.declarations.tnc" bundle="${msg}" />
										<ol class="ol-disclaimer">
											<li><fmt:message
													key="workingholiday.details.declarations.tnc.desc1"
													bundle="${msg}" /></li>
											<li><fmt:message
													key="workingholiday.details.declarations.tnc.desc2"
													bundle="${msg}" /></li>
											<li><fmt:message
													key="workingholiday.details.declarations.tnc.desc3"
													bundle="${msg}" /></li>
											<li><fmt:message
													key="workingholiday.details.declarations.tnc.desc4"
													bundle="${msg}" /></li>
											<li><fmt:message
													key="workingholiday.details.declarations.tnc.desc5"
													bundle="${msg}" /></li>
										</ol>
									</label>
								</div>
								<span id="chk1" class="text-red"></span> <br />
								<div class="checkbox">
									<input id="checkbox2" name="declarration2" type="checkbox">
									<label for="checkbox2"><fmt:message
											key="workingholiday.details.declarations.PICS.part1"
											bundle="${msg}" /> <a
										href="<fmt:message key="PICS.link" bundle="${msg}" />"
										class="sub-link" target="_blank"> <fmt:message
												key="workingholiday.details.declarations.PICS.part2"
												bundle="${msg}" /></a> <fmt:message
											key="workingholiday.details.declarations.PICS.part3"
											bundle="${msg}" /> <br> </label>
								</div>
								<span id="chk2" class="text-red"></span>
								<hr />
								<div>
									<fmt:message key="workingholiday.details.declarations.PDPO"
										bundle="${msg}" />
								</div>

								<div class="checkbox">
									<input id="checkbox3" type="checkbox"
										name="donotWishDirectMarketing"> <label
										for="checkbox3"> <fmt:message
											key="workingholiday.details.declarations.PDPO.option1"
											bundle="${msg}" /> <br> <br>
									</label>
								</div>
								<div class="checkbox">
									<input id="checkbox4" type="checkbox" name="donotDisclose">
									<label for="checkbox4"> <fmt:message
											key="workingholiday.details.declarations.PDPO.option2"
											bundle="${msg}" /><br>
									</label>
								</div>

								<div class="checkboxBubble">
									<fmt:message
										key="workingholiday.details.declarations.PDPO.warning"
										bundle="${msg}" />
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





























					<div
						class="col-lg-4 col-md-4 hidden-sm hidden-xs gray-bg wht-bg3 pad-none floatingbox">

						<div class="hidden-sm hidden-xs">

							<div class="wd2">
								<div class="pull-left" style="width: 150px;">
									<h2 class="h2-3-choose"
										style="padding-left: 0px; font-size: 24px;">
										<fmt:message key="workingholiday.sidebar.summary.product"
											bundle="${msg}" />
									</h2>
									<h4
										style="padding-left: 0px; line-height: 0px; font-size: 16px;">
										<fmt:message key="workingholiday.sidebar.summary.desc.part1"
											bundle="${msg}" />
										${planName}
										<fmt:message key="workingholiday.sidebar.summary.desc.part2"
											bundle="${msg}" />
									</h4>
									<input type="hidden" name="selectedPlanName"
										value="${planName }">
								</div>
								<div class="pull-right" style="padding-top: 45px;">
									<div class="text-right h2-2 h2"
										style="margin-top: 0px; margin-bottom: 0px;">
										<div class="hk" style="font-size: 18px;">
											<fmt:message key="workingholiday.dollar" bundle="${msg}" />
											<div class="flightcare-hk"
												style="font-weight: bold; font-size: 28px;">${planPremium}</div>
										</div>
									</div>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="orange-bdr"></div>

							<div style="width: 80%; margin-left: 10%;">
								<div class="form-container" style="padding: 0px;">
									<h3 class="txt-bold">
										<fmt:message
											key="workingholiday.details.insured.beneficiary.effective"
											bundle="${msg}" />
									</h3>
									<h4 class="topten">${workingHolidayPlanDetailsForm.getWhInseffectiveDate()}</h4>
								</div>
								<h3 class="h4-1-orange-b col-lg-6 col-md-6"
									style="padding-left: 0px; font-size: 18px;">
									<fmt:message key="workingholiday.sidebar.summary.subtotal"
										bundle="${msg}" />
								</h3>
								<h3 class="h4-1-orange-b col-lg-6 col-md-6 text-right"
									style="padding-right: 0px; font-size: 18px;">${planPremium}</h3>

								<h3 class="topten h4-1-orange-b col-lg-6 col-md-6"
									style="padding-left: 0px; font-size: 18px;">
									<fmt:message key="workingholiday.sidebar.summary.discount"
										bundle="${msg}" />
								</h3>
								<h3 class="topten h4-1-orange-b col-lg-6 col-md-6 text-right"
									style="padding-right: 0px; font-size: 18px;">${planDiscount}
								</h3>
								<div class="clearfix"></div>
							</div>
							<div class="orange-bdr"></div>

							<div style="width: 80%; margin-left: 10%;">
								<h3 class="h4-1-orange-b col-lg-6 col-md-6"
									style="padding-left: 0px; font-size: 18px;">
									<fmt:message key="workingholiday.sidebar.summary.amountDue"
										bundle="${msg}" />
								</h3>
								<h3 class="h4-1-orange-b col-lg-6 col-md-6 text-right"
									style="padding-right: 0px; font-size: 18px;">${planSummary}</h3>
								<input type="hidden" name="finalDueAmount" value="${planSummary}">
								<input type="hidden" name="finalOriginalAmount" value="${planPremium}">
							</div>
							<div style="width: 80%; margin-left: 10%;">
								<div class="top35 pull-left pad-none" style="width: 47%">
									<a
										href="<%=request.getContextPath()%>/${language}/working-holiday-insurance/quote"
										class="bdr-curve btn btn-primary bck-btn"><fmt:message
											key="workingholiday.action.back" bundle="${msg}" /> </a>
								</div>
								<div class="top35 pull-right pad-none" style="width: 47%">
									<c:choose>
	<c:when test="${language=='en'}">
		<input type="button" class="bdr-curve btn btn-primary nxt-btn" value=" <fmt:message key="workingholiday.action.next" bundle="${msg}" />" onclick="javascript:kenshoo_conv('Registration_Step2','${planSummary}','','Regis_Working_Holiday_Step2 EN','USD');activateUserAccountJoinUs();" />
	</c:when>
	<c:otherwise>
		<input type="button" class="bdr-curve btn btn-primary nxt-btn" value=" <fmt:message key="workingholiday.action.next" bundle="${msg}" />" onclick="javascript:kenshoo_conv('Registration_Step2','${planSummary}','','Regis_Working_Holiday_Step2 ZH','USD');activateUserAccountJoinUs();" />
	</c:otherwise>
</c:choose>
									
									
									
									
								</div>
							</div>
						</div>

						<div class="clearfix"></div>
						<br>
					</div>
					<div class="clearfix"></div>
				</div>

				<div class="col-xs-12 hidden-md hidden-lg pad-none">
					<div style="width: 80%; margin-left: 10%;">
						<hr />
					</div>
				</div>
				<p class="padding1 workingholiday-plan-disclaimer">
					<fmt:message key="workingholiday.quote.other.disclaimer.part1"
						bundle="${msg}" />
					<a class="sub-link"
						href="https://home.fwd.com.hk/gidoc/policyprovisions/Working_HolidayCare_JacketLatest.pdf"
						target="_blank"><fmt:message
							key="workingholiday.quote.other.disclaimer.part2" bundle="${msg}" /></a>
					<fmt:message key="workingholiday.quote.other.disclaimer.part3"
						bundle="${msg}" />
					<fmt:message key="workingholiday.quote.other.disclaimer.part4"
						bundle="${msg}" />
				</p>

				<div class="col-xs-12 hidden-md hidden-lg pad-none">
					<div style="width: 80%; margin-left: 10%; margin-bottom: 60px;">
						<div class="top35 pull-left pad-none" style="width: 47%">
							<a
								href="<%=request.getContextPath()%>/${language}/working-holiday-insurance/quote"
								class="bdr-curve btn btn-primary bck-btn"><fmt:message
									key="workingholiday.action.back" bundle="${msg}" /> </a>
						</div>
						<div class="top35 pull-right pad-none" style="width: 47%">
							<c:choose>
	<c:when test="${language=='en'}">
		<input type="button" class="bdr-curve btn btn-primary nxt-btn" value=" <fmt:message key="workingholiday.action.next" bundle="${msg}" />" onclick="javascript:kenshoo_conv('Registration_Step2','${planSummary}','','Regis_Working_Holiday_Step2 EN','USD');activateUserAccountJoinUs();" />
	</c:when>
	<c:otherwise>
		<input type="button" class="bdr-curve btn btn-primary nxt-btn" value=" <fmt:message key="workingholiday.action.next" bundle="${msg}" />" onclick="javascript:kenshoo_conv('Registration_Step2','${planSummary}','','Regis_Working_Holiday_Step2 ZH','USD');activateUserAccountJoinUs();" />
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

<!--Get promotion code popup-->
<div class="modal fade bs-promo-modal-lg " tabindex="-1" role="dialog"
	aria-hidden="true" style="display: none;">
	<div class="modal-dialog modal-lg">
		<div class="modal-content plan-modal">
			<div class="login-form">
				<div class="form-container">
					<h2>
						<fmt:message key="promotion.get.code" bundle="${msg}" />
					</h2>
					<h4>
						<fmt:message key="promotion.get.code.email" bundle="${msg}" />
					</h4>
					<div class="form-group">
						<input type="email" class="form-control" value=""
							id="txtPromoEmail">
					</div>
					<span id="errPromoEmail" class="text-red"></span> <br>

					<div class="row">
						<div class="col-lg-6 col-md-6">
							<a class="bdr-curve btn btn-primary btn-lg wd5" href="#"
								onclick="return get_promo_val()"><fmt:message
									key="promotion.get.code.action" bundle="${msg}" /></a>
						</div>
						<div class="col-md-2">
							<br>
						</div>
						<div class="col-lg-4 col-md-4">
							<!--     <a class="bdr-curve btn btn-primary btn-lg promo-pop-close wd5" href="#" data-dismiss="modal">Close </a>  -->
						</div>
						<br> <br>
						<div class="col-md-12">
							<p>
								<fmt:message key="promotion.get.code.disclaimer" bundle="${msg}" />
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!--/ Get promotion code popup-->

<div class="scroll-to-top">
	<a title="Scroll to top" href="#"> <img
		src="<%=request.getContextPath()%>/resources/images/up-arrow.png"
		alt="Scroll to top" />
	</a>
</div>

<script>
	function activeTr(tr) {
		if ($(tr).val() == "SE") {
			$('#trBenificiary0').addClass('hide');
			$('#trBenificiary1').addClass('hide');
			$('#trBenificiary2').addClass('hide');
			$('#trBenificiary3').addClass('hide');
		} else {
			$('#trBenificiary0').removeClass('hide');
			$('#trBenificiary1').removeClass('hide');
			$('#trBenificiary2').removeClass('hide');
			$('#trBenificiary3').removeClass('hide');
		}
	}
	
	/* For Benefitiary Div active and Inactive */
	function activeDiv(id, selected) {
	    
	    var selectedValue = $('#' + selected).val();
	    
	    activeDeactive(selectedValue, id);

	}

	function activeDeactive(selectedValue, id) {
	    if (selectedValue == "" || selectedValue == "SE") {
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

	function selected(id){
		$('#selectWhInsHKID').val(id.value);
	}
</script>

<script>
    $(function() {
        $("[data-toggle='tooltip']").tooltip();
    });
</script>

<script>

/* UserLogin ajax function */
function userLoginFnc() {

	$('#ajax-loading').show();
	/* var a=validUser(); */
	/* 
	if(a==true)
	{ */
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
					/* window.location.href = "getAccByUsernaneAndPassword"; */
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
</script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/wh-details.js">
</script>

<script>
window.onload = function(){
	activeDiv('whbenificiaryId','selectWhInsBeneficary');
};
</script>
</body>
</html>	