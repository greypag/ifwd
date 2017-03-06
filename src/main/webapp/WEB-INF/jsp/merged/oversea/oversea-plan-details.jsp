<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="enhance" uri="http://pukkaone.github.com/jsp" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />

<%
    String authenticate = "false";
    if (request.getSession().getAttribute("authenticate") != null) {
        authenticate = request.getSession()
                .getAttribute("authenticate").toString();
    }
%>

<script type='text/javascript'>
var getBundleLanguage = "";
var lang = UILANGUAGE;
var contextPath = '<%=request.getContextPath()%>';
if(lang === "EN"){
    getBundleLanguage = "en";
}else{
    if(lang === "tc"){
        getBundleLanguage = "zh";
    } 
    else{
        getBundleLanguage = "en";
    }
}
perventRedirect=true;
var namePlaceholder="<fmt:message key="Overseas.userdetails.applicant.Fullname.Same" bundle="${msg}" />";
var hkidPlaceholder="<fmt:message key="Overseas.userdetails.applicant.HKID.eg" bundle="${msg}" />";
var appDobPlaceholder = "<fmt:message key="Overseas.userdetails.applicant.DOB.DDMMYYYY" bundle="${msg}" />";
var appMobilePlaceholder = "<fmt:message key="Overseas.userdetails.applicant.Mobile.number" bundle="${msg}" />";
var appEmailPlaceholder = "<fmt:message key="Overseas.userdetails.applicant.Email.Placeholder" bundle="${msg}" />";

var appRoomPlaceholder = "<fmt:message key="Overseas.userdetails.applicant.Correspondence.ROOM" bundle="${msg}" />";
var appFloorPlaceholder = "<fmt:message key="Overseas.userdetails.applicant.Correspondence.FLOOR" bundle="${msg}" />";
var appBlockPlaceholder = "<fmt:message key="Overseas.userdetails.applicant.Correspondence.BLOCK" bundle="${msg}" />";
var appBuildingPlaceholder = "<fmt:message key="Overseas.userdetails.applicant.Correspondence.BUILDING" bundle="${msg}" />";
var appEstatePlaceholder = "<fmt:message key="Overseas.userdetails.applicant.Correspondence.ESTATE" bundle="${msg}" />";
var apprStreetNoPlaceholder = "<fmt:message key="Overseas.userdetails.applicant.Correspondence.STREETNO" bundle="${msg}" />";
var appStreetNamelaceholder = "<fmt:message key="Overseas.userdetails.applicant.Correspondence.STREETNAME" bundle="${msg}" />";
var insureNamePlaceholder="<fmt:message key="Overseas.userdetails.Insured.Fullname.Same" bundle="${msg}" />";
var insurNamePlaceholder="<fmt:message key="Overseas.userdetails.Insured.Fullname.Same" bundle="${msg}" />";
var insureHkidPlaceholder="<fmt:message key="Overseas.userdetails.Insured.HKID.eg" bundle="${msg}" />";
var insurHkidPlaceholder="<fmt:message key="Overseas.userdetails.Insured.HKID.eg" bundle="${msg}" />";
var insurDobPlaceholder="<fmt:message key="Overseas.userdetails.Insured.DOB" bundle="${msg}" />";

var benNamePlaceholder="<fmt:message key="Overseas.userdetails.Bene.Fullname" bundle="${msg}" />";
var benHkidPlaceholder="<fmt:message key="Overseas.userdetails.Bene.Insured.HKID.eg" bundle="${msg}" />";

var departurePlaceholder="<fmt:message key="Overseas.userdetails.institution.departure.DDMMYYYY" bundle="${msg}" />";
var institueCountryPlaceholder="<fmt:message key="Overseas.userdetails.Instituation.Country" bundle="${msg}" />";
var institueNamePlaceholder="<fmt:message key="Overseas.userdetails.Instituation.Name" bundle="${msg}" />";
var institueAddr1Placeholder="<fmt:message key="Overseas.userdetails.Instituation.Line1" bundle="${msg}" />";
var institueAddr2Placeholder="<fmt:message key="Overseas.userdetails.Instituation.Line2" bundle="${msg}" />";
var institueAddr3Placeholder="<fmt:message key="Overseas.userdetails.Instituation.Line3" bundle="${msg}" />";

function activateUserAccountJoinUs() {
    perventRedirect=false;
    $('#loading-overlay').modal({backdrop: 'static',keyboard: false});
    
    setTimeout(function(){
    	if(validateOverseaDetails()){
    		$('#frmYourDetails').submit();
    	}
    }, 500);
}

/* For Benefitiary Div active and Inactive */
function activeDiv(id, selected) {
    var selectedValue = $('#' + selected).val();
    activeDeactive(selectedValue, id);
}

function activeDeactive(selectedValue, id) {
    if (selectedValue == "" || selectedValue == "SE") {
        $('#' + id).addClass('hide');
        $('#' + id + 'b').addClass('hide');
        $('#' + id + 'c').addClass('hide');
    } else {
        $('#' + id).removeClass('hide');
        $('#' + id + 'b').removeClass('hide');
        $('#' + id + 'c').removeClass('hide');
    }
}
/* END- For Benefitiary Dive active and Inactive */

function setDropArea(id) {
    $('#selectCADistHid').find('option[value="' + id + '"]').attr('selected', 'selected');
    
    if ($("#selectCADistHid option[value='"+id+"']").text() == "HK")
        document.getElementById("correspondenceAddressDistrictId1").checked = true;
    else if ($("#selectCADistHid option[value='"+id+"']").text() == "KL")
        document.getElementById("correspondenceAddressDistrictId2").checked = true;
    else
        document.getElementById("correspondenceAddressDistrictId3").checked = true;
    /* if(id != '') {
        $("#errCADist").html('');
        $('#applicantDistrict').removeClass('invalid-field');
    } */
}

</script>

<section class="product_header_path_container ">
    <div class="container">
        <div class="product_header_path_item back"><i class="fa fa-arrow-left"></i><div class="partition"></div></div>
        <div class="product_header_path_item hidden-sm hidden-xs"><fmt:message key="Overseas.PlanOptions.progressbar.item1" bundle="${msg}" /></div>
        <div class="product_header_path_item active"><fmt:message key="Overseas.PlanOptions.progressbar.item2" bundle="${msg}" /></div>
        <div class="product_header_path_item hidden-sm hidden-xs"><fmt:message key="Overseas.PlanOptions.progressbar.item3" bundle="${msg}" /><div class="partition"></div></div>
        <div class="product_header_path_item hidden-sm hidden-xs"><fmt:message key="Overseas.PlanOptions.progressbar.item4" bundle="${msg}" /></div>
    </div>
