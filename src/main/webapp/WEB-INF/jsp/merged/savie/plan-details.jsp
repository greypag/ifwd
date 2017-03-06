<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeQuoteBean"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="enhance" uri="http://pukkaone.github.com/jsp" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<!DOCTYPE html>
<script type="text/javascript">
	var context = "${pageContext.request.contextPath}";
	var languageP = "${language}";
</script>
<html lang="en">
	<head>
		<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/material.min.css"/>
		<meta name="apple-mobile-web-app-capable" content="yes"/>
	</head>
	<body>
		<%!
			boolean isSaleActiveClass = false;
			boolean isEservicesActiveClass = false;
		%>
		<div class="fwd-savie-wrapper savie-online-container with-breadcrumbs-steps" id="applicant-info-page">
			<!-- HEADER -->

			<div id="savie-online">

				<!-- Breadcrumb Component Start-->

				<c:set var="breadcrumbItems" value="breadcrumb.item.home"/>
				<c:set var="breadcrumbActive" value="0"/>

				<c:if test="${planIndex == 'medical-insurance'}">
					<c:set var="breadcrumbItems">
						breadcrumb.item.home,breadcrumb.item.protect,breadcrumb.item.health,breadcrumb.item.easyhealth,breadcrumb.item.application
					</c:set>
					<c:set var="breadcrumbActive">4</c:set>
				</c:if>
				<c:if test="${planIndex == 'savings-insurance'}">
					<c:set var="breadcrumbItems">
						breadcrumb.item.home,breadcrumb.item.save,breadcrumb.item.savie,breadcrumb.item.application
					</c:set>
					<c:set var="breadcrumbActive">3</c:set>
				</c:if>

				<jsp:include page="/WEB-INF/jsp/merged/comp/breadcrumb.jsp">
					<jsp:param name="breadcrumbItems" value="${breadcrumbItems}"/>
					<jsp:param name="breadcrumbActive" value="${breadcrumbActive}"/>
				</jsp:include>

				<!-- Breadcrumb Component End-->

				<!-- StepIndicator Component Start-->

				<c:set var="stepItems" value="stepindicator.selectplan"/>
				<c:set var="stepActive" value="0"/>

				<c:if test="${planIndex == 'medical-insurance'}">
					<c:set var="stepItems">
						stepindicator.selectplan,stepindicator.application.summary.declaration,stepindicator.sign,stepindicator.payment,stepindicator.upload.document,stepindicator.confirmation
					</c:set>
					<c:set var="stepActive">1</c:set>
				</c:if>
				<c:if test="${planIndex == 'savings-insurance'}">
					<c:set var="stepItems">
						stepindicator.selectplan,stepindicator.application,stepindicator.summary.declaration,stepindicator.sign,stepindicator.upload.document,stepindicator.confirmation
					</c:set>
					<c:set var="stepActive">1</c:set>
				</c:if>

				<!--<div class="container-fluid fwd-full-container browse-holder">-->
				<jsp:include page="/WEB-INF/jsp/merged/comp/step-indicator.jsp">
					<jsp:param name="stepItems" value="${stepItems}"/>
					<jsp:param name="stepActive" value="${stepActive}"/>
				</jsp:include>
				<!--</div>-->

				<!-- StepIndicator Component End-->

				<!-- APPLICANT INFO BLOCK -->
				<div id="so-application-info-section" class="headerStick">
					<div class="container-fluid fwd-container">
						<div id="personal-info" class="personal-info-widget page-application et-application-page">
							<h4 class="so-h4"><fmt:message key="label.savie.application.insured.title" bundle="${msg}"/></h4>
							<div id="errorMsg" style="color: red;"></div>
							<form id="soInsuredInfoForm" method="post" class="form-horizontal form-uppercase" action="" onsubmit="return false">
								<div class="row margin">
									<div class="col-sm-12 col-md-6 left">
										<div class="clearfix form-group has-error">
											<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
												<input class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input" id="firstname" name="firstname" type="text" autocomplete="off" value="${userDetails.firstName }" autocomplete="off" readonly="readonly"/>
												<label class="mdl-textfield__label so-mdl-textfield-label" id="personal-info-label" for="firstName"><fmt:message key="placeholder.first.name" bundle="${msg}"/></label>
											</div>
											<span class="error-msg" id="firstNameErMsg"></span>
											<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
												<input class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input" id="lastname" name="lastname" type="text" autocomplete="off" value="${userDetails.lastName }" autocomplete="off" readonly="readonly"/>
												<label class="mdl-textfield__label so-mdl-textfield-label" id="personal-info-label" for="lastName"><fmt:message key="placeholder.last.name" bundle="${msg}"/></label>
											</div>
											<span class="error-msg" id="lastNameErMsg"></span>
										</div>
										<div class="clearfix form-group has-error">
											<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
												<input class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input chinese-input" id="chineseName" name="chineseName" type="text" autocomplete="off" value="${lifePersonalDetails.chineseName }" autocomplete="off"/>
												<label class="mdl-textfield__label so-mdl-textfield-label" id="personal-info-label" for="chineseName"><fmt:message key="placeholder.chinese.name" bundle="${msg}"/></label>
											</div>
											<span class="error-msg" id="chineseNameErMsg"></span>
										</div>
										<div class="clearfix form-group has-error" id="gender-errormsg">
											<div class="left-desktop text-box">
												<div class="selectDiv">
													<label class="mdl-textfield__label mdl-textfield__label--select-box cstm-dropdown-label"><fmt:message key="placeholder.gender" bundle="${msg}"/></label>
													<select class="form-control gray-dropdown" name="tmpGender" id="tmpGender"><option value="" <c:if test="${savieFna.gender != '0'&&savieFna.gender != '1'}">selected="selected"</c:if>
													disabled="disabled"><fmt:message key="placeholder.gender" bundle="${msg}"/></option>
											<option value="male" <c:if test="${savieFna.gender == '0'}">selected="selected"</c:if>><fmt:message key="label.male" bundle="${msg}"/></option>
									<option value="female" <c:if test="${savieFna.gender == '1'}">selected="selected"</c:if>><fmt:message key="label.female" bundle="${msg}"/></option>
							</select>
							<input type="hidden" id="gender" name="gender" value="${savieFna.gender == '0' ? 'MALE':'FEMALE'}"/>
							<img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg"></div>
							<span class="error-msg" id="genderErMsg"></span>
						</div>
					</div>
					<div class="clearfix form-group has-error">
						<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
							<input class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input" id="hkId" name="hkid" type="text" autocomplete="off" value="${lifePersonalDetails.hkid }"/>
							<label class="mdl-textfield__label so-mdl-textfield-label" for="hkId" id="personal-info-label"><fmt:message key="placeholder.hkid" bundle="${msg}"/></label>
						</div>
						<span class="error-msg" id="hkidErMsg"></span>
					</div>
					<div class="clearfix form-group has-error">
						<div class="left-desktop text-box">
							<div class="selectDiv">
								<label class="mdl-textfield__label mdl-textfield__label--select-box cstm-dropdown-label" id="personal-info"><fmt:message key="placeholder.place.of.Birth" bundle="${msg}"/></label>
								<select class="form-control gray-dropdown" name="tmpPlaceOfBirth" id="tmpPlaceOfBirth">
									<option value="" selected="selected" disabled="disabled"><fmt:message key="placeholder.place.of.Birth" bundle="${msg}"/></option>
									<c:if test="${language == 'en'}">
										<c:forEach var="list" items="${placeOfBirthEN}">
											<enhance:out escapeXml="false"><option value="${list.itemCode }" <c:if test="${lifePersonalDetails.placeOfBirth == list.itemCode}">selected="selected"</c:if>>${list.itemDesc }</option>
									</enhance:out>
								</c:forEach>
							</c:if>
							<c:if test="${language == 'tc'}">
								<c:forEach var="list" items="${placeOfBirthCN}">
									<enhance:out escapeXml="false"><option value="${list.itemCode }" <c:if test="${lifePersonalDetails.placeOfBirth == list.itemCode}">selected="selected"</c:if>>${list.itemDesc }</option>
							</enhance:out>
						</c:forEach>
					</c:if>

					<c:if test="${language == 'en'}">
						<c:forEach var="list" items="${placeOfBirthEN}">
							<c:if test="${lifePersonalDetails.placeOfBirth == list.itemCode}"><c:set var="placeOfBirthCode" value="${list.itemCode }"/></c:if>
						</c:forEach>
					</c:if>
					<c:if test="${language == 'tc'}">
						<c:forEach var="list" items="${placeOfBirthCN}">
							<c:if test="${lifePersonalDetails.placeOfBirth == list.itemCode}"><c:set var="placeOfBirthCode" value="${list.itemCode }"/></c:if>
						</c:forEach>
					</c:if>
				</select>
				<input type="hidden" id="placeOfBirth" name="placeOfBirth" value="${placeOfBirthCode }"/>
				<img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg"></div>
				<span class="error-msg" id="placeOfBirthErMsg"></span>
			</div>
		</div>
		<div class="clearfix form-group has-error">
			<div class="left-desktop text-box">
				<div class="selectDiv">
					<label class="mdl-textfield__label mdl-textfield__label--select-box cstm-dropdown-label"><fmt:message key="placeholder.nationality" bundle="${msg}"/></label>
					<select class="form-control gray-dropdown" name="tmpNationality" id="tmpNationality">
						<option value="" selected="selected" disabled="disabled"><fmt:message key="placeholder.nationality" bundle="${msg}"/></option>
						<c:if test="${language == 'en'}">
							<c:forEach var="list" items="${nationalityEN}">
								<enhance:out escapeXml="false"><option value="${list.itemCode }" <c:if test="${lifePersonalDetails.nationalty == list.itemCode}">selected="selected"</c:if>>${list.itemDesc }</option>
						</enhance:out>
					</c:forEach>
				</c:if>
				<c:if test="${language == 'tc'}">
					<c:forEach var="list" items="${nationalityCN}">
						<enhance:out escapeXml="false"><option value="${list.itemCode }" <c:if test="${lifePersonalDetails.nationalty == list.itemCode}">selected="selected"</c:if>>${list.itemDesc }</option>
				</enhance:out>
			</c:forEach>
		</c:if>
	</select>

	<c:if test="${language == 'en'}">
		<c:forEach var="list" items="${nationalityEN}">
			<c:if test="${lifePersonalDetails.nationalty == list.itemCode}"><c:set var="nationaltyCode" value="${list.itemCode }"/></c:if>
		</c:forEach>
	</c:if>
	<c:if test="${language == 'tc'}">
		<c:forEach var="list" items="${nationalityCN}">
			<c:if test="${lifePersonalDetails.nationalty == list.itemCode}"><c:set var="nationaltyCode" value="${list.itemCode }"/></c:if>
		</c:forEach>
	</c:if>
	<input type="hidden" id="nationalty" name="nationalty" value="${nationaltyCode }"/>
	<img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg"></div>
	<span class="error-msg" id="nationalityErMsg"></span>
