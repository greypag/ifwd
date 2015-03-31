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
					<li><a href="#">主頁</a> <i class="fa fa-caret-right"></i></li>
					<li><a href="#">旅遊保險 </a> <i class="fa fa-caret-right"></i></li>
					<li><a href="#">您的選擇</a></li>
					<li class="active "><i class="fa fa-caret-right"></i> 個人資料</li>
				</ol>
				<div class="container ">
					<div class="col-md-12 shop-tracking-status">
						<div class="center wow fadeInDown animated"
							style="visibility: visible;">
							<h2>個人資料</h2>
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
										<span class="status color3">您的選擇</span>
										<div class="icon">1</div>
									</div>

									<div
										class="image-order-status image-order-status-intransit  img-circle act">
										<span class="status color2">個人資料</span>
										<div class="icon">2</div>
									</div>
									<div
										class="image-order-status image-order-status-delivered  img-circle disabled">
										<span class="status">總結及付款</span>
										<div class="icon">3</div>
									</div>
									<div
										class="image-order-status image-order-status-completed  img-circle disabled">
										<span class="status lst-status">確認保單</span>
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
							if (authenticate.equals("false") || authenticate.equals("direct")) {
						%>
						<h3 class="margin-left-2 h2-3-existing-fwd-head">FWD eServices現有會員？</h3>

						<a href="#"
							class="col-lg-5 col-md-5 col-sm-5 col-xs-5 btn-box-2 margin-left-2 color4"
							data-toggle="modal" data-target=".bs-example-modal-lg">登入</a>
						<div class="col-lg-6 col-md-6 col-xs-6 col-sm-6 text-left">
							<h3 class="text-left or-continue">或以訪客身份申請</h3>
						</div>
						<div class="clearfix"></div>
						<%
							}
						%>


						<div class="gray-bdr"></div>
						<table class="table activation-form margin-left-2">
							<tbody>
								<tr>
									<td colspan="2" class="pad-none"><h3
											class="black-bold pad-none">申請人資料</h3></td>
								</tr>
								<tr>
									<td class="col-lg-4 col-md-4 col-sm-4 col-xs-4  pad-none"><label
										for="inputFullName" class="control-label bold-500">英文全名</label></td>
									<td class="pad-none"><input type="text" name="fullName"
										class="form-control" id="inputFullName"
										value="${userDetails.getFullName()}"
										placeholder="與香港身份證號碼/護照號碼相同" onblur="replaceAlpha(this);"
										onkeypress="return alphaOnly(event);" maxlength="100" />
									<span id="fullnameinvalid" class="text-red">
									</span></td>
								</tr>
								<tr>
									<td class="pad-none vtop"><select id="selectHkidPass" class="form-control soflow" name="selectedHkidPassApplicant">
									<option selected="selected">香港身份證號碼</option>
									<option>護照</option>
									</select></td>
									<td class="pad-none">
								
									
									<input type="text" name="hkid"
										class="form-control numberinput btm-pad-10"
										id="txtAppHkid" placeholder="X1234567/護照號碼"> <span
										id="errAppHkid" class="text-red" ></span></td>
								</tr>
								<tr>
									<td class="pad-none"><label for="inputMobileNo"
										class="control-label bold-500">手機號碼</label></td>
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
										class="control-label bold-500">電郵地址</label></td>
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
							<table class="table plandetail-form margin-left-2"
								id="input-white">
								<tbody>
									<tr>
										<td colspan="2" class="pad-none"><h3 class="pad-none">建立富衛會員帳戶?</h3>
											<i>如不需要建立會員帳戶，請留空此欄</i> <br></td>
									</tr>
									<tr>
										<td colspan="2" class="pad-none">&nbsp;</td>
									</tr>
									<tr>
										<td class="col-lg-4 col-md-4 col-sm-4 col-xs-4 pad-none"><label
											class="control-label bold-500">用戶名稱</label></td>
										<td class="pad-none"><input type="text"
											name="regusername" class="form-control btm-pad-10"
											id="inputRegUserName" placeholder="用戶名稱"><span
											id="errRegUser" class="text-red"> </span></td>
									</tr>
									<tr>
										<td class="pad-none"><label
											class="control-label bold-500">個人密碼</label></td>
										<td class="pad-none"><input type="password"
											name="regpassword" class="form-control btm-pad-10"
											id="inputRegPass" placeholder="個人密碼"> <span
											id="errRegPass" class="text-red"> </span></td>
									</tr>
									<tr>
										<td class="pad-none"><label
											class="control-label bold-500">確認密碼</label></td>
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
												配偶 
												</c:when>
													<c:when test="${totalAdultCount != 2}">
												成人旅客 <c:out value="${inx-1}"></c:out>
													</c:when>
												</c:choose>
											</c:when>
											<c:when test="${inx == 1}">
											我自己 
										</c:when>
										</c:choose>
									</h4>
									
									
									<div class="row ">
										<div class="col-xs-6 col-md-6">
											<label class="bold-500">受益人全名</label> <input type="text"
												id="txtAdFullName${inx}" name="adultName" value=""
												class="form-control" placeholder="與香港身份證號碼/護照號碼相同"
												onblur="replaceAlpha(this);"
												onkeypress="    return alphaOnly(event);" maxlength="100" />
											<span id="errtxtAdFullName${inx}" class="text-red"></span>
										</div>
										<div class="col-xs-6 col-md-6">
											<!-- <label class="pad-left1 bold-500">HKID</label> -->









											<select id="selectAdHkidPass${inx}" class="form-control soflow" name="selectedAdHkidPass">
									<option value="hkId" selected="selected">香港身份證號碼</option>

									<option>護照</option>
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
											<label class="bold-500">年齡</label> <select
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
											<label class="pad-left1 bold-500">受益人</label> <select
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
												<label class="bold-500">英文全名</label> <input type="text"
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
									<option value="hkId" selected="selected">香港身份證號碼</option>

									<option>護照</option>
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
											<label class="bold-500">受益人全名</label> <input type="text"
												name="childName" id="txtChldFullName${inx}" value=""
												class="form-control " placeholder="與香港身份證號碼/護照號碼相同"
												onblur="replaceAlpha(this);"
												onkeypress="    return alphaOnly(event);" maxlength="100" />
											<span id="errtxtChldFullName${inx}" class="text-red"></span>
										</div>
										<div class="col-xs-6 col-md-6">
											<!-- <label class="pad-left1 bold-500">HKID</label> -->
											<select id="selectChldHkidPass${inx}" class="form-control soflow" name="selectedChldHkidPass">
									<option value="hkId" selected="selected">香港身份證號碼</option>

									<option>護照</option>
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
											<label class="bold-500">年齡</label> <select
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
											<label class="pad-left1 bold-500">受益人</label> <select
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
												<label class="bold-500">英文全名</label> <input type="text"
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
									<option  selected="selected">香港身份證號碼</option>
									<option>護照</option>
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
										其他的旅行者
										<c:out value="${inx}"></c:out>
									</h4>
									<div class="row ">
										<div class="col-xs-6 col-md-6">
											<label class="bold-500">受益人全名</label> <input type="text"
												name="otherName" id="txtOtherFullName${inx}" value=""
												class="form-control " placeholder="英文全名（與香港身份證號碼/護照號碼相同）"
												onblur="replaceAlpha(this);"
												onkeypress="    return alphaOnly(event);" maxlength="100" />
											<span id="errtxtOtherFullName${inx}" class="text-red"></span>
										</div>
										<div class="col-xs-6 col-md-6">
											<!-- <label class="pad-left1 bold-500">HKID</label> -->
											<select id="selectOtHkidPass${inx}" class="form-control soflow" name="selectedOtHkidPass">
									<option selected="selected">香港身份證號碼</option>
									<option>護照</option>
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
											<label class="bold-500">年齡</label> <select
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
											<label class="pad-left1 bold-500">受益人</label> <select
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
												<label class="bold-500">英文全名</label> <input type="text"
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
									<option selected="selected">香港身份證號碼</option>
									<option>護照</option>
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
							<h4 class="h4-2 padding3">聲明</h4>
							<div class="declaration-content">
								<div class="checkbox">
									<input id="checkbox1" type="checkbox"> <label

										for="checkbox1"> 本人已參閱及明白保障範圍並在此聲明:-<br> i. <span

										class="margin-left-2"></span> 聲明上列資料及本人所知一切據實填報 ;<br>
										ii. <span class="margin-left-2"></span>
										聲明並據實相信各受保人絕不會違反醫生的囑咐或僅為獲醫療而外出旅遊。本人更清楚明白任何現已存在之疾病、現有、不時復發或先天疾病皆不在承保之列。本人保證已對安排而又必須取消或縮短旅程之事絕不知情;及<br>

										iii. <span class="margin-left-2"></span>
										同意此申請書及聲明將構成本人與富衛之間的合約根據。<br/>
										iv. <span class="margin-left-2"></span>
										本投保書是在香港特別行政區內簽署， 如有任何訛騙或資料失實，本人或受保人之保障有失效之虞。<br/>
										v. <span class="margin-left-2"></span>
										 本人已得到其他受保人之同意把上述資料交予富衛保險用作申請旅遊保險之用。
										

									</label>
								</div>
								<span id="chk1" class="text-red"> </span>
								<div class="checkbox">
									<input id="checkbox2" type="checkbox"> <label
										for="checkbox2"> 
										本人已參閱及明白 "<a
										href="https://home.fwd.com.hk/giphw/FWD_Resources/GI_Personal%20Data%20Protection%20Policy%20and%20Practices.pdf"
										class="sub-link" target="_blank">收集個人資料聲明</a>"，並同意接受其約束。
										


										</label>
								</div>
								<span id="chk1" class="text-red"></span>
								<hr/>
								<div class="checkbox">
									<input id="checkbox3" type="checkbox"> <label

										for="checkbox3"> 若閣下不希望本公司使用閣下的個人資料，或將閣下的個人資料提供予其他人士或公司作直接促銷用途，請剔以下有關方格，藉以行使閣下不同意此項安排的權利。 <br>

									</label>
								</div>
								 <div class="checkbox">
									<input id="checkbox4" type="checkbox"> <label

										for="checkbox4"> 請不要將直接促銷資料發給本人。<br>
										<br>
									</label>
								</div>
								<div class="checkbox">
									<input id="checkbox5" type="checkbox"> <label
										for="checkbox5">

										請不要將本人的個人資料提供予其他人士或公司作其直接促銷用途。<br>
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
									<h2 class="h2-3-choose">旅遊保險計劃</h2>
									<h4>計劃${planName}概覽</h4>
									<input type="hidden" name="selectedPlanName" value="${planName }">
								</div>
								<div class="pull-right">
									<div class="text-left pad-right1 h2-2 h2">
										<div class="hk">
											港幣
											<div class="flightcare-hk">${planSummary}</div>
										</div>
									</div>
								</div>
							</div>
							<div class="clearfix"></div>
							<div class="orange-bdr"></div>
							<div class="form-container">
								<h3 class="txt-bold">
									出發日期 <a href="travel"> <span
										class="span2 uline">更改</span></a>
								</h3>
								<h4>${travelQuote.getTrLeavingDate()}</h4>
								<input type="hidden" name="departureDate" id="departureDate"
									value="01-01-2015">

								<h3 class="txt-bold">
									回程日期 <a href="<%=request.getContextPath()%>"><span
										class="span2 uline">更改</span></a>
								</h3>
								<h4>${travelQuote.getTrBackDate()}</h4>
								<input type="hidden" name="backDate" id="backDate"
									value="${travelQuote.getTrBackDate()}">

								<h3 class="txt-bold">
									同行人數 <a href="travel"> <span
										class="span2 uline">更改</span></a>
								</h3>
								<h4>
									<c:if test="${ travelQuote.getTotalAdultTraveller()!=0}">	      ${travelQuote.getTotalAdultTraveller()+travelQuote.getTotalPersonalTraveller()}父母 ,</c:if>
									<c:if test="${ travelQuote.getTotalChildTraveller()!=0}">      	  ${travelQuote.getTotalChildTraveller()} 孩子，   </c:if>
			                     	<c:if test="${ travelQuote.getTotalOtherTraveller()!=0}">	      ${travelQuote.getTotalOtherTraveller()} 其他, </c:if>
		                            <c:if test="${planDetailsForm.getTravellerCount()!=0}">   ${planDetailsForm.getTravellerCount()} 旅客     </c:if>
								</h4>
								
								<input type="hidden" name="planSelected" value="${travelQuote.getPlanSelected()}">
								<h3 class="txt-bold">
									合共 <span>${travelQuote.getTotalTravellingDays()} 天</span>
								</h3>
								<h3>優惠代碼</h3>
								<!-- <div class="form-group">
									<span class="input-group-addon in black-bold"><span>使用</span></span>
              		<input type="text" class="form-control placeholder-fl" value="eg.FWD789" readonly placeholder="eg.FWD789">
					

              </div>
              <div class="travel-italic">
                <a href="#" class="sub-link"  data-toggle="modal" data-target=".bs-promo-modal-lg"><i> 如何取得優惠代碼？</i> </a>
              </div> -->
            </div>
		            <h3 class="h4-1-orange-b col-lg-6 col-md-6">小計 </h3>
		            <h3 class="h4-1-orange-b col-lg-6 col-md-6 text-right">${planSummary}</h3>
		            <h3 class="h4-1-orange-b col-lg-6 col-md-6">折扣優惠 </h3>
		            <h3 class="h4-1-orange-b col-lg-6 col-md-6 text-right">-0 </h3>
		            <div class="clearfix"></div>
		            <div class="orange-bdr"></div>
		            <h3 class="h4-1-orange-b col-lg-6 col-md-6">所需保費 </h3>
		            <h3 class="h4-1-orange-b col-lg-6 col-md-6 text-right">${planSummary}</h3>
		            <input type="hidden" name="finalDueAmount" value="${planSummary}">
            
            </div>
            
            <!--mob-->
