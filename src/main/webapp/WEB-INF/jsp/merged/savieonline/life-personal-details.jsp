<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeQuoteBean"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<div style="margin-left: 500px;">
<div id="errorMsg" style="color: red;"></div>
<div class="container-fluid fwd-container et-personal-info">
	<div id="personal-info"
		class="personal-info-widget page-application et-application-page">
		<h2>
			<fmt:message key="eliteTerms.selectPlan.person.info"
			bundle="${msg}" />
		<button type="button" class="tooltip-button btn-app-info-tooltip"
			title="<fmt:message key="eliteTerms.selectPlan.Applicant.and.the.insured" bundle="${msg}" />">
			<span class="info-tooltip"></span>
		</button>
	</h2>

	<form id="lifePersonalDetailsForm" method="post" class="form-horizontal" action="" onSubmit="return false;">
		<div class="row margin">
			<div class="col-sm-12 col-md-6 left">

				<div class="clearfix">
					<div class="left-desktop description">
						<label for="give-last-name"
							class="application-page-input-text et-input-label"><fmt:message
								key="eliteTerms.selectPlan.Name.in.English" bundle="${msg}" />
							<span><fmt:message
									key="eliteTerms.selectPlan.Same.as.HKID" bundle="${msg}" /></span></label>
					</div>
					<div class="left-desktop text-box form-group">
						<input class="form-control gray-textbox" autocomplete="off"
							id="firstname"
							name="firstname" type="text" autocomplete="off"
							placeholder="<fmt:message key="eliteTerms.selectPlan.Given.Name" bundle="${msg}" />"
							value="${userDetails.firstName }" readonly="readonly">
						<span class="error-msg" id="savieApplicantBeanFirstNameMsg"></span>
						<input class="form-control gray-textbox" autocomplete="off"
							id="lastname"
							name="lastname" type="text" autocomplete="off"
							placeholder="<fmt:message key="eliteTerms.selectPlan.Last.Name" bundle="${msg}" />"
							value="${userDetails.lastName }" readonly="readonly">
						<span class="error-msg" id="savieApplicantBeanlastNameMsg"></span>
					</div>
				</div>

				<div class="clearfix">
					<div class="left-desktop description">
						<label for="savieApplicantBean.chineseName"
							class="application-page-input-text et-input-label"><fmt:message
								key="eliteTerms.selectPlan.Name.in.Chinese" bundle="${msg}" />
							<span><fmt:message
									key="eliteTerms.selectPlan.Same.as.cn.HKID"
									bundle="${msg}" /></span></label>
					</div>
					<div class="left-desktop text-box">
						<input class="form-control gray-textbox" autocomplete="off"
							id=""
							name="chineseName" type="text" autocomplete="off"
							placeholder="<fmt:message key="eliteTerms.selectPlan.Name.in.Chinese" bundle="${msg}" />"
							value="${lifePersonalDetails.chineseName }"> <span class="error-msg"
							id="savieApplicantBeanchineseNameMsg"></span>
					</div>
				</div>

				<div class="clearfix form-group">
					<div class="left-desktop description">
						<label for="sales-illu-dob"
							class="application-page-input-text et-input-label"><fmt:message
								key="eliteTerms.selectPlan.Date.of.birth" bundle="${msg}" /></label>
					</div>
					<div class="left-desktop text-box et-date-info clearfix">
						<div class="clearfix">
							<input type="text" autocomplete="off"
								class="form-control gray-textbox pull-left et-80-width"
								name="dob" id="dob"
								placeholder="<fmt:message key="eliteTerms.selectPlan.Date.of.birth.placeholder" bundle="${msg}" />"
								onfocusin="fnSetStyle()" readonly
								value="${savieFna.dob }" />
							<div class="et-app-edit-wrapper">
								<a href="#" title="Edit Date of birth"
									class="et-app-sum-edit et-app-edit" id="edit-birthday"
									data-target="#et-about-yoursel-section"> <span
									class="text-center"> <fmt:message
											key="eliteTerms.selectPlan.Edit" bundle="${msg}" />
								</span>
								</a>
							</div>
						</div>
						<span class="error-msg" id="sales-illu-dob-msg"></span>
					</div>
				</div>

				<div class="clearfix">
					<div class="left-desktop description">
						<label for="savieApplicantBean.gender"
							class="application-page-input-text et-input-label"><fmt:message
								key="eliteTerms.selectPlan.Gender" bundle="${msg}" /></label>
					</div>
					<div class="left-desktop text-box et-date-info clearfix">
						    <input type="hidden" name="gender" id="gender" value="${savieFna.gender }" /> 
							<input type="text" autocomplete="off" id="gender" class="form-control gray-textbox pull-left et-80-width"
							       placeholder="<fmt:message key="eliteTerms.selectPlan.Gender" bundle="${msg}" />"
							       value="${savieFna.gender }" />
						<div class="et-app-edit-wrapper">
							<a href="#" title="Edit Gender"
								class="et-app-sum-edit et-app-edit" id="edit-gender"
								data-target="#et-about-yoursel-section"> <span
								class="text-center"> <fmt:message
										key="eliteTerms.selectPlan.Edit" bundle="${msg}" />
							</span>
							</a>
						</div>
					</div>
				</div>

				<div class="clearfix form-group has-error">
					<div class="left-desktop description">
						<label for="savieApplicantBean.hkId"
							class="application-page-input-text et-input-label"><fmt:message
								key="eliteTerms.selectPlan.HKID" bundle="${msg}" /></label>
					</div>
					<div class="left-desktop text-box">
						<input class="form-control gray-textbox capitalize"
							autocomplete="off" id="hkid"
							name="hkid" type="text" autocomplete="off" value="${lifePersonalDetails.hkid }"
							placeholder="<fmt:message key="eliteTerms.selectPlan.HKID.placeholder" bundle="${msg}" />">
						<span class="error-msg" id="hkidMessage"></span>
					</div>
				</div>

				<div class="clearfix  form-group has-error">
					<div class="left-desktop description">
						<label for="savieApplicantBean.maritalStatus"
							class="application-page-input-text et-input-label"><fmt:message
								key="eliteTerms.selectPlan.Marital.status" bundle="${msg}" /></label>
					</div>
					<div class="left-desktop text-box">

						<div class="selectDiv">
							<span class="icon-chevron-thin-down orange-caret"></span> <select
								class="form-control gray-dropdown"
								name="martialStatus"
								id="martialStatus">
								<option value=""><fmt:message key="eliteTerms.selectPlan.Please.select" bundle="${msg}" /></option>
								<c:if test="${language == 'en'}">
									<c:forEach var="list" items="${maritalStatusesEN}">
										<option value="${list.itemCode }-${list.itemDesc }" <c:if test="${lifePersonalDetails.martialStatus == list.itemCode}">selected="selected"</c:if>>${list.itemDesc }</option>
									</c:forEach>
								</c:if>
								<c:if test="${language == 'tc'}">
									<c:forEach var="list" items="${maritalStatusesCN}">
										<option value="${list.itemCode }-${list.itemDesc }" <c:if test="${lifePersonalDetails.martialStatus == list.itemCode}">selected="selected"</c:if>>${list.itemDesc }</option>
									</c:forEach>
								</c:if>
							</select>
						</div>
						<span class="error-msg" id="maritalStatusMessage"></span>
					</div>
				</div>

				<div class="clearfix form-group has-error">
					<div class="left-desktop description">
						<label for="savieApplicantBean.placeOfBirth"
							class="application-page-input-text et-input-label"><fmt:message
								key="eliteTerms.selectPlan.Place.of.birth" bundle="${msg}" /></label>
					</div>
					<div class="left-desktop text-box">
						<div class="selectDiv">
							<span class="icon-chevron-thin-down orange-caret"></span> <select
								class="form-control gray-dropdown"
								data-style="application-select selection"
								id="placeOfBirth"
								name="placeOfBirth">
								<option value=""><fmt:message
										key="eliteTerms.selectPlan.Please.select" bundle="${msg}" /></option>
								<c:if test="${language == 'en'}">
									<c:forEach var="list" items="${placeOfBirthEN}">
										<option value="${list.itemCode }-${list.itemDesc }" <c:if test="${lifePersonalDetails.placeOfBirth == list.itemCode}">selected="selected"</c:if>>${list.itemDesc }</option>
									</c:forEach>
								</c:if>
								<c:if test="${language == 'tc'}">
									<c:forEach var="list" items="${placeOfBirthCN}">
										<option value="${list.itemCode }-${list.itemDesc }" <c:if test="${lifePersonalDetails.placeOfBirth == list.itemCode}">selected="selected"</c:if>>${list.itemDesc }</option>
									</c:forEach>
								</c:if>
							</select>
						</div>
						<span class="error-msg" id="placeOfBirthMessage"></span>
					</div>
				</div>

				<div class="clearfix form-group has-error">
					<div class="left-desktop description">
						<label for="savieApplicantBean.nationality"
							class="application-page-input-text et-input-label"><fmt:message
								key="eliteTerms.selectPlan.Nationality" bundle="${msg}" /></label>
					</div>
					<div class="left-desktop text-box">
						<div class="selectDiv">
							<span class="icon-chevron-thin-down orange-caret"></span> <select
								class="form-control gray-dropdown"
								data-style="application-select selection"
								id="nationalty"
								name="nationalty">
								<option value=""><fmt:message
										key="eliteTerms.selectPlan.Please.select" bundle="${msg}" /></option>
								<c:if test="${language == 'en'}">
									<c:forEach var="list" items="${nationalityEN}">
										<option value="${list.itemCode }-${list.itemDesc }" <c:if test="${lifePersonalDetails.nationalty == list.itemCode}">selected="selected"</c:if>>${list.itemDesc }</option>
									</c:forEach>
								</c:if>
								<c:if test="${language == 'tc'}">
									<c:forEach var="list" items="${nationalityCN}">
										<option value="${list.itemCode }-${list.itemDesc }" <c:if test="${lifePersonalDetails.nationalty == list.itemCode}">selected="selected"</c:if>>${list.itemDesc }</option>
									</c:forEach>
								</c:if>
							</select>
						</div>
						<span class="error-msg" id="nationalityMessage"></span>
					</div>
				</div>

				<div class="clearfix form-group has-error">
					<div class="left-desktop right-description">
						<label for="savieApplicantBean.mobileNo"
							class="application-page-input-text et-input-label"><fmt:message
								key="eliteTerms.selectPlan.Mobile.no" bundle="${msg}" /></label>
					</div>
					<div class="left-desktop text-box clearfix">
						<input type="text" autocomplete="off" class="form-control gray-textbox"
							name="mobileNumber"
							id="mobileNumber"
							placeholder="<fmt:message key="eliteTerms.selectPlan.Mobile.no" bundle="${msg}" />"
							value="${userDetails.mobileNo }" maxlength="8" /> <span
							class="error-msg" id="mobileMessage"></span>
					</div>
				</div>

				<div class="clearfix form-group has-error">
					<div class="left-desktop right-description">
						<label for="savieApplicantBean.emailAddress"
							class="application-page-input-text et-input-label"><fmt:message
								key="eliteTerms.selectPlan.Email.address" bundle="${msg}" /></label>
					</div>
					<div class="left-desktop text-box">
						<input class="form-control gray-textbox" autocomplete="off"
							id="emailAddress"
							name="emailAddress" type="text" autocomplete="off"
							placeholder="<fmt:message key="eliteTerms.selectPlan.Email.address" bundle="${msg}" />"
							value="${userDetails.emailAddress }" readonly> <span
							class="error-msg" id="emailMessage"></span>
					</div>
				</div>
			</div>
			<div class="col-sm-12 col-md-6 right">
				<div class="clearfix form-group has-error">
					<div class="left-desktop right-description">
						<label for="inputdefault"
							class="application-page-input-text et-input-label"><fmt:message
								key="eliteTerms.selectPlan.Permanent.address"
								bundle="${msg}" /></label>
					</div>
					<div class="left-desktop text-box">
						<input class="form-control gray-textbox permanent-address"
							autocomplete="off" id="permanetAddress1" maxlength="29"
							name="permanetAddress1" type="text" autocomplete="off" value="${lifePersonalDetails.permanetAddress1 }"
							placeholder="<fmt:message key="eliteTerms.selectPlan.address.line1" bundle="${msg}" />">
						<span class="error-msg" id="permanentAddressMessage1"></span>
						<input
							class="form-control gray-textbox permanent-address optional-field"
							autocomplete="off" id="permanetAddress2" maxlength="29"
							name="permanetAddress2" type="text" autocomplete="off" value="${lifePersonalDetails.permanetAddress2 }"
							placeholder="<fmt:message key="eliteTerms.selectPlan.address.line2" bundle="${msg}" />">
						<span class="error-msg" id="permanentAddressMessage2"></span>
						<input
							class="form-control gray-textbox permanent-address optional-field"
							autocomplete="off" id="permanetAddress3" maxlength="19"
							name="permanetAddress3" type="text" autocomplete="off" value="${lifePersonalDetails.permanetAddress3 }"
							placeholder="<fmt:message key="eliteTerms.selectPlan.address.line3" bundle="${msg}" />">
						<span class="error-msg" id="permanentAddressMessage3"></span>
						<div class="selectDiv et-district-wrapper">
							<span class="icon-chevron-thin-down orange-caret"></span> <select
								class="form-control gray-dropdown "
								data-style="application-select selection"
								name="permanetAddressDistrict"
								id="permanetAddressDistrict">
								<option value=""><fmt:message
										key="eliteTerms.selectPlan.Please.District"
										bundle="${msg}" /></option>
								<c:if test="${language == 'en'}">
									<c:forEach var="list" items="${savieDistrictEN}">
										<option value="${list.itemCode }-${list.itemDesc }" <c:if test="${lifePersonalDetails.permanetAddressDistrict == list.itemCode}">selected="selected"</c:if>>${list.itemDesc }</option>
									</c:forEach>
								</c:if>
								<c:if test="${language == 'tc'}">
									<c:forEach var="list" items="${savieDistrictCN}">
										<option value="${list.itemCode }-${list.itemDesc }" <c:if test="${lifePersonalDetails.permanetAddressDistrict == list.itemCode}">selected="selected"</c:if>>${list.itemDesc }</option>
									</c:forEach>
								</c:if>
							</select>
						</div>
						<span class="error-msg" id="perAddressMessage"></span> <span
							class="warning-note"><span class="orange">*</span> <fmt:message
								key="eliteTerms.selectPlan.No.P.O.Box.address.allowed"
								bundle="${msg}" /></span>
					</div>
				</div>

				<!--start here -->
				<div class="clearfix">
					<div class="left-desktop description"></div>
					<div class="left-desktop check-box">
						<div class="checkbox-section">
							<div class="clearfix">
								<div class="pull-left left-checkbox">
									<input type="checkbox" value="true"
										id="savieApplicantBean.isResidential"
										name="savieApplicantBean.isResidential" /> <label
										for="savieApplicantBean.isResidential"></label>
								</div>
								<div class="pull-left right-checkbox">
									<span class="checkbox-text"><fmt:message
											key="eliteTerms.selectPlan.My.residential.address"
											bundle="${msg}" /></span>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div
					class="clearfix form-group has-error hidden et-residential-address"
					id="residential-address">
					<div class="left-desktop right-description">
						<label for="inputdefault"
							class="application-page-input-text et-input-label"><fmt:message
								key="eliteTerms.selectPlan.Residential.address"
								bundle="${msg}" /></label>
					</div>
					<div class="left-desktop text-box">
						<input
							class="form-control gray-textbox residential residential-address"
							autocomplete="off"
							id="residentialAddress1"
							name="residentialAddress1" type="text" autocomplete="off" value="${lifePersonalDetails.residentialAddress1 }"
							placeholder="<fmt:message key="eliteTerms.selectPlan.address.line1" bundle="${msg}" />">
						<span class="error-msg" id="residentialAddressMessage1"></span>
						<input
							class="form-control gray-textbox residential residential-address optional-field"
							autocomplete="off"
							id="residentialAddress2"
							name="residentialAddress2" type="text" autocomplete="off" value="${lifePersonalDetails.residentialAddress2 }"
							placeholder="<fmt:message key="eliteTerms.selectPlan.address.line2" bundle="${msg}" />">
						<span class="error-msg" id="residentialAddressMessage2"></span>
						<input
							class="form-control gray-textbox residential residential-address optional-field"
							autocomplete="off"
							id="residentialAddress3"
							name="residentialAddress3" type="text" autocomplete="off" value="${lifePersonalDetails.residentialAddress3 }"
							placeholder="<fmt:message key="eliteTerms.selectPlan.address.line3" bundle="${msg}" />">
						<span class="error-msg" id="residentialAddressMessage3"></span>
						<div class="selectDiv et-district-wrapper">
							<span class="icon-chevron-thin-down orange-caret"></span> <select
								class="form-control gray-dropdown"
								data-style="application-select selection"
								name="residentialAddressDistrict"
								id="residentialAddressDistrict">
								<option value=""><fmt:message
										key="eliteTerms.selectPlan.Please.District"
										bundle="${msg}" /></option>
								<c:if test="${language == 'en'}">
									<c:forEach var="list" items="${savieDistrictEN}">
										<option value="${list.itemCode }-${list.itemDesc }" <c:if test="${lifePersonalDetails.residentialAddressDistrict == list.itemCode}">selected="selected"</c:if>>${list.itemDesc }</option>
									</c:forEach>
								</c:if>
								<c:if test="${language == 'tc'}">
									<c:forEach var="list" items="${savieDistrictCN}">
										<option value="${list.itemCode }-${list.itemDesc }" <c:if test="${lifePersonalDetails.residentialAddressDistrict == list.itemCode}">selected="selected"</c:if>>${list.itemDesc }</option>
									</c:forEach>
								</c:if>
							</select>
						</div>
						<span class="error-msg" id="resDistrictMessage"></span> <span
							class="warning-note"><span class="orange">*</span> <fmt:message
								key="eliteTerms.selectPlan.No.P.O.Box.address.allowed"
								bundle="${msg}" /></span>
					</div>
				</div>

				<div class="clearfix">
					<div class="left-desktop description"></div>
					<div class="left-desktop check-box">
						<div class="checkbox-section">
							<div class="clearfix">
								<div class="pull-left left-checkbox">
									<input type="checkbox" value="true"
										id="savieApplicantBean.addressIsSame"
										name="savieApplicantBean.addressIsSame" /> <label
										for="savieApplicantBean.addressIsSame"></label>
								</div>
								<div class="pull-left right-checkbox">
									<span class="checkbox-text"><fmt:message
											key="eliteTerms.selectPlan.My.correspondence.address"
											bundle="${msg}" /></span>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div
					class="clearfix form-group has-error hidden et-correspondence-address"
					id="correspondence-address">
					<div class="left-desktop right-description">
						<label for="inputdefault"
							class="application-page-input-text et-input-label"><fmt:message
								key="eliteTerms.selectPlan.Correspondence.address"
								bundle="${msg}" /></label>
					</div>
					<div class="left-desktop text-box">
						<input
							class="form-control gray-textbox  correspondence-address"
							autocomplete="off"
							id="correspondenceAddress1"
							name="correspondenceAddress1" type="text" autocomplete="off" value="${lifePersonalDetails.correspondenceAddress1 }"
							placeholder="<fmt:message key="eliteTerms.selectPlan.address.line1" bundle="${msg}" />">
						<span class="error-msg" id="corrAddressMessage1"></span> <input
							class="form-control gray-textbox correspondence-address optional-field"
							autocomplete="off"
							id="correspondenceAddress2"
							name="correspondenceAddress2" type="text" autocomplete="off" value="${lifePersonalDetails.correspondenceAddress2 }"
							placeholder="<fmt:message key="eliteTerms.selectPlan.address.line2" bundle="${msg}" />">
						<span class="error-msg" id="corrAddressMessage2"></span> <input
							class="form-control gray-textbox correspondence-address optional-field"
							autocomplete="off"
							id="correspondenceAddress3"
							name="correspondenceAddress3" type="text" autocomplete="off" value="${lifePersonalDetails.correspondenceAddress3 }"
							placeholder="<fmt:message key="eliteTerms.selectPlan.address.line3" bundle="${msg}" />">
						<span class="error-msg" id="corrAddressMessage3"></small> </span>
						<div class="selectDiv et-district-wrapper">
							<span class="icon-chevron-thin-down orange-caret"></span> <select
								class="form-control gray-dropdown"
								data-style="application-select selection"
								name="correspondenceAddressDistrict"
								id="correspondenceAddressDistrict">
								<option value=""><fmt:message
										key="eliteTerms.selectPlan.Please.District"
										bundle="${msg}" /></option>
								<c:if test="${language == 'en'}">
									<c:forEach var="list" items="${savieDistrictEN}">
										<option value="${list.itemCode }-${list.itemDesc }" <c:if test="${lifePersonalDetails.correspondenceAddressDistrict == list.itemCode}">selected="selected"</c:if>>${list.itemDesc }</option>
									</c:forEach>
								</c:if>
								<c:if test="${language == 'tc'}">
									<c:forEach var="list" items="${savieDistrictCN}">
										<option value="${list.itemCode }-${list.itemDesc }" <c:if test="${lifePersonalDetails.correspondenceAddressDistrict == list.itemCode}">selected="selected"</c:if>>${list.itemDesc }</option>
									</c:forEach>
								</c:if>
							</select>
						</div>
						<span class="error-msg" id="correspondenceDistrictMessage"></span>
						<span class="warning-note"><span class="orange">*</span>
							<fmt:message
								key="eliteTerms.selectPlan.No.P.O.Box.address.allowed"
								bundle="${msg}" /></span>
					</div>
				</div>

			</div>
		</div>
		<div class="next-btn">
			<button id="et-personal-info-next" class="btn next pi">
				<fmt:message key="eliteTerms.selectPlan.Next" bundle="${msg}" />
			</button>
			<button id="saveLater" class="btn next pi">
				save and continue later
			</button>
		</div>
	</form>
	</div>
</div>

</div>
<script type="text/javascript">
$("#et-personal-info-next").click(function(){
	$("#errorMsg").html("");
	$.ajax({
		  type : "POST",
		  async:false, 
		  url : "<%=request.getContextPath()%>/ajax/savings-insurance/lifePersonalDetails",
		  data: $("#lifePersonalDetailsForm").serialize(),
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

$("#saveLater").click(function(){
	$("#errorMsg").html("");
	$.ajax({
		  type : "POST",
		  async:false, 
		  url : "<%=request.getContextPath()%>/ajax/savings-insurance/lifePersonalDetailsSaveforLater",
		  data: $("#lifePersonalDetailsForm").serialize(),
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