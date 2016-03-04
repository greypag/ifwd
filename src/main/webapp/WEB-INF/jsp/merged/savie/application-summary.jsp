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
		<div class="fwd-savie-wrapper savie-online-container with-breadcrumbs-steps" id="application-summary-page">			

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
            <div class="application-page-header et-header-browse sticky-mobile-header">
               <div class="browse-container">
                  <div class="row reset-margin hidden-xs hidden-sm">
                     <ul class="common-steps-list nav nav-pills six-steps">
                        <li class="step-number" id="first-step"><button type="button" class="et-header-info-btn completed-step"><i class="fa fa-check"></i>Select plan</button></li>
                        <li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
                        <li class="step-number"><button type="button" class="et-header-info-btn completed-step"><i class="fa fa-check"></i>Application &amp; payment</button></li>
                        <li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
                        <li class="step-number"><button type="button" class="et-header-info-btn active"><span class="status">3</span>Summary &amp; declaration</button></li>
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
                     <div class="pull-left">
                        <div class="et-back-arrow">
                           <a href="#" class="back-arrow-link">
                              <span class="icon-arrow-left2 arrow-left"></span>
                           </a>
                        </div>
                        <div class="et-header-tex">
                           <h3 id="">Summary &amp; declaration</h3>
                        </div>
                     </div>
                     <span id="step-of">3 out of 6</span>
                  </div>
               </div>
            </div>
         </div>
			<div class="container-fluid fwd-full-container mobile-step-indicator visible-xs visible-sm">
         <div class="step-indicator-container clearfix">
                  <ul class="common-step-indicator six-steps nav nav-pills">
                     <li id="first-step"><a href="#" class="completed"><i class="fa fa-check"></i></a></li>
                     <li><a href="#" class="completed"><i class="fa fa-check"></i></a></li>
                     <li><a href="#" class="active"><span class="step-no">3</span></a></li>
                     <li><a href="#"><span class="step-no">4</span></a></li>
                     <li><a href="#"><span class="step-no">5</span></a></li>
                     <li id="last-step"><a href="#"><span class="step-no">6</span></a></li>
                 </ul>
                 <div class="step-line"></div>
            </div>
        </div>
         <div class="container-fluid fwd-container savie-application-summary headerStick">
            <h5 class="title">Application summary</h5>

            <div class="summary-section clearfix">
               <h5>Your selected plan <a href="<%=request.getContextPath()%>/${language}/savings-insurance/plan-details?backSummary=Y">Edit</a></h5>
               <div class="desktop-left">
                  <div class="form-group application-summ">
							<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
								<input class="mdl-textfield__input so-mdl-textfield-input" type="text" id="planName" name="planName" value="SAVIE" readonly="readonly" />
								<label class="mdl-textfield__label" for="planName">Plan name</label>
							</div>
						</div>
                  <div class="form-group application-summ">
							<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
								<input class="mdl-textfield__input so-mdl-textfield-input" type="text" id="savingAmount" name="savingAmount" value="HK$ ${saviePlanDetails.insuredAmount1 }" readonly="readonly" />
								<label class="mdl-textfield__label" for="savingAmount">Saving amount</label>
							</div>
						</div>
               </div>
               <div class="desktop-right">
                  <div class="form-group application-summ">
							<div class="selectDiv centreDiv gray-text-bg is-not-active">
								<label class="mdl-textfield__label cstm-dropdown-label">Premium mode</label>
								<select name="tmpPremiumMode" id="tmpPremiumMode" class="form-control gray-dropdown">
									<option value="" disabled="disabled" selected="selected">Premium mode</option>
									<option value="${saviePlanDetails.paymentType }">${saviePlanDetails.paymentType }</option>
								</select>
								<input type="hidden" id="premiumMode" name="premiumMode" />
							</div>
						</div>
               </div>
            </div>
            <div class="summary-section below clearfix">
               <h5>Personal info <a href="<%=request.getContextPath()%>/${language}/savings-insurance/personal-details?backSummary=Y">Edit</a></h5>
               <div class="desktop-left">
                  <div class="form-group application-summ">
							<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
								<input class="mdl-textfield__input so-mdl-textfield-input" type="text" id="lastName" name="lastName" value="${lifePersonalDetails.lastname }" readonly="readonly" />
								<label class="mdl-textfield__label" for="lastName">Last name (same as HKID)</label>
							</div>
						</div>
                  <div class="form-group application-summ">
							<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
								<input class="mdl-textfield__input so-mdl-textfield-input" type="text" id="firstName" name="firstName" value="${lifePersonalDetails.firstname }" readonly="readonly" />
								<label class="mdl-textfield__label" for="firstName">First name (same as HKID)</label>
							</div>
						</div>
                  <div class="form-group application-summ">
							<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
								<input class="mdl-textfield__input so-mdl-textfield-input ch" type="text" id="chineseName" name="chineseName" value="${lifePersonalDetails.chineseName }" readonly="readonly" />
								<label class="mdl-textfield__label" for="chineseName">Name in Chinese (same as HKID)</label>
							</div>
						</div>
                  <div class="form-group application-summ">
							<div class="selectDiv centreDiv gray-text-bg is-not-active">
								<label class="mdl-textfield__label cstm-dropdown-label">Gender</label>
								<select name="tmpGender" id="tmpGender" class="form-control gray-dropdown">
									<option value="" disabled="disabled" selected="selected">Gender</option>
									<option value="${lifePersonalDetails.gender }">${lifePersonalDetails.gender }</option>
								</select>
								<input type="hidden" id="gender" name="gender" />
							</div>
						</div>
                  <div class="form-group application-summ">
							<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
								<input class="mdl-textfield__input so-mdl-textfield-input" type="text" id="hkId" name="hkId" value="${lifePersonalDetails.hkid }" readonly="readonly" />
								<label class="mdl-textfield__label" for="hkId">HKID</label>
							</div>
						</div>
                  <div class="form-group application-summ">
							<div class="selectDiv centreDiv gray-text-bg is-not-active">
								<label class="mdl-textfield__label cstm-dropdown-label">Place of birth</label>
								<select name="tmpPlaceOfBirth" id="tmpPlaceOfBirth" class="form-control gray-dropdown">
									<option value="" disabled="disabled" selected="selected">Place of birth</option>
									<option value="${lifePersonalDetails.placeOfBirthName }">${lifePersonalDetails.placeOfBirthName }</option>
								</select>
								<input type="hidden" id="placeOfBirth" name="placeOfBirth" />
							</div>
						</div>
                  <div class="form-group application-summ">
							<div class="selectDiv centreDiv gray-text-bg is-not-active">
								<label class="mdl-textfield__label cstm-dropdown-label">Nationality</label>
								<select name="tmpNationality" id="tmpNationality" class="form-control gray-dropdown">
									<option value="" disabled="disabled" selected="selected">Nationality</option>
									<option value="${lifePersonalDetails.nationaltyName }">${lifePersonalDetails.nationaltyName }</option>
								</select>
								<input type="hidden" id="nationalty" name="nationalty" />
							</div>
						</div>
                  <div class="form-group application-summ">
							<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
								<input class="mdl-textfield__input so-mdl-textfield-input" type="text" id="so-calendar-dob" name="so-calendar-dob" value="${lifePersonalDetails.dob }" readonly="readonly" />
								<label class="mdl-textfield__label" for="so-calendar-dob">Date of birth</label>
							</div>
						</div>
               </div>
               <div class="desktop-right">
                  <div class="form-group application-summ">
							<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
								<input class="mdl-textfield__input so-mdl-textfield-input" type="text" id="residentialNo" name="residentialNo" value="${lifePersonalDetails.residentialTelNo }" readonly="readonly" />
								<label class="mdl-textfield__label" for="residentialNo">Residential telephone no.</label>
							</div>
						</div>
                  <div class="form-group application-summ">
							<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
								<input class="mdl-textfield__input so-mdl-textfield-input" type="text" id="telephoneNo" name="telephoneNo" value="${lifePersonalDetails.mobileNumber }" readonly="readonly" />
								<label class="mdl-textfield__label" for="telephoneNo">Telephone no.</label>
							</div>
						</div>
                  <div class="form-group application-summ">
							<div class="selectDiv centreDiv gray-text-bg is-not-active">
								<label class="mdl-textfield__label cstm-dropdown-label">Marital status</label>
								<select name="tmpMaritalStatus" id="tmpMaritalStatus" class="form-control gray-dropdown">
									<option value="" disabled="disabled" selected="selected">Marital status</option>
									<option value="${lifePersonalDetails.martialStatusName }">${lifePersonalDetails.martialStatusName }</option>
								</select>
								<input type="hidden" id="martialStatus" name="martialStatus" />
							</div>
						</div>
                  <div class="form-group application-summ">
							<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
								<input class="mdl-textfield__input so-mdl-textfield-input" type="text" id="emailAddress" name="emailAddress" value="${lifePersonalDetails.emailAddress }" readonly="readonly" />
								<label class="mdl-textfield__label" for="emailAddress">Email address</label>
							</div>
						</div>
                  <div class="form-group application-summ">
							<span class="warning-note">Permanent address (No P.O box address allowed)</span>
							<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
								<input class="mdl-textfield__input so-mdl-textfield-input" type="text" id="permanentAddress1" name="permanentAddress1" value="${lifePersonalDetails.permanetAddress1 }" readonly="readonly" />
								<label class="mdl-textfield__label" for="permanentAddress1">Permanent address line 1</label>
							</div>
						</div>
                  <div class="form-group application-summ">
							<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
								<input class="mdl-textfield__input so-mdl-textfield-input" type="text" id="permanentAddress2" name="permanentAddress2" value="${lifePersonalDetails.permanetAddress2 }" readonly="readonly" />
								<label class="mdl-textfield__label" for="permanentAddress2">Permanent address line 2</label>
							</div>
						</div>
                  <div class="form-group application-summ">
							<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
								<input class="mdl-textfield__input so-mdl-textfield-input" type="text" id="permanentAddress3" name="permanentAddress3" value="${lifePersonalDetails.permanetAddress3 }" readonly="readonly" />
								<label class="mdl-textfield__label" for="permanentAddress3">Permanent address line 3</label>
							</div>
						</div>
                  <div class="form-group application-summ">
							<div class="selectDiv centreDiv gray-text-bg is-not-active">
								<label class="mdl-textfield__label cstm-dropdown-label">District</label>
								<select name="tmpPermanentDistrict" id="tmpPermanentDistrict" class="form-control gray-dropdown">
									<option value="" disabled="disabled" selected="selected">District</option>
									<option value="${lifePersonalDetails.permanetAddressDistrictName }">${lifePersonalDetails.permanetAddressDistrictName }</option>
								</select>
								<input type="hidden" id="permanetAddressDistrict" name="permanetAddressDistrict" />
							</div>
						</div>
                  <div class="form-group application-summ">
							<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
								<input class="mdl-textfield__input so-mdl-textfield-input" type="text" id="residentialAddress1" name="residentialAddress1" value="${lifePersonalDetails.residentialAddress1 }" readonly="readonly" />
								<label class="mdl-textfield__label" for="residentialAddress1">Residential address line 1</label>
							</div>
						</div>
                  <div class="form-group application-summ">
							<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
								<input class="mdl-textfield__input so-mdl-textfield-input" type="text" id="residentialAddress2" name="residentialAddress2" value="${lifePersonalDetails.residentialAddress2 }" readonly="readonly" />
								<label class="mdl-textfield__label" for="residentialAddress2">Residential address line 2</label>
							</div>
						</div>
                  <div class="form-group application-summ">
							<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
								<input class="mdl-textfield__input so-mdl-textfield-input" type="text" id="residentialAddress3" name="residentialAddress3" value="${lifePersonalDetails.residentialAddress3 }" readonly="readonly" />
								<label class="mdl-textfield__label" for="residentialAddress2">Residential address line 3</label>
							</div>
						</div>
                  <div class="form-group application-summ">
							<div class="selectDiv centreDiv gray-text-bg is-not-active">
								<label class="mdl-textfield__label cstm-dropdown-label">District</label>
								<select name="tmpResidentialDistrict" id="tmpResidentialDistrict" class="form-control gray-dropdown">
									<option value="" disabled="disabled" selected="selected">District</option>
									<option value="${lifePersonalDetails.residentialAddressDistrictName }">${lifePersonalDetails.residentialAddressDistrictName }</option>
								</select>
								<input type="hidden" id="residentialAddressDistrict" name="residentialAddressDistrict" />
							</div>
						</div>
                  <div class="form-group application-summ">
							<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
								<input class="mdl-textfield__input so-mdl-textfield-input" type="text" id="correspondenceAddress1" name="correspondenceAddress1" value="${lifePersonalDetails.correspondenceAddress1 }" readonly="readonly" />
								<label class="mdl-textfield__label" for="correspondenceAddress1">Correspondence address line 1</label>
							</div>
						</div>
                  <div class="form-group application-summ">
							<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
								<input class="mdl-textfield__input so-mdl-textfield-input" type="text" id="correspondenceAddress2" name="correspondenceAddress2" value="${lifePersonalDetails.correspondenceAddress2 }" readonly="readonly" />
								<label class="mdl-textfield__label" for="correspondenceAddress2">Correspondence address line 2</label>
							</div>
						</div>
                  <div class="form-group application-summ">
							<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
								<input class="mdl-textfield__input so-mdl-textfield-input" type="text" id="correspondenceAddress3" name="correspondenceAddress3" value="${lifePersonalDetails.correspondenceAddress3 }" readonly="readonly" />
								<label class="mdl-textfield__label" for="correspondenceAddress3">Correspondence address line 3</label>
							</div>
						</div>
                  <div class="form-group application-summ">
							<div class="selectDiv centreDiv gray-text-bg is-not-active">
								<label class="mdl-textfield__label cstm-dropdown-label">District</label>
								<select name="tmpCorrespondenceDistrict" id="tmpCorrespondenceDistrict" class="form-control gray-dropdown">
									<option value="" disabled="disabled" selected="selected">District</option>
									<option value="${lifePersonalDetails.correspondenceAddressDistrictName }">${lifePersonalDetails.correspondenceAddressDistrictName }</option>
								</select>
								<input type="hidden" id="correspondenceAddressDistrict" name="correspondenceAddressDistrict" />
							</div>
						</div>
               </div>
            </div>
            <div class="summary-section below-employment clearfix">
               <h5>Employment info <a href="<%=request.getContextPath()%>/${language}/savings-insurance/employment-info?backSummary=Y">Edit</a></h5>
               <div class="desktop-left">
                  <div class="form-group application-summ">
							<div class="selectDiv centreDiv gray-text-bg is-not-active">
								<label class="mdl-textfield__label cstm-dropdown-label">Employment status</label>
								<select name="tmpEmploymentStatus" id="tmpEmploymentStatus" class="form-control gray-dropdown">
									<option value="" disabled="disabled" selected="selected">Employment status</option>
									<option value="${lifeEmploymentInfo.employmentStatusName }">${lifeEmploymentInfo.employmentStatusName }</option>
								</select>
								<input type="hidden" id="employmentStatus" name="employmentStatus" />
							</div>
						</div>
                  <div class="form-group application-summ">
							<div class="selectDiv centreDiv gray-text-bg is-not-active">
								<label class="mdl-textfield__label cstm-dropdown-label">Nature of business</label>
								<select name="tmpBusinessNature" id="tmpBusinessNature" class="form-control gray-dropdown">
									<option value="" disabled="disabled" selected="selected">Nature of business</option>
									<option value="${lifeEmploymentInfo.natureOfBusinessName }">${lifeEmploymentInfo.natureOfBusinessName }</option>
								</select>
								<input type="hidden" id="natureOfBusiness" name="natureOfBusiness" />
							</div>
						</div>
                  <div class="form-group application-summ">
							<div class="selectDiv centreDiv gray-text-bg is-not-active">
								<label class="mdl-textfield__label cstm-dropdown-label">Occupation</label>
								<select name="tmpOccupation" id="tmpOccupation" class="form-control gray-dropdown">
									<option value="" disabled="disabled" selected="selected">Occupation</option>
									<option value="${lifeEmploymentInfo.occupationName }">${lifeEmploymentInfo.occupationName }</option>
								</select>
								<input type="hidden" id="occupation" name="occupation" />
							</div>
						</div>
                  <div class="form-group application-summ">
							<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
								<input class="mdl-textfield__input so-mdl-textfield-input" type="text" id="otherOccupation" name="otherOccupation" value="${lifeEmploymentInfo.amountOfOtherSourceOfIncomeName }${lifeEmploymentInfo.amountOfLiquidAssetsName }" readonly="readonly" />
								<label class="mdl-textfield__label" for="otherOccupation">Please specify</label>
							</div>
						</div>
               </div>
               <div class="desktop-right">
                  <div class="form-group application-summ">
							<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
								<input class="mdl-textfield__input so-mdl-textfield-input" type="text" id="currentEmployer" name="currentEmployer" value="${lifeEmploymentInfo.employerName }" readonly="readonly" />
								<label class="mdl-textfield__label" for="currentEmployer">Current employer's name</label>
							</div>
						</div>
                  <div class="form-group application-summ">
							<div class="selectDiv centreDiv gray-text-bg is-not-active">
								<label class="mdl-textfield__label cstm-dropdown-label">Monthly personal income (HK$)</label>
								<select name="tmpMonthlyPersonalIncome" id="tmpMonthlyPersonalIncome" class="form-control gray-dropdown">
									<option value="" disabled="disabled" selected="selected">Monthly personal income (HK$)</option>
									<option value="${lifeEmploymentInfo.monthlyPersonalIncomeName }">${lifeEmploymentInfo.monthlyPersonalIncomeName }</option>
								</select>
								<input type="hidden" id="monthlyPersonalIncome" name="monthlyPersonalIncome" />
							</div>
						</div>
                  <div class="form-group application-summ">
							<div class="selectDiv centreDiv gray-text-bg is-not-active">
								<label class="mdl-textfield__label cstm-dropdown-label">Education level</label>
								<select name="tmpEducationLevel" id="tmpEducationLevel" class="form-control gray-dropdown">
									<option value="" disabled="disabled" selected="selected">Education level</option>
									<option value="${lifeEmploymentInfo.educationName }">${lifeEmploymentInfo.educationName }</option>
								</select>
								<input type="hidden" id="education" name="education" />
							</div>
						</div>
               </div>
            </div>
            <div class="summary-section below-beneficiary clearfix">
               <h5>Beneficiary info <a href="<%=request.getContextPath()%>/${language}/savings-insurance/beneficiary-info?backSummary=Y">Edit</a></h5>
            </div>
            <c:choose>
			       <c:when test="${lifeBeneficaryInfo.isOwnEstate == 'true' }">
			          <div class="summary-section below-beneficiary clearfix">
			             <h5>Own estate</h5>
			          </div>
			       </c:when>
			       <c:otherwise>
			          <c:if test="${lifeBeneficaryInfo.beneficaryFirstName1 != '' }">
				          <div class="summary-section inner-beneficiary clearfix">   
				               <span class="person-count first-person">Person 1</span>
				               <div class="desktop-left">
				                  <div class="form-group application-summ">
											<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
												<input class="mdl-textfield__input so-mdl-textfield-input" type="text" id="beneficiaryLastName[0]" name="beneficiaryLastName[0]" value="${lifeBeneficaryInfo.beneficaryLastName1 }" readonly="readonly" />
												<label class="mdl-textfield__label" for="beneficiaryLastName[0]">Last name (same as HKID)</label>
											</div>
										</div>
				                  <div class="form-group application-summ">
											<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
												<input class="mdl-textfield__input so-mdl-textfield-input" type="text" id="beneficiaryFirstName[0]" name="beneficiaryFirstName[0]" value="${lifeBeneficaryInfo.beneficaryFirstName1 }" readonly="readonly" />
												<label class="mdl-textfield__label" for="beneficiaryFirstName[0]">First name (same as HKID)</label>
											</div>
										</div>
				                  <div class="form-group application-summ">
											<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
												<input class="mdl-textfield__input so-mdl-textfield-input ch" type="text" id="beneficiaryChineseName[0]" name="beneficiaryChineseName[0]" value="${lifeBeneficaryInfo.beneficaryChineseName1 }" readonly="readonly" />
												<label class="mdl-textfield__label" for="beneficiaryChineseName[0]">Name in Chinese (optional)</label>
											</div>
										</div>
				                  <div class="form-group application-summ">
											<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
												<input class="mdl-textfield__input so-mdl-textfield-input" type="text" id="beneficiaryHkid[0]" name="beneficiaryHkid[0]" value="${lifeBeneficaryInfo.beneficiaryHkidPassport1 == 'passport' ? lifeBeneficaryInfo.beneficiaryPassport1:lifeBeneficaryInfo.beneficaryID1 }" readonly="readonly" />
												<label class="mdl-textfield__label" for="beneficiaryHkid[0]">${lifeBeneficaryInfo.beneficiaryHkidPassport1 == "passport" ? "Passport":"HKID" }</label>
											</div>
										</div>
				               </div>
				               <div class="desktop-right">
				                  <div class="form-group application-summ">
											<div class="selectDiv centreDiv gray-text-bg is-not-active">
												<label class="mdl-textfield__label cstm-dropdown-label">Relationship</label>
												<select name="tmpBeneficiaryRelationship[0]" id="tmpBeneficiaryRelationship[0]" class="form-control gray-dropdown">
													<option value="" disabled="disabled" selected="selected">Relationship</option>
													<option value="${lifeBeneficaryInfo.beneficaryRelationName1 }">${lifeBeneficaryInfo.beneficaryRelationName1 }</option>
												</select>
												<input type="hidden" id="beneficaryRelation1" name="beneficaryRelation1" />
											</div>
										</div>
				                  <div class="form-group application-summ">
											<div class="selectDiv centreDiv gray-text-bg is-not-active">
												<label class="mdl-textfield__label cstm-dropdown-label">Gender</label>
												<select name="tmpBeneficiaryGender[0]" id="tmpBeneficiaryGender[0]" class="form-control gray-dropdown">
													<option value="" disabled="disabled" selected="selected">Gender</option>
													<option value="${lifeBeneficaryInfo.beneficaryGender1 }">${lifeBeneficaryInfo.beneficaryGender1 }</option>
												</select>
												<input type="hidden" id="beneficaryGender1" name="beneficaryGender1" />
											</div>
										</div>
				                  <div class="form-group application-summ">
											<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
												<input class="mdl-textfield__input so-mdl-textfield-input" type="text" id="beneficiaryEntitlement[0]" name="beneficiaryEntitlement[0]" value="Person 1: ${lifeBeneficaryInfo.beneficaryWeight1 }%" readonly="readonly" />
												<label class="mdl-textfield__label" for="beneficiaryEntitlement[0]">Entitlement (%)</label>
											</div>
										</div>
				               </div>
							</div>
						</c:if>
						<c:if test="${lifeBeneficaryInfo.beneficaryFirstName2 != '' }">
							<div class="summary-section inner-beneficiary clearfix">
							   <span class="person-count">Person 2</span>
				               <div class="desktop-left">
				                  <div class="form-group application-summ">
											<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
												<input class="mdl-textfield__input so-mdl-textfield-input" type="text" id="beneficiaryLastName[1]" name="beneficiaryLastName[1]" value="${lifeBeneficaryInfo.beneficaryLastName2 }" readonly="readonly" />
												<label class="mdl-textfield__label" for="beneficiaryLastName[1]">Last name (same as HKID)</label>
											</div>
										</div>
				                  <div class="form-group application-summ">
											<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
												<input class="mdl-textfield__input so-mdl-textfield-input" type="text" id="beneficiaryFirstName[1]" name="beneficiaryFirstName[1]" value="${lifeBeneficaryInfo.beneficaryFirstName2 }" readonly="readonly" />
												<label class="mdl-textfield__label" for="beneficiaryFirstName[1]">First name (same as HKID)</label>
											</div>
										</div>
				                  <div class="form-group application-summ">
											<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
												<input class="mdl-textfield__input so-mdl-textfield-input ch" type="text" id="beneficiaryChineseName[1]" name="beneficiaryChineseName[1]" value="${lifeBeneficaryInfo.beneficaryChineseName2 }" readonly="readonly" />
												<label class="mdl-textfield__label" for="beneficiaryChineseName[1]">Name in Chinese (optional)</label>
											</div>
										</div>
				                  <div class="form-group application-summ">
											<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
												<input class="mdl-textfield__input so-mdl-textfield-input" type="text" id="beneficiaryHkid[1]" name="beneficiaryHkid[1]" value="${lifeBeneficaryInfo.beneficiaryHkidPassport2 == 'passport' ? lifeBeneficaryInfo.beneficiaryPassport2:lifeBeneficaryInfo.beneficaryID2 }" readonly="readonly" />
												<label class="mdl-textfield__label" for="beneficiaryHkid[1]">${lifeBeneficaryInfo.beneficiaryHkidPassport2 == "passport" ? "Passport":"HKID" }</label>
											</div>
										</div>
				               </div>
				               <div class="desktop-right">
				                  <div class="form-group application-summ">
											<div class="selectDiv centreDiv gray-text-bg is-not-active">
												<label class="mdl-textfield__label cstm-dropdown-label">Relationship</label>
												<select name="tmpBeneficiaryRelationship[1]" id="tmpBeneficiaryRelationship[1]" class="form-control gray-dropdown">
													<option value="" disabled="disabled" selected="selected">Relationship</option>
													<option value="${lifeBeneficaryInfo.beneficaryRelationName2 }">${lifeBeneficaryInfo.beneficaryRelationName2 }</option>
												</select>
												<input type="hidden" id="beneficaryRelation2" name="beneficaryRelation2" />
											</div>
										</div>
				                  <div class="form-group application-summ">
											<div class="selectDiv centreDiv gray-text-bg is-not-active">
												<label class="mdl-textfield__label cstm-dropdown-label">Gender</label>
												<select name="tmpBeneficiaryGender[1]" id="tmpBeneficiaryGender[1]" class="form-control gray-dropdown">
													<option value="" disabled="disabled" selected="selected">Gender</option>
													<option value="${lifeBeneficaryInfo.beneficaryGender2 }">${lifeBeneficaryInfo.beneficaryGender2 }</option>
												</select>
												<input type="hidden" id="beneficiaryGender[1]" name="beneficiaryGender[1]" />
											</div>
										</div>
				                  <div class="form-group application-summ">
											<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
												<input class="mdl-textfield__input so-mdl-textfield-input" type="text" id="beneficiaryEntitlement[1]" name="beneficiaryEntitlement[1]" value="Person 1: ${lifeBeneficaryInfo.beneficaryWeight2 }%" readonly="readonly" />
												<label class="mdl-textfield__label" for="beneficiaryEntitlement[1]">Entitlement (%)</label>
											</div>
										</div>
				               </div>
							</div>
						</c:if>
						<c:if test="${lifeBeneficaryInfo.beneficaryFirstName3 != '' }">
							<div class="summary-section inner-beneficiary clearfix">
							   <span class="person-count">Person 3</span>
				               <div class="desktop-left">
				                  <div class="form-group application-summ">
											<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
												<input class="mdl-textfield__input so-mdl-textfield-input" type="text" id="beneficiaryLastName[2]" name="beneficiaryLastName[2]" value="${lifeBeneficaryInfo.beneficaryLastName3 }" readonly="readonly" />
												<label class="mdl-textfield__label" for="beneficiaryLastName[2]">Last name (same as HKID)</label>
											</div>
										</div>
				                  <div class="form-group application-summ">
											<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
												<input class="mdl-textfield__input so-mdl-textfield-input" type="text" id="beneficiaryFirstName[2]" name="beneficiaryFirstName[2]" value="${lifeBeneficaryInfo.beneficaryFirstName3 }" readonly="readonly" />
												<label class="mdl-textfield__label" for="beneficiaryFirstName[2]">First name (same as HKID)</label>
											</div>
										</div>
				                  <div class="form-group application-summ">
											<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
												<input class="mdl-textfield__input so-mdl-textfield-input ch" type="text" id="beneficiaryChineseName[2]" name="beneficiaryChineseName[2]" value="${lifeBeneficaryInfo.beneficaryChineseName3 }" readonly="readonly" />
												<label class="mdl-textfield__label" for="beneficiaryChineseName[2]">Name in Chinese (optional)</label>
											</div>
										</div>
				                  <div class="form-group application-summ">
											<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
												<input class="mdl-textfield__input so-mdl-textfield-input" type="text" id="beneficiaryHkid[2]" name="beneficiaryHkid[2]" value="${lifeBeneficaryInfo.beneficiaryHkidPassport3 == 'passport' ? lifeBeneficaryInfo.beneficiaryPassport3:lifeBeneficaryInfo.beneficaryID3 }" readonly="readonly" />
												<label class="mdl-textfield__label" for="beneficiaryHkid[2]">${lifeBeneficaryInfo.beneficiaryHkidPassport3 == "passport" ? "Passport":"HKID" }</label>
											</div>
										</div>
				               </div>
				               <div class="desktop-right">
				                  <div class="form-group application-summ">
											<div class="selectDiv centreDiv gray-text-bg is-not-active">
												<label class="mdl-textfield__label cstm-dropdown-label">Relationship</label>
												<select name="tmpBeneficiaryRelationship[2]" id="tmpBeneficiaryRelationship[2]" class="form-control gray-dropdown">
													<option value="" disabled="disabled" selected="selected">Relationship</option>
													<option value="${lifeBeneficaryInfo.beneficaryRelationName3 }">${lifeBeneficaryInfo.beneficaryRelationName3 }</option>
												</select>
												<input type="hidden" id="beneficaryRelation3" name="beneficaryRelation3" />
											</div>
										</div>
				                  <div class="form-group application-summ">
											<div class="selectDiv centreDiv gray-text-bg is-not-active">
												<label class="mdl-textfield__label cstm-dropdown-label">Gender</label>
												<select name="tmpBeneficiaryGender[2]" id="tmpBeneficiaryGender[2]" class="form-control gray-dropdown">
													<option value="" disabled="disabled" selected="selected">Gender</option>
													<option value="${lifeBeneficaryInfo.beneficaryGender3 }">${lifeBeneficaryInfo.beneficaryGender3 }</option>
												</select>
												<input type="hidden" id="beneficaryGender3" name="beneficaryGender3" />
											</div>
										</div>
				                  <div class="form-group application-summ">
											<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
												<input class="mdl-textfield__input so-mdl-textfield-input" type="text" id="beneficiaryEntitlement[2]" name="beneficiaryEntitlement[2]" value="Person 1: ${lifeBeneficaryInfo.beneficaryWeight3 }%" readonly="readonly" />
												<label class="mdl-textfield__label" for="beneficiaryEntitlement[2]">Entitlement (%)</label>
											</div>
										</div>
				               </div>
				            </div>
			            </c:if>
			       </c:otherwise>
			</c:choose>
            <div class="summary-section below-payment clearfix">
               <h5>Payment info <a href="<%=request.getContextPath()%>/${language}/savings-insurance/payment?backSummary=Y">Edit</a></h5>
               <div class="desktop-left">
                  <div class="form-group application-summ">
							<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
								<input class="mdl-textfield__input so-mdl-textfield-input" type="text" id="amount" name="amount" value="HK$ ${lifePayment.paymentAmount }" readonly="readonly" />
								<label class="mdl-textfield__label" for="amount">Amount</label>
							</div>
						</div>
                  <div class="form-group application-summ">
							<div class="selectDiv centreDiv gray-text-bg is-not-active">
								<label class="mdl-textfield__label cstm-dropdown-label">Payment method</label>
								<select name="tmpPaymentMethod" id="tmpPaymentMethod" class="form-control gray-dropdown">
									<option value="" disabled="disabled" selected="selected">Payment method</option>
									<option value="${lifePayment.paymentMethod }">${lifePayment.paymentMethod }</option>
								</select>
								<input type="hidden" id="paymentMethod" name="paymentMethod" />
							</div>
						</div>
                  <div class="form-group application-summ">
							<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
								<input class="mdl-textfield__input so-mdl-textfield-input" type="text" id="accountHolderName" name="accountHolderName" value="${lifePayment.accountHolderName }" readonly="readonly" />
								<label class="mdl-textfield__label" for="accountHolderName">Bank account holder name</label>
							</div>
						</div>
               </div>
               <div class="desktop-right">
                  <div class="form-group application-summ">
							<div class="selectDiv centreDiv gray-text-bg is-not-active">
								<label class="mdl-textfield__label cstm-dropdown-label">Bank name (code)</label>
								<select name="tmpBankName" id="tmpBankName" class="form-control gray-dropdown">
									<option value="" disabled="disabled" selected="selected">Bank name (code)</option>
									<option value="${lifePayment.bankName }">${lifePayment.bankName }</option>
								</select>
								<input type="hidden" id="bankName" name="bankName" />
							</div>
						</div>
                  <div class="form-group application-summ">
							<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
								<input class="mdl-textfield__input so-mdl-textfield-input" type="text" id="accountNo" name="accountNo" value="${lifePayment.accountNumber }" readonly="readonly" />
								<label class="mdl-textfield__label" for="accountNo">Account no.</label>
							</div>
						</div>
                  <div class="form-group application-summ">
							<div class="selectDiv centreDiv gray-text-bg is-not-active">
								<label class="mdl-textfield__label cstm-dropdown-label">Branch name</label>
								<select name="tmpBranchName" id="tmpBranchName" class="form-control gray-dropdown">
									<option value="" disabled="disabled" selected="selected">Branch name</option>
									<option value="${lifePayment.branchName }">${lifePayment.branchName }</option>
								</select>
								<input type="hidden" id="branchName" name="branchName" />
							</div>
						</div>
               </div>
            </div>

            <div class="text-center clearfix">
               <button class="btn savie-common-btn" type="button" onclick="goNext()">Next</button>
                <a href="#" id="as-save-and-con" class="as-save-con" data-toggle="modal" data-target="#save-and-continue-batch5-modal">
               <span>Save and continue later</span>
            </div>
         </div>
			<!-- FOOTER -->
		</div>
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
			var getpath = "<%=request.getContextPath()%>";
			
			function goNext(){
					window.location = '<%=request.getContextPath()%>/${language}/savings-insurance/${nextPageFlow}';
			}
		$(document).ready(function() {
         $('.save-exit-btn2, #save-exit-btn').click(function() {
            $(this).closest('.modal').modal('hide');
            $('#application-saved-modal').modal('show');
         });
      	// set fields whether editable or not
			// Your selected plan block
			setInputReadonly('planName', true);
			setInputReadonly('savingAmount', true);
			setSelectReadonly('tmpPremiumMode', true);
			// Personal info
			setInputReadonly('lastName', true);
			setInputReadonly('firstName', true);
			setInputReadonly('chineseName', true);
			setSelectReadonly('tmpGender', true);
			setInputReadonly('hkId', true);
			setSelectReadonly('tmpPlaceOfBirth', true);
			setSelectReadonly('tmpNationality', true);
			setInputReadonly('so-calendar-dob', true);
			setInputReadonly('residentialNo', true);
			setInputReadonly('telephoneNo', true);
			setSelectReadonly('tmpMaritalStatus', true);
			setInputReadonly('emailAddress', true);
			setInputReadonly('permanentAddress1', true);
			setInputReadonly('permanentAddress2', true);
			setInputReadonly('permanentAddress3', true);
			setSelectReadonly('tmpPermanetAddressDistrict', true);
			setInputReadonly('residentialAddress1', true);
			setInputReadonly('residentialAddress2', true);
			setInputReadonly('residentialAddress3', true);
			setSelectReadonly('tmpResidentialAddressDistrict', true);
			setInputReadonly('correspondenceAddress1', true);
			setInputReadonly('correspondenceAddress2', true);
			setInputReadonly('correspondenceAddress3', true);
			setSelectReadonly('tmpCorrespondenceAddressDistrict', true);
			//Employment info
			setSelectReadonly('tmpEmploymentStatus', true);
			setSelectReadonly('tmpBusinessNature', true);
			setSelectReadonly('tmpOccupation', true);
			setInputReadonly('otherOccupation', true);
			setInputReadonly('currentEmployer', true);
			setSelectReadonly('tmpMonthlyPersonalIncome', true);
			setSelectReadonly('tmpEducationLevel', true);
			// Beneficiary info
			setInputReadonly('beneficiaryLastName[0]', true);
			setInputReadonly('beneficiaryFirstName[0]', true);
			setInputReadonly('beneficiaryChineseName[0]', true);
			setInputReadonly('beneficiaryHkid[0]', true);
			setSelectReadonly('tmpBeneficaryRelation[0]', true);
			setSelectReadonly('tmpBeneficaryGender[0]', true);
			setInputReadonly('beneficiaryEntitlement[0]', true);
			setInputReadonly('beneficiaryLastName[1]', true);
			setInputReadonly('beneficiaryFirstName[1]', true);
			setInputReadonly('beneficiaryChineseName[1]', true);
			setInputReadonly('beneficiaryHkid[1]', true);
			setSelectReadonly('tmpBeneficaryRelation[1]', true);
			setSelectReadonly('tmpBeneficaryGender[1]', true);
			setInputReadonly('beneficiaryEntitlement[1]', true);
			setInputReadonly('beneficiaryLastName[2]', true);
			setInputReadonly('beneficiaryFirstName[2]', true);
			setInputReadonly('beneficiaryChineseName[2]', true);
			setInputReadonly('beneficiaryHkid[2]', true);
			setSelectReadonly('tmpBeneficaryRelation[2]', true);
			setSelectReadonly('tmpBeneficaryGender[2]', true);
			setInputReadonly('beneficiaryEntitlement[2]', true);
			// Payment info
			setInputReadonly('amount', true);
			setSelectReadonly('tmpPaymentMethod', true);
			setInputReadonly('accountHolderName', true);
			setSelectReadonly('tmpBankName', true);
			setInputReadonly('accountNo', true);
			setSelectReadonly('tmpBranchName', true);
		});
		</script>
	</body>
</html>