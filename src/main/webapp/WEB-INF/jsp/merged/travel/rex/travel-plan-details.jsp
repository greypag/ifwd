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
	<div id="cn" class="container">
		<div class="row">
		
			<form:form name="frmYourDetails" id="frmYourDetails"
				action="prepareUserSummary" method="post"
				onsubmit="return tPlanValid();" modelAttribute="frmYourDetails">
				<ol class="breadcrumb pad-none">
					<li><a href="#">##travel.breadcrumb1.item1@@</a> <i class="fa fa-caret-right"></i></li>
					<li><a href="#">##travel.breadcrumb1.item2@@ </a> <i class="fa fa-caret-right"></i></li>
					<li><a href="#">##travel.breadcrumb1.item3@@</a></li>
					<li class="active "><i class="fa fa-caret-right"></i> ##travel.breadcrumb1.item4@@</li>
				</ol>
				<div class="container ">
					<div class="col-md-12 shop-tracking-status">
						<div class="center wow fadeInDown animated"
							style="visibility: visible;">
							<h2>##travel.quote.jumbo@@</h2>
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
										<span class="status color3">##travel.breadcrumb2.item1@@</span>
										<div class="icon">1</div>
									</div>

									<div
										class="image-order-status image-order-status-intransit  img-circle act second">
										<span class="status color2">##travel.breadcrumb2.item2@@</span>
										<div class="icon">2</div>
									</div>
									<div
										class="image-order-status image-order-status-delivered  img-circle disabled third">
										<span class="status">##travel.breadcrumb2.item3@@</span>
										<div class="icon">3</div>
									</div>
									<div
										class="image-order-status image-order-status-completed  img-circle disabled fourth">
										<span class="status lst-status">##travel.breadcrumb2.item4@@</span>
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
						<h3 class="margin-left-2 h2-3-existing-fwd-head">##travel.details.login@@</h3>

						<a href="#"
							class="col-lg-5 col-md-5 col-sm-5 col-xs-5 btn-box-2 margin-left-2 color4"
							data-toggle="modal" data-target=".bs-example-modal-lg">##travel.details.login.action@@</a>
						<div class="col-lg-6 col-md-6 col-xs-6 col-sm-6 text-left">
							<h3 class="text-left or-continue">
								##travel.details.login.other.part1@@
								##travel.details.login.other.part2@@
							</h3>
						</div>
						<div class="clearfix"></div>
						<%
							}
						%>


						<div class="gray-bdr"></div>
						<table class="table activation-form margin-left-2">
							<tbody>
								<tr>
									<td colspan="2" class="pad-none">
										<h3 class="black-bold pad-none">##travel.details.applicant.heading@@</h3>
									</td>
								</tr>
								<tr>
									<td class="col-lg-4 col-md-4 col-sm-4 col-xs-4  pad-none">
										<label for="inputFullName" class="control-label bold-500">
											##travel.details.applicant.name@@
										</label>
									</td>
									<td class="pad-none"><input type="text" name="fullName"
										class="form-control" id="inputFullName"
										value="${userDetails.getFullName()}"
										placeholder="與香港身份證號碼/護照號碼相同" onblur="replaceAlpha(this);"
										onkeypress="return alphaOnly(event);" maxlength="100" />
									<span id="fullnameinvalid" class="text-red">
									</span></td>
								</tr>
								<tr>
									<td class="pad-none vtop">
										<select id="selectHkidPass" class="form-control soflow" name="selectedHkidPassApplicant">
											<option selected="selected">##travel.details.applicant.hkid.option1@@</option>
											<option>##travel.details.applicant.hkid.option2@@</option>
										</select>
									</td>
									<td class="pad-none">
								
									
									<input type="text" name="hkid"
										class="form-control numberinput btm-pad-10"
										id="inputTxtAppHkid" placeholder="X1234567/護照號碼"> <span
										id="errAppHkid" class="text-red" ></span></td>
								</tr>
								<tr>
									<td class="pad-none"><label for="inputMobileNo"
										class="control-label bold-500">##travel.details.applicant.mobile@@</label></td>
									<td class="pad-none"><input name="mobileNo" type="text"
										class="form-control" value="${userDetails.getMobileNo().trim()}"
										id="inputMobileNo" placeholder="手機號碼"
										onkeypress="return isNumeric(event)"
										onblur="replaceNumeric(this);" maxlength="8" /> <span
										id="mobileNo" class="text-red">
									</span></td>
								</tr>
								<tr>
									<td class="pad-none"><label for="inputEmailId"
										class="control-label bold-500">##travel.details.applicant.email@@</label></td>
									<td class="pad-none"><input class="form-control" name="emailAddress"
										value="${userDetails.getEmailAddress().trim()}" id="inputEmailId"
										placeholder="電郵地址" maxlength="50"> <span id="emailid" class="text-red"></span></td>
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
										<td colspan="2" class="pad-none"><h3 class="pad-none">##travel.details.registration.heading@@</h3>
											<i>##travel.details.registration.desc@@</i> <br></td>
									</tr>
									<tr>
										<td colspan="2" class="pad-none">&nbsp;</td>
									</tr>
									<tr>
										<td class="col-lg-4 col-md-4 col-sm-4 col-xs-4 pad-none"><label
											class="control-label bold-500">##travel.details.registration.username@@</label></td>
										<td class="pad-none"><input type="text"
											name="regusername" class="form-control btm-pad-10"
											id="inputRegUserName" placeholder="用戶名稱"><span
											id="errRegUser" class="text-red"> </span></td>
									</tr>
									<tr>
										<td class="pad-none"><label
											class="control-label bold-500">##travel.details.registration.password@@</label></td>
										<td class="pad-none"><input type="password"
											name="regpassword" class="form-control btm-pad-10"
											id="inputRegPass" placeholder="個人密碼"> <span
											id="errRegPass" class="text-red"> </span></td>
									</tr>
									<tr>
										<td class="pad-none"><label
											class="control-label bold-500">##travel.details.registration.confirmPassword@@</label></td>
										<td class="pad-none"><input type="password"
											class="form-control btm-pad-10" id="inputRegCPass"
											placeholder="確認密碼"> <span id="errRegCPass"
											class="text-red"> </span></td>
									</tr>
								</tbody>
							</table>
						</div>
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
												##travel.details.insured.label.family.parent@@ 
												</c:when>
													<c:when test="${totalAdultCount != 2}">
												##travel.details.insured.label.personal@@ <c:out value="${inx-1}"></c:out>
													</c:when>
												</c:choose>
											</c:when>
											<c:when test="${inx == 1}">
											##travel.details.insured.label.personal@@ 
										</c:when>	
										</c:choose>
									</h4>
									
									
									<div class="row ">
										<div class="col-xs-6 col-md-6">
											<label class="bold-500">##travel.details.insured.beneficiary.name@@</label> <input type="text"
												id="txtAdFullName${inx}" name="adultName" value=""
												class="form-control" placeholder="與香港身份證號碼/護照號碼相同"
												onblur="replaceAlpha(this);"
												onkeypress="    return alphaOnly(event);" maxlength="100" />
											<span id="errtxtAdFullName${inx}" class="text-red"></span>
										</div>
										<div class="col-xs-6 col-md-6">
											<!-- <label class="pad-left1 bold-500">HKID</label> -->









											<select id="selectAdHkidPass${inx}" class="form-control soflow" name="selectedAdHkidPass">
									<option value="hkId" selected="selected">##travel.details.insured.hkid.option1@@</option>

									<option>##travel.details.insured.hkid.option2@@</option>
									</select> <input
												id="txtInsuHkid${inx}" name="adultHKID"
												class="form-control textUpper" placeholder="X1234567/護照號碼"
												value="" /> <span id="errtxtInsuHkid${inx}"
												class="text-red"> </span> <span
												id="errtxtInvalidInsuHkid${inx}" class="text-red"> </span>
										</div>
									</div>
									
									
									<div class="row top-mrg-10">
										<div class="col-xs-6 col-md-6">
											<label class="bold-500">travel.details.insured.age</label> <select
												name="adultAgeRange" id="selectAgeRange${inx}"
												class="form-control soflow">
												<option value="0">請選擇</option>
												<c:forEach var="ageList" items="${mapAgeType}">
													<option value="${ageList.key}"><c:out
															value="${ageList.value}" /></option>
												</c:forEach>
											</select> <span id="errselectAgeRange${inx}" class="text-red"></span>
										</div>
										
										
										<div class="col-xs-6 col-md-6">
											<label class="pad-left1 bold-500">##travel.details.insured.beneficiary@@</label> <select
												id="adultsselectBenificiary${inx}"
												onchange="activeDiv('adultsbenificiaryId${inx}','adultsselectBenificiary${inx}')"
												name="adultBeneficiary" class="soflow">
												<option value="SE">個人遺產</option>
												<c:forEach var="relationshipCodeList" items="${mapRelationshipCode}">
													<option value="${relationshipCodeList.key}"><c:out
															value="${relationshipCodeList.value}" /></option>
												</c:forEach>
											</select> <span id="erradultsselectBenificiary${inx}" class="text-red">
											</span>
										</div>
										<!-- Adult hide box -->
										<div id="adultsbenificiaryId${inx}" class="hide">
											<div class="col-xs-6 col-md-6">
												<label class="bold-500">##travel.details.insured.beneficiary.name@@</label> <input type="text"
													name="adultBenificiaryFullName"
													id="adultBenefitiaryId${inx}" value=""
													class="form-control " placeholder="英文全名（與香港身份證號碼/護照號碼相同）"
													onblur="replaceAlpha(this);"
													onkeypress="    return alphaOnly(event);" maxlength="100" />
												<span id="erradultBenefitiaryId${inx}" class="text-red">
												</span>
											</div>
											<div class="col-xs-6 col-md-6">
												<!-- <label class="pad-left1 bold-500">HKID</label> -->
												<select id="selectAdBenefitiaryHkidPass${inx}" class="form-control soflow" name="selectedAdBenefitiaryHkidPass">
									<option value="hkId" selected="selected">##travel.details.insured.beneficiary.hkid.option1@@</option>

									<option>##travel.details.insured.beneficiary.hkid.option2@@</option>
									</select> <input
													id="adultBenefitiaryHKId${inx}" name="adultBenificiaryHkid"
													class="form-control textUpper" placeholder="X1234567/護照號碼"
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
										子女
										<c:out value="${inx}"></c:out>
									</h4>
									<div class="row ">
										<div class="col-xs-6 col-md-6">
											<label class="bold-500">##travel.details.insured.beneficiary.name@@</label> <input type="text"
												name="childName" id="txtChldFullName${inx}" value=""
												class="form-control " placeholder="與香港身份證號碼/護照號碼相同"
												onblur="replaceAlpha(this);"
												onkeypress="    return alphaOnly(event);" maxlength="100" />
											<span id="errtxtChldFullName${inx}" class="text-red"></span>
										</div>
										<div class="col-xs-6 col-md-6">
											<!-- <label class="pad-left1 bold-500">HKID</label> -->
											<select id="selectChldHkidPass${inx}" class="form-control soflow" name="selectedChldHkidPass">
									<option value="hkId" selected="selected">##travel.details.insured.beneficiary.hkid.option1@@</option>

									<option>##travel.details.insured.beneficiary.hkid.option2@@</option>
									</select> <input
												id="txtChldInsuHkid${inx}" name="childHKID"
												class="form-control textUpper" placeholder="X1234567/護照號碼"
												value="" /> <span id="errtxtChldInsuHkid${inx}"
												class="text-red"> </span><span
												id="errtxtChldInvalidInsuHkid${inx}" class="text-red"> </span>
										</div>
										
									</div>
									<div class="row top-mrg-10">
										<div class="col-xs-6 col-md-6">
											<label class="bold-500">##travel.details.insured.age@@</label> <select
												name="childAgeRange" id="selectchildAgeRange${inx}"
												class="soflow">
												<option value="0">請選擇</option>
												<c:forEach var="ageList" items="${mapAgeType}">
													<option value="${ageList.key}"><c:out
															value="${ageList.value}" /></option>
												</c:forEach>
											</select> <span id="errchildRange${inx}" class="text-red"></span>
										</div>
										<div class="col-xs-6 col-md-6">
											<label class="pad-left1 bold-500">##travel.details.insured.beneficiary@@</label> <select
												id="childselectBenificiary${inx}" name="childBeneficiary"
												onchange="activeDiv('childbenificiaryId${inx}','childselectBenificiary${inx}')"
												class="soflow">
												<option value="SE">個人遺產</option>
												<c:forEach var="relationshipCodeList" items="${mapRelationshipCode}">
													<option value="${relationshipCodeList.key}"><c:out
															value="${relationshipCodeList.value}" /></option>
												</c:forEach>
											</select> <span id="errselectChildbenificiary${inx}" class="text-red"></span>
										</div>

										<!--Child hide panel-->
										<div id="childbenificiaryId${inx}" class="hide">
											<div class="col-xs-6 col-md-6">
												<label class="bold-500">##travel.details.insured.beneficiary.name@@</label> <input type="text"
													name="childBenificiaryFullName"
													id="childBenefitiaryName${inx}" value=""
													class="form-control " placeholder="英文全名（與香港身份證號碼/護照號碼相同）"
													onblur="replaceAlpha(this);"
													onkeypress="    return alphaOnly(event);" maxlength="100" />
												<span id="errchildBenefitiaryName${inx}" class="text-red"></span>
											</div>
											<div class="col-xs-6 col-md-6">
												<!-- <label class="pad-left1 bold-500">HKID</label>  -->
												<select id="selectChldBenefitiaryHkidPass${inx}" class="form-control soflow" name="selectedChldBenefitiaryHkidPass">
									<option  selected="selected">##travel.details.insured.beneficiary.hkid.option1@@</option>
									<option>##travel.details.insured.beneficiary.hkid.option2@@</option>
									</select><input
													id="txtchildInsuHkid${inx}" name="childBenificiaryHkid"
													class="form-control textUpper" placeholder="X1234567/護照號碼"
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
										##travel.details.insured.label.family.others@@
										<c:out value="${inx}"></c:out>
									</h4>
									<div class="row ">
										<div class="col-xs-6 col-md-6">
											<label class="bold-500">##travel.details.insured.name@@</label> <input type="text"
												name="otherName" id="txtOtherFullName${inx}" value=""
												class="form-control " placeholder="英文全名（與香港身份證號碼/護照號碼相同）"
												onblur="replaceAlpha(this);"
												onkeypress="    return alphaOnly(event);" maxlength="100" />
											<span id="errtxtOtherFullName${inx}" class="text-red"></span>
										</div>
										<div class="col-xs-6 col-md-6">
											<!-- <label class="pad-left1 bold-500">HKID</label> -->
											<select id="selectOtHkidPass${inx}" class="form-control soflow" name="selectedOtHkidPass">
									<option selected="selected">##travel.details.insured.hkid.option1@@</option>
									<option>##travel.details.insured.hkid.option2@@</option>
									</select> <input
												id="txtOtherInsuHkid${inx}" name="otherHKID"
												class="form-control textUpper" placeholder="X1234567/護照號碼"
												value="" /> <span id="errtxtOtherInsuHkid${inx}"
												class="text-red"> </span><span
												id="errtxtOtherInvalidInsuHkid${inx}" class="text-red"> </span>
										</div>
									</div>
									<div class="row top-mrg-10">
										<div class="col-xs-6 col-md-6">
											<label class="bold-500">##travel.details.insured.age@@</label> <select
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
											<label class="pad-left1 bold-500">##travel.details.insured.beneficiary@@</label> <select
												id="otherSelectBenificiary${inx}" name="otherBeneficiary"
												onchange="activeDiv('otherbenificiaryId${inx}','otherSelectBenificiary${inx}')"
												class="form-control soflow">
												<option value="SE">個人遺產</option>
												<c:forEach var="relationshipCodeList" items="${mapRelationshipCode}">
													<option value="${relationshipCodeList.key}"><c:out
															value="${relationshipCodeList.value}" /></option>
												</c:forEach>
											</select> <span id="benificiary" style="display: none"> <label
												class="text-red">受益人是空白</label>
											</span>
										</div>

										<!--Other traveller  hide panel-->
										<div id="otherbenificiaryId${inx}" class="hide">
											<div class="col-xs-6 col-md-6">
												<label class="bold-500">##travel.details.insured.beneficiary.name@@</label> <input type="text"
													name="otherBenificiaryFullName"
													id="otherBenefitiaryName${inx}" value=""
													class="form-control " placeholder="英文全名（與香港身份證號碼/護照號碼相同）"
													onblur="replaceAlpha(this);"
													onkeypress="    return alphaOnly(event);" maxlength="100" />
												<span id="errotherBenefitiaryName${inx}" class="text-red"></span>
											</div>
											<div class="col-xs-6 col-md-6">
												<!-- <label class="pad-left1 bold-500">HKID</label> -->
												<select id="selectOtherBenefitiaryHkidPass${inx}" class="form-control soflow" name="selectedOtherBenefitiaryHkidPass">
									<option selected="selected">##travel.details.insured.beneficiary.hkid.option1@@</option>
									<option>##travel.details.insured.beneficiary.hkid.option2@@</option>
									</select> <input
													id="txtOtherBenInsuHkid${inx}" name="otherBenificiaryHkid"
													class="form-control textUpper" placeholder="X1234567/護照號碼"
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
							<h4 class="h4-2 padding3">##travel.details.declarations.heading@@</h4>
							<div class="declaration-content">
								<div class="checkbox">
									<input id="checkbox1" type="checkbox"> 
									<label for="checkbox1"> 
										##travel.details.declarations.tnc@@<br> 
										i. <span class="margin-left-2"></span>##travel.details.declarations.tnc.desc1@@<br>
										ii. <span class="margin-left-2"></span>##travel.details.declarations.tnc.desc2@@<br>
										iii. <span class="margin-left-2"></span>##travel.details.declarations.tnc.desc3@@<br/>
										iv. <span class="margin-left-2"></span>##travel.details.declarations.tnc.desc4@@<br/>
										v. <span class="margin-left-2"></span>##travel.details.declarations.tnc.desc5@@<br/>
									</label>
								</div>	
								<span id="chk1" class="text-red"></span>		
										
									<br/>
								<div class="checkbox">
									<input id="checkbox2" type="checkbox"> <label
										for="checkbox2">
										##travel.details.declarations.PICS.part1@@ <a
										href="https://home.fwd.com.hk/giphw/FWD_Resources/GI_Personal%20Data%20Protection%20Policy%20and%20Practices.pdf"
										class="sub-link" target="_blank">##travel.details.declarations.PICS.part2@@</a>##travel.details.declarations.PICS.part3@@
										


										</label>
								</div>
								<span id="chk2" class="text-red"></span>
								<hr/>
								<div>
									<label>
 										##travel.details.declarations.PDPO@@ <br>
									</label>
								</div>
								 <div class="checkbox">
									<input id="checkbox3" type="checkbox"> <label

										for="checkbox3"> ##travel.details.declarations.PDPO.option1@@<br>
										<br>
									</label>
								</div>
								<div class="checkbox">
									<input id="checkbox4" type="checkbox"> <label
										for="checkbox4">

										##travel.details.declarations.PDPO.option2@@<br>
										<br>
									</label>
								</div>

							</div>
						</div>
					


					<div
						class="col-lg-5 col-md-5 col-sm-12 col-xs-12  gray-bg pad-none wht-bg3">

						<div class="hidden-sm hidden-xs">

							<div class="wd2">
								<div class="pull-left">
									<h2 class="h2-3-choose">##travel.sidebar.summary.product@@</h2>
									<h4>
										##travel.sidebar.summary.desc.part1@@
										${planName}
										##travel.sidebar.summary.desc.part2@@
									</h4>
									<input type="hidden" name="selectedPlanName" value="${planName }">
								</div>
								<div class="pull-right">
									<div class="text-left pad-right1 h2-2 h2">
										<div class="hk">
											##travel.dollar@@
											<div class="flightcare-hk">${planSummary}</div>
										</div>
									</div>
								</div>
							</div>
							<div class="clearfix"></div>
							<div class="orange-bdr"></div>
							<div class="form-container">
								<h3 class="txt-bold">
									##travel.sidebar.summary.option1@@ <a href="travel"> <span
										class="span2 uline">##travel.action.change@@</span></a>
								</h3>
								<h4>${travelQuote.getTrLeavingDate()}</h4>
								<input type="hidden" name="departureDate" id="departureDate"
									value="01-01-2015">

								<h3 class="txt-bold">
									##travel.sidebar.summary.option2@@ <a href="<%=request.getContextPath()%>"><span
										class="span2 uline">##travel.action.change@@</span></a>
								</h3>
								<h4>${travelQuote.getTrBackDate()}</h4>
								<input type="hidden" name="backDate" id="backDate"
									value="${travelQuote.getTrBackDate()}">

								<h3 class="txt-bold">
									##travel.sidebar.summary.option3@@ <a href="travel"> <span
										class="span2 uline">##travel.action.change@@</span></a>
								</h3>
								<h4>
									<c:if test="${ travelQuote.getTotalAdultTraveller()!=0}">
									##travel.sidebar.summary.label.family.parent@@ ${travelQuote.getTotalAdultTraveller()+travelQuote.getTotalPersonalTraveller()}</c:if>
									<c:if test="${ travelQuote.getTotalChildTraveller()!=0}"><br>
									##travel.sidebar.summary.label.family.child@@ ${travelQuote.getTotalChildTraveller()}</c:if>
			                     	<c:if test="${ travelQuote.getTotalOtherTraveller()!=0}"><br>
			                     	##travel.sidebar.summary.label.family.others@@ ${travelQuote.getTotalOtherTraveller()}</c:if>
		                            <c:if test="${planDetailsForm.getTravellerCount()!=0}">
		                            ##travel.sidebar.summary.label.personal@@ ${planDetailsForm.getTravellerCount()}</c:if>
								</h4>
								
								<input type="hidden" name="planSelected" value="${travelQuote.getPlanSelected()}">
								<h3 class="txt-bold">
									##travel.sidebar.summary.option4@@ <span>${travelQuote.getTotalTravellingDays()} 天</span>
								</h3>
								<h3>##travel.sidebar.summary.promocode@@</h3>
								<!-- <div class="form-group">
									<span class="input-group-addon in black-bold"><span>使用</span></span>
              		<input type="text" class="form-control placeholder-fl" value="eg.FWD789" readonly placeholder="eg.FWD789">
					

              </div>
              <div class="travel-italic">
                <a href="#" class="sub-link"  data-toggle="modal" data-target=".bs-promo-modal-lg"><i> 如何取得優惠代碼？</i> </a>
              </div> -->
            </div>
		            <h3 class="h4-1-orange-b col-lg-6 col-md-6">##travel.sidebar.summary.subtotal@@ </h3>
		            <h3 class="h4-1-orange-b col-lg-6 col-md-6 text-right">${planSummary}</h3>
		            <h3 class="h4-1-orange-b col-lg-6 col-md-6">##travel.sidebar.summary.discount@@ </h3>
		            <h3 class="h4-1-orange-b col-lg-6 col-md-6 text-right">${planDiscount} </h3>
		            <div class="clearfix"></div>
		            <div class="orange-bdr"></div>
		            <h3 class="h4-1-orange-b col-lg-6 col-md-6">##travel.sidebar.summary.amountDue@@ </h3>
		            <h3 class="h4-1-orange-b col-lg-6 col-md-6 text-right">${planSummary}</h3>
		            <input type="hidden" name="finalDueAmount" value="${planSummary}">
            
            </div>
            
            <!--mob-->
