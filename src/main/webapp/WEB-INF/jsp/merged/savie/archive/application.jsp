<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeQuoteBean"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<%!
	boolean isSaleActiveClass = true;
%>
<script type="text/javascript">
	function applicationSubmit() {
		var url = '${pageContext.request.contextPath}'+'/'+'${language}'+'/'+'savings-insurance/';
		if($("#pay-later-radio").is(":checked")){
			url += '${nextPageFlow2}';
		}
		else{
			url += '${nextPageFlow}';
		}
		$("#detailInfo").attr("action", url);
		$('#detailInfo').submit();
	}
</script>
<form id="detailInfo" method="post" action="">
		<div class="fwd-savie-wrapper">
			<!--Application Header Info Widget-->
			<div class="container-fluid fwd-full-container">
				<div class="application-page-header">
					<div class="row">
						<div class="col-xs-12 orange-section">
							<div class="clearfix position">
								<div class="back-arrow-left">
									<a id="application-return-btn" class="btn back-arrow-btn" href="financial-needs-analysis-review">
										<span class="icon-arrow-left2 arrow-left"></span>
									</a>
								</div>
								
								<div class="orange-menu-desktop">
									<div class="row">
										<div class="col-md-3">
											<button type="button" class="orange-menu-btn" id="applicant-header-btn">
												<fmt:message key="savie.application.Applicant" bundle="${msg}" />
											</button>
										</div>
										<div class="col-md-3">
											<button type="button" class="orange-menu-btn" id="employment-header-btn">
											    <fmt:message key="savie.application.Employment" bundle="${msg}" />
											</button>
										</div>
										<div class="col-md-3">
											<button type="button" class="orange-menu-btn" id="beneficiary-header-btn">
											    <fmt:message key="savie.application.Beneficiary" bundle="${msg}" />
											</button>
										</div>
										<div class="col-md-3 right-most">
											<button type="button" class="orange-menu-btn" id="payment-header-btn">
											    <fmt:message key="savie.application.Payment" bundle="${msg}" />
											</button>
										</div>
									</div>
								</div>
								
								<div class="dollars-monthly-right">
									<div class="figures">
										<span class="single"><fmt:message key="savie.application.Single.premium" bundle="${msg}" /></span>
										<span class="dollars"><fmt:message key="savie.application.HK" bundle="${msg}" /> <span class="figure">100,000</span></span>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xs-12 gray-section">
							<div class="description"><fmt:message key="savie.application.description" bundle="${msg}" /></div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="application-flux">
				<!--Personal Info Widget-->
				<div class="container-fluid fwd-container">
					<div id="personal-info" class="personal-info-widget page-application">
						<h2><fmt:message key="savie.application.person.info" bundle="${msg}" />	
							<button type="button" class="tooltip-button hidden-xs hidden-sm" data-toggle="tooltip" data-placement="right" title="<fmt:message key="savie.application.tips" bundle="${msg}" />"><span class="info-tooltip"></span></button>
						</h2>
						<!-- 
						<form id="insuredInfoForm" method="post" class="form-horizontal" action="target.jsp" onsubmit="return false">
						 -->
							<div class="row margin">
								<div class="col-sm-12 col-md-6 left">
									
									<div class="clearfix">
										<div class="left-desktop description">
											<label for="give-last-name" class="application-page-input-text"><fmt:message key="savie.application.english.name" bundle="${msg}" /></label>
										</div>
										<div class="left-desktop text-box">
											<input class="form-control gray-textbox" id="savieApplicantBean.firstName" name="savieApplicantBean.firstName" type="text" placeholder="Given Name">
											<input class="form-control gray-textbox" id="savieApplicantBean.lastName" name="savieApplicantBean.lastName" type="text" placeholder="Last Name">
										</div>
									</div>
									
									<div class="clearfix">
										<div class="left-desktop description">
											<label for="savieApplicantBean.chineseName" class="application-page-input-text"><fmt:message key="savie.application.chinese.name" bundle="${msg}" /> <span class="optional"><fmt:message key="savie.application.optional" bundle="${msg}" /></span></label>
										</div>
										<div class="left-desktop text-box">
											<input class="form-control gray-textbox" id="savieApplicantBean.chineseName" name="savieApplicantBean.chineseName" type="text" placeholder="Name in Chinese">
										</div>
									</div>
									<div class="clearfix form-group has-error">
										<div class="left-desktop description">
											<label for="savieApplicantBean.hkId" class="application-page-input-text"><fmt:message key="savie.application.HKID" bundle="${msg}" /></label>
										</div>
										<div class="left-desktop text-box">
											<input class="form-control gray-textbox" id="savieApplicantBean.hkId" name="savieApplicantBean.hkId" type="text" placeholder="X123456(7)" pattern="^([A-Z0-9])*$" >
											<span class="error-msg" id="hkidMessage"></span>
										</div>
									</div>
									
									<div class="clearfix">
										<div class="left-desktop description">
											<label for="savieApplicantBean.gender" class="application-page-input-text"><fmt:message key="savie.application.Gender" bundle="${msg}" /></label>
										</div>
										<div class="left-desktop text-box ">
											<div class="gender-section">
												<div class="clearfix">
													<div class="pull-left male">
														<label class="pi-male-radio" for="pi-male-now">
														<input type="radio" id="pi-male-now" name="appGender" value="M" checked>
														<span class="pi-male-text">
															<span class="text"><fmt:message key="savie.application.Male" bundle="${msg}" /></span>
														</span>
														</label>
														<div class="descriptions male">
															<span class="desktop-text"><fmt:message key="savie.application.Male" bundle="${msg}" /></span>
														</div>
													</div>
													<div class="pull-left female">
														<label class="pi-female-radio" for="pi-female-now">
														<input type="radio" id="pi-female-now" name="appGender" value="F" >
														<span class="pi-female-text">
															<span class="text"><fmt:message key="savie.application.Female" bundle="${msg}" /></span>
														</span>
														</label>
														<div class="descriptions female">
															<span class="desktop-text"><fmt:message key="savie.application.Female" bundle="${msg}" /></span>
														</div>
														
													</div>
													<span class="error-msg" id="genderMessage"></span>
												</div>
											</div>
										</div>
									</div>
									
									<div class="clearfix  form-group has-error">
										<div class="left-desktop description">
											<label for="savieApplicantBean.maritalStatus" class="application-page-input-text"><fmt:message key="savie.application.Marital.status" bundle="${msg}" /></label>
										</div>
										<div class="left-desktop text-box">

											<div class="selectDiv">
												<span class="icon-chevron-thin-down orange-caret"></span>
												<select class="form-control gray-dropdown" name="maritalStatus"  id="savieApplicantBean.maritalStatus">
													<c:if test="${language == 'en'}">
													   <c:forEach var="list" items="${maritalStatusesEN}">
													      <option value="${list.itemCode }-${list.itemDesc }">${list.itemDesc }</option>
													   </c:forEach>
													</c:if>
													<c:if test="${language == 'tc'}">
													   <c:forEach var="list" items="${maritalStatusesCN}">
													      <option value="${list.itemCode }-${list.itemDesc }">${list.itemDesc }</option>
													   </c:forEach>
													</c:if>
												</select>
											</div>
											<span class="error-msg" id="maritalStatusMessage"></span>
										</div>
									</div>
									
									
									
								
									<div class="clearfix form-group has-error">
										<div class="left-desktop description">
											<label for="savieApplicantBean.placeOfBirth" class="application-page-input-text"><fmt:message key="savie.application.Place.birth" bundle="${msg}" /></label>
										</div>
										<div class="left-desktop text-box">
											<div class="selectDiv">
												<span class="icon-chevron-thin-down orange-caret"></span>
												<select class="form-control gray-dropdown" data-style="application-select selection" id="savieApplicantBean.placeOfBirth" name="savieApplicantBean.placeOfBirth">
													<c:if test="${language == 'en'}">
													   <c:forEach var="list" items="${placeOfBirthEN}">
													      <option value="${list.itemCode }-${list.itemDesc }">${list.itemDesc }</option>
													   </c:forEach>
													</c:if>
													<c:if test="${language == 'tc'}">
													   <c:forEach var="list" items="${placeOfBirthCN}">
													      <option value="${list.itemCode }-${list.itemDesc }">${list.itemDesc }</option>
													   </c:forEach>
													</c:if>
												</select>
											</div>
											<span class="error-msg" id="placeOfBirthMessage"></span>
										</div>
									</div>
									
									<div class="clearfix form-group has-error">
										<div class="left-desktop description">
											<label for="savieApplicantBean.nationality" class="application-page-input-text"><fmt:message key="savie.application.Nationality" bundle="${msg}" /></label>
										</div>
										<div class="left-desktop text-box">
											<div class="selectDiv">
												<span class="icon-chevron-thin-down orange-caret"></span>
												<select class="form-control gray-dropdown"  data-style="application-select selection" id="savieApplicantBean.nationality" name="savieApplicantBean.nationality">
													<c:if test="${language == 'en'}">
													   <c:forEach var="list" items="${nationalityEN}">
													      <option value="${list.itemCode }-${list.itemDesc }">${list.itemDesc }</option>
													   </c:forEach>
													</c:if>
													<c:if test="${language == 'tc'}">
													   <c:forEach var="list" items="${nationalityCN}">
													      <option value="${list.itemCode }-${list.itemDesc }">${list.itemDesc }</option>
													   </c:forEach>
													</c:if>	
												</select>
											</div>
											<span class="error-msg" id="nationalityMessage"></span>
										</div>
									</div>
									
									<div class="clearfix">
										<div class="left-desktop right-description">
											<label for="savieApplicantBean.residentialTelNo" class="application-page-input-text"><fmt:message key="savie.application.Residential.tel" bundle="${msg}" /></label>
										</div>
										<div class="left-desktop text-box clearfix">
											<div class="pull-left prefix">
												<input class="form-control gray-textbox" id="residential-first" type="number" placeholder="852" onchange="getResidentialFinalValue()" maxlength="3" oninput="maxLengthCheck(this)"  max="999" min ="1"/>
											</div>
											<div class="pull-left suffix">
												<input class="form-control gray-textbox" id="residential-second" type="number" placeholder="12345678" onchange="getResidentialFinalValue()" maxlength="8" oninput="maxLengthCheck(this)"  max="99999999" min ="1"/>
											</div>
											<input id="savieApplicantBean.residentialTelNo" name="savieApplicantBean.residentialTelNo" value="" type="hidden" />
										</div>
										
									</div>
							
									<div class="clearfix form-group has-error">
										<div class="left-desktop right-description">
											<label for="savieApplicantBean.mobileNo" class="application-page-input-text"><fmt:message key="savie.application.Mobile.no" bundle="${msg}" /></label>
										</div>
										<div class="left-desktop text-box">
											<div class="clearfix form-group">
												<div class="pull-left prefix">
													<input class="form-control gray-textbox" id="mobile-first" type="number" placeholder="852" onchange="getMobileFinalValue()" maxlength="3" oninput="maxLengthCheck(this)"  max="999" min ="1"/>
												</div>
												<div class="pull-left suffix">
													<input class="form-control gray-textbox" id="mobile-second" type="text" placeholder="12345678" onchange="getMobileFinalValue()" maxlength="8" oninput="maxLengthCheck(this)"  max="99999999" min ="1"/>
												</div>
												<input id="savieApplicantBean.mobileNo" name="savieApplicantBean.mobileNo" value="" type="hidden" />
												<span class="error-msg" id="mobilePrefixMessage"></span>
												<span class="error-msg" id="mobileSuffixMessage"></span>
												<span class="error-msg" id="mobileSuffixSecondMessage"></span>
												<span class="error-msg" id="applicantMobNum"></span>
											</div>
										</div>
									</div>
									
									<div class="clearfix form-group has-error">
										<div class="left-desktop right-description">
											<label for="savieApplicantBean.emailAddress" class="application-page-input-text"><fmt:message key="savie.application.Email.address" bundle="${msg}" /></label>
										</div>
										<div class="left-desktop text-box">
											<input class="form-control gray-textbox" id="savieApplicantBean.emailAddress" name="savieApplicantBean.email" type="email" placeholder="Email address">
											<span class="error-msg" id="emailMessage"></span>
										</div>
									</div>
								</div>
								<div class="col-sm-12 col-md-6 right">
									<div class="clearfix form-group has-error">
										<div class="left-desktop right-description">
											<label for="inputdefault" class="application-page-input-text"><fmt:message key="savie.application.Residential.address" bundle="${msg}" /></label>
										</div>
										<div class="left-desktop text-box">
											<input class="form-control gray-textbox residential" id="savieApplicantBean.residentialAdress1" name="savieApplicantBean.residentialAdress1" type="text" placeholder="Line 1">
											<span class="error-msg" id="resLine1Message"></span>
											<input class="form-control gray-textbox residential" id="savieApplicantBean.residentialAdress2" name="savieApplicantBean.residentialAdress2" type="text" placeholder="Line 2">
											<input class="form-control gray-textbox residential" id="savieApplicantBean.residentialAdress3" name="savieApplicantBean.residentialAdress3" type="text" placeholder="Line 3">
											<div class="selectDiv">
												<span class="icon-chevron-thin-down orange-caret"></span>
												<select class="form-control gray-dropdown"  data-style="application-select selection" name="savieApplicantBean.residentialDistrict" id="savieApplicantBean.residentialDistrict">
													<c:if test="${language == 'en'}">
													   <c:forEach var="list" items="${savieDistrictEN}">
													      <option value="${list.itemCode }-${list.itemDesc }">${list.itemDesc }</option>
													   </c:forEach>
													</c:if>
													<c:if test="${language == 'tc'}">
													   <c:forEach var="list" items="${savieDistrictCN}">
													      <option value="${list.itemCode }-${list.itemDesc }">${list.itemDesc }</option>
													   </c:forEach>
													</c:if>	
												</select>
											</div>
											<span class="error-msg" id="resDistrictMessage"></span>
										</div>
									</div>
									
									<div class="clearfix form-group has-error hidden" id="correspondence-address">
										<div class="left-desktop right-description">
											<label for="inputdefault" class="application-page-input-text"><fmt:message key="savie.application.Correspondence.address" bundle="${msg}" /></label>
										</div>
										<div class="left-desktop text-box">
											<input class="form-control gray-textbox residential" id="savieApplicantBean.correspondenceAdress1" name="savieApplicantBean.correspondenceAdress1" type="text" placeholder="Line 1">
											<span class="error-msg" id="resLine1Message"></span>
											<input class="form-control gray-textbox residential" id="savieApplicantBean.correspondenceAdress2" name="savieApplicantBean.correspondenceAdress2" type="text" placeholder="Line 2">
											<input class="form-control gray-textbox residential" id="savieApplicantBean.correspondenceAdress3" name="savieApplicantBean.correspondenceAdress3" type="text" placeholder="Line 3">
											
											<div class="selectDiv">
												<span class="icon-chevron-thin-down orange-caret"></span>
												<select class="form-control gray-dropdown"  data-style="application-select selection" name="savieApplicantBean.correspondenceDistrict" id="savieApplicantBean.correspondenceDistrict">
													<c:if test="${language == 'en'}">
													   <c:forEach var="list" items="${savieDistrictEN}">
													      <option value="${list.itemCode }-${list.itemDesc }">${list.itemDesc }</option>
													   </c:forEach>
													</c:if>
													<c:if test="${language == 'tc'}">
													   <c:forEach var="list" items="${savieDistrictCN}">
													      <option value="${list.itemCode }-${list.itemDesc }">${list.itemDesc }</option>
													   </c:forEach>
													</c:if>		
												</select>
											</div>
											<span class="error-msg" id="resDistrictMessage"></span>
											<span class="warning-note"><span class="orange">*</span><fmt:message key="savie.application.No.address.allowed" bundle="${msg}" /></span>
										</div>
									</div>
									
									<div class="clearfix">
										<div class="left-desktop description">
											
										</div>
										<div class="left-desktop check-box">
											<div class="checkbox-section">
												<div class="clearfix">
													<div class="pull-left left-checkbox">
														<input type="checkbox" value="None" id="savieApplicantBean.addressIsSame" name="savieApplicantBean.addressIsSame" />
														<label for="savieApplicantBean.addressIsSame"></label>
													</div>
													<div class="pull-left right-checkbox">
														<span class="checkbox-text"><fmt:message key="savie.application.correspondance.address.same" bundle="${msg}" /></span>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>		
							</div>
							<div class="next-btn">
								<button id="personal-info-next" type="button" class="btn next pi"><fmt:message key="savie.application.Next" bundle="${msg}" /></button>
							</div>
							<!-- 
						</form>
						 -->
					</div>
				</div>
				<div class="page-divider"></div>
				<div id="employment-info" class="page-application container-fluid fwd-container">
					<h2 class="text-center"><fmt:message key="savie.application.Employment.Info" bundle="${msg}" /></h2>
					<!-- 
					<form class="content"  id="employmentInfoForm" method="post" action="application.jsp" onsubmit="return false">
					 -->
						<div class="content-left">
							<div class="clearfix form-group has-error employment-info-row">
								<label for="savieEmploymentBean.employmentStatus"><fmt:message key="savie.application.Employment.status" bundle="${msg}" /></label>
								<div class="selectEmployment">
									<span class="icon-chevron-thin-down orange-caret"></span>
									<select class="form-control gray-dropdown" id="savieEmploymentBean.employmentStatus" name="savieEmploymentBean.employmentStatus" data-style="application-select">
										<c:if test="${language == 'en'}">
										   <c:forEach var="list" items="${employmentStatusEN}">
										      <option value="${list.itemCode }-${list.itemDesc }">${list.itemDesc }</option>
										   </c:forEach>
										</c:if>
										<c:if test="${language == 'tc'}">
										   <c:forEach var="list" items="${employmentStatusCN}">
										      <option value="${list.itemCode }-${list.itemDesc }">${list.itemDesc }</option>
										   </c:forEach>
										</c:if>	
									</select>
									<span class="error-msg" id="employmentStatusMessage"></span>
								</div>
							</div>
							<div class="clearfix form-group has-error employment-info-row">
								<label for="savieEmploymentBean.occupation"><fmt:message key="savie.application.Occupation" bundle="${msg}" /></label>
								<div class="selectEmployment">
									<span class="icon-chevron-thin-down orange-caret"></span>
									<select class="form-control gray-dropdown" id="savieEmploymentBeanOccupation" name="savieEmploymentBean.occupation" data-style="application-select">
										<c:if test="${language == 'en'}">
											<c:forEach var="list" items="${occupationEN}">
											  <option value="${list.itemCode }-${list.itemDesc }">${list.itemDesc }</option>
											</c:forEach>
										</c:if>
										<c:if test="${language == 'tc'}">
											<c:forEach var="list" items="${occupationCN}">
											  <option value="${list.itemCode }-${list.itemDesc }">${list.itemDesc }</option>
											</c:forEach>
										</c:if>	
									</select>
									<span class="error-msg" id="occupationMessage"></span>
								</div>
							</div>
						</div>
						<div class="content-right">
							<div class="clearfix form-group has-error employment-info-row">
								<label for="savieEmploymentBean.natureOfBusiness"><fmt:message key="savie.application.Nature.business" bundle="${msg}" /></label>
								<div class="selectEmployment">
									<span class="icon-chevron-thin-down orange-caret"></span>
									<select class="form-control gray-dropdown" id="savieEmploymentBean.natureOfBusiness" name="savieEmploymentBean.natureOfBusiness" data-style="application-select" onclick="getOccupation(this.value,'${language }');">
										<c:if test="${language == 'en'}">
											<c:forEach var="list" items="${natureOfBusinessEN}">
											  <option value="${list.itemCode }-${list.itemDesc }">${list.itemDesc }</option>
											</c:forEach>
										</c:if>
										<c:if test="${language == 'tc'}">
											<c:forEach var="list" items="${natureOfBusinessCN}">
											  <option value="${list.itemCode }-${list.itemDesc }">${list.itemDesc }</option>
											</c:forEach>
										</c:if>
									</select>
									<span class="error-msg" id="natureOfBusinessMessage"></span>
								</div>
							</div>
							<div class="clearfix form-group has-error employment-info-row">
								<label for="savieEmploymentBean.monthlyPersonalIncome" class="monthly-income"><fmt:message key="savie.application.Monthly.personal.income" bundle="${msg}" /></label>
								<div class="selectEmployment">
									<span class="icon-chevron-thin-down orange-caret"></span>
									<select class="form-control gray-dropdown" id="savieEmploymentBean.monthlyPersonalIncome" name="savieEmploymentBean.monthlyPersonalIncome" data-style="application-select">
										<c:if test="${language == 'en'}">
											<c:forEach var="list" items="${monthlyPersonalIncomeEN}">
											  <option value="${list.itemCode }-${list.itemDesc }">${list.itemDesc }</option>
											</c:forEach>
										</c:if>
										<c:if test="${language == 'tc'}">
											<c:forEach var="list" items="${monthlyPersonalIncomeCN}">
											  <option value="${list.itemCode }-${list.itemDesc }">${list.itemDesc }</option>
											</c:forEach>
										</c:if>
									</select>
									<span class="error-msg" id="monthlyIncomeMessage"></span>
								</div>
							</div>
						</div>
						<div class="button-row text-center">
								<button id="employment-info-next" type="button" class="next"><fmt:message key="savie.application.Next" bundle="${msg}" /></button>
						</div>
						<!-- 
					</form>
					 -->
				</div>	
				<div class="page-divider"></div>
				<!--<div class="SAmple Button">
					<button type="button" id="dup-bnf-btn">Dup Chinese Name</button>
				</div>-->
				<div id="beneficiary-info" class="page-application container-fluid fwd-container">
					<div class="beneficiary-info-header">
						<h2 class="text-center"><fmt:message key="savie.application.Beneficiary.info" bundle="${msg}" /> <button type="button" class="tooltip-button hidden-xs hidden-sm" data-toggle="tooltip" data-placement="right" title="<fmt:message key="savie.application.Beneficiary.info" bundle="${msg}" />"><span class="info-tooltip"></span></button></h2>
						<h4 class="text-center"><fmt:message key="savie.application.You.add.up" bundle="${msg}" /></h4>
					</div>
						<div class="row clearfix">
						<!-- 
							<form class="content" id="beneficiaryInfoForm[0]" method="post" action="application-richie.php" onsubmit="return false">
						 -->
							<div class="col-md-4 first-row">
								<div class="beneficiary-info-row">
									<div class="clearfix upper-radio-buttons">
										<div class="left-desktop">
											<label class="own-estate-radio" for="own-estate-now">
											<input type="radio" id="own-estate-now" name="savieBeneficiaryBeans[0].ownEstate" value="own-estate-now" >
											<span class="own-estate-text">
												<span class="text"><fmt:message key="savie.application.Own.Estate" bundle="${msg}" /></span>
											</span>
											</label>
											<span class="description">
												<fmt:message key="savie.application.Own.Estate" bundle="${msg}" />
											</span>
										</div>
										<div class="left-desktop">
											<label class="name-others-radio" for="name-others-now">
											<input type="radio" id="name-others-now" name="savieBeneficiaryBeans[0].ownEstate" value="name-others-now" checked>
											<span class="name-others-text">
												<span class="text"><fmt:message key="savie.application.Name.Others" bundle="${msg}" /></span>
											</span>
											</label>
											<span class="description">
												<fmt:message key="savie.application.Name.Others" bundle="${msg}" />
											</span>
										</div>
									</div>
								</div>
								<div id="beneficiary-contents" class="">
									<h3 class="mobile-desc hidden-md hidden-lg"><fmt:message key="savie.application.Beneficiary" bundle="${msg}" /> <span><fmt:message key="savie.application.Person1" bundle="${msg}" /></span></h3>
									<div class="form-group has-error beneficiary-info-row">
										<label for="savieBeneficiaryBeans[0].firstName"><fmt:message key="savie.application.english.name" bundle="${msg}" /></label>
										<input type="text" id="savieBeneficiaryBean[0].fullName" hidden>
										<input type="text" id="savieBeneficiaryBean[0].firstName" name="savieBeneficiaryBeans[0].firstName" onchange="getBeneficiaryFullName0()" class="form-control gray-textbox form-textbox" placeholder="Given name" maxlength="25">
										<span class="error-msg" id="beneficiaryFnameMessage[0]"></span>
										<input type="text" id="savieBeneficiaryBean[0].lastName" name="savieBeneficiaryBeans[0].lastName" onchange="getBeneficiaryFullName0()" class="form-control gray-textbox" placeholder="Last name" maxlength="25">
										<span class="error-msg" id="beneficiaryLnameMessage[0]"></span>
										<span class="dup-error-msg hidden" id="duplicate-english-name[0]"><fmt:message key="savie.application.Duplicate.English.Name" bundle="${msg}" /></span>
									</div>
									<div class="form-group has-error beneficiary-info-row">
										<label for="savieBeneficiaryBean[0].chineseName"><fmt:message key="savie.application.chinese.name" bundle="${msg}" /> <span class="optional"><fmt:message key="savie.application.optional" bundle="${msg}" /></span></label>
										<input type="text" id="savieBeneficiaryBean[0].chineseName" name="savieBeneficiaryBeans[0].chineseName" class="form-control gray-textbox form-textbox" placeholder="Name in Chinese">
										<span class="error-msg" id="beneficiaryChineseNameMessage[0]"></span>
										<span class="dup-error-msg hidden" id="duplicate-chinese-name[0]"><fmt:message key="savie.application.Duplicate.Chinese.Name" bundle="${msg}" /></span>
									</div>
									<div class="form-group beneficiary-info-row">
										<label for="savieBeneficiaryBean[0].hkId"><fmt:message key="savie.application.HKID.Passport.No" bundle="${msg}" /></label>
										<!--<select class="selectpicker" id="savieBeneficiaryBean[0].hkId" name="savieBeneficiaryBeans[0].hkId" data-style="application-select">
											<option disabled selected>- Please select -</option>
											<option>Lorem ipsum</option>
											<option>Lorem ipsum</option>
										</select>-->
										<!--<input type="text" id="savieBeneficiaryBean[0].hkId" name="savieBeneficiaryBeans[0].hkId" class="form-control gray-textbox form-textbox" placeholder="HKID/Passport No" value="">-->
										<div class="clearfix">
											<div class="pull-left select">
												<div class="selectDiv">
													<span class="icon-chevron-thin-down orange-caret"></span>
													<select class="form-control gray-dropdown" id="beneficiaryHkidPassport[0]">
														<option selected value="HKID-HKID">HKID</option>
														<option value="Passport-Passport No">Passport No</option>	
													</select>
												</div>
											</div>
											<div class="pull-left input">
												<input class="form-control gray-textbox" type="text" placeholder="HKID/Passport No" id="savieBeneficiaryBean[0].hkId" name="savieBeneficiaryBeans[0].hkId" value="">
												<input class="form-control gray-textbox hidden" type="text" placeholder="HKID/Passport No" id="savieBeneficiaryBean[0].passportNo" name="savieBeneficiaryBeans[0].passportNo" value="">
											</div>
										</div>
										<span class="error-msg" id="bnfPassportMessage[0]"></span>
										<span class="error-msg" id="hkidOrPassportMessage[0]"></span>
										<span class="dup-error-msg hidden" id="duplicate-beneficiaries[0]"><fmt:message key="savie.application.Duplicate.Beneficiaries.HKID" bundle="${msg}" />Duplicate Beneficiaries HKID</span>
										<span class="dup-error-msg hidden" id="duplicate-beneficiariesPAssport[0]"><fmt:message key="savie.application.Duplicate.Beneficiaries.Passport" bundle="${msg}" /></span>
									</div>
									
									<div class="beneficiary-info-row">
										<label for="savieBeneficiaryBean[0].gender"><fmt:message key="savie.application.Gender" bundle="${msg}" /></label>
										<div id="gender-0" class="clearfix radio-buttons">
											<input type="radio" name="beneficiaryBeansGenders1" value="male" id="male-0" checked>
											<label for="male-0" class="male-0" >
												<span class="hidden-lg hidden-md"><fmt:message key="savie.application.Male" bundle="${msg}" /></span>
												<span class="orange-hover hidden-xs hidden-sm pull-left"></span>
											</label>
											<span id="male-label-0" class="pull-left second-label"><fmt:message key="savie.application.Male" bundle="${msg}" /></span>

											<input type="radio" name="beneficiaryBeansGenders1" value="female" id="female-0">
											<label for="female-0" class="female">
												<span class="hidden-lg hidden-md"><fmt:message key="savie.application.Female" bundle="${msg}" /></span>
												<span class="orange-hover hidden-xs hidden-sm pull-left"></span>
											</label>
											<span id="female-label-0" class="pull-left second-label-female"><fmt:message key="savie.application.Female" bundle="${msg}" /></span>
										</div>
									</div>
									<div class="form-group has-error beneficiary-info-row relationship">
										<label for="savieBeneficiaryBean[0].relationship"><fmt:message key="savie.application.Relationship.with.you" bundle="${msg}" /></label>
										<!--<select class="selectpicker" id="savieBeneficiaryBean[0].relationship" name="savieBeneficiaryBeans[0].relationship" data-style="application-select">
											<option disabled selected>- Please select -</option>
											<option>Lorem ipsum</option>
											<option>Lorem ipsum</option>
										</select>-->
										<div class="selectBeneficiary">
											<span class="icon-chevron-thin-down orange-caret"></span>
											<select class="form-control gray-dropdown"  id="savieBeneficiaryBean[0].relationship" name="savieBeneficiaryBeans[0].relationship" data-style="application-select">
												<c:if test="${language == 'en'}">
													<c:forEach var="list" items="${savieBeneficiaryRelationshipEN}">
													  <option value="${list.itemCode }-${list.itemDesc }">${list.itemDesc }</option>
													</c:forEach>
												</c:if>
												<c:if test="${language == 'tc'}">
													<c:forEach var="list" items="${savieBeneficiaryRelationshipCN}">
													  <option value="${list.itemCode }-${list.itemDesc }">${list.itemDesc }</option>
													</c:forEach>
												</c:if>
											</select>
										</div>
										<span class="error-msg" id="relationshipMessage[0]"></span>
									</div>
									<div class="form-group has-error beneficiary-info-row entitle">
										<label for="savieBeneficiaryBean[0].entitlement"><fmt:message key="savie.application.Entitlement" bundle="${msg}" /></label>
										<input type="number" id="savieBeneficiaryBean[0].entitlement" name="savieBeneficiaryBeans[0].entitlement" class="form-control gray-textbox percentage" placeholder="100%" value="" maxlength="3" oninput="maxLengthCheck(this)"  max="101" min ="1"/>
										<span class="error-msg" id="entitlementMessage[0]"></span>
									</div>		                
								</div>
							</div>
							<!-- 
							</form>
							 -->
							
							<div id="add-beneficiary-1" class="col-md-4">
								<div class="add-beneficiary" id="beneficiary1">
									<button id="add-beneficiary-button-2" value="1" class="circle" type="button"><img src="<%=request.getContextPath()%>/resources/images/savie/orange-plus.png"></button>
									<div class="add-beneficiary-text"><h4><fmt:message key="savie.application.Add.beneficiary" bundle="${msg}" /></h4></div>
								</div>
							</div>

							<div id="add-beneficiary-2" class="col-md-4 last-row">  
								<div class="add-beneficiary" id="beneficiary2">
									<button id="add-beneficiary-button-3" value="2" class="circle" type="button"><img src="<%=request.getContextPath()%>/resources/images/savie/orange-plus.png"></button>
									<div class="add-beneficiary-text"><h4><fmt:message key="savie.application.Add.beneficiary" bundle="${msg}" /></h4></div>
								</div>
							</div>
						</div>
						<div class="button-row text-center btn-beneficiary">
							<button id="beneficiary-info-next" type="button" class="next"><fmt:message key="savie.application.Next" bundle="${msg}" /></button>
						</div>              
				  
				</div>
				<div class="page-divider"></div>	

				<div id="payment" class="container-fluid fwd-container">
					<div class="fwd-payment page-application">
						<h2 class="text-center payment-h2"><fmt:message key="savie.application.Payment" bundle="${msg}" /></h2>
						<!-- 
						<form>
						 -->
							<div class="pay-online desktop-left">
								<input type="radio" value="true" id="pay-online-radio" name="saviePaymentBean.paymentType" checked/>
								<label for="pay-online-radio"><fmt:message key="savie.application.Pay.online" bundle="${msg}" /> <fmt:message key="savie.application.Direct.debit.authorisation" bundle="${msg}" /></label>
								<span id="pay-online-label" class="pay-ol"><fmt:message key="savie.application.Pay.online" bundle="${msg}" /> <span class="more-details"><fmt:message key="savie.application.Direct.debit.authorisation" bundle="${msg}" /></span></span>
							</div>                        
							<div class="pay-later desktop-left">
								<input type="radio" value="false" id="pay-later-radio" name="saviePaymentBean.paymentType"  />
								<label for="pay-later-radio"><fmt:message key="savie.application.Pay.later" bundle="${msg}" /> <fmt:message key="savie.application.Pay.at.the.storefront" bundle="${msg}" /></label>
								<span id="pay-later-label" class="pay-la hidden-xs hidden-sm"><fmt:message key="savie.application.Pay.later" bundle="${msg}" /> <span class="more-details"><fmt:message key="savie.application.Pay.at.the.storefront" bundle="${msg}" /></span></span>
							</div>

							<div id="payment-content" class="row payment-row">
								<div class="col-xs-12 col-md-6 clearfix">
									<div class="form-group margintop-pad clearfix">
										<div class="margintop padding-none col-xs-12 col-md-4">
											<label for="saviePaymentBean.amount"><fmt:message key="savie.application.Amount" bundle="${msg}" /></label>
										</div>
										<div class="padding-none col-xs-12 col-md-8">
											<!--<span class="payment-link">HK$ 430,000 </span>-->
											<fmt:message key="savie.application.HK" bundle="${msg}" /> 100,000<input type="hidden" name="saviePaymentBean.amount" id="amount" value="100000"/>
										</div>
									</div>
									<div class="topside-pad form-group clearfix">
										<div class="padding-none col-xs-12 col-md-4">
											<label for="saviePaymentBean.paymentMethod"><fmt:message key="savie.application.Payment.method" bundle="${msg}" /></label>
										</div>
										<div class="padding-none col-xs-12 col-md-8">
											<!--<span id="saviePaymentBean.paymentMethod" class="payment-link">Direct debit</span>-->
											<fmt:message key="savie.application.Direct.debit" bundle="${msg}" /><input type="hidden" name="saviePaymentBean.paymentMethod" id="paymentMethod" value="Direct debit"/>
										</div>
									</div>
									<div class="topside-bank form-group clearfix">
										<div class="padding-none col-xs-12 col-md-4">
											<label for="saviePaymentBean.bankName"><fmt:message key="savie.application.Bank.account.name" bundle="${msg}" /></label>
										</div>
										<div class="padding-none col-xs-12 col-md-8">
											Andy Lau<input type="hidden" name="saviePaymentBean.bankAccountHolderName" id="bankAccountHolderName" value="Andy Lau"></input>
										</div>
									</div>
								</div>
								<div class="col-xs-12 col-md-6 clearfix leftside-pad">
									<div class="paddingbottom form-group clearfix">
										<div class="padding-none name-top col-xs-12 col-md-4">
											<label for="saviePaymentBean.bankName"><fmt:message key="savie.application.Bank.name" bundle="${msg}" /></label>
										</div>
										<div class="padding-none col-xs-12 col-md-8">
											<div class="selectDiv">
												<span class="icon-chevron-thin-down orange-caret"></span>
												<select class="form-control gray-dropdown" name="saviePaymentBean.bankName" id="saviePaymentBean.bankName"  data-style="application-select">
													<option selected value="">- Please select -</option>
													<option value="lorem">Option 1</option>
													<option value="ipsum">Option 2</option>	
												</select>
												<span class="error-msg" id="employmentStatusMessage"></span>
											</div>
										</div>
									</div>
									<div class="form-group clearfix">
										<div class="padding-none name-top col-xs-12 col-md-4">
											<label for="saviePaymentBean.accountNo"><fmt:message key="savie.application.Account.no" bundle="${msg}" /></label>
										</div>
										<div class="padding-none col-xs-12 col-md-8">
											<input id="saviePaymentBean.accountNo" name="saviePaymentBean.accountNo" class="form-control gray-textbox" type="text" placeholder="Account no" />
										</div>
									</div>               
									<div class="form-group paddingbottom clearfix">
										<div class="padding-none name-top col-xs-12 col-md-4">
											<label for="saviePaymentBean.branchName"><fmt:message key="savie.application.Branch.name" bundle="${msg}" /></label>
										</div>
										<div class="padding-none col-xs-12 col-md-8">
											<div class="selectDiv">
												<span class="icon-chevron-thin-down orange-caret"></span>
												<select class="form-control gray-dropdown" name="saviePaymentBean.branchName" id="saviePaymentBean.branchName"   data-style="application-select">
													<option selected value="">- Please select -</option>
													<option value="lorem">Option 1</option>
													<option value="ipsum">Option 2</option>	
												</select>
												<span class="error-msg" id="employmentStatusMessage"></span>
											</div>
											<!--<select class="selectpicker" name="saviePaymentBean.branchName" id="saviePaymentBean.branchName" data-style="application-select">
												<option disabled selected>- Please select -</option>
												<option>Lorem ipsum</option>
												<option>Lorem ipsum</option>
											</select>-->
										</div>
									</div>      
								
								</div>
							</div>
							<div id="payment-policy" class="form-group policy-group">                        
								<input id="saviePaymentBean.paymentConfirmAuthorize" name="saviePaymentBean.paymentConfirmAuthorize" type="checkbox" value="true" />
								<label for="saviePaymentBean.paymentConfirmAuthorize"></label>
								<p class="policy-p"><fmt:message key="savie.application.Policy.info" bundle="${msg}" /></p>
							</div>
							<div class="text-center">
								<button id="application-proceed-btn" type="button" class="next" onclick="applicationSubmit();"><fmt:message key="savie.application.Proceed" bundle="${msg}" /></button>
							</div>
							<!--  
						</form>
						-->
					</div>
				</div> 
			</div>
			<!-- FOOTER -->
		</div>
		<!-- JS INCLUDES -->
		<script src="<%=request.getContextPath()%>/resources/js/savie/savie.js"></script>
</form>