</div>
</div>
<div class="clearfix form-group has-error dob-content">
<!--<div class="left-desktop text-box et-date-info so-mdl-textfield is-focused is-dirty">
	<div class="selectDiv" id="date">
		<label class="mdl-textfield__label cstm-textfield-label" id="personal-info-label"><fmt:message key="placeholder.dob" bundle="${msg}"/></label>
		<input type="text" autocomplete="off" class="form-control gray-textbox" name="dob" id="so-calendar-dob" value="${plan == 'savings-insurance' ? savieFna.dob:ehPlanDetail.dob}" readonly="readonly"/>
		<img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg"></div>
		<span class="error-msg" id="so-calendar-dob-msg"></span>
	</div>-->
	<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield is-upgraded is-dirty is-not-active">
		<label class="mdl-textfield__label cstm-textfield-label" id="personal-info-label"><fmt:message key="placeholder.dob" bundle="${msg}"/></label>
		<input type="text" autocomplete="off" class="form-control gray-textbox" name="dob" id="so-calendar-dob" value="${plan == 'savings-insurance' ? savieFna.dob:ehPlanDetail.dobdmy}" readonly="readonly"/>
	</div>
	<span class="error-msg" id="so-calendar-dob-msg"></span>
</div>
</div>
<div class="col-sm-12 col-md-6 right">
	<div class="clearfix form-group has-error">
		<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
			<div class="clearfix form-group">
				<div class="residential-num">
					<input
						class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input cstm-number-field"
						id="residentialNo"
						name="residentialTelNo"
						value="${lifePersonalDetails.residentialTelNo }"
						type="text"
						autocomplete="off"
						maxlength="8"
						oninput="maxLengthCheck(this)"/>
					<label id="personal-info-label" class="mdl-textfield__label so-mdl-textfield-label" for="residentialNo"><fmt:message key="placeholder.residential.number" bundle="${msg}"/></label>
				</div>
			</div>
		</div>
		<span class="error-msg" id="resTelNoErMsg"></span>
	</div>
	<div class="clearfix form-group has-error">
		<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
			<div class="clearfix form-group">
				<div class="mobile-num">
					<input
						class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input cstm-number-field"
						id="mobileNo"
						name="mobileNumber"
						readonly="readonly"
						value="${userDetails.mobileNo }"
						type="text"
						autocomplete="off"
						maxlength="8"
						oninput="maxLengthCheck(this)"/>
					<label class="mdl-textfield__label so-mdl-textfield-label" id="personal-info-label" for="mobileNo"><fmt:message key="placeholder.mobileno" bundle="${msg}"/></label>
				</div>
			</div>
		</div>
		<span class="error-msg" id="mobileNoErMsg"></span>
	</div>
<div class="clearfix form-group has-error">
	<div class="left-desktop text-box">
		<div class="selectDiv">
			<label class="mdl-textfield__label mdl-textfield__label--select-box cstm-dropdown-label"><fmt:message key="placeholder.martial.status" bundle="${msg}"/></label>
			<select class="form-control gray-dropdown" name="tmpMaritalStatus" id="tmpMaritalStatus">
				<option value="" selected="selected" disabled="disabled"><fmt:message key="placeholder.martial.status" bundle="${msg}"/></option>
				<c:if test="${language == 'en'}">
					<c:forEach var="list" items="${maritalStatusesEN}"><option value="${list.itemCode }" <c:choose> <c:when test="${savieFna.marital_status == '0' && list.itemCode == 'MS1'}">selected="selected"</c:when>
					<c:when test="${savieFna.marital_status == '1' && list.itemCode == 'MS2'}">selected="selected"</c:when>
					<c:when test="${savieFna.marital_status == '2' && list.itemCode == 'MS3'}">selected="selected"</c:when>
					<c:when test="${savieFna.marital_status == '3' && list.itemCode == 'MS4'}">selected="selected"</c:when>
					<c:when test="${savieFna.marital_status == '4' && list.itemCode == 'MS5'}">selected="selected"</c:when>
					<c:when test="${lifePersonalDetails.martialStatus == list.itemCode}">selected="selected"</c:when>
					<c:otherwise></c:otherwise>
				</c:choose>
				>${list.itemDesc }</option>
		</c:forEach>
	</c:if>
	<c:if test="${language == 'tc'}">
		<c:forEach var="list" items="${maritalStatusesCN}"><option value="${list.itemCode }" <c:choose> <c:when test="${savieFna.marital_status == '0' && list.itemCode == 'MS1'}">selected="selected"</c:when>
		<c:when test="${savieFna.marital_status == '1' && list.itemCode == 'MS2'}">selected="selected"</c:when>
		<c:when test="${savieFna.marital_status == '2' && list.itemCode == 'MS3'}">selected="selected"</c:when>
		<c:when test="${savieFna.marital_status == '3' && list.itemCode == 'MS4'}">selected="selected"</c:when>
		<c:when test="${savieFna.marital_status == '4' && list.itemCode == 'MS5'}">selected="selected"</c:when>
		<c:when test="${lifePersonalDetails.martialStatus == list.itemCode}">selected="selected"</c:when>
		<c:otherwise></c:otherwise>
	</c:choose>
	>${list.itemDesc }</option>
	</c:forEach>
	</c:if>
	</select>

	<c:if test='${language == "en"}'>
	<c:forEach var="list" items="${maritalStatusesEN}">
	<c:choose>
	<c:when test="${savieFna.marital_status == '0' && list.itemCode == 'MS1'}"><c:set var="martialStatusCode" value="${list.itemCode }"/></c:when>
	<c:when test="${savieFna.marital_status == '1' && list.itemCode == 'MS2'}"><c:set var="martialStatusCode" value="${list.itemCode }"/></c:when>
	<c:when test="${savieFna.marital_status == '2' && list.itemCode == 'MS3'}"><c:set var="martialStatusCode" value="${list.itemCode }"/></c:when>
	<c:when test="${savieFna.marital_status == '3' && list.itemCode == 'MS4'}"><c:set var="martialStatusCode" value="${list.itemCode }"/></c:when>
	<c:when test="${savieFna.marital_status == '4' && list.itemCode == 'MS5'}"><c:set var="martialStatusCode" value="${list.itemCode }"/></c:when>
	<c:when test="${lifePersonalDetails.martialStatus == list.itemCode}"><c:set var="martialStatusCode" value="${list.itemCode }"/></c:when>
	<c:otherwise></c:otherwise>
	</c:choose>
	</c:forEach>
	</c:if>
	<c:if test="${language == 'tc'}">
	<c:forEach var="list" items="${maritalStatusesCN}">
	<c:choose>
	<c:when test="${savieFna.marital_status == '0' && list.itemCode == 'MS1'}"><c:set var="martialStatusCode" value="${list.itemCode }"/></c:when>
	<c:when test="${savieFna.marital_status == '1' && list.itemCode == 'MS2'}"><c:set var="martialStatusCode" value="${list.itemCode }"/></c:when>
	<c:when test="${savieFna.marital_status == '2' && list.itemCode == 'MS3'}"><c:set var="martialStatusCode" value="${list.itemCode }"/></c:when>
	<c:when test="${savieFna.marital_status == '3' && list.itemCode == 'MS4'}"><c:set var="martialStatusCode" value="${list.itemCode }"/></c:when>
	<c:when test="${savieFna.marital_status == '4' && list.itemCode == 'MS5'}"><c:set var="martialStatusCode" value="${list.itemCode }"/></c:when>
	<c:when test="${lifePersonalDetails.martialStatus == list.itemCode}"><c:set var="martialStatusCode" value="${list.itemCode }"/></c:when>
	<c:otherwise></c:otherwise>
	</c:choose>
	</c:forEach>
	</c:if>
	<input type="hidden" id="martialStatus" name="martialStatus" value="${martialStatusCode }"/>
	<img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg"></div>
	<span class="error-msg" id="maritalStatErMsg"></span>
	</div>
</div>
<div class="clearfix form-group has-error">
<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
<input class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input" id="emailAddress" name="emailAddress" value="${userDetails.emailAddress }" readonly="readonly" type="email"/>
<label class="mdl-textfield__label so-mdl-textfield-label" id="personal-info-label" for="emailAddress"><fmt:message key="placeholder.email" bundle="${msg}"/></label>
</div>
<span class="error-msg" id="emailErMsg"></span>
</div>
<div class="clearfix form-group has-error">
<span class="warning-note"><fmt:message key="placeholder.permanent.warning" bundle="${msg}"/></span>
<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
<input
class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input residential residential-chinese-input"
id="permanentAddress1"
name="permanetAddress1"
value="${lifePersonalDetails.permanetAddress1 }"
type="text"
autocomplete="off"
maxlength="29"/>
<label class="mdl-textfield__label so-mdl-textfield-label" for="permanentAddress1"><fmt:message key="placeholder.peraddress.line1" bundle="${msg}"/></label>
</div>
<span class="error-msg" id="permanentAddErMsg"></span>
<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield res-textfield-hidden">
<input
class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input residential residential-chinese-input res-additional hidden"
id="permanentAddress2"
name="permanetAddress2"
value="${lifePersonalDetails.permanetAddress2 }"
type="text"
autocomplete="off"
maxlength="29"/>
<label class="mdl-textfield__label so-mdl-textfield-label" for="permanentAddress2"><fmt:message key="placeholder.peraddress.line2" bundle="${msg}"/></label>
</div>
<span class="error-msg" id="permanentAdd2ErMsg"></span>
<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield res-textfield-hidden">
<input
class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input residential residential-chinese-input res-additional hidden"
id="permanentAddress3"
name="permanetAddress3"
value="${lifePersonalDetails.permanetAddress3 }"
type="text"
autocomplete="off"
maxlength="19"/>
<label class="mdl-textfield__label so-mdl-textfield-label" for="permanentAddress3"><fmt:message key="placeholder.peraddress.line3" bundle="${msg}"/></label>
</div>
<span class="error-msg" id="permanentAdd3ErMsg"></span>
<div class="left-desktop text-box res-additional hidden">
<div class="selectDiv">
<label class="mdl-textfield__label mdl-textfield__label--select-box cstm-dropdown-label"><fmt:message key="placeholder.address.district" bundle="${msg}"/></label>
<select class="form-control gray-dropdown" name="tmpPermanentDistrict" id="tmpPermanentDistrict">
<option value="" selected="selected" disabled="disabled"><fmt:message key="placeholder.address.district" bundle="${msg}"/></option>
<c:if test="${language == 'en'}">
<c:forEach var="list" items="${savieDistrictEN}">
	<enhance:out escapeXml="false"><option value="${list.itemCode }" <c:if test="${lifePersonalDetails.permanetAddressDistrict == list.itemCode}">selected="selected"</c:if>>${list.itemDesc }</option>
</enhance:out>
</c:forEach>
</c:if>
<c:if test="${language == 'tc'}">
<c:forEach var="list" items="${savieDistrictCN}">
<enhance:out escapeXml="false"><option value="${list.itemCode }" <c:if test="${lifePersonalDetails.permanetAddressDistrict == list.itemCode}">selected="selected"</c:if>>${list.itemDesc }</option>
</enhance:out>
</c:forEach>
</c:if>
</select>

