<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeQuoteBean"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
		<%!
			boolean isSaleActiveClass = true;
		%>
<script type="text/javascript">
	function applicationSubmit() {
		var url = '${pageContext.request.contextPath}'+'/'+'${language}'+'/'+'saving-insurance/';
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
												Applicant
											</button>
										</div>
										<div class="col-md-3">
											<button type="button" class="orange-menu-btn" id="employment-header-btn">
												Employment   
											</button>
										</div>
										<div class="col-md-3">
											<button type="button" class="orange-menu-btn" id="beneficiary-header-btn">
												Beneficiary   
											</button>
										</div>
										<div class="col-md-3 right-most">
											<button type="button" class="orange-menu-btn" id="payment-header-btn">
												Payment
											</button>
										</div>
									</div>
								</div>
								
								<div class="dollars-monthly-right">
									<div class="figures">
										<span class="single">Single premium</span>
										<span class="dollars">HK$ <span class="figure">100,000</span></span>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xs-12 gray-section">
							<div class="description">Let’s get to know you a little better.</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="application-flux">
				<!--Personal Info Widget-->
				<div class="container-fluid fwd-container">
					<div id="personal-info" class="personal-info-widget page-application">
						<h2>Applicant/Insured person info	
							<button type="button" class="tooltip-button hidden-xs hidden-sm" data-toggle="tooltip" data-placement="right" title="Applicant and the insured must be the same person"><span class="info-tooltip"></span></button>
						</h2>
						<!-- 
						<form id="insuredInfoForm" method="post" class="form-horizontal" action="target.jsp" onsubmit="return false">
						 -->
							<div class="row margin">
								<div class="col-sm-12 col-md-6 left">
									
									<div class="clearfix">
										<div class="left-desktop description">
											<label for="give-last-name" class="application-page-input-text">Name in English</label>
										</div>
										<div class="left-desktop text-box">
											<input class="form-control gray-textbox" id="savieApplicantBean.firstName" name="savieApplicantBean.firstName" type="text" placeholder="Given Name" value="Moses">
											<input class="form-control gray-textbox" id="savieApplicantBean.lastName" name="savieApplicantBean.lastName" type="text" placeholder="Last Name" value="Chan">
										</div>
									</div>
									
									<div class="clearfix">
										<div class="left-desktop description">
											<label for="savieApplicantBean.chineseName" class="application-page-input-text">Name in Chinese <span class="optional">(optional)</span></label>
										</div>
										<div class="left-desktop text-box">
											<input class="form-control gray-textbox" id="savieApplicantBean.chineseName" name="savieApplicantBean.chineseName" type="text" placeholder="Name in Chinese" value="Lily Liu">
										</div>
									</div>
									<div class="clearfix form-group has-error">
										<div class="left-desktop description">
											<label for="savieApplicantBean.hkId" class="application-page-input-text">HKID</label>
										</div>
										<div class="left-desktop text-box">
											<input class="form-control gray-textbox" id="savieApplicantBean.hkId" name="savieApplicantBean.hkId" type="text" placeholder="X123456(7)" pattern="^([A-Z0-9])*$" >
											<span class="error-msg" id="hkidMessage"></span>
										</div>
									</div>
									
									<div class="clearfix">
										<div class="left-desktop description">
											<label for="savieApplicantBean.gender" class="application-page-input-text">Gender</label>
										</div>
										<div class="left-desktop text-box ">
											<div class="gender-section">
												<div class="clearfix">
													<div class="pull-left male">
														<label class="pi-male-radio" for="pi-male-now">
														<input type="radio" id="pi-male-now" name="appGender" value="M" checked>
														<span class="pi-male-text">
															<span class="text">Male</span>
														</span>
														</label>
														<div class="descriptions male">
															<span class="desktop-text">Male</span>
														</div>
													</div>
													<div class="pull-left female">
														<label class="pi-female-radio" for="pi-female-now">
														<input type="radio" id="pi-female-now" name="appGender" value="F" >
														<span class="pi-female-text">
															<span class="text">Female</span>
														</span>
														</label>
														<div class="descriptions female">
															<span class="desktop-text">Female</span>
														</div>
														
													</div>
													<span class="error-msg" id="genderMessage"></span>
												</div>
											</div>
										</div>
									</div>
									
									<div class="clearfix  form-group has-error">
										<div class="left-desktop description">
											<label for="savieApplicantBean.maritalStatus" class="application-page-input-text">Marital status</label>
										</div>
										<div class="left-desktop text-box">

											<div class="selectDiv">
												<span class="icon-chevron-thin-down orange-caret"></span>
												<select class="form-control gray-dropdown" name="maritalStatus"  id="savieApplicantBean.maritalStatus">
													<option value="S">Single</option>
													<option value="M">Married</option>	
												</select>
											</div>
											<span class="error-msg" id="maritalStatusMessage"></span>
										</div>
									</div>
									
									
									
								
									<div class="clearfix form-group has-error">
										<div class="left-desktop description">
											<label for="savieApplicantBean.placeOfBirth" class="application-page-input-text">Place of birth</label>
										</div>
										<div class="left-desktop text-box">
											<div class="selectDiv">
												<span class="icon-chevron-thin-down orange-caret"></span>
												<select class="form-control gray-dropdown" data-style="application-select selection" id="savieApplicantBean.placeOfBirth" name="savieApplicantBean.placeOfBirth">
													<option selected value="">- Please select -</option>
													<option value="US">US</option>
													<option value="Germany">Germany</option>	
												</select>
											</div>
											<span class="error-msg" id="placeOfBirthMessage"></span>
										</div>
									</div>
									
									<div class="clearfix form-group has-error">
										<div class="left-desktop description">
											<label for="savieApplicantBean.nationality" class="application-page-input-text">Nationality</label>
										</div>
										<div class="left-desktop text-box">
											<div class="selectDiv">
												<span class="icon-chevron-thin-down orange-caret"></span>
												<select class="form-control gray-dropdown"  data-style="application-select selection" id="savieApplicantBean.nationality" name="savieApplicantBean.nationality">
													<option selected value="">- Please select -</option>
													<option value="US">US</option>
													<option value="Germany">Germany</option>	
												</select>
											</div>
											<span class="error-msg" id="nationalityMessage"></span>
										</div>
									</div>
									
									<div class="clearfix">
										<div class="left-desktop right-description">
											<label for="savieApplicantBean.residentialTelNo" class="application-page-input-text">Residential tel no.</label>
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
											<label for="savieApplicantBean.mobileNo" class="application-page-input-text">Mobile no.</label>
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
											<label for="savieApplicantBean.emailAddress" class="application-page-input-text">Email address</label>
										</div>
										<div class="left-desktop text-box">
											<input class="form-control gray-textbox" id="savieApplicantBean.emailAddress" name="savieApplicantBean.emailAddress" type="email" placeholder="Email address">
											<span class="error-msg" id="emailMessage"></span>
										</div>
									</div>
								</div>
								<div class="col-sm-12 col-md-6 right">
									<div class="clearfix form-group has-error">
										<div class="left-desktop right-description">
											<label for="inputdefault" class="application-page-input-text">Residential address</label>
										</div>
										<div class="left-desktop text-box">
											<input class="form-control gray-textbox residential" id="savieApplicantBean.residentialAdress1" name="savieApplicantBean.residentialAdress1" type="text" placeholder="Line 1">
											<span class="error-msg" id="resLine1Message"></span>
											<input class="form-control gray-textbox residential" id="savieApplicantBean.residentialAdress2" name="savieApplicantBean.residentialAdress2" type="text" placeholder="Line 2">
											<input class="form-control gray-textbox residential" id="savieApplicantBean.residentialAdress3" name="savieApplicantBean.residentialAdress3" type="text" placeholder="Line 3">
											<div class="selectDiv">
												<span class="icon-chevron-thin-down orange-caret"></span>
												<select class="form-control gray-dropdown"  data-style="application-select selection" name="savieApplicantBean.residentialDistrict" id="savieApplicantBean.residentialDistrict">
													<option selected value="">District</option>
													<option value="US">US</option>
													<option value="Germany">Germany</option>	
												</select>
											</div>
											<span class="error-msg" id="resDistrictMessage"></span>
										</div>
									</div>
									
									<div class="clearfix form-group has-error hidden" id="correspondence-address">
										<div class="left-desktop right-description">
											<label for="inputdefault" class="application-page-input-text">Correspondence address</label>
										</div>
										<div class="left-desktop text-box">
											<input class="form-control gray-textbox residential" id="savieApplicantBean.correspondenceAdress1" name="savieApplicantBean.correspondenceAdress1" type="text" placeholder="Line 1">
											<span class="error-msg" id="resLine1Message"></span>
											<input class="form-control gray-textbox residential" id="savieApplicantBean.correspondenceAdress2" name="savieApplicantBean.correspondenceAdress2" type="text" placeholder="Line 2">
											<input class="form-control gray-textbox residential" id="savieApplicantBean.correspondenceAdress3" name="savieApplicantBean.correspondenceAdress3" type="text" placeholder="Line 3">
											
											<div class="selectDiv">
												<span class="icon-chevron-thin-down orange-caret"></span>
												<select class="form-control gray-dropdown"  data-style="application-select selection" name="savieApplicantBean.correspondenceDistrict" id="savieApplicantBean.correspondenceDistrict">
													<option selected value="">District</option>
													<option value="US">US</option>
													<option value="Germany">Germany</option>	
												</select>
											</div>
											<span class="error-msg" id="resDistrictMessage"></span>
											<span class="warning-note"><span class="orange">*</span> No P.O. Box address allowed</span>
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
														<span class="checkbox-text">My correspondance address is same as my residential address</span>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>		
							</div>
							<div class="next-btn">
								<button id="personal-info-next" type="submit" class="btn next pi">Next</button>
							</div>
							<!-- 
						</form>
						 -->
					</div>
				</div>
				<div class="page-divider"></div>
				<div id="employment-info" class="page-application container-fluid fwd-container">
					<h2 class="text-center">Employment Info</h2>
					<!-- 
					<form class="content"  id="employmentInfoForm" method="post" action="application.jsp" onsubmit="return false">
					 -->
						<div class="content-left">
							<div class="clearfix form-group has-error employment-info-row">
								<label for="savieEmploymentBean.employmentStatus">Employment status</label>
								<div class="selectEmployment">
									<span class="icon-chevron-thin-down orange-caret"></span>
									<select class="form-control gray-dropdown" id="savieEmploymentBean.employmentStatus" name="savieEmploymentBean.employmentStatus" data-style="application-select">
										<option selected value="">- Please select -</option>
										<option value="employed">Employed</option>
										<option value="self-employed">Self Employed</option>	
									</select>
									<span class="error-msg" id="employmentStatusMessage"></span>
								</div>
							</div>
							<div class="clearfix form-group has-error employment-info-row">
								<label for="savieEmploymentBean.occupation">Occupation</label>
								<div class="selectEmployment">
									<span class="icon-chevron-thin-down orange-caret"></span>
									<select class="form-control gray-dropdown" id="savieEmploymentBean.occupation" name="savieEmploymentBean.occupation" data-style="application-select">
										<option selected value="">- Please select -</option>
										<option value="it">IT</option>
										<option value="others">Others</option>	
									</select>
									<span class="error-msg" id="occupationMessage"></span>
								</div>
							</div>
						</div>
						<div class="content-right">
							<div class="clearfix form-group has-error employment-info-row">
								<label for="savieEmploymentBean.natureOfBusiness">Nature of business</label>
								<div class="selectEmployment">
									<span class="icon-chevron-thin-down orange-caret"></span>
									<select class="form-control gray-dropdown" id="savieEmploymentBean.natureOfBusiness" name="savieEmploymentBean.natureOfBusiness" data-style="application-select">
										<option selected value="">- Please select -</option>
										<option value="it">IT</option>
										<option value="others">Others</option>	
									</select>
									<span class="error-msg" id="natureOfBusinessMessage"></span>
								</div>
							</div>
							<div class="clearfix form-group has-error employment-info-row">
								<label for="savieEmploymentBean.monthlyPersonalIncome" class="monthly-income">Monthly personal income (HK$)</label>
								<div class="selectEmployment">
									<span class="icon-chevron-thin-down orange-caret"></span>
									<select class="form-control gray-dropdown" id="savieEmploymentBean.monthlyPersonalIncome" name="savieEmploymentBean.monthlyPersonalIncome" data-style="application-select">
										<option selected value="">- Please select -</option>
										<option value="10,000">10,000</option>
										<option value="others">Others</option>	
									</select>
									<span class="error-msg" id="monthlyIncomeMessage"></span>
								</div>
							</div>
						</div>
						<div class="button-row text-center">
								<button id="employment-info-next" type="submit" class="next">Next</button>
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
						<h2 class="text-center">Beneficiary info <button type="button" class="tooltip-button hidden-xs hidden-sm" data-toggle="tooltip" data-placement="right" title="Beneficiary Info"><span class="info-tooltip"></span></button></h2>
						<h4 class="text-center">You can add up to three (3) persons</h4>
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
												<span class="text">Own Estate</span>
											</span>
											</label>
											<span class="description">
												Own Estate
											</span>
										</div>
										<div class="left-desktop">
											<label class="name-others-radio" for="name-others-now">
											<input type="radio" id="name-others-now" name="savieBeneficiaryBeans[0].ownEstate" value="name-others-now" checked>
											<span class="name-others-text">
												<span class="text">Name Others</span>
											</span>
											</label>
											<span class="description">
												Name Others
											</span>
										</div>
									</div>
								</div>
								<div id="beneficiary-contents" class="">
									<h3 class="mobile-desc hidden-md hidden-lg">Beneficiary <span>(Person 1)</span></h3>
									<div class="form-group has-error beneficiary-info-row">
										<label for="savieBeneficiaryBean[0].firstName">Name in English</label>
										<input type="text" id="savieBeneficiaryBean[0].fullName" hidden>
										<input type="text" id="savieBeneficiaryBean[0].firstName" name="savieBeneficiaryBean[0].firstName" onchange="getBeneficiaryFullName0()" class="form-control gray-textbox form-textbox" placeholder="Given name" maxlength="25">
										<span class="error-msg" id="beneficiaryFnameMessage[0]"></span>
										<input type="text" id="savieBeneficiaryBean[0].lastName" name="savieBeneficiaryBean[0].lastName" onchange="getBeneficiaryFullName0()" class="form-control gray-textbox" placeholder="Last name" maxlength="25">
										<span class="error-msg" id="beneficiaryLnameMessage[0]"></span>
										<span class="dup-error-msg hidden" id="duplicate-english-name[0]">Duplicate English Name</span>
									</div>
									<div class="form-group has-error beneficiary-info-row">
										<label for="savieBeneficiaryBean[0].chineseName">Name in Chinese <span class="optional">(optional)</span></label>
										<input type="text" id="savieBeneficiaryBean[0].chineseName" name="savieBeneficiaryBean[0].chineseName" class="form-control gray-textbox form-textbox" placeholder="Name in Chinese">
										<span class="error-msg" id="beneficiaryChineseNameMessage[0]"></span>
										<span class="dup-error-msg hidden" id="duplicate-chinese-name[0]">Duplicate Chinese Name</span>
									</div>
									<div class="form-group beneficiary-info-row">
										<label for="savieBeneficiaryBean[0].hkId">HKID / Passport No</label>
										<!--<select class="selectpicker" id="savieBeneficiaryBean[0].hkId" name="savieBeneficiaryBean[0].hkId" data-style="application-select">
											<option disabled selected>- Please select -</option>
											<option>Lorem ipsum</option>
											<option>Lorem ipsum</option>
										</select>-->
										<!--<input type="text" id="savieBeneficiaryBean[0].hkId" name="savieBeneficiaryBean[0].hkId" class="form-control gray-textbox form-textbox" placeholder="HKID/Passport No" value="">-->
										<div class="clearfix">
											<div class="pull-left select">
												<div class="selectDiv">
													<span class="icon-chevron-thin-down orange-caret"></span>
													<select class="form-control gray-dropdown" id="beneficiaryHkidPassport[0]">
														<option selected value="HKID">HKID</option>
														<option value="Passport">Passport No</option>	
													</select>
												</div>
											</div>
											<div class="pull-left input">
												<input class="form-control gray-textbox" type="text" placeholder="HKID/Passport No" id="savieBeneficiaryBean[0].hkId" name="savieBeneficiaryBean[0].hkId" value="">
												<input class="form-control gray-textbox hidden" type="text" placeholder="HKID/Passport No" id="savieBeneficiaryBean[0].passportNo" name="savieBeneficiaryBean[0].passportNo" value="">
											</div>
										</div>
										<span class="error-msg" id="bnfPassportMessage[0]"></span>
										<span class="error-msg" id="hkidOrPassportMessage[0]"></span>
										<span class="dup-error-msg hidden" id="duplicate-beneficiaries[0]">Duplicate Beneficiaries HKID</span>
										<span class="dup-error-msg hidden" id="duplicate-beneficiariesPAssport[0]">Duplicate Beneficiaries Passport</span>
									</div>
									
									<div class="beneficiary-info-row">
										<label for="savieBeneficiaryBean[0].gender">Gender</label>
										<div id="gender-0" class="clearfix radio-buttons">
											<input type="radio" name="savieBeneficiaryBean[0].gender" value="male" id="male-0" checked>
											<label for="male-0" class="male-0" >
												<span class="hidden-lg hidden-md">Male</span>
												<span class="orange-hover hidden-xs hidden-sm pull-left"></span>
											</label>
											<span id="male-label-0" class="pull-left second-label">Male</span>

											<input type="radio" name="savieBeneficiaryBean[0].gender" value="female" id="female-0">
											<label for="female-0" class="female">
												<span class="hidden-lg hidden-md">Female</span>
												<span class="orange-hover hidden-xs hidden-sm pull-left"></span>
											</label>
											<span id="female-label-0" class="pull-left second-label-female">Female</span>
										</div>
									</div>
									<div class="form-group has-error beneficiary-info-row relationship">
										<label for="savieBeneficiaryBean[0].relationship">Relationship with you</label>
										<!--<select class="selectpicker" id="savieBeneficiaryBean[0].relationship" name="savieBeneficiaryBean[0].relationship" data-style="application-select">
											<option disabled selected>- Please select -</option>
											<option>Lorem ipsum</option>
											<option>Lorem ipsum</option>
										</select>-->
										<div class="selectBeneficiary">
											<span class="icon-chevron-thin-down orange-caret"></span>
											<select class="form-control gray-dropdown"  id="savieBeneficiaryBean[0].relationship" name="savieBeneficiaryBean[0].relationship" data-style="application-select">
												<option selected value="">- Please select -</option>
												<option value="father">Father</option>
												<option value="mother">Mother</option>	
											</select>
										</div>
										<span class="error-msg" id="relationshipMessage[0]"></span>
									</div>
									<div class="form-group has-error beneficiary-info-row entitle">
										<label for="savieBeneficiaryBean[0].entitlement">Entitlement (%)</label>
										<input type="number" id="savieBeneficiaryBean[0].entitlement" name="savieBeneficiaryBean[0].entitlement" class="form-control gray-textbox percentage" placeholder="100%" value="" maxlength="3" oninput="maxLengthCheck(this)"  max="101" min ="1"/>
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
									<div class="add-beneficiary-text"><h4>Add beneficiary</h4></div>
								</div>
							</div>

							<div id="add-beneficiary-2" class="col-md-4 last-row">  
								<div class="add-beneficiary" id="beneficiary2">
									<button id="add-beneficiary-button-3" value="2" class="circle" type="button"><img src="<%=request.getContextPath()%>/resources/images/savie/orange-plus.png"></button>
									<div class="add-beneficiary-text"><h4>Add beneficiary</h4></div>
								</div>
							</div>
						</div>
						<div class="button-row text-center btn-beneficiary">
							<button id="beneficiary-info-next" type="button" class="next">Next</button>
						</div>              
				  
				</div>
				<div class="page-divider"></div>	

				<div id="payment" class="container-fluid fwd-container">
					<div class="fwd-payment page-application">
						<h2 class="text-center payment-h2">Payment</h2>
						<!-- 
						<form>
						 -->
							<div class="pay-online desktop-left">
								<input type="radio" value="true" id="pay-online-radio" name="saviePaymentBean.paymentType" checked/>
								<label for="pay-online-radio">Pay online (Direct debit authorisation)</label>
								<span id="pay-online-label" class="pay-ol">Pay online <span class="more-details">(Direct debit authorisation)</span></span>
							</div>                        
							<div class="pay-later desktop-left">
								<input type="radio" value="false" id="pay-later-radio" name="saviePaymentBean.paymentType"  />
								<label for="pay-later-radio">Pay later (Pay at the storefront)</label>
								<span id="pay-later-label" class="pay-la hidden-xs hidden-sm">Pay later <span class="more-details">(Pay at the storefront)</span></span>
							</div>

							<div id="payment-content" class="row payment-row">
								<div class="col-xs-12 col-md-6 clearfix">
									<div class="form-group margintop-pad clearfix">
										<div class="margintop padding-none col-xs-12 col-md-4">
											<label for="saviePaymentBean.amount">Amount</label>
										</div>
										<div class="padding-none col-xs-12 col-md-8">
											<!--<span class="payment-link">HK$ 430,000 </span>-->
											HK$ 100,000<input type="hidden" name="saviePaymentBean.amount" id="amount" value="100000"/>
										</div>
									</div>
									<div class="topside-pad form-group clearfix">
										<div class="padding-none col-xs-12 col-md-4">
											<label for="saviePaymentBean.paymentMethod">Payment method</label>
										</div>
										<div class="padding-none col-xs-12 col-md-8">
											<!--<span id="saviePaymentBean.paymentMethod" class="payment-link">Direct debit</span>-->
											Direct debit<input type="hidden" name="saviePaymentBean.paymentMethod" id="paymentMethod" value="Direct debit"/>
										</div>
									</div>
									<div class="topside-bank form-group clearfix">
										<div class="padding-none col-xs-12 col-md-4">
											<label for="saviePaymentBean.bankName">Bank account holder name</label>
										</div>
										<div class="padding-none col-xs-12 col-md-8">
											Andy Lau<input type="hidden" name="saviePaymentBean.bankAccountHolderName" id="bankAccountHolderName" value="Andy Lau"></input>
										</div>
									</div>
								</div>
								<div class="col-xs-12 col-md-6 clearfix leftside-pad">
									<div class="paddingbottom form-group clearfix">
										<div class="padding-none name-top col-xs-12 col-md-4">
											<label for="saviePaymentBean.bankName">Bank name (Code)</label>
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
											<label for="saviePaymentBean.accountNo">Account no</label>
										</div>
										<div class="padding-none col-xs-12 col-md-8">
											<input id="saviePaymentBean.accountNo" name="saviePaymentBean.accountNo" class="form-control gray-textbox" type="text" placeholder="Account no" />
										</div>
									</div>               
									<div class="form-group paddingbottom clearfix">
										<div class="padding-none name-top col-xs-12 col-md-4">
											<label for="saviePaymentBean.branchName">Branch name</label>
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
								<p class="policy-p">I, as Policy owner, confirm that I am not acting on behalf of any other person, that the above payment is made on my own behalf, and that I authorize FWD Life Insurance Company (Bermuda) Limited, until further written notice, to debit the account listed above to pay the insurance premium.</p>
							</div>
							<div class="text-center">
								<button id="application-proceed-btn" type="button" class="next" onclick="applicationSubmit();">Proceed</button>
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
</form>