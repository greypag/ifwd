<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String authenticate = "false";
	if (request.getSession().getAttribute("authenticate") != null) {
		authenticate = request.getSession()
				.getAttribute("authenticate").toString();
	}
%>


<!--/#main-Content-->
<section>
	<div class="container">
		<div class="row">
			<form:form name="frmYourDetails" id="frmYourDetails"
				action="prepareUserSummary" method="post"
				onsubmit="return tPlanValid();" modelAttribute="frmYourDetails">
				<ol class="breadcrumb pad-none">
					<li><a href="#">Home</a> <i class="fa fa-caret-right"></i></li>
					<li><a href="#">TravelCare </a> <i class="fa fa-caret-right"></i></li>
					<li><a href="#">Your options </a></li>
					<li class="active "><i class="fa fa-caret-right"></i> Your
						details</li>
				</ol>

				<div class="container ">
					<div class="col-md-12 shop-tracking-status">
						<div class="center wow fadeInDown animated"
							style="visibility: visible;">
							<h2>Your details</h2>
						</div>
						<br> <br>
						<div class="col-lg-12">
							<div id="tr-wizard" class="shop-tracking-status">
								<div class="order-status">
									<div class="order-status-timeline">
										<!-- class names: c0 c1 c2 c3 and c4 -->
										<div
											class="order-status-timeline-completion order-status-timeline-completion c2"></div>
									</div>
									<div
										class="image-order-status image-order-status-new active img-circle">
										<span class="status color3">Your Options</span>
										<div class="icon">1</div>
									</div>
									<div
										class="image-order-status image-order-status-intransit  img-circle act">
										<span class="status color2">Your Details</span>
										<div class="icon">2</div>
									</div>
									<div
										class="image-order-status image-order-status-delivered  img-circle disabled">
										<span class="status">Summary & Payment</span>
										<div class="icon">3</div>
									</div>
									<div
										class="image-order-status image-order-status-completed  img-circle disabled">
										<span class="status lst-status">Confirmation</span>
										<div class="icon">4</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<br>
				<br>
				<br>
				<div class="container pad-none bdr ur-opt-content gray-bg3">
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
								<span>or</span> Continue as guest
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
											class="black-bold pad-none">Applicant's details</h3></td>
								</tr>
								<tr>
									<td class="col-sm-4 pad-none"><label for="inputFullName"
										class="control-label bold-500">Full name</label></td>
									<td class="pad-none"><input type="text"
										value="${userDetails.getFullName()}" class="form-control"
										id="inputFullName" name="fullName"
										placeholder="As appears on HKID Card"
										onblur="replaceAlpha(this);"
										onkeypress=" return alphaOnly(event);" maxlength="100" /> <span
										id="fullname" style="display: none"> <label
											class="text-red">Please enter Full Name and please
												enter in English</label>
									</span> <span id="fullnameinvalid" class="text-red"></span></td>
								</tr>
								<tr>
									<td class="pad-none">
									<div class="col-md-10 col-lg-10 pad-none">
									<select id="selectHkidPass" class="soflow" name="selectedHkidPassApplicant">
									<option value="HKID" selected="selected">HKID</option>
									<option value="passport">Passport</option>
									</select>
									</div>
									</td>
									<td class="pad-none">
									<input type="text" name="hkid"	class="form-control numberinput textUpper btm-pad-10"	id="inputTxtAppHkid" placeholder="X1234567">
									 <span	id="errAppHkid" class="text-red"> </span>
									 </td>
								</tr>
								<tr>
									<td class="pad-none"><label for="inputMobileNo"
										class="control-label bold-500">Mobile number</label></td>
									<td class="pad-none"><input type="text" name="mobileNo"
										value="${userDetails.getMobileNo()}" class="form-control"
										id="inputMobileNo" placeholder="Mobile number"
										onkeypress="return isNumeric(event)"
										onblur="replaceNumeric(this);" maxlength="8" /> <span
										id="mobileNo" class="text-red"></span></td>
								</tr>
								<tr>
									<td class="pad-none"><label for="inputEmailId"
										class="control-label bold-500">Email address</label></td>
									<td class="pad-none"><input class="form-control"
										value="${userDetails.getEmailAddress()}" name="emailAddress" id="inputEmailId"
										placeholder="Email address" maxlength="50"> <span
										id="emailid" class="text-red"></span></td>
								</tr>
							</tbody>
						</table>
						<%
							if (authenticate.equals("false")
										|| "direct".equalsIgnoreCase(request.getSession()
												.getAttribute("authenticate").toString())) {
						%>

						<div class="gray-bg3-wid">
							<table class="table plandetail-form margin-left-2"
								id="input-white">
								<tbody>
									<tr>
										<td colspan="2" class="pad-none">
											<h3 class="pad-none">Create FWD Member account?</h3> <i>Leave
												blank if you do not want a member account to be created</i> <br>
										</td>
									</tr>
									<tr>
										<td colspan="2" class="pad-none">&nbsp;</td>
									</tr>
									<tr>
										<td class="col-lg-4 col-md-4 col-sm-4 col-xs-4 pad-none"><label
											class="control-label bold-500">Choose Username</label></td>
										<td class="pad-none"><input type="text"
											name="regusername" class="form-control  btm-pad-10"
											id="inputRegUserName" placeholder="Username"> <span
											id="errRegUser" class="text-red"> </span></td>
									</tr>
									<tr>
										<td class="pad-none"><label
											class="control-label bold-500">Choose Password</label></td>
										<td class="pad-none"><input type="password"
											name="regpassword" class="form-control  btm-pad-10"
											id="inputRegPass" placeholder="Password"> <span
											id="errRegPass" class="text-red"> </span></td>
									</tr>
									<tr>
										<td class="pad-none"><label
											class="control-label bold-500">Confirm password</label></td>
										<td class="pad-none"><input type="password"
											class="form-control  btm-pad-10" id="inputRegCPass"
											placeholder="Confirm password"> <span
											id="errRegCPass" class="text-red"> </span></td>
									</tr>
								</tbody>
							</table>
						</div>
						<%
							}
						%>
						
					
						
						<!-- Dynamic Loops -->
						<div class="col-xs-12 col-sm-12 col-md-12 pad-15 insure-travel">
							<input type="hidden" name="totalAdultTraveller"
								id="totalAdultTraveler"
								value="${travelQuote.getTotalAdultTraveller()}">
							<c:forEach var="inx" begin="1"
								end="${travelQuote.getTotalAdultTraveller()}">
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
											<!-- <label class="pad-left1 bold-500">HKID</label> -->
											<select id="selectAdHkidPass${inx}" class="soflow" name="selectedAdHkidPass">
									<option value="HKID" selected="selected">HKID</option>
									<option value="passport">Passport</option>
									</select> <input
												id="txtInsuHkid${inx}" name="adultHKID"
												class="form-control textUpper" placeholder="X1234567"
												value="" /> <span id="errtxtInsuHkid${inx}"
												class="text-red"> </span> <span
												id="errtxtInvalidInsuHkid${inx}" class="text-red"> </span>
										</div>
									</div>
									<div class="row top-mrg-10">
										<div class="col-xs-6 col-md-6">
											<label class="bold-500">Age Range</label>
											 <select name="adultAgeRange" class="soflow" id="selectAgeRange${inx}">
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
<%request.setAttribute("mapRelationshipCode","${relationshipCodeList.key}"); %>
										<div id="adultsbenificiaryId${inx}" class="hide">
											<div class="col-xs-6 col-md-6">
												<label class="bold-500">Full Name</label> <input type="text"
													name="adultBenificiaryFullName"
													id="adultBenefitiaryId${inx}" value=""
													class="form-control " placeholder="As appears on HKID Card"
													onblur="replaceAlpha(this);"
													onkeypress="    return alphaOnly(event);" maxlength="100" />
												<span id="erradultBenefitiaryId${inx}" class="text-red">
												</span>
											</div>
											<div class="col-xs-6 col-md-6">
												<!-- <label class="pad-left1 bold-500">HKID</label> -->
												<select id="selectAdBenefitiaryHkidPass${inx}" class="form-control soflow" name="selectedAdBenefitiaryHkidPass">
									<option value="hkId" selected="selected">HKID</option>
									<option value="passport">Passport</option>
									</select> <input
													id="adultBenefitiaryHKId${inx}" name="adultBenificiaryHkid"
													class="form-control textUpper" placeholder="X1234567"
													value="" /> <span id="erradultBenefitiaryHKId${inx}"
													class="text-red"> </span><span id="errInvalidadultBenefitiaryHKId${inx}"
													class="text-red"> </span>
											</div>
										</div>
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
									<h4 class="color1">
										Child Traveller
										<c:out value="${inx}"></c:out>
									</h4>
									<div class="row ">
										<div class="col-xs-6 col-md-6">
											<label class="bold-500">Full Name</label> <input type="text"
												name="childName" id="txtChldFullName${inx}" value=""
												class="form-control " placeholder="As appears on HKID Card"
												onblur="replaceAlpha(this);"
												onkeypress="    return alphaOnly(event);" maxlength="100" />
											<span id="errtxtChldFullName${inx}" class="text-red">
											</span>
										</div>
										<div class="col-xs-6 col-md-6">
											<!-- <label class="pad-left1 bold-500">HKID</label> -->
											<select id="selectChldHkidPass${inx}" class="form-control soflow" name="selectedChldHkidPass">
									<option value="hkId" selected="selected">HKID</option>
									<option value="passport">Passport</option>
									</select> <input
												id="txtChldInsuHkid${inx}" name="childHKID"
												class="form-control textUpper" placeholder="X1234567"
												value="" /> <span id="errtxtChldInsuHkid${inx}"
												class="text-red"> </span><span
												id="errtxtChldInvalidInsuHkid${inx}" class="text-red"> </span>
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
												<!-- <label class="pad-left1 bold-500">HKID</label>  -->
												<select id="selectChldBenefitiaryHkidPass${inx}" class="form-control soflow" name="selectedChldBenefitiaryHkidPass">
									<option value="hkId" selected="selected">HKID</option>
									<option value="passport">Passport</option>
									</select><input
													id="txtchildInsuHkid${inx}" name="childBenificiaryHkid"
													class="form-control textUpper" placeholder="X1234567"
													value="" /> <span id="errtxtchildInsuHkid${inx}"
													class="text-red"> </span><span id="errtxtInvalidchildInsuHkid${inx}"
													class="text-red"> </span>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>


							<input type="hidden" name="totalOtherTraveller"
								id="totalCountOther"
								value="${travelQuote.getTotalOtherTraveller()}">

							<c:forEach var="inx" begin="1"
								end="${travelQuote.getTotalOtherTraveller()}">
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
										
										
										
										
										
										<div class="pad-none">
										<div class="col-md-10 col-lg-10 pad-none">
											<!-- <label class="pad-left1 bold-500">HKID</label> -->
											<select id="selectOtHkidPass${inx}" class="form-control soflow" name="selectedOtHkidPass">
									<option value="hkId" selected="selected">HKID</option>
									<option value="passport">Passport</option>
									</select> <input
												id="txtOtherInsuHkid${inx}" name="otherHKID"
												class="form-control textUpper" placeholder="X1234567"
												value="" /> <span id="errtxtOtherInsuHkid${inx}"
												class="text-red"> </span><span
												id="errtxtOtherInvalidInsuHkid${inx}" class="text-red"> </span>
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
												<!-- <label class="pad-left1 bold-500">HKID</label> -->
												<select id="selectOtherBenefitiaryHkidPass${inx}" class="form-control soflow" name="selectedOtherBenefitiaryHkidPass">
									<option value="hkId" selected="selected">HKID</option>
									<option value="passport">Passport</option>
									</select> <input
													id="txtOtherBenInsuHkid${inx}" name="otherBenificiaryHkid"
													class="form-control textUpper" placeholder="X1234567"
													value="" /> <span id="errtxtOtherBenInsuHkid${inx}"
													class="text-red"> </span>
													<span id="errtxtOtherInvalidBenInsuHkid${inx}"
													class="text-red"> </span>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
							<!--Till this Line  -->

						</div>

