<%@page import="com.ifwd.fwdhk.model.PlanDetailsForm"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.ifwd.fwdhk.model.FlightQuoteDetails"%>
<%@page import="com.ifwd.fwdhk.model.PlanDetails"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@page import="java.util.ArrayList"%>

<%
	String authenticate = "false";
	if (session.getAttribute("authenticate") != null) {
		authenticate = session.getAttribute("authenticate").toString();
	}
%>

<script>

/* Commented because login is not compulsory */ 
<%-- 	function flightPlanValidation() {
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
	<div id="cn" class="container">
		<div class="row">
			<form:form name="freeFlightForm" id="freeFlightForm"
				modelAttribute="createFlightPolicy" method="post"
				onsubmit="return createFlightFnc(this);">

				<ol class="breadcrumb pad-none">
					<li><a href="#">主頁</a> <i class="fa fa-caret-right"></i></li>
					<li><a href="#">航空保險 </a> <i class="fa fa-caret-right"></i></li>
					<li><a href="#">您的選擇 </a></li>
					<li class="active "><i class="fa fa-caret-right"></i> 個人資料</li>
				</ol>

				<input type="hidden" name="planSelected"
					value="${planDetailsForm.getPlanSelected()}">
				<div class="container ">

					<div
						class="col-md-12 col-lg-12 col-sm-12 col-xs-12 shop-tracking-status">
						<div class="center wow fadeInDown animated"
							style="visibility: visible;">
							<h2>個人資料</h2>
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
								<span class="status status-working">您的選擇</span>
							</div>


							<div
								class="image-order-status image-order-status-active active img-circle">
								<div class="icon">2</div>
								<span class="status">個人資料</span>
							</div>


							<div
								class="image-order-status image-order-status-intransit disabled  img-circle">
								<div class="icon">3</div>
								<span class="status min-left">確認保單</span>
							</div>
						</div>


					</div>
				</div>
				<br>
				<br>
				<br>



				<div class="container pad-none bdr ur-opt-content gray-bg3">
					<c:if test="${ not empty errorMessage}">
						<div class="alert alert-danger" role="alert">
							<P>${errorMessage}</P>
						</div>
					</c:if>

					<div
						class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none white-bg1">
						<br>

						<%
							if (authenticate.equals("false")
										|| authenticate.equals("direct")) {
						%>

						<h3
							class="margin-left-2 h2-3-existing-fwd-head hidden-sm hidden-xs">FWD
							eServices現有會員？</h3>


						<h3
							class="margin-left-2 h2-3-existing-fwd-head hidden-lg hidden-md">FWD
							eServices現有會員？</h3>






						<a href="#"
							class="col-lg-5 col-md-5 col-sm-5 col-xs-5 btn-box-2 margin-left-2 color4"
							data-toggle="modal" data-target=".bs-example-modal-lg">登入</a>



						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 text-left">
							<h3 class="text-left or-continue">或以訪客身份申請</h3>
						</div>
						<%
							}
						%>


						<div class="clearfix"></div>
						<div class="gray-bdr"></div>
						<%-- applicant info --%>
						<table class="table activation-form margin-left-2">
							<tbody>
								<tr>



									<td colspan="2" class="pad-none"><h3
											class="black-bold pad-none">申請人資料</h3></td>
								</tr>
								<tr>



									<td class="col-sm-4 pad-none"><label for="inputFullName"
										class="control-label bold-500">英文全名</label></td>
									<td class="pad-none"><input type="text" name="fullName"
										class="form-control" value="${userDetails.getFullName()}"
										id="inputFullName" placeholder="英文全名(與香港身份證號碼)"
										onblur="replaceAlpha(this);"
										onkeypress="return alphaOnly(event);" maxlength="100" /> <span
										id="fullname" style="display: none"> <label
											class="text-red">請輸入 姓名 和 請以英文輸入</label>
									</span> 
									<span id="fullnameinvalid" class="text-red"></span>
									</td>
								</tr>

								<tr>



									<td valign="middle" class="pad-none"><label
										for="inputEmail3" class="control-label bold-500">香港身份證號碼</label></td>
									<td class="pad-none"><input type="text" name="hkid"
										class="form-control numberinput textUpper" id="txtAppHkid"
										placeholder="X1234567"> <span id="errAppHkid"
										class="text-red"> </span></td>
								</tr>

								<tr>



									<td class="pad-none"><label for="inputMobileNo"
										class="control-label bold-500">手機號碼</label></td>
									<td class="pad-none"><input type="text" name="mobileNo"
										class="form-control"
										value="${userDetails.getMobileNo().trim()}" id="inputMobileNo"
										placeholder="手機號碼" onkeypress="return isNumeric(event)"
										onblur="replaceNumeric(this);" maxlength="8" /> 
										<span id="mobileNo" class="text-red"> 
											
										</span> <!-- <span id="mobilenoinvalid" style="display: none"> <label
											class="text-red">請以數字輸入 聯絡電話</label>
									</span> --></td>
								</tr>
								<tr>



									<td class="pad-none"><label for="inputEmailId"
										class="control-label bold-500">電郵地址</label></td>
									<td class="pad-none"><input class="form-control"
										value="${userDetails.getEmailAddress().trim()}"
										name="emailAddress" id="inputEmailId" placeholder="電郵地址"
										maxlength="50"> <span id="emailid" class="text-red">
									</span></td>
								</tr>

							</tbody>
						</table>


						<!-- user login panel -->
						<%
							if (authenticate.equals("false")
										|| authenticate.equals("direct")) {
						%>
						<div class="gray-bg3-wid">
							<table class="table plandetail-form margin-left-2 vert-middle"
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



										<td class="col-sm-4 pad-none"><label
											class="control-label bold-500">用戶名稱</label></td>
										<td class="pad-none"><input type="text" name="userName"
											class="form-control btm-pad-10" id="Username"
											placeholder="用戶名稱">
										<span id="UsernameError" class="text-red"></span>
										</td>
									</tr>
									<tr>

										<td class="pad-none"><label
											class="control-label bold-500">個人密碼</label></td>
										<td class="pad-none"><input type="password"
											class="form-control btm-pad-10" name="password"
											id="Password" placeholder="個人密碼">
										<span id="PasswordError" class="text-red"></span></td>
									</tr>
									<tr>


										<td class="pad-none"><label
											class="control-label bold-500">確認密碼</label></td>
										<td class="pad-none"><input type="password"
											class="form-control btm-pad-10" name="password"
											id="Confirm-Password" placeholder="確認密碼">
											<span id="Confirm-PasswordError" class="text-red"></span></td>
									</tr>
								</tbody>
							</table>
						</div>
						<%
							}
						%>

						<h3 class="black-bold pad-none margin-left-2">
							受保人資料<br>
						</h3>

					<div class="insure-travel pad-15">
						<!-- Bellow fields are dynamically generated -->
						<c:set var="totalAdultCount" value="${0}" />
						<c:set var="totalAdultCount"
							value="${planDetailsForm.travellerCount + planDetailsForm.totalAdultTraveller}" />

						<!-- Dynamic Loops -->
						<input type="hidden" name="totalAdultTraveller"
							id="totalAdultTraveler" value="${totalAdultCount}">
						<c:forEach var="inx" begin="1" end="${totalAdultCount}">
							<div id="adulttraveller">
								<h4 class="color1">
									<c:choose>
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
									<div class="col-xs-12  col-sm-6 col-md-6">
										<label class="bold-500">英文全名</label> <input type="text"
											name="adultName" id="txtAdFullName${inx}"
											class="form-control " placeholder="英文全名(與香港身份證號碼)"
											onblur="replaceAlpha(this);"
											onkeypress="    return alphaOnly(event);" maxlength="100" />
										<span id="fullname1" class="text-red"> </span> <span
											id="errtxtAdFullName${inx}" class="text-red"> </span>
									</div>

									<div class="col-xs-12  col-sm-6 col-md-6">
										<label class="pad-left1 bold-500">身份證號碼</label> <input
											id="txtInsuHkid${inx}" name="adultHKID" class="form-control"
											placeholder="X1234567" value="" /> <span
											id="errtxtInvalidInsuHkid${inx}" class="text-red">&nbsp;
										</span> <span id="errtxtInsuHkid${inx}" class="text-red">&nbsp;
										</span>
									</div>

								</div>

								<div class="row top-mrg-10">
									<div class="col-xs-12  col-sm-6 col-md-6">
										<label class="bold-500"> 年齡</label>
										<t:dropdown 
											defaultLabel="請選擇"
											onChange=""
											selectables="${mapSelfType}"
											valueElmId="selectAgeRange${inx}"
											valueElmName="adultAgeRange"
										/>
										<span id="errselectAgeRange${inx}" class="text-red"></span>
									</div>
									<div class="col-xs-12 col-sm-6 col-md-6">
										<label class="pad-left1 bold-500">受益人</label>
										
										<t:dropdown 
											defaultLabel="個人遺產"
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
											<label class="bold-500">英文全名</label> <input type="text"
												name="adultBenificiaryFullName"
												id="adultBenefitiaryId${inx}" value="" class="form-control "
												placeholder="英文全名" onblur="replaceAlpha(this);"
												onkeypress="  return alphaOnly(event);" maxlength="100" />
											<span id="erradultBenefitiaryId${inx}" class="text-red">
											</span>
										</div>
										<div class="col-xs-12  col-sm-6 col-md-6">
											<label class="pad-left1 bold-500">身份證號碼/護照號碼</label> <input
												id="adultBenefitiaryHKId${inx}" name="adultBenificiaryHkid"
												class="form-control" placeholder="X1234567/護照號碼" value="" />
											<span id="erradultBenefitiaryHKId${inx}" class="text-red">
											</span>
										</div>
									</div>


								</div>
							</div>

						</c:forEach>

						<!-- Child -->
						<input type="hidden" name="totalChildTraveller"
							value="${totalChildTraveller}" id="totalCountOfChild">
						<c:forEach var="inx" begin="1" end="${totalChildTraveller}">
							<div id="childtraveller">
								<div class="col-xs-12 col-sm-12 col-md-12 pad-15 insure-travel">
									<h4 class="color1 top-mrg-10">
										子女
										<c:out value="${inx}"></c:out>
									</h4>
									<div class="row ">
										<div class="col-xs-12 col-sm-6 col-md-6">
											<label class="bold-500">英文全名</label> <input type="text"
												name="childName" id="txtChldFullName${inx}" value=""
												class="form-control " placeholder="英文全名(與香港身份證號碼)"
												onblur="replaceAlpha(this);"
												onkeypress="    return alphaOnly(event);" maxlength="100" />
											<span id="errtxtChldFullName${inx}" class="text-red"></span>
										</div>
										<div class="col-xs-12 col-sm-6 col-md-6">
											<label class="pad-left1 bold-500">身份證號碼</label> <input
												id="txtChldInsuHkid${inx}" name="childHKID"
												class="form-control" placeholder="X1234567" value="">
											<span id="errtxtChldInsuHkid${inx}" class="text-red">
											</span>
										</div>
									</div>
									<div class="row top-mrg-10">
										<div class="col-xs-12 col-sm-6 col-md-6">
											<label class="bold-500"> 年齡</label> 
											<t:dropdown 
												defaultLabel="請選擇"
												onChange=""
												selectables="${mapChildType}"
												valueElmId="selectchildAgeRange${inx}"
												valueElmName="childAgeRange"
											/>
											<span id="errchildRange${inx}" class="text-red"></span>
										</div>

										<div class="col-xs-12 col-sm-6 col-md-6">
											<label class="pad-left1 bold-500"> 受益人</label> 
											
											<t:dropdown 
												defaultLabel="個人遺產"
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
												<label class="bold-500">英文全名</label> <input type="text"
													name="childBenificiaryFullName"
													id="childBenefitiaryName${inx}" value=""
													class="form-control " placeholder="英文全名"
													onblur="replaceAlpha(this);"
													onkeypress="    return alphaOnly(event);" maxlength="100" />
												<span id="errchildBenefitiaryName${inx}" class="text-red"></span>
											</div>
											<div class="col-xs-12 col-sm-6 col-md-6">
												<label class="pad-left1 bold-500">身份證號碼</label> <input
													id="txtchildInsuHkid${inx}" name="childBenificiaryHkid"
													class="form-control" placeholder="X1234567" value="" /> <span
													id="errtxtchildInsuHkid${inx}" class="text-red"> </span>
											</div>
										</div>
									</div>
								</div>

							</div>
						</c:forEach>



						<input type="hidden" name="totalOtherTraveller"
							value="${totalOtherTraveller}" id="totalCountOther">


						<c:forEach var="inx" begin="1" end="${totalOtherTraveller}">
							<div id="childtraveller">


								<div class="col-xs-12 col-sm-6 col-md-12 pad-15 ">
									<h4 class="color1 top-mrg-10">
										子女
										<c:out value="${inx}"></c:out>
									</h4>




									<div class="row ">
										<div class="col-xs-12 col-sm-6 col-md-6">
											<label class="bold-500">英文全名</label> <input type="text"
												name="otherName" id="txtOtherFullName${inx}" value=""
												class="form-control " placeholder="英文全名(與香港身份證號碼)"
												onblur="replaceAlpha(this);"
												onkeypress="    return alphaOnly(event);" maxlength="100" />




											<span id="errtxtOtherFullName${inx}" class="text-red"></span>
										</div>

										<div class="col-xs-12 col-sm-6 col-md-6">
											<label class="pad-left1 bold-500">身份證號碼 </label> <input
												id="txtOtherInsuHkid${inx}" name="otherHKID"
												class="form-control" placeholder="X1234567" value="">
											<span id="errtxtOtherInsuHkid${inx}" class="text-red">
											</span>
										</div>
									</div>



									<div class="row top-mrg-10">
										<div class="col-xs-12 col-sm-6 col-md-6">
											<label class="bold-500">年齡</label>
											<t:dropdown 
												defaultLabel="請選擇"
												onChange=""
												selectables="${mapAgeType}"
												valueElmId="selectOtherAgeRange${inx}"
												valueElmName="otherAgeRange"
											/>  
											<span id="errselectOtherAgeRange${inx}" class="text-red"></span>
										</div>

										<div class="col-xs-12 col-sm-6 col-md-6">
											<label class="pad-left1 bold-500">受益人</label> 
											<t:dropdown 
												defaultLabel="個人遺產"
												defaultValue="SE"
												onChange="activeDiv('otherbenificiaryId${inx}','otherSelectBenificiary${inx}')"
												selectables="${mapRelationshipCode}"
												valueElmId="otherSelectBenificiary${inx}"
												valueElmName="otherBeneficiary"
											/>	
											<span id="benificiary" style="display: none"> <label
												style="color: red">請輸入受益人的英文全名。</label>
											</span>
										</div>



										<div id="otherbenificiaryId${inx}" class="hide">
											<div class="col-xs-12 col-sm-6 col-md-6">
												<label class="bold-500">英文全名</label> <input type="text"
													name="otherBenificiaryFullName"
													id="otherBenefitiaryName${inx}" value=""
													class="form-control " placeholder="英文全名"
													onblur="replaceAlpha(this);"
													onkeypress="    return alphaOnly(event);" maxlength="100" />
												<span id="errotherBenefitiaryName${inx}" class="text-red"></span>


											</div>

											<div class="col-xs-12 col-sm-6 col-md-6">
												<label class="pad-left1 bold-500">身份證號碼</label> <input
													id="txtOtherBenInsuHkid${inx}" name="otherBenificiaryHkid"
													class="form-control" placeholder="X1234567" value="" /> <span
													id="errtxtOtherBenInsuHkid${inx}" class="text-red">
												</span>
											</div>
										</div>

									</div>
								</div>
							</div>
						</c:forEach>


						<div class="clearfix"></div>
						<div class="spacer3"></div>

</div>

						<h4 class="h4-2 padding3">聲明</h4>
						<div class="declaration-content">
							<div class="checkbox">
								<input id="checkbox1" name="checkbox1" type="checkbox">
								<label for="checkbox1"> 本人已參閱及明白保障範圍並在此聲明:-<br> i.
									<span class="margin-left-2"></span>聲明上列資料及本人所知一切據實填報 ;<br>
									ii. <span class="margin-left-2"></span>聲明並據實相信各受保人絕不會違反醫生的囑咐或僅為獲醫療而外出旅遊。本人更清楚明白任何現已存在之疾病、現有、不時復發或先天疾病皆不在承保之列。本人保證已對安排而又必須取消或縮短旅程之事絕不知情;及<br>
									iii. <span class="margin-left-2"></span>同意此申請書及聲明將構成本人與富衛之間的合約根據。<br>
									iv. <span class="margin-left-2"></span>本投保書是在香港特別行政區內簽署，
									如有任何訛騙或資料失實，本人或受保人之保障有失效之虞。<br /> v. <span
									class="margin-left-2"></span>本人已得到其他受保人之同意把上述資料交予富衛保險用作申請航空意外保險之用。<br />
									
									
								</label>
							</div>
							<span id="chk1" class="text-red"> </span>
							<br />	
							<div class="checkbox">
								<input id="checkbox2" type="checkbox"> <label for="checkbox2">		
									
									 本人已參閱及明白 "<a
									href="https://home.fwd.com.hk/giphw/FWD_Resources/GI_Personal%20Data%20Protection%20Policy%20and%20Practices.pdf"
									class="sub-link" target="_blank">收集個人資料聲明</a>"，並同意接受其約束。
								</label>
							</div>
							<span id="chk2" class="text-red"> </span>
							<hr />
							<div>
								若閣下不希望本公司使用閣下的個人資料，或將閣下的個人資料提供予其他人士或公司作直接促銷用途，請剔以下有關方格，藉以行使閣下不同意此項安排的權利。
							</div>

							<div class="checkbox">
								<input id="checkbox3" type="checkbox"> <label
									for="checkbox3"> 請不要將直接促銷資料發給本人。<br> <br>
								</label>
							</div>
							<div class="checkbox">
								<input id="checkbox4" type="checkbox"> <label
									for="checkbox4"> 請不要將本人的個人資料提供予其他人士或公司作其直接促銷用途。<br>
									<br>
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
									<h2 class="h2-3-choose">航空意外保險</h2>
									<h4>保單總結</h4>
								</div>
								<div class="pull-right">
									<div class="text-left pad-right1 h2-2 h2">
										<div class="hk">
											<!-- 港幣 -->
											<div class="flightcare-hk">
												<%-- ${planDetailsForm.getTotalDue()} --%>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="clearfix"></div>
							<div class="orange-bdr"></div>
							<div class="form-container">
								<h3 class="txt-bold">
									出發日期 <span class="span2 uline"><a href="flight">更改</a></span>
								</h3>
								<input type="hidden" name="departureDate"
									value="${planDetailsForm.getDepartureDate()}">
								<h4>${planDetailsForm.getDepartureDate()}</h4>
								<h3 class="txt-bold">
									回程日期<span class="span2 uline"><a href="flight">更改</a></span>
								</h3>
								<input type="hidden" name="returnDate"
									value="${planDetailsForm.getReturnDate()}">
								<h4>${planDetailsForm.getReturnDate()}</h4>
								<h3 class="txt-bold">
									同行人數 <span class="span2 uline"><a href="flight">更改</a></span>
								</h3>

								<br>
								<h4>

								<c:if test="${planDetailsForm.getTotalAdultTraveller() !=0 }">位家長: ${planDetailsForm.getTotalAdultTraveller()} <br></c:if>
								<c:if test="${planDetailsForm.getTotalChildTraveller() !=0 }">子女: ${planDetailsForm.getTotalChildTraveller()} <br></c:if>
								<c:if test="${planDetailsForm.getTotalOtherTraveller() !=0}">其他旅客: ${planDetailsForm.getTotalOtherTraveller()} <br></c:if>
								<c:if test="${planDetailsForm.getTravellerCount() !=0}">旅客： ${planDetailsForm.getTravellerCount()}</c:if>
								</h4>
								
								<input type="hidden" name="otherInput"
									value="${planDetailsForm.getTotalOtherTraveller()}"> <input
									type="hidden" name="childInput"
									value="${planDetailsForm.getTotalChildTraveller()}"> <br>
								<input type="hidden" name="days"
									value="${planDetailsForm.getDays()}">
								<h3 class="txt-bold">
									合共： <span>${planDetailsForm.getDays()}</span>天
								</h3>
								<br>
							</div>
							<div class="orange-bdr"></div>
							<h3 class="h4-1-orange-b col-lg-6 col-md-6">
								<!-- 所需保費 -->
							</h3>
							<h3 class="h4-1-orange-b col-lg-6 col-md-6 text-right">
								&nbsp;&nbsp;&nbsp;
								<%-- ${planDetailsForm.getTotalDue()} --%>
							</h3>
						</div>
						<!--mob-hidden-->
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pull-left">
							<a href="#" onclick="BackMe();"
								class="bdr-curve btn btn-primary bck-btn">上一頁 </a>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pull-right">



							<!-- <button class="bdr-curve-none btn btn-primary nxt-btn " onclick="return flightPlanValidation();">下一頁</button> -->
							<input type="submit"
								class="bdr-curve-none btn btn-primary btn-next" value="下一頁" />
						</div>
						<div class="clearfix"></div>
						<br>
					</div>
					<div class="clearfix"></div>
				</div>
				<p class="padding1 hidden-sm hidden-xs">

					以上資料只作參考用途。詳情請查看 <a class="sub-link"
						href="resources/policy-provisions-pdf/FlightCare_Provisions_Mar_2015.pdf"
						target="_blank"> 保單條款</a>。有關條款細則的詳細資料,請聯絡您的理財顧問或致電我們的24小時熱線3123
					3123與客戶服務主任聯絡。

				</p>



			</form:form>
		</div>
		<!--/.row-->
	</div>
	<!--/.container-->
</section>
<!--end Main Content-->





<!--Plan login popup-->

<div class="modal fade bs-example-modal-lg " id="loginpopup"
	tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
	aria-hidden="true" style="display: none;">

	<div class="modal-dialog modal-lg">
		<div class="modal-content plan-modal">
			<form name="popUploginform" id="popUploginform" class="">
				<div class="login-form">
					<div class="form-container">
						<h2>登入富衛客戶網上服務</h2>

						<h4>
							用戶名稱 <a href="forgotUserName" class="pull-right">忘記用戶名稱?</a>
						</h4>

						<div class="form-group">
							<input type="text" name="userName" class="form-control"
								placeholder="" id="txtUserName">
						</div>
						<span id="errUserName" class="text-red"></span>

						<h4>
							個人密碼 <a href="forgotUserPassword" class="pull-right">忘記密碼?</a>
						</h4>

						<div class="form-group">
							<input type="password" name="password" class="form-control"
								id="txtPass">
						</div>
						<span id="errPass" class="text-red"></span> <br>
						<div class="row">
							<div class="text-left col-lg-6 col-md-6">
								<button class="bdr-curve-none btn btn-primary btn-lg  wd5"
									type="button" onclick="return userLoginFnc();" tabindex="3">登入</button>
							</div>
							<h3 class="text-left col-lg-6 col-md-6 pad-none margin-none">
								<span> 新用戶?</span><br> <a href="joinus" class="sub-link">請註冊
								</a>
							</h3>
							<div class="clearfix"></div>
						</div>


						<!--   <div class="row"> 
		      	<div class="col-lg-6 col-md-6">
		      			<a class="col-lg-6 col-md-6" href="account"
							onclick="return validUser()">
							<button type="button" class="bdr-curve-none btn btn-primary btn-lg wd5">登入 </button>
						</a>
						<button class="bdr-curve-none btn btn-primary btn-lg "
								type="button" onclick="return userLoginFnc();" tabindex="3">登入</button>
						

				 </div>
			 <div class="clearfix"></div>
         </div> -->


						<p>本人在此同意通過本網站（以下簡稱“計劃”）購買指定保險計劃，將我的個人資料從富衛電子服務轉移到計劃的簽發人。</p>
					</div>
				</div>
			</form>
		</div>


	</div>
</div>




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

/* UserLogin ajax function */


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

	
	
	/* Function for create flight policy */
	function createFlightFnc(form) {

		 var flag = false;
    if(fcPlanValid()){

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
						console.log('API fail response ' + data);
						$('#errorMessages').removeClass('hide');
						$('#errorMessages').html(data);
					}

				}
			});
		}		
		return flag;
	}
	function BackMe() {
		window.history.back();
	}
</script>

