<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.ifwd.fwdhk.model.QuoteDetails"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<%@page import="java.util.*"%>
<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>

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
		
			<form:form name="frmYourDetails" id="frmYourDetails" action="${pageContext.request.contextPath}/${language}/workingholiday-insurance/workingholiday-summary" method="post"
				onsubmit="return tPlanValid();" modelAttribute="frmYourDetails">
				<ol class="breadcrumb pad-none">
					<li><a href="#"><fmt:message key="workingholiday.breadcrumb1.item1" bundle="${msg}" /></a> <i class="fa fa-caret-right"></i></li>
					<li><a href="#"><fmt:message key="workingholiday.breadcrumb1.item2" bundle="${msg}" /></a> <i class="fa fa-caret-right"></i></li>
					<li><a href="#"><fmt:message key="workingholiday.breadcrumb1.item3" bundle="${msg}" /></a></li>
					<li class="active "><i class="fa fa-caret-right"></i><fmt:message key="workingholiday.breadcrumb1.item4" bundle="${msg}" /></li>
				</ol>
				<div class="container ">
					<div class="col-md-12 shop-tracking-status">
						<div class="center wow fadeInDown animated"
							style="visibility: visible;">
							<h2><fmt:message key="workingholiday.quote.jumbo" bundle="${msg}" /></h2>
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
										<span class="status color3"><fmt:message key="workingholiday.breadcrumb2.item1" bundle="${msg}" /></span>
										<div class="icon">1</div>
									</div>

									<div
										class="image-order-status image-order-status-intransit  img-circle act second">
										<span class="status color2"><fmt:message key="workingholiday.breadcrumb2.item2" bundle="${msg}" /></span>
										<div class="icon">2</div>
									</div>
									<div
										class="image-order-status image-order-status-delivered  img-circle disabled third">
										<span class="status"><fmt:message key="workingholiday.breadcrumb2.item3" bundle="${msg}" /></span>
										<div class="icon">3</div>
									</div>
									<div
										class="image-order-status image-order-status-completed  img-circle disabled fourth">
										<span class="status lst-status"><fmt:message key="workingholiday.breadcrumb2.item4" bundle="${msg}" /></span>
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
						<h3 class="margin-left-2 h2-3-existing-fwd-head"><fmt:message key="workingholiday.details.login" bundle="${msg}" /></h3>

						<a href="#"
							class="col-lg-5 col-md-5 col-sm-5 col-xs-5 btn-box-2 margin-left-2 color4"
							data-toggle="modal" data-target=".bs-example-modal-lg"><fmt:message key="workingholiday.details.login.action" bundle="${msg}" /></a>
						<div class="col-lg-6 col-md-6 col-xs-6 col-sm-6 text-left">
							<h3 class="text-left or-continue">
								<fmt:message key="workingholiday.details.login.other.part1" bundle="${msg}" />
								<fmt:message key="workingholiday.details.login.other.part2" bundle="${msg}" />
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
											class="black-bold pad-none"><fmt:message key="workingholiday.details.applicant.heading" bundle="${msg}" /></h3></td>
								</tr>
								<tr>
									<td class="col-lg-4 col-md-4 col-sm-4 col-xs-4  pad-none"><label
										for="inputWhAppFullName" class="control-label bold-500"><fmt:message key="workingholiday.details.applicant.name" bundle="${msg}" /></label></td>
									<td class="pad-none"><input type="text" name="whAppFullName"
										class="form-control" id="inputWhAppFullName"
										value="${userDetails.getFullName()}"
										placeholder="<fmt:message key="workingholiday.details.applicant.name.placeholder" bundle="${msg}" />" onblur="replaceAlpha(this);"
										onkeypress="return alphaOnly(event);" maxlength="100" />
									<span id="whAppFullName" class="text-red">
									</span></td>
								</tr>
								<tr>
									<td class="pad-none">
										<select id="selectWhAppHKID"
											name="selectWhAppHKID" onchange="selected(this)"
											class="soflow">
											<c:forEach var="hkidList"
												items="${mapHkId}">
												<option
													value="${hkidList.key}">
													<c:out
														value="${hkidList.value}" />
												</option>
											</c:forEach>
										</select>
									</td>
									<td class="pad-none">
									<input type="text" name="whAppHKID" class="form-control numberinput btm-pad-10" id="inputWhAppHKID" placeholder="<fmt:message key="workingholiday.details.applicant.hkid.placeholder" bundle="${msg}" />" onkeyup="hkidValid(this)">
									<span id="whAppHKID" class="text-red" ></span></td>
								</tr>
								<tr>
									<td class="pad-none"><label for="inputMobileNo"
										class="control-label bold-500"><fmt:message key="workingholiday.details.applicant.mobile" bundle="${msg}" /></label></td>
									<td class="pad-none"><input name="whAppMobileNO" type="text"
										class="form-control" value="${userDetails.getMobileNo().trim()}"
										id="inputMobileNo" placeholder="<fmt:message key="workingholiday.details.applicant.mobile.placeholder" bundle="${msg}" />"
										onkeypress="return isNumeric(event)"
										onblur="replaceNumeric(this);" maxlength="8" />
										<span id="whAppMobileNO" class="text-red">
									</span></td>
								</tr>
								<tr>
									<td class="pad-none"><label for="inputWhAppEmailAdd"
										class="control-label bold-500"><fmt:message key="workingholiday.details.applicant.email" bundle="${msg}" /></label></td>
									<td class="pad-none"><input class="form-control" name="whAppEmailAdd"
										value="${userDetails.getEmailAddress().trim()}" id="inputWhAppEmailAdd"
										placeholder="<fmt:message key="workingholiday.details.applicant.email.placeholder" bundle="${msg}" />" maxlength="50">
										<span id="whAppEmailAdd" class="text-red"></span></td>
								</tr>
								
								<!-- new -->
								<tr>
									<td class="pad-none"><label for="whInsAgeRange"
										class="control-label bold-500"><fmt:message key="workingholiday.details.insured.beneficiary.age" bundle="${msg}" /></label></td>
									<td class="pad-none">
										<select name="whInsAgeRange" class="soflow" id="selectWhInsAgeRange">
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
										</select>
										<span id="selectWhInsAgeRange" class="text-red"></span>
									</td>
								</tr>
								<tr>
									<td class="pad-none"><label for="selectWhInsBeneficary"
										class="control-label bold-500"><fmt:message key="workingholiday.details.insured.beneficiary.beneficiary" bundle="${msg}" /></label></td>
									<td class="pad-none">
										<select name="whInsBeneficary" id="selectWhInsBeneficary" 
										 		onChange="activeDiv('adultsbenificiaryId','adultsselectBenificiary')"
										 	class="soflow" >
											<option value="SE"><fmt:message key="workingholiday.details.insured.beneficiary.default" bundle="${msg}" /></option>
											<c:forEach var="relationshipList" items="${mapRelationshipCode}">
												<option value="${relationshipList.key}"><c:out
														value="${relationshipList.value}" /></option>
											</c:forEach>
										</select>
										<span id="whInsBeneficary" class="text-red"></span>
									</td>
								</tr>
								<tr>
									<td colspan="2" class="pad-none">
										<h3 class="black-bold pad-none"><fmt:message key="workingholiday.details.insured.beneficiary.beneficiary" bundle="${msg}" /></h3>
									</td>
								</tr>
								<tr>
									<td class="pad-none"><label for="inputWhInsFullName"
										class="control-label bold-500"><fmt:message key="workingholiday.details.insured.beneficiary.name" bundle="${msg}" /></label></td>
									<td class="pad-none">
										<input type="text"
										id="inputWhInsFullName" name="whInsFullName" value="${userDetails.getFullName()}"
										class="form-control" placeholder="<fmt:message key="workingholiday.details.insured.name.placeholder" bundle="${msg}" />"
										onblur="replaceAlpha(this);"
										onkeypress="    return alphaOnly(event);" maxlength="100" />
										<span id="whInsFullName" class="text-red"></span>
									</td>
								</tr>
								<tr>
									<td class="pad-none"><label for="inputWhInsHKID"
										class="control-label bold-500"><fmt:message key="workingholiday.details.insured.beneficiary.type" bundle="${msg}" /></label></td>
									<td class="pad-none">
										<select id="selectWhInsHKID" name="selectWhInsHKID" class="soflow">
											<c:forEach var="hkidList" items="${mapHkId}">
												<option value="${hkidList.key}">
													<c:out value="${hkidList.value}" />
												</option>
											</c:forEach>
										</select>
									</td>
								</tr>
								<tr>
									<td class="pad-none"><label
										class="control-label bold-500">&nbsp;</label></td>
									<td class="pad-none">
										<input id="inputWhInsHKID" name="whInsHKID" class="form-control textUpper" placeholder="<fmt:message key="workingholiday.details.insured.hkid.placeholder" bundle="${msg}" />" value="" /> 
										<span id="whInsHKID" class="text-red"> </span> 
									</td>
								</tr>
								<tr>
									<td class="pad-none"><label for="selectWhInsWorkingCty"
										class="control-label bold-500 lhnormal"><fmt:message key="workingholiday.details.insured.beneficiary.country" bundle="${msg}" /></label></td>
									<td class="pad-none">
										<select id="selectWhInsWorkingCty" name="whInsWorkingCty" class="soflow">
											<c:forEach var="country" items="${countryInfo}">
												<option value="${country.key}"><c:out
														value="${country.value}" /></option>
											</c:forEach>
										</select>
										<span id="whInsWorkingCty" class="text-red"> </span>
									</td>
								</tr>
							</tbody>
							<!-- addr -->
							<table class="table activation-form margin-left-2 autofillForm">
								<tbody>
									<tr>
										<td rowspan="5"
											class="col-lg-4 col-md-4 col-sm-4 col-xs-4"><label
											class="control-label bold-500 lhnormal"><fmt:message key="home.details.registration.corraddress" bundle="${msg}" /></label></td>
										<td><input type="text" class="form-control wd2"
											id="inputWhInsRoom" name="whInsRoom" placeholder="<fmt:message key="home.details.registration.corraddress.room.placeholder" bundle="${msg}" />"
											onblur="replaceAlphaNumeric(this);"
											onkeypress="    return isAlphaNumeric(event);" maxlength="10" /></td>
										<td><input type="text" class="form-control full-control"
											id="inputWhInsFloor" name="whInsFloor" placeholder="<fmt:message key="home.details.registration.corraddress.floor.placeholder" bundle="${msg}" />"
											onblur="replaceAlphaNumeric(this);"
											onkeypress="    return isAlphaNumeric(event);" maxlength="5"/></td>
										<td><input type="text" class="form-control full-control"
											id="inputWhInsBlock" name="whInsBlock" placeholder="<fmt:message key="home.details.registration.corraddress.block.placeholder" bundle="${msg}" />"
											onblur="replaceAlphaNumeric(this);"
											onkeypress="    return isAlphaNumeric(event);" maxlength="5" /></td>
									</tr>
									<tr>
										<td colspan="2"><input type="text" class="form-control full-control"
											id="inputWhInsBuilding" name="whInsBuilding"
											placeholder="<fmt:message key="home.details.registration.corraddress.building.placeholder" bundle="${msg}" />" onblur="replaceAlphaNumeric(this); chkNotNullCABuilding(this, 'errCABuilding');"
											onkeypress="return isAlphaNumeric(event);" maxlength="50" />
											<span id="errCABuilding" class="text-red"> </span></td>
										<td><input type="text" class="form-control full-control"
											id="inputWhInsEstate" name="whInsEstate"
											placeholder="<fmt:message key="home.details.registration.corraddress.estate.placeholder" bundle="${msg}" />" onblur="replaceAlphaNumeric(this); chkNotNullCAEstate(this, 'errCAEstate');"
											onkeypress="    return isAlphaNumeric(event);" maxlength="50" />
											<span id="errCAEstate" class="text-red"> </span></td>
									</tr>
									<tr>
										<td colspan="1"><input type="text" class="form-control full-control"
											id="inputWhInsStreetNo" name="whInsStreetNo"
											placeholder="<fmt:message key="home.details.registration.corraddress.streetNo.placeholder" bundle="${msg}" />" onblur="replaceAlphaNumeric(this);"
											onkeypress="    return isAlphaNumeric(event);" maxlength="5" /></td>
										<td colspan="2"><input type="text" class="form-control full-control"
											id="inputWhInsStreetName" name="whInsStreetName"
											placeholder="<fmt:message key="home.details.registration.corraddress.streetName.placeholder" bundle="${msg}" />" onblur="replaceAlphaNumeric(this);"
											onkeypress="    return isAlphaNumeric(event);" maxlength="50" /></td>
									</tr>
									<tr>
										<td colspan="3">
										<div class="styled-select"><select name="whInsDistrict"
											class="form-control soflow full-control" id="selectWhInsDistrict"
											onchange="setDropArea(this.value)">
												<option value=""><fmt:message key="home.details.registration.district" bundle="${msg}" /></option>
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
										</select></div>
										<span id="whInsDistrict" class="text-red"> </span></td>
									</tr>
									<tr>
										<td colspan="3"><label class="radio-inline homecare-lb">
												<input type="radio" name="whInsArea" id="inlineCARadio3"
												value="HK" checked="" class="home-input1"> <span><fmt:message key="home.details.registration.hk" bundle="${msg}" />
											</span>
										</label> <label class="radio-inline homecare-lb"> <input
												type="radio" name="whInsArea" id="inlineCARadio4"
												value="KL" class="home-input1"> <span> <fmt:message key="home.details.registration.kln" bundle="${msg}" /></span>
										</label> <label class="radio-inline"> <input type="radio"
												name="whInsArea" id="inlineCARadio5" value="NT"
												class="home-input1"> <span> <fmt:message key="home.details.registration.nt" bundle="${msg}" /></span>
										</label></td>
									</tr>
								</tbody>
							</table>
							<table class="table activation-form margin-left-2">
								<tbody>
									<tr>
										<td class="col-lg-4 col-md-4 col-sm-4 col-xs-4  pad-none"><label
											for="inputFullName" class="control-label bold-500 lhnormal"><fmt:message key="workingholiday.details.insured.beneficiary.effective" bundle="${msg}" /></label></td>
										<td class="pad-none">
											<div class="input-group date" id="dpEffectiveDate"> <span class="input-group-addon in border-radius"><span><img src="<%=request.getContextPath()%>/resources/images/calendar.png" alt=""></span></span>
						                      <input name="whInseffectiveDate" type="text" class="datepicker form-control border-radius" id="txtStartDateDesk" value="${workingholidayQuote.getTrLeavingDate()}" readonly>
						                    </div>
											<span id="whInseffectiveDate" class="text-red"></span>
										</td>
									</tr>
								</tbody>
							</table>
						</table>
						

						


