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
	    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/material.min.css" />
		<meta name="apple-mobile-web-app-capable" content="yes" />
	</head>
	<body>
		<%!
			boolean isSaleActiveClass = false;
			boolean isEservicesActiveClass = false;
		%>
		<div class="fwd-savie-wrapper savie-online-container with-breadcrumbs-steps" id="beneficiary-name-others-page">
			<!-- HEADER -->
			
			<div id="savie-online">
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
				    		breadcrumb.item.home,breadcrumb.item.protect,breadcrumb.item.cansurance,breadcrumb.item.application
						</c:set>
				    	<c:set var="breadcrumbActive">3</c:set>
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
				    		stepindicator.underwriting,stepindicator.application,stepindicator.declaration.payment,stepindicator.upload.document2,stepindicator.confirmation
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
				<!-- BENEFICIARY INFO BLOCK -->
				<div id="so-beneficiary-info-section" class="headerStick">
					<div class="container-fluid fwd-full-container" id="container-beneficiary">
						<div id="fwd-container-beneficiary" class="fwd-container-limit clearfix sidebar personal-info-widget page-application et-application-page">
							<h4 class="so-h4 text-bold"><fmt:message key="label.beneficiary.info" bundle="${msg}" /></h4>
							<div id="errorMsg" style="color: red;"></div>
							<form id="beneficiary-info-form[0]" class="beneficiary-form-content" method="post" action="">
								<div class="radio-group clearfix">
								   <div class="radio-button-group">
									  <div class="clearfix desktop-align left">
										 <div class="pull-left radio-holder">
											<input type="radio" id="own-estate-id" name="isOwnEstate" value="true" checked /> <label for="own-estate-id"></label>
										 </div>
										 <div class="pull-left desc text-bold">
											<fmt:message key="option.own.estate" bundle="${msg}" />
										 </div>
									  </div>
									  <div class="clearfix below desktop-align">
										 <div class="pull-left radio-holder">
											<input type="radio" id="name-others-id" name="isOwnEstate" value="false" /> <label for="name-others-id"></label>
										 </div>
										 <div class="pull-left desc text-bold">
											<fmt:message key="option.name.other" bundle="${msg}" />
										 </div>
									  </div>
								   </div>
								</div>
								<div id="beneficiary-contents" class="col-md-4 col-lg-4 col-sm-12 col-xs-12 hidden">
									<div class="clearfix add-on-header default-head-h5" id="beneficiary-header[0]">
										<div class="pull-left">
											<h5 class="beneficiary-h5 hidden-lg hidden-md"><fmt:message key="label.option.bene1" bundle="${msg}" /></h5>
										</div>
									</div>
									<div class="form-group has-error beneficiary-info-row">
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
											<input type="text" autocomplete="off" id="beneficiaryLastName[0]" name="beneficaryLastName1" value="${lifeBeneficaryInfo.beneficaryLastName1 }" class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input" maxlength="25" />
											<label class="text-bold mdl-textfield__label so-mdl-textfield-label" for="beneficiaryLastName[0]"><fmt:message key="placeholder.last.name" bundle="${msg}" /></label>
										</div>
										<span class="error-msg" id="beneficiaryLastErMsg[0]"></span>
									</div>
									<div class="form-group has-error beneficiary-info-row">
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
											<input type="text" autocomplete="off" id="beneficiaryFirstName[0]" name="beneficaryFirstName1" value="${lifeBeneficaryInfo.beneficaryFirstName1 }" class="form-control gray-textbox form-textbox mdl-textfield__input so-mdl-textfield-input" maxlength="25" />
											<label class="text-bold mdl-textfield__label so-mdl-textfield-label" for="beneficiaryFirstName[0]"><fmt:message key="placeholder.first.name" bundle="${msg}" /></label>
										</div>
										<input type="text" autocomplete="off" autocomplete="off" id="beneficiaryFullName[0]" hidden />
										<span class="error-msg" id="beneficiaryFirstErMsg[0]"></span>
										<span class="dup-error-msg hidden" id="beneficiaryDupNameErMsg[0]">Duplicate english name</span>
									</div>
									<div class="form-group beneficiary-info-row">
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
											<input type="text" autocomplete="off" id="beneficiaryChineseName[0]" name="beneficaryChineseName1" value="${lifeBeneficaryInfo.beneficaryChineseName1 }" class="form-control gray-textbox form-textbox form-textbox mdl-textfield__input so-mdl-textfield-input" />
											<label class="text-bold mdl-textfield__label so-mdl-textfield-label" for="beneficiaryChineseName[0]"><fmt:message key="placeholder.chinese.name" bundle="${msg}" /></label>
										</div>
										<span class="error-msg" id="beneficiaryChineseNameErMsg[0]"></span>
										<span class="error-msg" id="beneficiaryChineseNameErMsg0"></span>
										<span class="dup-error-msg hidden" id="beneficiaryDupChineseErMsg[0]">Duplicate chinese name</span>
									</div>
									<div class="form-group has-error beneficiary-info-row">
										<div class="clearfix">
											<div class="left-desktop text-box">
											   <div class="selectDiv">
												  <label class="text-bold mdl-textfield__label cstm-dropdown-label"><fmt:message key="placeholder.hkid.passport" bundle="${msg}" /></label>
												  <select class="form-control gray-dropdown" name="beneficiaryHkidPassport1" id="beneficiaryHkidPassport[0]">
													 <option value="" disabled="disabled"><fmt:message key="placeholder.hkid.passport" bundle="${msg}" /></option>
													 <option value="hkid" <c:if test="${lifeBeneficaryInfo.beneficiaryHkidPassport1 == 'hkid' }">selected="selected"</c:if>><fmt:message key="flight.details.applicant.hkid" bundle="${msg}" /></option>
													 <option value="passport" <c:if test="${lifeBeneficaryInfo.beneficiaryHkidPassport1 == 'passport' }">selected="selected"</c:if>><fmt:message key="home.details.applicant.passport" bundle="${msg}" /></option>
												  </select>
												  <img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg">
											   </div>
											   <span class="error-msg" id="beneficiaryHkidPassportErMsg[0]"></span>
											</div>
										 </div>
									 </div>
									<div class="form-group has-error beneficiary-info-row">
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield" id="hkid-inputfield-0">
											<input type="text" autocomplete="off" id="beneficiaryHkid[0]" name="beneficaryID1" value="${lifeBeneficaryInfo.beneficaryID1 }" class="form-control gray-textbox form-textbox mdl-textfield__input so-mdl-textfield-input" />
											<label class="text-bold mdl-textfield__label so-mdl-textfield-label" for="beneficiaryHkid[0]"><fmt:message key="placeholder.hkid.passport.no" bundle="${msg}" /></label>
										</div>
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield hidden" id="passport-inputfield-0">
											<input type="text" autocomplete="off" id="beneficiaryPassport[0]" name="beneficiaryPassport1" value="${lifeBeneficaryInfo.beneficiaryPassport1 }" class="form-control gray-textbox form-textbox mdl-textfield__input so-mdl-textfield-input" />
											<label class="text-bold mdl-textfield__label so-mdl-textfield-label" for="beneficiaryPassport[0]"><fmt:message key="placeholder.hkid.passport.no" bundle="${msg}" /></label>
										</div>
										<span class="error-msg" id="beneficiaryHkidErMsg[0]"></span>
										<span class="error-msg" id="beneficiaryPassErMsg[0]"></span>
										<span class="dup-error-msg hidden" id="beneficiaryDupHkidErMsg[0]">Duplicate beneficiaries HKID</span>
										<span class="dup-error-msg hidden" id="beneficiaryDupPassportErMsg[0]">Duplicate beneficiaries Passport</span>
									</div>
									 <div class="form-group has-error beneficiary-info-row">
										<div class="clearfix">
											<div class="left-desktop text-box">
												<div class="selectDiv">
													<label class="text-bold mdl-textfield__label cstm-dropdown-label"><fmt:message key="placeholder.gender" bundle="${msg}" /></label>
													<select class="form-control gray-dropdown" name="tmpBeneficiaryGender-1" id="tmpBeneficiaryGender-1">
														<option value="" selected="selected" disabled="disabled"><fmt:message key="placeholder.gender" bundle="${msg}" /></option>
														<option value="male" <c:if test="${lifeBeneficaryInfo.beneficaryGender1 == 'male'}">selected="selected"</c:if>><fmt:message key="savie.application.Male" bundle="${msg}" /></option>
														<option value="female" <c:if test="${lifeBeneficaryInfo.beneficaryGender1 == 'female'}">selected="selected"</c:if>><fmt:message key="savie.application.Female" bundle="${msg}" /></option>
													</select>
													<input type="hidden" id="beneficaryGender1" name="beneficaryGender1" value="${lifeBeneficaryInfo.beneficaryGender1 }" />
													<img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg">
												</div>
												<span class="error-msg" id="beneficiaryGenderErMsg[0]"></span>
											</div>
										 </div>
									 </div>
									 <div class="form-group has-error beneficiary-info-row">
										<div class="clearfix">
											<div class="left-desktop text-box">
												<div class="selectDiv">
													<label class="text-bold mdl-textfield__label cstm-dropdown-label"><fmt:message key="placeholder.relation" bundle="${msg}" /></label>
													<select class="form-control gray-dropdown"  id="tmpBeneficiaryRelationship-1" name="tmpBeneficiaryRelationship-1">
														<option value="" selected="selected" disabled="disabled"><fmt:message key="placeholder.relation" bundle="${msg}" /></option>
														<c:if test="${language == 'en'}">
															<c:forEach var="list" items="${savieBeneficiaryRelationshipEN}">
																<enhance:out escapeXml="false">
																    <option value="${list.itemCode }" <c:if test="${lifeBeneficaryInfo.beneficaryRelation1 == list.itemCode}">selected="selected"</c:if>>${list.itemDesc }</option>
																</enhance:out>
															</c:forEach>
														</c:if>
														<c:if test="${language == 'tc'}">
															<c:forEach var="list" items="${savieBeneficiaryRelationshipCN}">
																<enhance:out escapeXml="false">
																    <option value="${list.itemCode }" <c:if test="${lifeBeneficaryInfo.beneficaryRelation1 == list.itemCode}">selected="selected"</c:if>>${list.itemDesc }</option>
																</enhance:out>
															</c:forEach>
														</c:if>
													</select>
													
													<c:if test="${language == 'en'}">
															<c:forEach var="list" items="${savieBeneficiaryRelationshipEN}">
																<c:if test="${lifeBeneficaryInfo.beneficaryRelation1 == list.itemCode}"><c:set var="beneficaryRelationCode1" value="${list.itemCode }"/></c:if>
															</c:forEach>
														</c:if>
														<c:if test="${language == 'tc'}">
															<c:forEach var="list" items="${savieBeneficiaryRelationshipCN}">
																<c:if test="${lifeBeneficaryInfo.beneficaryRelation1 == list.itemCode}"><c:set var="beneficaryRelationCode1" value="${list.itemCode }"/></c:if>
															</c:forEach>
														</c:if>
													<input type="hidden" id="beneficaryRelation1" name="beneficaryRelation1" value="${beneficaryRelationCode1 }" />
													<img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg">
												</div>
												<span class="error-msg" id="beneficiaryRelationErMsg[0]"></span>
											</div>
										 </div>
									 </div>
									 <div class="form-group has-error beneficiary-info-row entitle">
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
											<input type="text" autocomplete="off" id="beneficiaryEntitlement[0]" name="beneficaryWeight1" value="${lifeBeneficaryInfo.beneficaryWeight1 }" class="form-control gray-textbox percentage mdl-textfield__input so-mdl-textfield-input" />
											<label class="text-bold mdl-textfield__label so-mdl-textfield-label" for="beneficiaryEntitlement[0]"><fmt:message key="placeholder.entitlement" bundle="${msg}" /></label>
										</div>
										<span class="error-msg" id="beneficiaryEntitlementErMsg[0]"></span>
									 </div>
								</div>
							</form>
							<!-- Second Beneficiary -->
							<div id="add-beneficiary-1" class="text-center add-on-beneficiary col-md-4 col-lg-4 col-sm-12 col-xs-12 hidden">
								<div class="add-beneficiary" id="beneficiary1">
									<button id="add-beneficiary-btn-1" value="1" class="circle" type="button">
										<img src="<%=request.getContextPath()%>/resources/images/savie-2016/orange-plus.png" />
									</button>
									<div class="add-beneficiary-text">
										<h5><fmt:message key="option.add.beneficiary" bundle="${msg}" /></h5>
									</div>
								</div>
								<div class="clearfix add-on-header hidden" id="beneficiary-header[1]">
									<div class="pull-left">
										<h5 class="beneficiary-h5 hidden-lg hidden-md"><fmt:message key="label.option.bene2" bundle="${msg}" /></h5>
									</div>
									<div class="pull-right">
										<button type="button" class="remove-bnfry-btn" id="remove-beneficiary[1]"><i class="fa fa-minus-circle"></i><fmt:message key="remove.beneficiary" bundle="${msg}" /></button>
									</div>
								</div>
								<form id="beneficiary-info-form[1]" class="beneficiary-form-content hidden" method="post" action="">
									<div class="form-group has-error beneficiary-info-row">
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
											<input type="text" autocomplete="off" id="beneficiaryLastName[1]" name="beneficaryLastName2" value="${lifeBeneficaryInfo.beneficaryLastName2 }" class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input" maxlength="25" />
											<label class="text-bold mdl-textfield__label so-mdl-textfield-label" for="beneficiaryLastName[1]"><fmt:message key="placeholder.last.name" bundle="${msg}" /></label>
										</div>
										<span class="error-msg" id="beneficiaryLastErMsg[1]"></span>
									</div>
									<div class="form-group has-error beneficiary-info-row">
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
											<input type="text" autocomplete="off" id="beneficiaryFirstName[1]" name="beneficaryFirstName2" value="${lifeBeneficaryInfo.beneficaryFirstName2 }" class="form-control gray-textbox form-textbox mdl-textfield__input so-mdl-textfield-input" maxlength="25" />
											<label class="text-bold mdl-textfield__label so-mdl-textfield-label" for="beneficiaryFirstName[1]"><fmt:message key="placeholder.first.name" bundle="${msg}" /></label>
										</div>
										<input type="text" autocomplete="off" autocomplete="off" id="beneficiaryFullName[1]" hidden />
										<span class="error-msg" id="beneficiaryFirstErMsg[1]"></span>
										<span class="dup-error-msg hidden" id="beneficiaryDupNameErMsg[1]">Duplicate english name</span>
									</div>
									<div class="form-group has-error beneficiary-info-row">
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
											<input type="text" autocomplete="off" id="beneficiaryChineseName[1]" name="beneficaryChineseName2" value="${lifeBeneficaryInfo.beneficaryChineseName2 }" class="form-control gray-textbox form-textbox form-textbox mdl-textfield__input so-mdl-textfield-input" />
											<label class="text-bold mdl-textfield__label so-mdl-textfield-label" for="beneficiaryChineseName[1]"><fmt:message key="placeholder.chinese.name" bundle="${msg}" /></label>
										</div>
										<span class="error-msg" id="beneficiaryChineseNameErMsg[1]"></span>
										<span class="error-msg" id="beneficiaryChineseNameErMsg1"></span>
										<span class="dup-error-msg hidden" id="beneficiaryDupChineseErMsg[1]">Duplicate chinese name</span>
									</div>
									<div class="form-group has-error beneficiary-info-row">
										<div class="clearfix">
											<div class="left-desktop text-box">
											   <div class="selectDiv">
												  <label class="text-bold mdl-textfield__label cstm-dropdown-label"><fmt:message key="placeholder.hkid.passport" bundle="${msg}" /></label>
												  <select class="form-control gray-dropdown" name="beneficiaryHkidPassport2" id="beneficiaryHkidPassport[1]">
													 <option value="" selected="selected" disabled="disabled"><fmt:message key="placeholder.hkid.passport" bundle="${msg}" /></option>
													 <option value="hkid" <c:if test="${lifeBeneficaryInfo.beneficiaryHkidPassport2 == 'hkid' }">selected="selected"</c:if>><fmt:message key="flight.details.applicant.hkid" bundle="${msg}" /></option>
													 <option value="passport" <c:if test="${lifeBeneficaryInfo.beneficiaryHkidPassport2 == 'passport' }">selected="selected"</c:if>><fmt:message key="home.details.applicant.passport" bundle="${msg}" /></option>
												  </select>
												  <img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg">
											   </div>
											   <span class="error-msg" id="beneficiaryHkidPassportErMsg[1]"></span>
											</div>
										 </div>
									 </div>
									<div class="form-group has-error beneficiary-info-row">
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield" id="hkid-inputfield-1">
											<input type="text" autocomplete="off" id="beneficiaryHkid[1]" name="beneficaryID2" value="${lifeBeneficaryInfo.beneficaryID2 }" class="form-control gray-textbox form-textbox mdl-textfield__input so-mdl-textfield-input" />
											<label class="text-bold mdl-textfield__label so-mdl-textfield-label" for="beneficiaryHkid[1]"><fmt:message key="placeholder.hkid.passport.no" bundle="${msg}" /></label>
										</div>
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield hidden" id="passport-inputfield-1">
											<input type="text" autocomplete="off" id="beneficiaryPassport[1]" name="beneficiaryPassport2" value="${lifeBeneficaryInfo.beneficiaryPassport2 }" class="form-control gray-textbox form-textbox mdl-textfield__input so-mdl-textfield-input" />
											<label class="text-bold mdl-textfield__label so-mdl-textfield-label" for="beneficiaryPassport[1]"><fmt:message key="placeholder.hkid.passport.no" bundle="${msg}" /></label>
										</div>
										<span class="error-msg" id="beneficiaryHkidErMsg[1]"></span>
										<span class="error-msg" id="beneficiaryPassErMsg[1]"></span>
										<span class="dup-error-msg hidden" id="beneficiaryDupHkidErMsg[1]">Duplicate beneficiaries HKID</span>
										<span class="dup-error-msg hidden" id="beneficiaryDupPassportErMsg[1]">Duplicate beneficiaries Passport</span>
									</div>
									 <div class="form-group has-error beneficiary-info-row">
										<div class="clearfix">
											<div class="left-desktop text-box">
												<div class="selectDiv">
													<label class="text-bold mdl-textfield__label cstm-dropdown-label"><fmt:message key="placeholder.gender" bundle="${msg}" /></label>
													<select class="form-control gray-dropdown" name="tmpBeneficiaryGender-2" id="tmpBeneficiaryGender-2">
														<option value="" selected="selected" disabled="disabled"><fmt:message key="placeholder.gender" bundle="${msg}" /></option>
														<option value="male" <c:if test="${lifeBeneficaryInfo.beneficaryGender2 == 'male'}">selected="selected"</c:if>><fmt:message key="savie.application.Male" bundle="${msg}" /></option>
														<option value="female" <c:if test="${lifeBeneficaryInfo.beneficaryGender2 == 'female'}">selected="selected"</c:if>><fmt:message key="savie.application.Female" bundle="${msg}" /></option>
													</select>
													<input type="hidden" id="beneficaryGender2" name="beneficaryGender2" value="${lifeBeneficaryInfo.beneficaryGender2 }" />
													<img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg">
												</div>
												<span class="error-msg" id="beneficiaryGenderErMsg[1]"></span>
											</div>
										 </div>
									 </div>
									 <div class="form-group has-error beneficiary-info-row">
										<div class="clearfix">
											<div class="left-desktop text-box">
												<div class="selectDiv">
													<label class="text-bold mdl-textfield__label cstm-dropdown-label"><fmt:message key="placeholder.relation" bundle="${msg}" /></label>
													<select class="form-control gray-dropdown"  id="tmpBeneficiaryRelationship-2" name="tmpBeneficiaryRelationship-2">
														<option value="" selected="selected" disabled="disabled"><fmt:message key="placeholder.relation" bundle="${msg}" /></option>
														<c:if test="${language == 'en'}">
															<c:forEach var="list" items="${savieBeneficiaryRelationshipEN}">
																<enhance:out escapeXml="false">
																    <option value="${list.itemCode }" <c:if test="${lifeBeneficaryInfo.beneficaryRelation2 == list.itemCode}">selected="selected"</c:if>>${list.itemDesc }</option>
																</enhance:out>
															</c:forEach>
														</c:if>
														<c:if test="${language == 'tc'}">
															<c:forEach var="list" items="${savieBeneficiaryRelationshipCN}">
																<enhance:out escapeXml="false">
																    <option value="${list.itemCode }" <c:if test="${lifeBeneficaryInfo.beneficaryRelation2 == list.itemCode}">selected="selected"</c:if>>${list.itemDesc }</option>
																</enhance:out>
															</c:forEach>
														</c:if>
													</select>
													
													<c:if test="${language == 'en'}">
															<c:forEach var="list" items="${savieBeneficiaryRelationshipEN}">
																<c:if test="${lifeBeneficaryInfo.beneficaryRelation2 == list.itemCode}"><c:set var="beneficaryRelationCode2" value="${list.itemCode }"/></c:if>
															</c:forEach>
														</c:if>
														<c:if test="${language == 'tc'}">
															<c:forEach var="list" items="${savieBeneficiaryRelationshipCN}">
																<c:if test="${lifeBeneficaryInfo.beneficaryRelation2 == list.itemCode}"><c:set var="beneficaryRelationCode2" value="${list.itemCode }"/></c:if>
															</c:forEach>
														</c:if>
													<input type="hidden" id="beneficaryRelation2" name="beneficaryRelation2" value="${beneficaryRelationCode2 }" />
													<img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg">
												</div>
												<span class="error-msg" id="beneficiaryRelationErMsg[1]"></span>
											</div>
										 </div>
									 </div>
									 <div class="form-group has-error beneficiary-info-row entitle">
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
											<input type="text" autocomplete="off" id="beneficiaryEntitlement[1]" name="beneficaryWeight2" value="${lifeBeneficaryInfo.beneficaryWeight2 }" class="form-control gray-textbox percentage mdl-textfield__input so-mdl-textfield-input" />
											<label class="text-bold mdl-textfield__label so-mdl-textfield-label" for="beneficiaryEntitlement[1]"><fmt:message key="placeholder.entitlement" bundle="${msg}" /></label>
										</div>
										<span class="error-msg" id="beneficiaryEntitlementErMsg[1]"></span>
									 </div>
								</form>
							</div>
							<!-- Third Beneficiary -->
							<div id="add-beneficiary-2" class="text-center add-on-beneficiary col-md-4 col-lg-4 col-sm-12 col-xs-12 last-row hidden">
								<div class="add-beneficiary" id="beneficiary2">
									<button id="add-beneficiary-btn-2" value="2" class="circle disabled-beneficiary-add" type="button">
										<img id="add-btn-img" src="<%=request.getContextPath()%>/resources/images/savie-2016/gray-plus.png" />
									</button>
									<div class="add-beneficiary-text">
										<h5><fmt:message key="option.add.beneficiary" bundle="${msg}" /></h5>
									</div>
								</div>
								<div class="clearfix add-on-header hidden" id="beneficiary-header[2]">
									<div class="pull-left">
										<h5 class="beneficiary-h5 hidden-lg hidden-md"><fmt:message key="label.option.bene3" bundle="${msg}" /></h5>
									</div>
									<div class="pull-right">
										<button type="button" class="remove-bnfry-btn" id="remove-beneficiary[2]"><i class="fa fa-minus-circle"></i><fmt:message key="remove.beneficiary" bundle="${msg}" /></button>
									</div>
								</div>
								<form id="beneficiary-info-form[2]" class="beneficiary-form-content hidden" method="post" action="">
									<div class="form-group has-error beneficiary-info-row">
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
											<input type="text" autocomplete="off" id="beneficiaryLastName[2]" name="beneficaryLastName3" value="${lifeBeneficaryInfo.beneficaryLastName3 }" class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input" maxlength="25" />
											<label class="text-bold mdl-textfield__label so-mdl-textfield-label" for="beneficiaryLastName[2]"><fmt:message key="placeholder.last.name" bundle="${msg}" /></label>
										</div>
										<span class="error-msg" id="beneficiaryLastErMsg[2]"></span>
									</div>
									<div class="form-group has-error beneficiary-info-row">
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
											<input type="text" autocomplete="off" id="beneficiaryFirstName[2]" name="beneficaryFirstName3" value="${lifeBeneficaryInfo.beneficaryFirstName3 }" class="form-control gray-textbox form-textbox mdl-textfield__input so-mdl-textfield-input" maxlength="25" />
											<label class="text-bold mdl-textfield__label so-mdl-textfield-label" for="beneficiaryFirstName[2]"><fmt:message key="placeholder.first.name" bundle="${msg}" /></label>
										</div>
										<input type="text" autocomplete="off" autocomplete="off" id="beneficiaryFullName[2]" hidden />
										<span class="error-msg" id="beneficiaryFirstErMsg[2]"></span>
										<span class="dup-error-msg hidden" id="beneficiaryDupNameErMsg[2]">Duplicate english name</span>
									</div>
									<div class="form-group has-error beneficiary-info-row">
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
											<input type="text" autocomplete="off" id="beneficiaryChineseName[2]" name="beneficaryChineseName3" value="${lifeBeneficaryInfo.beneficaryChineseName3 }" class="form-control gray-textbox form-textbox form-textbox mdl-textfield__input so-mdl-textfield-input" />
											<label class="text-bold mdl-textfield__label so-mdl-textfield-label" for="beneficiaryChineseName[2]"><fmt:message key="placeholder.chinese.name" bundle="${msg}" /></label>
										</div>
										<span class="error-msg" id="beneficiaryChineseNameErMsg[2]"></span>
										<span class="error-msg" id="beneficiaryChineseNameErMsg2"></span>
										<span class="dup-error-msg hidden" id="beneficiaryDupChineseErMsg[2]">Duplicate chinese name</span>
									</div>
									<div class="form-group has-error beneficiary-info-row">
										<div class="clearfix">
											<div class="left-desktop text-box">
											   <div class="selectDiv">
												  <label class="text-bold mdl-textfield__label cstm-dropdown-label"><fmt:message key="placeholder.hkid.passport" bundle="${msg}" /></label>
												  <select class="form-control gray-dropdown" name="beneficiaryHkidPassport3" id="beneficiaryHkidPassport[2]">
													 <option value="" selected="selected" disabled="disabled"><fmt:message key="placeholder.hkid.passport" bundle="${msg}" /></option>
													 <option value="hkid" <c:if test="${lifeBeneficaryInfo.beneficiaryHkidPassport3 == 'hkid' }">selected="selected"</c:if>><fmt:message key="flight.details.applicant.hkid" bundle="${msg}" /></option>
													 <option value="passport" <c:if test="${lifeBeneficaryInfo.beneficiaryHkidPassport3 == 'passport' }">selected="selected"</c:if>><fmt:message key="home.details.applicant.passport" bundle="${msg}" /></option>
												  </select>
												  <img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg">
											   </div>
											   <span class="error-msg" id="beneficiaryHkidPassportErMsg[2]"></span>
											</div>
										 </div>
									 </div>
									<div class="form-group has-error beneficiary-info-row">
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield" id="hkid-inputfield-2">
											<input type="text" autocomplete="off" id="beneficiaryHkid[2]" name="beneficaryID3" value="${lifeBeneficaryInfo.beneficaryID3 }" class="form-control gray-textbox form-textbox mdl-textfield__input so-mdl-textfield-input" />
											<label class="text-bold mdl-textfield__label so-mdl-textfield-label" for="beneficiaryHkid[2]"><fmt:message key="placeholder.hkid.passport.no" bundle="${msg}" /></label>
										</div>
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield hidden" id="passport-inputfield-2">
											<input type="text" autocomplete="off" id="beneficiaryPassport[2]" name="beneficiaryPassport3" value="${lifeBeneficaryInfo.beneficiaryPassport3 }" class="form-control gray-textbox form-textbox mdl-textfield__input so-mdl-textfield-input" />
											<label class="text-bold mdl-textfield__label so-mdl-textfield-label" for="beneficiaryPassport[2]"><fmt:message key="placeholder.hkid.passport.no" bundle="${msg}" /></label>
										</div>
										<span class="error-msg" id="beneficiaryHkidErMsg[2]"></span>
										<span class="error-msg" id="beneficiaryPassErMsg[2]"></span>
										<span class="dup-error-msg hidden" id="beneficiaryDupHkidErMsg[2]">Duplicate beneficiaries HKID</span>
										<span class="dup-error-msg hidden" id="beneficiaryDupPassportErMsg[2]">Duplicate beneficiaries Passport</span>
									</div>
									 <div class="form-group has-error beneficiary-info-row">
										<div class="clearfix">
											<div class="left-desktop text-box">
												<div class="selectDiv">
													<label class="text-bold mdl-textfield__label cstm-dropdown-label"><fmt:message key="placeholder.gender" bundle="${msg}" /></label>
													<select class="form-control gray-dropdown" name="tmpBeneficiaryGender-3" id="tmpBeneficiaryGender-3">
														<option value="" selected="selected" disabled="disabled"><fmt:message key="placeholder.gender" bundle="${msg}" /></option>
														<option value="male" <c:if test="${lifeBeneficaryInfo.beneficaryGender3 == 'male'}">selected="selected"</c:if>><fmt:message key="savie.application.Male" bundle="${msg}" /></option>
														<option value="female" <c:if test="${lifeBeneficaryInfo.beneficaryGender3 == 'female'}">selected="selected"</c:if>><fmt:message key="savie.application.Female" bundle="${msg}" /></option>
													</select>
													<input type="hidden" id="beneficaryGender3" name="beneficaryGender3" value="${lifeBeneficaryInfo.beneficaryGender3 }" />
													<img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg">
												</div>
												<span class="error-msg" id="beneficiaryGenderErMsg[2]"></span>
											</div>
										 </div>
									 </div>
									 <div class="form-group has-error beneficiary-info-row">
										<div class="clearfix">
											<div class="left-desktop text-box">
												<div class="selectDiv">
													<label class="text-bold mdl-textfield__label cstm-dropdown-label"><fmt:message key="placeholder.relation" bundle="${msg}" /></label>
													<select class="form-control gray-dropdown"  id="tmpBeneficiaryRelationship-3" name="tmpBeneficiaryRelationship-3">
														<option value="" selected="selected" disabled="disabled"><fmt:message key="placeholder.relation" bundle="${msg}" /></option>
														<c:if test="${language == 'en'}">
															<c:forEach var="list" items="${savieBeneficiaryRelationshipEN}">
																<enhance:out escapeXml="false">
																    <option value="${list.itemCode }" <c:if test="${lifeBeneficaryInfo.beneficaryRelation3 == list.itemCode}">selected="selected"</c:if>>${list.itemDesc }</option>
																</enhance:out>
															</c:forEach>
														</c:if>
														<c:if test="${language == 'tc'}">
															<c:forEach var="list" items="${savieBeneficiaryRelationshipCN}">
																<enhance:out escapeXml="false">
																    <option value="${list.itemCode }" <c:if test="${lifeBeneficaryInfo.beneficaryRelation3 == list.itemCode}">selected="selected"</c:if>>${list.itemDesc }</option>
																</enhance:out>
															</c:forEach>
														</c:if>
													</select>
													
													<c:if test="${language == 'en'}">
															<c:forEach var="list" items="${savieBeneficiaryRelationshipEN}">
																<c:if test="${lifeBeneficaryInfo.beneficaryRelation3 == list.itemCode}"><c:set var="beneficaryRelationCode3" value="${list.itemCode }"/></c:if>
															</c:forEach>
														</c:if>
														<c:if test="${language == 'tc'}">
															<c:forEach var="list" items="${savieBeneficiaryRelationshipCN}">
																<c:if test="${lifeBeneficaryInfo.beneficaryRelation3 == list.itemCode}"><c:set var="beneficaryRelationCode3" value="${list.itemCode }"/></c:if>
															</c:forEach>
														</c:if>
													<input type="hidden" id="beneficaryRelation3" name="beneficaryRelation3" value="${beneficaryRelationCode3 }" />
													<img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg">
												</div>
												<span class="error-msg" id="beneficiaryRelationErMsg[2]"></span>
											</div>
										 </div>
									 </div>
									 <div class="form-group has-error beneficiary-info-row entitle">
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
											<input type="text" autocomplete="off" id="beneficiaryEntitlement[2]" name="beneficaryWeight3" value="${lifeBeneficaryInfo.beneficaryWeight3 }" class="form-control gray-textbox percentage mdl-textfield__input so-mdl-textfield-input"  />
											<label class="text-bold mdl-textfield__label so-mdl-textfield-label" for="beneficiaryEntitlement[2]"><fmt:message key="placeholder.entitlement" bundle="${msg}" /></label>
										</div>
										<span class="error-msg" id="beneficiaryEntitlementErMsg[2]"></span>
									 </div>
								</form>
							</div>
						</div>
						<div class="fwd-container-limitpersonal-info-widget page-application et-application-page clearfix" id="beneficiary-note">
							<p><fmt:message key="label.change.beneficiary" bundle="${msg}" /></p>
							<div id="beneficiary-btn">
								<button type="submit" class="text-bold btn beneficiary-btn-next savie-common-btn" id="beneficiary-next-btn"><fmt:message key="button.Next" bundle="${msg}" /></button>
								<button type="button" id="back-summary-btn" class="text-bold btn beneficiary-btn-back savie-common-btn hidden"><fmt:message key="button.back.summary" bundle="${msg}" /></button>
								<c:if test="${plan == 'savings-insurance'}">
									<a href="#" class="span-save-continue" id="bf-save-and-con-later">
										<span><fmt:message key="label.save.and.continue.later" bundle="${msg}" /></span>
									</a>
								</c:if>
							</div>
							<div class="col-xs-12 submit__error">
                                <div class="text-center">
                                    <span class="submit__errormsg" id="submit__errormsg">Testing</span>
                                </div>
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
				<h4 class="text-bold text-center welcome-msg"><fmt:message key="label.savie.save.continue.title1" bundle="${msg}" /></h4>
				<p class="text-center description-msg"><fmt:message key="label.savie.save.continue.copy1" bundle="${msg}" /></p>
				<div class="save-con-btns clearfix">
					<button class="text-bold btn savie-common-btn save-exit-btn1 col-sm-6 col-xs-6 col-lg-6 col-md-6"><fmt:message key="button.keep.going" bundle="${msg}" /></button>
					<button class="text-bold btn savie-common-btn save-exit-btn2 col-sm-6 col-xs-6 col-lg-6 col-md-6"><fmt:message key="button.save.and.exit" bundle="${msg}" /></button>
				</div>
			</div>
		  </div>
		</div>
		<!-- Save and continue batch 5 modal -->
		<div class="modal fade common-welcome-modal save-con-modal-b5" id="save-and-continue-batch5-modal" tabindex="-1" role="dialog">
		  <div class="modal-dialog">
			<div class="modal-content save-con-modal-content">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">x</span></button>
				<h4 class="text-bold text-center welcome-msg"><fmt:message key="label.savie.save.continue.title2" bundle="${msg}" /></h4>
				<p class="text-center description-msg"><fmt:message key="label.savie.save.continue.copy2" bundle="${msg}" /></p>
				<div class="save-con-btns clearfix">
					<center>
						<button class="text-bold btn savie-common-btn" id="keep-going-btn"><fmt:message key="button.keep.going" bundle="${msg}" /></button>
						<button class="text-bold btn savie-common-btn disabled-gray-btn" id="save-exit-btn"><fmt:message key="button.save.and.exit" bundle="${msg}" /></button>
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
				 <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<p class="text-center"><fmt:message key="label.saved.application.title" bundle="${msg}" /></p>
				 </div>
				 <div class="modal-body" id="moda-body-appsave">
					<p class="text-bold text-center"><fmt:message key="label.saved.application.copy" bundle="${msg}" /></p>
					<div class="btn-appsave">
						<button href="#" class="text-bold center-block btn savie-common-btn" id="btn-app-save"><fmt:message key="button.backtohome" bundle="${msg}" /></button>
					</div>
				 </div>
			 </div>
		  </div>
		</div>
		<!-- JS INCLUDES -->
		<script type="text/javascript">
		var getpath = "<%=request.getContextPath()%>";
		var language = "en";
		$(document).ready(function() {
			var isOwnEstate = '${lifeBeneficaryInfo.isOwnEstate}';
			if(isOwnEstate == 'false' || '${lifeBeneficaryInfo.beneficaryFirstName1}' != ''){
				$("#name-others-id").click();
				$('#beneficiary-contents').removeClass('hidden');
				$('.add-on-beneficiary').removeClass('hidden');
				
				if('${lifeBeneficaryInfo.beneficaryFirstName2}' != ''){
					$('#beneficiary1').addClass('hidden');
					$('#beneficiary-header\\[1\\]').removeClass('hidden');
					$('#beneficiary-info-form\\[1\\]').removeClass('hidden');
					$('#add-beneficiary-btn-2').removeClass('disabled-beneficiary-add');
					$('#add-btn-img').attr('src', '<%=request.getContextPath()%>/resources/images/savie-2016/orange-plus.png');
				}
				
				if('${lifeBeneficaryInfo.beneficaryFirstName3}' != ''){
					$('#beneficiary2').addClass('hidden');
					$('#beneficiary-header\\[2\\]').removeClass('hidden');
					$('#beneficiary-info-form\\[2\\]').removeClass('hidden');
				}
			}
			else{
				$("#own-estate-id").click();
				$('#beneficiary-contents').addClass('hidden');
				$('.add-on-beneficiary').addClass('hidden');
				//$('#bf-save-and-con-later').attr('data-target','#save-and-continue-batch5-modal');
			}

			//init next button text
			if('${backSummary}'=="Y"){
				var htmlObj = document.getElementById('beneficiary-next-btn');
				htmlObj.innerHTML = 'Back to application summary';
			}
	
			
			var dummy = true;
			if('${backSummary}' == 'Y'){
				dummy = false;
			}
			// dummy condition for displaying the back / next button
			if(dummy) {
				// hide the back button and display the Next button
				$('.beneficiary-btn-next, #bf-save-and-con-later').removeClass('hidden');
				$('.beneficiary-btn-back').addClass('hidden');
			} else {
				// display the back button and hide the Next button
				$('.beneficiary-btn-next, #bf-save-and-con-later').addClass('hidden');
				$('.beneficiary-btn-back').removeClass('hidden');
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
				showSubmitError('', false);
				var formdata1 = $('#beneficiary-info-form\\[0\\]').serialize()+"&"+
				   $('#beneficiary-info-form\\[1\\]').serialize()+"&"+
				   $('#beneficiary-info-form\\[2\\]').serialize()+"&type="+1;
				$.ajax({
					  type : "POST",
					  async:false, 
					  url : "<%=request.getContextPath()%>/ajax/savings-insurance/lifeBeneficaryInfoSaveforLater",
					  data: formdata1,
					  success : function(data) {
						  if(data != null && data.errorMsg != null && data.errorMsg != ""){
							  $('#save-and-continue-modal').modal('hide');
							  showSubmitError(data.errorMsg, true);
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
				var formdata1 = $('#beneficiary-info-form\\[0\\]').serialize()+"&"+
				   $('#beneficiary-info-form\\[1\\]').serialize()+"&"+
				   $('#beneficiary-info-form\\[2\\]').serialize()+"&type="+2;
				$.ajax({
					  type : "POST",
					  async:false, 
					  url : "<%=request.getContextPath()%>/ajax/savings-insurance/lifeBeneficaryInfoSaveforLater",
					  data: formdata1,
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
			
			soFirstBFormValidation();
			soSecondFormValidation();
			soThirdFormValidation();
			$('#beneficiary-info-form\\[0\\]').data('bootstrapValidator').validate();
			
			$('.selectDiv').removeClass('is-not-active');
			
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
			
			var form1Valid = true;
			var form2Valid = true;
			$('#beneficiary-info-form\\[0\\]').bootstrapValidator('validate');
			if(isBeneficiary2Hidden()!="hidden"){
				$('#beneficiary-info-form\\[0\\]').bootstrapValidator('validate');
				$('#beneficiary-info-form\\[1\\]').bootstrapValidator('validate');
				form1Valid = $('#beneficiary-info-form\\[1\\]').data('bootstrapValidator').isValid();
			}
	        if(isBeneficiary3Hidden()!="hidden"){
	        	$('#beneficiary-info-form\\[0\\]').bootstrapValidator('validate');
	        	$('#beneficiary-info-form\\[1\\]').bootstrapValidator('validate');
	        	$('#beneficiary-info-form\\[2\\]').bootstrapValidator('validate');
	                form2Valid = $('#beneficiary-info-form\\[2\\]').data('bootstrapValidator').isValid();
	        }
			
			$('#bf-save-and-con-later').on('click', function (e) {
				if(($('#beneficiary-info-form\\[0\\]').data('bootstrapValidator').isValid() && form1Valid==true && form2Valid==true && totalBeneficiaryEntitlement() !="Exceed") || $('#own-estate-id').is(':checked')){
					$('#save-and-continue-batch5-modal').modal('show');
				}
				else{
					$('#save-and-continue-modal').modal('show');
				}
				
				/* if($('#beneficiary-info-form\\[0\\]').val() == undefined ) {
					$('#beneficiary-info-form\\[0\\]').data('bootstrapValidator').enableFieldValidators('beneficaryChineseName1', false);
				}
				$('#beneficiary-info-form\\[0\\]').data('bootstrapValidator').validateField('beneficaryChineseName1');
				$('#beneficiary-info-form\\[0\\]').bootstrapValidator('validate');
				if($('#beneficiary-info-form\\[0\\]').data('bootstrapValidator').isValid()) {
				   $('#save-and-continue-batch5-modal').modal('show');           
				} else {
					
				}
				// second form
				if($('#beneficiary-info-form\\[1\\]').length == 0) {
					$('#beneficiary-info-form\\[1\\]').data('bootstrapValidator').enableFieldValidators('beneficaryChineseName2', false);
				}
				$('#beneficiary-info-form\\[1\\]').data('bootstrapValidator').validateField('beneficaryChineseName2');
				if($('#beneficiary-info-form\\[1\\]').data('bootstrapValidator').isValid()) {
				   $('#save-and-continue-batch5-modal').modal('show');           
				} else {
					$('#save-and-continue-modal').modal('show');
				}
				// third form
				if($('#beneficiary-info-form\\[2\\]').length == 0) {
					$('#beneficiary-info-form\\[2\\]').data('bootstrapValidator').enableFieldValidators('beneficaryChineseName3', false);
				}
				$('#beneficiary-info-form\\[2\\]').data('bootstrapValidator').validateField('beneficaryChineseName3');
				if($('#beneficiary-info-form\\[2\\]').data('bootstrapValidator').isValid()) {
				   $('#save-and-continue-batch5-modal').modal('show');           
				} else {
					$('#save-and-continue-modal').modal('show');
				} */
         });
			$("#beneficiary-next-btn, #back-summary-btn").click(function() {
				$('#beneficiary-info-form\\[0\\]').bootstrapValidator('validate');
				if(($('#beneficiary-info-form\\[0\\]').data('bootstrapValidator').isValid() && form1Valid==true && form2Valid==true && totalBeneficiaryEntitlement() !="Exceed") || $('#own-estate-id').is(':checked')){
					showSubmitError('', false);
					var formdata = $('#beneficiary-info-form\\[0\\]').serialize()+"&"+
								   $('#beneficiary-info-form\\[1\\]').serialize()+"&"+
								   $('#beneficiary-info-form\\[2\\]').serialize();
					$.ajax({
						  type : "POST",
						  async:false, 
						  url : "<%=request.getContextPath()%>/ajax/savings-insurance/lifeBeneficaryInfo",
						  data: formdata,
						  success : function(data) {
							  console.log(data);
							  if(data != null && data.errorMsg != null && data.errorMsg != ""){
									var bene_errmsg = '';
									if( data.errorMsg == "Beneficiary's HKID cannot be the same as Insured Person's HKID."){
										bene_errmsg = getBundle(getBundleLanguage, "beneficiary.hkId.same.message");
							  	  	} else if( data.errorMsg == "Beneficiary's HKID No. cannot be duplicated."){
							  	  		bene_errmsg = getBundle(getBundleLanguage, "beneficiary.hkId.duplicate.message");
							  	  	} else {
							  	  		bene_errmsg = data.errorMsg;
							  	  	}
									showSubmitError(bene_errmsg, true);
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
			
			function soThirdFormValidation() {
				//Beneficiary Info Form [2]
					$('#beneficiary-info-form\\[2\\]').bootstrapValidator({
						fields: {
							'beneficaryFirstName3':{
								container: '#beneficiaryFirstErMsg\\[2\\]',
								validators: {
								notEmpty: {
									message: '<fmt:message key="error.bene.given.name.empty" bundle="${msg}" />'
								},
								stringLength: {
									max: 25,
									message: getBundle(getBundleLanguage, "form.beneficiary.firstname.length")
								},
							  regexp: {
									 regexp: /^[a-zA-Z\s]+$/ ,
									 message: '<fmt:message key="error.bene.given.name.invalid" bundle="${msg}" />'
								},
							}
							},
							'beneficaryLastName3':{
								container: '#beneficiaryLastErMsg\\[2\\]',
								validators: {
								  notEmpty: {
									 message: '<fmt:message key="error.bene.last.name.empty" bundle="${msg}" />'
									   },
								  stringLength: {
										   min: 1,
										   max: 25,
										   message: getBundle(getBundleLanguage, "form.beneficiary.lastname.length")
									   },
								  regexp: {
									 regexp: /^[a-zA-Z\s]+$/ ,
									 message: '<fmt:message key="error.bene.last.name.invalid" bundle="${msg}" />'
								  }
								}
							},
							'beneficaryChineseName3':{
								container: '#beneficiaryChineseNameErMsg\\[2\\]',
								validators: {
								  stringLength: {
									   min: 1,
									   max: 6,
									   message: getBundle(getBundleLanguage, "form.beneficiary.chineseName.length")
									   },
								  regexp: {
									 regexp: /^[\s\u4e00-\u9fa5]*$/,
									 message: '<fmt:message key="error.bene.chinese.name.invalid" bundle="${msg}" />'
								  },
								  //remote:{
				                  //  	message: '<fmt:message key="error.chinese.name.simplified" bundle="${msg}" />',
					              //  	type: "get",
					              // 	dataType: "json",
					              //  	data: {
					              //  		str: function() {
					              //  	        return $("#beneficiaryChineseName\\[2\\]").val();
					              //  	    }
					               // 	}
					                //},
								  callback: {
									callback: function (value, validator) {
										return true;		                	  
									}
								  }
								}
							},
							'beneficiaryHkidPassport3':{
								container: '#beneficiaryHkidPassportErMsg\\[2\\]',
								validators: {
									notEmpty: {
										message: getBundle(getBundleLanguage, "form.beneficiary.hkidorpassport.empty")
									}
								}
							},
							'beneficiaryPassport3':{
								container: '#beneficiaryPassErMsg\\[2\\]',
								validators: {
									stringLength: {
										min: 5,
										max: 15,
										message: getBundle(getBundleLanguage, "form.beneficiary.passport.length")
									},
									notEmpty: {
										message: '<fmt:message key="error.bene.passport.empty" bundle="${msg}" />'
								   },
								   regexp: {
									  regexp: /^[a-zA-Z0-9\-]*$/,
									  message: '<fmt:message key="error.bene.passport.invalid" bundle="${msg}" />'
								   },
									callback: {
										message: '<fmt:message key="error.bene.passport.invalid" bundle="${msg}" />',
										callback: function(value, validator) {
											if(duplicateBeneficiariesPassport()!=''){
												//$('#beneficiaryPassErMsg\\[2\\] small[data-bv-validator="callback"]').text('<fmt:message key="error.pass.duplicate" bundle="${msg}" />');
												return false;
											}
											return true;
										}
									}
								}
							},
							'beneficaryID3':{
							container: '#beneficiaryHkidErMsg\\[2\\]',
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
									callback: function(value, validator) {
										if(duplicateBeneficiaries()!=''){
											return false;
										}
										/*
										if(duplicateBeneficiariesPassport()!=''){
											return false;
										}
										*/
										if(!IsHKID(value)){
											return false;
										}
										
										return true;
									}
								}
							}
						},
							'tmpBeneficiaryGender-3': {
							   container: '#beneficiaryGenderErMsg\\[2\\]',
							   validators: {
								  notEmpty: {
									 message: '<fmt:message key="error.bene.gender.empty" bundle="${msg}" />'
								  }
							   }
							},
							'tmpBeneficiaryRelationship-3':{
								container: '#beneficiaryRelationErMsg\\[2\\]',
								validators: {
									notEmpty: {
										message: '<fmt:message key="error.bene.relationship.empty" bundle="${msg}" />'
									}
								}
							},
							'beneficaryWeight3':{
								container: '#beneficiaryEntitlementErMsg\\[2\\]',
								validators: {
									notEmpty: {
										message: '<fmt:message key="error.bene.entitlement.empty" bundle="${msg}" />'
									},
									integer:{
										message: getBundle(getBundleLanguage, "form.beneficiary.entitlement.format")
									},
									between:{
										min: 1,
										max: 100,
										message: getBundle(getBundleLanguage, "form.beneficiary.entitlement.range")
									},
									callback: {
										message: '<fmt:message key="error.bene.entitlement.total" bundle="${msg}" />',
										callback: function (value, validator, $field) {
											if(value=='') {
												// display the range error message if it is empty
												$('#beneficiary-info-form\\[2\\]').data('bootstrapValidator').updateStatus('beneficaryWeight3', 'INVALID', 'between');
												return true;
											} else {
												if (totalBeneficiaryEntitlement() == "Exceed") {
													return false;
												} else {
													return true;
												}
											}
										}
									}
								}
							}
						}
					}).on('success.form.bv', function(e) {
						e.preventDefault();
					}).on('error.form.bv', function(e) {
					});
					 
					$( "#beneficiaryEntitlement\\[2\\]" ).on('change', function() {
						if(totalBeneficiaryEntitlement()!="Exceed") {
							$('#beneficiary-info-form\\[0\\]').data('bootstrapValidator').updateStatus('beneficaryWeight1', 'NOT_VALIDATED');
							$('#beneficiary-info-form\\[0\\]').data('bootstrapValidator').validateField('beneficaryWeight1');
							$('#beneficiary-info-form\\[1\\]').data('bootstrapValidator').updateStatus('beneficaryWeight2', 'NOT_VALIDATED');
							$('#beneficiary-info-form\\[1\\]').data('bootstrapValidator').validateField('beneficaryWeight2');
					 		$('#beneficiary-info-form\\[2\\]').data('bootstrapValidator').updateStatus('beneficaryWeight3', 'NOT_VALIDATED');
					 		$('#beneficiary-info-form\\[2\\]').data('bootstrapValidator').validateField('beneficaryWeight3');
						} else {
							$('#beneficiary-info-form\\[0\\]').data('bootstrapValidator').updateStatus('beneficaryWeight1', 'INVALID', 'callback');
							$('#beneficiary-info-form\\[1\\]').data('bootstrapValidator').updateStatus('beneficaryWeight2', 'INVALID', 'callback');
							$('#beneficiary-info-form\\[2\\]').data('bootstrapValidator').updateStatus('beneficaryWeight3', 'INVALID', 'callback');
						}
					});
			}
			
			function soSecondFormValidation() {
				//Beneficiary Info Form [1]
				 $('#beneficiary-info-form\\[1\\]').bootstrapValidator({
					 fields: {
						'beneficaryFirstName2':{
						    container: '#beneficiaryFirstErMsg\\[1\\]',
						    validators: {
								notEmpty: {
								  message: '<fmt:message key="error.bene.given.name.empty" bundle="${msg}" />'
								},
								stringLength: {
									max: 25,
									message: getBundle(getBundleLanguage, "form.beneficiary.firstname.length")
								},
								regexp: {
									regexp: /^[a-zA-Z\s]+$/ ,
									message: '<fmt:message key="error.bene.given.name.invalid" bundle="${msg}" />'
								}
							}
						},
						'beneficaryLastName2':{
							container: '#beneficiaryLastErMsg\\[1\\]',
							validators: {
								notEmpty: {
									message: '<fmt:message key="error.bene.last.name.empty" bundle="${msg}" />'
								},
								stringLength: {
									max: 25,
									message: getBundle(getBundleLanguage, "form.beneficiary.lastname.length")
								},
								regexp: {
									regexp: /^[a-zA-Z\s]+$/ ,
									message: '<fmt:message key="error.bene.last.name.invalid" bundle="${msg}" />'
								}
							}
						},
						'beneficaryChineseName2':{
						   container: '#beneficiaryChineseNameErMsg\\[1\\]',
						   validators: {
								stringLength: {
									min: 1,
									max: 6,
									message: getBundle(getBundleLanguage, "form.beneficiary.chineseName.length")
								},
								regexp: {
									regexp: /^[\s\u4e00-\u9fa5]*$/,
									message: '<fmt:message key="error.bene.chinese.name.invalid" bundle="${msg}" />'
								},
								callback: {
									callback: function (value, validator) {
										return true;		                	  
									}
								}
							}
						},
						'beneficiaryHkidPassport2':{
							container: '#beneficiaryHkidPassportErMsg\\[1\\]',
							validators: {
								notEmpty: {
									message: getBundle(getBundleLanguage, "form.beneficiary.hkidorpassport.empty")
			                    }
							}
						},
						'beneficiaryPassport2':{
							container: '#beneficiaryPassErMsg\\[1\\]',
							validators: {
								stringLength: {
			                        min: 5,
			                        max: 15,
			                        message: getBundle(getBundleLanguage, "form.beneficiary.passport.length")
			                    },
								notEmpty: {
									message: '<fmt:message key="error.bene.passport.empty" bundle="${msg}" />'
				               },
			               regexp: {
			                  regexp: /^[a-zA-Z0-9\-]*$/,
			                  message: '<fmt:message key="error.bene.passport.invalid" bundle="${msg}" />'
			               },
								callback: {
									message: '<fmt:message key="error.bene.passport.invalid" bundle="${msg}" />',
									callback: function(value, validator) {
										if(duplicateBeneficiariesPassport()!=''){
											//$('#beneficiaryPassErMsg\\[1\\] small[data-bv-validator="callback"]').text('<fmt:message key="error.pass.duplicate" bundle="${msg}" />');
											return false;
										}
										return true;
									}
								}
							}
						},
						'beneficaryID2':{
							container: '#beneficiaryHkidErMsg\\[1\\]',
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
		                     callback: function(value, validator) {
										if(duplicateBeneficiaries()!=''){
											//$('#beneficiaryHkidErMsg\\[1\\] small[data-bv-validator="callback"]').text('<fmt:message key="error.hkid.invalid" bundle="${msg}" />');
											return false;
										}
										/*
										if(duplicateBeneficiariesPassport()!=''){
											//$('#beneficiaryHkidErMsg\\[1\\] small[data-bv-validator="callback"]').text('<fmt:message key="error.hkid.invalid" bundle="${msg}" />');
											return false;
										}
										*/
										if(!IsHKID(value)){
											return false;
										}
										
										return true;
		                     }
				            }
							}
						},
						"tmpBeneficiaryGender-2": {
						   container: '#beneficiaryGenderErMsg\\[1\\]',
						   validators: {
							  notEmpty: {
								 message: '<fmt:message key="error.bene.gender.empty" bundle="${msg}" />'
							  }
						   }
						},
						'tmpBeneficiaryRelationship-2':{
						   container: '#beneficiaryRelationErMsg\\[1\\]',
							validators: {
								notEmpty: {
									message: '<fmt:message key="error.bene.relationship.empty" bundle="${msg}" />'
								}
							}
						},
						'beneficaryWeight2':{
						   container: '#beneficiaryEntitlementErMsg\\[1\\]',
						   validators: {
							   notEmpty: {
									message: '<fmt:message key="error.bene.entitlement.empty" bundle="${msg}" />'
								},
								integer:{
									message: getBundle(getBundleLanguage, "form.beneficiary.entitlement.format")
								},
								between:{
									min: 1,
									max: 100,
									message: getBundle(getBundleLanguage, "form.beneficiary.entitlement.range")
								},
								callback: {
									message: '<fmt:message key="error.bene.entitlement.total" bundle="${msg}" />',
									callback: function (value, validator, $field) {
										if(value=='') {
											// display the range error message if it is empty
											$('#beneficiary-info-form\\[1\\]').data('bootstrapValidator').updateStatus('beneficaryWeight2', 'INVALID', 'between');
											return true;
										} else {
											if (totalBeneficiaryEntitlement() == "Exceed") {
												return false;
											} else {
												return true;
											}
										}
									}
								}
							}
						}
					}
				}).on('success.form.bv', function(e) {
					e.preventDefault();
				}).on('error.form.bv', function(e) {
				});
				 
				$( "#beneficiaryEntitlement\\[1\\]" ).on('change', function() {
					if(totalBeneficiaryEntitlement()!="Exceed") {
						$('#beneficiary-info-form\\[0\\]').data('bootstrapValidator').updateStatus('beneficaryWeight1', 'VALID');
						$('#beneficiary-info-form\\[1\\]').data('bootstrapValidator').updateStatus('beneficaryWeight2', 'VALID');
						if( !($('#beneficiaryEntitlement\\[2\\]').hasClass('hidden')) ) {
							$('#beneficiary-info-form\\[0\\]').data('bootstrapValidator').updateStatus('beneficaryWeight1', 'NOT_VALIDATED');
							$('#beneficiary-info-form\\[0\\]').data('bootstrapValidator').validateField('beneficaryWeight1');
							$('#beneficiary-info-form\\[1\\]').data('bootstrapValidator').updateStatus('beneficaryWeight2', 'NOT_VALIDATED');
							$('#beneficiary-info-form\\[1\\]').data('bootstrapValidator').validateField('beneficaryWeight2');
					 		$('#beneficiary-info-form\\[2\\]').data('bootstrapValidator').updateStatus('beneficaryWeight3', 'NOT_VALIDATED');
					 		$('#beneficiary-info-form\\[2\\]').data('bootstrapValidator').validateField('beneficaryWeight3');
						} else {
							$('#beneficiary-info-form\\[0\\]').data('bootstrapValidator').updateStatus('beneficaryWeight1', 'NOT_VALIDATED');
							$('#beneficiary-info-form\\[0\\]').data('bootstrapValidator').validateField('beneficaryWeight1');
							$('#beneficiary-info-form\\[1\\]').data('bootstrapValidator').updateStatus('beneficaryWeight2', 'NOT_VALIDATED');
							$('#beneficiary-info-form\\[1\\]').data('bootstrapValidator').validateField('beneficaryWeight2');
						}
					} else {
						$('#beneficiary-info-form\\[0\\]').data('bootstrapValidator').updateStatus('beneficaryWeight1', 'INVALID','callback');
						$('#beneficiary-info-form\\[1\\]').data('bootstrapValidator').updateStatus('beneficaryWeight2', 'INVALID','callback');
						
						if( !($('#beneficiaryEntitlement\\[2\\]').hasClass('hidden')) ) {
							$('#beneficiary-info-form\\[0\\]').data('bootstrapValidator').updateStatus('beneficaryWeight1', 'INVALID','callback');
							$('#beneficiary-info-form\\[1\\]').data('bootstrapValidator').updateStatus('beneficaryWeight2', 'INVALID','callback');
							$('#beneficiary-info-form\\[2\\]').data('bootstrapValidator').updateStatus('beneficaryWeight3', 'INVALID','callback');
						} else {
							$('#beneficiary-info-form\\[0\\]').data('bootstrapValidator').updateStatus('beneficaryWeight1', 'INVALID','callback');
							$('#beneficiary-info-form\\[1\\]').data('bootstrapValidator').updateStatus('beneficaryWeight2', 'INVALID','callback');
						}
					}
				});
			}
			
			// Beneficiary Form validation
			function soFirstBFormValidation() {
				$('#beneficiary-info-form\\[0\\]').bootstrapValidator({
					fields: {
						'beneficaryFirstName1':{
							container: '#beneficiaryFirstErMsg\\[0\\]',
							validators: {
								notEmpty: {
									message: '<fmt:message key="error.bene.given.name.empty" bundle="${msg}" />'
			               },
								stringLength: {
	                        max: 25,
	                        message: getBundle(getBundleLanguage, "form.beneficiary.firstname.length")
	                    	},
								regexp: {
									regexp: /^[a-zA-Z\s]+$/ ,
									message: '<fmt:message key="error.bene.given.name.invalid" bundle="${msg}" />'
								}
							}
						},
						'beneficaryLastName1':{
							container: '#beneficiaryLastErMsg\\[0\\]',
							validators: {
								notEmpty: {
									message: '<fmt:message key="error.bene.last.name.empty" bundle="${msg}" />'
			                    },
								stringLength: {
			                        max: 25,
			                        message: getBundle(getBundleLanguage, "form.beneficiary.lastname.length")
			                    },
								regexp: {
									regexp: /^[a-zA-Z\s]+$/ ,
									message: '<fmt:message key="error.bene.last.name.invalid" bundle="${msg}" />'
								}
							}
						},
						'beneficaryChineseName1':{
							container: '#beneficiaryChineseNameErMsg\\[0\\]',
							validators: {
								stringLength: {
			                        min: 1,
			                        max: 6,
			                        message: getBundle(getBundleLanguage, "form.beneficiary.chineseName.length")
			                    },
								regexp: {
									regexp: /^[\s\u4e00-\u9fa5]*$/,
									message: '<fmt:message key="error.bene.chinese.name.invalid" bundle="${msg}" />'
								},
								trigger: 'change keyup'
							}
						},
						'beneficiaryHkidPassport1':{
							container: '#beneficiaryHkidPassportErMsg\\[0\\]',
							validators: {
								notEmpty: {
									message: getBundle(getBundleLanguage, "form.beneficiary.hkidorpassport.empty")
			                    }
							}
						},
						myClass: {
			            selector: '#beneficiaryPassport\\[0\\]',
			            container: '#beneficiaryPassErMsg\\[0\\]',
							validators: {
								stringLength: {
			                        min: 5,
			                        max: 15,
			                        message: getBundle(getBundleLanguage, "form.beneficiary.passport.length")
			                    },
								notEmpty: {
									message: '<fmt:message key="error.bene.passport.empty" bundle="${msg}" />'
				               },
			               regexp: {
			                  regexp: /^[a-zA-Z0-9\-]*$/,
			                  message: '<fmt:message key="error.bene.passport.invalid" bundle="${msg}" />'
			               },
								callback: {
									message: '<fmt:message key="error.bene.passport.invalid" bundle="${msg}" />',
									callback: function(value, validator) {
										if(duplicateBeneficiariesPassport()!=''){
											//$('#beneficiaryPassErMsg\\[0\\] small[data-bv-validator="callback"]').text('<fmt:message key="error.pass.duplicate" bundle="${msg}" />');
											return false;
										}
										return true;
									}
								}
							}
			         },
						/* 'beneficiaryPassport1':{
							container: '#beneficiaryPassErMsg\\[0\\]',
							validators: {
								stringLength: {
			                        min: 5,
			                        max: 15,
			                        message: getBundle(getBundleLanguage, "form.beneficiary.passport.length")
			                    },
								notEmpty: {
									message: '<fmt:message key="error.bene.passport.empty" bundle="${msg}" />'
				               },
			               regexp: {
			                  regexp: /^[a-zA-Z0-9\-]*$/,
			                  message: '<fmt:message key="error.bene.passport.invalid" bundle="${msg}" />'
			               }
							}
						}, */
						'beneficaryID1':{
							container: '#beneficiaryHkidErMsg\\[0\\]',
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
		                     callback: function(value, validator) {
										if(duplicateBeneficiaries()!=''){
											return false;
										}
										/*
										if(duplicateBeneficiariesPassport()!=''){
											return false;
										}
										*/
										if(!IsHKID(value)){
											return false;
										}
										
										return true;
		                     }
			                  /* callback: function(value, validator) {
										if(!IsHKID(value)) {
											return {
												valid: false,
												message: getBundle(getBundleLanguage, "form.hkid.invalid")
											}
										}
										return true;
			                  } */
				            }
							}
						},
						'tmpBeneficiaryGender-1': {
						   container: '#beneficiaryGenderErMsg\\[0\\]',
						   validators: {
							  notEmpty: {
								 message: '<fmt:message key="error.bene.gender.empty" bundle="${msg}" />'
							  }
						   }
						},
						'tmpBeneficiaryRelationship-1':{
							container: '#beneficiaryRelationErMsg\\[0\\]',
							validators: {
								notEmpty: {
									message: '<fmt:message key="error.bene.relationship.empty" bundle="${msg}" />'
								}
							}
						},
						'beneficaryWeight1':{
							container: '#beneficiaryEntitlementErMsg\\[0\\]',
							validators: {
								notEmpty: {
									message: '<fmt:message key="error.bene.entitlement.empty" bundle="${msg}" />'
								},
								integer:{
									message: getBundle(getBundleLanguage, "form.beneficiary.entitlement.format")
				            },
			               between:{
			                	min: 1,
			                	max: 100,
		                     message: getBundle(getBundleLanguage, "form.beneficiary.entitlement.range")
		                  },
								callback: {
									message: '<fmt:message key="error.bene.entitlement.total" bundle="${msg}" />',
									callback: function (value, validator, $field) {
										if(value==''){
	                        		// display the range error message if it is empty
	                        		$('#beneficiary-info-form\\[0\\]').data('bootstrapValidator').updateStatus('beneficaryWeight1', 'INVALID', 'between');
	                        		return true;
	                        	} else {
	                        		if (totalBeneficiaryEntitlement() == "Exceed"){
		                          		return false;
		                        	} else {
		                           		return true;
		                        	}
	                        	}
									}
								}
							}
						}
					}
				}).on('success.form.bv', function(e) {
					e.preventDefault();
				}).on('error.form.bv', function(e) {
				});
/* 				var chinNameRegex = /^[\s\u4e00-\u9fa5]*$/;
				//added to fix bene chinese tpying problem in 9 and 11
				if(msieversion()>0){
					$( "#beneficiaryChineseName\\[0\\]" ).on('change keyup', function() {
						//console.log(chinNameRegex.test($( "#beneficiaryChineseName\\[0\\]" ).val()));
						if(chinNameRegex.test($( "#beneficiaryChineseName\\[0\\]" ).val()) && msieversion()>0){
							$('#beneficiary-info-form\\[0\\]').data('bootstrapValidator').updateStatus('#beneficiaryChineseName\\[0\\]', 'VALID');
						}
					});
					$( "#beneficiaryChineseName\\[1\\]" ).on('change keyup', function() {
						//console.log(chinNameRegex.test($( "#beneficiaryChineseName\\[1\\]" ).val()));
						if(chinNameRegex.test($( "#beneficiaryChineseName\\[1\\]" ).val()) && msieversion()>0){
							$('#beneficiary-info-form\\[1\\]').data('bootstrapValidator').updateStatus('#beneficiaryChineseName\\[1\\]', 'VALID');
						}
					});
					$( "#beneficiaryChineseName\\[2\\]" ).on('change keyup', function() {
						//console.log(chinNameRegex.test($( "#beneficiaryChineseName\\[2\\]" ).val()));
						if(chinNameRegex.test($( "#beneficiaryChineseName\\[2\\]" ).val()) && msieversion()>0){
							$('#beneficiary-info-form\\[2\\]').data('bootstrapValidator').updateStatus('#beneficiaryChineseName\\[2\\]', 'VALID');
						}
					});
				} */				
				// end ie chinese typing issue
				$( "#beneficiaryEntitlement\\[0\\]" ).on('change', function() {
					if(totalBeneficiaryEntitlement()!="Exceed") {
						$('#beneficiary-info-form\\[0\\]').data('bootstrapValidator').updateStatus('beneficaryWeight1', 'VALID');
						if( !($('#beneficiaryEntitlement\\[1\\]').hasClass('hidden')) ) {
					 		$('#beneficiary-info-form\\[0\\]').data('bootstrapValidator').updateStatus('beneficaryWeight1', 'NOT_VALIDATED');
					 		$('#beneficiary-info-form\\[0\\]').data('bootstrapValidator').validateField('beneficaryWeight1');
					 		$('#beneficiary-info-form\\[1\\]').data('bootstrapValidator').updateStatus('beneficaryWeight2', 'NOT_VALIDATED');
					 		$('#beneficiary-info-form\\[1\\]').data('bootstrapValidator').validateField('beneficaryWeight2');
						} else {
							$('#beneficiary-info-form\\[0\\]').data('bootstrapValidator').updateStatus('beneficaryWeight1', 'NOT_VALIDATED');
					 		$('#beneficiary-info-form\\[0\\]').data('bootstrapValidator').validateField('beneficaryWeight1');
						}
						if( !($('#beneficiaryEntitlement\\[2\\]').hasClass('hidden')) ) {
							$('#beneficiary-info-form\\[0\\]').data('bootstrapValidator').updateStatus('beneficaryWeight1', 'NOT_VALIDATED');
							$('#beneficiary-info-form\\[0\\]').data('bootstrapValidator').validateField('beneficaryWeight1');
							$('#beneficiary-info-form\\[1\\]').data('bootstrapValidator').updateStatus('beneficaryWeight2', 'NOT_VALIDATED');
							$('#beneficiary-info-form\\[1\\]').data('bootstrapValidator').validateField('beneficaryWeight2');
					 		$('#beneficiary-info-form\\[2\\]').data('bootstrapValidator').updateStatus('beneficaryWeight3', 'NOT_VALIDATED');
					 		$('#beneficiary-info-form\\[2\\]').data('bootstrapValidator').validateField('beneficaryWeight3');
						} else {
							$('#beneficiary-info-form\\[0\\]').data('bootstrapValidator').updateStatus('beneficaryWeight1', 'NOT_VALIDATED');
							$('#beneficiary-info-form\\[0\\]').data('bootstrapValidator').validateField('beneficaryWeight1');
							$('#beneficiary-info-form\\[1\\]').data('bootstrapValidator').updateStatus('beneficaryWeight2', 'NOT_VALIDATED');
							$('#beneficiary-info-form\\[1\\]').data('bootstrapValidator').validateField('beneficaryWeight2');
						}
					} else {
						$('#beneficiary-info-form\\[0\\]').data('bootstrapValidator').updateStatus('beneficaryWeight1', 'INVALID','callback');
						if( !($('#beneficiaryEntitlement\\[1\\]').hasClass('hidden')) ) {
							$('#beneficiary-info-form\\[0\\]').data('bootstrapValidator').updateStatus('beneficaryWeight1', 'INVALID','callback');
							$('#beneficiary-info-form\\[1\\]').data('bootstrapValidator').updateStatus('beneficaryWeight2', 'INVALID','callback');
						} else {
							$('#beneficiary-info-form\\[0\\]').data('bootstrapValidator').updateStatus('beneficaryWeight1', 'INVALID','callback');
						}
						if( !($('#beneficiaryEntitlement\\[2\\]').hasClass('hidden')) ) {
							$('#beneficiary-info-form\\[0\\]').data('bootstrapValidator').updateStatus('beneficaryWeight1', 'INVALID','callback');
							$('#beneficiary-info-form\\[1\\]').data('bootstrapValidator').updateStatus('beneficaryWeight2', 'INVALID','callback');
							$('#beneficiary-info-form\\[2\\]').data('bootstrapValidator').updateStatus('beneficaryWeight3', 'INVALID','callback');
						} else {
							$('#beneficiary-info-form\\[0\\]').data('bootstrapValidator').updateStatus('beneficaryWeight1', 'INVALID','callback');
							$('#beneficiary-info-form\\[1\\]').data('bootstrapValidator').updateStatus('beneficaryWeight2', 'INVALID','callback');
						}
					}
				});
			}

			$('[name="beneficaryChineseName1"],[name="beneficaryChineseName2"],[name="beneficaryChineseName3"]').bind('keypress', function (event) {
				var regex = new RegExp("/^[\s\u4e00-\u9fa5]*$/");
				var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
				if (!regex.test(key)) {
					event.preventDefault();
					return false;
				}
			});
			
		});

		</script>
	</body>
</html>
