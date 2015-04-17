<%@page import="com.ifwd.fwdhk.model.PlanDetailsForm"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.ifwd.fwdhk.model.FlightQuoteDetails"%>
<%@page import="com.ifwd.fwdhk.model.PlanDetails"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

/* Commented because login is not compulsory */ 
<%-- function flightPlanValidation() {
 <%if (authenticate.equalsIgnoreCase("false")) {%>
$('#loginpopup').modal('show');
<%} else {%> 
document.freeFlight.action = "flight-confirmation";
return true;
<%}%> 
return false;
} --%>

</script>
<!--/#main-Content-->
<section>
	<div class="container">
		<div class="row">
			<%-- <form:form name="freeFlight" method="post"
action="flight-confirmation" onsubmit="return fPlanValid();"> --%>
			<form:form name="freeFlightForm" id="freeFlightForm"
				modelAttribute="createFlightPolicy" method="post"
				onsubmit="return createFlightFnc(this);" >
				<ol class="breadcrumb pad-none">
					<li><a href="#"><fmt:message key="flight.breadcrumb1.item1" bundle="${msg}" /></a> <i class="fa fa-caret-right"></i></li>
					<li><a href="#"><fmt:message key="flight.breadcrumb1.item2" bundle="${msg}" /></a> <i class="fa fa-caret-right"></i></li>
					<li><a href="#"><fmt:message key="flight.breadcrumb1.item3" bundle="${msg}" /></a></li>
					<li class="active "><i class="fa fa-caret-right"></i><fmt:message key="flight.breadcrumb1.item4" bundle="${msg}" /></li>
				</ol>
				<input type="hidden" name="planSelected"
					value="${planDetailsForm.getPlanSelected()}">
				<div class="container ">
					<div
						class="col-md-12 col-lg-12 col-sm-12 col-xs-12 shop-tracking-status">
						<div class="center wow fadeInDown animated"
							style="visibility: visible;">
							<h2><fmt:message key="flight.details.jumbo" bundle="${msg}" /></h2>
						</div>
						<br> <br>
						<div class="order-status">
							<div class="order-status-timeline-new">
								<!-- class names: c0 c1 c2 c3 and c4 -->
								<div class="order-status-timeline-completion dots-active"></div>
								<div class="order-status-timeline-completion dots-inactive"></div>
								
							</div>
							<div
								class="image-order-status image-order-status-new  img-circle">
								<div class="icon">1</div>
								<span class="status status-working"><fmt:message key="flight.breadcrumb2.item1" bundle="${msg}" /></span>
							</div>
							<div
								class="image-order-status image-order-status-active active img-circle">
								<div class="icon">2</div>
								<span class="status"><fmt:message key="flight.breadcrumb2.item2" bundle="${msg}" /></span>
							</div>
							<div
								class="image-order-status image-order-status-intransit disabled  img-circle">
								<div class="icon">3</div>
								<span class="status min-left"><fmt:message key="flight.breadcrumb2.item3" bundle="${msg}" /></span>
							</div>
						</div>
					</div>
				</div>
				<br>
				<br>
				<br>
				<%-- <div class="container pad-none bdr ur-opt-content gray-bg3">
