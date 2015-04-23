<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.ifwd.fwdhk.model.QuoteDetails"%>
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
		
	QuoteDetails travelQuote = null;
		if (travelQuote == null) {
			//System.out.println("travelQuote is null 2");
			travelQuote = (QuoteDetails) session.getAttribute("tq");
		}

%>


<!--/#main-Content-->
<section>
	<div id="cn" class="container">
		<div class="row">
		
			<form:form name="frmYourDetails" id="frmYourDetails" action="${pageContext.request.contextPath}/travel-insurance/travel-summary" method="post"
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
							<h2><fmt:message key="travel.quote.jumbo" bundle="${msg}" /></h2>
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
				<div class="container pad-none bdr ur-opt-content gray-bg3">
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
						<table class="table activation-form margin-left-2">
							<tbody>
								<tr>
									<td colspan="2" class="pad-none"><h3
											class="black-bold pad-none"><fmt:message key="travel.details.applicant.heading" bundle="${msg}" /></h3></td>
								</tr>
								<tr>
									<td class="col-lg-4 col-md-4 col-sm-4 col-xs-4  pad-none"><label
										for="inputFullName" class="control-label bold-500"><fmt:message key="travel.details.applicant.name" bundle="${msg}" /></label></td>
									<td class="pad-none"><input type="text" name="fullName"
										class="form-control" id="inputFullName"
										value="${userDetails.getFullName()}"
										placeholder="<fmt:message key="travel.details.applicant.name.placeholder" bundle="${msg}" />" onblur="replaceAlpha(this);"
										onkeypress="return alphaOnly(event);" maxlength="100" />
									<span id="fullnameinvalid" class="text-red">
									</span></td>
								</tr>
								<tr>
									<td class="pad-none vtop">
									<div class="col-md-12 col-lg-12 pad-none">
									<select id="selectHkidPass" name="selectedHkidPassApplicant" onchange="selected(this)" class="soflow">
										<c:forEach var="hkidList" items="${mapHkId}">
											<option value="${hkidList.key}"><c:out
															value="${hkidList.value}" /></option>
										</c:forEach>
									</select>
									</div>

									</td>
									<td class="pad-none">
									<input type="text" name="hkid" class="form-control numberinput btm-pad-10" id="inputTxtAppHkid" placeholder="<fmt:message key="travel.details.applicant.hkid.placeholder" bundle="${msg}" />"> <span
										id="errAppHkid" class="text-red" ></span></td>
								</tr>
								<tr>
									<td class="pad-none"><label for="inputMobileNo"
										class="control-label bold-500"><fmt:message key="travel.details.applicant.mobile" bundle="${msg}" /></label></td>
									<td class="pad-none"><input name="mobileNo" type="text"
										class="form-control" value="${userDetails.getMobileNo().trim()}"
										id="inputMobileNo" placeholder="<fmt:message key="travel.details.applicant.mobile.placeholder" bundle="${msg}" />"
										onkeypress="return isNumeric(event)"
										onblur="replaceNumeric(this);" maxlength="8" /> <span
										id="mobileNo" class="text-red">
									</span></td>
								</tr>
								<tr>
									<td class="pad-none"><label for="inputEmailId"
										class="control-label bold-500"><fmt:message key="travel.details.applicant.email" bundle="${msg}" /></label></td>
									<td class="pad-none"><input class="form-control" name="emailAddress"
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
										<td colspan="2" class="pad-none"><h3 class="pad-none"><fmt:message key="travel.details.registration.heading" bundle="${msg}" /></h3>
											<i><fmt:message key="travel.details.registration.desc" bundle="${msg}" /></i> <br></td>
									</tr>
									<tr>
										<td colspan="2" class="pad-none">&nbsp;</td>
									</tr>
									<tr>
										<td class="col-lg-4 col-md-4 col-sm-4 col-xs-4 pad-none"><label
											class="control-label bold-500"><fmt:message key="travel.details.registration.username" bundle="${msg}" /></label></td>
										<td class="pad-none"><input type="text"
											name="username" class="form-control btm-pad-10"
											id="Username" placeholder="<fmt:message key="travel.details.registration.username.placeholder" bundle="${msg}" />"><span
											id="UsernameError" class="text-red"> </span></td>
									</tr>
									<tr>
										<td class="pad-none"><label
											class="control-label bold-500"><fmt:message key="travel.details.registration.password" bundle="${msg}" /></label></td>
										<td class="pad-none"><input type="password"
											name="password" class="form-control btm-pad-10"
											id="Password" placeholder="<fmt:message key="travel.details.registration.password.placeholder" bundle="${msg}" />" autocomplete="off"> <span
											id="PasswordError" class="text-red"> </span></td>
									</tr>
									<tr>
										<td class="pad-none"><label
											class="control-label bold-500"><fmt:message key="travel.details.registration.confirmPassword" bundle="${msg}" /></label></td>
										<td class="pad-none"><input type="password"
											class="form-control btm-pad-10" id="Confirm-Password"
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

						


						<div class="col-xs-12 col-sm-12 col-md-12 pad-15 insure-travel">
							<input type="hidden" name="totalAdultTraveller"
								id="totalAdultTraveler"
								value="${travelQuote.getTotalAdultTraveller()}">
							<c:forEach var="inx" begin="1"
								end="${travelQuote.getTotalAdultTraveller()}">
								<div id="adulttraveller">
									<h4 class="color1 top-mrg-10"><c:choose>
											<c:when test="${inx > 1}">
												<c:choose>
													<c:when test="${totalAdultCount == 2}">
												<fmt:message key="travel.details.insured.label.family.parent" bundle="${msg}" /> 
												</c:when>
													<c:when test="${totalAdultCount != 2}">
								<%								
									if (travelQuote.getPlanSelected() != null && travelQuote.getPlanSelected().equals("personal"))
									{ 
								%>
											<fmt:message key="travel.details.insured.label.personal" bundle="${msg}" /> 
								<% 	}
									else 
									{
								%>
											<fmt:message key="travel.details.insured.label.family.parent" bundle="${msg}" />
								<%  } %> 
												<c:out value="${inx-1}"></c:out>
													</c:when>
												</c:choose>
											</c:when>
											<c:when test="${inx == 1}">
								<%								
									if (travelQuote.getPlanSelected() != null && travelQuote.getPlanSelected().equals("personal"))
									{ 
								%>
											<fmt:message key="travel.details.insured.label.personal" bundle="${msg}" /> 

								<% 	}
									else 
									{
								%>
											<fmt:message key="travel.details.insured.label.family.parent" bundle="${msg}" /> 

								<%  } %> 
										</c:when>	
										</c:choose>
									</h4>
									
									
									<div class="row ">
										<div class="col-xs-6 col-md-6">
											<label class="bold-500"><fmt:message key="travel.details.insured.name" bundle="${msg}" /></label> 
											<c:if test="${inx == 1}">
											<input type="text"
												id="txtAdFullName${inx}" name="adultName" value="${userDetails.getFullName()}"
												class="form-control" placeholder="<fmt:message key="travel.details.insured.name.placeholder" bundle="${msg}" />"
												onblur="replaceAlpha(this);"
												onkeypress="    return alphaOnly(event);" maxlength="100" />
											</c:if>
											<c:if test="${inx > 1}">
											<input type="text"
												id="txtAdFullName${inx}" name="adultName" value=""
												class="form-control" placeholder="<fmt:message key="travel.details.insured.name.placeholder" bundle="${msg}" />"
												onblur="replaceAlpha(this);"
												onkeypress="    return alphaOnly(event);" maxlength="100" />
											</c:if>
											<span id="errtxtAdFullName${inx}" class="text-red"></span>
										</div>
										<div class="col-xs-6 col-md-6">
											<div class="col-md-10 col-lg-10 pad-none">
											<select id="selectedAdHkidPass${inx}" name="selectedAdHkidPass" class="soflow">
												<c:forEach var="hkidList" items="${mapHkId}">
													<option value="${hkidList.key}"><c:out
															value="${hkidList.value}" /></option>
												</c:forEach>
											</select>
											</div>
										
											<input id="txtInsuHkid${inx}" name="adultHKID" class="form-control textUpper" placeholder="<fmt:message key="travel.details.insured.hkid.placeholder" bundle="${msg}" />" value="" /> 
											<span id="errtxtInsuHkid${inx}" class="text-red"> </span> 
											<span id="errtxtInvalidInsuHkid${inx}" class="text-red"> </span>
										</div>
									</div>
									
									
									<div class="row top-mrg-10">
										<div class="col-xs-6 col-md-6">
											<label class="bold-500"><fmt:message key="travel.details.insured.age" bundle="${msg}" /></label> 
											 <select name="adultAgeRange" class="soflow" id="selectAgeRange${inx}">
											 
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
													<c:out value="${ageList.value}" /></option>
												</c:forEach>
											</c:when>	
											<c:when test="${inx >1}">
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
											</c:when>
										    </c:choose>	
											</select> <span id="errselectAgeRange${inx}" class="text-red">
											</span>
										</div>
																			
										
										<div class="col-xs-6 col-md-6">
											<label class="pad-left1 bold-500"><fmt:message key="travel.details.insured.beneficiary" bundle="${msg}" /></label> 
											 <select name="adultBeneficiary" class="soflow" id="adultsselectBenificiary${inx}">
												<option value="SE"><fmt:message key="travel.details.insured.beneficiary.default" bundle="${msg}" /></option>
												<c:forEach var="relationshipList" items="${mapRelationshipCode}">
													<option value="${relationshipList.key}"><c:out
															value="${relationshipList.value}" /></option>
												</c:forEach>
											</select>
											
											<span id="erradultsselectBenificiary${inx}" class="text-red"></span>
										</div>
										<!-- Adult hide box -->
										<div id="adultsbenificiaryId${inx}" class="hide">
											<div class="col-xs-6 col-md-6">
												<label class="bold-500"><fmt:message key="travel.details.insured.beneficiary.name" bundle="${msg}" /></label> <input type="text"
													name="adultBenificiaryFullName"
													id="adultBenefitiaryId${inx}" value=""
													class="form-control " placeholder="<fmt:message key="travel.details.insured.beneficiary.name.placeholder" bundle="${msg}" />"
													onblur="replaceAlpha(this);"
													onkeypress="    return alphaOnly(event);" maxlength="100" />
												<span id="erradultBenefitiaryId${inx}" class="text-red">
												</span>
											</div>
											<div class="col-xs-6 col-md-6">
												<!-- <label class="pad-left1 bold-500">HKID</label> -->
	                                            <div class="col-md-10 col-lg-10 pad-none">
	                                            <t:dropdown 
	                                                selectables="${mapHkId}"
	                                                defaultWithFirst="true"
	                                                valueElmId="selectAdBenefitiaryHkidPass${inx}"
	                                                valueElmName="selectedAdBenefitiaryHkidPass"
	                                                containerCss="selectHkidPass"
	                                            />
	                                            </div>
												
												<input
													id="adultBenefitiaryHKId${inx}" name="adultBenificiaryHkid"
													class="form-control textUpper" placeholder="<fmt:message key="travel.details.insured.beneficiary.hkid.placeholder" bundle="${msg}" />"
													value="" /> <span id="erradultBenefitiaryHKId${inx}"
													class="text-red"> </span><span id="errInvalidadultBenefitiaryHKId${inx}"
													class="text-red"> </span>
											</div>
										</div>

										<!-- end Adult hide box -->

									</div>
								</div>
							</c:forEach>

							<!-- child  -->
							<input type="hidden" name="totalChildTraveller"
								id="totalCountOfChild"
								value="${travelQuote.getTotalChildTraveller()}">
							<c:forEach var="inx" begin="1"
								end="${travelQuote.getTotalChildTraveller()}">
								<div id="childtraveller">
									<h4 class="color1 top-mrg-10">
										<fmt:message key="travel.details.insured.label.family.child" bundle="${msg}" /> 
										<c:out value="${inx}"></c:out>
									</h4>
									<div class="row ">
										<div class="col-xs-6 col-md-6">
											<label class="bold-500"><fmt:message key="travel.details.insured.beneficiary.name" bundle="${msg}" /></label> <input type="text"
												name="childName" id="txtChldFullName${inx}" value=""
												class="form-control " placeholder="<fmt:message key="travel.details.insured.beneficiary.name.placeholder" bundle="${msg}" />"
												onblur="replaceAlpha(this);"
												onkeypress="    return alphaOnly(event);" maxlength="100" />
											<span id="errtxtChldFullName${inx}" class="text-red"></span>
										</div>
										<div class="col-xs-6 col-md-6">
											<!-- <label class="pad-left1 bold-500">HKID</label> -->
											<select id="selectChldHkidPass${inx}" class="form-control soflow" name="selectedChldHkidPass">
									<option value="hkId" selected="selected"><fmt:message key="travel.details.insured.beneficiary.hkid.option1" bundle="${msg}" /></option>

									<option><fmt:message key="travel.details.insured.beneficiary.hkid.option2" bundle="${msg}" /></option>
									</select> <input
												id="txtChldInsuHkid${inx}" name="childHKID"
												class="form-control textUpper" placeholder="<fmt:message key="travel.details.insured.beneficiary.hkid.placeholder" bundle="${msg}" />"
												value="" /> <span id="errtxtChldInsuHkid${inx}"
												class="text-red"> </span><span
												id="errtxtChldInvalidInsuHkid${inx}" class="text-red"> </span>
										</div>
										
									</div>
									<div class="row top-mrg-10">
										<div class="col-xs-6 col-md-6">
											<label class="bold-500"><fmt:message key="travel.details.insured.age" bundle="${msg}" /></label> <select
												name="childAgeRange" id="selectchildAgeRange${inx}"
												class="soflow">
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
											</select> <span id="errchildRange${inx}" class="text-red"></span>
										</div>
										<div class="col-xs-6 col-md-6">
											<label class="pad-left1 bold-500"><fmt:message key="travel.details.insured.beneficiary" bundle="${msg}" /></label> 
											<select
												id="childselectBenificiary${inx}" name="childBeneficiary"
												onchange="activeDiv('childbenificiaryId${inx}','childselectBenificiary${inx}')"
												class="soflow">
												<option value="SE"><fmt:message key="travel.details.insured.beneficiary.default" bundle="${msg}" /></option>
												<c:forEach var="relationshipCodeList" items="${mapRelationshipCode}">
													<option value="${relationshipCodeList.key}"><c:out
															value="${relationshipCodeList.value}" /></option>
												</c:forEach>
											</select> <span id="errselectChildbenificiary${inx}" class="text-red"></span>
										</div>

										<!--Child hide panel-->
										<div id="childbenificiaryId${inx}" class="hide">
											<div class="col-xs-6 col-md-6">
												<label class="bold-500"><fmt:message key="travel.details.insured.beneficiary.name" bundle="${msg}" /></label> <input type="text"
													name="childBenificiaryFullName"
													id="childBenefitiaryName${inx}" value=""
													class="form-control " placeholder="<fmt:message key="travel.details.insured.beneficiary.name.placeholder" bundle="${msg}" />"
													onblur="replaceAlpha(this);"
													onkeypress="    return alphaOnly(event);" maxlength="100" />
												<span id="errchildBenefitiaryName${inx}" class="text-red"></span>
											</div>
											<div class="col-xs-6 col-md-6">
												<!-- <label class="pad-left1 bold-500">HKID</label>  -->
												<select id="selectChldBenefitiaryHkidPass${inx}" class="form-control soflow" name="selectedChldBenefitiaryHkidPass">
									<option  selected="selected"><fmt:message key="travel.details.insured.beneficiary.hkid.option1" bundle="${msg}" /></option>
									<option><fmt:message key="travel.details.insured.beneficiary.hkid.option2" bundle="${msg}" /></option>
									</select><input
													id="txtchildInsuHkid${inx}" name="childBenificiaryHkid"
													class="form-control textUpper" placeholder="<fmt:message key="travel.details.insured.beneficiary.hkid.placeholder" bundle="${msg}" />"
													value="" /> <span id="errtxtchildInsuHkid${inx}"
													class="text-red"> </span><span id="errtxtInvalidchildInsuHkid${inx}"
													class="text-red"> </span>
											</div>
											
										</div>
										<!--End Child hide panel-->

									</div>
								</div>
							</c:forEach>

							<!--other traveller-->
							<input type="hidden" name="totalOtherTraveller"
								id="totalCountOther"
								value="${travelQuote.getTotalOtherTraveller()}">
							<c:forEach var="inx" begin="1"
								end="${travelQuote.getTotalOtherTraveller()}">
								<div id="childtraveller">
									<h4 class="color1 top-mrg-10">
										<fmt:message key="travel.details.insured.label.family.others" bundle="${msg}" />
										<c:out value="${inx}"></c:out>
									</h4>
									<div class="row ">
										<div class="col-xs-6 col-md-6">
											<label class="bold-500"><fmt:message key="travel.details.insured.name" bundle="${msg}" /> </label> <input type="text"
												name="otherName" id="txtOtherFullName${inx}" value=""
												class="form-control " placeholder="<fmt:message key="travel.details.insured.name.placeholder" bundle="${msg}" />"
												onblur="replaceAlpha(this);"
												onkeypress="    return alphaOnly(event);" maxlength="100" />
											<span id="errtxtOtherFullName${inx}" class="text-red"></span>
										</div>
										<div class="col-xs-6 col-md-6">
											<!-- <label class="pad-left1 bold-500">HKID</label> -->
											<select id="selectOtHkidPass${inx}" class="form-control soflow" name="selectedOtHkidPass">
									<option selected="selected"><fmt:message key="travel.details.insured.hkid.option1" bundle="${msg}" /></option>
									<option><fmt:message key="travel.details.insured.hkid.option2" bundle="${msg}" /></option>
									</select> <input
												id="txtOtherInsuHkid${inx}" name="otherHKID"
												class="form-control textUpper" placeholder="<fmt:message key="travel.details.insured.hkid.placeholder" bundle="${msg}" />"
												value="" /> <span id="errtxtOtherInsuHkid${inx}"
												class="text-red"> </span><span
												id="errtxtOtherInvalidInsuHkid${inx}" class="text-red"> </span>
										</div>
									</div>
									<div class="row top-mrg-10">
										<div class="col-xs-6 col-md-6">
											<label class="bold-500"><fmt:message key="travel.details.insured.age" bundle="${msg}" /></label> <select
												name="otherAgeRange" class="form-control soflow"
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
											</select> <span id="errselectOtherAgeRange${inx}" class="text-red"></span>
										</div>
										<div class="col-xs-6 col-md-6">
											<label class="pad-left1 bold-500"><fmt:message key="travel.details.insured.beneficiary" bundle="${msg}" /></label> 
											<select id="otherSelectBenificiary${inx}" name="otherBeneficiary"
												onchange="activeDiv('otherbenificiaryId${inx}','otherSelectBenificiary${inx}')"
												class="form-control soflow">
												<option value="SE"><fmt:message key="travel.details.insured.beneficiary.default" bundle="${msg}" /></option>
												<c:forEach var="relationshipCodeList" items="${mapRelationshipCode}">
													<option value="${relationshipCodeList.key}"><c:out
															value="${relationshipCodeList.value}" /></option>
												</c:forEach>
											</select> <span id="benificiary" style="display: none"> <label
												class="text-red">?��?人是空白</label>
											</span>
										</div>

										<!--Other traveller  hide panel-->
										<div id="otherbenificiaryId${inx}" class="hide">
											<div class="col-xs-6 col-md-6">
												<label class="bold-500"><fmt:message key="travel.details.insured.beneficiary.name" bundle="${msg}" /></label> <input type="text"
													name="otherBenificiaryFullName"
													id="otherBenefitiaryName${inx}" value=""
													class="form-control " placeholder="<fmt:message key="travel.details.insured.beneficiary.name.placeholder" bundle="${msg}" />"
													onblur="replaceAlpha(this);"
													onkeypress="    return alphaOnly(event);" maxlength="100" />
												<span id="errotherBenefitiaryName${inx}" class="text-red"></span>
											</div>
											<div class="col-xs-6 col-md-6">
												<!-- <label class="pad-left1 bold-500">HKID</label> -->
												<select id="selectOtherBenefitiaryHkidPass${inx}" class="form-control soflow" name="selectedOtherBenefitiaryHkidPass">
									<option selected="selected"><fmt:message key="travel.details.insured.beneficiary.hkid.option1" bundle="${msg}" /></option>
									<option><fmt:message key="travel.details.insured.beneficiary.hkid.option2" bundle="${msg}" /></option>
									</select> <input
													id="txtOtherBenInsuHkid${inx}" name="otherBenificiaryHkid"
													class="form-control textUpper" placeholder="<fmt:message key="travel.details.insured.beneficiary.hkid.placeholder" bundle="${msg}" />"
													value="" /> <span id="errtxtOtherBenInsuHkid${inx}"
													class="text-red"> </span>
													<span id="errtxtOtherInvalidBenInsuHkid${inx}"
													class="text-red"> </span>
											</div>
										</div>
										<!--End Other traveller  hide panel-->

									</div>
								</div>
							</c:forEach>


               </div>


                       <div class="clearfix"></div>
						<div class="spacer3"></div>
							<h4 class="h4-2 padding3"><fmt:message key="travel.details.declarations.heading" bundle="${msg}" /></h4>
							<div class="declaration-content">
								<div class="checkbox">
									<input id="checkbox1" type="checkbox"> 
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
									<input id="checkbox2" type="checkbox"> <label
										for="checkbox2">
										<fmt:message key="travel.details.declarations.PICS.part1" bundle="${msg}" /> <a
										href="https://home.fwd.com.hk/giphw/FWD_Resources/GI_Personal%20Data%20Protection%20Policy%20and%20Practices.pdf"
										class="sub-link" target="_blank"><fmt:message key="travel.details.declarations.PICS.part2" bundle="${msg}" /></a><fmt:message key="travel.details.declarations.PICS.part3" bundle="${msg}" />
										


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
									<input id="checkbox3" type="checkbox"> <label

										for="checkbox3"> <fmt:message key="travel.details.declarations.PDPO.option1" bundle="${msg}" /><br>
										
									</label>
								</div>
								<div class="checkbox">
									<input id="checkbox4" type="checkbox"> <label
										for="checkbox4">

										<fmt:message key="travel.details.declarations.PDPO.option2" bundle="${msg}" /><br>
										
									</label>
								</div>

							</div>
						</div>
					


					<div
						class="col-lg-5 col-md-5 col-sm-12 col-xs-12  gray-bg pad-none wht-bg3">

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
									<fmt:message key="travel.sidebar.summary.option1" bundle="${msg}" /> <a href="<%=request.getContextPath()%>/travel"> <span
										class="span2 uline"><fmt:message key="travel.action.change" bundle="${msg}" /></span></a>
								</h3>
								<h4>${travelQuote.getTrLeavingDate()}</h4>
								<input type="hidden" name="departureDate" id="departureDate"
									value="01-01-2015">

								<h3 class="txt-bold">
									<fmt:message key="travel.sidebar.summary.option2" bundle="${msg}" /> <a href="<%=request.getContextPath()%>/travel"><span
										class="span2 uline"><fmt:message key="travel.action.change" bundle="${msg}" /></span></a>
								</h3>
								<h4>${travelQuote.getTrBackDate()}</h4>
								<input type="hidden" name="backDate" id="backDate"
									value="${travelQuote.getTrBackDate()}">

								<h3 class="txt-bold">
									<fmt:message key="travel.sidebar.summary.option3" bundle="${msg}" /><a href="<%=request.getContextPath()%>/travel"> <span
										class="span2 uline"><fmt:message key="travel.action.change" bundle="${msg}" /></span></a>
								</h3>
								<h4>
								<%								
									if (travelQuote.getPlanSelected() != null && travelQuote.getPlanSelected().equals("personal"))
									{ 
								%>
										<c:if test="${ travelQuote.getTotalAdultTraveller()!=0}"><fmt:message key="travel.summary.insured.label.personal" bundle="${msg}" />: ${travelQuote.getTotalAdultTraveller()+travelQuote.getTotalPersonalTraveller()}</c:if>
								<%  }
									else
									{
								%>
									<c:if test="${ travelQuote.getTotalAdultTraveller()!=0}"><fmt:message key="travel.summary.insured.label.family.parent" bundle="${msg}" />: ${travelQuote.getTotalAdultTraveller()+travelQuote.getTotalPersonalTraveller()}</c:if>
									<c:if test="${ travelQuote.getTotalChildTraveller()!=0}"><br><fmt:message key="travel.summary.insured.label.family.child" bundle="${msg}" />: ${travelQuote.getTotalChildTraveller()}</c:if>
			                     	<c:if test="${ travelQuote.getTotalOtherTraveller()!=0}"><br><fmt:message key="travel.summary.insured.label.family.others" bundle="${msg}" />: ${travelQuote.getTotalOtherTraveller()}</c:if>
		                            <c:if test="${planDetailsForm.getTravellerCount()!=0}"> ${planDetailsForm.getTravellerCount()}</c:if>
		                        <%  } %>
								</h4>
								
								<input type="hidden" name="planSelected" value="${travelQuote.getPlanSelected()}">
								<h3 class="txt-bold">
									<fmt:message key="travel.sidebar.summary.option4" bundle="${msg}" /> <span>${travelQuote.getTotalTravellingDays()}</span>
								</h3>
								<h3><fmt:message key="travel.sidebar.summary.promocode" bundle="${msg}" /></h3>
								<!-- <div class="form-group">
									<span class="input-group-addon in black-bold"><span>使用</span></span>
              		<input type="text" class="form-control placeholder-fl" value="eg.FWD789" readonly placeholder="eg.FWD789">
					

              </div>
              <div class="travel-italic">
                <a href="#" class="sub-link"  data-toggle="modal" data-target=".bs-promo-modal-lg"><i> 如�??��??��?�?���?/i> </a>
              </div> -->
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
	 <a href="<%=request.getContextPath()%>/travel-insurance/quote" class="bdr-curve btn btn-primary bck-btn"><fmt:message key="travel.action.back" bundle="${msg}" /> </a>