<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pull-left">
	 <a href="#" onclick="BackMe();" class="bdr-curve btn btn-primary bck-btn">上一頁 </a>
</div>
<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pull-right"> 
	<input type="submit" class="bdr-curve-none btn btn-primary nxt-btn " value=" 下一頁" />
<!-- 	<a href="travel-summary-payment-cn.html" class="bdr-curve btn btn-primary nxt-btn" onclick="return travel_planValid();"> 下一頁</a>  -->
</div>
<div class="clearfix"></div>
<br>
</div>
<div class="clearfix"></div>
</div>
<p class="padding1 hidden-sm hidden-xs">以上資料只作參考用途。詳情請查看<a class="sub-link" href="resources/policy-provisions-pdf/TravelCare_Provisions_Mar_2015.pdf" target="_blank">保單條款</a>。
有關條款細則的詳細資料,請聯絡您的理財顧問或致電我們的24小時熱線3123 3123與客戶服務主任聯絡。</p>
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
           <h2>登入富衛客戶網上服務</h2>
          <h4>用戶名稱 <a href="forgotUserName" class="pull-right">忘記用戶名稱?</a></h4>
          <div class="form-group">
            <input type="text" name="userName" class="form-control" placeholder=""	id="txtUserName">
          </div>
          <span id="errUserName" class="text-red"></span>
          <h4>個人密碼 <a href="forgotUserPassword" class="pull-right">忘記密碼?</a></h4>
          <div class="form-group">
          <input type="password"  name="password" class="form-control" id="txtPass">
          </div>
     	  <span id="errPass" class="text-red"></span> <br>
          <div class="row">
					<div class="text-left col-lg-6 col-md-6">
						<button class="bdr-curve-none btn btn-primary btn-lg  wd5"
							type="button" onclick="return userLoginFnc();" tabindex="3">登入</button>
					</div>
					<h3 class="text-left col-lg-6 col-md-6 pad-none margin-none">
						<span> 新用戶?</span><br> <a href="joinus"
							class="sub-link">請註冊 </a>
					</h3>
					<div class="clearfix"></div>
		 </div>
         

          <p>本人在此同意通過本網站（以下簡稱“計劃”）購買指定保險計劃，將我的個人資料從富衛電子服務轉移到計劃的簽發人。</p>
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
              <h2>尚未擁有推廣編號？輸入您的電郵地址，你將收到我們送給你的尊屬推廣編號。</h2>
              <h4>電郵地址 </h4>
              <div class="form-group">
                <input type="text" class="form-control" placeholder="" id="txtPromoEmail">
              </div>
              <span id="errPromoEmail" class="text-red"></span>
               <br>
              
              <div class="row"> 
               <div class="col-lg-6 col-md-6">
                  <a class="bdr-curve btn btn-primary btn-lg wd5" href="#" onclick="return get_promo_val()">Submit</a> 
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
                  <p>我同意提交我的電子郵件地址作為接收富衛的推廣編號之用，並在未來接收其他優惠資訊。</p>
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