<c:if test="${language == 'en'}">
<c:forEach var="list" items="${savieDistrictEN}">
<c:if test="${lifePersonalDetails.permanetAddressDistrict == list.itemCode}"><c:set var="permanetAddressDistrictCode" value="${list.itemCode }"/></c:if>
</c:forEach>
</c:if>
<c:if test="${language == 'tc'}">
<c:forEach var="list" items="${savieDistrictCN}">
<c:if test="${lifePersonalDetails.permanetAddressDistrict == list.itemCode}"><c:set var="permanetAddressDistrictCode" value="${list.itemCode }"/></c:if>
</c:forEach>
</c:if>
<input type="hidden" id="permanetAddressDistrict" name="permanetAddressDistrict" value="${permanetAddressDistrictCode }"/>
<img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg"></div>
<span class="error-msg" id="permanentDistrictErMsg"></span>
</div>
</div>
<div class="clearfix">
<div class="left-desktop check-box">
<div class="checkbox-section">
<div class="clearfix">
<div class="pull-left left-checkbox"><input type="checkbox" value="None" id="diffToPermanent" name="diffToPermanent" <c:if test="${lifePersonalDetails.diffToPermanent == 'None'}">checked="checked"</c:if>
onclick="return correspondenceCheckbox();" />
<label for="diffToPermanent"></label>
</div>
<div class="pull-left right-checkbox">
<span id="chkboxdiffToPermanentText" class="checkbox-text"><fmt:message key="label.diff.per.address" bundle="${msg}"/></span>
</div>
</div>
</div>
</div>
</div>
<div class="clearfix form-group has-error hidden" id="diffToPermanentShow">
<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
<input
class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input residential residential-chinese-input"
id="residentialAddress1"
name="residentialAddress1"
value="${lifePersonalDetails.residentialAddress1 }"
type="text"
autocomplete="off"
maxlength="29"/>
<label class="mdl-textfield__label so-mdl-textfield-label" for="residentialAddress1"><fmt:message key="placeholder.resaddress.line1" bundle="${msg}"/></label>
</div>
<span class="error-msg" id="residentialAddErMsg"></span>
<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
<input
class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input residential residential-chinese-input"
id="residentialAddress2"
name="residentialAddress2"
value="${lifePersonalDetails.residentialAddress2 }"
type="text"
autocomplete="off"
maxlength="29"/>
<label class="mdl-textfield__label so-mdl-textfield-label" for="residentialAddress2"><fmt:message key="placeholder.resaddress.line2" bundle="${msg}"/></label>
</div>
<span class="error-msg" id="residentialAdd2ErMsg"></span>
<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
<input
class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input residential residential-chinese-input"
id="residentialAddress3"
name="residentialAddress3"
value="${lifePersonalDetails.residentialAddress3 }"
type="text"
autocomplete="off"
maxlength="19"/>
<label class="mdl-textfield__label so-mdl-textfield-label" for="residentialAddress3"><fmt:message key="placeholder.resaddress.line3" bundle="${msg}"/></label>
</div>
<span class="error-msg" id="residentialAdd3ErMsg"></span>
<div class="left-desktop text-box">
<div class="selectDiv">
<label class="mdl-textfield__label cstm-dropdown-label"><fmt:message key="placeholder.address.district" bundle="${msg}"/></label>
<select class="form-control gray-dropdown" name="tmpResidentialDistrict" id="tmpResidentialDistrict">
<option value="" selected="selected" disabled="disabled"><fmt:message key="placeholder.address.district" bundle="${msg}"/></option>
<c:if test="${language == 'en'}">
<c:forEach var="list" items="${savieDistrictEN}">
<enhance:out escapeXml="false"><option value="${list.itemCode }" <c:if test="${lifePersonalDetails.residentialAddressDistrict == list.itemCode}">selected="selected"</c:if>>${list.itemDesc }</option>
</enhance:out>
</c:forEach>
</c:if>
<c:if test="${language == 'tc'}">
<c:forEach var="list" items="${savieDistrictCN}">
<enhance:out escapeXml="false"><option value="${list.itemCode }" <c:if test="${lifePersonalDetails.residentialAddressDistrict == list.itemCode}">selected="selected"</c:if>>${list.itemDesc }</option>
</enhance:out>
</c:forEach>
</c:if>
</select>

<c:if test="${language == 'en'}">
<c:forEach var="list" items="${savieDistrictEN}">
<c:if test="${lifePersonalDetails.residentialAddressDistrict == list.itemCode}"><c:set var="residentialAddressDistrictCode" value="${list.itemCode }"/></c:if>
</c:forEach>
</c:if>
<c:if test="${language == 'tc'}">
<c:forEach var="list" items="${savieDistrictCN}">
<c:if test="${lifePersonalDetails.residentialAddressDistrict == list.itemCode}"><c:set var="residentialAddressDistrictCode" value="${list.itemCode }"/></c:if>
</c:forEach>
</c:if>
<input type="hidden" id="residentialAddressDistrict" name="residentialAddressDistrict" value="${residentialAddressDistrictCode }"/>
<img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg"></div>
<span class="error-msg" id="residentialDistrictErMsg"></span>
</div>
</div>
<div class="clearfix">
<div class="left-desktop check-box">
<div class="checkbox-section">
<div class="clearfix">
<div class="pull-left left-checkbox"><input type="checkbox" value="None" id="diffToResidential" name="diffToResidential" <c:if test="${lifePersonalDetails.diffToResidential == 'None'}">checked="checked"</c:if>
onclick="return correspondenceCheckbox();" />
<label for="diffToResidential"></label>
</div>
<div class="pull-left right-checkbox">
<span id="chkboxDiffToResidentialText" class="checkbox-text"><fmt:message key="label.diff.resp.address.diff.resp.address" bundle="${msg}"/></span>
</div>
</div>
</div>
</div>
</div>
<div class="clearfix form-group has-error hidden" id="diffToResidentialShow">
<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
<input
class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input residential residential-chinese-input"
id="correspondenceAddress1"
name="correspondenceAddress1"
value="${lifePersonalDetails.correspondenceAddress1 }"
type="text"
autocomplete="off"
maxlength="29"/>
<label class="mdl-textfield__label so-mdl-textfield-label" for="correspondenceAddress1"><fmt:message key="placeholder.coraddress.line1" bundle="${msg}"/></label>
</div>
<span class="error-msg" id="correspondenceAddErMsg"></span>
<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
<input
class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input residential residential-chinese-input"
id="correspondenceAddress2"
name="correspondenceAddress2"
value="${lifePersonalDetails.correspondenceAddress2 }"
type="text"
autocomplete="off"
maxlength="29"/>
<label class="mdl-textfield__label so-mdl-textfield-label" for="correspondenceAddress2"><fmt:message key="placeholder.coraddress.line2" bundle="${msg}"/></label>
</div>
<span class="error-msg" id="correspondenceAdd2ErMsg"></span>
<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
<input
class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input residential residential-chinese-input"
id="correspondenceAddress3"
name="correspondenceAddress3"
value="${lifePersonalDetails.correspondenceAddress3 }"
type="text"
autocomplete="off"
maxlength="19"/>
<label class="mdl-textfield__label so-mdl-textfield-label" for="correspondenceAddress3"><fmt:message key="placeholder.coraddress.line3" bundle="${msg}"/></label>
</div>
<span class="error-msg" id="correspondenceAdd3ErMsg"></span>
<div class="left-desktop text-box">
<div class="selectDiv">
<label class="mdl-textfield__label cstm-dropdown-label"><fmt:message key="placeholder.address.district" bundle="${msg}"/></label>
<select class="form-control gray-dropdown" name="tmpCorrespondenceDistrict" id="tmpCorrespondenceDistrict">
<option value="" selected="selected" disabled="disabled"><fmt:message key="placeholder.address.district" bundle="${msg}"/></option>
<c:if test="${language == 'en'}">
<c:forEach var="list" items="${savieDistrictEN}">
<enhance:out escapeXml="false"><option value="${list.itemCode }" <c:if test="${lifePersonalDetails.correspondenceAddressDistrict == list.itemCode}">selected="selected"</c:if>>${list.itemDesc }</option>
</enhance:out>
</c:forEach>
</c:if>
<c:if test="${language == 'tc'}">
<c:forEach var="list" items="${savieDistrictCN}">
<enhance:out escapeXml="false"><option value="${list.itemCode }" <c:if test="${lifePersonalDetails.correspondenceAddressDistrict == list.itemCode}">selected="selected"</c:if>>${list.itemDesc }</option>
</enhance:out>
</c:forEach>
</c:if>
</select>

<c:if test="${language == 'en'}">
<c:forEach var="list" items="${savieDistrictEN}">
<c:if test="${lifePersonalDetails.correspondenceAddressDistrict == list.itemCode}"><c:set var="correspondenceAddressDistrictCode" value="${list.itemCode }"/></c:if>
</c:forEach>
</c:if>
<c:if test="${language == 'tc'}">
<c:forEach var="list" items="${savieDistrictCN}">
<c:if test="${lifePersonalDetails.correspondenceAddressDistrict == list.itemCode}"><c:set var="correspondenceAddressDistrictCode" value="${list.itemCode }"/></c:if>
</c:forEach>
</c:if>
<input type="hidden" id="correspondenceAddressDistrict" name="correspondenceAddressDistrict" value="${correspondenceAddressDistrictCode }"/>
<img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg"></div>
<span class="error-msg" id="correspondenceDistrictErMsg"></span>
</div>
</div>
</div>
</div>
<input type="hidden" id="is-chinese-address" name="is-chinese-address" value="N"/>

<%-- 2016memberID - start
<div class="row margin">
<div class="col-sm-12 col-md-12">
	<hr>
