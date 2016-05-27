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
		<div class="fwd-savie-wrapper savie-online-container with-breadcrumbs-steps" id="applicant-info-page">
			<!-- HEADER -->
			
			<div id="savie-online">
				
				<!-- Breadcrumb Component Start-->

				    <c:set var="breadcrumbItems" value="breadcrumb.item.home" /> 
					<c:set var="breadcrumbActive" value="0" />

				    <c:if test="${planIndex == 'medical-insurance'}">
				    	<c:set var="breadcrumbItems">
				    		breadcrumb.item.home,breadcrumb.item.protect,breadcrumb.item.easyhealth,breadcrumb.item.application
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
                        <h4 class="so-h4"><fmt:message key="label.savie.application.insured.title" bundle="${msg}" /></h4>
                        <div id="errorMsg" style="color: red;"></div>
                        <form id="soInsuredInfoForm" method="post" class="form-horizontal form-uppercase" action="" onsubmit="return false">
                           <div class="row margin">
                              <div class="col-sm-12 col-md-6 left">
								<div class="clearfix form-group has-error">
									<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
										<input class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input" id="firstname" name="firstname" type="text" autocomplete="off" value="${userDetails.firstName }" autocomplete="off" readonly="readonly" />
										<label class="mdl-textfield__label so-mdl-textfield-label" id="personal-info-label" for="firstName"><fmt:message key="placeholder.first.name" bundle="${msg}" /></label>
									</div>
									<span class="error-msg" id="firstNameErMsg"></span>
									<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
										<input class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input" id="lastname" name="lastname" type="text" autocomplete="off" value="${userDetails.lastName }" autocomplete="off" readonly="readonly" />
										<label class="mdl-textfield__label so-mdl-textfield-label" id="personal-info-label" for="lastName"><fmt:message key="placeholder.last.name" bundle="${msg}" /></label>
									</div>
									<span class="error-msg" id="lastNameErMsg"></span>
								</div>
                                 <div class="clearfix form-group has-error">
									<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
										<input class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input chinese-input" id="chineseName" name="chineseName" type="text" autocomplete="off" value="${lifePersonalDetails.chineseName }" autocomplete="off" />
										<label class="mdl-textfield__label so-mdl-textfield-label" id="personal-info-label" for="chineseName"><fmt:message key="placeholder.chinese.name" bundle="${msg}" /></label>
									</div>
									<span class="error-msg" id="chineseNameErMsg"></span>
                                 </div>
								 			<div class="clearfix form-group has-error" id="gender-errormsg">
                                    <div class="left-desktop text-box">
                                       <div class="selectDiv">
														<label class="mdl-textfield__label cstm-dropdown-label"><fmt:message key="placeholder.gender" bundle="${msg}" /></label>
                                          <select class="form-control gray-dropdown" name="tmpGender" id="tmpGender">
                                             <option value="" <c:if test="${savieFna.gender != '0'&&savieFna.gender != '1'}">selected="selected"</c:if> disabled="disabled"><fmt:message key="placeholder.gender" bundle="${msg}" /></option>
                                             <option value="male" <c:if test="${savieFna.gender == '0'}">selected="selected"</c:if>><fmt:message key="label.male" bundle="${msg}" /></option>
                                             <option value="female" <c:if test="${savieFna.gender == '1'}">selected="selected"</c:if>><fmt:message key="label.female" bundle="${msg}" /></option>
                                          </select>
                                          <input type="hidden" id="gender" name="gender" value="${savieFna.gender == '0' ? 'MALE':'FEMALE'}" />
                                       	<img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg">
                                       </div>
									   			<span class="error-msg" id="genderErMsg"></span>
                                    </div>
                                 </div>
								 <div class="clearfix form-group has-error">
                                    <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
                                       <input class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input" id="hkId" name="hkid" type="text" autocomplete="off" value="${lifePersonalDetails.hkid }" />
									   <label class="mdl-textfield__label so-mdl-textfield-label" for="hkId" id="personal-info-label"><fmt:message key="placeholder.hkid" bundle="${msg}" /></label>
                                    </div>
									<span class="error-msg" id="hkidErMsg"></span>
                                 </div>
								 <div class="clearfix form-group has-error">
                                    <div class="left-desktop text-box">
                                       <div class="selectDiv">
										  <label class="mdl-textfield__label cstm-dropdown-label" id="personal-info"><fmt:message key="placeholder.place.of.Birth" bundle="${msg}" /></label>
                                          <select class="form-control gray-dropdown" name="tmpPlaceOfBirth" id="tmpPlaceOfBirth">
                                             <option value="" selected="selected" disabled="disabled"><fmt:message key="placeholder.place.of.Birth" bundle="${msg}" /></option>
                                             <c:if test="${language == 'en'}">
												<c:forEach var="list" items="${placeOfBirthEN}">
													<enhance:out escapeXml="false">
													    <option value="${list.itemCode }" <c:if test="${lifePersonalDetails.placeOfBirth == list.itemCode}">selected="selected"</c:if>>${list.itemDesc }</option>
													</enhance:out>
												</c:forEach>
											</c:if>
											<c:if test="${language == 'tc'}">
												<c:forEach var="list" items="${placeOfBirthCN}">
													<enhance:out escapeXml="false">
													    <option value="${list.itemCode }" <c:if test="${lifePersonalDetails.placeOfBirth == list.itemCode}">selected="selected"</c:if>>${list.itemDesc }</option>
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
                                          <input type="hidden" id="placeOfBirth" name="placeOfBirth" value="${placeOfBirthCode }" />
                                          <img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg">
                                       </div>
									   <span class="error-msg" id="placeOfBirthErMsg"></span>
                                    </div>
                                 </div>
								 <div class="clearfix form-group has-error">
                                    <div class="left-desktop text-box">
                                       <div class="selectDiv">
										  				<label class="mdl-textfield__label cstm-dropdown-label"><fmt:message key="placeholder.nationality" bundle="${msg}" /></label>
                                          <select class="form-control gray-dropdown" name="tmpNationality" id="tmpNationality">
                                             <option value="" selected="selected" disabled="disabled"><fmt:message key="placeholder.nationality" bundle="${msg}" /></option>
                                             <c:if test="${language == 'en'}">
													<c:forEach var="list" items="${nationalityEN}">
														<enhance:out escapeXml="false">
														    <option value="${list.itemCode }" <c:if test="${lifePersonalDetails.nationalty == list.itemCode}">selected="selected"</c:if>>${list.itemDesc }</option>
														</enhance:out>
													</c:forEach>
												</c:if>
												<c:if test="${language == 'tc'}">
													<c:forEach var="list" items="${nationalityCN}">
														<enhance:out escapeXml="false">
														    <option value="${list.itemCode }" <c:if test="${lifePersonalDetails.nationalty == list.itemCode}">selected="selected"</c:if>>${list.itemDesc }</option>
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
                                          <input type="hidden" id="nationalty" name="nationalty" value="${nationaltyCode }" />
                                          <img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg">
                                       </div>
									   <span class="error-msg" id="nationalityErMsg"></span>
                                    </div>
                                 </div>
                                 <div class="clearfix form-group has-error dob-content">
                                    <div class="left-desktop text-box et-date-info so-mdl-textfield is-focused is-dirty">
										<div class="selectDiv" id="date">
											<label class="mdl-textfield__label cstm-textfield-label" id="personal-info-label"><fmt:message key="placeholder.dob" bundle="${msg}" /></label>
											<input type="text" autocomplete="off" class="form-control gray-textbox" name="dob" id="so-calendar-dob" value="${plan == 'savings-insurance' ? savieFna.dob:ehPlanDetail.dob}" readonly="readonly" />
											<img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg">
										</div>
										<span class="error-msg" id="so-calendar-dob-msg"></span>
                                    </div>
                                 </div>
                              </div>
                              <div class="col-sm-12 col-md-6 right">
								<div class="clearfix form-group has-error">
                                    <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
                                       <div class="clearfix form-group">
                                          <div class="residential-num">
                                             <input class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input cstm-number-field" id="residentialNo" name="residentialTelNo" value="${lifePersonalDetails.residentialTelNo }" type="text" autocomplete="off" maxlength="8" oninput="maxLengthCheck(this)" />
											 <label id="personal-info-label" class="mdl-textfield__label so-mdl-textfield-label" for="residentialNo"><fmt:message key="placeholder.residential.number" bundle="${msg}" /></label>
                                          </div>
                                       </div>
                                    </div>
									<span class="error-msg" id="resTelNoErMsg"></span>
                                 </div>
                                 <div class="clearfix form-group has-error">
                                    <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
                                       <div class="clearfix form-group">
                                          <div class="mobile-num">
                                             <input class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input cstm-number-field" id="mobileNo" name="mobileNumber" readonly="readonly" value="${userDetails.mobileNo }" type="text" autocomplete="off" maxlength="8" oninput="maxLengthCheck(this)" />
											 <label class="mdl-textfield__label so-mdl-textfield-label"id="personal-info-label" for="mobileNo"><fmt:message key="placeholder.mobileno" bundle="${msg}" /></label>
                                          </div>
                                       </div>
                                    </div>
									<span class="error-msg" id="mobileNoErMsg"></span>
                                 </div>
                                 <div class="clearfix form-group has-error">
                                    <div class="left-desktop text-box">
                                       <div class="selectDiv">
									      			<label class="mdl-textfield__label cstm-dropdown-label"><fmt:message key="placeholder.martial.status" bundle="${msg}" /></label>                                          
                                          <select class="form-control gray-dropdown" name="tmpMaritalStatus"  id="tmpMaritalStatus">
                                             <option value="" selected="selected" disabled="disabled"><fmt:message key="placeholder.martial.status" bundle="${msg}" /></option>
                                             <c:if test="${language == 'en'}">
																<c:forEach var="list" items="${maritalStatusesEN}">
																	<option value="${list.itemCode }" 
																	    <c:choose>
																		   <c:when test="${savieFna.marital_status == '0' && list.itemCode == 'MS1'}">selected="selected"</c:when>
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
																<c:forEach var="list" items="${maritalStatusesCN}">
																	<option value="${list.itemCode }" 
																	    <c:choose>  
																		   <c:when test="${savieFna.marital_status == '0' && list.itemCode == 'MS1'}">selected="selected"</c:when>
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
                                          <input type="hidden" id="martialStatus" name="martialStatus" value="${martialStatusCode }" />
                                          <img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg">
                                       </div>
									   			<span class="error-msg" id="maritalStatErMsg"></span>
                                    </div>
                                 </div>
								 <div class="clearfix form-group has-error">
                                    <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
                                       <input class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input" id="emailAddress" name="emailAddress" value="${userDetails.emailAddress }" readonly="readonly" type="email" />
									   <label class="mdl-textfield__label so-mdl-textfield-label" id="personal-info-label" for="emailAddress"><fmt:message key="placeholder.email" bundle="${msg}" /></label>
                                    </div>
									<span class="error-msg" id="emailErMsg"></span>
                                 </div>
                                 <div class="clearfix form-group has-error">
									<span class="warning-note"><fmt:message key="placeholder.permanent.warning" bundle="${msg}" /></span>
									<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
										<input class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input residential residential-chinese-input" id="permanentAddress1" name="permanetAddress1" value="${lifePersonalDetails.permanetAddress1 }" type="text" autocomplete="off" maxlength="29"/>
										<label class="mdl-textfield__label so-mdl-textfield-label" for="permanentAddress1"><fmt:message key="placeholder.peraddress.line1" bundle="${msg}" /></label>
									</div>
									<span class="error-msg" id="permanentAddErMsg"></span>
									<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield res-textfield-hidden">
										<input class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input residential residential-chinese-input res-additional hidden" id="permanentAddress2" name="permanetAddress2" value="${lifePersonalDetails.permanetAddress2 }" type="text" autocomplete="off" maxlength="29"/>
										<label class="mdl-textfield__label so-mdl-textfield-label" for="permanentAddress2"><fmt:message key="placeholder.peraddress.line2" bundle="${msg}" /></label>
									</div>
									<span class="error-msg" id="permanentAdd2ErMsg"></span>
									<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield res-textfield-hidden">
										<input class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input residential residential-chinese-input res-additional hidden" id="permanentAddress3" name="permanetAddress3" value="${lifePersonalDetails.permanetAddress3 }" type="text" autocomplete="off" maxlength="19"/>
										<label class="mdl-textfield__label so-mdl-textfield-label" for="permanentAddress3"><fmt:message key="placeholder.peraddress.line3" bundle="${msg}" /></label>
									</div>
									<span class="error-msg" id="permanentAdd3ErMsg"></span>
												<div class="left-desktop text-box res-additional hidden">
                                       <div class="selectDiv">
										 				<label class="mdl-textfield__label cstm-dropdown-label"><fmt:message key="placeholder.address.district" bundle="${msg}" /></label>
                                          <select class="form-control gray-dropdown" name="tmpPermanentDistrict" id="tmpPermanentDistrict">
                                             <option value="" selected="selected" disabled="disabled"><fmt:message key="placeholder.address.district" bundle="${msg}" /></option>
                                             <c:if test="${language == 'en'}">
												<c:forEach var="list" items="${savieDistrictEN}">
													<enhance:out escapeXml="false">
													    <option value="${list.itemCode }" <c:if test="${lifePersonalDetails.permanetAddressDistrict == list.itemCode}">selected="selected"</c:if>>${list.itemDesc }</option>
													</enhance:out>
												</c:forEach>
											</c:if>
											<c:if test="${language == 'tc'}">
												<c:forEach var="list" items="${savieDistrictCN}">
													<enhance:out escapeXml="false">
													    <option value="${list.itemCode }" <c:if test="${lifePersonalDetails.permanetAddressDistrict == list.itemCode}">selected="selected"</c:if>>${list.itemDesc }</option>
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
                                          <input type="hidden" id="permanetAddressDistrict" name="permanetAddressDistrict" value="${permanetAddressDistrictCode }" />
                                          <img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg">
                                       </div>
									   			<span class="error-msg" id="permanentDistrictErMsg"></span>
                                    </div>
                                 </div>
								 <div class="clearfix">
                                    <div class="left-desktop check-box">
                                       <div class="checkbox-section">
                                          <div class="clearfix">
                                             <div class="pull-left left-checkbox">
                                                <input type="checkbox" value="None" id="diffToPermanent" name="diffToPermanent" <c:if test="${lifePersonalDetails.diffToPermanent == 'None'}">checked="checked"</c:if> onclick="return correspondenceCheckbox();" />
                                                <label for="diffToPermanent"></label>
                                             </div>
                                             <div class="pull-left right-checkbox">
                                                <span id="chkboxdiffToPermanentText" class="checkbox-text"><fmt:message key="label.diff.per.address" bundle="${msg}" /></span>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                                 <div class="clearfix form-group has-error hidden" id="diffToPermanentShow">
                                    <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
                                       <input class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input residential residential-chinese-input" id="residentialAddress1" name="residentialAddress1" value="${lifePersonalDetails.residentialAddress1 }" type="text" autocomplete="off" maxlength="29" />
									   <label class="mdl-textfield__label so-mdl-textfield-label" for="residentialAddress1"><fmt:message key="placeholder.resaddress.line1" bundle="${msg}" /></label>
									</div>
									<span class="error-msg" id="residentialAddErMsg"></span>
									<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
                                       <input class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input residential residential-chinese-input" id="residentialAddress2" name="residentialAddress2" value="${lifePersonalDetails.residentialAddress2 }" type="text" autocomplete="off" maxlength="29" />
									   <label class="mdl-textfield__label so-mdl-textfield-label" for="residentialAddress2"><fmt:message key="placeholder.resaddress.line2" bundle="${msg}" /></label>
									</div>
									<span class="error-msg" id="residentialAdd2ErMsg"></span>
									<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
                                       <input class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input residential residential-chinese-input" id="residentialAddress3" name="residentialAddress3" value="${lifePersonalDetails.residentialAddress3 }" type="text" autocomplete="off" maxlength="19" />
									   <label class="mdl-textfield__label so-mdl-textfield-label" for="residentialAddress3"><fmt:message key="placeholder.resaddress.line3" bundle="${msg}" /></label>
                                    </div>
                                    <span class="error-msg" id="residentialAdd3ErMsg"></span>
									<div class="left-desktop text-box">
                                       <div class="selectDiv">
										 <label class="mdl-textfield__label cstm-dropdown-label"><fmt:message key="placeholder.address.district" bundle="${msg}" /></label>
                                          <select class="form-control gray-dropdown" name="tmpResidentialDistrict" id="tmpResidentialDistrict">
                                             <option value="" selected="selected" disabled="disabled"><fmt:message key="placeholder.address.district" bundle="${msg}" /></option>
                                             <c:if test="${language == 'en'}">
													<c:forEach var="list" items="${savieDistrictEN}">
														<enhance:out escapeXml="false">
														    <option value="${list.itemCode }" <c:if test="${lifePersonalDetails.residentialAddressDistrict == list.itemCode}">selected="selected"</c:if>>${list.itemDesc }</option>
														</enhance:out>
													</c:forEach>
												</c:if>
												<c:if test="${language == 'tc'}">
													<c:forEach var="list" items="${savieDistrictCN}">
														<enhance:out escapeXml="false">
														    <option value="${list.itemCode }" <c:if test="${lifePersonalDetails.residentialAddressDistrict == list.itemCode}">selected="selected"</c:if>>${list.itemDesc }</option>
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
                                          <input type="hidden" id="residentialAddressDistrict" name="residentialAddressDistrict" value="${residentialAddressDistrictCode }" />
                                          <img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg">
                                       </div>
									   <span class="error-msg" id="residentialDistrictErMsg"></span>
                                    </div>
                                 </div>
								 <div class="clearfix">
                                    <div class="left-desktop check-box">
                                       <div class="checkbox-section">
                                          <div class="clearfix">
                                             <div class="pull-left left-checkbox">
                                                <input type="checkbox" value="None" id="diffToResidential" name="diffToResidential" <c:if test="${lifePersonalDetails.diffToResidential == 'None'}">checked="checked"</c:if> onclick="return correspondenceCheckbox();" />
                                                <label for="diffToResidential"></label>
                                             </div>
                                             <div class="pull-left right-checkbox">
                                                <span id="chkboxDiffToResidentialText" class="checkbox-text"><fmt:message key="label.diff.resp.address.diff.resp.address" bundle="${msg}" /></span>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
								 <div class="clearfix form-group has-error hidden" id="diffToResidentialShow">
                                    <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
                                       <input class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input residential residential-chinese-input" id="correspondenceAddress1" name="correspondenceAddress1" value="${lifePersonalDetails.correspondenceAddress1 }" type="text" autocomplete="off" maxlength="29" />
									   <label class="mdl-textfield__label so-mdl-textfield-label" for="correspondenceAddress1"><fmt:message key="placeholder.coraddress.line1" bundle="${msg}" /></label>
									</div>
									<span class="error-msg" id="correspondenceAddErMsg"></span>
									<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
                                       <input class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input residential residential-chinese-input" id="correspondenceAddress2" name="correspondenceAddress2" value="${lifePersonalDetails.correspondenceAddress2 }" type="text" autocomplete="off" maxlength="29" />
									   <label class="mdl-textfield__label so-mdl-textfield-label" for="correspondenceAddress2"><fmt:message key="placeholder.coraddress.line2" bundle="${msg}" /></label>
									</div>
									<span class="error-msg" id="correspondenceAdd2ErMsg"></span>
									<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
                                       <input class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input residential residential-chinese-input" id="correspondenceAddress3" name="correspondenceAddress3" value="${lifePersonalDetails.correspondenceAddress3 }" type="text" autocomplete="off" maxlength="19" />
									   <label class="mdl-textfield__label so-mdl-textfield-label" for="correspondenceAddress3"><fmt:message key="placeholder.coraddress.line3" bundle="${msg}" /></label>
                                    </div>
                                    <span class="error-msg" id="correspondenceAdd3ErMsg"></span>
									<div class="left-desktop text-box">
                                       <div class="selectDiv">
										  <label class="mdl-textfield__label cstm-dropdown-label"><fmt:message key="placeholder.address.district" bundle="${msg}" /></label>
                                          <select class="form-control gray-dropdown" name="tmpCorrespondenceDistrict" id="tmpCorrespondenceDistrict">
                                             <option value="" selected="selected" disabled="disabled"><fmt:message key="placeholder.address.district" bundle="${msg}" /></option>
                                             <c:if test="${language == 'en'}">
													<c:forEach var="list" items="${savieDistrictEN}">
														<enhance:out escapeXml="false">
														    <option value="${list.itemCode }" <c:if test="${lifePersonalDetails.correspondenceAddressDistrict == list.itemCode}">selected="selected"</c:if>>${list.itemDesc }</option>
														</enhance:out>
													</c:forEach>
												</c:if>
												<c:if test="${language == 'tc'}">
													<c:forEach var="list" items="${savieDistrictCN}">
														<enhance:out escapeXml="false">
														    <option value="${list.itemCode }" <c:if test="${lifePersonalDetails.correspondenceAddressDistrict == list.itemCode}">selected="selected"</c:if>>${list.itemDesc }</option>
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
                                          <input type="hidden" id="correspondenceAddressDistrict" name="correspondenceAddressDistrict" value="${correspondenceAddressDistrictCode }" />
                                          <img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg">
                                       </div>
									   <span class="error-msg" id="correspondenceDistrictErMsg"></span>
                                    </div>
                                 </div>
                              </div>
                           </div>
									<input type="hidden" id="is-chinese-address" name="is-chinese-address" value="N" />
                           <div class="next-btn">
                              <button id="et-personal-info-next" class="text-bold btn savie-common-btn applicant-btn"><fmt:message key="button.Next" bundle="${msg}" /></button>
							  <c:if test="${plan == 'savings-insurance'}">
							   <a href="#" class="link-btn" id="pd-save-con-later"><fmt:message key="label.save.and.continue.later" bundle="${msg}" /></a>
							  </c:if> 
							   <button type="button" id="btn-back" class="text-bold btn hidden beneficiary-btn-back savie-common-btn"><fmt:message key="button.back.summary" bundle="${msg}" /></button>
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
				<div class="save-con-btns clearfix">
					<center>
						<button class="btn savie-common-btn" id="keep-going-btn"><fmt:message key="button.keep.going" bundle="${msg}" /></button>
						<button class="btn savie-common-btn disabled-gray-btn" id="save-exit-btn"><fmt:message key="button.save.and.exit" bundle="${msg}" /></button>
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
			var language = "en";
			var getpath = "<%=request.getContextPath()%>";
			
			$(document).ready(function() {

				//$('#soInsuredInfoForm input').addClass('is-not-active');

				setSelectReadonly('tmpGender', true);
				setInputReadonly('so-calendar-dob', true);
				//setInputReadonly('residentialNo', true);
				setInputReadonly('mobileNo', true);
				
				if('${plan }' == 'savings-insurance'){
					setSelectReadonly('tmpMaritalStatus', true);
				}
				
				if('${lifePersonalDetails.permanetAddress1}' != ''){
					if ($('.res-additional').hasClass('hidden')) {
						$('.res-additional').removeClass('hidden');
						$('.res-textfield-hidden').css("margin-bottom", "10px");
					}
				}
				else{
					
				}
				
				if('${lifePersonalDetails.diffToPermanent}' == 'None'){
					if ($('#diffToPermanentShow').hasClass('hidden')) {
						$('#diffToPermanentShow').removeClass('hidden');
					}
				}
				else{
					$('#diffToPermanentShow').addClass('hidden');
				}
				
				if('${lifePersonalDetails.diffToResidential}' == 'None'){
					if ($('#diffToResidentialShow').hasClass('hidden')) {
						$('#diffToResidentialShow').removeClass('hidden');
					}
				}
				else{
					$('#diffToResidentialShow').addClass('hidden');
				}
				
				soFormValidation();
				
				var dummy = true;
				if('${backSummary}' == 'Y'){
					dummy = false;
				}
                //dummy condition for displaying the back / next button 
                if(dummy) { 
                    // hide the back button and display the Next button
                    $('.applicant-btn, .link-btn').removeClass('hidden');
                    $('.beneficiary-btn-back').addClass('hidden');
                } else {
                    // display the back button and hide the Next button
                    $('.applicant-btn, .link-btn').addClass('hidden');
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
					$("#errorMsg").html("");
					$.ajax({
						  type : "POST",
						  async:false, 
						  url : "<%=request.getContextPath()%>/ajax/savings-insurance/lifePersonalDetailsSaveforLater",
						  data: $("#soInsuredInfoForm").serialize()+"&type="+1,
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
						  url : "<%=request.getContextPath()%>/ajax/savings-insurance/lifePersonalDetailsSaveforLater",
						  data: $("#soInsuredInfoForm").serialize()+"&type="+2,
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

				// on change
				$('#so-calendar-dob').on('changeDate show', function(e) {
					$(this).parent('.selectDiv').parent('.et-date-info').addClass('is-not-active');
					 if($(this).val() == '') {
					   $(this).parent('.selectDiv').parent('.et-date-info').removeClass('is-not-active');
					}
					$('#soInsuredInfoForm').data('bootstrapValidator').updateStatus('dob', 'NOT_VALIDATED', null).validateField('dob');
			   });
			   
			   $('.cstm-number-field').on('change', function() {
				   $(this).parent().parent().parent('so-mdl-textfield').addClass('is-not-active');
				   if($(this).val() == '') {
					   $(this).parent().parent().parent('so-mdl-textfield').removeClass('is-not-active');
					}
			   })		   

				// on focus
				$('#so-calendar-dob').focus(function() {
					$(this).parent().parent().addClass('is-focused');
					$(this).closest('.is-not-active').find('label').attr('style', 'color: #ff8200 !important;');
				}).on('blur', function () {
					$(this).parent().parent().removeClass('is-focused');
					$(this).closest('.is-not-active').find('label').removeAttr('style');
				});
			   
			   $('.cstm-number-field').focus(function() {
					$(this).parent().parent().parent().removeClass('is-not-active');
				}).on('blur', function () {
					$(this).parent().parent().parent('.so-mdl-textfield').addClass('is-not-active');
					 if($(this).val() == '') {
					   $(this).parent().parent().parent('.so-mdl-textfield').removeClass('is-not-active');
					}
				});
				
				// For displaying the lightbox save and continue later
				$('#pd-save-con-later').on('click', function (e) {
					if($('#chineseName').val() == undefined) {
						$('#soInsuredInfoForm').data('bootstrapValidator').enableFieldValidators('chineseName', false);
					}
					$('#soInsuredInfoForm').data('bootstrapValidator').validateField('chineseName');
					if($('#residentialNo').val() == undefined) {
						$('#soInsuredInfoForm').data('bootstrapValidator').enableFieldValidators('residentialTelNo', false);
					}
					$('#soInsuredInfoForm').data('bootstrapValidator').validateField('residentialTelNo');
					
					$('#soInsuredInfoForm').bootstrapValidator('validate');
					if($('#soInsuredInfoForm').data('bootstrapValidator').isValid()) {
					   $('#save-and-continue-batch5-modal').modal('show');
					} else {
						$('#save-and-continue-modal').modal('show');
					}
                });
				
				$('#chkboxdiffToPermanentText').on('click', function() {
					$('#diffToPermanent').click();
				});
				
				$('#chkboxDiffToResidentialText').on('click', function() {
					$('#diffToResidential').click();
				});

				//init next button text
				if('${backSummary}'=="Y"){
					var htmlObj = document.getElementById('et-personal-info-next');
					htmlObj.innerHTML = 'Back to application summary';
				}
		   });
			
			// detect IE browsers
			if(msieversion() >= 9) {
				$('.selectDiv .gray-dropdown').addClass('ie-select');
				//fix for IE8 highlight blue when selected
				$('option').click(function() {
				    $('select').blur();
				});
			} else {
				$('.selectDiv .gray-dropdown').removeClass('ie-select');
			}
			
			$("#et-personal-info-next, #btn-back").click(function(){
				$('#soInsuredInfoForm').bootstrapValidator('validate');
				if($('#soInsuredInfoForm').data('bootstrapValidator').isValid()) {
					/*if ( $('#gender-errormsg').hasClass('has-error') ) {
						$('#genderErMsg').find('.help-block').attr('style', 'display:block;');
					} else {
						$('#genderErMsg').find('.help-block').attr('style', 'display:none;');
					}*/
					$("#errorMsg").html("");
					$.ajax({
						  type : "POST",
						  async:false, 
						  url : "<%=request.getContextPath()%>/ajax/savings-insurance/lifePersonalDetails",
						  data: $("#soInsuredInfoForm").serialize(),
						  success : function(data) {
							  if(data != null && data.errorMsg != null && data.errorMsg != "" && !$('#soInsuredInfoForm').data('bootstrapValidator').isValid()){
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
			
			//Applicant Info form validation
			function soFormValidation() {
			  $('#soInsuredInfoForm').bootstrapValidator({
				 excluded: [':disabled', ':hidden', ':not(:visible)'],
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
			                    },
			                    remote:{
			                    	message: 'Some input information contains simplified Chinese',
				                	url: "<%=request.getContextPath()%>/ajax/validateSimpleChinese",
				                	type: "get",
				                	dataType: "json",
				                	data: {
				                		str: function() {
				                	        return $("#chineseName").val();
				                	    }
				                	}
				                }
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
		                      callback: function(value, validator) {
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
			  }).on('success.form.bv', function(e) {
				 e.preventDefault();
			  }).on('error.form.bv', function(e) {
			  });
			}
			
			$('.chinese-input').bind('keypress', function (event) {
				var regex = new RegExp("/^[\s\u4e00-\u9fa5]*$/");
				var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
				if (!regex.test(key)) {
					event.preventDefault();
					return false;
				}
			});
			
			function isChin(str){
				 return /^[\u4e00-\u9fa5]+$/.test(str);
			}
			$('.residential-chinese-input').on('change',function(){
				$('#is-chinese-address').val('N');
				$('.residential-chinese-input').each(function() {
					if(isChin($(this).val())){
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
