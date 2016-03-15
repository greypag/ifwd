<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeQuoteBean"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
		<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/material.min.css" />
      
		<meta name="apple-mobile-web-app-capable" content="yes" />
	</head>
	<body>
		<%!
			boolean isSaleActiveClass = false;
			boolean isEservicesActiveClass = false;
		%>
		<div class="fwd-savie-wrapper savie-online-container with-breadcrumbs-steps employment-info-page" id="unemployed-page">
			<!--BREADCRUMBS-->
			<div class="fwd-container container-fluid breadcrumbs">
	            <div class="breadcrumb-container">
	               <ol class="breadcrumb breadcrumbs-product-details et-breadcrumbs">
						<li><a href="#"><fmt:message key="breadcrumb.home" bundle="${msg}" /></a></li>
						<li class="divider"><i class="fa fa-play"></i></li>
						<li><a href="#"><fmt:message key="breadcrumb.savie.category" bundle="${msg}" /></a></li>
						<li class="divider"><i class="fa fa-play"></i></li>
						<li><a href="#"><fmt:message key="breadcrumb.savie.insurance.plan" bundle="${msg}" /></a></li>
						<li class="divider last"><i class="fa fa-play"></i></i></li>
						<li class="active-bc" id="et-active-bc-menu"><fmt:message key="breadcrumb.savie.selectplan" bundle="${msg}" /></li>
	               </ol>
	            </div>
	        </div>
	         <!-- STEPS -->
	        <div class="container-fluid fwd-full-container browse-holder">
	            <div class="application-page-header et-header-browse">
	               <div class="browse-container">
	                  <div class="row reset-margin hidden-xs hidden-sm">
	                     <ul class="common-steps-list six-steps nav nav-pills">
	                        <li class="step-number" id="first-step"><button type="button" class="et-header-info-btn completed-step"><i class="fa fa-check"></i><fmt:message key="stepindicator.savie.selectplan" bundle="${msg}" /></button></li>
	                        <li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
	                        <li class="step-number"><button type="button" class="et-header-info-btn active"><span class="status">2</span><fmt:message key="stepindicator.savie.application" bundle="${msg}" /></button></li>
	                        <li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
	                        <li class="step-number"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">3</span><fmt:message key="stepindicator.savie.summary.declaration" bundle="${msg}" /></button></li>
	                        <li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
	                        <li class="step-number"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">4</span><fmt:message key="stepindicator.savie.sign" bundle="${msg}" /></button></li>
	                        <li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
	                        <li class="step-number"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">5</span><fmt:message key="stepindicator.savie.upload.document" bundle="${msg}" /></button></li>
	                        <li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
	                        <li class="step-number"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">6</span><fmt:message key="stepindicator.savie.confirmation" bundle="${msg}" /></button></li>
	                     </ul>
	                 </div>
	               </div>  
	               <div class="et-mobile-header-info hidden-md hidden-lg">
	                  <div class="clearfix">
	                     <div class="et-back-arrow">
	                        <a href="#" class="back-arrow-link">
	                           <span class="icon-arrow-left2 arrow-left"></span>
	                        </a>
	                     </div>
	                     <div class="et-header-tex">
	                        <h3 id=""><fmt:message key="stepindicator.savie.application" bundle="${msg}" /></h3>
	                     </div>
	                     <p id="step-of">2 of 6</p>
	                  </div>
	               </div>
	            </div>
	        </div>
	        <div class="container-fluid fwd-full-container mobile-step-indicator visible-xs visible-sm">
	        	<div class="step-indicator-container clearfix">
	               	<ul class="common-step-indicator six-steps nav nav-pills">
                     	<li id="first-step"><a href="#" class="completed"><i class="fa fa-check"></i></a></li>
                     	<li><a href="#" class="active"><span class="step-no">2</span></a></li>
                     	<li><a href="#"><span class="step-no">3</span></a></li>
                     	<li><a href="#"><span class="step-no">4</span></a></li>
                     	<li><a href="#"><span class="step-no">5</span></a></li>
                     	<li id="last-step"><a href="#"><span class="step-no">6</span></a></li>
                    </ul>
                    <div class="step-line"></div>
	            </div>
	        </div>
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
														<option value="${list.itemCode }-${list.itemDesc }" <c:if test="${savieFna.employment_status == list.itemCode}">selected="selected"</c:if>>${list.itemDesc }</option>
													</c:forEach>
												</c:if>
												<c:if test="${language == 'tc'}">
													<c:forEach var="list" items="${employmentStatusCN}">
														<option value="${list.itemCode }-${list.itemDesc }" <c:if test="${savieFna.employment_status == list.itemCode}">selected="selected"</c:if>>${list.itemDesc }</option>
													</c:forEach>
												</c:if>
											</select>
											
											<c:if test="${language == 'en'}">
													<c:forEach var="list" items="${employmentStatusEN}">
														<c:if test="${savieFna.employment_status == list.itemCode}"><c:set var="employmentStatusCode" value="${list.itemCode }-${list.itemDesc }"/></c:if>
													</c:forEach>
												</c:if>
												<c:if test="${language == 'tc'}">
													<c:forEach var="list" items="${employmentStatusCN}">
														<c:if test="${savieFna.employment_status == list.itemCode}"><c:set var="employmentStatusCode" value="${list.itemCode }-${list.itemDesc }"/></c:if>
													</c:forEach>
												</c:if>
											<input type="hidden" id="employmentStatus" name="employmentStatus" value="${employmentStatusCode }">
											<img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg">
										</div>
										<span class="error-msg" id="employmentStatusErMsg"></span>
									</div>
									<div class="form-group employment-field">
										<div class="selectDiv centreDiv gray-text-bg">
											<label class="mdl-textfield__label cstm-dropdown-label"><fmt:message key="placeholder.nature.of.business" bundle="${msg}" /></label>
											<select name="tmpBusinessNature" id="tmpBusinessNature" class="form-control gray-dropdown">
											   <option value="" disabled="disabled" selected="selected"><fmt:message key="placeholder.nature.of.business" bundle="${msg}" /></option>
											   <c:if test="${language == 'en'}">
													<c:forEach var="list" items="${natureOfBusinessEN}">
														<option value="${list.itemCode }-${list.itemDesc }" <c:if test="${savieFna.nature_of_business == list.itemCode}">selected="selected"</c:if>>${list.itemDesc }</option>
													</c:forEach>
												</c:if>
												<c:if test="${language == 'tc'}">
													<c:forEach var="list" items="${natureOfBusinessCN}">
														<option value="${list.itemCode }-${list.itemDesc }" <c:if test="${savieFna.nature_of_business == list.itemCode}">selected="selected"</c:if>>${list.itemDesc }</option>
													</c:forEach>
												</c:if>				                     
											</select>
											
											<c:if test="${language == 'en'}">
													<c:forEach var="list" items="${natureOfBusinessEN}">
														<c:if test="${savieFna.nature_of_business == list.itemCode}"><c:set var="natureOfBusinessCode" value="${list.itemCode }-${list.itemDesc }"/></c:if>
													</c:forEach>
												</c:if>
												<c:if test="${language == 'tc'}">
													<c:forEach var="list" items="${natureOfBusinessCN}">
														<c:if test="${savieFna.nature_of_business == list.itemCode}"><c:set var="natureOfBusinessCode" value="${list.itemCode }-${list.itemDesc }"/></c:if>
													</c:forEach>
												</c:if>
											<input type="hidden" id="natureOfBusiness" name="natureOfBusiness" value="${natureOfBusinessCode }">
											<img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg">
										</div>
										<span class="error-msg" id="businessNatureErMsg"></span>
									</div>
									<div class="form-group employment-field">
										<div class="selectDiv centreDiv gray-text-bg">
											<label class="mdl-textfield__label cstm-dropdown-label"><fmt:message key="placeholder.occupation" bundle="${msg}" /></label>
											<select name="tmpOccupation" id="tmpOccupation" class="form-control gray-dropdown occupation">
											   <option value="" disabled="disabled" selected="selected"><fmt:message key="placeholder.occupation" bundle="${msg}" /></option>
											   <c:if test="${language == 'en'}">
													<c:forEach var="list" items="${occupationEN}">
														<option value="${list.itemCode }-${list.itemDesc }" <c:if test="${savieFna.occupation == list.itemCode}">selected="selected"</c:if>>${list.itemDesc }</option>
													</c:forEach>
												</c:if>
												<c:if test="${language == 'tc'}">
													<c:forEach var="list" items="${occupationCN}">
														<option value="${list.itemCode }-${list.itemDesc }" <c:if test="${savieFna.occupation == list.itemCode}">selected="selected"</c:if>>${list.itemDesc }</option>
													</c:forEach>
												</c:if>	
											</select>
											
											<c:if test="${language == 'en'}">
													<c:forEach var="list" items="${occupationEN}">
														<c:if test="${savieFna.occupation == list.itemCode}"><c:set var="occupationCode" value="${list.itemCode }-${list.itemDesc }"/></c:if>
													</c:forEach>
												</c:if>
												<c:if test="${language == 'tc'}">
													<c:forEach var="list" items="${occupationCN}">
														<c:if test="${savieFna.occupation == list.itemCode}"><c:set var="occupationCode" value="${list.itemCode }-${list.itemDesc }"/></c:if>
													</c:forEach>
												</c:if>
											<input type="hidden" id="occupation" name="occupation" value="${occupationCode }">
											<img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg">
										</div>
										<span class="error-msg" id="occupationErMsg"></span>
									</div>
									<!--<input type="text" name="other-occupation" id="other-occupation" class="gray-textbox hidden" placeholder="Please specify" />-->
									<div class="form-group employment-field hidden">
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield" id="current-employer">
											<input class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input"  type="text" id="other-occupation" name="otherOccupation" />
											<label class="mdl-textfield__label so-mdl-textfield-label" for="other-occupation"><fmt:message key="placeholder.please.specify" bundle="${msg}" /></label> 
										</div>
										<span class="error-msg" id="otherOccupationErMsg"></span>
									</div>
									<div class="form-group unemployment-field hidden">
										<div class="selectDiv centreDiv gray-text-bg">
											<label class="mdl-textfield__label cstm-dropdown-label"><fmt:message key="placeholder.other.sources.of.income" bundle="${msg}" /></label>
											<select name="tmpOtherIncomeAmount" id="tmpOtherIncomeAmount" class="form-control gray-dropdown">
											   <option value="" disabled="disabled" selected="selected"><fmt:message key="placeholder.other.sources.of.income" bundle="${msg}" /></option>
											   <c:if test="${language == 'en'}">
													<c:forEach var="list" items="${etAmountOtherSourceEN}">
														<option value="${list.itemCode }-${list.itemDesc }" <c:if test="${lifeEmploymentInfo.amountOfOtherSourceOfIncome == list.itemCode}">selected="selected"</c:if>>${list.itemDesc }</option>
													</c:forEach>
												</c:if>
												<c:if test="${language == 'tc'}">
													<c:forEach var="list" items="${etAmountOtherSourceCN}">
														<option value="${list.itemCode }-${list.itemDesc }" <c:if test="${lifeEmploymentInfo.amountOfOtherSourceOfIncome == list.itemCode}">selected="selected"</c:if>>${list.itemDesc }</option>
													</c:forEach>
												</c:if>	
											</select>
											<input type="hidden" id="amountOfOtherSourceOfIncome" name="amountOfOtherSourceOfIncome">
											<img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg">
										</div>
										<span class="error-msg" id="otherIncomeAmountErMsg"></span>
									</div>
								</div>
								<div class="col-xs-12 col-md-6" id="right-side">
									<div class="form-group employment-field">
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield" id="current-employer">
											<input class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input"  type="text" id="currentEmployer" name="employerName" value="${lifeEmploymentInfo.employerName }" />
											<label class="mdl-textfield__label so-mdl-textfield-label" for="correspondenceAddress3"><fmt:message key="placeholder.current.employer.name" bundle="${msg}" /></label> 
										</div>
										<span class="error-msg" id="currentEmployerErMsg"></span>
									</div>
									<div class="form-group employment-field">
										<div class="selectDiv centreDiv gray-text-bg">
											<label class="mdl-textfield__label cstm-dropdown-label"><fmt:message key="placeholder.monthly.personal.income" bundle="${msg}" /></label>
											<select name="tmpMonthlyPersonalIncome" id="tmpMonthlyPersonalIncome" class="form-control gray-dropdown">
											   <option value="" disabled="disabled" selected="selected"><fmt:message key="placeholder.monthly.personal.income" bundle="${msg}" /></option>
											   <c:if test="${language == 'en'}">
													<c:forEach var="list" items="${monthlyPersonalIncomeEN}">
													    <c:set var="code" value="${list.itemCode }-${list.itemDesc }"/>
														<option value="${list.itemCode }-${list.itemDesc }" <c:if test="${lifeEmploymentInfo.monthlyPersonalIncome == code}">selected="selected"</c:if>>${list.itemDesc }</option>
													</c:forEach>
												</c:if>
												<c:if test="${language == 'tc'}">
													<c:forEach var="list" items="${monthlyPersonalIncomeCN}">
													    <c:set var="code" value="${list.itemCode }-${list.itemDesc }"/>
														<option value="${list.itemCode }-${list.itemDesc }" <c:if test="${lifeEmploymentInfo.monthlyPersonalIncome == code}">selected="selected"</c:if>>${list.itemDesc }</option>
													</c:forEach>
												</c:if>	
											</select>
											
											<c:if test="${language == 'en'}">
												<c:forEach var="list" items="${monthlyPersonalIncomeEN}">
												    <c:set var="code" value="${list.itemCode }-${list.itemDesc }"/>
													<c:if test="${lifeEmploymentInfo.monthlyPersonalIncome == code}"><c:set var="monthlyPersonalIncomeCode" value="${list.itemCode }-${list.itemDesc }"/></c:if>
												</c:forEach>
											</c:if>
											<c:if test="${language == 'tc'}">
												<c:forEach var="list" items="${monthlyPersonalIncomeCN}">
												    <c:set var="code" value="${list.itemCode }-${list.itemDesc }"/>
													<c:if test="${lifeEmploymentInfo.monthlyPersonalIncome == code}"><c:set var="monthlyPersonalIncomeCode" value="${list.itemCode }-${list.itemDesc }"/></c:if>
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
														<option value="${list.itemCode }-${list.itemDesc }" 
														    <c:choose>  
															   <c:when test="${savieFna.education == '0' && list.itemCode == 'EL1'}">selected="selected"</c:when>
															   <c:when test="${savieFna.education == '1' && list.itemCode == 'EL2'}">selected="selected"</c:when>
															   <c:when test="${savieFna.education == '2' && list.itemCode == 'EL3'}">selected="selected"</c:when>
															   <c:when test="${savieFna.education == '3' && list.itemCode == 'EL4'}">selected="selected"</c:when>
															   <c:otherwise></c:otherwise>  
															</c:choose>
														>${list.itemDesc }</option>
													</c:forEach>
												</c:if>
												<c:if test="${language == 'tc'}">
													<c:forEach var="list" items="${etEducationLevelCN}">
														<option value="${list.itemCode }-${list.itemDesc }" 
														    <c:choose>  
															   <c:when test="${savieFna.education == '0' && list.itemCode == 'EL1'}">selected="selected"</c:when>
															   <c:when test="${savieFna.education == '1' && list.itemCode == 'EL2'}">selected="selected"</c:when>
															   <c:when test="${savieFna.education == '2' && list.itemCode == 'EL3'}">selected="selected"</c:when>
															   <c:when test="${savieFna.education == '3' && list.itemCode == 'EL4'}">selected="selected"</c:when>
															   <c:otherwise></c:otherwise>  
															</c:choose>
														>${list.itemDesc }</option>
													</c:forEach>
												</c:if>	
											</select>
											
											<c:if test="${language == 'en'}">
													<c:forEach var="list" items="${etEducationLevelEN}">
														    <c:choose>  
															   <c:when test="${savieFna.education == '0' && list.itemCode == 'EL1'}"><c:set var="educationCode" value="${list.itemCode }-${list.itemDesc }"/></c:when>
															   <c:when test="${savieFna.education == '1' && list.itemCode == 'EL2'}"><c:set var="educationCode" value="${list.itemCode }-${list.itemDesc }"/></c:when>
															   <c:when test="${savieFna.education == '2' && list.itemCode == 'EL3'}"><c:set var="educationCode" value="${list.itemCode }-${list.itemDesc }"/></c:when>
															   <c:when test="${savieFna.education == '3' && list.itemCode == 'EL4'}"><c:set var="educationCode" value="${list.itemCode }-${list.itemDesc }"/></c:when>
															   <c:otherwise></c:otherwise>  
															</c:choose>
													</c:forEach>
												</c:if>
												<c:if test="${language == 'tc'}">
													<c:forEach var="list" items="${etEducationLevelCN}">
														    <c:choose>  
															   <c:when test="${savieFna.education == '0' && list.itemCode == 'EL1'}"><c:set var="educationCode" value="${list.itemCode }-${list.itemDesc }"/></c:when>
															   <c:when test="${savieFna.education == '1' && list.itemCode == 'EL2'}"><c:set var="educationCode" value="${list.itemCode }-${list.itemDesc }"/></c:when>
															   <c:when test="${savieFna.education == '2' && list.itemCode == 'EL3'}"><c:set var="educationCode" value="${list.itemCode }-${list.itemDesc }"/></c:when>
															   <c:when test="${savieFna.education == '3' && list.itemCode == 'EL4'}"><c:set var="educationCode" value="${list.itemCode }-${list.itemDesc }"/></c:when>
															   <c:otherwise></c:otherwise>  
															</c:choose>
													</c:forEach>
												</c:if>	
											<input type="hidden" id="education" name="education" value="${educationCode }">
											<img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg">
										</div>
										<span class="error-msg" id="educationLevelErMsg"></span>
									</div>
									<div class="form-group unemployment-field hidden">
										<div class="selectDiv centreDiv gray-text-bg">
											<label class="mdl-textfield__label cstm-dropdown-label"><fmt:message key="placeholder.liquid.assets" bundle="${msg}" /></label>
											<select name="tmpLiquidAssetsAmount" id="tmpLiquidAssetsAmount" class="form-control gray-dropdown">
											   <option value="" disabled selected><fmt:message key="placeholder.liquid.assets" bundle="${msg}" /></option>
											   <c:if test="${language == 'en'}">
													<c:forEach var="list" items="${etLiquidAssetEN}">
														<option value="${list.itemCode }-${list.itemDesc }" <c:if test="${lifeEmploymentInfo.amountOfLiquidAssets == list.itemCode}">selected="selected"</c:if>>${list.itemDesc }</option>
													</c:forEach>
												</c:if>
												<c:if test="${language == 'tc'}">
													<c:forEach var="list" items="${etLiquidAssetCN}">
														<option value="${list.itemCode }-${list.itemDesc }" <c:if test="${lifeEmploymentInfo.amountOfLiquidAssets == list.itemCode}">selected="selected"</c:if>>${list.itemDesc }</option>
													</c:forEach>
												</c:if>	
											</select>
											<input type="hidden" id="amountOfLiquidAssets" name="amountOfLiquidAssets">
											<img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg">
										</div>
										<span class="error-msg" id="liquidAssetsAmountErMsg"></span>
									</div>
								</div>
	  							<div class="col-xs-12 text-center">
	  								<button type="submit" class="btn savie-common-btn" id="next-btn"><fmt:message key="button.Next" bundle="${msg}" /></button><br />
	  								<button type="button" class="btn savie-common-btn hidden" id="back-summary-btn"><fmt:message key="button.next" bundle="${msg}" /></button>
									<a href="#" id="save-cont-link"><fmt:message key="label.save.and.continue.later" bundle="${msg}" /></a>
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
				setSelectReadonly('tmpEmploymentStatus', true);
				setSelectReadonly('tmpBusinessNature', true);
				setSelectReadonly('tmpOccupation', true);
				setSelectReadonly('tmpEducationLevel', true);
				
				var dummy = true;
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
				
				$('.save-exit-btn1, #keep-going-btn').click(function() {
					$('#save-and-continue-modal').modal('hide');
				});
				
				// application saved modal will show after clicking 'Save and exit' button 
				$('.save-exit-btn2, #save-exit-btn').click(function() {
					$("#errorMsg").html("");
					$.ajax({
						  type : "POST",
						  async:false, 
						  url : "<%=request.getContextPath()%>/ajax/savings-insurance/lifeEmploymentInfoSaveforLater",
						  data: $("#employmentInfoForm").serialize(),
						  success : function(data) {
							  if(data != null && data.errorMsg != null && data.errorMsg != ""){
								  $('#save-and-continue-modal').modal('hide');
								  $("#errorMsg").html(data.errorMsg);
							  }
							  else{
								  $('#save-and-continue-batch5-modal').modal('hide');
								  $('#application-saved-modal').modal('show');
								  sendEmailForSaveLater("beneficiary-info");
							  }
						  }
				     });
				});
				
				$('#btn-app-save').click(function() {
					window.location = '<%=request.getContextPath()%>/${language}/savings-insurance';
				});
				
				$('select').change(function() {
					$(this).blur();
				});
				$('option').click(function() {
					$('select').blur();
				});
				// detect IE browsers
				if (window.clipboardData) {
					$('.selectDiv .gray-dropdown').addClass('ie-select');
				} else {
					$('.selectDiv .gray-dropdown').removeClass('ie-select');
				}
				
				// Form validation
				$('#employmentInfoForm').bootstrapValidator({
					excluded: [':disabled', ':hidden', ':not(:visible)'],
					fields: {
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
					}
				}).on('success.form.bv', function(e) {
					e.preventDefault();
				}).on('error.form.bv', function(e) {
				});
				
				$('#save-cont-link').on('click', function (e) {
                    if($('#employmentInfoForm').data('bootstrapValidator').isValid()) {
						$('#save-and-continue-batch5-modal').modal('show');
                    } else {
						$('#save-and-continue-modal').modal('show');
                    }
                });
				
				$('.occupation').on('change', function () {
					showHideOtherOccupationField($(this).val());
				});
				
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
			
			$("#next-btn").click(function(){
				$("#errorMsg").html("");
				$.ajax({
					  type : "POST",
					  async:false, 
					  url : "<%=request.getContextPath()%>/ajax/savings-insurance/lifeEmploymentInfo",
					  data: $("#employmentInfoForm").serialize(),
					  success : function(data) {
						  if(data != null && data.errorMsg != null && data.errorMsg != ""){
							  $("#errorMsg").html(data.errorMsg);
						  }
						  else{
							  if('${backSummary}'=="Y"){
								  window.location = '<%=request.getContextPath()%>/${language}/savings-insurance/${nextPageFlow2}';
							  }
							  else{
								  window.location = '<%=request.getContextPath()%>/${language}/savings-insurance/${nextPageFlow}';
							  }
						  }
					  }
			     });
			});
		</script>
	</body>
</html>	
