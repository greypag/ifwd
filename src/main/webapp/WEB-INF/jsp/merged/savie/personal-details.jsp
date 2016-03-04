<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeQuoteBean"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
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
				<!-- BREADCRUMBS -->
				<div class="fwd-container container-fluid breadcrumbs">
					<div class="breadcrumb-container">
					   <ol class="breadcrumb breadcrumbs-product-details et-breadcrumbs">
							<li><a href="#">Home</a></li>
							<li class="divider"><i class="fa fa-play"></i></li>
							<li><a href="#">Save </a></li>
							<li class="divider"><i class="fa fa-play"></i></li>
							<li><a href="#">Savie </a></li>
							<li class="divider last"><i class="fa fa-play"></i></i></li>
							<li class="active-bc" id="et-active-bc-menu">Application</li>
					   </ol>
					</div>
				 </div>
				 <!-- STEPS -->
				 <div class="container-fluid fwd-full-container browse-holder">
					<div class="application-page-header et-header-browse">
					   <div class="browse-container">
						  <div class="row reset-margin hidden-xs hidden-sm">
							 <ul class="common-steps-list six-steps nav nav-pills">
								<li class="step-number" id="first-step"><button type="button" class="et-header-info-btn completed-step"><i class="fa fa-check"></i>Select plan</button></li>
								<li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
								<li class="step-number"><button type="button" class="et-header-info-btn active"><span class="status">2</span>Application &amp; payment</button></li>
								<li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
								<li class="step-number"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">3</span>Summary &amp; declaration</button></li>
								<li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
								<li class="step-number"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">4</span>Signature</button></li>
								<li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
								<li class="step-number"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">5</span>Document upload</button></li>
								<li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
								<li class="step-number"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">6</span>Confirmation</button></li>
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
								<h3 id="">Application &amp; payment</h3>
							 </div>
							 <p id="step-of">2 out of 6</p>
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
				 <!-- APPLICANT INFO BLOCK -->
				 <div id="so-application-info-section" class="headerStick">
                  <div class="container-fluid fwd-container">
                     <div id="personal-info" class="personal-info-widget page-application et-application-page">
                        <h4 class="so-h4">Applicant info / insured person Info</h4>
                        <form id="soInsuredInfoForm" method="post" class="form-horizontal" action="" onsubmit="return false">
                           <div class="row margin">
                              <div class="col-sm-12 col-md-6 left">
								<div class="clearfix form-group has-error">
									<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
										<input class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input" id="firstname" name="firstname" type="text" value="${userDetails.firstName }" autocomplete="off" readonly="readonly" />
										<label class="mdl-textfield__label so-mdl-textfield-label" for="firstName">Given Name</label>
									</div>
									<span class="error-msg" id="firstNameErMsg"></span>
									<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
										<input class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input" id="lastname" name="lastname" type="text" value="${userDetails.lastName }" autocomplete="off" readonly="readonly" />
										<label class="mdl-textfield__label so-mdl-textfield-label" for="lastName">Last Name</label>
									</div>
									<span class="error-msg" id="lastNameErMsg"></span>
								</div>
                                 <div class="clearfix form-group has-error">
									<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
										<input class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input" id="chineseName" name="chineseName" type="text" value="${lifePersonalDetails.chineseName }" autocomplete="off" />
										<label class="mdl-textfield__label so-mdl-textfield-label" for="chineseName">Name in Chinese</label>
									</div>
									<span class="error-msg" id="chineseNameErMsg"></span>
                                 </div>
								 			<div class="clearfix form-group has-error">
                                    <div class="left-desktop text-box">
                                       <div class="selectDiv">
														<label class="mdl-textfield__label cstm-dropdown-label">Gender</label>
                                          <select class="form-control gray-dropdown" name="tmpGender" id="tmpGender">
                                             <option value="" selected="selected" disabled="disabled">Gender</option>
                                             <option value="male" <c:if test="${savieFna.gender == '0'}">selected="selected"</c:if>>MALE</option>
                                             <option value="female" <c:if test="${savieFna.gender == '1'}">selected="selected"</c:if>>FEMALE</option>
                                          </select>
                                          <img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg">
                                       </div>
									   			<span class="error-msg" id="genderErMsg"></span>
									   			<input type="hidden" id="gender" name="gender" value="${savieFna.gender == '0' ? 'MALE':'FEMALE'}" />
                                    </div>
                                 </div>
								 <div class="clearfix form-group has-error">
                                    <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
                                       <input class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input" id="hkId" name="hkid" type="text" value="${lifePersonalDetails.hkid }" />
									   <label class="mdl-textfield__label so-mdl-textfield-label" for="hkId">HKID</label>
                                    </div>
									<span class="error-msg" id="hkidErMsg"></span>
                                 </div>
								 <div class="clearfix form-group has-error">
                                    <div class="left-desktop text-box">
                                       <div class="selectDiv">
										  <label class="mdl-textfield__label cstm-dropdown-label">Place of birth</label>
                                          <select class="form-control gray-dropdown" name="tmpPlaceOfBirth" id="tmpPlaceOfBirth">
                                             <option value="" selected="selected" disabled="disabled">Place of birth</option>
                                             <c:if test="${language == 'en'}">
												<c:forEach var="list" items="${placeOfBirthEN}">
												    <c:set var="code" value="${list.itemCode }-${list.itemDesc }"/>
													<option value="${list.itemCode }-${list.itemDesc }" <c:if test="${lifePersonalDetails.placeOfBirth == code}">selected="selected"</c:if>>${list.itemDesc }</option>
												</c:forEach>
											</c:if>
											<c:if test="${language == 'tc'}">
												<c:forEach var="list" items="${placeOfBirthCN}">
												    <c:set var="code" value="${list.itemCode }-${list.itemDesc }"/>
													<option value="${list.itemCode }-${list.itemDesc }" <c:if test="${lifePersonalDetails.placeOfBirth == code}">selected="selected"</c:if>>${list.itemDesc }</option>
												</c:forEach>
											</c:if>
                                          </select>
                                          <input type="hidden" id="placeOfBirth" name="placeOfBirth" />
                                          <img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg">
                                       </div>
									   <span class="error-msg" id="placeOfBirthErMsg"></span>
                                    </div>
                                 </div>
								 <div class="clearfix form-group has-error">
                                    <div class="left-desktop text-box">
                                       <div class="selectDiv">
										  				<label class="mdl-textfield__label cstm-dropdown-label">Nationality</label>
                                          <select class="form-control gray-dropdown" name="tmpNationality" id="tmpNationality">
                                             <option value="" selected="selected" disabled="disabled">Nationality</option>
                                             <c:if test="${language == 'en'}">
													<c:forEach var="list" items="${nationalityEN}">
													    <c:set var="code" value="${list.itemCode }-${list.itemDesc }"/>
														<option value="${list.itemCode }-${list.itemDesc }" <c:if test="${lifePersonalDetails.nationalty == code}">selected="selected"</c:if>>${list.itemDesc }</option>
													</c:forEach>
												</c:if>
												<c:if test="${language == 'tc'}">
													<c:forEach var="list" items="${nationalityCN}">
													    <c:set var="code" value="${list.itemCode }-${list.itemDesc }"/>
														<option value="${list.itemCode }-${list.itemDesc }" <c:if test="${lifePersonalDetails.nationalty == code}">selected="selected"</c:if>>${list.itemDesc }</option>
													</c:forEach>
												</c:if>
                                          </select>
                                          <input type="hidden" id="nationalty" name="nationalty" />
                                          <img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg">
                                       </div>
									   <span class="error-msg" id="nationalityErMsg"></span>
                                    </div>
                                 </div>
                                 <div class="clearfix form-group has-error dob-content">
                                    <div class="left-desktop text-box et-date-info so-mdl-textfield">
										<div class="selectDiv" id="date">
											<label class="mdl-textfield__label cstm-textfield-label">Date of birth</label>
											<input type="text" class="form-control gray-textbox" name="dob" id="so-calendar-dob" value="${savieFna.dob }" readonly="readonly" />
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
                                             <input class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input cstm-number-field" id="residentialNo" name="residentialTelNo" value="${userDetails.mobileNo }" type="text" maxlength="8" oninput="maxLengthCheck(this)" />
											 <label class="mdl-textfield__label so-mdl-textfield-label" for="residentialNo">Residential tel no. (eg. 1234-5678)</label>
                                          </div>
                                       </div>
                                    </div>
									<span class="error-msg" id="resTelNoErMsg"></span>
                                 </div>
                                 <div class="clearfix form-group has-error">
                                    <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
                                       <div class="clearfix form-group">
                                          <div class="mobile-num">
                                             <input class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input cstm-number-field" id="mobileNo" name="mobileNumber" value="${userDetails.mobileNo }" type="text" maxlength="8" oninput="maxLengthCheck(this)" />
											 <label class="mdl-textfield__label so-mdl-textfield-label" for="mobileNo">Mobile no. (eg. 1234-5678)</label>
                                          </div>
                                       </div>
                                    </div>
									<span class="error-msg" id="mobileNoErMsg"></span>
                                 </div>
                                 <div class="clearfix form-group has-error">
                                    <div class="left-desktop text-box">
                                       <div class="selectDiv">
									      			<label class="mdl-textfield__label cstm-dropdown-label">Marital status</label>                                          
                                          <select class="form-control gray-dropdown" name="tmpMaritalStatus"  id="tmpMaritalStatus">
                                             <option value="" selected="selected" disabled="disabled">Marital status</option>
                                             <c:if test="${language == 'en'}">
																<c:forEach var="list" items="${maritalStatusesEN}">
																	<option value="${list.itemCode }-${list.itemDesc }" 
																	    <c:choose>  
																		   <c:when test="${savieFna.marital_status == '0' && list.itemCode == 'MS1'}">selected="selected"</c:when>
																		   <c:when test="${savieFna.marital_status == '1' && list.itemCode == 'MS2'}">selected="selected"</c:when>  
																		   <c:when test="${savieFna.marital_status == '2' && list.itemCode == 'MS3'}">selected="selected"</c:when>
																		   <c:when test="${savieFna.marital_status == '3' && list.itemCode == 'MS4'}">selected="selected"</c:when> 
																		   <c:when test="${savieFna.marital_status == '4' && list.itemCode == 'MS5'}">selected="selected"</c:when> 
																		   <c:otherwise></c:otherwise>  
																		</c:choose>
																	>${list.itemDesc }</option>
																</c:forEach>
															</c:if>
															<c:if test="${language == 'tc'}">
																<c:forEach var="list" items="${maritalStatusesCN}">
																	<option value="${list.itemCode }-${list.itemDesc }" 
																	    <c:choose>  
																		   <c:when test="${savieFna.marital_status == '0' && list.itemCode == 'MS1'}">selected="selected"</c:when>
																		   <c:when test="${savieFna.marital_status == '1' && list.itemCode == 'MS2'}">selected="selected"</c:when>  
																		   <c:when test="${savieFna.marital_status == '2' && list.itemCode == 'MS3'}">selected="selected"</c:when>
																		   <c:when test="${savieFna.marital_status == '3' && list.itemCode == 'MS4'}">selected="selected"</c:when> 
																		   <c:when test="${savieFna.marital_status == '4' && list.itemCode == 'MS5'}">selected="selected"</c:when> 
																		   <c:otherwise></c:otherwise>  
																		</c:choose>
																	>${list.itemDesc }</option>
																</c:forEach>
															</c:if>
                                          </select>
                                          
                                          <c:if test='${language == "en"}'>
												<c:forEach var="list" items="${maritalStatusesEN}">
													    <c:choose>
														   <c:when test="${savieFna.marital_status == '0' && list.itemCode == 'MS1'}"><c:set var="martialStatusCode" value="${list.itemCode }-${list.itemDesc }"/></c:when>
														   <c:when test="${savieFna.marital_status == '1' && list.itemCode == 'MS2'}"><c:set var="martialStatusCode" value="${list.itemCode }-${list.itemDesc }"/></c:when>  
														   <c:when test="${savieFna.marital_status == '2' && list.itemCode == 'MS3'}"><c:set var="martialStatusCode" value="${list.itemCode }-${list.itemDesc }"/></c:when>
														   <c:when test="${savieFna.marital_status == '3' && list.itemCode == 'MS4'}"><c:set var="martialStatusCode" value="${list.itemCode }-${list.itemDesc }"/></c:when> 
														   <c:when test="${savieFna.marital_status == '4' && list.itemCode == 'MS5'}"><c:set var="martialStatusCode" value="${list.itemCode }-${list.itemDesc }"/></c:when> 
														   <c:otherwise></c:otherwise>  
														</c:choose>
												</c:forEach>
											</c:if>
											<c:if test="${language == 'tc'}">
												<c:forEach var="list" items="${maritalStatusesCN}">
													    <c:choose>  
														   <c:when test="${savieFna.marital_status == '0' && list.itemCode == 'MS1'}"><c:set var="martialStatusCode" value="${list.itemCode }-${list.itemDesc }"/></c:when>
														   <c:when test="${savieFna.marital_status == '1' && list.itemCode == 'MS2'}"><c:set var="martialStatusCode" value="${list.itemCode }-${list.itemDesc }"/></c:when>  
														   <c:when test="${savieFna.marital_status == '2' && list.itemCode == 'MS3'}"><c:set var="martialStatusCode" value="${list.itemCode }-${list.itemDesc }"/></c:when>
														   <c:when test="${savieFna.marital_status == '3' && list.itemCode == 'MS4'}"><c:set var="martialStatusCode" value="${list.itemCode }-${list.itemDesc }"/></c:when> 
														   <c:when test="${savieFna.marital_status == '4' && list.itemCode == 'MS5'}"><c:set var="martialStatusCode" value="${list.itemCode }-${list.itemDesc }"/></c:when> 
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
									   <label class="mdl-textfield__label so-mdl-textfield-label" for="emailAddress">Email address</label>
                                    </div>
									<span class="error-msg" id="emailErMsg"></span>
                                 </div>
                                 <div class="clearfix form-group has-error">
									<span class="warning-note">Permanent address (No P.O. Box address allowed)</span>
                                    <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
                                       <input class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input residential" id="permanentAddress1" name="permanetAddress1" value="${lifePersonalDetails.permanetAddress1 }" type="text" />
									   <label class="mdl-textfield__label so-mdl-textfield-label" for="permanentAddress1">Permanent address line 1</label>
									</div>
									<span class="error-msg" id="permanentAddErMsg"></span>
									<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield res-textfield-hidden">
                                       <input class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input residential res-additional hidden" id="permanentAddress2" name="permanetAddress2" value="${lifePersonalDetails.permanetAddress2 }" type="text" />
									   <label class="mdl-textfield__label so-mdl-textfield-label" for="permanentAddress2">Permanent address line 2</label>
									</div>
									<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield res-textfield-hidden">
                                       <input class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input residential res-additional hidden" id="permanentAddress3" name="permanetAddress3" value="${lifePersonalDetails.permanetAddress3 }" type="text" />
									   <label class="mdl-textfield__label so-mdl-textfield-label" for="permanentAddress3">Permanent address line 3</label>
                                    </div>
												<div class="left-desktop text-box res-additional hidden">
                                       <div class="selectDiv">
										 				<label class="mdl-textfield__label cstm-dropdown-label">District</label>
                                          <select class="form-control gray-dropdown" name="tmpPermanentDistrict" id="tmpPermanentDistrict">
                                             <option value="" selected="selected" disabled="disabled">District</option>
                                             <c:if test="${language == 'en'}">
												<c:forEach var="list" items="${savieDistrictEN}">
												    <c:set var="code" value="${list.itemCode }-${list.itemDesc }"/>
													<option value="${list.itemCode }-${list.itemDesc }" <c:if test="${lifePersonalDetails.permanetAddressDistrict == code}">selected="selected"</c:if>>${list.itemDesc }</option>
												</c:forEach>
											</c:if>
											<c:if test="${language == 'tc'}">
												<c:forEach var="list" items="${savieDistrictCN}">
												    <c:set var="code" value="${list.itemCode }-${list.itemDesc }"/>
													<option value="${list.itemCode }-${list.itemDesc }" <c:if test="${lifePersonalDetails.permanetAddressDistrict == code}">selected="selected"</c:if>>${list.itemDesc }</option>
												</c:forEach>
											</c:if>
                                          </select>
                                          <input type="hidden" id="permanetAddressDistrict" name="permanetAddressDistrict" />
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
                                                <span id="chkboxdiffToPermanentText" class="checkbox-text">My residential address is different to my permanent address</span>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                                 <div class="clearfix form-group has-error hidden" id="diffToPermanentShow">
                                    <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
                                       <input class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input residential" id="residentialAddress1" name="residentialAddress1" value="${lifePersonalDetails.residentialAddress1 }" type="text" />
									   <label class="mdl-textfield__label so-mdl-textfield-label" for="residentialAddress1">Residential address line 1</label>
									</div>
									<span class="error-msg" id="residentialAddErMsg"></span>
									<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
                                       <input class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input residential" id="residentialAddress2" name="residentialAddress2" value="${lifePersonalDetails.residentialAddress2 }" type="text" />
									   <label class="mdl-textfield__label so-mdl-textfield-label" for="residentialAddress2">Residential address line 2</label>
									</div>
									<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
                                       <input class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input residential" id="residentialAddress3" name="residentialAddress3" value="${lifePersonalDetails.residentialAddress3 }" type="text" />
									   <label class="mdl-textfield__label so-mdl-textfield-label" for="residentialAddress3">Residential address line 3</label>
                                    </div>
									<div class="left-desktop text-box">
                                       <div class="selectDiv">
										 <label class="mdl-textfield__label cstm-dropdown-label">District</label>
                                          <select class="form-control gray-dropdown" name="tmpResidentialDistrict" id="tmpResidentialDistrict">
                                             <option value="" selected="selected" disabled="disabled">District</option>
                                             <c:if test="${language == 'en'}">
													<c:forEach var="list" items="${savieDistrictEN}">
													    <c:set var="code" value="${list.itemCode }-${list.itemDesc }"/>
														<option value="${list.itemCode }-${list.itemDesc }" <c:if test="${lifePersonalDetails.residentialAddressDistrict == code}">selected="selected"</c:if>>${list.itemDesc }</option>
													</c:forEach>
												</c:if>
												<c:if test="${language == 'tc'}">
													<c:forEach var="list" items="${savieDistrictCN}">
													    <c:set var="code" value="${list.itemCode }-${list.itemDesc }"/>
														<option value="${list.itemCode }-${list.itemDesc }" <c:if test="${lifePersonalDetails.residentialAddressDistrict == code}">selected="selected"</c:if>>${list.itemDesc }</option>
													</c:forEach>
												</c:if>
                                          </select>
                                          <input type="hidden" id="residentialAddressDistrict" name="residentialAddressDistrict" />
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
                                                <span id="chkboxDiffToResidentialText" class="checkbox-text">My correspondence address is different to my residential address</span>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
								 <div class="clearfix form-group has-error hidden" id="diffToResidentialShow">
                                    <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
                                       <input class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input residential" id="correspondenceAddress1" name="correspondenceAddress1" value="${lifePersonalDetails.correspondenceAddress1 }" type="text" />
									   <label class="mdl-textfield__label so-mdl-textfield-label" for="correspondenceAddress1">Correspondence address line 1</label>
									</div>
									<span class="error-msg" id="correspondenceAddErMsg"></span>
									<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
                                       <input class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input residential" id="correspondenceAddress2" name="correspondenceAddress2" value="${lifePersonalDetails.correspondenceAddress2 }" type="text" />
									   <label class="mdl-textfield__label so-mdl-textfield-label" for="correspondenceAddress2">Correspondence address line 2</label>
									</div>
									<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
                                       <input class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input residential" id="correspondenceAddress3" name="correspondenceAddress3" value="${lifePersonalDetails.correspondenceAddress3 }" type="text" />
									   <label class="mdl-textfield__label so-mdl-textfield-label" for="correspondenceAddress3">Correspondence address line 3</label>
                                    </div>
									<div class="left-desktop text-box">
                                       <div class="selectDiv">
										  <label class="mdl-textfield__label cstm-dropdown-label">District</label>                                          
                                          <select class="form-control gray-dropdown" name="tmpCorrespondenceDistrict" id="tmpCorrespondenceDistrict">
                                             <option value="" selected="selected" disabled="disabled">District</option>
                                             <c:if test="${language == 'en'}">
													<c:forEach var="list" items="${savieDistrictEN}">
													    <c:set var="code" value="${list.itemCode }-${list.itemDesc }"/>
														<option value="${list.itemCode }-${list.itemDesc }" <c:if test="${lifePersonalDetails.correspondenceAddressDistrict == code}">selected="selected"</c:if>>${list.itemDesc }</option>
													</c:forEach>
												</c:if>
												<c:if test="${language == 'tc'}">
													<c:forEach var="list" items="${savieDistrictCN}">
													    <c:set var="code" value="${list.itemCode }-${list.itemDesc }"/>
														<option value="${list.itemCode }-${list.itemDesc }" <c:if test="${lifePersonalDetails.correspondenceAddressDistrict == code}">selected="selected"</c:if>>${list.itemDesc }</option>
													</c:forEach>
												</c:if>
                                          </select>
                                          <input type="hidden" id="correspondenceAddressDistrict" name="correspondenceAddressDistrict" />
                                          <img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg">
                                       </div>
									   <span class="error-msg" id="correspondenceDistrictErMsg"></span>
                                    </div>
                                 </div>
                              </div>
                           </div>
                           <div class="next-btn">
                              <button id="et-personal-info-next" class="btn savie-common-btn applicant-btn">Next</button>
							  <a href="#" class="link-btn" id="pd-save-con-later">Save and continue later</a>
							   <button type="button" class="btn hidden beneficiary-btn-back savie-common-btn">Back to application summary</button>
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
				<h4 class="text-center welcome-msg">Would you like to save your application and continue later?</h4>
				<p class="text-center description-msg">You may save your application progress up to (previous page). You will receive an email with a link of your saved application progress, you may continue the application within 30 days.</p>
				<div class="save-con-btns clearfix">
					<button class="btn savie-common-btn save-exit-btn1 col-sm-6 col-xs-6 col-lg-6 col-md-6">Keep going</button>
					<button class="btn savie-common-btn save-exit-btn2 col-sm-6 col-xs-6 col-lg-6 col-md-6">Save and exit</button>
				</div>
			</div>
		  </div>
		</div>
		
		<!-- Save and continue batch 5 modal -->
		<div class="modal fade common-welcome-modal save-con-modal-b5" id="save-and-continue-batch5-modal" tabindex="-1" role="dialog">
		  <div class="modal-dialog">
			<div class="modal-content save-con-modal-content">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">x</span></button>
				<h4 class="text-center welcome-msg">Would you like to save your application and continue later?</h4>
				<p class="text-center description-msg">You will receive an email with a link of your saved application progress, you may continue the application within 30 days.</p>
				<div class="save-con-btns clearfix">
					<center><button class="btn savie-common-btn" id="keep-going-btn">Keep going</button><button class="btn savie-common-btn disabled-gray-btn" id="save-exit-btn">Save and exit</button></center>
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
						<p class="text-center">Your application has been saved. </p>
				 </div>
				 <div class="modal-body" id="moda-body-appsave">
					<p class="text-center">A saved application email has been sent to you, you may continue the application through 
					the application link embedded in the email or you may retrieve your progress from your eService 
					purchase history. </p>
					<div class="btn-appsave">
						<button href="#" class="center-block btn savie-common-btn" id="btn-app-save">Back to home</button>
					</div>
				 </div>
			 </div>
		  </div>
		</div>
		
		
		<!-- JS INCLUDES -->
		<script type="text/javascript">
			var language = "en";
			
			$(document).ready(function() {
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
				
				// application saved modal will show after clicking 'Save and exit' button 
				$('.save-exit-btn2, #save-exit-btn').click(function() {
					$(this).closest('.modal').modal('hide');
					$('#application-saved-modal').modal('show');
				});

				// on change
				$('#so-calendar-dob').on('changeDate show', function(e) {
					$(this).parent('.selectDiv').parent('.et-date-info').addClass('is-not-active');
					 if($(this).val() == '') {
					   $(this).parent('.selectDiv').parent('.et-date-info').removeClass('is-not-active');
					}
					$('#soInsuredInfoForm').data('bootstrapValidator').updateStatus('so-calendar-dob', 'NOT_VALIDATED', null).validateField('so-calendar-dob');
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
						$('#soInsuredInfoForm').data('bootstrapValidator').enableFieldValidators('residentialNo', false);
					}
					$('#soInsuredInfoForm').data('bootstrapValidator').validateField('residentialNo');
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
			
			$("#et-personal-info-next").click(function(){
				$("#errorMsg").html("");
				$.ajax({
					  type : "POST",
					  async:false, 
					  url : "<%=request.getContextPath()%>/ajax/savings-insurance/lifePersonalDetails",
					  data: $("#soInsuredInfoForm").serialize(),
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

			$("#save-exit-btn").click(function(){
				$("#errorMsg").html("");
				$.ajax({
					  type : "POST",
					  async:false, 
					  url : "<%=request.getContextPath()%>/ajax/savings-insurance/lifePersonalDetailsSaveforLater",
					  data: $("#soInsuredInfoForm").serialize(),
					  success : function(data) {
						  if(data != null && data.errorMsg != null && data.errorMsg != ""){
							  $("#errorMsg").html(data.errorMsg);
						  }
						  else{
							  window.location = '<%=request.getContextPath()%>/${language}/savings-insurance/${nextPageFlow}';
						  }
					  }
			     });
			});
		</script>
	</body>
</html>