<c:if test="${ not empty errorMessage}">
<div class="alert alert-danger" role="alert">
<P>${errorMessage}</P>
</div>
</c:if>
<div --%>
				<div class="container pad-none bdr ur-opt-content gray-bg3">
					<div class="alert alert-danger hide" role="alert"
						id="errorMessages"></div>
					<div
						class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none white-bg1">
						<br>

						<%
							if (authenticate.equals("false")
										|| authenticate.equals("direct")) {
						%>
						<h3
							class="margin-left-2 h2-3-existing-fwd-head hidden-sm hidden-xs"><fmt:message key="flight.details.login" bundle="${msg}" /></h3>
						<h3
							class="margin-left-2 h2-3-existing-fwd-head hidden-lg hidden-md"><fmt:message key="flight.details.login" bundle="${msg}" /></h3>

						<a href="#"
							class="col-lg-5 col-md-5 col-sm-5 col-xs-5 btn-box-2 margin-left-2 color4"
							data-toggle="modal" data-target=".bs-example-modal-lg"><fmt:message key="flight.details.login.action" bundle="${msg}" /></a>


						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 text-left">
							<h3 class="text-left or-continue">
								<span><fmt:message key="flight.details.login.other.part1" bundle="${msg}" /></span><fmt:message key="flight.details.login.other.part2" bundle="${msg}" />
							</h3>
						</div>
						<%
							}
						%>
						<div class="clearfix"></div>
						<br>
						<div class="gray-bdr"></div>
						<table class="table activation-form margin-left-2 vert-middle">
							<tbody>
								<tr>
									<td colspan="2"><h3
											class="black-bold pad-none"><fmt:message key="flight.details.applicant.heading" bundle="${msg}" /></h3></td>
								</tr>
								<tr>


									<td valign="middle" class="col-sm-4"><label
										for="inputFullName" class="control-label bold-500"><fmt:message key="flight.details.applicant.name" bundle="${msg}" /></label></td>
									<td class=""><input type="text"
										value="${userDetails.getFullName()}" class="form-control"
										id="inputFullName" name="fullName"
										placeholder="as appears on HKID Card/Passport"
										onblur="replaceAlpha(this);"
										onkeypress="return alphaOnly(event);" maxlength="100" /> <span
										id="fullnameinvalid" class="text-red"></span></td>
								</tr>
								<tr>
									<td valign="middle" class=""><label
										for="inputEmail3" class="control-label bold-500"><fmt:message key="flight.details.applicant.hkid" bundle="${msg}" /></label></td>
									<td class=""><input type="text" name="hkid"
										class="form-control numberinput textUpper"
										id="inputTxtAppHkid" placeholder="X1234567"> <span
										id="errAppHkid" class="text-red"> </span></td>
								</tr>
								<tr>
									<td valign="middle" class=""><label
										for="inputMobileNo" class="control-label bold-500"><fmt:message key="flight.details.applicant.mobile" bundle="${msg}" /></label></td>
									<td class=""><input type="text"
										value="${userDetails.getMobileNo()}" class="form-control"
										name="mobileNo" id="inputMobileNo" placeholder="Mobile Number"
										onkeypress="return isNumeric(event)"
										onblur="replaceNumeric(this);" maxlength="8" /> <span
										id="mobileNo" class="text-red"></span></td>
								</tr>
								<tr>
									<td valign="middle" class=""><label
										for="inputEmailId" class="control-label bold-500"><fmt:message key="flight.details.applicant.email" bundle="${msg}" /></label></td>
									<td class=""><input class="form-control"
										value="${userDetails.getEmailAddress()}" name="emailAddress"
										id="inputEmailId" placeholder="Email address" maxlength="50">
										<span id="emailid" class="text-red"></span></td>
								</tr>
							</tbody>
						</table>
						<%
							if (authenticate.equals("false")
										|| authenticate.equals("direct")) {
						%>
						<div class="gray-bg3-wid">
							<table class="table plandetail-form margin-left-2 vert-middle"
								id="input-white">
								<tbody>
									<tr>
										<td colspan="2" class="pad-none"><h3 class="pad-none"><fmt:message key="flight.details.registration.heading " bundle="${msg}" /></h3> <i><fmt:message key="flight.details.registration.desc" bundle="${msg}" /></i> <br></td>
									</tr>
									<tr>
										<td colspan="2" class="pad-none">&nbsp;</td>
									</tr>
									<tr>
										<td class="col-sm-4 pad-none"><label for="inputEmail3"
											class="control-label bold-500"><fmt:message key="flight.details.registration.username" bundle="${msg}" /></label></td>
										<td class="pad-none"><input type="text" name="userName"
											class="form-control btm-pad-10" placeholder="Username" id="Username">
											<span id="UsernameError" class="text-red"></span>
											</td>
									</tr>
									<tr>
										<td class="pad-none"><label for="inputEmail3"
											class="control-label bold-500"><fmt:message key="flight.details.registration.password" bundle="${msg}" /></label></td>
										<td class="pad-none"><input type="password"
											class="form-control btm-pad-10" name="password" id="Password"
											placeholder="Password">
											<span id="PasswordError" class="text-red"></span>
											</td>
									</tr>
									<tr>
										<td class="pad-none"><label for="inputEmail3"
											class="control-label bold-500"><fmt:message key="flight.details.registration.confirmPassword" bundle="${msg}" /></label></td>
										<td class="pad-none"><input type="password"
											class="form-control btm-pad-10" name="password" id="Confirm-Password"
											placeholder="Confirm password">
											<span id="Confirm-PasswordError" class="text-red"></span>
											</td>
									</tr>
								</tbody>
							</table>
						</div>
						<%
							}
						%>
						<h3 class="black-bold pad-none margin-left-2">
							<fmt:message key="flight.details.insured.heading" bundle="${msg}" /><br>
						</h3>
						<!-- Bellow fields are dynamically generated -->
						<c:set var="totalAdultCount" value="${0}" />
						<c:set var="totalAdultCount"
							value="${planDetailsForm.travellerCount + planDetailsForm.totalAdultTraveller}" />

						<!-- Dynamic Loops -->
						<div class="col-xs-12 col-sm-12 col-md-12 pad-15 insure-travel">
							<input type="hidden" name="totalAdultTraveller"
								id="totalAdultTraveler" value="${totalAdultCount}">
							<c:forEach var="inx" begin="1" end="${totalAdultCount}">
								<div id="adulttraveller">
									<h4 class="color1">
										<c:choose>
											<c:when test="${inx > 1}">
												<c:choose>
													<c:when test="${totalAdultCount == 2}">