</div>
<div class="col-sm-12 col-md-6 left">
	<!-- checkbox --!>
	<script>
		$(document).ready(function() {
			$('#the-club-member-toggle').on('change', function() {
				if ($(this).is(':checked')) {
					$('#theClubMembershipNo').closest('.form-group').show();
				} else {
					$('#theClubMembershipNo').closest('.form-group').hide();
				}
			}).change();
		});
	</script>
	<div class="checkbox getclubmembershipid" style="margin-top: 20px; font-size: 14px;">
		<input type="checkbox" id="the-club-member-toggle" name="hasTheClubMembershipNo" value="None" />
		<label for="the-club-member-toggle">
			<img src="<%=request.getContextPath()%>/resources/images/partner_theclub.png" height="12" style="margin-bottom: 5px;"/>
			<span style="color: #ffa500; font-size:15px; vertical-align: text-bottom;"><fmt:message key="club.membership.confirm" bundle="${msg}" /></span>
		</label>
	</div>

	<div class="clearfix form-group has-error">
		<div class="left-desktop right-description">
			<label for="theClubMembershipNo" class="application-page-input-text et-input-label"></label>
		</div>
		<div class="left-desktop text-box">
			<!--errMsgs--!>
			<span class="text-red" id="errClubMemberID"></span><br>
			<span class="text-red" id="errClubMember8digit"></span>
			<!--inputBox--!>
			<div class="input-group left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label" style="display: inital; width: 100%;">
				<input type="text" id="theClubMembershipNo" name="theClubMembershipNo" class="form-control bmg_custom_placeholder gray-textbox check-emp login-input mdl-textfield__input" style="display: inline-block; width: 100%;" maxlength="10"/>
				<label class="mdl-textfield__label"><fmt:message key="club.membership.number" bundle="${msg}" /></label>
			</div>
			<!--links--!>
			<div class="getclubmembership" style="font-size: 14px;">
				<a href="<fmt:message key="theclub.register.link" bundle="${msg}" />" class="sub-link" target="_blank">
					<i>
						<fmt:message key="club.membership.join" bundle="${msg}" />
					</i>
				</a>
			</div>
		</div>
	</div>
	<%--<div class="form-group" style="margin-top: 0px; margin-bottom: 20px; display: none;">
		<div class="input-group left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label" style="display: inital; width: 100%;">
			<input type="text" id="theClubMembershipNo" name="theClubMembershipNo" class="form-control bmg_custom_placeholder gray-textbox check-emp login-input mdl-textfield__input" style="display: inline-block; width: 100%;" />
			<label class="mdl-textfield__label"><fmt:message key="club.membership.number" bundle="${msg}" /></label>
		</div>
	</div>--%>
	<%-- <!-- The Club Membership popup -->
	<div class="modal fade bs-theclub-modal-lg" tabindex="-1"
		role="dialog" aria-hidden="true" style="display: none;">
		<div class="modal-dialog modal-lg">
			<div class="modal-content plan-modal">
				<div class="login-form">
					<div style="overflow: hidden;">
						<a id="getPromotionClose" class="close" aria-label="Close"
							data-dismiss="modal"> <span aria-hidden="true"
							style="font-size: 30px;">�</span>
						</a>
					</div>
					<div class="form-container">
						<div class="row">
							<div class="col-xs-12">
								<p>
									<fmt:message key="homecare.club.membership.pop.up"
										bundle="${msg}" />
								</p>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-12">
								<p>
									<a
										href="<fmt:message key="theclub.register.link" bundle="${msg}" />"
										target="_blank"><fmt:message key="club.membership.join"
											bundle="${msg}" /></a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- The Club Membership popup --> --%>
	<script>
	function chkClubMember() {
		$(".errDue").html('');
		var flag = true;
		var the_club_member_check_box = document.getElementById("the-club-member-toggle").checked;
		var the_club_membership_no = document.getElementById("theClubMembershipNo").value;
		if (the_club_member_check_box) {
			if (the_club_membership_no == "<fmt:message key="club.membership.number" bundle="${msg}" />" || the_club_membership_no == "" || /^\s*$/.test(the_club_membership_no)) {
					$("#errClubMemberID").html("<fmt:message key="club.member.empty" bundle="${msg}" />");
					document.getElementById("theClubMembershipNo").focus();
					$("#theClubMembershipNo").addClass("invalid-field");

					flag = false;
			} else if (the_club_membership_no != "") {
				if(/^8/.test(the_club_membership_no) == false){
						$("#errClubMember8digit").html("<fmt:message key="club.member.firstdigit" bundle="${msg}" />");
						document.getElementById("theClubMembershipNo").focus();
						$("#theClubMembershipNo").addClass("invalid-field");
						flag = false;
				} else {
						$("#errClubMember8digit").html("");
				}
				if(/^[0-9]{10}$/.test(the_club_membership_no) == false){
						$("#errClubMemberID").html("<fmt:message key="club.member.digitchk" bundle="${msg}" />");
						document.getElementById("theClubMembershipNo").focus();
						$("#theClubMembershipNo").addClass("invalid-field");
						flag = false;
				}
			}
		}
		return flag;
}
</script>
</div>
</div>
<%-- 2016memberID - end --%>

<div class="next-btn">
<button id="et-personal-info-next" class="text-bold btn savie-common-btn applicant-btn"><fmt:message key="button.Next" bundle="${msg}"/></button>
<c:if test="${plan == 'savings-insurance'}">
<a href="#" class="link-btn" id="pd-save-con-later"><fmt:message key="label.save.and.continue.later" bundle="${msg}"/></a>
</c:if>
<button type="button" id="btn-back" class="text-bold btn hidden beneficiary-btn-back savie-common-btn"><fmt:message key="button.back.summary" bundle="${msg}"/></button>
</div>
</form>
</div>
</div>
</div>
</div>
<!-- FOOTER -->
</div>
<!-- Save and continue modal -->
<div class="modal fade common-welcome-modal" id="save-and-continue-modal" tabindex="-1" role="dialog">
<div class="modal-dialog">
<div class="modal-content save-con-modal-content">
<button type="button" class="close" data-dismiss="modal" aria-label="Close">
<span aria-hidden="true">x</span>
</button>
<h4 class="text-center welcome-msg"><fmt:message key="label.savie.save.continue.title1" bundle="${msg}"/></h4>
<p class="text-center description-msg"><fmt:message key="label.savie.save.continue.copy1" bundle="${msg}"/></p>
<div class="save-con-btns clearfix">
<button class="btn savie-common-btn save-exit-btn1 col-sm-6 col-xs-6 col-lg-6 col-md-6"><fmt:message key="button.keep.going" bundle="${msg}"/></button>
<button class="btn savie-common-btn save-exit-btn2 col-sm-6 col-xs-6 col-lg-6 col-md-6"><fmt:message key="button.save.and.exit" bundle="${msg}"/></button>
</div>
</div>
</div>
</div>
<!-- Save and continue batch 5 modal -->
<div class="modal fade common-welcome-modal save-con-modal-b5" id="save-and-continue-batch5-modal" tabindex="-1" role="dialog">
<div class="modal-dialog">
<div class="modal-content save-con-modal-content">
<button type="button" class="close" data-dismiss="modal" aria-label="Close">
<span aria-hidden="true">x</span>
</button>
<h4 class="text-center welcome-msg"><fmt:message key="label.savie.save.continue.title2" bundle="${msg}"/></h4>
<p class="text-center description-msg"><fmt:message key="label.savie.save.continue.copy2" bundle="${msg}"/></p>
<div class="save-con-btns clearfix">
<center>
<button class="btn savie-common-btn" id="keep-going-btn"><fmt:message key="button.keep.going" bundle="${msg}"/></button>
<button class="btn savie-common-btn disabled-gray-btn" id="save-exit-btn"><fmt:message key="button.save.and.exit" bundle="${msg}"/></button>
</center>
</div>
</div>
</div>
</div>
<!-- Application saved modal -->
<div class="modal fade common-welcome-modal modal-app-save" id="application-saved-modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
<div class="modal-dialog" id="modal-save-app">
<div class="modal-content modal-content-appsave common-welcome-modal">
<div class="modal-header" id="modal-header-appsave">
<button type="button" class="close" data-dismiss="modal" aria-label="Close">
<span aria-hidden="true">&times;</span>
</button>
<p class="text-center"><fmt:message key="label.saved.application.title" bundle="${msg}"/></p>
</div>
<div class="modal-body" id="moda-body-appsave">
<p class="text-center"><fmt:message key="label.saved.application.copy" bundle="${msg}"/></p>
<div class="btn-appsave">
<button href="#" class="center-block btn savie-common-btn" id="btn-app-save"><fmt:message key="button.backtohome" bundle="${msg}"/></button>
</div>
</div>
</div>
</div>
</div>
<!-- JS INCLUDES -->
<script type="text/javascript">
var language = "en";
var getpath = "<%=request.getContextPath()%>";

$(document).ready(function () {
	//$('#soInsuredInfoForm input').addClass('is-not-active');

	setSelectReadonly('tmpGender', true);
	setInputReadonly('so-calendar-dob', true);
	//setInputReadonly('residentialNo', true);
	setInputReadonly('mobileNo', true);

	if ('${plan }' == 'savings-insurance') {
		setSelectReadonly('tmpMaritalStatus', true);
	}

	if ('${plan }' == 'medical-insurance' && '${backSummary}' == "Y") {
		setStyleOfIsNotActive('hkId');
		setStyleOfIsNotActive('tmpPlaceOfBirth');
		setStyleOfIsNotActive('tmpNationality');
		setStyleOfIsNotActive('tmpMaritalStatus');
		setStyleOfIsNotActive('permanentAddress1');
		setStyleOfIsNotActive('tmpPermanentDistrict');
	}

	if ('${lifePersonalDetails.permanetAddress1}' != '') {
		if ($('.res-additional').hasClass('hidden')) {
			$('.res-additional').removeClass('hidden');
			$('.res-textfield-hidden').css("margin-bottom", "10px");
		}
	} else {}

	if ('${lifePersonalDetails.diffToPermanent}' == 'None') {
		if ($('#diffToPermanentShow').hasClass('hidden')) {
			$('#diffToPermanentShow').removeClass('hidden');
		}
	} else {
		$('#diffToPermanentShow').addClass('hidden');
	}

	if ('${lifePersonalDetails.diffToResidential}' == 'None') {
		if ($('#diffToResidentialShow').hasClass('hidden')) {
			$('#diffToResidentialShow').removeClass('hidden');
		}
	} else {
		$('#diffToResidentialShow').addClass('hidden');
	}

	soFormValidation();

	var dummy = true;
	if ('${backSummary}' == 'Y') {
		dummy = false;
	}
	//dummy condition for displaying the back / next button
	if (dummy) {
		// hide the back button and display the Next button
		$('.applicant-btn, .link-btn').removeClass('hidden');
		$('.beneficiary-btn-back').addClass('hidden');
	} else {
		// display the back button and hide the Next button
		$('.applicant-btn, .link-btn').addClass('hidden');
		$('.beneficiary-btn-back').removeClass('hidden');
	}

	$('.save-exit-btn1').click(function () {
		$('#save-and-continue-modal').modal('hide');
	});

	$('#keep-going-btn').click(function () {
		$('#save-and-continue-batch5-modal').modal('hide');
	});

	// application saved modal will show after clicking 'Save and exit' button no full fill type = 1
	$('.save-exit-btn2').click(function () {
		$("#errorMsg").html("");
		$.ajax({
			type: "POST",
			async: false,
			url: "<%=request.getContextPath()%>/ajax/savings-insurance/lifePersonalDetailsSaveforLater",
			data: $("#soInsuredInfoForm").serialize() + "&type=" + 1,
			success: function (data) {
				if (data != null && data.errorMsg != null && data.errorMsg != "") {
					$('#save-and-continue-modal').modal('hide');
					show_stack_bar_top(data.errorMsg);
				} else {
					$('#save-and-continue-modal').modal('hide');
					$('#application-saved-modal').modal('show');
					sendEmailForSaveLater("plan-details-sp?type=3");
				}
			}
		});
	});
	//full fill type = 2
	$('#save-exit-btn').click(function () {
		$("#errorMsg").html("");
		$.ajax({
			type: "POST",
			async: false,
			url: "<%=request.getContextPath()%>/ajax/savings-insurance/lifePersonalDetailsSaveforLater",
			data: $("#soInsuredInfoForm").serialize() + "&type=" + 2,
			success: function (data) {
				if (data != null && data.errorMsg != null && data.errorMsg != "") {
					$('#save-and-continue-batch5-modal').modal('hide');
					show_stack_bar_top(data.errorMsg);
				} else {
					$('#save-and-continue-batch5-modal').modal('hide');
					$('#application-saved-modal').modal('show');
					sendEmailForSaveLater("plan-details-sp?type=3");
				}
			}
		});
	});

	$('#btn-app-save').click(function () {
		window.location = '<%=request.getContextPath()%>/${language}/savings-insurance';
	});

	// on change
	$('#so-calendar-dob').on('changeDate show', function (e) {
		$(this).parent('.selectDiv').parent('.et-date-info').addClass('is-not-active');
		if ($(this).val() == '') {
			$(this).parent('.selectDiv').parent('.et-date-info').removeClass('is-not-active');
		}
		$('#soInsuredInfoForm').data('bootstrapValidator').updateStatus('dob', 'NOT_VALIDATED', null).validateField('dob');
	});

	$('.cstm-number-field').on('change', function () {
		$(this).parent().parent().parent('so-mdl-textfield').addClass('is-not-active');
		if ($(this).val() == '') {
			$(this).parent().parent().parent('so-mdl-textfield').removeClass('is-not-active');
		}
	})

	// on focus
	$('#so-calendar-dob').focus(function () {
		$(this).parent().parent().addClass('is-focused');
		$(this).closest('.is-not-active').find('label').attr('style', 'color: #ff8200 !important;');
	}).on('blur', function () {
		$(this).parent().parent().removeClass('is-focused');
		$(this).closest('.is-not-active').find('label').removeAttr('style');
	});

	$('.cstm-number-field').focus(function () {
		$(this).parent().parent().parent().removeClass('is-not-active');
	}).on('blur', function () {
		$(this).parent().parent().parent('.so-mdl-textfield').addClass('is-not-active');
		if ($(this).val() == '') {
			$(this).parent().parent().parent('.so-mdl-textfield').removeClass('is-not-active');
		}
	});

	// For displaying the lightbox save and continue later
	$('#pd-save-con-later').on('click', function (e) {
		if ($('#chineseName').val() == undefined) {
			$('#soInsuredInfoForm').data('bootstrapValidator').enableFieldValidators('chineseName', false);
		}
		$('#soInsuredInfoForm').data('bootstrapValidator').validateField('chineseName');
		if ($('#residentialNo').val() == undefined) {
			$('#soInsuredInfoForm').data('bootstrapValidator').enableFieldValidators('residentialTelNo', false);
		}
		$('#soInsuredInfoForm').data('bootstrapValidator').validateField('residentialTelNo');

		$('#soInsuredInfoForm').bootstrapValidator('validate');
		if ($('#soInsuredInfoForm').data('bootstrapValidator').isValid()) {
			$('#save-and-continue-batch5-modal').modal('show');
		} else {
			$('#save-and-continue-modal').modal('show');
		}
	});

	$('#chkboxdiffToPermanentText').on('click', function () {
		$('#diffToPermanent').click();
	});

	$('#chkboxDiffToResidentialText').on('click', function () {
		$('#diffToResidential').click();
	});

	//init next button text
	if ('${backSummary}' == "Y") {
		var htmlObj = document.getElementById('et-personal-info-next');
		htmlObj.innerHTML = 'Back to application summary';
	}
});