<%-- 						<div class="col-xs-12 col-sm-12 col-md-12 pad-15 insure-travel">
								<div id="adulttraveller">
									<div class="row ">
										<div class="col-xs-6 col-md-6">
											<label class="bold-500"><fmt:message key="workingholiday.details.insured.name" bundle="${msg}" /></label> 
											<input type="text"
												id="txtAdFullName" name="adultName" value="${userDetails.getFullName()}"
												class="form-control" placeholder="<fmt:message key="workingholiday.details.insured.name.placeholder" bundle="${msg}" />"
												onblur="replaceAlpha(this);"
												onkeypress="    return alphaOnly(event);" maxlength="100" />
											<span id="errtxtAdFullName" class="text-red"></span>
										</div>
										<div class="col-xs-6 col-md-6">
											
											<div class="styled-select">
												<select
													id="selectedAdHkidPass" name="selectedAdHkidPass"
													class="soflow">
													<c:forEach
														var="hkidList" items="${mapHkId}">
														<option
															value="${hkidList.key}">
															<c:out
																value="${hkidList.value}" />
														</option>
													</c:forEach>
												</select>
											</div>
											
										
											<input id="txtInsuHkid" name="adultHKID" class="form-control textUpper" placeholder="<fmt:message key="workingholiday.details.insured.hkid.placeholder" bundle="${msg}" />" value="" /> 
											<span id="errtxtInsuHkid" class="text-red"> </span> 
											<span id="errtxtInvalidInsuHkid" class="text-red"> </span>
										</div>
									</div>
									
									
									<div class="row top-mrg-10">
										<div class="col-xs-6 col-md-6">
											<label class="bold-500"><fmt:message key="workingholiday.details.insured.age" bundle="${msg}" /></label>
											<div class="styled-select">
												<select
													name="adultAgeRange" class="soflow"
													id="selectAgeRange">

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
												</select>
											</div>
											<span id="errselectAgeRange" class="text-red">
											</span>
										</div>
																			
										
										<div class="col-xs-6 col-md-6">
											<label class="pad-left1 bold-500"><fmt:message key="workingholiday.details.insured.beneficiary" bundle="${msg}" /></label> 
											 <div class="styled-select">
											 <select name="adultBeneficiary" id="adultsselectBenificiary" 
											 		onChange="activeDiv('adultsbenificiaryId','adultsselectBenificiary')"
											 	class="soflow" >
												<option value="SE"><fmt:message key="workingholiday.details.insured.beneficiary.default" bundle="${msg}" /></option>
												<c:forEach var="relationshipList" items="${mapRelationshipCode}">
													<option value="${relationshipList.key}"><c:out
															value="${relationshipList.value}" /></option>
												</c:forEach>
											</select>
											</div>
											<span id="erradultsselectBenificiary" class="text-red"></span>
										</div>
										<!-- Adult hide box -->
										<div id="adultsbenificiaryId" class="hide">
											<div class="col-xs-6 col-md-6">
												<label class="bold-500"><fmt:message key="workingholiday.details.insured.beneficiary.name" bundle="${msg}" /></label> <input type="text"
													name="adultBenificiaryFullName"
													id="adultBenefitiaryId" value=""
													class="form-control " placeholder="<fmt:message key="workingholiday.details.insured.beneficiary.name.placeholder" bundle="${msg}" />"
													onblur="replaceAlpha(this);"
													onkeypress="    return alphaOnly(event);" maxlength="100" />
												<span id="erradultBenefitiaryId" class="text-red">
												</span>
											</div>
											<div class="col-xs-6 col-md-6">
												<!-- <label class="pad-left1 bold-500">HKID</label> -->
	                                            <div class="styled-select ">
	                                            <select id="selectAdBenefitiaryHkidPass" name="selectedAdBenefitiaryHkidPass" class="soflow">
												<c:forEach var="hkidList" items="${mapHkId}">
													<option value="${hkidList.key}"><c:out
															value="${hkidList.value}" /></option>
												</c:forEach>
											</select>
	                                            </div>
												
												<input
													id="adultBenefitiaryHKId" name="adultBenificiaryHkid"
													class="form-control textUpper" placeholder="<fmt:message key="workingholiday.details.insured.beneficiary.hkid.placeholder" bundle="${msg}" />"
													value="" /> <span id="erradultBenefitiaryHKId"
													class="text-red"> </span><span id="errInvalidadultBenefitiaryHKId"
													class="text-red"> </span>
											</div>
										</div>

										<!-- end Adult hide box -->

									</div>
								</div>

							

							


               </div>
 --%>

                       <div class="clearfix"></div>
                       
                       <%
                            if (authenticate.equals("false") || "direct".equalsIgnoreCase(request.getSession()
                                    .getAttribute("authenticate").toString())) {
                        %>
                        <div class="gray-bg3-wid">
                            <table class="table plandetail-form margin-left-2 vert-middle"
                                id="input-white">
                                <tbody>
                                    <tr>
                                        <td colspan="2" class="pad-none"><h3 class="pad-none"><fmt:message key="workingholiday.details.registration.heading" bundle="${msg}" /></h3>
                                            <i><fmt:message key="workingholiday.details.registration.desc" bundle="${msg}" /></i> <br></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" class="pad-none">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="col-lg-4 col-md-4 col-sm-4 col-xs-4 pad-none"><label
                                            class="control-label bold-500"><fmt:message key="workingholiday.details.registration.username" bundle="${msg}" /></label></td>
                                        <td class="pad-none"><input type="text"
                                            name="username" class="form-control btm-pad-10"
                                            id="Username" placeholder="<fmt:message key="workingholiday.details.registration.username.placeholder" bundle="${msg}" />"><span
                                            id="UsernameError" class="text-red"> </span></td>
                                    </tr>
                                    <tr>
                                        <td class="pad-none"><label
                                            class="control-label bold-500"><fmt:message key="workingholiday.details.registration.password" bundle="${msg}" /></label></td>
                                        <td class="pad-none"><input type="password"
                                            name="password" class="form-control btm-pad-10"
                                            id="Password" placeholder="<fmt:message key="workingholiday.details.registration.password.placeholder" bundle="${msg}" />" autocomplete="off"> <span
                                            id="PasswordError" class="text-red"> </span></td>
                                    </tr>
                                    <tr>
                                        <td class="pad-none"><label
                                            class="control-label bold-500"><fmt:message key="workingholiday.details.registration.confirmPassword" bundle="${msg}" /></label></td>
                                        <td class="pad-none"><input type="password"
                                            class="form-control btm-pad-10" id="Confirm-Password"
                                            placeholder="<fmt:message key="workingholiday.details.registration.confirmPassword.placeholder" bundle="${msg}" />" autocomplete="off"> <span id="Confirm-PasswordError"
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
                       
                       
						<div class="spacer3"></div>
							
							<div class="declaration-content">
								<h4 class="h4-2"><fmt:message key="workingholiday.details.declarations.heading" bundle="${msg}" /></h4>
								<div class="checkbox">
									<input id="checkbox1" type="checkbox"> 
									<label for="checkbox1">
										<fmt:message key="workingholiday.details.declarations.tnc" bundle="${msg}" /> 
										<ol class="ol-disclaimer">
											<li><fmt:message key="workingholiday.details.declarations.tnc.desc1" bundle="${msg}" /></li>
											<li><fmt:message key="workingholiday.details.declarations.tnc.desc2" bundle="${msg}" /></li>
											<li><fmt:message key="workingholiday.details.declarations.tnc.desc3" bundle="${msg}" /></li>
											<li><fmt:message key="workingholiday.details.declarations.tnc.desc4" bundle="${msg}" /></li>
											<li><fmt:message key="workingholiday.details.declarations.tnc.desc5" bundle="${msg}" /></li>
										</ol>
										
									</label>
								</div>	
								<span id="chk1" class="text-red"></span>		
								<div class="checkbox">
									<input id="checkbox2" type="checkbox"> <label
										for="checkbox2">
										<fmt:message key="workingholiday.details.declarations.PICS.part1" bundle="${msg}" /> <a
										href="<fmt:message key="PICS.link" bundle="${msg}" />"
										class="sub-link" target="_blank"><fmt:message key="workingholiday.details.declarations.PICS.part2" bundle="${msg}" /></a> <fmt:message key="workingholiday.details.declarations.PICS.part3" bundle="${msg}" />
										


										</label>
								</div>
								<span id="chk2" class="text-red"></span>
								<hr/>
								<div>
									 <label>
 									<fmt:message key="workingholiday.details.declarations.PDPO" bundle="${msg}" /> <br>
									</label>
								</div>
								 <div class="checkbox">
									<input id="checkbox3" type="checkbox"> <label

										for="checkbox3"> <fmt:message key="workingholiday.details.declarations.PDPO.option1" bundle="${msg}" /><br>
										
									</label>
								</div>
								<div class="checkbox">
									<input id="checkbox4" type="checkbox"> <label
										for="checkbox4">

										<fmt:message key="workingholiday.details.declarations.PDPO.option2" bundle="${msg}" /><br>
										
									</label>
								</div>

							</div>
						</div>
					


					<div
						class="col-lg-5 col-md-5 col-sm-12 col-xs-12  gray-bg wht-bg3 pad-none floatingbox">

						<div class="hidden-sm hidden-xs">

							<div class="wd2">
								<div class="pull-left">
									<h2 class="h2-3-choose"><fmt:message key="workingholiday.sidebar.summary.product" bundle="${msg}" /></h2>
									<h4><fmt:message key="workingholiday.sidebar.summary.desc.part1" bundle="${msg}" /> ${planName} <fmt:message key="workingholiday.sidebar.summary.desc.part2" bundle="${msg}" /></h4>
									<input type="hidden" name="selectedPlanName" value="${planName }">
								</div>
								<div class="pull-right">
									<div class="text-left pad-right1 h2-2 h2">
										<div class="hk">
											<fmt:message key="workingholiday.dollar" bundle="${msg}" />
											<div class="flightcare-hk">${planPremium}</div>
										</div>
									</div>
								</div>
							</div>
							<div class="clearfix"></div>
							<div class="orange-bdr"></div>
							<div class="form-container">
								
								
								<input type="hidden" name="departureDate" id="departureDate"
									value="01-01-2015">

								<h3 class="txt-bold">
									<fmt:message key="workingholiday.sidebar.summary.option2" bundle="${msg}" /> <a href="<%=request.getContextPath()%>/travel"><span
										class="span2 uline"><fmt:message key="workingholiday.action.change" bundle="${msg}" /></span></a>
								</h3>
								<h4 class="topten">${travelQuote.getTrBackDate()}</h4>
								
								<input type="hidden" name="backDate" id="backDate"
									value="${travelQuote.getTrBackDate()}">

								
								
								<!--  removed field, days -->
								
								<!-- <div class="form-group">
									<span class="input-group-addon in black-bold"><span>使用</span></span>
              		<input type="text" class="form-control placeholder-fl" value="eg.FWD789" readonly placeholder="eg.FWD789">
					

              </div>
              <div class="travel-italic">
                <a href="#" class="sub-link"  data-toggle="modal" data-target=".bs-promo-modal-lg"><i> 如�??��??��?�?���?/i> </a>
              </div> -->
            </div>
		            <h3 class="h4-1-orange-b col-lg-6 col-md-6"><fmt:message key="workingholiday.sidebar.summary.subtotal" bundle="${msg}" /> </h3>
		            <h3 class="h4-1-orange-b col-lg-6 col-md-6 text-right">${planPremium}</h3>
		            
		            <h3 class="topten h4-1-orange-b col-lg-6 col-md-6"><fmt:message key="workingholiday.sidebar.summary.discount" bundle="${msg}" /> </h3>
		            <h3 class="topten h4-1-orange-b col-lg-6 col-md-6 text-right">${planDiscount} </h3>
		            <div class="clearfix"></div>
		            <div class="orange-bdr"></div>
		            <h3 class="h4-1-orange-b col-lg-6 col-md-6"><fmt:message key="workingholiday.sidebar.summary.amountDue" bundle="${msg}" />  </h3>
		            <h3 class="h4-1-orange-b col-lg-6 col-md-6 text-right">${planSummary}</h3>
		            <input type="hidden" name="finalDueAmount" value="${planSummary}">
            
            </div>
            
            <!--mob-->
			<div class="top35 col-lg-6 col-md-6 col-sm-6 col-xs-6 pull-left">
				 <a href="<%=request.getContextPath()%>/workingholiday-insurance/quote" class="bdr-curve btn btn-primary bck-btn"><fmt:message key="workingholiday.action.back" bundle="${msg}" /> </a>
			</div>
			<div class="top35 col-lg-6 col-md-6 col-sm-6 col-xs-6 pull-right"> 
				<input type="submit" class="bdr-curve-none btn btn-primary btn-next" value=" <fmt:message key="workingholiday.action.next" bundle="${msg}" />" />
			<!-- 	<a href="travel-summary-payment-cn.html" class="bdr-curve btn btn-primary nxt-btn" onclick="return travel_planValid();"> <fmt:message key="workingholiday.action.next" bundle="${msg}" /></a>  -->
			</div>
<div class="clearfix"></div>
<br>
</div>
<div class="clearfix"></div>
</div>
<p class="padding1 hidden-sm hidden-xs"><fmt:message key="workingholiday.quote.other.disclaimer.part1" bundle="${msg}" /><a class="sub-link" href="<%=request.getContextPath()%>/<fmt:message key="workingholiday.provision.link" bundle="${msg}" />" target="_blank"><fmt:message key="workingholiday.quote.other.disclaimer.part2" bundle="${msg}" /></a> 
<fmt:message key="workingholiday.quote.other.disclaimer.part3" bundle="${msg}" />
<fmt:message key="workingholiday.quote.other.disclaimer.part4" bundle="${msg}" /></p>
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
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/wh-details.js"></script>