<fmt:message key="flight.details.insured.label.family.parent" bundle="${msg}" /> 
</c:when>
													<c:when test="${totalAdultCount != 2}">
Adult Traveller <c:out value="${inx-1}"></c:out>
													</c:when>
												</c:choose>
											</c:when>
											<c:when test="${inx == 1}">
<fmt:message key="flight.details.insured.label.family.parent" bundle="${msg}" /> 
</c:when>
										</c:choose>

									</h4>
									<div class="row ">
										<div class="col-xs-12 col-sm-6 col-md-6">
											<label class="bold-500"><fmt:message key="flight.details.insured.name" bundle="${msg}" /></label> <input type="text"
												name="adultName" id="txtAdFullName${inx}" value=""
												class="form-control " placeholder="As appears on HKID Card"
												onblur="replaceAlpha(this);"
												onkeypress="    return alphaOnly(event);" maxlength="100" />
											<span id="errtxtAdFullName${inx}" class="text-red"> </span>
										</div>
										<div class="col-xs-12 col-sm-6 col-md-6">
											<label class="pad-left1 bold-500"><fmt:message key="flight.details.insured.hkid" bundle="${msg}" /></label> <input
												id="txtInsuHkid${inx}" name="adultHKID"
												class="form-control textUpper" placeholder="X1234567"
												value="" /> <span id="errtxtInsuHkid${inx}"
												class="text-red"> </span> <span
												id="errtxtInvalidInsuHkid${inx}" class="text-red"> </span>
										</div>
									</div>
									<div class="row top-mrg-10">
										<div class="col-xs-12 col-sm-6 col-md-6">
											<label class="bold-500"><fmt:message key="flight.details.insured.age" bundle="${msg}" /></label>
											 <select name="adultAgeRange" class="soflow" id="selectAgeRange${inx}">
												<option value="0">Select One</option>
												<c:forEach var="ageList" items="${mapSelfType}">
													<option value="${ageList.key}"><c:out
															value="${ageList.value}" /></option>
												</c:forEach>
											</select> <span id="errselectAgeRange${inx}" class="text-red">
											</span>
										</div>
										<div class="col-xs-12 col-sm-6 col-md-6">
											<label class="pad-left1 bold-500"><fmt:message key="flight.details.insured.beneficiary" bundle="${msg}" /></label> 
											<t:dropdown 
												defaultLabel="Own Estate"
												defaultValue="SE"
												onChange="activeDiv('adultsbenificiaryId${inx}','adultsselectBenificiary${inx}')"
												selectables="${mapRelationshipCode}"
												valueElmId="adultsselectBenificiary${inx}"
												valueElmName="adultBeneficiary"
											/>
											<span id="erradultsselectBenificiary${inx}" class="text-red"></span>
										</div>

										<div id="adultsbenificiaryId${inx}" class="hide">
											<div class="col-xs-12 col-sm-6 col-md-6">
												<label class="bold-500"><fmt:message key="flight.details.insured.beneficiary.name" bundle="${msg}" /></label> <input type="text"
													name="adultBenificiaryFullName"
													id="adultBenefitiaryId${inx}" value="" class="form-control"
													placeholder="As appears on HKID Card"
													onblur="replaceAlpha(this);"
													onkeypress="    return alphaOnly(event);" maxlength="100" />
												<span id="erradultBenefitiaryId${inx}" class="text-red">
												</span>
											</div>
											<div class="col-xs-12 col-sm-6 col-md-6">
												<label class="pad-left1 bold-500"><fmt:message key="flight.details.insured.beneficiary.hkid" bundle="${msg}" /></label> <input
													id="adultBenefitiaryHKId${inx}" name="adultBenificiaryHkid"
													class="form-control textUpper" placeholder="X1234567"
													value="" /> <span id="erradultBenefitiaryHKId${inx}"
													class="text-red"> </span>
											</div>
											<input id="adultBenefitiaryRelation${inx}" type="hidden"
												name="adultBenificiaryRelationship" class="form-control"
												value="" />
										</div>
									</div>

								</div>

							</c:forEach>

							<!-- child  -->

							<input type="hidden" name="totalChildTraveller"
								value="${totalChildTraveller}" id="totalCountOfChild">
							<c:forEach var="inx" begin="1" end="${totalChildTraveller}">
								<div id="childtraveller">
									<h4 class="color1">
										<fmt:message key="flight.details.insured.label.family.child" bundle="${msg}" />
										<c:out value="${inx}"></c:out>
									</h4>
									<div class="row ">
										<div class="col-xs-12 col-sm-6 col-md-6">
											<label class="bold-500"><fmt:message key="flight.details.insured.name" bundle="${msg}" /></label> <input type="text"
												name="childName" id="txtChldFullName${inx}" value=""
												class="form-control" placeholder="As appears on HKID Card"
												onblur="replaceAlpha(this);"
												onkeypress="    return alphaOnly(event);" maxlength="100" />
											<span id="errtxtChldFullName${inx}" class="text-red">
											</span>
										</div>
										<div class="col-xs-12 col-sm-6 col-md-6">
											<label class="pad-left1 bold-500"><fmt:message key="flight.details.insured.hkid" bundle="${msg}" /></label> <input
												id="txtChldInsuHkid${inx}" name="childHKID"
												class="form-control textUpper" placeholder="X1234567"
												value="" /> <span id="errtxtChldInsuHkid${inx}"
												class="text-red"> </span>
										</div>
									</div>
									<div class="row top-mrg-10">
										<div class="col-xs-12 col-sm-6 col-md-6">
											<label class="bold-500"><fmt:message key="flight.details.insured.age" bundle="${msg}" /></label> 
											<t:dropdown 
												defaultLabel="Select One"
												onChange=""
												selectables="${mapChildType}"
												valueElmId="selectchildAgeRange${inx}"
												valueElmName="childAgeRange"
											/>
											<span id="errchildRange${inx}" class="text-red"></span>
										</div>
										<div class="col-xs-12 col-sm-6 col-md-6">
											<label class="pad-left1 bold-500"><fmt:message key="flight.details.insured.beneficiary" bundle="${msg}" /></label> 
											<t:dropdown 
												defaultLabel="Own Estate"
												defaultValue="SE"
												onChange="activeDiv('childbenificiaryId${inx}','childselectBenificiary${inx}')"
												selectables="${mapRelationshipCode}"
												valueElmId="childselectBenificiary${inx}"
												valueElmName="childBeneficiary"
											/>											
											<span id="errselectChildbenificiary${inx}" class="text-red"></span>
										</div>
										<div id="childbenificiaryId${inx}" class="hide">
											<div class="col-xs-12 col-sm-6 col-md-6">
												<label class="bold-500"><fmt:message key="flight.details.insured.beneficiary.name" bundle="${msg}" /></label> <input type="text"
													name="childBenificiaryFullName"
													id="childBenefitiaryName${inx}" value=""
													class="form-control " placeholder="As appears on HKID Card"
													onblur="replaceAlpha(this);"
													onkeypress="    return alphaOnly(event);" maxlength="100" />
												<span id="errchildBenefitiaryName${inx}" class="text-red"></span>
											</div>
											<div class="col-xs-12 col-sm-6 col-md-6">
												<label class="pad-left1 bold-500 "><fmt:message key="flight.details.insured.beneficiary.hkid" bundle="${msg}" /></label> <input
													id="txtchildInsuHkid${inx}" name="childBenificiaryHkid"
													class="form-control textUpper" placeholder="X1234567"
													value="" /> <span id="errtxtchildInsuHkid${inx}"
													class="text-red"> </span>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>


							<input type="hidden" name="totalOtherTraveller"
								value="${totalOtherTraveller}" id="totalCountOther">

							<c:forEach var="inx" begin="1" end="${totalOtherTraveller}">
								<div id="childtraveller">
									<h4 class="color1">
										<fmt:message key="flight.details.insured.label.family.others" bundle="${msg}" />
										<c:out value="${inx}"></c:out>
									</h4>
									<div class="row ">
										<div class="col-xs-12 col-sm-6 col-md-6">
											<label class="bold-500"><fmt:message key="flight.details.insured.name" bundle="${msg}" /></label> <input type="text"
												name="otherName" id="txtOtherFullName${inx}" value=""
												class="form-control " placeholder="As appears on HKID Card"
												onblur="replaceAlpha(this);"
												onkeypress="    return alphaOnly(event);" maxlength="100" />
											<span id="errtxtOtherFullName${inx}" class="text-red"></span>
										</div>
										<div class="col-xs-12 col-sm-6 col-md-6">
											<label class="pad-left1 bold-500"><fmt:message key="flight.details.insured.hkid" bundle="${msg}" /></label> <input
												id="txtOtherInsuHkid${inx}" name="otherHKID"
												class="form-control textUpper" placeholder="X1234567"
												value="" /> <span id="errtxtOtherInsuHkid${inx}"
												class="text-red"> </span>
										</div>
									</div>
									<div class="row top-mrg-10">
										<div class="col-xs-12 col-sm-6 col-md-6">
											<label class="bold-500"><fmt:message key="flight.details.insured.age" bundle="${msg}" /></label>
											<t:dropdown 
												defaultLabel="Select One"
												onChange=""
												selectables="${mapAgeType}"
												valueElmId="selectOtherAgeRange${inx}"
												valueElmName="otherAgeRange"
											/>
											<span id="errselectOtherAgeRange${inx}" class="text-red"></span>
										</div>
										<div class="col-xs-12 col-sm-6 col-md-6">
											<label class="pad-left1 bold-500"><fmt:message key="flight.details.insured.beneficiary" bundle="${msg}" /></label>
											<t:dropdown 
												defaultLabel="Own Estate"
												defaultValue="SE"
												onChange="activeDiv('otherbenificiaryId${inx}','otherSelectBenificiary${inx}')"
												selectables="${mapRelationshipCode}"
												valueElmId="otherSelectBenificiary${inx}"
												valueElmName="otherBeneficiary"
											/>											
											<span id="benificiary" style="display: none"> <label
												style="color: red">Beneficiary which is blank</label>
											</span>
										</div>
										<div id="otherbenificiaryId${inx}" class="hide">
											<div class="col-xs-12 col-sm-6 col-md-6">
												<label class="bold-500"><fmt:message key="flight.details.insured.beneficiary.name" bundle="${msg}" /></label> <input type="text"
													name="otherBenificiaryFullName"
													id="otherBenefitiaryName${inx}" value=""
													class="form-control " placeholder="As appears on HKID Card"
													onblur="replaceAlpha(this);"
													onkeypress="    return alphaOnly(event);" maxlength="100" />
												<span id="errotherBenefitiaryName${inx}" class="text-red"></span>
											</div>
											<div class="col-xs-12 col-sm-6 col-md-6">
												<label class="pad-left1 bold-500"><fmt:message key="flight.details.insured.beneficiary.hkid" bundle="${msg}" /></label> <input
													id="txtOtherBenInsuHkid${inx}" name="otherBenificiaryHkid"
													class="form-control textUpper" placeholder="X1234567"
													value="" /> <span id="errtxtOtherBenInsuHkid${inx}"
													class="text-red"> </span>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>


							<!--Till this Line  -->

						</div>

						
						<div class="declaration-content">
							<h4 class="h4-2"><fmt:message key="flight.details.declarations.heading" bundle="${msg}" /></h4>
							<div class="checkbox">
								<input id="checkbox1" name="checkbox1" type="checkbox">
								<label for="checkbox1"> <fmt:message key="flight.details.declarations.tnc" bundle="${msg}" />
									<ol class="ol-disclaimer">
										<li><fmt:message key="flight.details.declarations.tnc.desc1" bundle="${msg}" /></li>
										<li><fmt:message key="flight.details.declarations.tnc.desc2" bundle="${msg}" /></li>
										<li><fmt:message key="flight.details.declarations.tnc.desc3" bundle="${msg}" /></li>
										<li><fmt:message key="flight.details.declarations.tnc.desc4" bundle="${msg}" /></li>
										<li><fmt:message key="flight.details.declarations.tnc.desc5" bundle="${msg}" /></li>
									</ol>
									
								</label>
							</div>
							<span id="chk1" class="text-red"> </span>
							
								
							<div class="checkbox">
								<input id="checkbox2" type="checkbox"> <label for="checkbox2">
									<fmt:message key="flight.details.declarations.PICS.part1" bundle="${msg}" /> <a
									href="https://home.fwd.com.hk/giphw/FWD_Resources/GI_Personal%20Data%20Protection%20Policy%20and%20Practices.pdf"
									target="_blank" class="sub-link"> <fmt:message key="flight.details.declarations.PICS.part2" bundle="${msg}" /></a><fmt:message key="flight.details.declarations.PICS.part3" bundle="${msg}" /> <br>
									
								</label>
							</div>

							<span id="chk2" class="text-red"> </span> 
							<hr />
							
							<div>
								<fmt:message key="flight.details.declarations.PDPO" bundle="${msg}" />
							</div>
							<div class="checkbox">
								<input id="checkbox3" type="checkbox"> <label
									for="checkbox3"> <fmt:message key="flight.details.declarations.PDPO.option1" bundle="${msg}" /><br>
								</label>
							</div>

							<div class="checkbox">
								<input id="checkbox4" type="checkbox"> <label
									for="checkbox4"> <fmt:message key="flight.details.declarations.PDPO.option2" bundle="${msg}" /><br> <br>
								</label>
							</div>

						</div>
					</div>
					<div
						class="col-lg-5 col-md-5 col-sm-12 col-xs-12 gray-bg pad-none wht-bg3">
						<!--mob-hidden-->
						<div class="hidden-sm hidden-xs">
							<div class="wd2">
								<div class="pull-left">
									<h2 class="h2-3-choose"><fmt:message key="flight.details.summary.product" bundle="${msg}" /></h2>
									<h4>
										<!-- Plan Summary -->
									</h4>
								</div>
								<div class="pull-right">
									<h2 class="text-left pad-right1 h2-2">
										<div class="hk">
											<!-- HK$ -->
											<div class="flightcare-hk">
												<%-- ${planDetailsForm.getTotalDue()} --%>
											</div>
										</div>
									</h2>
								</div>
							</div>
							<div class="clearfix"></div>
							<div class="orange-bdr"></div>
							<div class="form-container">


								<h3 class="txt-bold">
									<fmt:message key="flight.details.summary.option1" bundle="${msg}" /> <span class="span2 uline"><a
										href="flight"><fmt:message key="flight.details.summary.change" bundle="${msg}" /></a></span>
								</h3>
								<input type="hidden" name="departureDate"
									value="${planDetailsForm.getDepartureDate()}"> <input
									type="hidden" name="returnDate"
									value="${planDetailsForm.getReturnDate()}">

								<h4>${planDetailsForm.getDepartureDate()}</h4>
								<h3 class="txt-bold">
									<fmt:message key="flight.details.summary.option2" bundle="${msg}" /> <span class="span2 uline"><a href="flight"><fmt:message key="flight.details.summary.change" bundle="${msg}" /></a></span>
								</h3>
								<h4>${planDetailsForm.getReturnDate()}</h4>
								<h3 class="txt-bold">
									<fmt:message key="flight.details.summary.option3" bundle="${msg}" /> <span class="span2 uline"><a href="flight"><fmt:message key="flight.details.summary.change" bundle="${msg}" /></a></span>
								</h3>
								<h4>
									<c:if test="${planDetailsForm.getTotalAdultTraveller() !=0 }">Parent(s): ${planDetailsForm.getTotalAdultTraveller()} <br></c:if>
									<c:if test="${planDetailsForm.getTotalChildTraveller() !=0 }">Child(ren): ${planDetailsForm.getTotalChildTraveller()} <br></c:if>
									<c:if test="${planDetailsForm.getTotalOtherTraveller() !=0}">Other(s): ${planDetailsForm.getTotalOtherTraveller()} <br></c:if>
									<c:if test="${planDetailsForm.getTravellerCount() !=0}">Traveller(s): ${planDetailsForm.getTravellerCount()}</c:if>
								</h4>
								<input type="hidden" name="otherInput"
									value="${planDetailsForm.getTotalOtherTraveller()}"> <input
									type="hidden" name="childInput"
									value="${planDetailsForm.getTotalChildTraveller()}"> <br>
								<input type="hidden" name="days"
									value="${planDetailsForm.getDays()}">
								<h3 class="txt-bold">
									<fmt:message key="flight.details.summary.option4" bundle="${msg}" /><span>${planDetailsForm.getDays()}</span>
								</h3>
								<br>
							</div>
							<div class="orange-bdr"></div>
							<h3 class="h4-1-orange-b col-lg-6 col-md-6">
								<!-- Amount due -->
							</h3>
							<h3 class="h4-1-orange-b col-lg-6 col-md-6 text-right">
								<%-- ${planDetailsForm.getTotalDue()} --%>
								&nbsp;
							</h3>
						</div>
						<!--mob-hidden-->
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pull-left">
							<a href="flight" class="bdr-curve btn btn-primary bck-btn"><fmt:message key="flight.details.action.back" bundle="${msg}" /></a>
						</div>

						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pull-right">

							<input type="submit"
								class="bdr-curve-none btn btn-primary btn-next " value="<fmt:message key="flight.details.action.next" bundle="${msg}" />" />
							<!-- <button class="bdr-curve-none btn btn-primary nxt-btn "