</div>
<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pull-right"> 
	<input type="submit" class="bdr-curve-none btn btn-primary btn-next" value=" <fmt:message key="travel.action.next" bundle="${msg}" />" />
<!-- 	<a href="travel-summary-payment-cn.html" class="bdr-curve btn btn-primary nxt-btn" onclick="return travel_planValid();"> <fmt:message key="travel.action.next" bundle="${msg}" /></a>  -->
</div>
<div class="clearfix"></div>
<br>
</div>
<div class="clearfix"></div>
</div>
<p class="padding1 hidden-sm hidden-xs"><fmt:message key="travel.quote.other.disclaimer.part1" bundle="${msg}" /><a class="sub-link" href="<%=request.getContextPath()%>/resources/policy-provisions-pdf/TravelCare_Provisions_Mar_2015.pdf" target="_blank"><fmt:message key="travel.quote.other.disclaimer.part2" bundle="${msg}" /></a>??
<fmt:message key="travel.quote.other.disclaimer.part3" bundle="${msg}" />
<fmt:message key="travel.quote.other.disclaimer.part4" bundle="${msg}" /></p>
</form:form>
</div>
<!--/.row-->
</div>
<!--/.container-->

</section>
<!-- 

	
	
		
			<form name="popUploginform" id="popUploginform" class="">
				<div class="login-form">

 -->

<!--Plan-login-popup-->
	<jsp:include page="/WEB-INF/jsp/merged/login.jsp" />




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
		if (selectedValue == "Own estate") {
			$('#' + id).addClass('hide');
		} else {
			$('#' + id).removeClass('hide');
		}
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