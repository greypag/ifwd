<%@page import="com.ifwd.fwdhk.model.PlanDetailsForm"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.ifwd.fwdhk.model.FlightQuoteDetails"%>
<%@page import="com.ifwd.fwdhk.model.PlanDetails"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
					<li><a href="#">Home</a> <i class="fa fa-caret-right"></i></li>
					<li><a href="#">FlightCare </a> <i class="fa fa-caret-right"></i></li>
					<li><a href="#">Your options </a></li>
					<li class="active "><i class="fa fa-caret-right"></i> Your
						details</li>
				</ol>
				<input type="hidden" name="planSelected"
					value="${planDetailsForm.getPlanSelected()}">
				<div class="container ">
					<div
						class="col-md-12 col-lg-12 col-sm-12 col-xs-12 shop-tracking-status">
						<div class="center wow fadeInDown animated"
							style="visibility: visible;">
							<h2>Your details</h2>
						</div>
						<br> <br>
						<div class="order-status">
							<div class="order-status-timeline">
								<!-- class names: c0 c1 c2 c3 and c4 -->
								<div class="order-status-timeline-completion c3"></div>
							</div>
							<div
								class="image-order-status image-order-status-new  img-circle">
								<div class="icon">1</div>
								<span class="status status-working">Your Options</span>
							</div>
							<div
								class="image-order-status image-order-status-active active img-circle">
								<div class="icon">2</div>
								<span class="status">Your Details</span>
							</div>
							<div
								class="image-order-status image-order-status-intransit disabled  img-circle">
								<div class="icon">3</div>
								<span class="status min-left">Confirmation</span>
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
							class="margin-left-2 h2-3-existing-fwd-head hidden-sm hidden-xs">Existing
							FWD eServices member?</h3>
						<h3
							class="margin-left-2 h2-3-existing-fwd-head hidden-lg hidden-md">Are
							you an existing FWD eServices member?</h3>

						<a href="#"
							class="col-lg-5 col-md-5 col-sm-5 col-xs-5 btn-box-2 margin-left-2 color4"
							data-toggle="modal" data-target=".bs-example-modal-lg">Login</a>


						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 text-left">
							<h3 class="text-left or-continue">
								<span>Or,</span> continue as a guest.
							</h3>
						</div>
						<%
							}
						%>
						<div class="clearfix"></div>
						<br>
						<div class="gray-bdr"></div>
						<table class="table activation-form margin-left-2">
							<tbody>
								<tr>
									<td colspan="2" class="pad-none"><h3
											class="black-bold pad-none">Applicant's Details</h3></td>
								</tr>
								<tr>


									<td valign="middle" class="col-sm-4 pad-none"><label
										for="inputFullName" class="control-label bold-500">Full
											name</label></td>
									<td class="pad-none"><input type="text"
										value="${userDetails.getFullName()}" class="form-control"
										id="inputFullName" name="fullName"
										placeholder="as appears on HKID Card/Passport"
										onblur="replaceAlpha(this);"
										onkeypress="return alphaOnly(event);" maxlength="100" /> <span
										id="fullnameinvalid" class="text-red"></span></td>
								</tr>
								<tr>
									<td valign="middle" class="pad-none"><label
										for="inputEmail3" class="control-label bold-500">HKID</label></td>
									<td class="pad-none"><input type="text" name="hkid"
										class="form-control numberinput textUpper"
										id="inputTxtAppHkid" placeholder="X1234567"> <span
										id="errAppHkid" class="text-red"> </span></td>
								</tr>
								<tr>
									<td valign="middle" class="pad-none"><label
										for="inputMobileNo" class="control-label bold-500">Mobile
											Number</label></td>
									<td class="pad-none"><input type="text"
										value="${userDetails.getMobileNo()}" class="form-control"
										name="mobileNo" id="inputMobileNo" placeholder="Mobile Number"
										onkeypress="return isNumeric(event)"
										onblur="replaceNumeric(this);" maxlength="8" /> <span
										id="mobileNo" class="text-red"></span></td>
								</tr>
								<tr>
									<td valign="middle" class="pad-none"><label
										for="inputEmailId" class="control-label bold-500">Email
											Address</label></td>
									<td class="pad-none"><input class="form-control"
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
							<table class="table plandetail-form margin-left-2"
								id="input-white">
								<tbody>
									<tr>
										<td colspan="2" class="pad-none"><h3 class="pad-none">Create
												FWD Member Account?</h3> <i>Leave blank if you do not want a
												member account to be created</i> <br></td>
									</tr>
									<tr>
										<td colspan="2" class="pad-none">&nbsp;</td>
									</tr>
									<tr>
										<td class="col-sm-4 pad-none"><label for="inputEmail3"
											class="control-label bold-500">Choose Username</label></td>
										<td class="pad-none"><input type="text" name="userName"
											class="form-control" placeholder="Username" id="Username"></td>
									</tr>
									<tr>
										<td class="pad-none"><label for="inputEmail3"
											class="control-label bold-500">Choose Password</label></td>
										<td class="pad-none"><input type="password"
											class="form-control" name="password" id="Password"
											placeholder="Password">
									</tr>
									<tr>
										<td class="pad-none"><label for="inputEmail3"
											class="control-label bold-500">Confirm Password</label></td>
										<td class="pad-none"><input type="password"
											class="form-control" name="password" id="Confirm-Password"
											placeholder="Confirm password"></td>
									</tr>
								</tbody>
							</table>
						</div>
						<%
							}
						%>
						<h3 class="black-bold pad-none margin-left-2">
							Details for Insured Person(s)<br>
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
Spouse 
</c:when>
													<c:when test="${totalAdultCount != 2}">