<div class="clearfix"></div>
						<div class="spacer3"></div>
						<h4 class="h4-2 padding3">Declaration:-</h4>
						<div class="declaration-content">
							<div class="checkbox">
								<input name="checkbox1" id="checkbox1" type="checkbox">
								<label for="checkbox1"> I have read and understand the policy provisions and hereby declare that:-
								 <br>
									i. <span class="margin-left-2"></span> The particulars and statements given above are, to the best of my knowledge and belief, true and complete; <br> 
									ii. <span class="margin-left-2"></span> To the best of my knowledge and belief no Insured Person is travelling contrary to the advice of any medical practitioner or for the purpose of obtaining medical treatment and that I understand that treatment of any pre-existing, recurring or congenital medical conditions are not insured. I am not aware of any condition cause or circumstance that may necessitate the cancellation or curtailment of the journey as planned; and  <br>
									iii. <span class="margin-left-2"></span>This application shall be the basis of the contract between me and FWD.
							     	iv. <span class="margin-left-2"></span>This Proposal Form is applied and signed at HKSAR, in case of fraud or factual misrepresentation, the cover for me or for the Insured Person(s) may be invalidated.
								    v. <span class="margin-left-2"></span>I have obtained the consent from the Insured Person(s) for passing the above information to FWD General Insurance Company Limited for the purpose of carrying out the TravelCare Insurance.
									<br/>
								
									I have read and understood <a href="<%=request.getContextPath() %>/resources/policy-provisions-pdf/TravelCare_Provisions_Mar_2015.pdf"
									class="sub-link" target="_blank">Personal Information Collection Statement</a> and agree to be bound by the same.
										<br>
										
								</label>
							</div>
							<span id="chk2" class="text-red"></span>
							<hr/>
							<div>
								If you do NOT wish The Company to use Your Personal Data in direct marketing or provide Your Personal Data to other persons or companies for their use in direct marketing, please tick the appropriate box(es) below to exercise
							</div>
							<div class="checkbox">
								<input id="checkbox2" type="checkbox"> <label
									for="checkbox2">Please do not send direct marketing information to me.<br>
								</label>
							</div>
							<div class="checkbox">
								<input id="checkbox3" type="checkbox"> <label
									for="checkbox3"> Please do not provide my personal data to other persons or companies for their use in direct marketing. <br> <br>
								</label>
							</div>
							<!-- <div class="checkbox">
								<input id="checkbox5" type="checkbox"> <label
									for="checkbox5"> I have obtained the consent from the
									Insured Traveller(s) for passing the above information to FWD
									General Insurance Company Limited for the purpose of carrying
									out the TravelCare Travel Insurance. <br> <br>
								</label>
							</div> -->
						</div>
					</div>

						
					<div
						class="col-lg-5 col-md-5 col-sm-12 col-xs-12 gray-bg pad-none wht-bg3">
						<!--mob-hidden-->
						<div class="hidden-sm hidden-xs">
							<div class="wd2">
								<div class="pull-left">
									<h2 class="h2-3-choose">TravelCare</h2>
									<h4>${planName}-Summary</h4>
									<input type="hidden" name="selectedPlanName" value="${planName }">
								</div>
								<div class="pull-right">
									<div class="text-left pad-right1 h2-2 h2">
										<div class="hk">
											HK$
											<div class="flightcare-hk">${planSummary}</div>
										</div>
									</div>
								</div>
							</div>
							<div class="clearfix"></div>
							<div class="orange-bdr"></div>
							<div class="form-container">
								<h3 class="txt-bold">
									Departure date<a href="<%=request.getContextPath()%>"> <span
										class="span2 uline">Change</span></a>
								</h3>
								<h4>${travelQuote.getTrLeavingDate()}</h4>
								<input type="hidden" name="departureDate" id="departureDate"
									value="${travelQuote.getTrLeavingDate()}">
								<h3 class="txt-bold">
									Return date<a href="<%=request.getContextPath()%>"> <span
										class="span2 uline">Change</span></a>
								</h3>
								<h4>${travelQuote.getTrBackDate()}</h4>
								<input type="hidden" name="backDate" id="backDate"
									value="${travelQuote.getTrBackDate()}">
								<h3 class="txt-bold">
									Travellers <a href="<%=request.getContextPath()%>"><span
										class="span2 uline">Change</span></a>
								</h3>
								<h4>
								<c:if test="${  travelQuote.getTotalPersonalTraveller()!=0}"> Travellers ${travelQuote.getTotalPersonalTraveller()}
								 </c:if>
									<c:if test="${  travelQuote.getTotalAdultTraveller()!=0}"> Parent ${travelQuote.getTotalAdultTraveller()}
										</c:if>
									<c:if test="${ travelQuote.getTotalChildTraveller()!=0}"> ,Child	${travelQuote.getTotalChildTraveller()}
								  
								</c:if>
									<c:if test="${  travelQuote.getTotalOtherTraveller()!=0}"> ,Others	${travelQuote.getTotalOtherTraveller()}
								 </c:if>
								</h4>
								<br>
								<h3 class="txt-bold">
									No of days :<span>${travelQuote.getTotalTravellingDays()}</span>
									<input type="hidden" name="totalTrDays" id="totalTrDays"
										value="${travelQuote.getTotalTravellingDays()}">
								</h3>
								<input type="hidden" name="planSelected" value="${travelQuote.getPlanSelected()}">
								<!-- <div class="form-group">
									<div class="input-group">
										<input type="text" class="form-control placeholder-fl"
											value="eg.FWD789" readonly placeholder="eg.FWD789"> <span
											class="input-group-addon in black-bold"><span>APPLY</span></span>
									</div>
								</div> -->
								<!-- <div class="travel-italic">
									<a href="#" class="sub-link" data-toggle="modal"
										data-target=".bs-promo-modal-lg"><i> How do I get a
											promotion code? </i></a>
								</div>

 -->

								<br>
							</div>
							<h3 class="h4-1-orange-b col-lg-6 col-md-6">Subtotal</h3>
							<h3 class="h4-1-orange-b col-lg-6 col-md-6 text-right">${planSummary}</h3>
							<h3 class="h4-1-orange-b col-lg-6 col-md-6">Discount</h3>
							<h3 class="h4-1-orange-b col-lg-6 col-md-6 text-right">-0</h3>
							<div class="clearfix"></div>
							<div class="orange-bdr"></div>
							<h3 class="h4-1-orange-b col-lg-6 col-md-6">Amount due</h3>
							<h3 class="h4-1-orange-b col-lg-6 col-md-6 text-right">${planSummary}
							</h3>
							<input type="hidden" name="finalDueAmount" value="${planSummary}">
						</div>

						<!--mob-hidden-->
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pull-left">
							<a href="<%=request.getContextPath()%>"
								class="bdr-curve btn btn-primary bck-btn">Back </a>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pull-right">
							<input type="submit"
								class="bdr-curve-none btn btn-primary nxt-btn " value="Next" />
						</div>
						<div class="clearfix"></div>

						<br>
					</div>
					<div class="clearfix"></div>
				</div>
				
				<p class="padding1 hidden-sm hidden-xs">
					The features above are indicative only. Please refer to the <a
						class="sub-link"
						href="policy-provisions-pdf/FlightCare_Provisions_Mar_2015.pdf"
						target="_blank">Policy Provisions</a> for details.<br> For a
					complete explanation of the terms and conditions. Please contact
					your adviser or our customer service at 3123 3123 for more details.
				</p>
			</form:form>
		</div>
		<!--/.row-->
	</div>
	<!--/.container-->