// detect IE browsers
if (msieversion() >= 9) {
	$('.selectDiv .gray-dropdown').addClass('ie-select');
	//fix for IE8 highlight blue when selected
	$('option').click(function () {
		$('select').blur();
	});
} else {
	$('.selectDiv .gray-dropdown').removeClass('ie-select');
}

$("#et-personal-info-next, #btn-back").click(function () {
	$('#soInsuredInfoForm').bootstrapValidator('validate');
	if ($('#soInsuredInfoForm').data('bootstrapValidator').isValid() && chkClubMember()) {
		/*if ( $('#gender-errormsg').hasClass('has-error') ) {
						$('#genderErMsg').find('.help-block').attr('style', 'display:block;');
					} else {
						$('#genderErMsg').find('.help-block').attr('style', 'display:none;');
					}*/
		$("#errorMsg").html("");
		$.ajax({
			type: "POST",
			async: false,
			url: "<%=request.getContextPath()%>/ajax/savings-insurance/lifePersonalDetails",
			data: $("#soInsuredInfoForm").serialize(),
			success: function (data) {
				if (data != null && data.errorMsg != null && data.errorMsg != "" && !$('#soInsuredInfoForm').data('bootstrapValidator').isValid()) {
					show_stack_bar_top(data.errorMsg);
				} else {
					if ('${backSummary}' == "Y") {
						window.location = '<%=request.getContextPath()%>/${language}/${nextPageFlow2}';
					} else {
						window.location = '<%=request.getContextPath()%>/${language}/${nextPageFlow}';
					}
				}
			}
		});
	}
});

//Applicant Info form validation
function soFormValidation() {
	$('#soInsuredInfoForm').bootstrapValidator({
		excluded: [
			':disabled', ':hidden', ':not(:visible)'
		],
		fields: {
			'firstname': {
				container: '#firstNameErMsg',
				validators: {
					notEmpty: {
						message: '<fmt:message key="error.given.name.empty" bundle="${msg}" />'
					},
					stringLength: {
						max: 25,
						message: "Given Name must be no more than 25 characters."
					},
					regexp: {
						regexp: /^[a-zA-Z\s]*$/,
						message: '<fmt:message key="error.given.name.invalid" bundle="${msg}" />'
					}
				}
			},
			'lastname': {
				container: '#lastNameErMsg',
				validators: {
					notEmpty: {
						message: '<fmt:message key="error.last.name.empty" bundle="${msg}" />'
					},
					stringLength: {
						max: 25,
						message: "Last Name must be no more than 25 characters."
					},
					regexp: {
						regexp: /^[a-zA-Z\s]*$/,
						message: '<fmt:message key="error.last.name.invalid" bundle="${msg}" />'
					}
				}
			},
			'chineseName': {
				container: '#chineseNameErMsg',
				validators: {
					regexp: {
						//regexp: /^[\s\u4e00-\u9eff]*$/,
						regexp: /^[\s\u4e00-\u9fa5]*$/,
						message: '<fmt:message key="error.chinese.name.invalid" bundle="${msg}" />'
					}<%-- ,
					remote: {
						message: '<fmt:message key="error.chinese.name.simplified" bundle="${msg}" />',
						url: "<%=request.getContextPath()%>/ajax/validateSimpleChinese",
						type: "get",
						dataType: "json",
						data: {
							str: function () {
								return $("#chineseName").val();
							}
						}
					} --%>
				}
			},
			'dob': {
				container: '#so-calendar-dob-msg',
				validators: {
					notEmpty: {
						message: '<fmt:message key="error.dob.empty" bundle="${msg}" />'
					}
				}
			},
			'tmpGender': {
				container: '#genderErMsg',
				validators: {
					notEmpty: {
						message: '<fmt:message key="error.gender.empty" bundle="${msg}" />'
					}
				}
			},
			'hkid': {
				container: '#hkidErMsg',
				//trigger: 'blur',
				validators: {
					notEmpty: {
						message: '<fmt:message key="error.hkid.empty" bundle="${msg}" />'
					},
					regexp: {
						regexp: /^[a-zA-Z0-9\-]*$/,
						message: '<fmt:message key="error.hkid.special.chars" bundle="${msg}" />'
					},
					callback: {
						message: '<fmt:message key="error.hkid.invalid" bundle="${msg}" />',
						callback: function (value, validator) {
							return isValidHKID(value);
						}
					}
				}
			},
			'tmpMaritalStatus': {
				container: '#maritalStatErMsg',
				validators: {
					notEmpty: {
						message: '<fmt:message key="error.martial.status" bundle="${msg}" />'
					}
				}
			},
			'tmpPlaceOfBirth': {
				container: '#placeOfBirthErMsg',
				validators: {
					notEmpty: {
						message: '<fmt:message key="error.place.of.birth.empty" bundle="${msg}" />'
					}
				}
			},
			'tmpNationality': {
				container: '#nationalityErMsg',
				validators: {
					notEmpty: {
						message: '<fmt:message key="error.nationality.empty" bundle="${msg}" />'
					}
				}
			},
			'residentialTelNo': {
				container: '#resTelNoErMsg',
				validators: {
					stringLength: {
						min: 8,
						max: 8,
						message: '<fmt:message key="error.residential.no.length" bundle="${msg}" />'
					},
					regexp: {
						regexp: /^1[0-9]{10}$|^[235689][0-9]{7}$/,
						message: '<fmt:message key="error.residential.no.invalid" bundle="${msg}" />'
					}
				}
			},
			'mobileNumber': {
				container: '#mobileNoErMsg',
				validators: {
					notEmpty: {
						message: '<fmt:message key="error.mobile.empty" bundle="${msg}" />'
					},
					stringLength: {
						min: 8,
						max: 8,
						message: "Please enter an 8-digit Mobile No."
					},
					regexp: {
						regexp: /^1[0-9]{10}$|^[5689][0-9]{7}$/,
						message: '<fmt:message key="error.mobile.invalid" bundle="${msg}" />'
					}
				}
			},
			'emailAddress': {
				container: '#emailErMsg',
				validators: {
					notEmpty: {
						message: '<fmt:message key="error.email.empty" bundle="${msg}" />'
					},
					regexp: {
						regexp: /^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/,
						message: '<fmt:message key="error.email.invalid" bundle="${msg}" />'
					}
				}
			},
			'permanetAddress1': {
				container: '#permanentAddErMsg',
				validators: {
					notEmpty: {
						message: '<fmt:message key="error.addr.empty" bundle="${msg}" />'
					},
					regexp: {
						regexp: /^[a-zA-Z0-9\s,-\/]*$/,
						//regexp: /^[a-zA-Z\s\u4e00-\u9fa5]*$/,
						message: '<fmt:message key="error.addr.invalid" bundle="${msg}" />'
					}
				}
			},
			'permanetAddress2': {
				container: '#permanentAdd2ErMsg',
				validators: {
					regexp: {
						regexp: /^[a-zA-Z0-9\s,-\/]*$/,
						//regexp: /^[a-zA-Z\s\u4e00-\u9fa5]*$/,
						message: '<fmt:message key="error.addr.invalid" bundle="${msg}" />'
					}
				}
			},
			'permanetAddress3': {
				container: '#permanentAdd3ErMsg',
				validators: {
					regexp: {
						regexp: /^[a-zA-Z0-9\s,-\/]*$/,
						//regexp: /^[a-zA-Z\s\u4e00-\u9fa5]*$/,
						message: '<fmt:message key="error.addr.invalid" bundle="${msg}" />'
					}
				}
			},
			'tmpPermanentDistrict': {
				container: '#permanentDistrictErMsg',
				validators: {
					notEmpty: {
						message: '<fmt:message key="error.district.empty" bundle="${msg}" />'
					}
				}
			},
			'residentialAddress1': {
				container: '#residentialAddErMsg',
				validators: {
					notEmpty: {
						message: '<fmt:message key="error.addr.empty" bundle="${msg}" />'
					},
					regexp: {
						regexp: /^[a-zA-Z0-9\s,-\/]*$/,
						//regexp: /^[a-zA-Z\s\u4e00-\u9fa5]*$/,
						message: '<fmt:message key="error.addr.invalid" bundle="${msg}" />'
					}
				}
			},
			'residentialAddress2': {
				container: '#residentialAdd2ErMsg',
				validators: {
					regexp: {
						regexp: /^[a-zA-Z0-9\s,-\/]*$/,
						//regexp: /^[a-zA-Z\s\u4e00-\u9fa5]*$/,
						message: '<fmt:message key="error.addr.invalid" bundle="${msg}" />'
					}
				}
			},
			'residentialAddress3': {
				container: '#residentialAdd3ErMsg',
				validators: {
					regexp: {
						regexp: /^[a-zA-Z0-9\s,-\/]*$/,
						//regexp: /^[a-zA-Z\s\u4e00-\u9fa5]*$/,
						message: '<fmt:message key="error.addr.invalid" bundle="${msg}" />'
					}
				}
			},
			'tmpResidentialDistrict': {
				container: '#residentialDistrictErMsg',
				validators: {
					notEmpty: {
						message: '<fmt:message key="error.district.empty" bundle="${msg}" />'
					}
				}
			},
			'correspondenceAddress1': {
				container: '#correspondenceAddErMsg',
				validators: {
					notEmpty: {
						message: '<fmt:message key="error.addr.empty" bundle="${msg}" />'
					},
					regexp: {
						regexp: /^[a-zA-Z0-9\s,-\/]*$/,
						//regexp: /^[a-zA-Z\s\u4e00-\u9fa5]*$/,
						message: '<fmt:message key="error.addr.invalid" bundle="${msg}" />'
					}
				}
			},
			'correspondenceAddress2': {
				container: '#correspondenceAdd2ErMsg',
				validators: {
					regexp: {
						regexp: /^[a-zA-Z0-9\s,-\/]*$/,
						//regexp: /^[a-zA-Z\s\u4e00-\u9fa5]*$/,
						message: '<fmt:message key="error.addr.invalid" bundle="${msg}" />'
					}
				}
			},
			'correspondenceAddress3': {
				container: '#correspondenceAdd3ErMsg',
				validators: {
					regexp: {
						regexp: /^[a-zA-Z0-9\s,-\/]*$/,
						//regexp: /^[a-zA-Z\s\u4e00-\u9fa5]*$/,
						message: '<fmt:message key="error.addr.invalid" bundle="${msg}" />'
					}
				}
			},
			'tmpCorrespondenceDistrict': {
				container: '#correspondenceDistrictErMsg',
				validators: {
					notEmpty: {
						message: '<fmt:message key="error.district.empty" bundle="${msg}" />'
					}
				}
			}
		}
	}).on('success.form.bv', function (e) {
		e.preventDefault();
	}).on('error.form.bv', function (e) {});
}