Adult Traveller <c:out value="${inx-1}"></c:out>
													</c:when>
												</c:choose>
											</c:when>
											<c:when test="${inx == 1}">
Myself 
</c:when>
										</c:choose>

									</h4>
									<div class="row ">
										<div class="col-xs-6 col-md-6">
											<label class="bold-500">Full Name</label> <input type="text"
												name="adultName" id="txtAdFullName${inx}" value=""
												class="form-control " placeholder="As appears on HKID Card"
												onblur="replaceAlpha(this);"
												onkeypress="    return alphaOnly(event);" maxlength="100" />
											<span id="errtxtAdFullName${inx}" class="text-red"> </span>
										</div>
										<div class="col-xs-6 col-md-6">
											<label class="pad-left1 bold-500">HKID</label> <input
												id="txtInsuHkid${inx}" name="adultHKID"
												class="form-control textUpper" placeholder="X1234567"
												value="" /> <span id="errtxtInsuHkid${inx}"
												class="text-red"> </span> <span
												id="errtxtInvalidInsuHkid${inx}" class="text-red"> </span>
										</div>
									</div>
									<div class="row top-mrg-10">
										<div class="col-xs-6 col-md-6">
											<label class="bold-500">Age Range</label> <select
												name="adultAgeRange" class="form-control soflow"
												id="selectAgeRange${inx}">
												<option value="0">Select One</option>
												<c:forEach var="ageList" items="${mapAgeType}">
													<option value="${ageList.key}"><c:out
															value="${ageList.value}" /></option>
												</c:forEach>
											</select> <span id="errselectAgeRange${inx}" class="text-red">
											</span>
										</div>
										<div class="col-xs-6 col-md-6">
											<label class="pad-left1 bold-500">Beneficiary</label> <select
												id="adultsselectBenificiary${inx}"
												onchange="activeDiv('adultsbenificiaryId${inx}','adultsselectBenificiary${inx}')"
												name="adultBeneficiary" class="form-control soflow">
												<option value="SE">Own Estate</option>
												<c:forEach var="relationshipCodeList"
													items="${mapRelationshipCode}">
													<option value="${relationshipCodeList.key}"><c:out
															value="${relationshipCodeList.value}" /></option>
												</c:forEach>
											</select> <span id="erradultsselectBenificiary${inx}" class="text-red">
											</span>
										</div>

										<div id="adultsbenificiaryId${inx}" class="hide">
											<div class="col-xs-6 col-md-6">
												<label class="bold-500">Full Name</label> <input type="text"
													name="adultBenificiaryFullName"
													id="adultBenefitiaryId${inx}" value="" class="form-control"
													placeholder="As appears on HKID Card"
													onblur="replaceAlpha(this);"
													onkeypress="    return alphaOnly(event);" maxlength="100" />
												<span id="erradultBenefitiaryId${inx}" class="text-red">
												</span>
											</div>
											<div class="col-xs-6 col-md-6">
												<label class="pad-left1 bold-500">HKID</label> <input
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
										Child Traveller
										<c:out value="${inx}"></c:out>
									</h4>
									<div class="row ">
										<div class="col-xs-6 col-md-6">
											<label class="bold-500">Full Name</label> <input type="text"
												name="childName" id="txtChldFullName${inx}" value=""
												class="form-control" placeholder="As appears on HKID Card"
												onblur="replaceAlpha(this);"
												onkeypress="    return alphaOnly(event);" maxlength="100" />
											<span id="errtxtChldFullName${inx}" class="text-red">
											</span>
										</div>
										<div class="col-xs-6 col-md-6">
											<label class="pad-left1 bold-500">HKID</label> <input
												id="txtChldInsuHkid${inx}" name="childHKID"
												class="form-control textUpper" placeholder="X1234567"
												value="" /> <span id="errtxtChldInsuHkid${inx}"
												class="text-red"> </span>
										</div>
									</div>
									<div class="row top-mrg-10">
										<div class="col-xs-6 col-md-6">
											<label class="bold-500">Age Range</label> <select
												name="childAgeRange" class="form-control soflow"
												id="selectchildAgeRange${inx}">
												<option value="0">Select One</option>
												<c:forEach var="ageList" items="${mapAgeType}">
													<option value="${ageList.key}"><c:out
															value="${ageList.value}" /></option>
												</c:forEach>
											</select> <span id="errchildRange${inx}" class="text-red"></span>
										</div>
										<div class="col-xs-6 col-md-6">
											<label class="pad-left1 bold-500">Beneficiary</label> <select
												id="childselectBenificiary${inx}" name="childBeneficiary"
												onchange="activeDiv('childbenificiaryId${inx}','childselectBenificiary${inx}')"
												class="form-control soflow">
												<option value="SE">Own Estate</option>
												<c:forEach var="relationshipCodeList"
													items="${mapRelationshipCode}">
													<option value="${relationshipCodeList.key}"><c:out
															value="${relationshipCodeList.value}" /></option>
												</c:forEach>
											</select> <span id="errselectChildbenificiary${inx}" class="text-red"></span>
										</div>
										<div id="childbenificiaryId${inx}" class="hide">
											<div class="col-xs-6 col-md-6">
												<label class="bold-500">Full Name</label> <input type="text"
													name="childBenificiaryFullName"
													id="childBenefitiaryName${inx}" value=""
													class="form-control " placeholder="As appears on HKID Card"
													onblur="replaceAlpha(this);"
													onkeypress="    return alphaOnly(event);" maxlength="100" />
												<span id="errchildBenefitiaryName${inx}" class="text-red"></span>
											</div>
											<div class="col-xs-6 col-md-6">
												<label class="pad-left1 bold-500 ">HKID</label> <input
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
										Other Traveller
										<c:out value="${inx}"></c:out>
									</h4>
									<div class="row ">
										<div class="col-xs-6 col-md-6">
											<label class="bold-500">Full Name</label> <input type="text"
												name="otherName" id="txtOtherFullName${inx}" value=""
												class="form-control " placeholder="As appears on HKID Card"
												onblur="replaceAlpha(this);"
												onkeypress="    return alphaOnly(event);" maxlength="100" />
											<span id="errtxtOtherFullName${inx}" class="text-red"></span>
										</div>
										<div class="col-xs-6 col-md-6">
											<label class="pad-left1 bold-500">HKID</label> <input
												id="txtOtherInsuHkid${inx}" name="otherHKID"
												class="form-control textUpper" placeholder="X1234567"
												value="" /> <span id="errtxtOtherInsuHkid${inx}"
												class="text-red"> </span>
										</div>
									</div>
									<div class="row top-mrg-10">
										<div class="col-xs-6 col-md-6">
											<label class="bold-500">Age Range</label> <select
												name="otherAgeRange" class="form-control soflow"
												id="selectOtherAgeRange${inx}">
												<option value="0">Select One</option>
												<c:forEach var="ageList" items="${mapAgeType}">
													<option value="${ageList.key}"><c:out
															value="${ageList.value}" /></option>
												</c:forEach>
											</select> <span id="errselectOtherAgeRange${inx}" class="text-red"></span>
										</div>
										<div class="col-xs-6 col-md-6">
											<label class="pad-left1 bold-500">Beneficiary</label> <select
												id="otherSelectBenificiary${inx}" name="otherBeneficiary"
												onchange="activeDiv('otherbenificiaryId${inx}','otherSelectBenificiary${inx}')"
												class="form-control soflow">
												<option value="SE">Own Estate</option>
												<c:forEach var="relationshipCodeList"
													items="${mapRelationshipCode}">
													<option value="${relationshipCodeList.key}"><c:out
															value="${relationshipCodeList.value}" /></option>
												</c:forEach>
											</select> <span id="benificiary" style="display: none"> <label
												style="color: red">Beneficiary which is blank</label>
											</span>
										</div>
										<div id="otherbenificiaryId${inx}" class="hide">
											<div class="col-xs-6 col-md-6">
												<label class="bold-500">Full Name</label> <input type="text"
													name="otherBenificiaryFullName"
													id="otherBenefitiaryName${inx}" value=""
													class="form-control " placeholder="As appears on HKID Card"
													onblur="replaceAlpha(this);"
													onkeypress="    return alphaOnly(event);" maxlength="100" />
												<span id="errotherBenefitiaryName${inx}" class="text-red"></span>
											</div>
											<div class="col-xs-6 col-md-6">
												<label class="pad-left1 bold-500">HKID</label> <input
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

						<h4 class="h4-2 padding3">Declaration</h4>
						<div class="declaration-content">
							<div class="checkbox">
								<input id="checkbox1" name="checkbox1" type="checkbox">
								<label for="checkbox1"> I have read and understand the
									policy provisions and hereby declare that:- <br> i. <span
									class="margin-left-2"></span>The particulars and statements
									given above are, to the best of my knowledge and belief, true
									and complete;<br> ii. <span class="margin-left-2"></span>To
									the best of my knowledge and belief no Insured Person is
									travelling contrary to the advice of any medical practitioner
									or for the purpose of obtaining medical treatment and that I
									understand that treatment of any pre-existing, recurring or
									congenital medical conditions are not insured. I am not aware
									of any condition cause or circumstance that may necessitate the
									cancellation or curtailment of the journey as planned; and <br>
									iii. <span class="margin-left-2"></span>This application shall
									be the basis of the contract between me and FWD.<br /> iv. <span
									class="margin-left-2"></span>This Proposal Form is applied and
									signed at HKSAR, in case of fraud or factual misrepresentation,
									the cover for me or for the Insured Person(s) may be
									invalidated. <br /> v. <span class="margin-left-2"></span>I
									have obtained the consent from the Insured Traveller(s) for
									passing the above information to FWD General Insurance Company
									Limited for the purpose of carrying out the FlightCare
									Insurance. <br />
								
							
							
									I have read and understood <a
									href="https://home.fwd.com.hk/giphw/FWD_Resources/GI_Personal%20Data%20Protection%20Policy%20and%20Practices.pdf"
									target="_blank" class="sub-link"> Personal Information
										Collection Statement</a> and agree to be bound by the same. <br>
									
								</label>
							</div>

							<span id="chk1" class="text-red"> </span>

							<hr />
							<div>
								If you do NOT wish The Company to use Your Personal Data in
									direct marketing or provide Your Personal Data to other persons
									or companies for their use in direct marketing, please tick the
									appropriate box(es) below to exercise
							</div>
							<div class="checkbox">
								<input id="checkbox2" type="checkbox"> <label
									for="checkbox2"> Please do not send direct marketing
									information to me. <br>
								</label>
							</div>

							<div class="checkbox">
								<input id="checkbox3" type="checkbox"> <label
									for="checkbox3"> Please do not provide my personal data
									to other persons or companies for their use in direct
									marketing. <br> <br>
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
									<h2 class="h2-3-choose">FlightCare</h2>
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
									Departure Date <span class="span2 uline"><a
										href="flight">Change</a></span>
								</h3>
								<input type="hidden" name="departureDate"
									value="${planDetailsForm.getDepartureDate()}"> <input
									type="hidden" name="returnDate"
									value="${planDetailsForm.getReturnDate()}">

								<h4>${planDetailsForm.getDepartureDate()}</h4>
								<h3 class="txt-bold">
									Return Date <span class="span2 uline"><a href="flight">Change</a></span>
								</h3>
								<h4>${planDetailsForm.getReturnDate()}</h4>
								<h3 class="txt-bold">
									Travellers <span class="span2 uline"><a href="flight">Change</a></span>
								</h3>
								<h4>
									<c:if test="${planDetailsForm.getTotalAdultTraveller() !=0 }">Parent :${planDetailsForm.getTotalAdultTraveller()},</c:if>
									<c:if test="${planDetailsForm.getTotalChildTraveller() !=0 }">Child :${planDetailsForm.getTotalChildTraveller()},</c:if>
									<c:if test="${planDetailsForm.getTotalOtherTraveller() !=0}">Others :${planDetailsForm.getTotalOtherTraveller()}</c:if>
									<c:if test="${planDetailsForm.getTravellerCount() !=0}">Travellers :${planDetailsForm.getTravellerCount()}</c:if>
								</h4>
								<input type="hidden" name="otherInput"
									value="${planDetailsForm.getTotalOtherTraveller()}"> <input
									type="hidden" name="childInput"
									value="${planDetailsForm.getTotalChildTraveller()}"> <br>
								<input type="hidden" name="days"
									value="${planDetailsForm.getDays()}">
								<h3 class="txt-bold">
									No. of days:<span>${planDetailsForm.getDays()}</span>
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
							<a href="flight" class="bdr-curve btn btn-primary bck-btn">Back
							</a>
						</div>

						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pull-right">

							<input type="submit"
								class="bdr-curve-none btn btn-primary nxt-btn " value="Next" />
							<!-- <button class="bdr-curve-none btn btn-primary nxt-btn "
