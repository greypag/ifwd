<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import="com.ifwd.fwdhk.model.HomeQuoteBean"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="enhance" uri="http://pukkaone.github.com/jsp" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<!DOCTYPE html>
<c:set var="is_medical" value="false" />
<c:if test="${planIndex == 'medical-insurance'}">
	<c:set var="is_medical" value="true" />
</c:if>
<script type="text/javascript">
var context = "${pageContext.request.contextPath}";
var languageP = "${language}";
</script>
<html lang="en">
	<head>
		<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/material.min.css" />

		<meta name="apple-mobile-web-app-capable" content="yes" />
	</head>
	<body>
		<%!
			boolean isSaleActiveClass = false;
			boolean isEservicesActiveClass = false;
		%>
		<div class="fwd-savie-wrapper savie-online-container with-breadcrumbs-steps employment-info-page" id="unemployed-page">
			<!-- Breadcrumb Component Start-->
    		<div class="container container-fluid container--breadcrumb">

			    <c:set var="breadcrumbItems" value="breadcrumb.item.home" />
				<c:set var="breadcrumbActive" value="0" />

			    <c:if test="${planIndex == 'medical-insurance'}">
			    	<c:set var="breadcrumbItems">
			    		breadcrumb.item.home,breadcrumb.item.protect,breadcrumb.item.health,breadcrumb.item.easyhealth,breadcrumb.item.application
					</c:set>
			    	<c:set var="breadcrumbActive">4</c:set>
			    </c:if>
			    <c:if test="${planIndex == 'medical-insurance/cansurance'}">
			    	<c:set var="breadcrumbItems">
			    		breadcrumb.item.home,breadcrumb.item.protect,breadcrumb.item.health,breadcrumb.item.cansurance,breadcrumb.item.application
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
			</div>
			<!-- Breadcrumb Component End-->

			<!-- StepIndicator Component Start-->

		     	<c:set var="stepItems" value="stepindicator.selectplan" />
				<c:set var="stepActive" value="0" />

				<c:if test="${planIndex == 'medical-insurance'}">
			    	<c:set var="stepItems">
			    		stepindicator.selectplan,stepindicator.application.summary.declaration,stepindicator.sign,stepindicator.payment,stepindicator.upload.document,stepindicator.confirmation
					</c:set>
			    	<c:set var="stepActive">1</c:set>
			    </c:if>
			    <c:if test="${planIndex == 'medical-insurance/cansurance'}">
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

	        <div class="container-fluid fwd-full-container headerStick" id="unemployed-page-body">
	        	<div id="ie-select-emp" class="fwd-container-limit clearfix sidebar">
	  				<div id="unemployed-content">
	  					<div class="row">
	  						<form id="employmentInfoForm" action="" method="post" onsubmit="return false">
								<h3><fmt:message key="label.employment.education.title" bundle="${msg}" /></h3>
	  							<div id="errorMsg" style="color: red;"></div>
								<div class="col-xs-12 col-md-6" id="left-side">
									<div class="form-group">
										<div class="selectDiv centreDiv gray-text-bg">
											<label class="mdl-textfield__label cstm-dropdown-label"><fmt:message key="placeholder.employment.status" bundle="${msg}" /></label>
											<select name="tmpEmploymentStatus" id="tmpEmploymentStatus" class="form-control gray-dropdown">
											   <option value="" disabled="disabled" selected="selected"><fmt:message key="placeholder.employment.status" bundle="${msg}" /></option>
											   <c:if test="${language == 'en'}">
													<c:forEach var="list" items="${employmentStatusEN}">
														<enhance:out escapeXml="false">
															<option value="${list.itemCode }" ${plan == 'savings-insurance' ? savieFna.employment_status == list.itemCode?'selected="selected"':'':lifeEmploymentInfo.employmentStatus == list.itemCode?'selected="selected"':''} >${list.itemDesc }</option>
														</enhance:out>
													</c:forEach>
												</c:if>
												<c:if test="${language == 'tc'}">
													<c:forEach var="list" items="${employmentStatusCN}">
														<enhance:out escapeXml="false">
															<option value="${list.itemCode }" ${plan == 'savings-insurance' ? savieFna.employment_status == list.itemCode?'selected="selected"':'':lifeEmploymentInfo.employmentStatus == list.itemCode?'selected="selected"':''}>${list.itemDesc }</option>
														</enhance:out>
													</c:forEach>
												</c:if>
											</select>

											<c:if test="${language == 'en'}">
													<c:forEach var="list" items="${employmentStatusEN}">
														<c:if test="${plan == 'savings-insurance' ? savieFna.employment_status == list.itemCode?'true':'false':lifeEmploymentInfo.employmentStatus == list.itemCode?'true':'false'}"><c:set var="employmentStatusCode" value="${list.itemCode }"/></c:if>
													</c:forEach>
												</c:if>
												<c:if test="${language == 'tc'}">
													<c:forEach var="list" items="${employmentStatusCN}">
														<c:if test="${plan == 'savings-insurance' ? savieFna.employment_status == list.itemCode?'true':'false':lifeEmploymentInfo.employmentStatus == list.itemCode?'true':'false'}"><c:set var="employmentStatusCode" value="${list.itemCode }"/></c:if>
													</c:forEach>
												</c:if>
											<input type="hidden" id="employmentStatus" name="employmentStatus" value="${employmentStatusCode }">
											<img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg">
										</div>
										<span class="error-msg" id="employmentStatusErMsg"></span>
									</div>
									<div id="natureOfBusinessDiv" class="form-group employment-field">
										<div class="selectDiv centreDiv gray-text-bg">
											<label class="mdl-textfield__label cstm-dropdown-label"><fmt:message key="placeholder.nature.of.business" bundle="${msg}" /></label>
											<select onchange="getOccupation(this.value,'${language }');" name="tmpBusinessNature" id="tmpBusinessNature" class="form-control gray-dropdown">
											   <option value="" disabled="disabled" selected="selected"><fmt:message key="placeholder.nature.of.business" bundle="${msg}" /></option>
											   <c:if test="${language == 'en'}">
													<c:forEach var="list" items="${natureOfBusinessEN}">
														<enhance:out escapeXml="false">
															<option value="${list.itemCode }" <c:if test="${plan == 'savings-insurance' ? savieFna.nature_of_business == list.itemCode?'true':'false':lifeEmploymentInfo.natureOfBusiness == list.itemCode?'true':'false'}">selected="selected"</c:if>>${list.itemDesc }</option>
														</enhance:out>
													</c:forEach>
												</c:if>
												<c:if test="${language == 'tc'}">
													<c:forEach var="list" items="${natureOfBusinessCN}">
														<enhance:out escapeXml="false">
															<option value="${list.itemCode }" <c:if test="${plan == 'savings-insurance' ? savieFna.nature_of_business == list.itemCode?'true':'false':lifeEmploymentInfo.natureOfBusiness == list.itemCode?'true':'false'}">selected="selected"</c:if>>${list.itemDesc }</option>
														</enhance:out>
													</c:forEach>
												</c:if>
											</select>

											<c:if test="${language == 'en'}">
													<c:forEach var="list" items="${natureOfBusinessEN}">
														<c:if test="${plan == 'savings-insurance' ? savieFna.nature_of_business == list.itemCode?'true':'false':lifeEmploymentInfo.natureOfBusiness == list.itemCode?'true':'false'}"><c:set var="natureOfBusinessCode" value="${list.itemCode }"/></c:if>
													</c:forEach>
												</c:if>
												<c:if test="${language == 'tc'}">
													<c:forEach var="list" items="${natureOfBusinessCN}">
														<c:if test="${plan == 'savings-insurance' ? savieFna.nature_of_business == list.itemCode?'true':'false':lifeEmploymentInfo.natureOfBusiness == list.itemCode?'true':'false'}"><c:set var="natureOfBusinessCode" value="${list.itemCode }"/></c:if>
													</c:forEach>
												</c:if>
											<input type="hidden" id="natureOfBusiness" name="natureOfBusiness" value="${natureOfBusinessCode }">
											<img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg">
										</div>
										<span class="error-msg" id="businessNatureErMsg"></span>
									</div>
									<div id="occupationDiv" class="form-group employment-field">
										<div class="selectDiv centreDiv gray-text-bg">
											<label class="mdl-textfield__label cstm-dropdown-label"><fmt:message key="placeholder.occupation" bundle="${msg}" /></label>
											<select name="tmpOccupation" id="tmpOccupation" class="form-control gray-dropdown occupation">
											   <option value="" disabled="disabled" selected="selected"><fmt:message key="placeholder.occupation" bundle="${msg}" /></option>
											   <c:if test="${language == 'en'}">
													<c:forEach var="list" items="${occupationEN}">
														<enhance:out escapeXml="false">
															<option value="${list.itemCode }" <c:if test="${plan == 'savings-insurance' ? savieFna.occupation == list.itemCode?'true':'false':lifeEmploymentInfo.occupation == list.itemCode?'true':'false'}">selected="selected"</c:if>>${list.itemDesc }</option>
														</enhance:out>
													</c:forEach>
												</c:if>
												<c:if test="${language == 'tc'}">
													<c:forEach var="list" items="${occupationCN}">
														<enhance:out escapeXml="false">
														    <option value="${list.itemCode }" <c:if test="${plan == 'savings-insurance' ? savieFna.occupation == list.itemCode?'true':'false':lifeEmploymentInfo.occupation == list.itemCode?'true':'false'}">selected="selected"</c:if>>${list.itemDesc }</option>
														</enhance:out>
													</c:forEach>
												</c:if>
											</select>

											<c:if test="${language == 'en'}">
													<c:forEach var="list" items="${occupationEN}">
														<c:if test="${plan == 'savings-insurance' ? savieFna.occupation == list.itemCode?'true':'false':lifeEmploymentInfo.occupation == list.itemCode?'true':'false'}"><c:set var="occupationCode" value="${list.itemCode }"/></c:if>
													</c:forEach>
												</c:if>
												<c:if test="${language == 'tc'}">
													<c:forEach var="list" items="${occupationCN}">
														<c:if test="${plan == 'savings-insurance' ? savieFna.occupation == list.itemCode?'true':'false':lifeEmploymentInfo.occupation == list.itemCode?'true':'false'}"><c:set var="occupationCode" value="${list.itemCode }"/></c:if>
													</c:forEach>
												</c:if>
											<input type="hidden" id="occupation" name="occupation" value="${occupationCode }">
											<img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg">
										</div>
										<span class="error-msg" id="occupationErMsg"></span>
									</div>
									<div id="otherOccupationDiv" class="form-group employment-field">
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield" id="current-employer">
											<input class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input"  type="text" autocomplete="off" id="other-occupation" name="otherOccupation" value="${savieFna.occupation_others }" />
											<label class="mdl-textfield__label so-mdl-textfield-label" for="other-occupation"><fmt:message key="placeholder.please.specify" bundle="${msg}" /></label>
										</div>
										<span class="error-msg" id="otherOccupationErMsg"></span>
									</div>
									<div id="amountOfOtherSourceOfIncomeDiv" class="form-group unemployment-field">
										<div class="selectDiv centreDiv gray-text-bg">
											<label class="mdl-textfield__label cstm-dropdown-label"><fmt:message key="placeholder.other.sources.of.income" bundle="${msg}" /></label>
											<select name="tmpOtherIncomeAmount" id="tmpOtherIncomeAmount" class="form-control gray-dropdown">
											   <option value="" disabled="disabled" selected="selected"><fmt:message key="placeholder.other.sources.of.income" bundle="${msg}" /></option>
											   <c:if test="${language == 'en'}">
													<c:forEach var="list" items="${etAmountOtherSourceEN}">
														<enhance:out escapeXml="false">
														    <option value="${list.itemCode }"
														    <c:choose>
															 <c:when test="${fn:length(etAmountOtherSourceEN) == '1'}">selected="selected"</c:when>
															 <c:otherwise><c:if test="${lifeEmploymentInfo.amountOfOtherSourceOfIncome == list.itemCode}">selected="selected"</c:if></c:otherwise>
															</c:choose>
														    >${list.itemDesc }</option>
														</enhance:out>
													</c:forEach>
												</c:if>
												<c:if test="${language == 'tc'}">
													<c:forEach var="list" items="${etAmountOtherSourceCN}">
														<enhance:out escapeXml="false">
														    <option value="${list.itemCode }"
														    <c:choose>
															 <c:when test="${fn:length(etAmountOtherSourceCN) == '1'}">selected="selected"</c:when>
															 <c:otherwise><c:if test="${lifeEmploymentInfo.amountOfOtherSourceOfIncome == list.itemCode}">selected="selected"</c:if></c:otherwise>
															</c:choose>
														    >${list.itemDesc }</option>
														</enhance:out>
													</c:forEach>
												</c:if>
											</select>

											<c:if test="${language == 'en'}">
												<c:forEach var="list" items="${etAmountOtherSourceEN}">
												    <c:choose>
													 <c:when test="${fn:length(etAmountOtherSourceEN) == '1'}"><c:set var="amountOfOtherSourceOfIncomeCode" value="${list.itemCode }"/></c:when>
													 <c:otherwise><c:if test="${lifeEmploymentInfo.amountOfOtherSourceOfIncome == list.itemCode}"><c:set var="amountOfOtherSourceOfIncomeCode" value="${list.itemCode }"/></c:if></c:otherwise>
													</c:choose>
												</c:forEach>
											</c:if>
											<c:if test="${language == 'tc'}">
												<c:forEach var="list" items="${etAmountOtherSourceCN}">
												    <c:choose>
													 <c:when test="${fn:length(etAmountOtherSourceCN) == '1'}"><c:set var="amountOfOtherSourceOfIncomeCode" value="${list.itemCode }"/></c:when>
													 <c:otherwise><c:if test="${lifeEmploymentInfo.amountOfOtherSourceOfIncome == list.itemCode}"><c:set var="amountOfOtherSourceOfIncomeCode" value="${list.itemCode }"/></c:if></c:otherwise>
													</c:choose>
												</c:forEach>
											</c:if>
											<input type="hidden" id="amountOfOtherSourceOfIncome" name="amountOfOtherSourceOfIncome" value="${amountOfOtherSourceOfIncomeCode }">
											<img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg">
										</div>
										<span class="error-msg" id="otherIncomeAmountErMsg"></span>
									</div>
								</div>
								<div class="col-xs-12 col-md-6" id="right-side">
									<div id="employerNameDiv" class="form-group employment-field">
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield" id="current-employer">
											<input class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input"  type="text" autocomplete="off" id="currentEmployer" name="employerName" value="${lifeEmploymentInfo.employerName }" />
											<label class="mdl-textfield__label so-mdl-textfield-label" for="currentEmployer"><fmt:message key="placeholder.current.employer.name" bundle="${msg}" /></label>
										</div>
										<span class="error-msg" id="currentEmployerErMsg"></span>
									</div>
									<div id="monthlyPersonalIncomeDiv" class="form-group employment-field">
										<div class="selectDiv centreDiv gray-text-bg">
											<label class="mdl-textfield__label cstm-dropdown-label"><fmt:message key="placeholder.monthly.personal.income" bundle="${msg}" /></label>
											<select name="tmpMonthlyPersonalIncome" id="tmpMonthlyPersonalIncome" class="form-control gray-dropdown">
											   <option value="" disabled="disabled" selected="selected"><fmt:message key="placeholder.monthly.personal.income" bundle="${msg}" /></option>
											   <c:if test="${language == 'en'}">
													<c:forEach var="list" items="${monthlyPersonalIncomeEN}">
														<enhance:out escapeXml="false">
														    <option value="${list.itemCode }"
														    <c:choose>
															 <c:when test="${fn:length(monthlyPersonalIncomeEN) == '1'}">selected="selected"</c:when>
															 <c:otherwise><c:if test="${lifeEmploymentInfo.monthlyPersonalIncome == list.itemCode}">selected="selected"</c:if></c:otherwise>
															</c:choose>
														    >${list.itemDesc }</option>
														</enhance:out>
													</c:forEach>
												</c:if>
												<c:if test="${language == 'tc'}">
													<c:forEach var="list" items="${monthlyPersonalIncomeCN}">
														<enhance:out escapeXml="false">
														    <option value="${list.itemCode }"
														    <c:choose>
															 <c:when test="${fn:length(monthlyPersonalIncomeCN) == '1'}">selected="selected"</c:when>
															 <c:otherwise><c:if test="${lifeEmploymentInfo.monthlyPersonalIncome == list.itemCode}">selected="selected"</c:if></c:otherwise>
															</c:choose>
														    >${list.itemDesc }</option>
														</enhance:out>
													</c:forEach>
												</c:if>
											</select>

											<c:if test="${language == 'en'}">
												<c:forEach var="list" items="${monthlyPersonalIncomeEN}">
												    <c:choose>
													 <c:when test="${fn:length(monthlyPersonalIncomeEN) == '1'}"><c:set var="monthlyPersonalIncomeCode" value="${list.itemCode }"/></c:when>
													 <c:otherwise><c:if test="${lifeEmploymentInfo.monthlyPersonalIncome == list.itemCode}"><c:set var="monthlyPersonalIncomeCode" value="${list.itemCode }"/></c:if></c:otherwise>
													</c:choose>
												</c:forEach>
											</c:if>
											<c:if test="${language == 'tc'}">
												<c:forEach var="list" items="${monthlyPersonalIncomeCN}">
												    <c:choose>
													 <c:when test="${fn:length(monthlyPersonalIncomeCN) == '1'}"><c:set var="monthlyPersonalIncomeCode" value="${list.itemCode }"/></c:when>
													 <c:otherwise><c:if test="${lifeEmploymentInfo.monthlyPersonalIncome == list.itemCode}"><c:set var="monthlyPersonalIncomeCode" value="${list.itemCode }"/></c:if></c:otherwise>
													</c:choose>
												</c:forEach>
											</c:if>
											<input type="hidden" id="monthlyPersonalIncome" name="monthlyPersonalIncome" value="${monthlyPersonalIncomeCode }">
											<img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg">
										</div>
										<span class="error-msg" id="monthlyPersonalIncomeErMsg"></span>
									</div>
									<div class="form-group">
										<div class="selectDiv centreDiv gray-text-bg">
											<label class="mdl-textfield__label cstm-dropdown-label"><fmt:message key="placeholder.education.level" bundle="${msg}" /></label>
											<select name="tmpEducationLevel" id="tmpEducationLevel" class="form-control gray-dropdown">
											   <option value="" disabled="disabled" selected="selected"><fmt:message key="placeholder.education.level" bundle="${msg}" /></option>
											   <c:if test="${language == 'en'}">
													<c:forEach var="list" items="${etEducationLevelEN}">
														<option value="${list.itemCode }"
														    <c:choose>
															   <c:when test="${savieFna.education == '0' && list.itemCode == 'EL1'}">selected="selected"</c:when>
															   <c:when test="${savieFna.education == '1' && list.itemCode == 'EL2'}">selected="selected"</c:when>
															   <c:when test="${savieFna.education == '2' && list.itemCode == 'EL3'}">selected="selected"</c:when>
															   <c:when test="${savieFna.education == '3' && list.itemCode == 'EL4'}">selected="selected"</c:when>
															   <c:when test="${lifeEmploymentInfo.education == list.itemCode }">selected="selected"</c:when>
															   <c:otherwise></c:otherwise>
															</c:choose>
														>${list.itemDesc }</option>
													</c:forEach>
												</c:if>
												<c:if test="${language == 'tc'}">
													<c:forEach var="list" items="${etEducationLevelCN}">
														<option value="${list.itemCode }"
														    <c:choose>
															   <c:when test="${savieFna.education == '0' && list.itemCode == 'EL1'}">selected="selected"</c:when>
															   <c:when test="${savieFna.education == '1' && list.itemCode == 'EL2'}">selected="selected"</c:when>
															   <c:when test="${savieFna.education == '2' && list.itemCode == 'EL3'}">selected="selected"</c:when>
															   <c:when test="${savieFna.education == '3' && list.itemCode == 'EL4'}">selected="selected"</c:when>
															   <c:when test="${lifeEmploymentInfo.education == list.itemCode }">selected="selected"</c:when>
															   <c:otherwise></c:otherwise>
															</c:choose>
														>${list.itemDesc }</option>
													</c:forEach>
												</c:if>
											</select>

											<c:if test="${language == 'en'}">
													<c:forEach var="list" items="${etEducationLevelEN}">
														    <c:choose>
															   <c:when test="${savieFna.education == '0' && list.itemCode == 'EL1'}"><c:set var="educationCode" value="${list.itemCode }"/></c:when>
															   <c:when test="${savieFna.education == '1' && list.itemCode == 'EL2'}"><c:set var="educationCode" value="${list.itemCode }"/></c:when>
															   <c:when test="${savieFna.education == '2' && list.itemCode == 'EL3'}"><c:set var="educationCode" value="${list.itemCode }"/></c:when>
															   <c:when test="${savieFna.education == '3' && list.itemCode == 'EL4'}"><c:set var="educationCode" value="${list.itemCode }"/></c:when>
															   <c:when test="${lifeEmploymentInfo.education == list.itemCode }"><c:set var="educationCode" value="${list.itemCode }"/></c:when>
															   <c:otherwise></c:otherwise>
															</c:choose>
													</c:forEach>
												</c:if>
												<c:if test="${language == 'tc'}">
													<c:forEach var="list" items="${etEducationLevelCN}">
														    <c:choose>
															   <c:when test="${savieFna.education == '0' && list.itemCode == 'EL1'}"><c:set var="educationCode" value="${list.itemCode }"/></c:when>
															   <c:when test="${savieFna.education == '1' && list.itemCode == 'EL2'}"><c:set var="educationCode" value="${list.itemCode }"/></c:when>
															   <c:when test="${savieFna.education == '2' && list.itemCode == 'EL3'}"><c:set var="educationCode" value="${list.itemCode }"/></c:when>
															   <c:when test="${savieFna.education == '3' && list.itemCode == 'EL4'}"><c:set var="educationCode" value="${list.itemCode }"/></c:when>
															   <c:when test="${lifeEmploymentInfo.education == list.itemCode }"><c:set var="educationCode" value="${list.itemCode }"/></c:when>
															   <c:otherwise></c:otherwise>
															</c:choose>
													</c:forEach>
												</c:if>
											<input type="hidden" id="education" name="education" value="${educationCode }">
											<img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg">
										</div>
										<span class="error-msg" id="educationLevelErMsg"></span>
									</div>
									<div id="amountOfLiquidAssetsDiv" class="form-group unemployment-field">
										<div class="selectDiv centreDiv gray-text-bg">
											<label class="mdl-textfield__label cstm-dropdown-label"><fmt:message key="placeholder.liquid.assets" bundle="${msg}" /></label>
											<select name="tmpLiquidAssetsAmount" id="tmpLiquidAssetsAmount" class="form-control gray-dropdown">
											   <option value="" disabled selected><fmt:message key="placeholder.liquid.assets" bundle="${msg}" /></option>
											   <c:if test="${language == 'en'}">
													<c:forEach var="list" items="${etLiquidAssetEN}">
														<option value="${list.itemCode }"
														<c:choose>
															<c:when test="${savieFna.getQ4_b_amount() == null || savieFna.getQ4_b_amount() <= 0}"></c:when>
															<c:when test="${savieFna.getQ4_b_amount() <= 10000 && list.itemCode == 'LA1'}">selected="selected"</c:when>
															<c:when test="${savieFna.getQ4_b_amount() >= 10001 && savieFna.getQ4_b_amount() <= 50000 && list.itemCode == 'LA2'}">selected="selected"</c:when>
															<c:when test="${savieFna.getQ4_b_amount() >= 50001 && savieFna.getQ4_b_amount() <= 100000 && list.itemCode == 'LA3'}">selected="selected"</c:when>
															<c:when test="${savieFna.getQ4_b_amount() >= 100001 && list.itemCode == 'LA4'}">selected="selected"</c:when>
															<c:when test="${lifeEmploymentInfo.amountOfLiquidAssets == list.itemCode }">selected="selected"</c:when>
															<c:otherwise></c:otherwise>
														</c:choose>
														>${list.itemDesc }</option>
													</c:forEach>
												</c:if>
												<c:if test="${language == 'tc'}">
													<c:forEach var="list" items="${etLiquidAssetCN}">
														<option value="${list.itemCode }"
														<c:choose>
															<c:when test="${savieFna.getQ4_b_amount() == null || savieFna.getQ4_b_amount() <= 0}"></c:when>
															<c:when test="${savieFna.getQ4_b_amount() <= 10000 && list.itemCode == 'LA1'}">selected="selected"</c:when>
															<c:when test="${savieFna.getQ4_b_amount() >= 10001 && savieFna.getQ4_b_amount() <= 50000 && list.itemCode == 'LA2'}">selected="selected"</c:when>
															<c:when test="${savieFna.getQ4_b_amount() >= 50001 && savieFna.getQ4_b_amount() <= 100000 && list.itemCode == 'LA3'}">selected="selected"</c:when>
															<c:when test="${savieFna.getQ4_b_amount() >= 100001 && list.itemCode == 'LA4'}">selected="selected"</c:when>
															<c:when test="${lifeEmploymentInfo.amountOfLiquidAssets == list.itemCode }">selected="selected"</c:when>
															<c:otherwise></c:otherwise>
														</c:choose>
														>${list.itemDesc }</option>
													</c:forEach>
												</c:if>
											</select>

											<c:if test="${language == 'en'}">
												<c:forEach var="list" items="${etLiquidAssetEN}">
														<c:choose>
															<c:when test="${savieFna.getQ4_b_amount() == null || savieFna.getQ4_b_amount() <= 0}"><c:set var="amountOfLiquidAssetsCode" value=""/></c:when>
															<c:when test="${savieFna.getQ4_b_amount() <= 10000 && list.itemCode == 'LA1'}"><c:set var="amountOfLiquidAssetsCode" value="${list.itemCode }"/></c:when>
															<c:when test="${savieFna.getQ4_b_amount() >= 10001 && savieFna.getQ4_b_amount() <= 50000 && list.itemCode == 'LA2'}"><c:set var="amountOfLiquidAssetsCode" value="${list.itemCode }"/></c:when>
															<c:when test="${savieFna.getQ4_b_amount() >= 50001 && savieFna.getQ4_b_amount() <= 100000 && list.itemCode == 'LA3'}"><c:set var="amountOfLiquidAssetsCode" value="${list.itemCode }"/></c:when>
															<c:when test="${savieFna.getQ4_b_amount() >= 100001 && list.itemCode == 'LA4'}"><c:set var="amountOfLiquidAssetsCode" value="${list.itemCode }"/></c:when>
															<c:when test="${lifeEmploymentInfo.amountOfLiquidAssets == list.itemCode }"><c:set var="amountOfLiquidAssetsCode" value="${list.itemCode }"/></c:when>
															<c:otherwise><c:set var="amountOfLiquidAssetsCode" value=""/></c:otherwise>
														</c:choose>
												</c:forEach>
											</c:if>
											<c:if test="${language == 'tc'}">
												<c:forEach var="list" items="${etLiquidAssetCN}">
														<c:choose>
															<c:when test="${savieFna.getQ4_b_amount() == null || savieFna.getQ4_b_amount() <= 0}"><c:set var="amountOfLiquidAssetsCode" value=""/></c:when>
															<c:when test="${savieFna.getQ4_b_amount() <= 10000 && list.itemCode == 'LA1'}"><c:set var="amountOfLiquidAssetsCode" value="${list.itemCode }"/></c:when>
															<c:when test="${savieFna.getQ4_b_amount() >= 10001 && savieFna.getQ4_b_amount() <= 50000 && list.itemCode == 'LA2'}"><c:set var="amountOfLiquidAssetsCode" value="${list.itemCode }"/></c:when>
															<c:when test="${savieFna.getQ4_b_amount() >= 50001 && savieFna.getQ4_b_amount() <= 100000 && list.itemCode == 'LA3'}"><c:set var="amountOfLiquidAssetsCode" value="${list.itemCode }"/></c:when>
															<c:when test="${savieFna.getQ4_b_amount() >= 100001 && list.itemCode == 'LA4'}"><c:set var="amountOfLiquidAssetsCode" value="${list.itemCode }"/></c:when>
															<c:when test="${lifeEmploymentInfo.amountOfLiquidAssets == list.itemCode }"><c:set var="amountOfLiquidAssetsCode" value="${list.itemCode }"/></c:when>
															<c:otherwise><c:set var="amountOfLiquidAssetsCode" value=""/></c:otherwise>
														</c:choose>
												</c:forEach>
											</c:if>
											<input type="hidden" id="amountOfLiquidAssets" name="amountOfLiquidAssets" value="${amountOfLiquidAssetsCode }">
											<img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg">
										</div>
										<span class="error-msg" id="liquidAssetsAmountErMsg"></span>
									</div>
								</div>

								
								<%--c:if test="${is_medical}">
                                <div id="has-regular-income" class="col-xs-12 col-sm-12 col-md-12" >
                                    <div class="form-group">
                                        <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none easyhealth_q">
                                            <div class="has-regular-income-question">
                                                <fmt:message key="employment.has.regular.income" bundle="${msg}" />
                                            </div>
                                            <span id="has_regular_incomeErMsg" class="text-red"> </span>
                                        </div>
                                        <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none has-regular-income-btn-grp">
                                            <div class="radio-choice">
                                                <label class="field-label bold-500">
                                                    <input type="radio" class="has-regular-income-radio" name="regularIncome"  value="1" />
                                                    <span id="" class="radio-inline oversea-lb has-regular-income-selection">
                                                        <fmt:message key="employment.has.regular.income.yes" bundle="${msg}" />
                                                    </span>
                                                </label>
                                            </div>
                                            <div class="radio-choice">
                                                <label class="field-label bold-500">
                                                    <input type="radio" class="has-regular-income-radio" name="regularIncome"  value="0" />
                                                    <span id="" class="radio-inline oversea-lb has-regular-income-selection">
                                                        <fmt:message key="employment.has.regular.income.no" bundle="${msg}" />
                                                    </span>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                </c:if--%>
                                
	  							<div class="col-xs-12 text-center">
	  								<button type="submit" class="text-bold btn savie-common-btn" id="next-btn"><fmt:message key="button.Next" bundle="${msg}" /></button><br />
	  								<button type="button" class="text-bold btn savie-common-btn hidden" id="back-summary-btn"><fmt:message key="button.back.summary" bundle="${msg}" /></button>
									<c:if test="${plan == 'savings-insurance'}">
									   <a href="#" id="save-cont-link"><fmt:message key="label.save.and.continue.later" bundle="${msg}" /></a>
									</c:if>
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
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">x</span></button>
				<h4 class="text-center welcome-msg"><fmt:message key="label.savie.save.continue.title1" bundle="${msg}" /></h4>
				<p class="text-center description-msg"><fmt:message key="label.savie.save.continue.copy1" bundle="${msg}" /></p>
				<div class="save-con-btns clearfix">
					<button class="btn savie-common-btn save-exit-btn1 col-sm-6 col-xs-6 col-lg-6 col-md-6"><fmt:message key="button.keep.going" bundle="${msg}" /></button>
					<button class="btn savie-common-btn save-exit-btn2 col-sm-6 col-xs-6 col-lg-6 col-md-6"><fmt:message key="button.save.and.exit" bundle="${msg}" /></button>
				</div>
			</div>
		  </div>
		</div>

		<!-- Save and continue batch 5 modal -->
		<div class="modal fade common-welcome-modal save-con-modal-b5" id="save-and-continue-batch5-modal" tabindex="-1" role="dialog">
		  <div class="modal-dialog">
			<div class="modal-content save-con-modal-content">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">x</span></button>
				<h4 class="text-center welcome-msg"><fmt:message key="label.savie.save.continue.title2" bundle="${msg}" /></h4>
				<p class="text-center description-msg"><fmt:message key="label.savie.save.continue.copy2" bundle="${msg}" /></p>
				<div class="save-con-btns text-center clearfix">
					<button class="btn savie-common-btn" id="keep-going-btn"><fmt:message key="button.keep.going" bundle="${msg}" /></button>
					<button class="btn savie-common-btn disabled-gray-btn" id="save-exit-btn"><fmt:message key="button.save.and.exit" bundle="${msg}" /></button>
				</div>
			</div>
		  </div>
		</div>

		<!-- Application saved modal -->
		<div class="modal fade common-welcome-modal modal-app-save" id="application-saved-modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
		  <div class="modal-dialog" id="modal-save-app">
			<div class="modal-content modal-content-appsave common-welcome-modal">
				 <div class="modal-header" id="modal-header-appsave">
				 <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<p class="text-center"><fmt:message key="label.saved.application.title" bundle="${msg}" /></p>
				 </div>
				 <div class="modal-body" id="moda-body-appsave">
					<p class="text-center"><fmt:message key="label.saved.application.copy" bundle="${msg}" /></p>
					<div class="btn-appsave">
						<button href="#" class="center-block btn savie-common-btn" id="btn-app-save"><fmt:message key="button.backtohome" bundle="${msg}" /></button>
					</div>
				 </div>
			 </div>
		  </div>
		</div>

		<!-- JS INCLUDES -->
		<script type="text/javascript">

			var getpath =  "<%=request.getContextPath()%>";

			$(document).ready(function () {
				if('${plan }' == 'savings-insurance'){
					setSelectReadonly('tmpEmploymentStatus', true);
					setSelectReadonly('tmpBusinessNature', true);
					setSelectReadonly('tmpOccupation', true);
					setSelectReadonly('tmpEducationLevel', true);
					setSelectReadonly('tmpLiquidAssetsAmount', true);
					setInputReadonly('other-occupation', true);
					if('${fn:length(monthlyPersonalIncomeCN)}' == '1'){
						setSelectReadonly('tmpMonthlyPersonalIncome', true);
					}
					if('${fn:length(etAmountOtherSourceEN)}' == '1'){
						setSelectReadonly('tmpOtherIncomeAmount', true);
					}
				}else if('${plan }' == 'medical-insurance'){
					setStyleOfIsNotActive('tmpEmploymentStatus');
					setStyleOfIsNotActive('tmpBusinessNature');
					setStyleOfIsNotActive('tmpOccupation');
					setStyleOfIsNotActive('tmpEducationLevel');
					setStyleOfIsNotActive('tmpLiquidAssetsAmount');
					setStyleOfIsNotActive('other-occupation');
					setStyleOfIsNotActive('tmpMonthlyPersonalIncome');
					setStyleOfIsNotActive('tmpOtherIncomeAmount');
				}

				var employmentS = '${plan == "savings-insurance" ? savieFna.employment_status : lifeEmploymentInfo.employmentStatus}';
				if(employmentS == 'ES4' || employmentS == 'ES5' || employmentS == 'ES7' || employmentS == 'ES6'){
					$('#amountOfOtherSourceOfIncomeDiv').removeClass('hidden');
					$('#amountOfLiquidAssetsDiv').removeClass('hidden');

					$('#natureOfBusinessDiv').addClass('hidden');
					$('#occupationDiv').addClass('hidden');
					$('#otherOccupationDiv').addClass('hidden');
					$('#employerNameDiv').addClass('hidden');
					$('#monthlyPersonalIncomeDiv').addClass('hidden');
				}
				else{
					$('#amountOfOtherSourceOfIncomeDiv').addClass('hidden');
					$('#amountOfLiquidAssetsDiv').addClass('hidden');

					$('#natureOfBusinessDiv').removeClass('hidden');
					$('#occupationDiv').removeClass('hidden');
					$('#employerNameDiv').removeClass('hidden');
					$('#monthlyPersonalIncomeDiv').removeClass('hidden');
					if('${savieFna.nature_of_business }' == 'NoB23' && '${savieFna.occupation }' == 'NoBD16' && '${savieFna.occupation_others }' != null && '${savieFna.occupation_others }' != ''){
						$('#otherOccupationDiv').removeClass('hidden');
					}
					else{
						$('#otherOccupationDiv').addClass('hidden');
					}
				}

				var dummy = true;
				if('${backSummary}' == 'Y'){
					dummy = false;
				}
				// dummy condition for displaying the back / next button
				if(dummy) {
					// hide the back button and display the Next button
					$('#next-btn, #save-cont-link').removeClass('hidden');
					$('#back-summary-btn').addClass('hidden');
				} else {
					// display the back button and hide the Next button
					$('#next-btn, #save-cont-link').addClass('hidden');
					$('#back-summary-btn').removeClass('hidden');
				}

				$('.save-exit-btn1').click(function() {
					$('#save-and-continue-modal').modal('hide');
				});

                $('#keep-going-btn').click(function() {
					$('#save-and-continue-batch5-modal').modal('hide');
				});

				// application saved modal will show after clicking 'Save and exit' button
				// no full fill type = 1
				$('.save-exit-btn2').click(function() {
					$("#errorMsg").html("");
					$.ajax({
						  type : "POST",
						  async:false,
						  url : "<%=request.getContextPath()%>/ajax/savings-insurance/lifeEmploymentInfoSaveforLater",
						  data: $("#employmentInfoForm").serialize()+"&type="+1,
						  success : function(data) {
							  if(data != null && data.errorMsg != null && data.errorMsg != ""){
								  $('#save-and-continue-modal').modal('hide');
								  show_stack_bar_top(data.errorMsg);
							  }
							  else{
								  $('#save-and-continue-modal').modal('hide');
								  $('#application-saved-modal').modal('show');
								  sendEmailForSaveLater("plan-details-sp?type=3");
							  }
						  }
				    });
				});
				//full fill type = 2
				$('#save-exit-btn').click(function() {
					$("#errorMsg").html("");
					$.ajax({
						  type : "POST",
						  async:false,
						  url : "<%=request.getContextPath()%>/ajax/savings-insurance/lifeEmploymentInfoSaveforLater",
						  data: $("#employmentInfoForm").serialize()+"&type="+2,
						  success : function(data) {
							  if(data != null && data.errorMsg != null && data.errorMsg != ""){
								  $('#save-and-continue-batch5-modal').modal('hide');
								  show_stack_bar_top(data.errorMsg);
							  }
							  else{
								  $('#save-and-continue-batch5-modal').modal('hide');
								  $('#application-saved-modal').modal('show');
								  sendEmailForSaveLater("plan-details-sp?type=3");
							  }
						  }
				    });
				});

				$('#btn-app-save').click(function() {
					window.location = '<%=request.getContextPath()%>/${language}/savings-insurance';
				});

				if(msieversion() >= 9) {
					//fix for IE8 highlight blue when selected
					$('option').click(function() {
					    $('select').blur();
					});
				}
				// detect IE browsers
				if (window.clipboardData) {
					$('.selectDiv .gray-dropdown').addClass('ie-select');
				} else {
					$('.selectDiv .gray-dropdown').removeClass('ie-select');
				}
				var validateFields = {
						tmpEmploymentStatus: {
							   container: '#employmentStatusErMsg',
							   selector: '#tmpEmploymentStatus',
							   validators: {
								  notEmpty: {
									  message: '<fmt:message key="error.employment.status.empty" bundle="${msg}" />'
								  }
							   }
							},
							tmpBusinessNature: {
							   container: '#businessNatureErMsg',
							   selector: '#tmpBusinessNature',
							   validators: {
								  notEmpty: {
							  		message: '<fmt:message key="error.nature.of.business.empty" bundle="${msg}" />'
								  }
							   }
							},
							tmpOccupation: {
							   container: '#occupationErMsg',
							   selector: '#tmpOccupation',
							   validators: {
								  notEmpty: {
									 message: '<fmt:message key="error.occupation.empty" bundle="${msg}" />'
								  }
							   }
							},
							otherOccupation: {
							   container: '#otherOccupationErMsg',
							   selector: '#other-occupation',
							   validators: {
								  notEmpty: {
									 message: "Please input your occupation."
								  }
							   }
							},
							currentEmployer: {
							   container: '#currentEmployerErMsg',
							   selector: '#currentEmployer',
							   validators: {
								  notEmpty: {
									 message: '<fmt:message key="error.employer.name.empty" bundle="${msg}" />'
								  }
							   }
							},
							tmpMonthlyPersonalIncome: {
							   container: '#monthlyPersonalIncomeErMsg',
							   selector: '#tmpMonthlyPersonalIncome',
							   validators: {
								  notEmpty: {
									 message: '<fmt:message key="error.monthly.personal.income.empty" bundle="${msg}" />'
								  }
							   }
							},
							tmpEducationLevel: {
							   container: '#educationLevelErMsg',
							   selector: '#tmpEducationLevel',
							   validators: {
								  notEmpty: {
									 message: '<fmt:message key="error.education.level.empty" bundle="${msg}" />'
								  }
							   }
							},
							tmpOtherIncomeAmount: {
							   container: '#otherIncomeAmountErMsg',
							   selector: '#tmpOtherIncomeAmount',
							   validators: {
								  notEmpty: {
									 message: '<fmt:message key="error.other.sources.of.income.empty" bundle="${msg}" />'
								  }
							   }
							},
							tmpLiquidAssetsAmount: {
							   container: '#liquidAssetsAmountErMsg',
							   selector: '#tmpLiquidAssetsAmount',
							   validators: {
								  notEmpty: {
									 message: '<fmt:message key="error.liquid.assets.empty" bundle="${msg}" />'
								  }
							   }
	                        }
						};
		
				<%--c:if test="${is_medical}">
						validateFields['regularIncome']= {
	                        container: '#has_regular_incomeErMsg',
	                        validators: {
	                            notEmpty: {
	                                message: '<fmt:message key="error.has.regular.income.empty" bundle="${msg}" />'
	                            }
	                        }
	                    };
				</c:if--%>

				// Form validation
				$('#employmentInfoForm').bootstrapValidator({
					excluded: [':disabled', ':hidden', ':not(:visible)'],
					fields: validateFields
				}).on('success.form.bv', function(e) {
					e.preventDefault();
				}).on('error.form.bv', function(e) {
				});

				$('#save-cont-link').on('click', function (e) {
					$('#employmentInfoForm').bootstrapValidator('validate');
                    if($('#employmentInfoForm').data('bootstrapValidator').isValid()) {
						$('#save-and-continue-batch5-modal').modal('show');
                    } else {
						$('#save-and-continue-modal').modal('show');
                    }
                });

				$('.occupation').on('change', function () {
					showHideOtherOccupationField($(this).val());
				});

				/*
				$('#tmpEmploymentStatus').on('change', function() {
					if($(this).val().split("-")[0] != 'ES3') {
						// Show employment fields. Hide unemployment fields
						$('.employment-field').removeClass('hidden');
						$('.unemployment-field').addClass('hidden');

						showHideOtherOccupationField($('.occupation').val());
					} else {
						// Hide employment fields. Show unemployment fields
						$('.employment-field').addClass('hidden');
						$('.unemployment-field').removeClass('hidden');
					}
				});
				*/

				//Update employment info fields
				/*
					ES1 - Full Time Employed
					ES2 - Part Time Employed
					ES3 - Self Employed
					ES4 - Unemployed
					ES5 - Retired
					ES6 - Student
					ES7 - Housewife
				*/
				$('#tmpEmploymentStatus').on('change', function(e) {
					var $self = $(this);
					var value = $self.val().slice(0,3);

					var status = $(this).val();
					$(this).val(status);

					if (value === 'ES1' || value === 'ES2' || value === 'ES3') {
						$('#natureOfBusinessDiv').removeClass('hidden');
						$('#occupationDiv').removeClass('hidden');
						$('#employerNameDiv').removeClass('hidden');
						$('#monthlyPersonalIncomeDiv').removeClass('hidden');
						$('#amountOfOtherSourceOfIncomeDiv').addClass('hidden');
						$('#amountOfLiquidAssetsDiv').addClass('hidden');
					}else {
						$('#natureOfBusinessDiv').addClass('hidden');
						$('#occupationDiv').addClass('hidden');
						$('#employerNameDiv').addClass('hidden');
						$('#monthlyPersonalIncomeDiv').addClass('hidden');
						$('#amountOfOtherSourceOfIncomeDiv').removeClass('hidden');
						$('#amountOfLiquidAssetsDiv').removeClass('hidden');
					}
				});
				//Show/hide 'other occupation' field
				//'Others' of Business Nature - NoB23
				//'Others' of Occupation - NoBD16
				$('#tmpOccupation').on('change', function(e) {
					$businessNature = $('#tmpBusinessNature');
					$self = $('#tmpOccupation');

					if($businessNature.val() == 'NoB23' && $self.val() == 'NoBD16'){
						$('#otherOccupationDiv').removeClass('hidden');
					}else{
						$('#otherOccupationDiv').addClass('hidden');
					}
				});

				//init next button text
				if('${backSummary}'=="Y"){
					var htmlObj = document.getElementById('next-btn');
					htmlObj.innerHTML = 'Back to application summary';
				}

			});

			function showHideOtherOccupationField(val) {
				if(val == 'other') {
					$('#other-occupation').parent().parent().removeClass('hidden');
				} else {
					$('#other-occupation').parent().parent().addClass('hidden');
				}
			}

			$("#next-btn, #back-summary-btn").click(function(){
				$('#employmentInfoForm').bootstrapValidator('validate');
				if($('#employmentInfoForm').data('bootstrapValidator').isValid()){
					$("#errorMsg").html("");
					$.ajax({
						  type : "POST",
						  async:false,
						  url : "<%=request.getContextPath()%>/ajax/savings-insurance/lifeEmploymentInfo",
						  data: $("#employmentInfoForm").serialize(),
						  success : function(data) {
							  if(data != null && data.errorMsg != null && data.errorMsg != ""){
								  show_stack_bar_top(data.errorMsg);
							  }
							  else{
								  if('${backSummary}'=="Y"){
									  window.location = '<%=request.getContextPath()%>/${language}/${nextPageFlow2}';
								  }
								  else{
									  window.location = '<%=request.getContextPath()%>/${language}/${nextPageFlow}';
								  }
							  }
						  }
				     });
				}
			});

			function getOccupation(value, language) {
				var code = value.replace(/[^0-9]/ig, "");
				$.get(contextPath+'/ajax/savie/application/getOccupation',
				{
					value : value,
					language : language
				},
				function(data) {
					$("#tmpOccupation").trigger('change'); //trigger for refresh 'others'
					$("#tmpOccupation").empty();
					$("#tmpOccupation").append("<option value='' disabled='disabled' selected='selected' ><fmt:message key='placeholder.occupation' bundle='${msg}' /></option>");
					if(data != null){
						for(var i = 0; i < data.length; i++) {
							$("#tmpOccupation").append("<option value='"+data[i].itemCode+"'>"+data[i].itemDesc+"</option>");
						}
					}
				})
				.fail(function(data) {
					console.log("data error:"+data.length);
				});
			}
		</script>
	</body>
</html>