</section>
<!--/end- Main Content-->




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




<!--Get promotion code popup-->
<div class="modal fade bs-promo-modal-lg " tabindex="-1" role="dialog"
	aria-hidden="true" style="display: none;">
	<div class="modal-dialog modal-lg">
		<div class="modal-content plan-modal">
			<div class="login-form" id="sendmailofpromocode">
				<form>
					<div class="form-container">
						<h2>Don't have a promotion code? Enter your email address and
							we'll send you one.</h2>
						<h4>Email</h4>
						<div class="form-group">
							<input type="text" class="form-control" placeholder=""
								name="emailToSendPromoCode" id="txtPromoEmail">
						</div>
						<span id="errPromoEmail" class="text-red"></span> <br>
						<div class="row">
							<div class="col-lg-6 col-md-6">
								<a class="bdr-curve btn btn-primary btn-lg wd5" href="#"
									onclick="return sendEmail()">Submit</a>
							</div>
							<div class="col-md-2">
								<br>
							</div>
							<div class="col-lg-4 col-md-4">
								<!-- <a class="bdr-curve btn btn-primary btn-lg promo-pop-close wd5" href="#" data-dismiss="modal">Close </a>  -->
							</div>
							<br> <br>
							<div class="col-lg-12 col-md-12">
								<p>By submitting my email address I agree to receive FWD's
									promotion code and other offers in the future.</p>
							</div>
						</div>
					</div>
				</form>
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

	function sendEmail() {
		if (get_promo_val()) {
			$.ajax({
				type : "POST",
				url : "sendEmail",
				data : $("#sendmailofpromocode form").serialize(),
				async : false,
				success : function(data) {
					if (data == 'success') {
					} else {

					}

				},
				error : function() {
				}
			});
		}
		return false;
	}
</script>
