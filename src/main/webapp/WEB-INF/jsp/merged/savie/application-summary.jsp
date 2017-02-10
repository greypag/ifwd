<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeQuoteBean"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="com.ifwd.fwdhk.util.NumberFormatUtils"%>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<!DOCTYPE html>
<script type="text/javascript">
var context = "${pageContext.request.contextPath}";
var language = "${language}";
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
		<div class="fwd-savie-wrapper savie-online-container with-breadcrumbs-steps" id="application-summary-page">

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
		    	<c:set var="stepActive">2</c:set>
		    </c:if>

		     <!--<div class="container-fluid fwd-full-container browse-holder">-->
		        <jsp:include page="/WEB-INF/jsp/merged/comp/step-indicator.jsp">
		        	<jsp:param name="stepItems" value="${stepItems}"/>
	    			<jsp:param name="stepActive" value="${stepActive}"/>
		    	</jsp:include>
		     <!--</div>-->

		<!-- StepIndicator Component End-->

         <div class="container-fluid fwd-container savie-application-summary headerStick">
            <h5 class="title"><fmt:message key="label.summary2" bundle="${msg}" /></h5>
            <div class="summary-section clearfix">
               <c:if test="${plan == 'savings-insurance'}"><c:set var="backPlanUrl" value="plan-details-sp"/></c:if>
               <c:if test="${plan == 'medical-insurance'}"><c:set var="backPlanUrl" value="plan-option"/></c:if>
               
               <h5><fmt:message key="label.selectedplan" bundle="${msg}" /> <a href="<%=request.getContextPath()%>/${language}/${plan }/${backPlanUrl }?backSummary=Y"><div id="PlanSelected"><fmt:message key="label.edit" bundle="${msg}"/></div></a></h5>
					<div class="form-group application-summ">
						<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
							<!--<input class="mdl-textfield__input so-mdl-textfield-input" type="text" autocomplete="off" id="planName" name="planName" value="${plan == 'savings-insurance' ? language == 'en' ? 'SAVIE':'Savie自助息理財壽險':language == 'en' ? selectPlan.planNameEn:selectPlan.planNameCn }" readonly="readonly" />-->
							<!-- <div class="mdl-textfield__input so-mdl-textfield-input planName-text" type="text" autocomplete="off"  value="">${plan == 'savings-insurance' ? language == 'en' ? 'SAVIE':'Savie自助息理財壽險':language == 'en' ? selectPlan.planNameEn:selectPlan.planNameCn }</div>  --> 
							<div class="mdl-textfield__input so-mdl-textfield-input planName-text" type="text" autocomplete="off"  value="">
							<c:if test="${planIndex == 'medical-insurance/cansurance'}">
							${planIndex == 'medical-insurance/cansurance' ? language == 'en' ? 'CANsurance Cancer Protection Plan':'揀易保癌症保障計劃':language == 'en' ? selectPlan.planNameEn:selectPlan.planNameCn }
							</c:if>
							<c:if test="${planIndex == 'medical-insurance/cansurance'}">
							${plan == 'savings-insurance' ? language == 'en' ? 'SAVIE':'Savie自助息理財壽險':language == 'en' ? selectPlan.planNameEn:selectPlan.planNameCn }
							</c:if>
							</div>
							<label class="mdl-textfield__label planName-label" for="planName"><fmt:message key="Placeholder.planname" bundle="${msg}" /></label>
							<input type="hidden" id="planName" name="planName" value="${plan == 'savings-insurance' ? language == 'en' ? 'SAVIE':'Savie自助息理財壽險':language == 'en' ? selectPlan.planNameEn:selectPlan.planNameCn }">
						
						</div>
					</div>
					<div class="desktop-left">
						<div class="form-group application-summ">
							<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
								<input class="mdl-textfield__input so-mdl-textfield-input" type="text" autocomplete="off" id="savingAmount" name="savingAmount" value="HK$ <fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="3" value="${plan == 'savings-insurance' ? saviePlanDetails.insuredAmount:selectPlan.monthlyPremium}" />" readonly="readonly" />
								<label class="mdl-textfield__label" for="savingAmount"><c:choose><c:when test="${planIndex == 'medical-insurance'}"><fmt:message key="Placeholder.medical.amount" bundle="${msg}" /></c:when><c:otherwise><fmt:message key="Placeholder.savingamount" bundle="${msg}" /></c:otherwise></c:choose></label>
							</div>
							<c:if test="${saviePlanDetails.insuredAmountDiscount!=null && saviePlanDetails.insuredAmountDiscount!='' && saviePlanDetails.insuredAmountDiscount!='0'}">
								<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
									<input class="mdl-textfield__input so-mdl-textfield-input" type="text" autocomplete="off" id="savingDiscount" name="savingDiscount" value="HK$ <fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="3" value="${saviePlanDetails.insuredAmountDiscount}" />" readonly="readonly" />
									<label class="mdl-textfield__label" for="savingDiscount"><fmt:message key="placeholder.total.amount.discount" bundle="${msg}" /></label>
								</div>
								<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
									<input class="mdl-textfield__input so-mdl-textfield-input" type="text" autocomplete="off" id="savingAmountDue" name="savingAmountDue" value="HK$ <fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="3" value="${saviePlanDetails.insuredAmountDue}" />" readonly="readonly" />
									<label class="mdl-textfield__label" for="savingDiscount"><fmt:message key="placeholder.total.amount.due" bundle="${msg}" /></label>
								</div>
							</c:if>
							<c:if test="${selectPlan.discount!=null && selectPlan.discount!='' && selectPlan.discount!='0'}">
								<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
									<input class="mdl-textfield__input so-mdl-textfield-input" type="text" autocomplete="off" id="savingDiscount" name="savingDiscount" value="HK$ <fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="3" value="${selectPlan.discount}" />" readonly="readonly" />
									<label class="mdl-textfield__label" for="savingDiscount"><fmt:message key="placeholder.total.amount.discount" bundle="${msg}" /></label>
								</div>
								<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
									<input class="mdl-textfield__input so-mdl-textfield-input" type="text" autocomplete="off" id="savingAmountDue" name="savingAmountDue" value="HK$ <fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="3" value="${selectPlan.monthlyPremium-selectPlan.discount}" />" readonly="readonly" />
									<label class="mdl-textfield__label" for="savingDiscount"><fmt:message key="placeholder.total.amount.due" bundle="${msg}" /></label>
								</div>						
							</c:if>
						</div>
               		</div>
               <div class="desktop-right">
                  <div class="form-group application-summ">
							<div class="selectDiv centreDiv gray-text-bg is-not-active ${planIndex=='medical-insurance'?'hidden':''}">
								<label class="mdl-textfield__label cstm-dropdown-label"><fmt:message key="Placeholder.premiummode" bundle="${msg}" /></label>
								<select name="tmpPremiumMode" id="tmpPremiumMode" class="form-control gray-dropdown">
									<option value="" ><fmt:message key="Placeholder.premiummode" bundle="${msg}" /></option>
									<option disabled="disabled" selected="selected" value="${plan == 'savings-insurance' ? language=='en' ? saviePlanDetails.paymentType=='SP'?'Single premium':saviePlanDetails.paymentType:saviePlanDetails.paymentType=='SP'?'一筆過供款':'月繳供款':language == 'en' ? 'Monthly Regular Contribution':'月繳供款'}">
									${plan == 'savings-insurance' ? language=='en' ? saviePlanDetails.paymentType=='SP'?'Single premium':saviePlanDetails.paymentType:saviePlanDetails.paymentType=='SP'?'一筆過供款':'月繳供款':language == 'en' ? 'Monthly Regular Contribution':'月繳供款'}</option>
								</select>
								<input type="hidden" id="premiumMode" name="premiumMode" />
							</div>
						</div>
               </div>
            </div>
            <div class="summary-section below clearfix">
               <h5><fmt:message key="label.personalinfo" bundle="${msg}" /><a href="<%=request.getContextPath()%>/${language}/${plan }/personal-details?backSummary=Y"><div id="PersonInformation"><fmt:message key="label.edit" bundle="${msg}" /></div></a></h5>
               <div class="desktop-left">
                  <div class="form-group application-summ">
							<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
								<input class="mdl-textfield__input so-mdl-textfield-input" type="text" autocomplete="off" id="lastName" name="lastName" value="${lifePersonalDetails.lastname }" readonly="readonly" />
								<label class="mdl-textfield__label" for="lastName"><fmt:message key="placeholder.last.name" bundle="${msg}" /></label>
							</div>
						</div>
                  <div class="form-group application-summ">
							<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
								<input class="mdl-textfield__input so-mdl-textfield-input" type="text" autocomplete="off" id="firstName" name="firstName" value="${lifePersonalDetails.firstname }" readonly="readonly" />
								<label class="mdl-textfield__label" for="firstName"><fmt:message key="placeholder.first.name" bundle="${msg}" /></label>
							</div>
						</div>
                  <div class="form-group application-summ">
							<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
								<input class="mdl-textfield__input so-mdl-textfield-input ch" type="text" autocomplete="off" id="chineseName" name="chineseName" value="${lifePersonalDetails.chineseName }" readonly="readonly" />
								<label class="mdl-textfield__label" for="chineseName"><fmt:message key="placeholder.chinese.name" bundle="${msg}" /></label>
							</div>
						</div>
                  <div class="form-group application-summ">
							<div class="selectDiv centreDiv gray-text-bg is-not-active">
								<label class="mdl-textfield__label cstm-dropdown-label"><fmt:message key="placeholder.gender" bundle="${msg}" /></label>
								<select name="tmpGender" id="tmpGender" class="form-control gray-dropdown" style="text-transform:uppercase" >
									<option value="" ><fmt:message key="placeholder.gender" bundle="${msg}" /></option>
									<option disabled="disabled" selected="selected" value="${language=='en'?lifePersonalDetails.gender:lifePersonalDetails.gender=='MALE'?'男':'女' }">${language=='en'?lifePersonalDetails.gender:lifePersonalDetails.gender=='MALE'?'男':'女' }</option>
								</select>
								<input type="hidden" id="gender" name="gender" />
							</div>
						</div>
                  <div class="form-group application-summ">
							<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
								<input class="mdl-textfield__input so-mdl-textfield-input" type="text" autocomplete="off" id="hkId" name="hkId" value="${lifePersonalDetails.hkid }" readonly="readonly" />
								<label class="mdl-textfield__label" for="hkId"><fmt:message key="placeholder.hkid" bundle="${msg}" /></label>
							</div>
						</div>
                  <div class="form-group application-summ">
							<div class="selectDiv centreDiv gray-text-bg is-not-active">
								<label class="mdl-textfield__label cstm-dropdown-label"><fmt:message key="placeholder.place.of.Birth" bundle="${msg}" /></label>
								<select name="tmpPlaceOfBirth" id="tmpPlaceOfBirth" class="form-control gray-dropdown">
									<option value=""><fmt:message key="placeholder.place.of.Birth" bundle="${msg}" /></option>
									<option disabled="disabled" selected="selected" value="${language == 'en' ? lifePersonalDetails.placeOfBirthEnName:lifePersonalDetails.placeOfBirthCnName}">${language == 'en' ? lifePersonalDetails.placeOfBirthEnName:lifePersonalDetails.placeOfBirthCnName}</option>
								</select>
								<input type="hidden" id="placeOfBirth" name="placeOfBirth" />
							</div>
						</div>
                  <div class="form-group application-summ">
							<div class="selectDiv centreDiv gray-text-bg is-not-active">
								<label class="mdl-textfield__label cstm-dropdown-label"><fmt:message key="placeholder.nationality" bundle="${msg}" /></label>
								<select name="tmpNationality" id="tmpNationality" class="form-control gray-dropdown">
									<option value=""><fmt:message key="placeholder.nationality" bundle="${msg}" /></option>
									<option disabled="disabled" selected="selected" value="${language == 'en' ? lifePersonalDetails.nationaltyEnName:lifePersonalDetails.nationaltyCnName}">${language == 'en' ? lifePersonalDetails.nationaltyEnName:lifePersonalDetails.nationaltyCnName}</option>
								</select>
								<input type="hidden" id="nationalty" name="nationalty" />
							</div>
						</div>
                  <div class="form-group application-summ">
							<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
								<input class="mdl-textfield__input so-mdl-textfield-input" type="text" autocomplete="off" id="so-calendar-dob" name="so-calendar-dob" value="${lifePersonalDetails.dob }" readonly="readonly" />
								<label class="mdl-textfield__label" for="so-calendar-dob"><fmt:message key="placeholder.dob" bundle="${msg}" /></label>
							</div>
						</div>
               </div>
               <div class="desktop-right">
                  <div class="form-group application-summ">
							<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
								<input class="mdl-textfield__input so-mdl-textfield-input" type="text" autocomplete="off" id="residentialNo" name="residentialNo" value="${lifePersonalDetails.residentialTelNo }" readonly="readonly" />
								<label class="mdl-textfield__label" for="residentialNo"><fmt:message key="placeholder.residential.no" bundle="${msg}" /></label>
							</div>
						</div>
                  <div class="form-group application-summ">
							<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
								<input class="mdl-textfield__input so-mdl-textfield-input" type="text" autocomplete="off" id="telephoneNo" name="telephoneNo" value="${lifePersonalDetails.mobileNumber }" readonly="readonly" />
								<label class="mdl-textfield__label" for="telephoneNo"><fmt:message key="placeholder.mobile.no" bundle="${msg}" /></label>
							</div>
						</div>
                  <div class="form-group application-summ">
							<div class="selectDiv centreDiv gray-text-bg is-not-active">
								<label class="mdl-textfield__label cstm-dropdown-label"><fmt:message key="placeholder.martial.status" bundle="${msg}" /></label>
								<select name="tmpMaritalStatus" id="tmpMaritalStatus" class="form-control gray-dropdown">
									<option value=""><fmt:message key="placeholder.martial.status" bundle="${msg}" /></option>
									<option disabled="disabled" selected="selected" value="${language == 'en' ? lifePersonalDetails.martialStatusEnName:lifePersonalDetails.martialStatusCnName}">${language == 'en' ? lifePersonalDetails.martialStatusEnName:lifePersonalDetails.martialStatusCnName}</option>
								</select>
								<input type="hidden" id="martialStatus" name="martialStatus" />
							</div>
						</div>
                  <div class="form-group application-summ">
							<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
								<input class="mdl-textfield__input so-mdl-textfield-input" type="text" autocomplete="off" id="emailAddress" name="emailAddress" value="${lifePersonalDetails.emailAddress }" readonly="readonly" />
								<label class="mdl-textfield__label" for="emailAddress"><fmt:message key="placeholder.email" bundle="${msg}" /></label>
							</div>
						</div>
                  <div class="form-group application-summ">
							<span class="warning-note"><fmt:message key="placeholder.permanent.warning" bundle="${msg}" /></span>
							<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
								<input class="mdl-textfield__input so-mdl-textfield-input" type="text" autocomplete="off" id="permanentAddress1" name="permanentAddress1" value="${lifePersonalDetails.permanetAddress1 }" readonly="readonly" />
								<label class="mdl-textfield__label" for="permanentAddress1"><fmt:message key="placeholder.peraddress.line1" bundle="${msg}" /></label>
							</div>
						</div>
                  <div class="form-group application-summ">
							<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
								<input class="mdl-textfield__input so-mdl-textfield-input" type="text" autocomplete="off" id="permanentAddress2" name="permanentAddress2" value="${lifePersonalDetails.permanetAddress2 }" readonly="readonly" />
								<label class="mdl-textfield__label" for="permanentAddress2"><fmt:message key="placeholder.peraddress.line2" bundle="${msg}" /></label>
							</div>
						</div>
                  <div class="form-group application-summ">
							<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
								<input class="mdl-textfield__input so-mdl-textfield-input" type="text" autocomplete="off" id="permanentAddress3" name="permanentAddress3" value="${lifePersonalDetails.permanetAddress3 }" readonly="readonly" />
								<label class="mdl-textfield__label" for="permanentAddress3"><fmt:message key="placeholder.peraddress.line3" bundle="${msg}" /></label>
							</div>
						</div>
                  <div class="form-group application-summ">
							<div class="selectDiv centreDiv gray-text-bg is-not-active">
								<label class="mdl-textfield__label cstm-dropdown-label"><fmt:message key="placeholder.address.district" bundle="${msg}" /></label>
								<select name="tmpPermanentDistrict" id="tmpPermanentDistrict" class="form-control gray-dropdown">
									<option value=""><fmt:message key="placeholder.address.district" bundle="${msg}" /></option>
									<option disabled="disabled" selected="selected" value="${language == 'en' ? lifePersonalDetails.permanetAddressDistrictEnName:lifePersonalDetails.permanetAddressDistrictCnName}">${language == 'en' ? lifePersonalDetails.permanetAddressDistrictEnName:lifePersonalDetails.permanetAddressDistrictCnName}</option>
								</select>
								<input type="hidden" id="permanetAddressDistrict" name="permanetAddressDistrict" />
							</div>
						</div>
                  <div class="form-group application-summ">
							<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
								<input class="mdl-textfield__input so-mdl-textfield-input" type="text" autocomplete="off" id="residentialAddress1" name="residentialAddress1" value="${lifePersonalDetails.residentialAddress1 }" readonly="readonly" maxlength="29"/>
								<label class="mdl-textfield__label" for="residentialAddress1"><fmt:message key="placeholder.resaddress.line1" bundle="${msg}" /></label>
							</div>
						</div>
                  <div class="form-group application-summ">
							<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
								<input class="mdl-textfield__input so-mdl-textfield-input" type="text" autocomplete="off" id="residentialAddress2" name="residentialAddress2" value="${lifePersonalDetails.residentialAddress2 }" readonly="readonly" maxlength="29"/>
								<label class="mdl-textfield__label" for="residentialAddress2"><fmt:message key="placeholder.resaddress.line2" bundle="${msg}" /></label>
							</div>
						</div>
                  <div class="form-group application-summ">
							<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
								<input class="mdl-textfield__input so-mdl-textfield-input" type="text" autocomplete="off" id="residentialAddress3" name="residentialAddress3" value="${lifePersonalDetails.residentialAddress3 }" readonly="readonly" maxlength="19"/>
								<label class="mdl-textfield__label" for="residentialAddress2"><fmt:message key="placeholder.resaddress.line3" bundle="${msg}" /></label>
							</div>
						</div>
                  <div class="form-group application-summ">
							<div class="selectDiv centreDiv gray-text-bg is-not-active">
								<label class="mdl-textfield__label cstm-dropdown-label"><fmt:message key="placeholder.address.district" bundle="${msg}" /></label>
								<select name="tmpResidentialDistrict" id="tmpResidentialDistrict" class="form-control gray-dropdown">
									<option value=""><fmt:message key="placeholder.address.district" bundle="${msg}" /></option>
									<option disabled="disabled" selected="selected" value="${language == 'en' ? lifePersonalDetails.residentialAddressDistrictEnName:lifePersonalDetails.residentialAddressDistrictCnName}">${language == 'en' ? lifePersonalDetails.residentialAddressDistrictEnName:lifePersonalDetails.residentialAddressDistrictCnName}</option>
								</select>
								<input type="hidden" id="residentialAddressDistrict" name="residentialAddressDistrict" />
							</div>
						</div>
                  <div class="form-group application-summ">
							<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
								<input class="mdl-textfield__input so-mdl-textfield-input" type="text" autocomplete="off" id="correspondenceAddress1" name="correspondenceAddress1" value="${lifePersonalDetails.correspondenceAddress1 }" readonly="readonly" />
								<label class="mdl-textfield__label" for="correspondenceAddress1"><fmt:message key="placeholder.coraddress.line1" bundle="${msg}" /></label>
							</div>
						</div>
                  <div class="form-group application-summ">
							<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
								<input class="mdl-textfield__input so-mdl-textfield-input" type="text" autocomplete="off" id="correspondenceAddress2" name="correspondenceAddress2" value="${lifePersonalDetails.correspondenceAddress2 }" readonly="readonly" />
								<label class="mdl-textfield__label" for="correspondenceAddress2"><fmt:message key="placeholder.coraddress.line2" bundle="${msg}" /></label>
							</div>
						</div>
                  <div class="form-group application-summ">
							<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
								<input class="mdl-textfield__input so-mdl-textfield-input" type="text" autocomplete="off" id="correspondenceAddress3" name="correspondenceAddress3" value="${lifePersonalDetails.correspondenceAddress3 }" readonly="readonly" />
								<label class="mdl-textfield__label" for="correspondenceAddress3"><fmt:message key="placeholder.coraddress.line3" bundle="${msg}" /></label>
							</div>
						</div>
                  <div class="form-group application-summ">
							<div class="selectDiv centreDiv gray-text-bg is-not-active">
								<label class="mdl-textfield__label cstm-dropdown-label"><fmt:message key="placeholder.address.district" bundle="${msg}" /></label>
								<select name="tmpCorrespondenceDistrict" id="tmpCorrespondenceDistrict" class="form-control gray-dropdown">
									<option value=""><fmt:message key="placeholder.address.district" bundle="${msg}" /></option>
									<option disabled="disabled" selected="selected" value="${language == 'en' ? lifePersonalDetails.correspondenceAddressDistrictEnName:lifePersonalDetails.correspondenceAddressDistrictCnName}">${language == 'en' ? lifePersonalDetails.correspondenceAddressDistrictEnName:lifePersonalDetails.correspondenceAddressDistrictCnName}</option>
								</select>
								<input type="hidden" id="correspondenceAddressDistrict" name="correspondenceAddressDistrict" />
							</div>
						</div>
						<input class="mdl-textfield__input so-mdl-textfield-input" type="hidden" autocomplete="off" id="theClubMembershipNo" name="theClubMembershipNo" value="" readonly="readonly" />
						<%--<div class="form-group application-summ">
							<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
								<input class="mdl-textfield__input so-mdl-textfield-input" type="text" autocomplete="off" id="theClubMembershipNo" name="theClubMembershipNo" value="${lifePersonalDetails.theClubMembershipNo }" readonly="readonly" />
								<label class="mdl-textfield__label" for="theClubMembershipNo"><fmt:message key="club.membership.number" bundle="${msg}" /></label>
							</div>
						</div>--%>

               </div>
            </div>
            <div class="summary-section below-employment clearfix">
               <h5><fmt:message key="label.employment.info" bundle="${msg}" /> <a href="<%=request.getContextPath()%>/${language}/${plan }/employment-info?backSummary=Y"><div id="employmentInfo"> <fmt:message key="label.edit" bundle="${msg}" /></div></a></h5>
               <div class="desktop-left">
                  <div class="form-group application-summ">
							<div class="selectDiv centreDiv gray-text-bg is-not-active">
								<label class="mdl-textfield__label cstm-dropdown-label"><fmt:message key="placeholder.employment.status" bundle="${msg}" /></label>
								<select name="tmpEmploymentStatus" id="tmpEmploymentStatus" class="form-control gray-dropdown">
									<option value=""><fmt:message key="placeholder.employment.status" bundle="${msg}" /></option>
									<option disabled="disabled" selected="selected" value="${language == 'en' ? lifeEmploymentInfo.employmentStatusEnName:lifeEmploymentInfo.employmentStatusCnName}">${language == 'en' ? lifeEmploymentInfo.employmentStatusEnName:lifeEmploymentInfo.employmentStatusCnName}</option>
								</select>
								<input type="hidden" id="employmentStatus" name="employmentStatus" />
							</div>
					</div>

               </div>
               <div class="desktop-right">
                  <div id="monthlyPersonalIncomeDiv" class="form-group application-summ">
							<div class="selectDiv centreDiv gray-text-bg is-not-active">
								<label class="mdl-textfield__label cstm-dropdown-label"><fmt:message key="placeholder.monthly.personal.income" bundle="${msg}" /></label>
								<select name="tmpMonthlyPersonalIncome" id="tmpMonthlyPersonalIncome" class="form-control gray-dropdown">
									<option value=""><fmt:message key="placeholder.monthly.personal.income" bundle="${msg}" /></option>
									<option disabled="disabled" selected="selected" value="${language == 'en' ? lifeEmploymentInfo.monthlyPersonalIncomeEnName:lifeEmploymentInfo.monthlyPersonalIncomeCnName}">${language == 'en' ? lifeEmploymentInfo.monthlyPersonalIncomeEnName:lifeEmploymentInfo.monthlyPersonalIncomeCnName}</option>
								</select>
								<input type="hidden" id="monthlyPersonalIncome" name="monthlyPersonalIncome" />
							</div>
					</div>
                  <div id="spaceHolder" class="form-group application-summ">
							<div class="selectDiv centreDiv gray-text-bg is-not-active">
								<select name="tmpMonthlyPersonalIncome" id="tmpMonthlyPersonalIncome" class="form-control gray-dropdown">
									<option value=""><fmt:message key="placeholder.monthly.personal.income" bundle="${msg}" /></option>
									<option disabled="disabled" selected="selected" value="${language == 'en' ? lifeEmploymentInfo.monthlyPersonalIncomeEnName:lifeEmploymentInfo.monthlyPersonalIncomeCnName}">${language == 'en' ? lifeEmploymentInfo.monthlyPersonalIncomeEnName:lifeEmploymentInfo.monthlyPersonalIncomeCnName}</option>
								</select>
								<input type="hidden" id="monthlyPersonalIncome" name="monthlyPersonalIncome" />
							</div>
					</div>
               </div>
				<div id="employerNameDiv" class="form-group application-summ">
							<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
								<input class="mdl-textfield__input so-mdl-textfield-input" type="text" autocomplete="off" id="currentEmployer" name="currentEmployer" value="${lifeEmploymentInfo.employerName }" readonly="readonly" />
								<label class="mdl-textfield__label" for="currentEmployer"><fmt:message key="placeholder.current.employer.name" bundle="${msg}" /></label>
							</div>
				</div>
                  <div id="natureOfBusinessDiv" class="form-group application-summ">
							<div class="selectDiv centreDiv gray-text-bg is-not-active">
								<label class="mdl-textfield__label cstm-dropdown-label"><fmt:message key="placeholder.nature.of.business" bundle="${msg}" /></label>
								<select name="tmpBusinessNature" id="tmpBusinessNature" class="form-control gray-dropdown">
									<option value=""><fmt:message key="placeholder.nature.of.business" bundle="${msg}" /></option>
									<option disabled="disabled" selected="selected" value="${language == 'en' ? lifeEmploymentInfo.natureOfBusinessEnName:lifeEmploymentInfo.natureOfBusinessCnName}">${language == 'en' ? lifeEmploymentInfo.natureOfBusinessEnName:lifeEmploymentInfo.natureOfBusinessCnName}</option>
								</select>
								<input type="hidden" id="natureOfBusiness" name="natureOfBusiness" />
							</div>
					</div>
                  <div id="occupationDiv" class="form-group application-summ">
							<div class="selectDiv centreDiv gray-text-bg is-not-active">
								<label class="mdl-textfield__label cstm-dropdown-label"><fmt:message key="placeholder.occupation" bundle="${msg}" /></label>
								<select name="tmpOccupation" id="tmpOccupation" class="form-control gray-dropdown">
									<option value=""><fmt:message key="placeholder.occupation" bundle="${msg}" /></option>
									<option disabled="disabled" selected="selected" value="${language == 'en' ? lifeEmploymentInfo.occupationEnName:lifeEmploymentInfo.occupationCnName}">${language == 'en' ? lifeEmploymentInfo.occupationEnName:lifeEmploymentInfo.occupationCnName}</option>
								</select>
								<input type="hidden" id="occupation" name="occupation" />
							</div>
					</div>
                  <div id="otherOccupationDiv" class="form-group application-summ">
							<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
								<input class="mdl-textfield__input so-mdl-textfield-input" type="text" autocomplete="off" id="otherOccupation" name="otherOccupation" value="${lifeEmploymentInfo.otherOccupation }" readonly="readonly" />
								<label class="mdl-textfield__label" for="otherOccupation">Please specify</label>
							</div>
					</div>
                  	<div id ="educationLevel" class="form-group application-summ">
							<div class="selectDiv centreDiv gray-text-bg is-not-active">
								<label class="mdl-textfield__label cstm-dropdown-label"><fmt:message key="placeholder.education.level" bundle="${msg}" /></label>
								<select name="tmpEducationLevel" id="tmpEducationLevel" class="form-control gray-dropdown">
									<option value=""><fmt:message key="placeholder.education-level" bundle="${msg}" /></option>
									<option disabled="disabled" selected="selected" value="${language == 'en' ? lifeEmploymentInfo.educationEnName:lifeEmploymentInfo.educationCnName}">${language == 'en' ? lifeEmploymentInfo.educationEnName:lifeEmploymentInfo.educationCnName}</option>
								</select>
								<input type="hidden" id="education" name="education" />
							</div>
					</div>

					<div class="desktop-left">
					<div id="amountOfOtherSourceOfIncomeDiv" class="form-group application-summ">
							<div class="selectDiv centreDiv gray-text-bg is-not-active">
								<label class="mdl-textfield__label cstm-dropdown-label"><fmt:message key="placeholder.other.sources.of.income" bundle="${msg}" /></label>
								<select name="tmpOtherIncomeAmount" id="tmpOtherIncomeAmount" class="form-control gray-dropdown">
									<option value=""><fmt:message key="placeholder.other.sources.of.income" bundle="${msg}" /></option>
									<option disabled="disabled" selected="selected" value="${language == 'en' ? lifeEmploymentInfo.amountOfOtherSourceOfIncomeEnName:lifeEmploymentInfo.amountOfOtherSourceOfIncomeCnName}">${language == 'en' ? lifeEmploymentInfo.amountOfOtherSourceOfIncomeEnName:lifeEmploymentInfo.amountOfOtherSourceOfIncomeCnName}</option>
								</select>
								<input type="hidden" id="amountOfOtherSourceOfIncome" name="amountOfOtherSourceOfIncome" />
							</div>
					</div>
					</div>
					<div class="desktop-right">
						<div id="amountOfLiquidAssetsDiv" class="form-group application-summ">
							<div class="selectDiv centreDiv gray-text-bg is-not-active">
								<label class="mdl-textfield__label cstm-dropdown-label"><fmt:message key="placeholder.liquid.assets" bundle="${msg}" /></label>
								<select name="tmpLiquidAssetsAmount" id="tmpLiquidAssetsAmount" class="form-control gray-dropdown">
									<option value=""><fmt:message key="placeholder.liquid.assets" bundle="${msg}" /></option>
									<option disabled="disabled" selected="selected" value="${language == 'en' ? lifeEmploymentInfo.amountOfLiquidAssetsEnName:lifeEmploymentInfo.amountOfLiquidAssetsCnName}">${language == 'en' ? lifeEmploymentInfo.amountOfLiquidAssetsEnName:lifeEmploymentInfo.amountOfLiquidAssetsCnName}</option>
								</select>
								<input type="hidden" id="amountOfLiquidAssets" name="amountOfLiquidAssets" />
							</div>
						</div>
					</div>
            </div>
            <div class="summary-section below-beneficiary clearfix">
               <h5><fmt:message key="savie.application.Beneficiary.info" bundle="${msg}" /> <a href="<%=request.getContextPath()%>/${language}/${plan }/beneficiary-info?backSummary=Y"><div id="benefInfo"><fmt:message key="label.edit" bundle="${msg}" /></div></a></h5>
		       <c:if test="${lifeBeneficaryInfo.isOwnEstate == 'true' }">
		             <div class="desktop-left">
			            <div class="form-group application-summ">
						   <div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
								<input class="mdl-textfield__input so-mdl-textfield-input" type="text" autocomplete="off" id="isOwnEstate" name="isOwnEstate" value="<fmt:message key="option.own.estate" bundle="${msg}" />" readonly="readonly" />
								<label class="mdl-textfield__label" for="isOwnEstate"><fmt:message key="label.beneficiary.info" bundle="${msg}" /></label>
						   </div>
						</div>
					 </div>
		       </c:if>
            </div>
            <c:choose>
			       <c:when test="${lifeBeneficaryInfo.isOwnEstate == 'true' }">
			       </c:when>
			       <c:otherwise>
			          <c:if test="${lifeBeneficaryInfo.beneficaryFirstName1 != '' }">
				          <div class="summary-section inner-beneficiary beneficiary-first clearfix">
				               <span class="person-count first-person"><fmt:message key="label.bene1" bundle="${msg}" /></span>
				               <div class="desktop-left">
				                  <div class="form-group application-summ">
											<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
												<input class="mdl-textfield__input so-mdl-textfield-input" type="text" autocomplete="off" id="beneficiaryLastName[0]" name="beneficiaryLastName[0]" value="${lifeBeneficaryInfo.beneficaryLastName1 }" readonly="readonly" />
												<label class="mdl-textfield__label" for="beneficiaryLastName[0]"><fmt:message key="placeholder.last.name" bundle="${msg}" /></label>
											</div>
										</div>
				                  <div class="form-group application-summ">
											<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
												<input class="mdl-textfield__input so-mdl-textfield-input" type="text" autocomplete="off" id="beneficiaryFirstName[0]" name="beneficiaryFirstName[0]" value="${lifeBeneficaryInfo.beneficaryFirstName1 }" readonly="readonly" />
												<label class="mdl-textfield__label" for="beneficiaryFirstName[0]"><fmt:message key="placeholder.first.name" bundle="${msg}" /></label>
											</div>
										</div>
				                  <div class="form-group application-summ">
											<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
												<input class="mdl-textfield__input so-mdl-textfield-input ch" type="text" autocomplete="off" id="beneficiaryChineseName[0]" name="beneficiaryChineseName[0]" value="${lifeBeneficaryInfo.beneficaryChineseName1 }" readonly="readonly" />
												<label class="mdl-textfield__label" for="beneficiaryChineseName[0]"><fmt:message key="placeholder.chinese.name" bundle="${msg}" /></label>
											</div>
										</div>
				                  <div class="form-group application-summ">
											<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
												<input class="mdl-textfield__input so-mdl-textfield-input" type="text" autocomplete="off" id="beneficiaryHkid[0]" name="beneficiaryHkid[0]" value="${lifeBeneficaryInfo.beneficiaryHkidPassport1 == 'passport' ? lifeBeneficaryInfo.beneficiaryPassport1:lifeBeneficaryInfo.beneficaryID1 }" readonly="readonly" />
												<label class="mdl-textfield__label" for="beneficiaryHkid[0]">${language=='en'?lifeBeneficaryInfo.beneficiaryHkidPassport1 == "passport" ? "Passport":"HKID":lifeBeneficaryInfo.beneficiaryHkidPassport1 == "passport" ? "護照號碼":"香港身份證" }</label>
											</div>
										</div>
				               </div>
				               <div class="desktop-right">
				                  <div class="form-group application-summ">
											<div class="selectDiv centreDiv gray-text-bg is-not-active">
												<label class="mdl-textfield__label cstm-dropdown-label"><fmt:message key="placeholder.relation" bundle="${msg}" /></label>
												<select name="tmpBeneficiaryRelationship[0]" id="tmpBeneficiaryRelationship[0]" class="form-control gray-dropdown">
													<option value=""><fmt:message key="placeholder.relation" bundle="${msg}" /></option>
													<option disabled="disabled" selected="selected" value="${language == 'en' ? lifeBeneficaryInfo.beneficaryRelationEnName1:lifeBeneficaryInfo.beneficaryRelationCnName1 }">${language == 'en' ? lifeBeneficaryInfo.beneficaryRelationEnName1:lifeBeneficaryInfo.beneficaryRelationCnName1 }</option>
												</select>
												<input type="hidden" id="beneficaryRelation1" name="beneficaryRelation1" />
											</div>
										</div>
				                  <div class="form-group application-summ">
											<div class="selectDiv centreDiv gray-text-bg is-not-active">
												<label class="mdl-textfield__label cstm-dropdown-label"><fmt:message key="placeholder.gender" bundle="${msg}" /></label>
												<select name="tmpBeneficiaryGender[0]" id="tmpBeneficiaryGender[0]" class="form-control gray-dropdown">
													<option value=""><fmt:message key="placeholder.gender" bundle="${msg}" /></option>
													<option disabled="disabled" selected="selected" value="${language=='en'?lifeBeneficaryInfo.beneficaryGender1:lifeBeneficaryInfo.beneficaryGender1=='male'?'男':'女' }">${language=='en'?lifeBeneficaryInfo.beneficaryGender1:lifeBeneficaryInfo.beneficaryGender1=='male'?'男':'女' }</option>
												</select>
												<input type="hidden" id="beneficaryGender1" name="beneficaryGender1" />
											</div>
										</div>
				                  <div class="form-group application-summ">
											<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
												<input class="mdl-textfield__input so-mdl-textfield-input" type="text" autocomplete="off" id="beneficiaryEntitlement[0]" name="beneficiaryEntitlement[0]" value="${lifeBeneficaryInfo.beneficaryWeight1 }%" readonly="readonly" />
												<label class="mdl-textfield__label" for="beneficiaryEntitlement[0]"><fmt:message key="placeholder.entitlement" bundle="${msg}" /></label>
											</div>
										</div>
				               </div>
							</div>
						</c:if>
						<c:if test="${lifeBeneficaryInfo.beneficaryFirstName2 != '' }">
							<div class="summary-section inner-beneficiary clearfix">
							   <span class="person-count"><fmt:message key="label.bene2" bundle="${msg}" /></span>
				               <div class="desktop-left">
				                  <div class="form-group application-summ">
											<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
												<input class="mdl-textfield__input so-mdl-textfield-input" type="text" autocomplete="off" id="beneficiaryLastName[1]" name="beneficiaryLastName[1]" value="${lifeBeneficaryInfo.beneficaryLastName2 }" readonly="readonly" />
												<label class="mdl-textfield__label" for="beneficiaryLastName[1]"><fmt:message key="placeholder.last.name" bundle="${msg}" /></label>
											</div>
										</div>
				                  <div class="form-group application-summ">
											<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
												<input class="mdl-textfield__input so-mdl-textfield-input" type="text" autocomplete="off" id="beneficiaryFirstName[1]" name="beneficiaryFirstName[1]" value="${lifeBeneficaryInfo.beneficaryFirstName2 }" readonly="readonly" />
												<label class="mdl-textfield__label" for="beneficiaryFirstName[1]"><fmt:message key="placeholder.first.name" bundle="${msg}" /></label>
											</div>
										</div>
				                  <div class="form-group application-summ">
											<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
												<input class="mdl-textfield__input so-mdl-textfield-input ch" type="text" autocomplete="off" id="beneficiaryChineseName[1]" name="beneficiaryChineseName[1]" value="${lifeBeneficaryInfo.beneficaryChineseName2 }" readonly="readonly" />
												<label class="mdl-textfield__label" for="beneficiaryChineseName[1]"><fmt:message key="placeholder.chinese.name" bundle="${msg}" /></label>
											</div>
										</div>
				                  <div class="form-group application-summ">
											<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
												<input class="mdl-textfield__input so-mdl-textfield-input" type="text" autocomplete="off" id="beneficiaryHkid[1]" name="beneficiaryHkid[1]" value="${lifeBeneficaryInfo.beneficiaryHkidPassport2 == 'passport' ? lifeBeneficaryInfo.beneficiaryPassport2:lifeBeneficaryInfo.beneficaryID2 }" readonly="readonly" />
												<label class="mdl-textfield__label" for="beneficiaryHkid[1]">${language=='en'?lifeBeneficaryInfo.beneficiaryHkidPassport2 == "passport" ? "Passport":"HKID":lifeBeneficaryInfo.beneficiaryHkidPassport2 == "passport" ? "護照號碼":"香港身份證" }</label>
											</div>
										</div>
				               </div>
				               <div class="desktop-right">
				                  <div class="form-group application-summ">
											<div class="selectDiv centreDiv gray-text-bg is-not-active">
												<label class="mdl-textfield__label cstm-dropdown-label"><fmt:message key="placeholder.relation" bundle="${msg}" /></label>
												<select name="tmpBeneficiaryRelationship[1]" id="tmpBeneficiaryRelationship[1]" class="form-control gray-dropdown">
													<option value=""><fmt:message key="placeholder.relation" bundle="${msg}" /></option>
													<option disabled="disabled" selected="selected" value="${language == 'en' ? lifeBeneficaryInfo.beneficaryRelationEnName2:lifeBeneficaryInfo.beneficaryRelationCnName2 }">${language == 'en' ? lifeBeneficaryInfo.beneficaryRelationEnName2:lifeBeneficaryInfo.beneficaryRelationCnName2 }</option>
												</select>
												<input type="hidden" id="beneficaryRelation2" name="beneficaryRelation2" />
											</div>
										</div>
				                  <div class="form-group application-summ">
											<div class="selectDiv centreDiv gray-text-bg is-not-active">
												<label class="mdl-textfield__label cstm-dropdown-label"><fmt:message key="placeholder.gender" bundle="${msg}" /></label>
												<select name="tmpBeneficiaryGender[1]" id="tmpBeneficiaryGender[1]" class="form-control gray-dropdown">
													<option value=""><fmt:message key="placeholder.gender" bundle="${msg}" /></option>
													<option disabled="disabled" selected="selected" value="${language=='en'?lifeBeneficaryInfo.beneficaryGender2:lifeBeneficaryInfo.beneficaryGender2=='male'?'男':'女' }">${language=='en'?lifeBeneficaryInfo.beneficaryGender2:lifeBeneficaryInfo.beneficaryGender2=='male'?'男':'女' }</option>
												</select>
												<input type="hidden" id="beneficiaryGender[1]" name="beneficiaryGender[1]" />
											</div>
										</div>
				                  <div class="form-group application-summ">
											<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
												<input class="mdl-textfield__input so-mdl-textfield-input" type="text" autocomplete="off" id="beneficiaryEntitlement[1]" name="beneficiaryEntitlement[1]" value="${lifeBeneficaryInfo.beneficaryWeight2 }%" readonly="readonly" />
												<label class="mdl-textfield__label" for="beneficiaryEntitlement[1]"><fmt:message key="placeholder.entitlement" bundle="${msg}" /></label>
											</div>
										</div>
				               </div>
							</div>
						</c:if>
						<c:if test="${lifeBeneficaryInfo.beneficaryFirstName3 != '' }">
							<div class="summary-section inner-beneficiary clearfix">
							   <span class="person-count"><fmt:message key="label.bene3" bundle="${msg}" /></span>
				               <div class="desktop-left">
				                  <div class="form-group application-summ">
											<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
												<input class="mdl-textfield__input so-mdl-textfield-input" type="text" autocomplete="off" id="beneficiaryLastName[2]" name="beneficiaryLastName[2]" value="${lifeBeneficaryInfo.beneficaryLastName3 }" readonly="readonly" />
												<label class="mdl-textfield__label" for="beneficiaryLastName[2]"><fmt:message key="placeholder.last.name" bundle="${msg}" /></label>
											</div>
										</div>
				                  <div class="form-group application-summ">
											<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
												<input class="mdl-textfield__input so-mdl-textfield-input" type="text" autocomplete="off" id="beneficiaryFirstName[2]" name="beneficiaryFirstName[2]" value="${lifeBeneficaryInfo.beneficaryFirstName3 }" readonly="readonly" />
												<label class="mdl-textfield__label" for="beneficiaryFirstName[2]"><fmt:message key="placeholder.first.name" bundle="${msg}" /></label>
											</div>
										</div>
				                  <div class="form-group application-summ">
											<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
												<input class="mdl-textfield__input so-mdl-textfield-input ch" type="text" autocomplete="off" id="beneficiaryChineseName[2]" name="beneficiaryChineseName[2]" value="${lifeBeneficaryInfo.beneficaryChineseName3 }" readonly="readonly" />
												<label class="mdl-textfield__label" for="beneficiaryChineseName[2]"><fmt:message key="placeholder.chinese.name" bundle="${msg}" /></label>
											</div>
										</div>
				                  <div class="form-group application-summ">
											<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
												<input class="mdl-textfield__input so-mdl-textfield-input" type="text" autocomplete="off" id="beneficiaryHkid[2]" name="beneficiaryHkid[2]" value="${lifeBeneficaryInfo.beneficiaryHkidPassport3 == 'passport' ? lifeBeneficaryInfo.beneficiaryPassport3:lifeBeneficaryInfo.beneficaryID3 }" readonly="readonly" />
												<label class="mdl-textfield__label" for="beneficiaryHkid[2]">${language=='en'?lifeBeneficaryInfo.beneficiaryHkidPassport3 == "passport" ? "Passport":"HKID":lifeBeneficaryInfo.beneficiaryHkidPassport3 == "passport" ? "護照號碼":"香港身份證" }</label>
											</div>
										</div>
				               </div>
				               <div class="desktop-right">
				                  <div class="form-group application-summ">
											<div class="selectDiv centreDiv gray-text-bg is-not-active">
												<label class="mdl-textfield__label cstm-dropdown-label"><fmt:message key="placeholder.relation" bundle="${msg}" /></label>
												<select name="tmpBeneficiaryRelationship[2]" id="tmpBeneficiaryRelationship[2]" class="form-control gray-dropdown">
													<option value=""><fmt:message key="placeholder.relation" bundle="${msg}" /></option>
													<option disabled="disabled" selected="selected" value="${language == 'en' ? lifeBeneficaryInfo.beneficaryRelationEnName3:lifeBeneficaryInfo.beneficaryRelationCnName3 }">${language == 'en' ? lifeBeneficaryInfo.beneficaryRelationEnName3:lifeBeneficaryInfo.beneficaryRelationCnName3 }</option>
												</select>
												<input type="hidden" id="beneficaryRelation3" name="beneficaryRelation3" />
											</div>
										</div>
				                  <div class="form-group application-summ">
											<div class="selectDiv centreDiv gray-text-bg is-not-active">
												<label class="mdl-textfield__label cstm-dropdown-label"><fmt:message key="placeholder.gender" bundle="${msg}" /></label>
												<select name="tmpBeneficiaryGender[2]" id="tmpBeneficiaryGender[2]" class="form-control gray-dropdown">
													<option value=""><fmt:message key="placeholder.gender" bundle="${msg}" /></option>
													<option disabled="disabled" selected="selected" value="${language=='en'?lifeBeneficaryInfo.beneficaryGender3:lifeBeneficaryInfo.beneficaryGender3=='male'?'男':'女' }">${language=='en'?lifeBeneficaryInfo.beneficaryGender3:lifeBeneficaryInfo.beneficaryGender3=='male'?'男':'女' }</option>
												</select>
												<input type="hidden" id="beneficaryGender3" name="beneficaryGender3" />
											</div>
										</div>
				                  <div class="form-group application-summ">
											<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
												<input class="mdl-textfield__input so-mdl-textfield-input" type="text" autocomplete="off" id="beneficiaryEntitlement[2]" name="beneficiaryEntitlement[2]" value="${lifeBeneficaryInfo.beneficaryWeight3 }%" readonly="readonly" />
												<label class="mdl-textfield__label" for="beneficiaryEntitlement[2]"><fmt:message key="placeholder.entitlement" bundle="${msg}" /></label>
											</div>
										</div>
				               </div>
				            </div>
			            </c:if>
			       </c:otherwise>
			</c:choose>
			<c:if test="${plan == 'savings-insurance'}">
            <div class="summary-section below-payment clearfix">
               <h5><fmt:message key="label.payment.info" bundle="${msg}" /> <a href="<%=request.getContextPath()%>/${language}/savings-insurance/payment?backSummary=Y"><div id="payInfo"><fmt:message key="label.edit" bundle="${msg}" /></div></a></h5>
               <div class="desktop-left">
                  <div class="form-group application-summ">
							<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
								<input class="mdl-textfield__input so-mdl-textfield-input" type="text" autocomplete="off" id="amount" name="amount" value="HK$ ${saviePlanDetails.insuredAmount1 }" readonly="readonly" />
								<label class="mdl-textfield__label" for="amount"><fmt:message key="placeholder.amount1" bundle="${msg}" /></label>
							</div>
						</div>
						<c:if test="${saviePlanDetails.insuredAmountDiscount!=null && saviePlanDetails.insuredAmountDiscount!='0'}">
							<div class="form-group application-summ">
								<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
									<input class="mdl-textfield__input so-mdl-textfield-input" type="text" autocomplete="off" id="amountDiscount" name="amountDiscount" value="HK$ <fmt:formatNumber pattern="#,###" value="${saviePlanDetails.insuredAmountDiscount}"/>" readonly="readonly" />
									<label class="mdl-textfield__label" for="amountDiscount"><fmt:message key="placeholder.amount.discount" bundle="${msg}" /></label>
								</div>
							</div>
							<div class="form-group application-summ">
								<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
									<input class="mdl-textfield__input so-mdl-textfield-input" type="text" autocomplete="off" id="amountDue" name="amountDue" value="HK$ <fmt:formatNumber pattern="#,###" value="${saviePlanDetails.insuredAmountDue}"/>" readonly="readonly" />
									<label class="mdl-textfield__label" for="amountDue"><fmt:message key="placeholder.amount.due" bundle="${msg}" /></label>
								</div>
							</div>
						</c:if>
                  <div class="form-group application-summ">
							<div class="selectDiv centreDiv gray-text-bg is-not-active">
								<label class="mdl-textfield__label cstm-dropdown-label"><fmt:message key="placeholder.direct.debit" bundle="${msg}" /></label>
								<select name="tmpPaymentMethod" id="tmpPaymentMethod" class="form-control gray-dropdown">
									<option value=""><fmt:message key="placeholder.direct.debit" bundle="${msg}" /></option>
									<option disabled="disabled" selected="selected" value="${language=='en'?lifePayment.paymentMethod:'自動轉賬' }">${language=='en'?lifePayment.paymentMethod:'自動轉賬' }</option>
								</select>
								<input type="hidden" id="paymentMethod" name="paymentMethod" />
							</div>
						</div>
                  <div class="form-group application-summ">
							<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
								<input class="mdl-textfield__input so-mdl-textfield-input" type="text" autocomplete="off" id="accountHolderName" name="accountHolderName" value="${lifePayment.accountHolderName }" readonly="readonly" />
								<label class="mdl-textfield__label" for="accountHolderName"><fmt:message key="placeholder.account.name" bundle="${msg}" /></label>
							</div>
						</div>
               </div>
               <div class="desktop-right">
                  <div class="form-group application-summ">
							<div class="selectDiv centreDiv gray-text-bg is-not-active">
								<label class="mdl-textfield__label cstm-dropdown-label"><fmt:message key="placeholder.bank.name" bundle="${msg}" /></label>
								<select name="tmpBankName" id="tmpBankName" class="form-control gray-dropdown">
									<option value=""><fmt:message key="placeholder.bank.name" bundle="${msg}" /></option>
									<option disabled="disabled" selected="selected" value="${language == 'en' ? lifePayment.bankEnName:lifePayment.bankCnName}">${language == 'en' ? lifePayment.bankEnName:lifePayment.bankCnName}</option>
								</select>
								<input type="hidden" id="bankName" name="bankName" />
							</div>
						</div>
                  <div class="form-group application-summ">
							<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-dirty is-upgraded is-not-active">
								<input class="mdl-textfield__input so-mdl-textfield-input" type="text" autocomplete="off" id="accountNo" name="accountNo" value="${lifePayment.accountNumber }" readonly="readonly" />
								<label class="mdl-textfield__label" for="accountNo"><fmt:message key="placeholder.account.no" bundle="${msg}" /></label>
							</div>
						</div>
                  <div class="form-group application-summ">
							<div class="selectDiv centreDiv gray-text-bg is-not-active">
								<label class="mdl-textfield__label cstm-dropdown-label"><fmt:message key="placeholder.branch.name" bundle="${msg}" /></label>
								<select name="tmpBranchName" id="tmpBranchName" class="form-control gray-dropdown">
									<option value=""><fmt:message key="placeholder.branch.name" bundle="${msg}" /></option>
									<option disabled="disabled" selected="selected" value="${language == 'en' ? lifePayment.branchEnName:lifePayment.branchCnName}">${language == 'en' ? lifePayment.branchEnName:lifePayment.branchCnName}</option>
								</select>
								<input type="hidden" id="branchName" name="branchName" />
							</div>
						</div>
               </div>
            </div>
            </c:if>
			<c:if test="${plan == 'medical-insurance'}">
			<div class="clearfix">
				<h5><fmt:message key="label.confirm.Insurance" bundle="${msg}" /></h5>
				<ul>
					<li><fmt:message key="underwriting.question.q1.copy" bundle="${msg}" /></li>
					<li><fmt:message key="underwriting.question.q2.copy" bundle="${msg}" /></li>
					<li><fmt:message key="underwriting.question.q3.copy" bundle="${msg}" /></li>
				</ul>
				<fmt:message key="underwriting.declaration" bundle="${msg}" />
			</div>
			</c:if>
            <div class="text-center clearfix">
					<button id="next-wait-btn" type="button" class="btn savie-common-btn" data-wait="10" disabled></button>
               <button id="next-btn" class="btn savie-common-btn hide" type="button" onclick="goNext()"><fmt:message key="button.Next" bundle="${msg}" /></button>
                <c:if test="${plan == 'savings-insurance'}">
                   <a href="#" id="as-save-and-con" class="as-save-con" data-toggle="modal" data-target="#save-and-continue-batch5-modal">
               	   <span><fmt:message key="label.save.and.continue.later" bundle="${msg}" /></span></a>
                </c:if>
            </div>
         </div>
			<!-- FOOTER -->
		</div>
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

			function goNext(){
					window.location = '<%=request.getContextPath()%>/${language}/${nextPageFlow}';
			}
		$(document).ready(function() {
			
			var planSelected ='${planIndex}';
			if(planSelected=='medical-insurance/cansurance'){
				$('#PlanSelected').addClass('hidden');
				$('#PersonInformation').addClass('hidden');
				$('#employmentInfo').addClass('hidden');
				$('#benefInfo').addClass('hidden');
				$('#payInfo').addClass('hidden');
				
				
				$('#planName').val('Medical Guardian');
				
				
			} 
			
			var employmentS = '${plan == "savings-insurance" ? savieFna.employment_status : lifeEmploymentInfo.employmentStatus}';
			if(employmentS == 'ES4' || employmentS == 'ES5' || employmentS == 'ES7' || employmentS == 'ES6'){
				$('#amountOfOtherSourceOfIncomeDiv').removeClass('hidden');
				$('#amountOfLiquidAssetsDiv').removeClass('hidden');
				$('#natureOfBusinessDiv').addClass('hidden');
				$('#occupationDiv').addClass('hidden');
				$('#employerNameDiv').addClass('hidden');
				$('#monthlyPersonalIncomeDiv').addClass('hidden');
				$('#otherOccupationDiv').addClass('hidden');
				$('#spaceHolder').removeClass('hidden');
			}
			else{
				$('#amountOfOtherSourceOfIncomeDiv').addClass('hidden');
				$('#amountOfLiquidAssetsDiv').addClass('hidden');
				$('#natureOfBusinessDiv').removeClass('hidden');
				$('#occupationDiv').removeClass('hidden');
				$('#employerNameDiv').removeClass('hidden');
				$('#monthlyPersonalIncomeDiv').removeClass('hidden');

				$('#spaceHolder').addClass('hidden');

				if('${savieFna.nature_of_business }' == 'NoB23' && '${savieFna.occupation }' == 'NoBD16' && '${savieFna.occupation_others }' != null && '${savieFna.occupation_others }' != ''){
					$('#otherOccupationDiv').removeClass('hidden');
				}
				else{
					$('#otherOccupationDiv').addClass('hidden');
				}
			}



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
			setSelectReadonly('tmpPermanentDistrict', true);
			setInputReadonly('residentialAddress1', true);
			setInputReadonly('residentialAddress2', true);
			setInputReadonly('residentialAddress3', true);
			setSelectReadonly('tmpResidentialDistrict', true);
			setInputReadonly('correspondenceAddress1', true);
			setInputReadonly('correspondenceAddress2', true);
			setInputReadonly('correspondenceAddress3', true);
			setSelectReadonly('tmpCorrespondenceDistrict', true);
			setInputReadonly('theClubMembershipNo', true);
			//Employment info
			setSelectReadonly('tmpEmploymentStatus', true);
			setSelectReadonly('tmpBusinessNature', true);
			setSelectReadonly('tmpOccupation', true);
			setInputReadonly('otherOccupation', true);
			setInputReadonly('currentEmployer', true);
			setSelectReadonly('tmpMonthlyPersonalIncome', true);
			setSelectReadonly('tmpEducationLevel', true);
			setSelectReadonly('tmpOtherIncomeAmount', true);
			setSelectReadonly('tmpLiquidAssetsAmount', true);
			// Beneficiary info
			setInputReadonly('beneficiaryLastName\\[0\\]', true);
			setInputReadonly('beneficiaryFirstName\\[0\\]', true);
			setInputReadonly('beneficiaryChineseName\\[0\\]', true);
			setInputReadonly('beneficiaryHkid\\[0\\]', true);
			setSelectReadonly('tmpBeneficiaryRelationship\\[0\\]', true);
			setSelectReadonly('tmpBeneficiaryGender\\[0\\]', true);
			setInputReadonly('beneficiaryEntitlement\\[0\\]', true);
			setInputReadonly('beneficiaryLastName\\[1\\]', true);
			setInputReadonly('beneficiaryFirstName\\[1\\]', true);
			setInputReadonly('beneficiaryChineseName\\[1\\]', true);
			setInputReadonly('beneficiaryHkid\\[1\\]', true);
			setSelectReadonly('tmpBeneficiaryRelationship\\[1\\]', true);
			setSelectReadonly('tmpBeneficiaryGender\\[1\\]', true);
			setInputReadonly('beneficiaryEntitlement\\[1\\]', true);
			setInputReadonly('beneficiaryLastName\\[2\\]', true);
			setInputReadonly('beneficiaryFirstName\\[2\\]', true);
			setInputReadonly('beneficiaryChineseName\\[2\\]', true);
			setInputReadonly('beneficiaryHkid\\[2\\]', true);
			setSelectReadonly('tmpBeneficiaryRelationship\\[2\\]', true);
			setSelectReadonly('tmpBeneficiaryGender\\[2\\]', true);
			setInputReadonly('beneficiaryEntitlement\\[2\\]', true);
			// Payment info
			setInputReadonly('amount', true);
			setSelectReadonly('tmpPaymentMethod', true);
			setInputReadonly('accountHolderName', true);
			setSelectReadonly('tmpBankName', true);
			setInputReadonly('accountNo', true);
			setSelectReadonly('tmpBranchName', true);


			// Set timer for confirm and sign button
			var $next_btn = $('#next-btn');
			var $next_wait_btn = $('#next-wait-btn');
			var waitSecond = 0;
			if (waitSecond <= 0) {
				waitSecond = parseInt($next_wait_btn.data('wait'), 8);
				$next_wait_btn.text('(' + waitSecond + ')');
				var waitInterval = setInterval(function(){
					waitSecond--;
					$next_wait_btn.text('(' + waitSecond + ')');
					if (waitSecond <= 0) {
						$next_wait_btn.addClass('hide');
						$next_btn.removeClass('hide');
						clearInterval(waitInterval);
					};
				}, 1000);
			}

		});

		$('.save-exit-btn1').click(function() {
			$('#save-and-continue-modal').modal('hide');
		});

        $('#keep-going-btn').click(function() {
			$('#save-and-continue-batch5-modal').modal('hide');
		});

		//full fill type = 2
		$('#save-exit-btn').click(function() {
			$("#errorMsg").html("");
			$.ajax({
				  type : "POST",
				  async:false,
				  url : "<%=request.getContextPath()%>/ajax/savings-insurance/applicationSummarySaveforLater",
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
		</script>
	</body>
</html>