<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pull-left">
	 <a href="#" onclick="BackMe();" class="bdr-curve btn btn-primary bck-btn">##travel.action.back@@ </a>
</div>
<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pull-right"> 
	<input type="submit" class="bdr-curve-none btn btn-primary btn-next" value=" ##travel.action.next@@" />
<!-- 	<a href="travel-summary-payment-cn.html" class="bdr-curve btn btn-primary nxt-btn" onclick="return travel_planValid();"> 下一頁</a>  -->
</div>
<div class="clearfix"></div>
<br>
</div>
<div class="clearfix"></div>
</div>
<p class="padding1 hidden-sm hidden-xs">##travel.quote.other.disclaimer.part1@@<a class="sub-link" href="resources/policy-provisions-pdf/TravelCare_Provisions_Mar_2015.pdf" target="_blank">##travel.quote.other.disclaimer.part2@@</a>
##travel.quote.other.disclaimer.part3@@
##travel.quote.other.disclaimer.part4@@</p>
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

<!--Plan login popup-->
<div class="modal fade bs-example-modal-lg " id="loginpopup" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="display: none;">
  <div class="modal-dialog modal-lg">
    <div class="modal-content plan-modal">
    <form name="popUploginform" id="popUploginform" class="">
      <div class="login-form">
        <div class="form-container">
           <h2>##header.login.heading@@</h2>
          <h4>##header.login.username@@ <a href="forgotUserName" class="pull-right">##header.login.username.forget@@</a></h4>
          <div class="form-group">
            <input type="text" name="userName" class="form-control" placeholder=""	id="txtUserName">
          </div>
          <span id="errUserName" class="text-red"></span>
          <h4>##header.login.password@@ <a href="forgotUserPassword" class="pull-right">##header.login.password.forget@@</a></h4>
          <div class="form-group">
          <input type="password"  name="password" class="form-control" id="txtPass">
          </div>
     	  <span id="errPass" class="text-red"></span> <br>
          <div class="row">
					<div class="text-left col-lg-6 col-md-6">
						<button class="bdr-curve-none btn btn-primary btn-lg  wd5"
							type="button" onclick="return userLoginFnc();" tabindex="3">##header.login.action@@</button>
					</div>
					<h3 class="text-left col-lg-6 col-md-6 pad-none margin-none">
						<span> ##header.login.registration.heading@@</span><br> <a href="joinus"
							class="sub-link">##header.login.registration.action@@ </a>
					</h3>
					<div class="clearfix"></div>
		 </div>
         

          <p>##header.login.disclaimer@@</p>
        </div>
      </div>
      </form>
    </div>
    
  </div>
</div>



<!--Get promotion code popup-->
 <div class="modal fade bs-promo-modal-lg " tabindex="-1" role="dialog"  aria-hidden="true" style="display: none;">
      <div class="modal-dialog modal-lg">
        <div class="modal-content plan-modal">
          <div class="login-form">
            <div class="form-container">
              <h2>##promotion.get.code@@</h2>
              <h4>##promotion.get.code.email@@ </h4>
              <div class="form-group">
                <input type="text" class="form-control" placeholder="" id="txtPromoEmail">
              </div>
              <span id="errPromoEmail" class="text-red"></span>
               <br>
              
              <div class="row"> 
               <div class="col-lg-6 col-md-6">
                  <a class="bdr-curve btn btn-primary btn-lg wd5" href="#" onclick="return get_promo_val()">##promotion.get.code.action@@</a> 
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
                  <p>##promotion.get.code.disclaimer@@</p>
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
function BackMe() {
	window.history.back();
}
</script>