</section>
<section>
    <div id="cn" class="container">
        <div class="row">
            <form:form id="frmYourDetails" class="oversea-details-form" name="frmYourDetails" onsubmit="return confirmDetails(this,'frmYourDetails','${language}');" modelAttribute="frmYourDetails" method="post" action="">
                <ol class="breadcrumb pad-none">
                  <li><a href="#"><fmt:message key="Overseas.Landing.Breadcrumb.layer1" bundle="${msg}" /></a> <i class="fa fa-chevron-right"></i></li>
                  <li><a href="#"><fmt:message key="Overseas.Landing.Breadcrumb.layer2" bundle="${msg}" /></a></li> <i class="fa fa-chevron-right"></i></li>
                  <li><a href="#"><fmt:message key="Overseas.Landing.Breadcrumb.layer3" bundle="${msg}" /></a></li>
                  <li class="active "><i class="fa fa-chevron-right"></i><fmt:message key="Overseas.Landing.Breadcrumb.step2" bundle="${msg}" /></li>
                </ol>
                
                <%
                    if (authenticate.equals("false") || "direct".equalsIgnoreCase(request.getSession()
                        .getAttribute("authenticate").toString())) {
                %>
                <div class="product_plan_details_member_title white-bg1">
                    <h3 class="pull-left h2-3-existing-fwd-head bmg-detail-exist-member-head">
                    <fmt:message key="annual.common.member" bundle="${msg}" />
                    </h3>
                    <div class="pull-left">
                        <a href="#" class="pull-left btn-box-2 color4 login-btn" data-toggle="modal" data-target="#loginpopup"><fmt:message key="annual.common.login" bundle="${msg}" /></a>    
                        <div class="pull-left text-left">
                            <h3 class="text-left or-continue">
                                <span style="margin-left:10px;margin-right:10px;"><fmt:message key="annual.common.or" bundle="${msg}" /></span>
                                <fmt:message key="annual.common.guest" bundle="${msg}" />
                            </h3>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <%
                    }
                %>
                
                <div id="quote-wrap" class="container pad-none bdr ur-opt-content gray-bg3">
                    <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 pad-none white-bg1">
                        <br>
                        <!-- <div class="gray-bdr"></div> -->
                        <!-- updated responsive design start -->
                        <div class="form-wrap">
                            <div class="big-title black-bold pad-none section-title">
                                <fmt:message key="Overseas.userdetails.info" bundle="${msg}" />
                            </div>
                            <div class="form-group float">
                                <span id="errorMsg"  class="text-red">${errormsg}</span>
                            </div>
                            <!-- english name start -->
                           <div class="form-group float">
                               <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                   <label for="inputFullName" class="field-label bold-500"><fmt:message key="Overseas.userdetails.applicant.Fullname" bundle="${msg}" /></label>
                               </div>
                               <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                   <input autocomplete="off" type="text" name="fullName" class="form-control full-control textUpper <c:if test="${!(userDetails != null && userDetails.fullName != '' && userDetails.userName != '*DIRECTGI')}">bmg_custom_placeholder</c:if>" id="inputFullName" 
                                   <c:choose>
                                       <c:when test="${userDetails != null && userDetails.fullName != '' && userDetails.userName != '*DIRECTGI'}">
                                       value="${userDetails.fullName }" readonly="readonly"
                                       </c:when>
                                       <c:otherwise>
                                       value= "<fmt:message key="Overseas.userdetails.applicant.Fullname.Same" bundle="${msg}" />"
                                       </c:otherwise>
                                   </c:choose>
                                   onfocus="placeholderOnFocus(this,'<fmt:message key="Overseas.userdetails.applicant.Fullname.Same" bundle="${msg}" />');" onblur="placeholderOnBlur(this,'<fmt:message key="Overseas.userdetails.applicant.Fullname.Same" bundle="${msg}" />'); validateName('inputFullName','fullnameinvalid',true,'applicant');" onkeypress="return alphaOnly(event);" maxlength="50">
                                   <span id="fullnameinvalid" class="text-red"></span>
                               </div>
                           </div>
                           <!-- english name end -->
                           <!-- id card starts -->
                           <div class="form-group float">
                               <div class="field-label form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                <label class="field-label bold-500">
                                    <fmt:message key="Overseas.userdetails.applicant.HKID" bundle="${msg}" />
                                    <input type="hidden" name="selectedHkidPassApplicant" id="selectHkidPass" value="HKID">
                                </label>
                               </div>
                               <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                   <input autocomplete="off" type="text" name="hkid" class="form-control numberinput textUpper full-control bmg_custom_placeholder" id="inputTxtAppHkid"
                                   onkeypress=" return hkidOnkeypress(event);"
                                   value="<fmt:message key="Overseas.userdetails.applicant.HKID.eg" bundle="${msg}" />"
                                   onfocus="placeholderOnFocus(this,'<fmt:message key="Overseas.userdetails.applicant.HKID.eg" bundle="${msg}" />');"
                                   onblur="placeholderOnBlur(this,'<fmt:message key="Overseas.userdetails.applicant.HKID.eg" bundle="${msg}" />'); validateHkid('inputTxtAppHkid','selectHkidPass','errAppHkid',true,'applicant');">
                                   <!-- <fmt:message key="Overseas.userdetails.applicant.HKID.eg" bundle="${msg}" /> -->
                                       <span id="errAppHkid" class="text-red"></span>
                               </div>
                           </div>
                           <!-- id card ends -->
                           <!-- birthday starts -->
                           <div class="form-group float">
                               <div class="field-label form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                   <label for="applicantDob" class="field-label bold-500"><fmt:message key="Overseas.userdetails.applicant.DOB" bundle="${msg}" /></label>
                               </div>
                               <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                    <div class="input-group date" id="input_oversea_dob"> <span class="input-group-addon in border-radius"><img src="<%=request.getContextPath()%>/resources/images/calendar.png" alt=""></span>
                                        <input name="applicantDob" autocomplete="off"
                                        type="text"
                                        class="pointer datepicker form-control border-radius"
                                        id="applicantDob"
                                        value=""
                                        placeholder="<fmt:message key="Overseas.userdetails.applicant.DOB.DDMMYYYY" bundle="${msg}" />"
                                        readonly>
                                    </div>
                                    <span id="dobInvalid" class="text-red"></span>
                               </div>
                           </div>                          
                           <!-- birthday ends -->
                           <!-- mobile starts -->
                           <div class="form-group float">
                               <div class="field-label form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                   <label for="inputMobileNo" class="field-label bold-500"><fmt:message key="Overseas.userdetails.applicant.Mobile" bundle="${msg}" /></label>
                               </div>
                               <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                    <input autocomplete="off" name="mobileNo" type="tel" class="form-control full-control <c:if test="${!(userDetails != null && userDetails.fullName != '' && userDetails.userName != '*DIRECTGI')}">bmg_custom_placeholder</c:if>" 
                                       <c:choose>
                                           <c:when test="${userDetails != null && userDetails.userName != '' && userDetails.userName != '*DIRECTGI'}">
                                            readonly="readonly" value="${userDetails.mobileNo}"
                                           </c:when>
                                       </c:choose>
                                        id="inputMobileNo"
                                        onkeypress="return isNumeric(event)"
                                        value="<fmt:message key="Overseas.userdetails.applicant.Mobile.number" bundle="${msg}" />"
                                        onfocus="placeholderOnFocus(this,'<fmt:message key="Overseas.userdetails.applicant.Mobile.number" bundle="${msg}" />');"
                                        onblur="placeholderOnBlur(this,'<fmt:message key="Overseas.userdetails.applicant.Mobile.number" bundle="${msg}" />'); validateMobile('inputMobileNo','errMobileNo');"
                                        maxlength="8">  <!-- <fmt:message key="Overseas.userdetails.applicant.Mobile.number" bundle="${msg}" /> -->
                                    <span id="errMobileNo" class="text-red">
                                    </span>
                               </div>
                           </div>
                           <!-- mobile ends -->
                           <!-- email address starts -->
                           <div class="form-group float">
                               <div class="field-label form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                   <label for="inputEmailId" class="field-label bold-500"><fmt:message key="Overseas.userdetails.applicant.Email" bundle="${msg}" /></label>
                               </div>
                               <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                   <input autocomplete="off" class="form-control full-control textLower <c:if test="${!(userDetails != null && userDetails.fullName != '' && userDetails.userName != '*DIRECTGI')}">bmg_custom_placeholder</c:if>" name="emailAddress" type="email"
                                       <c:choose>
                                           <c:when test="${userDetails != null && userDetails.userName != '' && userDetails.userName != '*DIRECTGI'}">
                                            readonly="readonly" value="${userDetails.emailAddress}"
                                           </c:when>
                                       </c:choose>
                                       id="inputEmailId" maxlength="50" value="<fmt:message key="Overseas.userdetails.applicant.Email.Placeholder" bundle="${msg}" />"  onfocus="placeholderOnFocus(this,'<fmt:message key="Overseas.userdetails.applicant.Email.Placeholder" bundle="${msg}" />');"
                                       onblur="placeholderOnBlur(this,'<fmt:message key="Overseas.userdetails.applicant.Email.Placeholder" bundle="${msg}" />');validateEmail('inputEmailId','emailid');">
                                   <span id="emailid" class="text-red"></span>
                               </div>
                           </div>
                           <!-- email address ends -->
                           <!-- relationship start -->
                              <div class="form-group float">
                                  <div
                                      class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                      <label class="field-label bold-500"><fmt:message key="Overseas.userdetails.applicant.Relationship" bundle="${msg}" /></label>
                                  </div>
                                  <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                      <div class="styled-select">
                                          <select name="applicantRelationship" id="applicantRelationship"
                                              onchange="checkInsuredPerson(this.value)"
                                              class="form-control soflow select-label">
                                              <option value="SE"><fmt:message key="Overseas.userdetails.applicant.Relationship.Option1" bundle="${msg}" /></option>
                                              <option value="CH"><fmt:message key="Overseas.userdetails.applicant.Relationship.Option2" bundle="${msg}" /></option>
                                              <option value="OT"><fmt:message key="Overseas.userdetails.applicant.Relationship.Option3" bundle="${msg}" /></option>
                                          </select>
                                      </div>
                                      <span id="errapplicantRelationship" class="text-red"></span>
                                  </div>
                              </div>
                          <!-- relationship end -->                               
                         </div>
                         <!-- updated responsive design end -->
                         <div class="clearfix"></div>
                        <div class="form-wrap">
                        <!-- correspondence address -->
                            <div class="big-title black-bold pad-none ">
                                <fmt:message key="Overseas.userdetails.applicant.Correspondence" bundle="${msg}" />
                            </div>
                            <div class="form-group float">
                                <div class="field-label form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                    <label for="correspondenceAddressRoomId" class="field-label bold-500"><fmt:message key="Overseas.userdetails.applicant.Correspondence.ROOM" bundle="${msg}" /></label>
                                    /
                                    <label for="correspondenceAddressFloorId" class="field-label bold-500"><fmt:message key="Overseas.userdetails.applicant.Correspondence.FLOOR" bundle="${msg}" /></label>
                                    /
                                    <label for="correspondenceAddressBlockId" class="field-label bold-500"><fmt:message key="Overseas.userdetails.applicant.Correspondence.BLOCK" bundle="${msg}" /></label>
                                </div>
                                <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                    <div class="col-sm-4 col-xs-4 col-lg-4 col-md-4 pad-none">
                                        <input autocomplete="off" class="col-lg-12 col-md-12 col-xs-12 col-sm-12 form-control full-control textUpper bmg_custom_placeholder" name="correspondenceAddressRoom" size=10 type="text" value="<fmt:message key="Overseas.userdetails.applicant.Correspondence.ROOM" bundle="${msg}" />" id="correspondenceAddressRoomId" maxlength="50" onfocus="placeholderOnFocus(this,'<fmt:message key="Overseas.userdetails.applicant.Correspondence.ROOM" bundle="${msg}" />');" onblur="placeholderOnBlur(this,'<fmt:message key="Overseas.userdetails.applicant.Correspondence.ROOM" bundle="${msg}" />');" onkeypress="return isAlphaNumeric(event);" ><span id="" class="text-red"></span>
                                    </div>
                                    <div class="col-sm-4 col-xs-4 col-lg-4 col-md-4 floor-block-pad-right-none">
                                        <input autocomplete="off" class="col-lg-12 col-md-12 col-xs-12 col-sm-12 form-control full-control textUpper bmg_custom_placeholder" name="correspondenceAddressFloor" size=1 type="text" value="<fmt:message key="Overseas.userdetails.applicant.Correspondence.FLOOR" bundle="${msg}" />" id="correspondenceAddressFloorId" maxlength="50" onfocus="placeholderOnFocus(this,'<fmt:message key="Overseas.userdetails.applicant.Correspondence.FLOOR" bundle="${msg}" />');" onblur="placeholderOnBlur(this,'<fmt:message key="Overseas.userdetails.applicant.Correspondence.FLOOR" bundle="${msg}" />');" onkeypress="return isAlphaNumeric(event);" ><span id="" class="text-red"></span>
                                    </div>
                                    <div class="col-sm-4 col-xs-4 col-lg-4 col-md-4 floor-block-pad-right-none">
                                        <input autocomplete="off" class="col-lg-12 col-md-12 col-xs-12 col-sm-12 form-control full-control textUpper bmg_custom_placeholder" name="correspondenceAddressBlock" size=1 type="text" value="<fmt:message key="Overseas.userdetails.applicant.Correspondence.BLOCK" bundle="${msg}" />" id="correspondenceAddressBlockId" maxlength="50" onfocus="placeholderOnFocus(this,'<fmt:message key="Overseas.userdetails.applicant.Correspondence.BLOCK" bundle="${msg}" />');" onblur="placeholderOnBlur(this,'<fmt:message key="Overseas.userdetails.applicant.Correspondence.BLOCK" bundle="${msg}" />');" onkeypress="return isAlphaNumeric(event);" ><span id="" class="text-red"></span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group float">
                                <div class="field-label form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                    <label for="correspondenceAddressBuildingId" class="field-label bold-500"><fmt:message key="Overseas.userdetails.applicant.Correspondence.BUILDING" bundle="${msg}" /></label>
                                </div>
                                <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                    <input autocomplete="off" class="form-control full-control textUpper bmg_custom_placeholder" name="correspondenceAddressBuilding" type="text" value="<fmt:message key="Overseas.userdetails.applicant.Correspondence.BUILDING" bundle="${msg}" />" id="correspondenceAddressBuildingId" maxlength="50" onfocus="placeholderOnFocus(this,'<fmt:message key="Overseas.userdetails.applicant.Correspondence.BUILDING" bundle="${msg}" />');" onblur="placeholderOnBlur(this,'<fmt:message key="Overseas.userdetails.applicant.Correspondence.BUILDING" bundle="${msg}" />');validateCorrespondenceBorE();" onkeypress="return isAlphaNumeric(event);"><span id="errorEmptyCorrespondenceAddressBuilding" class="text-red"></span>
                                </div>
                            </div>
                            <div class="form-group float">
                                <div class="field-label form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                    <label for="correspondenceAddressEstateId" class="field-label bold-500"><fmt:message key="Overseas.userdetails.applicant.Correspondence.ESTATE" bundle="${msg}" /></label>
                                </div>
                                <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                    <input autocomplete="off" class="form-control full-control textUpper bmg_custom_placeholder" name="correspondenceAddressEstate" type="text" value="<fmt:message key="Overseas.userdetails.applicant.Correspondence.ESTATE" bundle="${msg}" />" id="correspondenceAddressEstateId" maxlength="50" onfocus="placeholderOnFocus(this,'<fmt:message key="Overseas.userdetails.applicant.Correspondence.ESTATE" bundle="${msg}" />');" onblur="placeholderOnBlur(this,'<fmt:message key="Overseas.userdetails.applicant.Correspondence.ESTATE" bundle="${msg}" />');validateCorrespondenceBorE();" onkeypress="return isAlphaNumeric(event);"><span id="errorEmptyCorrespondenceAddressEstate" class="text-red"></span>
                                </div>
                            </div>
                            <div class="form-group float">
                                <div class="field-label form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                    <label for="correspondenceAddressStreetNoId" class="field-label bold-500"><fmt:message key="Overseas.userdetails.applicant.Correspondence.STREETNO" bundle="${msg}" /></label>
                                </div>
                                <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                    <input autocomplete="off" class="form-control full-control textUpper bmg_custom_placeholder" name="correspondenceAddressStreetNo" type="text" value="<fmt:message key="Overseas.userdetails.applicant.Correspondence.STREETNO" bundle="${msg}" />" id="correspondenceAddressStreetNoId" maxlength="50" onfocus="placeholderOnFocus(this,'<fmt:message key="Overseas.userdetails.applicant.Correspondence.STREETNO" bundle="${msg}" />');" onblur="placeholderOnBlur(this,'<fmt:message key="Overseas.userdetails.applicant.Correspondence.STREETNO" bundle="${msg}" />');" onkeypress="return isAlphaNumeric(event);"><span id="" class="text-red"></span>
                                </div>
                            </div>
                            <div class="form-group float">
                                <div class="field-label form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                    <label for="correspondenceAddressStreetNameId" class="field-label bold-500"><fmt:message key="Overseas.userdetails.applicant.Correspondence.STREETNAME" bundle="${msg}" /></label>
                                </div>
                                <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                    <input autocomplete="off" class="form-control full-control textUpper bmg_custom_placeholder" name="correspondenceAddressStreetName" type="text" value="<fmt:message key="Overseas.userdetails.applicant.Correspondence.STREETNAME" bundle="${msg}" />" id="correspondenceAddressStreetNameId" maxlength="50" onfocus="placeholderOnFocus(this,'<fmt:message key="Overseas.userdetails.applicant.Correspondence.STREETNAME" bundle="${msg}" />');" onblur="placeholderOnBlur(this,'<fmt:message key="Overseas.userdetails.applicant.Correspondence.STREETNAME" bundle="${msg}" />');" onkeypress="return isAlphaNumeric(event);"><span id="" class="text-red"></span>
                                </div>
                            </div>
                            <div class="form-group float">
                                <div class="field-label form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                    <label for="inputDistrictId" class="field-label bold-500"><fmt:message key="Overseas.userdetails.applicant.Correspondence.DISTRICT" bundle="${msg}" /></label>
                                </div>                            
                                <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none pull-right">
                                    <div id="applicantDistrictSelectWrap" class="styled-select">
                                            <!--<select name="applicantDistrict" id="applicantDistrict"
                                            onchange="activeDiv('personalbenificiaryId1','personalselectBenificiary1', 'personalBenefitiaryId1', 'personalBenefitiaryHKId1');setDropArea(this.value)"
                                            class="form-control soflow select-label">-->
                                            <select name="applicantDistrict" id="applicantDistrict"
                                            onchange="setDropArea(this.value)"
                                            class="form-control soflow select-label">                                            
                                            <option value=""><fmt:message
                                                    key="annual.details.address.district" bundle="${msg}" /></option>
                                            <%
                                                List lst = (List) request.getAttribute("districtList");
                                                    Iterator itr = lst.iterator();
                                                    int i = 1;
                                                    while (itr.hasNext()) {
                                                        DistrictBean districtList = (DistrictBean) itr.next();
                                            %>
                                            <option value="<%=districtList.getCode()%>"><%=districtList.getDescription()%></option>
                                            <%
                                                }
                                            %>
                                        </select>
                                        
                                    </div>
                                 <div class="hidden">
                                    <select name="applicantDistrictHid"
                                        class="form-control soflow full-control" id="selectCADistHid">
                                        <option value=""></option>
                                        <%
                                            List lst1 = (List) request.getAttribute("districtList");
                                                Iterator itr1 = lst1.iterator();
                                                while (itr1.hasNext()) {
                                                    DistrictBean districtList = (DistrictBean) itr1.next();
                                        %>
                                        <option value="<%=districtList.getCode()%>"><%=districtList.getArea()%></option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>                                   
                                    <span id="errpersonalselectBenificiary1" class="text-red"></span>
                                </div>                          
                            </div>
                            <div class="form-group float">
	                            <div class="field-label form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none"></div>
	                                <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                        <span id="errorEmptycorrespondenceAddressDistrict" class="text-red"></span> 
                                    </div>
                            </div>                                
                            <div class="form-group float">
                                <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none district-btn-grp pull-right">
                                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 pad-none">
                                        <label class="field-label bold-500"><input type="radio"
                                            name="correspondenceAddressDistrict" type="" value="HK"
                                            id="inlineCARadio3" onclick="" maxlength="50" onblur=""><span id="" class="radio-inline oversea-lb">
                                        <fmt:message key="Overseas.userdetails.applicant.HongKong" bundle="${msg}" /></span></label>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 pad-none">
                                        <label class="field-label bold-500"><input type="radio"
                                            name="correspondenceAddressDistrict" type="" value="KL"
                                            id="inlineCARadio4" onclick="" maxlength="50" onblur=""><span id="" class="radio-inline oversea-lb">
                                        <fmt:message key="Overseas.userdetails.applicant.Kowloon" bundle="${msg}" /></span></label>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 pad-none">
                                        <label class="field-label bold-500"><input type="radio"
                                            name="correspondenceAddressDistrict" type="" value="NT"
                                            onclick="" id="inlineCARadio5" maxlength="50" onblur=""><span id="" class="radio-inline oversea-lb">
                                        <fmt:message key="Overseas.userdetails.applicant.NT" bundle="${msg}" /></span></label>
                                    </div>
                                </div>                                                          
                                <span id="errCADist" class="text-red"> </span>
                            </div>                            
                        </div>
                       <!-- correspondence address ends -->
                        <div class="clearfix"></div>
                        <div class="form-wrap">
                            <div class="big-title black-bold section-title" style="padding-left:0px !important;">
                                <fmt:message key="Overseas.userdetails.Insured" bundle="${msg}" />
                            </div>
                        </div>
                            <!-- Personal -->
                            <input type="hidden" name="totalPersonalTraveller" id="totalPersonalTraveller" value="1">
                            
                                <div class="form-wrap">
                                <!--<div class="personaltraveller">-->
                                    <!--<h4 class="bold big-title" style="padding-left:0px !important;">
                                        Traveller
                                        1
                                        (Same as Applicant)
                                    </h4>-->
                                    <!--<div>-->
                                        <!-- english name start -->
                                       <div class="form-group float">
                                           <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                                <label for="txtInsuFullName1" class="field-label bold-500"><fmt:message key="Overseas.userdetails.Insured.Fullname" bundle="${msg}" /></label>
                                           </div>
                                           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                                  <input autocomplete="off" type="text" id="txtInsuFullName1" name="personalName" class="form-control full-control textUpper <c:if test="${!(userDetails != null && userDetails.fullName != '' && userDetails.fullName != '*DIRECTGI')}">bmg_custom_placeholder</c:if>"
                                                      <c:choose>
                                                          <c:when test="${userDetails != null && userDetails.fullName != '' && userDetails.userName != '*DIRECTGI'}">
                                                          value="${userDetails.fullName }" readonly="readonly"
                                                          </c:when>
                                                          <c:otherwise>
                                                          value="<fmt:message key="Overseas.userdetails.Insured.Fullname.Same" bundle="${msg}" />"
                                                          </c:otherwise>
                                                      </c:choose>
                                                      onfocus="placeholderOnFocus(this,'<fmt:message key="Overseas.userdetails.Insured.Fullname.Same" bundle="${msg}" />');" onblur="placeholderOnBlur(this,'<fmt:message key="Overseas.userdetails.Insured.Fullname.Same" bundle="${msg}" />'); validateName('txtInsuFullName1','errtxtPersonalFullName1',false,'insured');" onkeypress="return alphaOnly(event);" maxlength="100" readonly="readonly">
                                                 <span id="errtxtPersonalFullName1" class="text-red"></span>
                                           </div>
                                       </div>
                                       <!-- english name end -->
                                       <!-- id card start -->
                                       <div class="form-group float">
                                           <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                                   <label for="txtInsuHkid1" class="field-label bold-500"><fmt:message key="Overseas.userdetails.Insured.HKID" bundle="${msg}" /></label>
                                                   <input id="selectedPersonalHkidPass1" name="selectedPersonalHkidPass" value="HKID" type="hidden">
                                           </div>
                                           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                               <input autocomplete="off" id="txtInsuHkid1" name="personalHKID" class="form-control textUpper full-control bmg_custom_placeholder" value="<fmt:message key="Overseas.userdetails.Insured.HKID.eg" bundle="${msg}" />" placholder="<fmt:message key="Overseas.userdetails.Insured.HKID.eg" bundle="${msg}" />" onkeypress=" return hkidOnkeypress(event);" onfocus="placeholderOnFocus(this,'<fmt:message key="Overseas.userdetails.Insured.HKID.eg" bundle="${msg}" />');" onblur="placeholderOnBlur(this,'<fmt:message key="Overseas.userdetails.Insured.HKID.eg" bundle="${msg}" />'); validateHkid('txtInsuHkid1','selectedPersonalHkidPass1','errtxtInsuHkid1',false,'insured');" readonly="readonly">  <!-- <fmt:message key="Overseas.userdetails.Insured.HKID.eg" bundle="${msg}" /> --> 
                                                    <span id="errtxtInsuHkid1" class="text-red"> </span>
                                           </div>
                                       </div>
                                       <!-- id card end -->
                                       <!-- birthday starts -->
                                       <div class="form-group float">
                                           <div class="field-label form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                               <label for="insuredDob" class="field-label bold-500"><fmt:message key="Overseas.userdetails.Insured.DOB" bundle="${msg}" /></label>
                                           </div>
                                           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                                <div class="input-group date" id="oversea_insure_dob"> <span class="input-group-addon in border-radius"><img src="<%=request.getContextPath()%>/resources/images/calendar.png" alt=""></span>
<%--                                                     <input name="insuredDob" type="text" class="pointer datepicker form-control border-radius" id="insuredDob" onfocus="placeholderOnFocus(this,<fmt:message key="Overseas.userdetails.Insured.DOB" bundle="${msg}" />);" onblur="placeholderOnBlur(this,<fmt:message key="Overseas.userdetails.Insured.DOB" bundle="${msg}" />);" placeholder="<fmt:message key="Overseas.userdetails.Insured.DOB" bundle="${msg}" />" value="" readonly> --%>
                                                         <input autocomplete="off" name="insuredDob" type="text" class="pointer datepicker form-control border-radius" id="insuredDob" placeholder="<fmt:message key="Overseas.userdetails.Insured.DOB.DDMMYYYY" bundle="${msg}" />" value="" readonly>
                                                </div>
                                                <div id="lock_datepicker" style="cursor: not-allowed;background-color: #eee;position:absolute;width:100%;height:100%;left:0px;top:0px;background:#fff;opacity:0;filter:alpha(opacity=0)">&nbsp;</div>
                                                <span id="dobInsuredInvalid" class="text-red"></span>
                                           </div>
                                       </div>
                                       <!-- birthday ends -->
                                       <!-- beneficiary start -->
                                       <div class="form-group float">
                                           <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                               <label class="field-label bold-500"><fmt:message key="Overseas.userdetails.Bene" bundle="${msg}" /></label>
                                           </div>
                                           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                               <div class="styled-select">
                                                   <select name="personalBeneficiary" id="personalselectBenificiary"
                                                        onChange="activeDiv('personalbenificiary','personalselectBenificiary')"
                                                        class="form-control soflow select-label">
                                                        <c:forEach var="relationshipList" items="${mapRelationshipCode}">
                                                            <enhance:out escapeXml="false">
                                                                <option value="${relationshipList.key}">
                                                                    <c:out value="${relationshipList.value}" />
                                                                </option>
                                                            </enhance:out>
                                                        </c:forEach>
                                                    </select> 
                                               </div>
                                               <span id="errpersonalselectBenificiary" class="text-red"></span>
                                           </div>
                                       </div>
                                       <!-- beneficiary end -->
                                       <!-- personalbenificiaryId start -->
                                       <div class="form-group float hide" id="personalbenificiary">
                                           <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                               <label class="field-label bold-500"></label>
                                           </div>
                                           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                               <div class="form-label col-lg-5 col-md-5 col-sm-5 col-xs-5 pad-none">                                                    
                                                    <label for="beneficiaryFullName" class="field-label bold-500">
                                                      <fmt:message key="Overseas.userdetails.Bene.Fullname" bundle="${msg}" />
                                                    </label>
                                               </div>
                                               <div class="col-lg-7 col-md-7 col-sm-7 col-xs-7 pad-none">
                                               <input autocomplete="off" type="text" name="beneficiaryFullName" id="beneficiaryFullName" class="form-control full-control textUpper bmg_custom_placeholder" value="<fmt:message key="Overseas.userdetails.Bene.Fullname.Same" bundle="${msg}" />" onfocus="placeholderOnFocus(this,'<fmt:message key="Overseas.userdetails.Bene.Fullname.Same" bundle="${msg}" />');" onblur="placeholderOnBlur(this,'<fmt:message key="Overseas.userdetails.Bene.Fullname.Same" bundle="${msg}" />'); validateName('beneficiaryFullName','errBeneficiaryFullName',false,'beneficiary');" onkeypress="return alphaOnly(event);" maxlength="50"></input>
                                                    <span id="errBeneficiaryFullName" class="text-red"> </span>
                                               </div>
                                               <div class="clearfix"></div>
                                           </div>
                                       <!-- </div>
                                       personalbenificiaryId end
                                       personalbenificiaryId b start
                                       <div class="form-group float hide" id="personalbenificiaryId1b"> -->
                                           <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                              <label class="field-label form-label bold-500"></label>
                                           </div>
                                           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                              <div class="form-label col-lg-5 col-md-5 col-sm-5 col-xs-5 pad-none">
                                                  <label class="field-label form-label bold-500">
                                                        <fmt:message key="Overseas.userdetails.Bene.HKID" bundle="${msg}" />
                                                    </label>
                                               </div>
                                               <div class="col-lg-7 col-md-7 col-sm-7 col-xs-7 pad-none">
                                                  <div class="styled-select">
                                                    <select id="beneficiaryIDType" class="form-control soflow select-label" name="beneficiaryIDType" onchange="togglePlaceholder(this,'beneficiaryID','<fmt:message key="Overseas.userdetails.applicant.HKID.eg" bundle="${msg}" />');">
                                                            <option value="HKID" selected="selected"><fmt:message key="Overseas.userdetails.Bene.HKID" bundle="${msg}" /></option>
                                                            <option value="passport"><fmt:message key="Overseas.userdetails.Bene.Passport" bundle="${msg}" /></option>
                                                    </select>
                                                    </div>
                                               </div>
                                           </div>
                                       <!-- </div>
                                       personalbenificiaryId b end
                                       personalbenificiaryId c start
                                       <div class="form-group float hide" id="personalbenificiaryId1c"> -->
                                           <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                              <label class="field-label form-label bold-500 hidden-lg hidden-md"></label>
                                           </div>
                                           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                              <div class="form-label col-lg-5 col-md-5 col-sm-5 col-xs-5 pad-none">
                                                  <label class="field-label form-label bold-500 hidden-lg hidden-md"></label>
                                               </div>
                                               <div class="col-lg-7 col-md-7 col-sm-7 col-xs-7 pad-none">
                                                  <input autocomplete="off" type="text" id="beneficiaryID" name="beneficiaryID" class="form-control textUpper full-control bmg_custom_placeholder" value="<fmt:message key="Overseas.userdetails.applicant.HKID.eg" bundle="${msg}" />" onkeypress=" return hkidOnkeypress(event);" onfocus="placeholderOnFocus(this,'<fmt:message key="Overseas.userdetails.applicant.HKID.eg" bundle="${msg}" />');" onblur="placeholderOnBlur(this,'<fmt:message key="Overseas.userdetails.applicant.HKID.eg" bundle="${msg}" />'); validateHkid('beneficiaryID','beneficiaryIDType','errBeneficiaryID',false,'beneficiary');"></input>
                                                  <span id="errBeneficiaryID" class="text-red"> </span>
                                               </div>
                                           </div>
                                       </div>
                                       <!-- personalbenificiaryId c end -->
                                    <!--</div>-->
                                    <div class="clearfix"></div>
                                    
                                <!--</div>-->
                                <!-- End of traveler--> 
                                </div>

                                <!-- Oversea student information-->
                                <div class="form-wrap">
                                    <div class="big-title black-bold section-title" style="padding-left:0px !important;">
                                        <fmt:message key="Overseas.userdetails.institution.headline" bundle="${msg}" />
                                    </div>
                                </div>
                                <div class="form-wrap">
                                    <div class="form-group float">
                                        <div class="field-label form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                            <label for="overseaDepartureDate" class="field-label bold-500"><fmt:message key="Overseas.userdetails.institution.departure" bundle="${msg}" /></label>
                                        </div>
                                        <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                            <div class="input-group date" id="oversea_departure_date"> <span class="input-group-addon in border-radius"><img src="<%=request.getContextPath()%>/resources/images/calendar.png" alt=""></span>
                                                <input autocomplete="off" name="overseaDepartureDate" type="text" class="pointer datepicker form-control border-radius bmg_custom_placeholder" id="overseaDepartureDate"  onfocus="placeholderOnFocus(this,'<fmt:message key="Overseas.userdetails.institution.departure" bundle="${msg}" />');" onblur="placeholderOnBlur(this,'<fmt:message key="Overseas.userdetails.applicant.DOB.DDMMYYYY" bundle="${msg}" />');" placeholder="<fmt:message key="Overseas.userdetails.applicant.DOB.DDMMYYYY" bundle="${msg}" />" readonly="">
                                            </div>
                                            <span id="overseaDepartureDateInvalid" class="text-red"></span>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group auto-complete">
                                        <div class="field-label form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                            <label for="countryOfInstitution" class="field-label bold-500"><fmt:message key="Overseas.userdetails.Instituation.Country" bundle="${msg}" /></label>
                                        </div>
                                        <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                            <input autocapitalize="none" autocomplete="off" name="countryOfInstitution" type="text" class="form-control full-control bmg_custom_placeholder" value="<fmt:message key="Overseas.userdetails.Instituation.Country" bundle="${msg}" />" id="countryOfInstitution" onfocus="placeholderOnFocus(this,'<fmt:message key="Overseas.userdetails.Instituation.Country" bundle="${msg}" />');" onblur="placeholderOnBlur(this,'<fmt:message key="Overseas.userdetails.Instituation.Country" bundle="${msg}" />');validatecountryOfInstitution();" onkeypress="return isAlphaNumeric(event);" maxlength="50">                                              
                                            <span id="countryOfInstitutionInvalid" class="text-red"></span><br>
                                        </div>
                                    </div>
                                    <div class="form-group float clear-float">
                                        <div class="field-label form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                            <label for="nameOfInstitution" class="field-label bold-500"><fmt:message key="Overseas.userdetails.Instituation.Name" bundle="${msg}" /></label>
                                        </div>
                                        <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                            <input autocomplete="off" name="nameOfInstitution" type="text" class="form-control full-control bmg_custom_placeholder" value="<fmt:message key="Overseas.userdetails.Instituation.Name" bundle="${msg}" />" id="nameOfInstitution" onfocus="placeholderOnFocus(this,'<fmt:message key="Overseas.userdetails.Instituation.Name" bundle="${msg}" />');" onblur="placeholderOnBlur(this,'<fmt:message key="Overseas.userdetails.Instituation.Name" bundle="${msg}" />');validatenameOfInstitution();" onkeypress="return isAlphaNumeric(event);" maxlength="100"> 
                                            <span id="nameOfInstitutionInvalid" class="text-red"></span>
                                        </div>
                                    </div>


                                    <div class="form-group float">
                                        <div class="field-label form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                            <label for="addressofInstitutionLine1" class="field-label bold-500"><fmt:message key="Overseas.userdetails.Instituation.Address" bundle="${msg}" /></label>
                                        </div>
                                        <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                            <input autocomplete="off" name="addressofInstitutionLine1" type="text" class="form-control full-control bmg_custom_placeholder" value="<fmt:message key="Overseas.userdetails.Instituation.Line1" bundle="${msg}" />" id="addressofInstitutionLine1" onkeypress="return isAlphaNumericWithSpecialChar(event);"  onfocus="placeholderOnFocus(this,'<fmt:message key="Overseas.userdetails.Instituation.Line1" bundle="${msg}" />');" onblur="placeholderOnBlur(this,'<fmt:message key="Overseas.userdetails.Instituation.Line1" bundle="${msg}" />');validateaddressofInstitutionLine()" maxlength="29"> 
                                        </div>
                                    </div>
                                    <div class="form-group float">
                                        <div class="field-label form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                        </div>
                                        <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                            <input autocomplete="off" name="addressofInstitutionLine2" type="text" class="form-control full-control bmg_custom_placeholder" value="<fmt:message key="Overseas.userdetails.Instituation.Line2" bundle="${msg}" />" id="addressofInstitutionLine2" onkeypress="return isAlphaNumericWithSpecialChar(event);" onfocus="placeholderOnFocus(this,'<fmt:message key="Overseas.userdetails.Instituation.Line2" bundle="${msg}" />');" onblur="placeholderOnBlur(this,'<fmt:message key="Overseas.userdetails.Instituation.Line2" bundle="${msg}" />');validateaddressofInstitutionLine()" maxlength="29"> 
                                        </div>
                                    </div>
                                    <div class="form-group float">
                                        <div class="field-label form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                        </div>
                                        <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                            <input autocomplete="off" name="addressofInstitutionLine3" type="text" class="form-control full-control bmg_custom_placeholder" value="<fmt:message key="Overseas.userdetails.Instituation.Line3" bundle="${msg}" />" id="addressofInstitutionLine3" onkeypress="return isAlphaNumericWithSpecialChar(event);" onfocus="placeholderOnFocus(this,'<fmt:message key="Overseas.userdetails.Instituation.Line3" bundle="${msg}" />');" onblur="placeholderOnBlur(this,'<fmt:message key="Overseas.userdetails.Instituation.Line3" bundle="${msg}" />');validateaddressofInstitutionLine()" maxlength="19"> 
                                            <span id="addressofInstitutionInvalid" class="text-red"></span> 
                                        </div>
                                    </div>
                                
                                    <div class="form-group">
                                        <div class="checkbox margin-fix">
                                            <input id="visacheckbox" name="visacheckbox" type="checkbox">
                                            <label for="visacheckbox"><fmt:message key="Overseas.userdetails.TC.ValidVisa" bundle="${msg}" /></label>
                                        </div>
                                        <span id="visacheckboxInvalid" class="text-red"></span> 
                                    </div>
                                </div>                            
                                <!-- End of Oversea student information-->
                            <!-- adult  -->
                            <input type="hidden" name="totalAdultTraveller" id="totalAdultTraveler" value="0">
                            <!-- child  -->
                            <input type="hidden" name="totalChildTraveller" id="totalCountOfChild" value="0">
                            <!--other traveller-->
                            <input type="hidden" name="totalOtherTraveller" id="totalCountOther" value="0">
                       <div class="clearfix"></div>
                            
                            <div class="form-wrap">
                                <h4 class="h4-2 bmg-disclaimer-header"><fmt:message key="Overseas.userdetails.declarations.heading" bundle="${msg}" /></h4>
                                <div class="declaration-content" style="margin-left: 0px;margin-right: 0px;">
                                <div class="checkbox">
                                    <input id="checkbox1" name="checkbox1" type="checkbox"> 
                                    <label for="checkbox1">
                                        <fmt:message key="Overseas.userdetails.declarations.tnc" bundle="${msg}" />
                                        <ol class="ol-disclaimer">
                                            <li><fmt:message key="Overseas.userdetails.declarations.tnc.desc1" bundle="${msg}" /></li>
											<li><fmt:message key="Overseas.userdetails.declarations.tnc.desc2" bundle="${msg}" /></li>
											<li><fmt:message key="Overseas.userdetails.declarations.tnc.desc3" bundle="${msg}" /></li>
											<li><fmt:message key="Overseas.userdetails.declarations.tnc.desc4" bundle="${msg}" /></li>
											<li><fmt:message key="Overseas.userdetails.declarations.tnc.desc5" bundle="${msg}" /></li>
                                        </ol>
                                        
                                    </label>
                                </div>  
                                <span id="chk1" class="text-red"></span>        
                                <div class="checkbox">
                                    <input id="checkbox2" name="checkbox2" type="checkbox"> <label for="checkbox2">
                                        <fmt:message key="Overseas.userdetails.declarations.PICS.part1" bundle="${msg}" /> <a
										href="<fmt:message key="PICS.link" bundle="${msg}" />"
										class="sub-link" target="_blank"><fmt:message key="Overseas.userdetails.declarations.PICS.part2" bundle="${msg}" /></a> <fmt:message key="Overseas.userdetails.declarations.PICS.part3" bundle="${msg}" />
                                        </label>
                                </div>
                                <span id="chk2" class="text-red"></span>
                                <hr>
                                <div>
                                    <label>
                                    <fmt:message key="Overseas.userdetails.TC.DoNotWish" bundle="${msg}" /> <br>
                                    </label>
                                </div>
                                 <div class="checkbox">
                                    <input id="checkbox3" name="checkbox3" type="checkbox"> <label for="checkbox3"><fmt:message key="Overseas.userdetails.TC.DoNotSend" bundle="${msg}" /><br>
                                        
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <input id="checkbox4" name="checkbox4" type="checkbox"> <label for="checkbox4">

                                        <fmt:message key="Overseas.userdetails.TC.DoNotProvide" bundle="${msg}" /><br>
                                        
                                    </label>
                                </div>
                                <!-- 
                                <div class="checkboxBubble">
                                    You may not be able to receive our latest promotion and benefits!
                                </div>
                                 -->
                                <div class="checkboxBubble">
                                    <fmt:message key="annual.details.declarations.PDPO.warning" bundle="${msg}" />
                                </div>

                                <script type="text/javascript">
                                function showBubble(){
                                    if($("#checkbox3").prop('checked') || $("#checkbox4").prop("checked")) {
                                        $(".checkboxBubble").fadeIn();
                                    }else{
                                        $(".checkboxBubble").fadeOut();
                                    }
                                }
                                
                                $("#checkbox3").change(function() {
                                    showBubble();
                                });
                                
                                $("#checkbox4").change(function() {
                                    showBubble();
                                });
                                </script>

                            </div>
                            </div>
                        <%
                            if (authenticate.equals("false") || "direct".equalsIgnoreCase(request.getSession()
                                    .getAttribute("authenticate").toString())) {
                        %>
                        <input type="hidden" id="isLogin" value="false">
                        <%
                            }
                            else
                            {
                        %>
                            <input type="hidden" id="isLogin" value="true">
                        <%
                            }
                        %>
                        
                        <div class="form-wrap" style="margin-bottom: 10px;">
                        <h4 class="h4-4 product_landing_download_button pull-left">
                            <i class="fa fa-download"></i> <a href="<%=request.getContextPath()%>/<fmt:message key="Overseas.Brochure.Download.URL" bundle="${msg}" />" target="_blank"><fmt:message key="Overseas.PlanOptions.Brochure" bundle="${msg}" />   </a>
                        </h4>
                        <h4 class="h4-4 product_landing_download_button pull-left">
                            <i class="fa fa-download"></i> <a href="https://home.fwd.com.hk/gidoc/policyprovisions/Overseas_StudyCare_JacketLatest.pdf" target="_blank"><fmt:message key="Overseas.PlanOptions.Provisions" bundle="${msg}" />   </a>
                        </h4>
                        <div class="clearfix"></div>
                        </div>  
                        </div>
                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12  gray-bg pad-none wht-bg3 floatingbox" style="top: 0px;">
                        <div class="hidden-sm hidden-xs">
                            <div class="wd2">
                                <div class="pull-left" style="">
                                    <h2 class="h2-3-choose" style="padding-left:0px;font-size: 24px;margin-bottom:0px;"><fmt:message key="Overseas.Planname.title" bundle="${msg}" /></h2>
                                    <h2 id="selectedPlanNameDisplay" class="h2-3-choose" style="padding-left:0px;font-size: 24px;margin-top:0px;">${displayPlan }</h2>
                                    <h4 id="seletedplanregion" style="padding-left:0px;line-height: 0px;font-size: 16px;">${displayRegion }</h4>
                                    <input type="hidden" id="selectedPlanName" name="selectedPlanName" value="${planName }">
                                    <input type="hidden" id="planIndex" name="planIndex" value="${planIndex }">
                                </div>
                                <div class="clearfix"></div>
                                <div class="pull-right" style="">
                                    <div class="text-left h2-2 h2" style="margin-top:0px;margin-bottom:0px;">
                                        <div class="hk" style="font-size: 18px;">
                                        <fmt:message key="Overseas.Payment.Summary.originalamount.currency" bundle="${msg}" /> 
                                            
                                            <div class="flightcare-hk" style="font-weight: bold;font-size: 28px;"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="3" value="${planPremium}" /></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="clearfix"></div>
                            <div class="orange-bdr"></div>
                            <div style="width: 80%;margin-left: 10%;">
                                  <h3 style="margin-bottom:0px;"><fmt:message key="annual.details.promotioncode" bundle="${msg}" /></h3>
                                 <c:choose>
                                 <c:when test="${referralCode!=null && referralCode!=''}"><h4 class="pad-none" style="color:#999;font-size: 22px;margin-top: 0px;">${referralCode}</h4></c:when>
                                 <c:otherwise><h4 class="pad-none" style="color:#999;font-size: 22px;margin-top: 0px;"><fmt:message key="Overseas.PlanOptions.NoCodeused" bundle="${msg}" /></h4></c:otherwise>
                                 </c:choose> 
                                <!--<c:if test="${referralCode!=null && referralCode!=''}">
                                    <h3 style="margin-bottom:0px;"><fmt:message key="annual.details.promotioncode" bundle="${msg}" /></h3>
                                    <h4 class="pad-none" style="color:#999;font-size: 22px;margin-top: 0px;">${referralCode}</h4>
                                </c:if>-->
                                <h3 class="h4-1-orange-b col-lg-6 col-md-6" style="padding-left:0px;margin-bottom:0;font-size: 18px;"><fmt:message key="Overseas.PlanOptions.Subtotal" bundle="${msg}" /></h3>
                                <h3 class="h4-1-orange-b col-lg-6 col-md-6 text-right" style="padding-right: 0px;font-size: 18px;"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="3" value="${planPremium}" /></h3>
                                <h3 class="h4-1-orange-b col-lg-6 col-md-6" style="padding-left:0px;margin-bottom:0;margin-top:0;font-size: 18px;"><fmt:message key="Overseas.PlanOptions.Discount" bundle="${msg}" /></h3>
                                <h3 class="h4-1-orange-b col-lg-6 col-md-6 text-right" style="padding-right: 0px;margin-top:0;font-size: 18px;"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="3" value="${planDiscount}" /></h3>
                            </div>
                            <div class="clearfix"></div>
                            <div class="orange-bdr"></div>
                            <div style="width: 80%;margin-left: 10%;">
                                <h3 class="h4-1-orange-b col-lg-6 col-md-6" style="padding-left:0px;font-size: 18px;"><fmt:message key="Overseas.PlanOptions.Amountdue" bundle="${msg}" /></h3>
                                <h3 class="h4-1-orange-b col-lg-6 col-md-6 text-right" style="padding-right: 0px;font-size: 18px;"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="3" value="${planSummary}" /></h3>
                                <input type="hidden" name="finalDueAmount" value="${planSummary}">
                                <input type="hidden" name="finalOriginalAmount" value="${planPremium}">
                            </div>
                            <div style="width: 80%;margin-left: 10%;">
                                <div class="top35 pull-left pad-none" style="width:47%">
                                     <a class="bdr-curve btn btn-primary bck-btn" onclick="perventRedirect=false;BackMe();"><fmt:message key="annual.button.back" bundle="${msg}" /> </a>
                                </div>
                                <div class="top35 pull-right pad-none" style="width:47%"> 
                                    <!-- <input type="button" onclick="javascript:kenshoo_conv('Registration_Step2','305.00','','Regis_Travel_Step2 EN','USD');return activateUserAccountJoinUs();" class="bdr-curve btn btn-primary nxt-btn" value=" Next"> -->
                                    <c:choose>
                                        <c:when test="${language=='en'}">
                                            <input type="button" onclick="javascript:kenshoo_conv('Registration_Step2','${planSummary}','','Regis_Oversea_Step2 EN','USD');return activateUserAccountJoinUs();" class="bdr-curve btn btn-primary nxt-btn" value=" <fmt:message key="annual.button.next" bundle="${msg}" />" />
                                        </c:when>
                                        <c:otherwise>
                                            <input type="button" onclick="javascript:kenshoo_conv('Registration_Step2','${planSummary}','','Regis_Oversea_Step2 ZH','USD');return activateUserAccountJoinUs();" class="bdr-curve btn btn-primary nxt-btn" value=" <fmt:message key="annual.button.next" bundle="${msg}" />" />
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <br>
                        </div>
                    </div>
            
            <div class="clearfix"></div>
            </div>

<div class="col-xs-12 hidden-md hidden-lg pad-none">
     <div style="width: 80%;margin-left: 10%;">
         <hr>
     </div>
</div>

<p class="padding1 workingholiday-plan-disclaimer"><br>
<fmt:message key="Overseas.userdetails.Disclaimer1" bundle="${msg}" /><br>
<fmt:message key="Overseas.userdetails.Disclaimer2" bundle="${msg}" /></p>

<div class="col-xs-12 hidden-md hidden-lg pad-none">
   <div style="width: 80%;margin-left: 10%;  margin-bottom: 50px;">
        <div class="top35 pull-left pad-none" style="width:47%">
            <a class="bdr-curve btn btn-primary bck-btn" onclick="perventRedirect=false;BackMe();"><fmt:message key="Overseas.PlanOptions.Back" bundle="${msg}" /></a>
        </div>
        <div class="top35 pull-right pad-none" style="width:47%">
        <!-- <input type="button" onclick="javascript:kenshoo_conv('Registration_Step2','305.00','','Regis_Travel_Step2 EN','USD');$('#loading-overlay').modal({backdrop: 'static',keyboard: false});return activateUserAccountJoinUs();" class="bdr-curve btn btn-primary nxt-btn" value=" Next"> -->
            <c:choose>
               <c:when test="${language=='en'}">
                   <input type="button" onclick="javascript:kenshoo_conv('Registration_Step2','${planSummary}','','Regis_Oversea_Step2 EN','USD');return activateUserAccountJoinUs();" class="bdr-curve btn btn-primary nxt-btn" value=" <fmt:message key="annual.button.next" bundle="${msg}" />" />
               </c:when>
               <c:otherwise>
                   <input type="button" onclick="javascript:kenshoo_conv('Registration_Step2','${planSummary}','','Regis_Oversea_Step2 ZH','USD');return activateUserAccountJoinUs();" class="bdr-curve btn btn-primary nxt-btn" value=" <fmt:message key="annual.button.next" bundle="${msg}" />" />
               </c:otherwise>
           </c:choose>
        </div>
        <div class="clearfix"></div>
    </div>
</div>

</form:form>
</div>
<!--/.row-->
</div>
<!--/.container-->

</section>
<!--<link href="<%=request.getContextPath()%>/resources/css/easy-autocomplete.min.css" rel="stylesheet">-->
<!--<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.easy-autocomplete.min.js"></script>-->
<link href="<%=request.getContextPath()%>/resources/css/awesomplete.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/vendor/awesomplete.min.js"></script>
<script>
var selectedPlanName = $('#selectedPlanName').val();
console.log(selectedPlanName);

var options;
if("${planName}"=="basicA" || "${planName}"=="basicB" || "${planName}"=="medicalWorldwideA" || "${planName}"=="medicalWorldwideB"){
    /*options = {       
          data : [ "Australia", "Austria", "Belgium",
                    "Canada", "Denmark", "France",
                    "Germany", "Holland", "India", "Indonesia", 
                    "Ireland", "Italy", "Japan", "Republic of Korea", "Macau",
                    "Malaysia", "New Zealand",
                    "People Republic of China",
                    "Poland", "Portugal", "Singapore",
                    "Spain", "Sweden",
                    "Switzerland", "Taiwan", "Thailand", 
                    "United Kingdom", "Vietnam", "United States of America" ],         
          list: { match: { enabled: true } }
    };*/
    options = {       
	    list : [ "Australia", "Austria", "Belgium",
	              "Canada", "Denmark", "France",
	              "Germany", "Holland", "India", "Indonesia", 
	              "Ireland", "Italy", "Japan", "Republic of Korea", "Macau",
	              "Malaysia", "New Zealand",
	              "People Republic of China",
	              "Poland", "Portugal", "Singapore",
	              "Spain", "Sweden",
	              "Switzerland", "Taiwan", "Thailand", 
	              "United Kingdom", "Vietnam", "United States of America" ],
	    minChars: 1,          
    };   
}else if("${planName}"=="medicalAsiaA" || "${planName}"=="medicalAsiaB"){
	/*options = {       
          data : ["India","Japan","Republic of Korea","Macau","Malaysia","People Republic of China","Singapore","Taiwan","Thailand","Vietnam"],         
          list: { match: { enabled: true } }
	    };*/
	    options = {       
   	      list : ["India","Japan","Republic of Korea","Macau","Malaysia","People Republic of China","Singapore","Taiwan","Thailand","Vietnam"],
   	      minChars: 1,
	    };	    
}
var countryInput = document.getElementById("countryOfInstitution");
var awesompleteTest = new Awesomplete(countryInput,options);
//awesompleteTest.list = ["India","Japan","Republic of Korea","Macau","Malaysia","People Republic of China","Singapore","Taiwan","Thailand","Vietnam"];
//$("#countryOfInstitution").easyAutocomplete(options);
</script>
<link href="<%=request.getContextPath()%>/resources/css/oversea.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/moment.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/oversea.js"></script>