onclick="return flightPlanValidation();">Next</button> -->
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="clearfix"></div>
				</div>
				<p class="padding1 hidden-sm hidden-xs">
					The features above are indicative only. Please refer to the <a
						class="sub-link"
						href="resources/policy-provisions-pdf/FlightCare_Provisions_Mar_2015.pdf">Policy
						Provisions</a> for details.<br> For a complete explanation of the
					terms and conditions. Please contact your adviser or our customer
					service at 3123 3123 for more details.
				</p>
			</form:form>
		</div>
		<!--/.row-->
	</div>
	<!--/.container-->
</section>

<!--------/end- Main Content------------>

<!------Plan-login-popup------->
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
						<h2>Log in to FWD</h2>
						<h4>
							Username <a href="forgotUserName" class="pull-right sub-link">Forgot
								username?</a>
						</h4>
						<div class="form-group">
							<input type="text" name="userName" class="form-control"
								placeholder="" id="txtUserName">
						</div>
						<span id="errUserName" style="color: red"></span>
						<h4>
							Password <a href="forgotUserPassword" class="pull-right sub-link">Forgot
								password?</a>
						</h4>
						<div class="form-group">
							<input type="password" class="form-control" name="password"
								id="txtPass">
						</div>
						<span id="errPass" style="color: red"></span> <br>
						<div class="row">
							<div class="text-left col-lg-6 col-md-6">
								<button class="bdr-curve-none btn btn-primary btn-lg  wd5"
									type="button" onclick="return userLoginFnc();" tabindex="3">Log
									In</button>
							</div>
							<h3 class="text-left col-lg-6 col-md-6 pad-none margin-none">
								<span> New Member?</span><br> <a href="joinus"
									class="sub-link"> Register here</a>
							</h3>
							<div class="clearfix"></div>
						</div>

						<p>For the purpose of purchasing a specified insurance plan
							through this website (“the Plan”), I hereby consent the transfer
							of my personal data from FWD eServices to the issuer of the Plan.</p>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>


<script>



/* For Benefitiary Dive active and Inactive */
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