$('.chinese-input').bind('keypress', function (event) {
	var regex = new RegExp("/^[\s\u4e00-\u9fa5]*$/");
	var key = String.fromCharCode(!event.charCode
		? event.which
		: event.charCode);
	if (!regex.test(key)) {
		event.preventDefault();
		return false;
	}
});

function isChin(str) {
	return /^[\u4e00-\u9fa5]+$/.test(str);
}
$('.residential-chinese-input').on('change', function () {
	$('#is-chinese-address').val('N');
	$('.residential-chinese-input').each(function () {
		if (isChin($(this).val())) {
			$('#is-chinese-address').val('Y');
		}
	});
	console.log($('#is-chinese-address').val());
});
/*
search and change from folowing
	regexp: /^[a-zA-Z0-9\s,-\/]*$/,
	//regexp: /^[a-zA-Z\s\u4e00-\u9fa5]*$/,
to following
	//regexp: /^[a-zA-Z0-9\s,-\/]*$/,
	regexp: /^[a-zA-Z\s\u4e00-\u9fa5]*$/,
for Chinese Address

#is-chinese-address is the indicator for detect is Chinese Address or not(value: Y/N)
*/
</script>
</body>
</html>

<%-- <%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeQuoteBean"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<script type="text/javascript">
var context = "${pageContext.request.contextPath}";
</script>


	<div class="fwd-savie-wrapper fwd-evergreen-wrapper">
		<div class="container-fluid fwd-full-container">
			<div class="application-page-header et-header-browse">
				<div class="et-back-arrow hidden-xs hidden-sm">
					<a href="#" class="et-back-arrow-link">
						<span class="icon-arrow-left2 arrow-left"></span>
					</a>
			    </div>
				<div class="row reset-margin hidden-xs hidden-sm">
	                  <div class="col-md-4 reset-padding">
	                      <button type="button" class="et-header-info-btn et-bind-btn-header active" id="plan-detail" data-et-section-target="et-select-plan-section"><fmt:message key="stepindicator.plan_details" bundle="${msg}" /></button>
	                  </div>
	                  <div class="col-md-4 reset-padding">
	                      <button type="button" class="et-header-info-btn et-bind-btn-header no-hover" id="make-appointment" data-et-section-target="et-application-section"><fmt:message key="stepindicator.appointment" bundle="${msg}" /></button>
	                  </div>
	                  <div class="col-md-4 reset-padding">
	                      <button type="button" class="et-header-info-btn et-bind-btn-header no-hover" id="confirmation" data-et-section-target="et-dec-sign-section"><fmt:message key="stepindicator.confirmation" bundle="${msg}" /></button>
	                  </div>
	            		</div>
				<div class="et-mobile-header-info hidden-md hidden-lg">
					<div class="clearfix">
						<div class="et-back-arrow">
							<a href="#" class="et-back-arrow-link">
								<span class="icon-arrow-left2 arrow-left"></span>
							</a>
						</div>
						<div class="et-header-tex">
							<h3 id="et-active-section-label"><fmt:message key="section.header.plan_details" bundle="${msg}" /></h3>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="page-sales-illustration application-flux">
			<span id="username" data-userid="<%=session.getAttribute("username")%>"></span>

			<!--Sales Illustration Block-->
			<div class="fwd-container container-fluid hidden-xs hidden-sm clearfix">
				<div class="breadcrumbs pull-left">
					<ol class="breadcrumb breadcrumbs-product-details breadcrumbs-landing">
						<li><a href="#"><fmt:message key="breadcrumb.savie.category" bundle="${msg}" /></a></li>
						<li class="divider"><i class="fa fa-play"></i></li>
						<li><a href="#"><fmt:message key="breadcrumb.savie.product" bundle="${msg}" /></a></li>
						<li class="divider last"><i class="fa fa-play"></i></li>
						<li class="active-bc"><fmt:message key="breadcrumb.savie.plan_details" bundle="${msg}" /></li>
					</ol>
				</div>
				<!--  <div id="questions" class="text-center pull-right">
					<img src="<%=request.getContextPath()%>/resources/images/savie/question.png">
					<a href="${nextPageFlow}">
						<div class="right">
							<h3><fmt:message key="savie.planDetails.Questions" bundle="${msg}" /></h3> <p><fmt:message key="savie.planDetails.Talk.us" bundle="${msg}" /><i class="glyphicon glyphicon-play"></i></p>
						</div>
					</a>
				</div>
				-->
			</div>

			<div class="fwd-full-container container-fluid text-center sales-head">
				<h1><fmt:message key="section.header.plan_details" bundle="${msg}" /></h1>
			</div>

			<div id="illustration-filters" class="fwd-full-container container-fluid">

				<form class="fwd-container-limit">
				    <input type="hidden" id="language" value="${language }"/>
					<div id="triangle"></div>
					<img class="money" src="<%=request.getContextPath()%>/resources/images/savie/money-logo.png">
					<div id="investment-amount">
						<div id="desktop-left">
							<h3 class="saving"><fmt:message key="saviee.planoption.oneoff.premium.amount" bundle="${msg}" /><!--<button type="button" class="info-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="<fmt:message key="tooltips.savie.premium" bundle="${msg}" />"></button>--></h3>

							<h3 class="pull-right total"><span id="range">${formatSavingAmount != null && formatSavingAmount != '' ? formatSavingAmount : '200,000'}</span></h3>
							<label id="hkd" class="pull-right total"><fmt:message key="saviee.planoption.q1.currency" bundle="${msg}" /></label>

							<input type="text" autocomplete="off" class="span2" name="amount" value="" data-slider-min="30000" data-slider-max="400000" data-slider-step="1000" data-slider-value="${savingAmount != null && savingAmount != '' ? savingAmount : '200000'}" data-slider-id="RC" id="R" data-slider-tooltip="hide" data-slider-handle="square" />

							<div id="left" class="pull-left">
								<p><fmt:message key="saviee.planoption.q1.min" bundle="${msg}" /></p>
								<p>$30,000</p>
							</div>

							<div id="right" class="pull-right">
								<p><fmt:message key="saviee.planoption.q1.max" bundle="${msg}" /></p>
								<p>$400,000</p>
							</div>
						</div>

						<div id="desktop-right">
							<img class="promo-code hidden-xs hidden-sm" src="<%=request.getContextPath()%>/resources/images/savie/bday-icon.png">
							<h2 id="promo"><fmt:message key="saviee.planoption.dob" bundle="${msg}" /><!--
								<button type="button" class="info-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="<fmt:message key="savie.planDetails.birth.above" bundle="${msg}" />"></button>-->
							</h2>
							<div id="birthday">
							<!--
								<div class="hidden-md hidden-lg">
									<input placeholder="yyyy-mm-dd" type="date" name="mobile-date" id="mobile-date" value="${savingDob!=null ? savingDob:defaultDOB }"/>
								</div>
								hidden-xs hidden-sm
								 -->
								<div class="input-group input-append date" id="datePicker">
									<input type="text" autocomplete="off" class="date" value="${savingDob!=null ? savingDob:defaultDOB }" name="dob" id="sales-illu-dob" placeholder="" readonly />
									<span class="input-group-addon add-on"><img class="arrow" src="<%=request.getContextPath()%>/resources/images/savie/arrow-down.png"></span>
								</div>
								<span class="error-msg-dob hideSpan" id="promo-code-dateOfBirth"><fmt:message key="savie.planDetails.birth.above" bundle="${msg}" /></span>
								<span class="error-msg-promo hideSpan" id="promo-code-dateOfBirthEmpty"><fmt:message key="savie.planDetails.birth.empty" bundle="${msg}" /></span>
							</div>
						</div>

					  <!--  <p id="crediting-rate"><fmt:message key="savie.planDetails.Guaranteed.rate" bundle="${msg}" /></p>-->
					</div>

					<div id="information">
						<div id="pictures">
							<img id="birthday" src="<%=request.getContextPath()%>/resources/images/savie/promo-img.png">
						</div>

						<h2><fmt:message key="saviee.planoption.promocode" bundle="${msg}" /><!--
							<button type="button" class="info-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="<fmt:message key="tooltips.savie.promo_code" bundle="${msg}" />"></button>-->
						</h2>
						<input value="${savingPromocode }" name="promocode" type="text" autocomplete="off" placeholder="<fmt:message key="saviee.planoption.promocode.placeholder" bundle="${msg}" />" class="promocode" id="promocode">
						<span class="error-msg-promo hideSpan" id="promo-code-errmsg">Invalid promo code. Try again?</span>
					</div>
					<div class="apply">
						<button onclick='getSaviePlanDetails()' class="btn btn-orange calculate" type="button" id="sales-illu-apply-now"><fmt:message key="saviee.planoption.calculate.button" bundle="${msg}" /><span class="icon icon-chevron-thin-right"></span></button>
					</div>
				</form>
			</div>

			<!-- Investment Summary and Table Block-->
			<div class="fwd-full-container container-fluid investment">
				<div class="fwd-container-limit investment-summary-and-table">
					<div id="sales-contents" class="tab-content credits">
	                    <div>
	                        <div class="container-fluid summary-tab-max-width">
	                            <div class="investment-table-desktop">
	                                <h2><fmt:message key="savie.planDetails.Summary" bundle="${msg}" /><!--
	                                	<button type="button" class="btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="savie.planDetails.Summary.tooltips">
	                                		<img src="<fmt:message key="savie.planDetails.info-image" bundle="${msg}" />">
	                                	</button>-->
	                                </h2>
	                                <h3><fmt:message key="saviee.planoption.summarytable1.first3years" bundle="${msg}" /></h3>
	                                <h3 class="desktop-right"><fmt:message key="savie.planDetails.End.of.3rd.years.part1" bundle="${msg}" /><span id="3rd_policy_year">0</span><fmt:message key="savie.planDetails.End.of.3rd.years.part2" bundle="${msg}" /></h3>
	                            </div>
	                            <div class="rate-table">
	                                <table class="table table-hover">
	                                    <thead>
	                                    <tr>
	                                        <th class="left-border">
	                                        	<button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="<fmt:message key="savie.planDetails.End.of.policy.year.tooltips" bundle="${msg}" />"></button><fmt:message key="saviee.planoption.summarytable1.col1" bundle="${msg}" />
	                                        </th>
	                                        <th class="desktop-only"><fmt:message key="saviee.planoption.summarytable1.col2" bundle="${msg}" /></th>
	                                        <th class="premium">
	                                           	<button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="<fmt:message key="savie.planDetails.Total.paid.tooltips" bundle="${msg}" />"></button><fmt:message key="saviee.planoption.summarytable1.col3" bundle="${msg}" />
	                                        </th>
	                                        <th class="desktop-only">
	                                        	<button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="<fmt:message key="savie.planDetails.Account.value.tooltips" bundle="${msg}" />"></button><fmt:message key="saviee.planoption.summarytable1.col4" bundle="${msg}" />
	                                        </th>
	                                        <th class="right-border">
	                                        	<button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="<fmt:message key="savie.planDetails.Surrender.benefit.tooltips" bundle="${msg}" />"></button><fmt:message key="saviee.planoption.summarytable1.col5" bundle="${msg}" />
	                                        </th>
	                                    </tr>
	                                    </thead>
	                                    <tbody>
                                            <tr>    <td class="left-border">1</td>  <td class="black-text desktop-only" id="credit-rate-change-1"><span>3%</span></td>   <td class="black-text" id="premium-1"><span>$</span> 0</td> <td class="black-text desktop-only" id="account-value-1"><span>$</span> 0</td>    <td class="black-text right-border" id="surrender-1"><span>$</span> 0</td>    </tr>
                                            <tr>    <td class="left-border">2</td>  <td class="black-text desktop-only" id="credit-rate-change-2"><span>3%</span></td>   <td class="black-text" id="premium-2"><span>$</span> 0</td> <td class="black-text desktop-only" id="account-value-2"><span>$</span> 0</td>    <td class="black-text right-border" id="surrender-2"><span>$</span> 0</td>    </tr>
                                            <tr class="bottom-border">  <td class="left-border">3</td>  <td class="black-text desktop-only" id="credit-rate-change-3"><span>3.3%</span></td>   <td class="black-text" id="premium-3"><span>$</span> 0</td> <td class="black-text desktop-only" id="account-value-3"><span>$</span> 0</td>    <td class="black-text right-border" id="surrender-3"><span>$</span> 0</td>    </tr>
	                                    </tbody>
	                                </table>
	                            </div>
	                        </div>
	                    </div>
	                    <div>

	                   		<div class="after-3-years-btn" id="after-3-years-div">
								<button type="button" class="btn btn-white see-more" id="see-more-3-years"><fmt:message key="savie.planDetails.SeeMoreAfter3Years" bundle="${msg}" /></button>
							</div>

	                        <div class="container-fluid summary-tab-max-width hidden" id="after-3-years">
	                            <div class="investment-summary-title-desktop">
	                                <div class="row percent-buttons" >
										<div class="col-md-6 col-xs-12 after-year-three">
	                                        <h3><fmt:message key="savie.planDetails.After.year" bundle="${msg}" /></h3>
											<p class="hidden-xs hidden-sm"><fmt:message key="savie.planDetails.Choose.to.stay" bundle="${msg}" /></p>
											<p class="hidden-md hidden-lg text-center"><fmt:message key="savie.planDetails.Choose.to.stay" bundle="${msg}" /></p>
											<p class="hidden-md hidden-lg text-center"><fmt:message key="savie.planDetails.Check.rate" bundle="${msg}" /></p>
	                                    </div>
	                                    <div class="col-md-6 col-xs-12 fwd-chart-col">
	                                        <div class="clearfix right-side">
	                                        	<div class="check-rate-box text-right hidden-xs hidden-sm">
		                                            <fmt:message key="savie.planDetails.Check.rate" bundle="${msg}" />
		                                        </div>
		                                        <div>
		                                            <div class="left-side chart-button-left">
		                                                <button id="rate-0" type="button">0%</button>
		                                            </div>
		                                            <div class="left-side chart-button-left">
		                                                <button id="rate-2" type="button" >2%</button>
		                                            </div>
		                                            <div class="left-side chart-button-right">
		                                                <button id="rate-3" class="active" type="button">3%</button>
		                                            </div>
		                                            <div class="left-side chart-button-right">
		                                                <button id="rate-4" type="button">4%</button>
		                                            </div>
		                                        </div>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                     <!--   <div class="investment-summary">
									<div id="illustration-chart"></div>
									<div class="drag-more">
										<div>
											<span class="drag-more-text"><fmt:message key="savie.planDetails.Drag.to" bundle="${msg}" /><br /><fmt:message key="savie.planDetails.view.more" bundle="${msg}" /> <span class="glyphicon glyphicon-play"></span></span>
										</div>
									</div>
	                            </div>-->

	                            <div id="rate-table-0" class="rate-table">
	                                <table class="table table-hover">
	                                    <thead>
	                                    <tr>
	                                        <th class="left-border"><button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="<fmt:message key="savie.planDetails.End.of.policy.year.tooltips" bundle="${msg}" />"></button><fmt:message key="saviee.planoption.summarytable1.col1" bundle="${msg}" /></th>
											<th class="credit-rate desktop-only"><fmt:message key="saviee.planoption.summarytable1.col2" bundle="${msg}" /></th>
	                                        <th class="premium"><button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="<fmt:message key="savie.planDetails.Total.paid.tooltips" bundle="${msg}" />"></button><fmt:message key="saviee.planoption.summarytable1.col3" bundle="${msg}" /></th>
	                                        <th class="desktop-only"><button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="<fmt:message key="savie.planDetails.Account.value.tooltips" bundle="${msg}" />"></button><fmt:message key="saviee.planoption.summarytable1.col4" bundle="${msg}" /></th>
	                                        <th class="right-border"><button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="<fmt:message key="savie.planDetails.Surrender.benefit.tooltips" bundle="${msg}" />"></button><fmt:message key="saviee.planoption.summarytable1.col5" bundle="${msg}" /></th>
	                                    </tr>
	                                    </thead>
	                                    <tbody>
	                                        <tr>
												<td class="left-border" id='policy-year-0-1'>5</td>
												<td class="black-text desktop-only" id="credit-rate-0-1">0%</td>
												<td class="black-text" id="premium-change-0-1"><span>$</span> 0</td>
												<td class="black-text desktop-only" id="account-value-change-0-1"><span>$</span> 0</td>
												<td class="black-text right-border" id="surrender-change-0-1"><span>$</span> 0</td>
											</tr>
	                                        <tr>
												<td class="left-border" id='policy-year-0-2'>10</td>
												<td class="black-text desktop-only" id="credit-rate-0-2">0%</td>
												<td class="black-text" id="premium-change-0-2"><span>$</span> 0</td>
												<td class="black-text desktop-only" id="account-value-change-0-2"><span>$</span> 0</td>
												<td class="black-text right-border" id="surrender-change-0-2"><span>$</span> 0</td>
											</tr>
	                                        <tr class="bottom-border">
												<td class="left-border" id='policy-year-0-3'><fmt:message key="savie.planDetails.Age.100" bundle="${msg}" /></td>
												<td class="black-text desktop-only" id="credit-rate-0-3">0%</td>
												<td class="black-text" id="premium-change-0-3"><span>$</span> 0</td>
												<td class="black-text desktop-only" id="account-value-change-0-3"><span>$</span> 0</td>
												<td class="black-text right-border" id="surrender-change-0-3"><span>$</span> 0</td>
												</tr>
	                                    </tbody>
	                                </table>
	                            </div>

	                            <div id="rate-table-2" class="rate-table">
	                                <table class="table table-hover">
	                                    <thead>
	                                    <tr>
	                                        <th class="left-border"><button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="<fmt:message key="savie.planDetails.End.of.policy.year.tooltips" bundle="${msg}" />"></button><fmt:message key="saviee.planoption.summarytable1.col1" bundle="${msg}" /></th>
											<th class="credit-rate desktop-only"><fmt:message key="saviee.planoption.summarytable1.col2" bundle="${msg}" /></th>
	                                        <th class="premium"><button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="<fmt:message key="savie.planDetails.Total.paid.tooltips" bundle="${msg}" />"></button><fmt:message key="saviee.planoption.summarytable1.col3" bundle="${msg}" /></th>
	                                        <th class="desktop-only"><button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="<fmt:message key="savie.planDetails.Account.value.tooltips" bundle="${msg}" />"></button><fmt:message key="saviee.planoption.summarytable1.col4" bundle="${msg}" /></th>
	                                        <th class="right-border"><button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="<fmt:message key="savie.planDetails.Surrender.benefit.tooltips" bundle="${msg}" />"></button><fmt:message key="saviee.planoption.summarytable1.col5" bundle="${msg}" /></th>
	                                    </tr>
	                                    </thead>
	                                    <tbody>
	                                        <tr>
												<td class="left-border" id='policy-year-2-1'>5</td>
												<td class="black-text desktop-only" id="credit-rate-2-1">2%</td>
												<td class="black-text" id="premium-change-2-1"><span>$</span> 0</td>
												<td class="black-text desktop-only" id="account-value-change-2-1"><span>$</span> 0</td>
												<td class="black-text right-border" id="surrender-change-2-1"><span>$</span> 0</td>
											</tr>
	                                        <tr>
												<td class="left-border" id='policy-year-2-2'>10</td>
												<td class="black-text desktop-only" id="credit-rate-2-2">2%</td>
												<td class="black-text" id="premium-change-2-2"><span>$</span> 0</td>
												<td class="black-text desktop-only" id="account-value-change-2-2"><span>$</span> 0</td>
												<td class="black-text right-border" id="surrender-change-2-2"><span>$</span> 0</td>
											</tr>
	                                        <tr class="bottom-border">
												<td class="left-border" id='policy-year-2-3'><fmt:message key="savie.planDetails.Age.100" bundle="${msg}" /></td>
												<td class="black-text desktop-only" id="credit-rate-2-3">2%</td>
												<td class="black-text" id="premium-change-2-3"><span>$</span> 0</td>
												<td class="black-text desktop-only" id="account-value-change-2-3"><span>$</span> 0</td>
												<td class="black-text right-border" id="surrender-change-2-3"><span>$</span> 0</td>
												</tr>
	                                    </tbody>
	                                </table>
	                            </div>

	                            <div id="rate-table-3" class="rate-table">
	                                <table class="table table-hover">
	                                    <thead>
	                                    <tr>
	                                        <th class="left-border"><button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="<fmt:message key="savie.planDetails.End.of.policy.year.tooltips" bundle="${msg}" />"></button><fmt:message key="saviee.planoption.summarytable1.col1" bundle="${msg}" /></th>
											<th class="credit-rate desktop-only"><fmt:message key="saviee.planoption.summarytable1.col2" bundle="${msg}" /></th>
	                                        <th class="premium"><button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="<fmt:message key="savie.planDetails.Total.paid.tooltips" bundle="${msg}" />"></button><fmt:message key="saviee.planoption.summarytable1.col3" bundle="${msg}" /></th>
	                                        <th class="desktop-only"><button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="<fmt:message key="savie.planDetails.Account.value.tooltips" bundle="${msg}" />"></button><fmt:message key="saviee.planoption.summarytable1.col4" bundle="${msg}" /></th>
	                                        <th class="right-border"><button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="<fmt:message key="savie.planDetails.Surrender.benefit.tooltips" bundle="${msg}" />"></button><fmt:message key="saviee.planoption.summarytable1.col5" bundle="${msg}" /></th>
	                                    </tr>
	                                    </thead>
	                                    <tbody>
	                                        <tr>
												<td class="left-border" id='policy-year-3-1'>5</td>
												<td class="black-text desktop-only" id="credit-rate-3-1">3%</td>
												<td class="black-text" id="premium-change-3-1"><span>$</span> 0</td>
												<td class="black-text desktop-only" id="account-value-change-3-1"><span>$</span> 0</td>
												<td class="black-text right-border" id="surrender-change-3-1"><span>$</span> 0</td>
											</tr>
	                                        <tr>
												<td class="left-border" id='policy-year-3-2'>10</td>
												<td class="black-text desktop-only" id="credit-rate-3-2">3%</td>
												<td class="black-text" id="premium-change-3-2"><span>$</span> 0</td>
												<td class="black-text desktop-only" id="account-value-change-3-2"><span>$</span> 0</td>
												<td class="black-text right-border" id="surrender-change-3-2"><span>$</span> 0</td>
											</tr>
	                                        <tr class="bottom-border">
												<td class="left-border" id='policy-year-3-3'><fmt:message key="savie.planDetails.Age.100" bundle="${msg}" /></td>
												<td class="black-text desktop-only" id="credit-rate-3-3">3%</td>
												<td class="black-text" id="premium-change-3-3"><span>$</span> 0</td>
												<td class="black-text desktop-only" id="account-value-change-3-3"><span>$</span> 0</td>
												<td class="black-text right-border" id="surrender-change-3-3"><span>$</span> 0</td>
												</tr>
	                                    </tbody>
	                                </table>
	                            </div>

	                            <div id="rate-table-4" class="rate-table">
	                                <table class="table table-hover">
	                                    <thead>
	                                    <tr>
	                                        <th class="left-border"><button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="<fmt:message key="savie.planDetails.End.of.policy.year.tooltips" bundle="${msg}" />"></button><fmt:message key="saviee.planoption.summarytable1.col1" bundle="${msg}" /></th>
											<th class="credit-rate desktop-only"><fmt:message key="saviee.planoption.summarytable1.col2" bundle="${msg}" /></th>
	                                        <th class="premium"><button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="<fmt:message key="savie.planDetails.Total.paid.tooltips" bundle="${msg}" />"></button><fmt:message key="saviee.planoption.summarytable1.col3" bundle="${msg}" /></th>
	                                        <th class="desktop-only"><button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="<fmt:message key="savie.planDetails.Account.value.tooltips" bundle="${msg}" />"></button><fmt:message key="saviee.planoption.summarytable1.col4" bundle="${msg}" /></th>
	                                        <th class="right-border"><button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="<fmt:message key="savie.planDetails.Surrender.benefit.tooltips" bundle="${msg}" />"></button><fmt:message key="saviee.planoption.summarytable1.col5" bundle="${msg}" /></th>
	                                    </tr>
	                                    </thead>
	                                    <tbody>
	                                        <tr>
												<td class="left-border" id='policy-year-4-1'>5</td>
												<td class="black-text desktop-only" id="credit-rate-4-1">4%</td>
												<td class="black-text" id="premium-change-4-1"><span>$</span> 0</td>
												<td class="black-text desktop-only" id="account-value-change-4-1"><span>$</span> 0</td>
												<td class="black-text right-border" id="surrender-change-4-1"><span>$</span> 0</td>
											</tr>
	                                        <tr>
												<td class="left-border" id='policy-year-4-2'>10</td>
												<td class="black-text desktop-only" id="credit-rate-4-2">4%</td>
												<td class="black-text" id="premium-change-4-2"><span>$</span> 0</td>
												<td class="black-text desktop-only" id="account-value-change-4-2"><span>$</span> 0</td>
												<td class="black-text right-border" id="surrender-change-4-2"><span>$</span> 0</td>
											</tr>
	                                        <tr class="bottom-border">
												<td class="left-border" id='policy-year-4-3'><fmt:message key="savie.planDetails.Age.100" bundle="${msg}" /></td>
												<td class="black-text desktop-only" id="credit-rate-4-3">4%</td>
												<td class="black-text" id="premium-change-4-3"><span>$</span> 0</td>
												<td class="black-text desktop-only" id="account-value-change-4-3"><span>$</span> 0</td>
												<td class="black-text right-border" id="surrender-change-4-3"><span>$</span> 0</td>
												</tr>
	                                    </tbody>
	                                </table>
	                            </div>


	                        </div>
	                    </div>
					</div>
				</div>
			</div>

			<!-- Login, create account, Proceed buttons -->
			<div class="fwd-container container-fluid proceed-block text-center">
				<!--<h2><fmt:message key="savie.planDetails.login.create" bundle="${msg}" /></h2> -->
				<button id="create-account" type="button" class="btn btn-orange proceed-btn"><fmt:message key="saviee.planoption.createaccount.button" bundle="${msg}" /></button>
				<button id="proceed" type="button" class="btn btn-orange proceed-btn hidden" onclick="goServiceCenter();"><fmt:message key="saviee.planoption.proceed" bundle="${msg}" /></button>
				<div class="login-holder">
					<p><fmt:message key="saviee.planoption.login.1" bundle="${msg}" /></p>
					<button id="made-decision-next-btn" type="button" class="login-button"><fmt:message key="saviee.planoption.login.2" bundle="${msg}" /></button>
					<p><fmt:message key="saviee.planoption.login.3" bundle="${msg}" /></p>
				</div>
 			</div>

			</div>

			<!--Explanation Block-->
			<div class="fwd-container container-fluid reset-padding explanation-block">
				<button class="btn btn-gray explanation-button" type="button" data-toggle="collapse" data-target="#collapseExplanation" aria-expanded="false" aria-controls="collapseExplanation" id="explanation-button">
					<fmt:message key="savie.planDetails.Explanation" bundle="${msg}" />
				</button>
				<span class="explanation"><fmt:message key="savie.planDetails.Explanation" bundle="${msg}" /></span>
				<div class="collapse" id="collapseExplanation">
					<ul class="explanation-list">
						<li class="explanation-li">
							<p class="expl-txt"><fmt:message key="savie.planDetails.context1" bundle="${msg}" /></p>
						</li>
						<li class="explanation-li">
							<p class="expl-txt"><fmt:message key="savie.planDetails.context3" bundle="${msg}" /></p>
						</li>
						<li class="explanation-li">
							<p class="expl-txt"><fmt:message key="savie.planDetails.context2" bundle="${msg}" /></p>
						</li>
					</ul>
				</div>
			</div>

			<!-- <a href="#" id="gotop" class="go-top go-top-default"><img src="<%=request.getContextPath()%>/resources/images/savie/back-to-top.png"></a>-->

			<!-- Thank you -->
			<div class="modal fade thank-you-modal" id="thankYouModal" role="dialog" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content thank-you-content">
						<img src="<%=request.getContextPath()%><fmt:message key="savie.planDetails.thank.you.image.desktop" bundle="${msg}" />" class="img-responsive hidden-xs">
						<img src="<%=request.getContextPath()%><fmt:message key="savie.planDetails.thank.you.image.mobile" bundle="${msg}" />" class="img-responsive visible-xs">
						<button id="thank-you-continue" class="btn next" onclick="goServiceCenter();"><fmt:message key="savie.planDetails.thank.you.btn.text" bundle="${msg}" /></button>
					</div>
				</div>
			</div>

			<!-- AJAX loading mask -->
			<div class="loading-mask">
				<div class="content">
					<img src="<%=request.getContextPath()%>/resources/images/savie/iFWD_O2O_payment-in-progress.gif" class="img-responsive">
				</div>
			</div>
	</div>




		<!--For Sales Illustration page js-->
		<script src="<%=request.getContextPath()%>/resources/js/savie/bootstrap-slider.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/savie/highcharts.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/savie/fwd-chart.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/savie/savie.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/vendor/bootstrap-datepicker.min.js"></script>
		<script type="text/javascript">
		        $(function() {
				$('#datePicker').datepicker({
					format: "dd-mm-yyyy",
					startDate: '${startDOB }',
					endDate: '${defaultDOB }',
					autoclose: true,
					startView: 2
				});

				$('#see-more-3-years').click(function(){
					$('#after-3-years-div').addClass('hidden');
					$('#after-3-years').removeClass('hidden');

					$('#rate-table-0').addClass('hidden');
					$('#rate-table-2').addClass('hidden');
					$('#rate-table-3').removeClass('hidden');
					$('#rate-table-4').addClass('hidden');
				});

				//Proceed button
				if($('#username').data('userid')!=null && $('#username').data('userid')!='*DIRECTGI' ) {
					$('#proceed').removeClass('hidden');
					$('#create-account').addClass('hidden');
					$('.proceed-block .login-holder').addClass('hidden');
				}

				//Create account
				$("#create-account").on('click', function(){
					window.location.href= '${pageContext.request.contextPath}'+'/'+'${language}'+'/joinus';
				});

				//login
				$("#made-decision-next-btn").on('click', function(){
					var savingAmount = $("input[name='amount']").val();
					var savingDob = $("input[name='dob']").val();
					var savingPromocode = $("input[name='promocode']").val();
					$.ajax({
					    url:'${pageContext.request.contextPath}/ajax/savie/savings-insurance/saveAmount',
					    type:'post',
					    data:{
					    	"savingAmount": savingAmount,
					    	"savingDob": savingDob,
					    	"savingPromocode": savingPromocode,
				   		},
					    error:function(){
					    },
					    success:function(data){
					    }
					});

					if("${authenticate}" == "true" && "${authenticate}" != "*DIRECTGI"){
						$('#thankYouModal').modal({backdrop: 'static', keyboard: false});
						$('#thankYouModal').modal('show');
					}else{
                        $('#loginpopup').modal('show');

                        //$('.login-info').css('display','block');
                        $('.login-info').removeClass('hidden');
                        $('#loginpopup .modal-dialog').addClass('loginpopupext');


                        //$('#loginpopup2').modal('show');
					}
			    });

				var thankyou = "${thankyou }";
				if(thankyou == "thankyou" && "${authenticate}" == "true" && "${authenticate}" != "*DIRECTGI"){
					$('#thankYouModal').modal({backdrop: 'static', keyboard: false});
					$('#thankYouModal').modal('show');
				}
			});

			function goServiceCenter(){
				window.location.href= '${pageContext.request.contextPath}'+'/'+'${language}'+'/'+'savings-insurance/'+'${nextPageFlow2 }';
			}
		</script> --%>
