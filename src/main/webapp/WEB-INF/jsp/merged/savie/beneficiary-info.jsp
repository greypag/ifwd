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
		<div class="fwd-savie-wrapper savie-online-container with-breadcrumbs-steps" id="beneficiary-name-others-page">
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
				<!-- BENEFICIARY INFO BLOCK -->
				<div id="so-beneficiary-info-section" class="headerStick">
					<div class="container-fluid fwd-full-container" id="container-beneficiary">
						<div id="fwd-container-beneficiary" class="fwd-container-limit clearfix sidebar personal-info-widget page-application et-application-page">
							<h4 class="so-h4">Beneficiary info</h4>
							<form id="beneficiary-info-form[0]" class="beneficiary-form-content" method="post" action="">
								<div class="radio-group clearfix">
								   <div class="radio-button-group">
									  <div class="clearfix desktop-align left">
										 <div class="pull-left radio-holder">
											<input type="radio" id="own-estate-id" name="isOwnEstate" value="true" checked /> <label for="own-estate-id"></label>
										 </div>
										 <div class="pull-left desc">
											Own estate
										 </div>
									  </div>
									  <div class="clearfix below desktop-align">
										 <div class="pull-left radio-holder">
											<input type="radio" id="name-others-id" name="isOwnEstate" value="false" /> <label for="name-others-id"></label>
										 </div>
										 <div class="pull-left desc">
											Name others
										 </div>
									  </div>
								   </div>
								</div>
								<div id="beneficiary-contents" class="col-md-4 col-lg-4 col-sm-12 col-xs-12 hidden">
									<div class="clearfix add-on-header default-head-h5" id="beneficiary-header[0]">
										<div class="pull-left">
											<h5 class="beneficiary-h5 hidden-lg hidden-md">Beneficiary <span class="beneficiary-span">(Person 1)</span>
											</h5>
										</div>
									</div>
									<div class="form-group has-error beneficiary-info-row">
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
											<input type="text" id="beneficiaryLastName[0]" name="beneficaryLastName1" value="${lifeBeneficaryInfo.beneficaryLastName1 }" class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input" maxlength="25" />
											<label class="mdl-textfield__label so-mdl-textfield-label" for="beneficiaryLastName[0]">Last name (same as HKID)</label>
										</div>
										<span class="error-msg" id="beneficiaryLastErMsg[0]"></span>
									</div>
									<div class="form-group has-error beneficiary-info-row">
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
											<input type="text" id="beneficiaryFirstName[0]" name="beneficaryFirstName1" value="${lifeBeneficaryInfo.beneficaryFirstName1 }" class="form-control gray-textbox form-textbox mdl-textfield__input so-mdl-textfield-input" maxlength="25" />
											<label class="mdl-textfield__label so-mdl-textfield-label" for="beneficiaryFirstName[0]">First name (same as HKID)</label>
										</div>
										<input type="text" autocomplete="off" id="beneficiaryFullName[0]" hidden />
										<span class="error-msg" id="beneficiaryFirstErMsg[0]"></span>
										<span class="dup-error-msg hidden" id="beneficiaryDupNameErMsg[0]">Duplicate english name</span>
									</div>
									<div class="form-group beneficiary-info-row">
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
											<input type="text" id="beneficiaryChineseName[0]" name="beneficaryChineseName1" value="${lifeBeneficaryInfo.beneficaryChineseName1 }" class="form-control gray-textbox form-textbox form-textbox mdl-textfield__input so-mdl-textfield-input" />
											<label class="mdl-textfield__label so-mdl-textfield-label" for="beneficiaryChineseName[0]">Name in Chinese (optional)</label>
										</div>
										<span class="error-msg" id="beneficiaryChineseNameErMsg[0]"></span>
										<span class="dup-error-msg hidden" id="beneficiaryDupChineseErMsg[0]">Duplicate chinese name</span>
									</div>
									<div class="form-group has-error beneficiary-info-row">
										<div class="clearfix">
											<div class="left-desktop text-box">
											   <div class="selectDiv">
												  <label class="mdl-textfield__label cstm-dropdown-label">HKID / Passport</label>
												  <span class="icon-chevron-thin-down orange-caret"></span>
												  <select class="form-control gray-dropdown" name="beneficiaryHkidPassport[0]" id="beneficiaryHkidPassport[0]">
													 <option value="" selected="selected" disabled="disabled">HKID / Passport</option>
													 <option value="hkid">HKID</option>
													 <option value="passport">Passport</option>
												  </select>
											   </div>
											   <span class="error-msg" id="beneficiaryHkidPassportErMsg[0]"></span>
											</div>
										 </div>
									 </div>
									<div class="form-group has-error beneficiary-info-row">
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield" id="hkid-inputfield-0">
											<input type="text" id="beneficiaryHkid[0]" name="beneficaryID1" value="${lifeBeneficaryInfo.beneficaryID1 }" class="form-control gray-textbox form-textbox mdl-textfield__input so-mdl-textfield-input" />
											<label class="mdl-textfield__label so-mdl-textfield-label" for="beneficiaryHkid[0]">HKID / Passport no.</label>
										</div>
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield hidden" id="passport-inputfield-0">
											<input type="text" id="beneficiaryPassport[0]" name="beneficiaryPassport1" value="${lifeBeneficaryInfo.beneficiaryPassport1 }" class="form-control gray-textbox form-textbox mdl-textfield__input so-mdl-textfield-input" />
											<label class="mdl-textfield__label so-mdl-textfield-label" for="beneficiaryPassport[0]">HKID / Passport no.</label>
										</div>
										<span class="error-msg" id="beneficiaryHkidPassErMsg[0]"></span>
										<span class="dup-error-msg hidden" id="beneficiaryDupHkidErMsg[0]">Duplicate beneficiaries HKID</span>
										<span class="dup-error-msg hidden" id="beneficiaryDupPassportErMsg[0]">Duplicate beneficiaries Passport</span>
									</div>
									 <div class="form-group has-error beneficiary-info-row">
										<div class="clearfix">
											<div class="left-desktop text-box">
												<div class="selectDiv">
													<label class="mdl-textfield__label cstm-dropdown-label">Gender</label>
													<span class="icon-chevron-thin-down orange-caret"></span>
													<select class="form-control gray-dropdown" name="beneficaryGender1" id="beneficiaryGender[0]">
														<option value="" selected="selected" disabled="disabled">Gender</option>
														<option value="male" <c:if test="${lifeBeneficaryInfo.beneficaryGender1 == 'male'}">selected="selected"</c:if>>MALE</option>
														<option value="female" <c:if test="${lifeBeneficaryInfo.beneficaryGender1 == 'female'}">selected="selected"</c:if>>FEMALE</option>
													</select>
												</div>
												<span class="error-msg" id="beneficiaryGenderErMsg[0]"></span>
											</div>
										 </div>
									 </div>
									 <div class="form-group has-error beneficiary-info-row">
										<div class="clearfix">
											<div class="left-desktop text-box">
												<div class="selectDiv">
													<label class="mdl-textfield__label cstm-dropdown-label">Relationship with you</label>
													<span class="icon-chevron-thin-down orange-caret"></span>
													<select class="form-control gray-dropdown"  id="beneficiaryRelationship[0]" name="beneficaryRelation1">
														<option value="" selected="selected" disabled="disabled">Relationship with you</option>
														<c:if test="${language == 'en'}">
															<c:forEach var="list" items="${savieBeneficiaryRelationshipEN}">
																<option value="${list.itemCode }-${list.itemDesc }" <c:if test="${lifeBeneficaryInfo.beneficaryRelation1 == list.itemCode}">selected="selected"</c:if>>${list.itemDesc }</option>
															</c:forEach>
														</c:if>
														<c:if test="${language == 'tc'}">
															<c:forEach var="list" items="${savieBeneficiaryRelationshipCN}">
																<option value="${list.itemCode }-${list.itemDesc }" <c:if test="${lifeBeneficaryInfo.beneficaryRelation1 == list.itemCode}">selected="selected"</c:if>>${list.itemDesc }</option>
															</c:forEach>
														</c:if>
													</select>
												</div>
												<span class="error-msg" id="beneficiaryRelationErMsg[0]"></span>
											</div>
										 </div>
									 </div>
									 <div class="form-group has-error beneficiary-info-row entitle">
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
											<input type="text" id="beneficiaryEntitlement[0]" name="beneficaryWeight1" value="${lifeBeneficaryInfo.beneficaryWeight1 }" class="form-control gray-textbox percentage mdl-textfield__input so-mdl-textfield-input" />
											<label class="mdl-textfield__label so-mdl-textfield-label" for="beneficiaryEntitlement[0]">Entitlement (%)</label>
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
										<h5>Add beneficiary</h5>
									</div>
								</div>
								<div class="clearfix add-on-header hidden" id="beneficiary-header[1]">
									<div class="pull-left">
										<h5 class="beneficiary-h5 hidden-lg hidden-md">Beneficiary <span class="beneficiary-span">(Person 2)</span>
										</h5>
									</div>
									<div class="pull-right">
										<button type="button" class="remove-bnfry-btn" id="remove-beneficiary[1]"><i class="fa fa-minus-circle"></i>Remove Beneficiary</button>
									</div>
								</div>
								<form id="beneficiary-info-form[1]" class="beneficiary-form-content hidden" method="post" action="">
									<div class="form-group has-error beneficiary-info-row">
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
											<input type="text" id="beneficiaryLastName[1]" name="beneficaryLastName2" value="${lifeBeneficaryInfo.beneficaryLastName2 }" class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input" maxlength="25" />
											<label class="mdl-textfield__label so-mdl-textfield-label" for="beneficiaryLastName[1]">Last name (same as HKID)</label>
										</div>
										<span class="error-msg" id="beneficiaryLastErMsg[1]"></span>
									</div>
									<div class="form-group has-error beneficiary-info-row">
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
											<input type="text" id="beneficiaryFirstName[1]" name="beneficaryFirstName2" value="${lifeBeneficaryInfo.beneficaryFirstName2 }" class="form-control gray-textbox form-textbox mdl-textfield__input so-mdl-textfield-input" maxlength="25" />
											<label class="mdl-textfield__label so-mdl-textfield-label" for="beneficiaryFirstName[1]">First name (same as HKID)</label>
										</div>
										<input type="text" autocomplete="off" id="beneficiaryFullName[1]" hidden />
										<span class="error-msg" id="beneficiaryFirstErMsg[1]"></span>
										<span class="dup-error-msg hidden" id="beneficiaryDupNameErMsg[1]">Duplicate english name</span>
									</div>
									<div class="form-group has-error beneficiary-info-row">
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
											<input type="text" id="beneficiaryChineseName[1]" name="beneficaryChineseName2" value="${lifeBeneficaryInfo.beneficaryChineseName2 }" class="form-control gray-textbox form-textbox form-textbox mdl-textfield__input so-mdl-textfield-input" />
											<label class="mdl-textfield__label so-mdl-textfield-label" for="beneficiaryChineseName[1]">Name in Chinese (optional)</label>
										</div>
										<span class="error-msg" id="beneficiaryChineseNameErMsg[1]"></span>
										<span class="dup-error-msg hidden" id="beneficiaryDupChineseErMsg[1]">Duplicate chinese name</span>
									</div>
									<div class="form-group has-error beneficiary-info-row">
										<div class="clearfix">
											<div class="left-desktop text-box">
											   <div class="selectDiv">
												  <label class="mdl-textfield__label cstm-dropdown-label">HKID / Passport</label>
												  <span class="icon-chevron-thin-down orange-caret"></span>
												  <select class="form-control gray-dropdown" name="beneficiaryHkidPassport[1]" id="beneficiaryHkidPassport[1]">
													 <option value="" selected="selected" disabled="disabled">HKID / Passport</option>
													 <option value="hkid">HKID</option>
													 <option value="passport">Passport</option>
												  </select>
											   </div>
											   <span class="error-msg" id="beneficiaryHkidPassportErMsg[1]"></span>
											</div>
										 </div>
									 </div>
									<div class="form-group has-error beneficiary-info-row">
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield" id="hkid-inputfield-1">
											<input type="text" id="beneficiaryHkid[1]" name="beneficaryID2" value="${lifeBeneficaryInfo.beneficaryID2 }" class="form-control gray-textbox form-textbox mdl-textfield__input so-mdl-textfield-input" />
											<label class="mdl-textfield__label so-mdl-textfield-label" for="beneficiaryHkid[1]">HKID / Passport no.</label>
										</div>
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield hidden" id="passport-inputfield-1">
											<input type="text" id="beneficiaryPassport[1]" name="beneficiaryPassport2" value="${lifeBeneficaryInfo.beneficiaryPassport2 }" class="form-control gray-textbox form-textbox mdl-textfield__input so-mdl-textfield-input" />
											<label class="mdl-textfield__label so-mdl-textfield-label" for="beneficiaryPassport[1]">HKID / Passport no.</label>
										</div>
										<span class="error-msg" id="beneficiaryHkidPassErMsg[1]"></span>
										<span class="dup-error-msg hidden" id="beneficiaryDupHkidErMsg[1]">Duplicate beneficiaries HKID</span>
										<span class="dup-error-msg hidden" id="beneficiaryDupPassportErMsg[1]">Duplicate beneficiaries Passport</span>
									</div>
									 <div class="form-group has-error beneficiary-info-row">
										<div class="clearfix">
											<div class="left-desktop text-box">
												<div class="selectDiv">
													<label class="mdl-textfield__label cstm-dropdown-label">Gender</label>
													<span class="icon-chevron-thin-down orange-caret"></span>
													<select class="form-control gray-dropdown" name="beneficaryGender2" id="beneficiaryGender[1]">
														<option value="" selected="selected" disabled="disabled">Gender</option>
														<option value="male" <c:if test="${lifeBeneficaryInfo.beneficaryGender2 == 'male'}">selected="selected"</c:if>>MALE</option>
														<option value="female" <c:if test="${lifeBeneficaryInfo.beneficaryGender2 == 'female'}">selected="selected"</c:if>>FEMALE</option>
													</select>
												</div>
												<span class="error-msg" id="beneficiaryGenderErMsg[1]"></span>
											</div>
										 </div>
									 </div>
									 <div class="form-group has-error beneficiary-info-row">
										<div class="clearfix">
											<div class="left-desktop text-box">
												<div class="selectDiv">
													<label class="mdl-textfield__label cstm-dropdown-label">Relationship with you</label>
													<span class="icon-chevron-thin-down orange-caret"></span>
													<select class="form-control gray-dropdown"  id="beneficiaryRelationship[1]" name="beneficaryRelation2">
														<option value="" selected="selected" disabled="disabled">Relationship with you</option>
														<c:if test="${language == 'en'}">
															<c:forEach var="list" items="${savieBeneficiaryRelationshipEN}">
																<option value="${list.itemCode }-${list.itemDesc }" <c:if test="${lifeBeneficaryInfo.beneficaryRelation2 == list.itemCode}">selected="selected"</c:if>>${list.itemDesc }</option>
															</c:forEach>
														</c:if>
														<c:if test="${language == 'tc'}">
															<c:forEach var="list" items="${savieBeneficiaryRelationshipCN}">
																<option value="${list.itemCode }-${list.itemDesc }" <c:if test="${lifeBeneficaryInfo.beneficaryRelation2 == list.itemCode}">selected="selected"</c:if>>${list.itemDesc }</option>
															</c:forEach>
														</c:if>
													</select>
												</div>
												<span class="error-msg" id="beneficiaryRelationErMsg[1]"></span>
											</div>
										 </div>
									 </div>
									 <div class="form-group has-error beneficiary-info-row entitle">
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
											<input type="text" id="beneficiaryEntitlement[1]" name="beneficaryWeight2" value="${lifeBeneficaryInfo.beneficaryWeight2 }" class="form-control gray-textbox percentage mdl-textfield__input so-mdl-textfield-input" />
											<label class="mdl-textfield__label so-mdl-textfield-label" for="beneficiaryEntitlement[1]">Entitlement (%)</label>
										</div>
										<span class="error-msg" id="beneficiaryEntitlementErMsg[1]"></span>
									 </div>
								</form>
							</div>
							<!-- Third Beneficiary -->
							<div id="add-beneficiary-2" class="text-center add-on-beneficiary col-md-4 col-lg-4 col-sm-12 col-xs-12 last-row hidden">
								<div class="add-beneficiary" id="beneficiary2">
									<button id="add-beneficiary-btn-2" value="2" class="circle" type="button">
										<img src="<%=request.getContextPath()%>/resources/images/savie-2016/orange-plus.png" />
									</button>
									<div class="add-beneficiary-text">
										<h5>Add beneficiary</h5>
									</div>
								</div>
								<div class="clearfix add-on-header hidden" id="beneficiary-header[2]">
									<div class="pull-left">
										<h5 class="beneficiary-h5 hidden-lg hidden-md">Beneficiary <span class="beneficiary-span">(Person 3)</span>
										</h5>
									</div>
									<div class="pull-right">
										<button type="button" class="remove-bnfry-btn" id="remove-beneficiary[2]"><i class="fa fa-minus-circle"></i>Remove Beneficiary</button>
									</div>
								</div>
								<form id="beneficiary-info-form[2]" class="beneficiary-form-content hidden" method="post" action="">
									<div class="form-group has-error beneficiary-info-row">
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
											<input type="text" id="beneficiaryLastName[2]" name="beneficaryLastName3" value="${lifeBeneficaryInfo.beneficaryLastName3 }" class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input" maxlength="25" />
											<label class="mdl-textfield__label so-mdl-textfield-label" for="beneficiaryLastName[2]">Last name (same as HKID)</label>
										</div>
										<span class="error-msg" id="beneficiaryLastErMsg[2]"></span>
									</div>
									<div class="form-group has-error beneficiary-info-row">
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
											<input type="text" id="beneficiaryFirstName[2]" name="beneficaryFirstName3" value="${lifeBeneficaryInfo.beneficaryFirstName3 }" class="form-control gray-textbox form-textbox mdl-textfield__input so-mdl-textfield-input" maxlength="25" />
											<label class="mdl-textfield__label so-mdl-textfield-label" for="beneficiaryFirstName[2]">First name (same as HKID)</label>
										</div>
										<input type="text" autocomplete="off" id="beneficiaryFullName[2]" hidden />
										<span class="error-msg" id="beneficiaryFirstErMsg[2]"></span>
										<span class="dup-error-msg hidden" id="beneficiaryDupNameErMsg[2]">Duplicate english name</span>
									</div>
									<div class="form-group has-error beneficiary-info-row">
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
											<input type="text" id="beneficiaryChineseName[2]" name="beneficaryChineseName3" value="${lifeBeneficaryInfo.beneficaryChineseName3 }" class="form-control gray-textbox form-textbox form-textbox mdl-textfield__input so-mdl-textfield-input" />
											<label class="mdl-textfield__label so-mdl-textfield-label" for="beneficiaryChineseName[2]">Name in Chinese (optional)</label>
										</div>
										<span class="error-msg" id="beneficiaryChineseNameErMsg[2]"></span>
										<span class="dup-error-msg hidden" id="beneficiaryDupChineseErMsg[2]">Duplicate chinese name</span>
									</div>
									<div class="form-group has-error beneficiary-info-row">
										<div class="clearfix">
											<div class="left-desktop text-box">
											   <div class="selectDiv">
												  <label class="mdl-textfield__label cstm-dropdown-label">HKID / Passport</label>
												  <span class="icon-chevron-thin-down orange-caret"></span>
												  <select class="form-control gray-dropdown" name="beneficiaryHkidPassport[2]" id="beneficiaryHkidPassport[2]">
													 <option value="" selected="selected" disabled="disabled">HKID / Passport</option>
													 <option value="hkid">HKID</option>
													 <option value="passport">Passport</option>
												  </select>
											   </div>
											   <span class="error-msg" id="beneficiaryHkidPassportErMsg[2]"></span>
											</div>
										 </div>
									 </div>
									<div class="form-group has-error beneficiary-info-row">
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield" id="hkid-inputfield-2">
											<input type="text" id="beneficiaryHkid[2]" name="beneficaryID3" value="${lifeBeneficaryInfo.beneficaryID3 }" class="form-control gray-textbox form-textbox mdl-textfield__input so-mdl-textfield-input" />
											<label class="mdl-textfield__label so-mdl-textfield-label" for="beneficiaryHkid[2]">HKID / Passport no.</label>
										</div>
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield hidden" id="passport-inputfield-2">
											<input type="text" id="beneficiaryPassport[2]" name="beneficiaryPassport3" value="${lifeBeneficaryInfo.beneficiaryPassport3 }" class="form-control gray-textbox form-textbox mdl-textfield__input so-mdl-textfield-input" />
											<label class="mdl-textfield__label so-mdl-textfield-label" for="beneficiaryPassport[2]">HKID / Passport no.</label>
										</div>
										<span class="error-msg" id="beneficiaryHkidPassErMsg[2]"></span>
										<span class="dup-error-msg hidden" id="beneficiaryDupHkidErMsg[2]">Duplicate beneficiaries HKID</span>
										<span class="dup-error-msg hidden" id="beneficiaryDupPassportErMsg[2]">Duplicate beneficiaries Passport</span>
									</div>
									 <div class="form-group has-error beneficiary-info-row">
										<div class="clearfix">
											<div class="left-desktop text-box">
												<div class="selectDiv">
													<label class="mdl-textfield__label cstm-dropdown-label">Gender</label>
													<span class="icon-chevron-thin-down orange-caret"></span>
													<select class="form-control gray-dropdown" name="beneficaryGender3" id="beneficiaryGender[2]">
														<option value="" selected="selected" disabled="disabled">Gender</option>
														<option value="male" <c:if test="${lifeBeneficaryInfo.beneficaryGender3 == 'male'}">selected="selected"</c:if>>MALE</option>
														<option value="female" <c:if test="${lifeBeneficaryInfo.beneficaryGender3 == 'female'}">selected="selected"</c:if>>FEMALE</option>
													</select>
												</div>
												<span class="error-msg" id="beneficiaryGenderErMsg[2]"></span>
											</div>
										 </div>
									 </div>
									 <div class="form-group has-error beneficiary-info-row">
										<div class="clearfix">
											<div class="left-desktop text-box">
												<div class="selectDiv">
													<label class="mdl-textfield__label cstm-dropdown-label">Relationship with you</label>
													<span class="icon-chevron-thin-down orange-caret"></span>
													<select class="form-control gray-dropdown"  id="beneficiaryRelationship[2]" name="beneficaryRelation3">
														<option value="" selected="selected" disabled="disabled">Relationship with you</option>
														<c:if test="${language == 'en'}">
															<c:forEach var="list" items="${savieBeneficiaryRelationshipEN}">
																<option value="${list.itemCode }-${list.itemDesc }" <c:if test="${lifeBeneficaryInfo.beneficaryRelation3 == list.itemCode}">selected="selected"</c:if>>${list.itemDesc }</option>
															</c:forEach>
														</c:if>
														<c:if test="${language == 'tc'}">
															<c:forEach var="list" items="${savieBeneficiaryRelationshipCN}">
																<option value="${list.itemCode }-${list.itemDesc }" <c:if test="${lifeBeneficaryInfo.beneficaryRelation3 == list.itemCode}">selected="selected"</c:if>>${list.itemDesc }</option>
															</c:forEach>
														</c:if>
													</select>
												</div>
												<span class="error-msg" id="beneficiaryRelationErMsg[2]"></span>
											</div>
										 </div>
									 </div>
									 <div class="form-group has-error beneficiary-info-row entitle">
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
											<input type="text" id="beneficiaryEntitlement[2]" name="beneficaryWeight3" value="${lifeBeneficaryInfo.beneficaryWeight3 }" class="form-control gray-textbox percentage mdl-textfield__input so-mdl-textfield-input"  />
											<label class="mdl-textfield__label so-mdl-textfield-label" for="beneficiaryEntitlement[2]">Entitlement (%)</label>
										</div>
										<span class="error-msg" id="beneficiaryEntitlementErMsg[2]"></span>
									 </div>
								</form>
							</div>
						</div>
						<div class="fwd-container-limitpersonal-info-widget page-application et-application-page clearfix" id="beneficiary-note">
							<p>You may change the Beneficiary of this Policy by filing a written request at any time and as many times as you wish, 
							however, for the first time you make the change, you are required to make the change request in person at one of our 
							Customer Service Centers. </p>
							<div id="beneficiary-btn">
								<button type="submit" class="btn beneficiary-btn-next savie-common-btn" id="beneficiary-next-btn">Next</button>
								<button type="button" class="btn beneficiary-btn-back savie-common-btn hidden">Back to application summary</button>
								<a href="#" class="span-save-continue" id="bf-save-and-con-later">
									<span>Save and continue later</span>
								</a>
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
			$(document).ready(function() {
				var language = "en";
				
				var dummy = true;
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
				
				// application saved modal will show after clicking 'Save and exit' button 
				$('.save-exit-btn2, #save-exit-btn').click(function() {
					$(this).closest('.modal').modal('hide');
					$('#application-saved-modal').modal('show');
				});
				
				soFirstBFormValidation();
				$('#beneficiary-info-form\\[0\\]').data('bootstrapValidator').validate();
				
				$('.selectDiv').removeClass('is-not-active');
				
				$('#bf-save-and-con-later').on('click', function (e) {
					if($('#beneficiary-info-form\\[0\\]').val() == undefined ) {
						$('#beneficiary-info-form\\[0\\]').data('bootstrapValidator').enableFieldValidators('beneficiaryChineseName[0]', false);
					}
					$('#beneficiary-info-form\\[0\\]').data('bootstrapValidator').validateField('beneficiaryChineseName[0]');
					if($('#beneficiary-info-form\\[0\\]').data('bootstrapValidator').isValid()) {
					   $('#save-and-continue-batch5-modal').modal('show');           
					} else {
						$('#save-and-continue-modal').modal('show');
					}
					// second form
					if($('#beneficiary-info-form\\[1\\]').length == 0) {
						$('#beneficiary-info-form\\[1\\]').data('bootstrapValidator').enableFieldValidators('beneficiaryChineseName[1]', false);
					}
					$('#beneficiary-info-form\\[1\\]').data('bootstrapValidator').validateField('beneficiaryChineseName[1]');
					if($('#beneficiary-info-form\\[1\\]').data('bootstrapValidator').isValid()) {
					   $('#save-and-continue-batch5-modal').modal('show');           
					} else {
						$('#save-and-continue-modal').modal('show');
					}
					// third form
					if($('#beneficiary-info-form\\[2\\]').length == 0) {
						$('#beneficiary-info-form\\[2\\]').data('bootstrapValidator').enableFieldValidators('beneficiaryChineseName[2]', false);
					}
					$('#beneficiary-info-form\\[2\\]').data('bootstrapValidator').validateField('beneficiaryChineseName[2]');
					if($('#beneficiary-info-form\\[2\\]').data('bootstrapValidator').isValid()) {
					   $('#save-and-continue-batch5-modal').modal('show');           
					} else {
						$('#save-and-continue-modal').modal('show');
					}
                });
			});
			
			$("#beneficiary-next-btn").click(function(){
				$("#errorMsg").html("");
				var formdata = $('#beneficiary-info-form\\[0\\]').serialize()+"&"+
							   $('#beneficiary-info-form\\[1\\]').serialize()+"&"+
							   $('#beneficiary-info-form\\[2\\]').serialize();
				$.ajax({
					  type : "POST",
					  async:false, 
					  url : "<%=request.getContextPath()%>/ajax/savings-insurance/lifeBeneficaryInfo",
					  data: formdata,
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
				var formdata1 = $('#beneficiary-info-form\\[0\\]').serialize()+"&"+
				   $('#beneficiary-info-form\\[1\\]').serialize()+"&"+
				   $('#beneficiary-info-form\\[2\\]').serialize();
				$.ajax({
					  type : "POST",
					  async:false, 
					  url : "<%=request.getContextPath()%>/ajax/savings-insurance/lifeBeneficaryInfoSaveforLater",
					  data: formdata1,
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