onclick="return flightPlanValidation();">Next</button> -->
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="clearfix"></div>
				</div>
				<p class="padding1 hidden-sm hidden-xs">
					<fmt:message key="flight.details.other.disclaimer.part1" bundle="${msg}" /> <a
						class="sub-link"
						href="resources/policy-provisions-pdf/FlightCare_Provisions_Mar_2015.pdf" target="_blank"><fmt:message key="flight.details.other.disclaimer.part2" bundle="${msg}" /></a> <fmt:message key="flight.details.other.disclaimer.part3" bundle="${msg}" /><br><fmt:message key="flight.details.other.disclaimer.part4" bundle="${msg}" />
				</p>
			</form:form>
		</div>
		<!--/.row-->
	</div>
	<!--/.container-->
</section>

<!--------/end- Main Content------------>

<!------ Plan-login-popup----- -->

<div class="modal fade bs-example-modal-lg " id="loginpopup"
	tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
	aria-hidden="true" style="display: none;">
	<div class="modal-dialog modal-lg">
		<div class="modal-content plan-modal">
			<form name="popUploginform" id="popUploginform" class="">
				<div class="login-form">
					<%-- <%request.setAttribute("is-flight-plan", "true"); %> --%>
					<div id="login-err-msg" class="alert alert-danger hide">
						<div id="login-err-msg" class="alert alert-danger" role="alert"></div>
					</div>
					<div class="form-container">
						<h2><fmt:message key="header.login.heading" bundle="${msg}" /></h2>
						<h4>
							<fmt:message key="header.login.username" bundle="${msg}" /> <a href="forgotUserName" class="pull-right sub-link"><fmt:message key="header.login.username.forget" bundle="${msg}" /></a>
						</h4>
						<div class="form-group">
							<input type="text" name="userName" class="form-control"
								placeholder="" id="txtUserName">
						</div>
						<span id="errUserName" style="color: red"></span>
						<h4>
							<fmt:message key="header.login.password" bundle="${msg}" /> <a href="forgotUserPassword" class="pull-right sub-link"><fmt:message key="header.login.password.forget" bundle="${msg}" /></a>
						</h4>
						<div class="form-group">
							<input type="password" class="form-control" name="password"
								id="txtPass">
						</div>
						<span id="errPass" style="color: red"></span> <br>
						<div class="row">
							<div class="text-left col-lg-6 col-md-6">
								<button class="bdr-curve-none btn btn-primary btn-lg  wd5"
									type="button" onclick="return userLoginFnc();" tabindex="3"><fmt:message key="header.login.action" bundle="${msg}" /></button>
							</div>
							<h3 class="text-left col-lg-6 col-md-6 pad-none margin-none">
								<span> <fmt:message key="header.login.registration.heading" bundle="${msg}" /></span><br> <a href="joinus"
									class="sub-link"><fmt:message key="header.login.registration.action" bundle="${msg}" /></a>
							</h3>
							<div class="clearfix"></div>
						</div>

						<p><fmt:message key="header.login.disclaimer" bundle="${msg}" /></p>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>


<script>



/* For Benefitiary Div active and Inactive */
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
	if (selectedValue == "" || selectedValue == "SE") {
		$('#' + id).addClass('hide');
	} else {
		$('#' + id).removeClass('hide');
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
url : "userLogin",
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
function createFlightFnc(form) {
	var flag = false;
	if(fPlanValid()){
		console.log("ajax called");
		$.ajax({
			type : "POST",
			url : "flight-confirmation",
			data : $("#freeFlightForm").serialize(),
			async : false,
			success : function(data) {
				if (data == 'success') {
					$('#errorMessages').hide();
					flag= true;
					form.action = "flight-confrimation-page";
				} else{
					flag= false;
					$('#errorMessages').removeClass('hide');
					$('#errorMessages').html(data);
				}
		
			}
		});
	}	
	return flag;
}
</script>