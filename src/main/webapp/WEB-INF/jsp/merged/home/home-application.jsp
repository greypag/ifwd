<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page import="java.util.*"%>
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<script type="text/javascript">
var context="<%=request.getContextPath()%>";
var plan="${plan}"; 
</script>

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/icomoon.min.css"></head>

<div class="fwd-savie-wrapper">
    
    <div class="container container-fluid">

    <!-- Breadcrumb Component Start-->
    <div class="container container-fluid container--breadcrumb">
        <c:set var="breadcrumbItems" value="breadcrumb.item.home" /> 
        <c:set var="breadcrumbActive" value="0" />

        <c:if test="${planIndex == 'easy-home-care'}">
            <c:set var="breadcrumbItems">
                breadcrumb.item.home,breadcrumb.item.protect,breadcrumb.item.household,breadcrumb.item.easyhome,breadcrumb.item.application
            </c:set>
            <c:set var="breadcrumbActive">4</c:set>
        </c:if>
        <c:if test="${planIndex == 'home-liability'}">
            <c:set var="breadcrumbItems">
                breadcrumb.item.home,breadcrumb.item.protect,breadcrumb.item.household,breadcrumb.item.home.liability,breadcrumb.item.application
            </c:set>
            <c:set var="breadcrumbActive">4</c:set>
        </c:if>

        <jsp:include page="/WEB-INF/jsp/merged/comp/breadcrumb.jsp">
            <jsp:param name="breadcrumbItems" value="${breadcrumbItems}"/>
            <jsp:param name="breadcrumbActive" value="${breadcrumbActive}"/>
        </jsp:include>
    </div>
    <!-- Breadcrumb Component End-->

     <div class="savie-online-container app-pg-ctnr" id="ehome-app-application">
     <!-- <div class="container-fluid fwd-full-container browse-holder">
        <div class="application-page-header et-header-browse">
           <div class="browse-container">
              <div class="row reset-margin hidden-xs hidden-sm">
                 <ul class="common-steps-list six-steps nav nav-pills">
                    <li class="step-number" id="first-step"><button type="button" class="et-header-info-btn completed-step"><i class="fa fa-check"></i>Select Plan</button></li>
                    <li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/easy-home/header-browse-arrow.png" class="browse-arrow"></li>
                    <li class="step-number"><button type="button" class="et-header-info-btn active"><span class="status">2</span>Application</button></li>
                    <li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/easy-home/header-browse-arrow.png" class="browse-arrow"></li>
                    <li class="step-number" id="last-steps"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">3</span>Summary &amp; Payment</button></li>
                    <li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/easy-home/header-browse-arrow.png" class="browse-arrow"></li>
                    <li class="step-number"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">4</span>Confirmation</button></li>
                 </ul>
             </div>
           </div>  
        </div>
     </div> -->
    <div class="container-fluid summary-bar">
        <div class="row">
            <div class="summary-bar-container">
                
                <ul class="summary-group clearfix">
                    <!--  -->
                    <li class="back">
                        <a href="<%=request.getContextPath()%>/${language}/household-insurance/${planIndex}/quote" class="btn-summary-back"><i class="icon icon-arrow-left2"></i></a>
                    </li>
                    <li class="first">
                        <div class="form-group">
                            <div class="fld-wrapper">
                            <p class="fld-label">
                                ${plan == 'home-liability' ? language == 'en' ? 'Home Liability':'家居責任保險':language == 'en' ? 'Easy HomeCare':'易安心家居保' }
                            </p>
                            <p class="fld-val"></p>
                            </div>
                        </div>                        
                    </li>
                    <li class="hidden-xs">
                        <div class="form-group">
                            <div class="fld-wrapper">
                            <p class="fld-label"><fmt:message key="lable.promo.code" bundle="${msg}" /></p>
                            <p class="fld-val display--ellipsis"><span class="txt-promote-code">${homeQuoteDetails.referralCode == "" ? '-' : homeQuoteDetails.referralCode}</span></p>
                            </div>
                        </div>
                    </li>
                    <li class="hidden-xs">
                        <div class="form-group">
                            <div class="fld-wrapper">
                            <p class="fld-label"><fmt:message key="lable.theclub.member" bundle="${msg}" /></p>
                            <p class="fld-val"><span class="txt-theclub-member">${empty theClubMembershipNo ? '-' : theClubMembershipNo}</span></p>
                            </div>
                        </div>
                    </li>
                    <li class="hidden-xs">
                        <div class="form-group">
                            <div class="fld-wrapper">
                            <p class="fld-label"><fmt:message key="lable.original.price" bundle="${msg}" /></p>
                            <p class="fld-val"><fmt:message key="label.dollar.hkd.en" bundle="${msg}" /> <fmt:formatNumber pattern="0.00" type="number" value="${homeQuoteDetails.grossPremium }" maxFractionDigits="2"/> <fmt:message key="label.dollar.hkd.cn" bundle="${msg}" /></p>
                            </div>
                        </div>
                    </li>
                    <li class="hidden-xs">
                        <div class="form-group">
                            <div class="fld-wrapper">
                            <p class="fld-label"><fmt:message key="lable.discount" bundle="${msg}" /></p>
                            <p class="fld-val"><fmt:message key="label.dollar.hkd.en" bundle="${msg}" /> <fmt:formatNumber pattern="0.00" type="number" value="${homeQuoteDetails.discountAmount }" maxFractionDigits="2"/> <fmt:message key="label.dollar.hkd.cn" bundle="${msg}" /></p>
                            </div>
                        </div>
                    </li>
                    <li class="last hidden-xs">
                    	<div class="form-group">
                            <div class="fld-wrapper">
                            <p class="fld-label"><fmt:message key="lable.amount.due" bundle="${msg}" /></p>
                            <p class="fld-val"><span class="txt-hkd-prefix"><fmt:message key="label.dollar.hkd.en" bundle="${msg}" /></span><span class="txt-price"><fmt:formatNumber pattern="0.00" type="number" value="${homeQuoteDetails.totalDue }" maxFractionDigits="2"/></span><span class="txt-hkd-suffix"><fmt:message key="label.dollar.hkd.cn" bundle="${msg}" /></span></p>
                            </div>
                        </div>
                    </li>
                    <li class="visible-xs dropdown-more">
                         <a href="javascript:void(0);" class="btn-summary-back" class="dropdown-toggle" data-toggle="dropdown"><i class="glyphicon glyphicon-chevron-down"></i></a>

                         <ul class="col-sm-12 dropdown-menu dropdown-menu-more">
                            <li>
                                <div class="form-group">
                                    <div class="fld-wrapper">
                                        <p class="fld-label"><fmt:message key="lable.promo.code" bundle="${msg}" /></p>
                                        <p class="fld-val"><span class="txt-promote-code">${homeQuoteDetails.referralCode == "" ? '-' : homeQuoteDetails.referralCode}</span></p>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="form-group">
                                    <div class="fld-wrapper">
                                        <p class="fld-label"><fmt:message key="lable.theclub.member" bundle="${msg}" /></p>
                                        <p class="fld-val"><span class="txt-theclub-member">${empty theClubMembershipNo ? '-' : theClubMembershipNo}</span></p>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="form-group">
                                    <div class="fld-wrapper">
                                        <p class="fld-label"><fmt:message key="lable.original.price" bundle="${msg}" /></p>
                                        <p class="fld-val"><fmt:message key="label.dollar.hkd.en" bundle="${msg}" /> <fmt:formatNumber pattern="0.00" type="number" value="${homeQuoteDetails.grossPremium }" maxFractionDigits="2"/> <fmt:message key="label.dollar.hkd.cn" bundle="${msg}" /></p>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="form-group">
                                    <div class="fld-wrapper">
                                        <p class="fld-label"><fmt:message key="lable.discount" bundle="${msg}" /></p>
                                        <p class="fld-val"><fmt:message key="label.dollar.hkd.en" bundle="${msg}" /> <fmt:formatNumber pattern="0.00" type="number" value="${homeQuoteDetails.discountAmount }" maxFractionDigits="2"/> <fmt:message key="label.dollar.hkd.cn" bundle="${msg}" /></p>
                                    </div>
                                </div>
                            </li>
                             <li>
                                <div class="form-group">
                                    <div class="fld-wrapper">
                                        <p class="fld-label"><fmt:message key="lable.amount.due" bundle="${msg}" /></p>
                                        <p class="fld-val"><span class="txt-hkd-prefix"><fmt:message key="label.dollar.hkd.en" bundle="${msg}" /></span><span class="txt-price"><fmt:formatNumber pattern="0.00" type="number" value="${homeQuoteDetails.totalDue }" maxFractionDigits="2"/></span> <fmt:message key="label.dollar.hkd.cn" bundle="${msg}" /></p>
                                    </div>
                                </div>
                            </li>
                         </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>
     <div class="app-pg-cont">
        <form id="ef-form-application">
        <div class="container-fluid">

            <div class="row form-block">
                <div class="col-xs-12">
                    <h3 class="heading-title"><fmt:message key="application.jumbo.details" bundle="${msg}" /></h3>
                </div>
                    
                <div class="col-xs-12 col-md-12">
                    <div class="row">

                        <div class="col-xs-12 col-md-6">
                            
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <input class="mdl-textfield__input" type="text" id="applicantName" name="applicantName" data-keyblock-alphabet-space="true" maxlength="100"
                                        	<c:choose>
												<c:when test="${userDetails != null && userDetails.fullName != '' && userDetails.userName != '*DIRECTGI'}">
											    	value="${userDetails.fullName }" readonly="readonly"
											    </c:when>
											    <c:otherwise>
											    	value="${editableUserDetails.fullName }"
											    </c:otherwise>
											</c:choose>
										    autocomplete="off">
                                        <label class="mdl-textfield__label" for="applicantName"><fmt:message key="application.input.engname" bundle="${msg}" /></label>
                                    </div>
                                    
                                </div>
                                <span class="error-msg" id="applicantNameErrMsg"></span>
                            </div>
                        </div>
                    </div>

                    <div class="row">

                        <div class="col-xs-12 col-md-6">
                                <div class="form-group">
                                    <div class="fld-wrapper">
                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-date">
                                            <input class="mdl-textfield__input mobiscroll-date" type="text" id="dob" name="dob" value="${editableUserDetails.dob}" autocomplete="off">
                                            <label class="mdl-textfield__label" for="dob"><fmt:message key="application.input.birth" bundle="${msg}" /></label>
                                        </div>
                                        
                                    </div>
                                    <span class="error-msg" id="dobErrMsg"></span>
                                </div>
                        </div>

                        <div class="col-xs-12 col-md-3">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <div class="mdl-select">
                                        <select id="apphkidandpassport" name="apphkidandpassport">
                                            <option value="" disabled selected></option>
                                            <option value="appHkid" <c:if test="${editableUserDetails != null && editableUserDetails.hkid != ''}"> selected="selected"</c:if>><fmt:message key="label.hkid" bundle="${msg}" /></option>
                                            <option value="appPassport" <c:if test="${editableUserDetails != null && editableUserDetails.passport != ''}"> selected="selected"</c:if>><fmt:message key="label.passport" bundle="${msg}" /></option></option>
                                        </select>
                                        <label class="mdl-textfield__label" for="apphkidandpassport"><fmt:message key="application.input.idno" bundle="${msg}" /></label>
                                    </div>
                                    
                                </div>
                                <span class="error-msg" id="apphkidandpassportErrMsg"></span>
                            </div>
                        </div>
						
                        <div class="col-xs-12 col-md-3">
                                <div class="form-group b-left">
                                    <div class="fld-wrapper">
                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                            <input class="mdl-textfield__input" type="text" id="hkId" name="hkId"
                                            	<c:choose>
													<c:when test="${editableUserDetails != null && editableUserDetails.hkid != ''}">
												    	value="${editableUserDetails.hkid }" 
												    </c:when>
												    <c:when test="${editableUserDetails != null && editableUserDetails.passport != ''}">
												    	value="${editableUserDetails.passport }"
												    </c:when>
												</c:choose>
                                            	autocomplete="off">
                                            <label class="mdl-textfield__label" for="hkId"><fmt:message key="application.input.idno" bundle="${msg}" /></label>
                                        </div>
                                        
                                    </div>
                                    <span class="error-msg" id="hkIdErrMsg"></span>
                                </div>
                        </div>
                    </div>

                    <div class="row">

                        <div class="col-xs-12 col-md-6">
                                <div class="form-group">
                                    <div class="fld-wrapper">
                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                            <input class="mdl-textfield__input" type="tel" id="inputMobileNo" name="mobileNo"  maxlength="8"
                                            	<c:choose>
													<c:when test="${userDetails != null && userDetails.userName != '' && userDetails.userName != '*DIRECTGI'}">
												    	value="${userDetails.mobileNo}" readonly="readonly"
												    </c:when>
												    <c:otherwise>
												    	value="${editableUserDetails.mobileNo }"
												    </c:otherwise>
												</c:choose>
												autocomplete="off">
                                            <label class="mdl-textfield__label" for="mobileNo"><fmt:message key="application.input.mobile" bundle="${msg}" /></label>
                                        </div>
                                        
                                    </div>
                                    <span class="error-msg" id="mobileNoErrMsg"></span>
                                </div>
                        </div>

                        <div class="col-xs-12 col-md-6">
                                <div class="form-group b-left">
                                    <div class="fld-wrapper">
                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                            <input class="mdl-textfield__input" type="email" id="inputEmail" name="emailAddress" maxlength="50"
	                                            <c:choose>
													<c:when test="${userDetails != null && userDetails.userName != '' && userDetails.userName != '*DIRECTGI'}">
												    	value="${userDetails.emailAddress}" readonly="readonly"
												    </c:when>
													    <c:otherwise>
													    	value="${editableUserDetails.emailAddress }"
													    </c:otherwise>
													</c:choose>
												autocomplete="off">
                                            <label class="mdl-textfield__label" for="emailAddress"><fmt:message key="application.input.email" bundle="${msg}" /></label>
                                        </div>
                                        
                                    </div>
                                    <span class="error-msg" id="emailAddressErrMsg"></span>
                                </div>
                        </div>
                    </div>

                    <div class="row">
                        
                        <div class="col-xs-12">
                            <h4><fmt:message key="application.input.address" bundle="${msg}" /></h4>
                        </div>
                        
                        <div class="col-xs-12 col-sm-4">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <input value="${editableHomeCareDetails.applicantRoom }" class="mdl-textfield__input" type="text" id="applicantRoom" name="applicantRoom" maxlength="10" data-keyblock-alphabet-num-space="true" autocomplete="off">
                                        <label class="mdl-textfield__label" for="applicantRoom"><fmt:message key="application.input.address.room" bundle="${msg}" /></label>
                                    </div>
                                    
                                </div>
                                <span class="error-msg" id="applicantRoomErrMsg"></span>
                            </div>
                        </div>
                    
                        <div class="col-xs-12 col-sm-4">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <input value="${editableHomeCareDetails.applicantFloor }" class="mdl-textfield__input" type="text" id="applicantFloor" name="applicantFloor" maxlength="5" data-keyblock-alphabet-num-space="true" autocomplete="off">
                                        <label class="mdl-textfield__label" for="applicantFloor"><fmt:message key="application.input.address.floor" bundle="${msg}" /></label>
                                    </div>
                                    
                                </div>
                                <span class="error-msg" id="applicantFloorErrMsg"></span>
                            </div>
                        </div>                    
                    
                        <div class="col-xs-12 col-sm-4">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <input value="${editableHomeCareDetails.applicantBlock }" class="mdl-textfield__input" type="text" id="applicantBlock" name="applicantBlock"  maxlength="5" data-keyblock-alphabet-num-space="true" autocomplete="off">
                                        <label class="mdl-textfield__label" for="applicantBlock"><fmt:message key="application.input.address.block" bundle="${msg}" /></label>
                                    </div>
                                    
                                </div>
                                <span class="error-msg" id="applicantBlockErrMsg"></span>
                            </div>
                        </div>
                    </div>

                    <div class="row">

                        
                        <div class="col-xs-12 col-sm-6">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <input value="${editableHomeCareDetails.applicantBuilding }" class="mdl-textfield__input" type="text" id="applicantBuilding" name="applicantBuilding" maxlength="50" data-keyblock-alphabet-num-space="true" autocomplete="off">
                                        <label class="mdl-textfield__label" for="applicantBuilding"><fmt:message key="application.input.address.building" bundle="${msg}" /></label>
                                    </div>
                                    
                                </div>
                                <span class="error-msg" id="applicantBuildingErrMsg"></span>
                            </div>
                        </div>
                    
                        <div class="col-xs-12 col-sm-6">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <input value="${editableHomeCareDetails.applicantEstate }" class="mdl-textfield__input" type="text" id="applicantEstate" name="applicantEstate" maxlength="50" data-keyblock-alphabet-num-space="true" autocomplete="off">
                                        <label class="mdl-textfield__label" for="applicantEstate"><fmt:message key="application.input.address.estate" bundle="${msg}" /></label>
                                    </div>
                                    
                                </div>
                                <span class="error-msg" id="applicantEstateErrMsg"></span>
                            </div>
                        </div>
                    </div>

                    <div class="row">

                        
                        <div class="col-xs-12 col-sm-6">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <input value="${editableHomeCareDetails.applicantStreetNo }" class="mdl-textfield__input" type="text" id="applicantStreetNo" name="applicantStreetNo" maxlength="9" data-keyblock-alphabet-num-space-dash="true" autocomplete="off">
                                        <label class="mdl-textfield__label" for="applicantStreetNo"><fmt:message key="application.input.address.street.no" bundle="${msg}" /></label>
                                    </div>
                                    
                                </div>
                                <span class="error-msg" id="applicantStreetNoErrMsg"></span>
                            </div>
                        </div>
                    
                        <div class="col-xs-12 col-sm-6">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <input value="${editableHomeCareDetails.applicantStreetName }" class="mdl-textfield__input" type="text" id="applicantStreetName" name="applicantStreetName" maxlength="50" data-keyblock-alphabet-num-space="true" autocomplete="off">
                                        <label class="mdl-textfield__label" for="applicantStreetName"><fmt:message key="application.input.address.street.name" bundle="${msg}" /></label>
                                    </div>
                                    
                                </div>
                                <span class="error-msg" id="applicantStreetNameErrMsg"></span>
                            </div>
                        </div>
                    </div>



                    <div class="row">
                        <div class="col-xs-12 col-md-6">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <div class="mdl-select">
                                        
                                        <select id="applicantDistrict" name="applicantDistrict" onchange="setDropArea(this.value,'selectApplicantArea','applicantArea');">
                                            <option value="" disabled selected></option>
                                            <c:forEach
                                                var="district" items="${districtList}">
                                                <option value="${district.code}" <c:if test="${district.code == editableHomeCareDetails.applicantDistrict }"> selected="selected"</c:if>>${district.description}</option>
                                            </c:forEach>
                                        </select>
                                        
                                        
                                        <label class="mdl-textfield__label" for="applicantDistrict"><fmt:message key="application.input.address.district" bundle="${msg}" /></label>
                                    </div>
                                    <div class="hidden">
                                    	<select id="selectApplicantArea">
                                            <c:forEach
                                                var="district" items="${districtList}">
                                                <option value="${district.code}" <c:if test="${district.code == editableHomeCareDetails.aDistrict }"> selected="selected"</c:if>>${district.area}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <span class="error-msg" id="applicantDistrictErrMsg"></span>
                            </div>
                        </div>

                        <div class="col-xs-12 col-md-6">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <div class="mdl-select">
                                        <select id="applicantArea" name="applicantArea">
                                            <option value="" disabled selected></option>
                                            <c:forEach var="areaList" items="${mapArea}">
                                                <option value="${areaList.key}" <c:if test="${areaList.key == editableHomeCareDetails.applicantArea }"> selected="selected"</c:if>>${areaList.value}</option>
                                            </c:forEach>
                                        </select>
                                        <label class="mdl-textfield__label" for="applicantArea"><fmt:message key="application.input.address.area" bundle="${msg}" /></label>
                                    </div>
                                    
                                </div>
                                <span class="error-msg" id="applicantAreaErrMsg"></span>
                            </div>
                        </div>
                    </div>

                </div>
                
            </div>

            <div class="row form-block">
                <div class="col-xs-12">
                    <h3 class="heading-title"><fmt:message key="application.jumbo.insureddetails" bundle="${msg}" /></h3>
                </div>
                    
                <div class="col-xs-12 col-md-12">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="form-group">
                                <div class="fld-wrapper ctrl-insured-addr">
                                    <div class="row">
                                        <div class="col-xs-12 col-md-6">
                                            <p class="fld-label"><fmt:message key="application.input.sameaddress" bundle="${msg}" /></p>
                                        </div>
                                        <div class="col-xs-12 col-md-6 cb-toggle">
                                            <div class="checkbox checkbox-slider--b checkbox-slider-md">
                                                <label
                                                	<c:choose>
														<c:when test="${editableHomeCareDetails.cbSameCorrAddr != false}">
													    	class="on"
													    </c:when>
													    <c:otherwise>
													    	class="off"
													    </c:otherwise>
													</c:choose>
                                                	>
                                                    <i><fmt:message key="option.no" bundle="${msg}" /></i><input type="checkbox" name="cbSameCorrAddr" id="cbSameCorrAddr" data-txton="No" data-txtoff="Yes" <c:if test="${editableHomeCareDetails.cbSameCorrAddr != false}">checked</c:if>><span></span><i><fmt:message key="option.yes" bundle="${msg}" /></i>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                        </div>
                    </div>

                    <div class="row insured-addr-more" <c:if test="${!(editableHomeCareDetails.cbSameCorrAddr != false)}">style="display: block;"</c:if>>

                        <div class="col-xs-12">
                            <h4><fmt:message key="application.input.insuredaddress" bundle="${msg}" /></h4>
                        </div>

                        <div class="col-xs-12 col-sm-4">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <input value="${editableHomeCareDetails.aRoom }" class="mdl-textfield__input" type="text" id="aRoom" name="aRoom" maxlength="10" data-keyblock-alphabet-num-space="true" autocomplete="off">
                                        <label class="mdl-textfield__label" for="aRoom"><fmt:message key="application.input.address.room" bundle="${msg}" /></label>
                                    </div>
                                    
                                </div>
                                <span class="error-msg" id="aRoomErrMsg"></span>
                            </div>
                        </div>
                    
                        <div class="col-xs-12 col-sm-4">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <input value="${editableHomeCareDetails.aFloor }" class="mdl-textfield__input" type="text" id="aFloor" name="aFloor" maxlength="5" data-keyblock-alphabet-num-space="true" autocomplete="off">
                                        <label class="mdl-textfield__label" for="aFloor"><fmt:message key="application.input.address.floor" bundle="${msg}" /></label>
                                    </div>
                                    
                                </div>
                                <span class="error-msg" id="aFloorErrMsg"></span>
                            </div>
                        </div>
                    
                    
                        <div class="col-xs-12 col-sm-4">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <input value="${editableHomeCareDetails.aBlock }" class="mdl-textfield__input" type="text" id="aBlock" name="aBlock" maxlength="5" data-keyblock-alphabet-num-space="true" autocomplete="off">
                                        <label class="mdl-textfield__label" for="aBlock"><fmt:message key="application.input.address.block" bundle="${msg}" /></label>
                                    </div>
                                    
                                </div>
                                <span class="error-msg" id="aBlockErrMsg"></span>
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-6">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <input value="${editableHomeCareDetails.aBuilding }" class="mdl-textfield__input" type="text" id="aBuilding" name="aBuilding" maxlength="50" data-keyblock-alphabet-num-space="true" autocomplete="off">
                                        <label class="mdl-textfield__label" for="aBuilding"><fmt:message key="application.input.address.building" bundle="${msg}" /></label>
                                    </div>
                                    
                                </div>
                                <span class="error-msg" id="aBuildingErrMsg"></span>
                            </div>
                        </div>
                    
                        <div class="col-xs-12 col-sm-6">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <input value="${editableHomeCareDetails.aEstate }" class="mdl-textfield__input" type="text" id="aEstate" name="aEstate" maxlength="50" data-keyblock-alphabet-num-space="true" autocomplete="off">
                                        <label class="mdl-textfield__label" for="aEstate"><fmt:message key="application.input.address.estate" bundle="${msg}" /></label>
                                    </div>
                                    
                                </div>
                                <span class="error-msg" id="aEstateErrMsg"></span>
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-6">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <input value="${editableHomeCareDetails.aStreetNo }" class="mdl-textfield__input" type="text" id="aStreetNo" name="aStreetNo" maxlength="5" data-keyblock-alphabet-num-space="true" autocomplete="off">
                                        <label class="mdl-textfield__label" for="aStreetNo"><fmt:message key="application.input.address.street.no" bundle="${msg}" /></label>
                                    </div>
                                    
                                </div>
                                <span class="error-msg" id="aStreetNoErrMsg"></span>
                            </div>
                        </div>
                    
                        <div class="col-xs-12 col-sm-6">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <input value="${editableHomeCareDetails.aStreetName }" class="mdl-textfield__input" type="text" id="aStreetName" name="aStreetName" maxlength="50" data-keyblock-alphabet-num-space="true" autocomplete="off">
                                        <label class="mdl-textfield__label" for="aStreetName"><fmt:message key="application.input.address.street.name" bundle="${msg}" /></label>
                                    </div>
                                    
                                </div>
                                <span class="error-msg" id="aStreetNameErrMsg"></span>
                            </div>
                        </div>

                        <div class="col-xs-12 col-md-6">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <div class="mdl-select">
                                        <select id="aDistrict" name="aDistrict"  onchange="setDropArea(this.value,'selectaArea','aArea');">
                                            <option value="" disabled selected></option>
                                            <c:forEach
                                                var="district" items="${districtList}">
                                                <option value="${district.code}" <c:if test="${district.code == editableHomeCareDetails.aDistrict }"> selected="selected"</c:if>>
                                                    <c:out value="${district.description}" />
                                                </option>
                                            </c:forEach>
                                        </select>
                                        <label class="mdl-textfield__label" for="aDistrict"><fmt:message key="application.input.address.district" bundle="${msg}" /></label>
                                    </div>
                                    <div class="hidden">
                                    	<select id="selectaArea">
                                            <c:forEach
                                                var="district" items="${districtList}">
                                                <option value="${district.code}" <c:if test="${district.code == editableHomeCareDetails.aDistrict }"> selected="selected"</c:if>><c:out value="${district.area}" /></option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <span class="error-msg" id="aDistrictErrMsg"></span>
                            </div>
                        </div>

                        <div class="col-xs-12 col-md-6">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <div class="mdl-select">
                                        <select id="aArea" name="aArea">
                                            <option value="" disabled selected></option>
                                            <c:forEach var="areaList" items="${mapArea}">
                                                <option value="${areaList.key}" <c:if test="${areaList.key == editableHomeCareDetails.aArea }"> selected="selected"</c:if>>
                                                    <c:out value="${areaList.value}" />
                                                </option>
                                            </c:forEach>
                                        </select>
                                        <label class="mdl-textfield__label" for="aArea"><fmt:message key="application.input.address.area" bundle="${msg}" /></label>
                                    </div>
                                    
                                </div>
                                <span class="error-msg" id="aAreaErrMsg"></span>
                            </div>
                        </div>

                        <div class="col-xs-12">
                            <br>
                        </div>
                    </div>


                    <div class="row">

                        <div class="col-xs-12 col-md-6">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <div class="mdl-select">
                                        <select id="netFloorArea" name="netFloorArea">
                                            <option value="" disabled selected></option>
                                            <c:forEach var="floorAreaList" items="${mapNetFloorArea}">
                                                <option value="${floorAreaList.key}" <c:if test="${floorAreaList.key == editableHomeCareDetails.netFloorArea }"> selected="selected"</c:if>>
                                                    <c:out value="${floorAreaList.value}" />
                                                </option>
                                            </c:forEach>
                                        </select>
                                        <label class="mdl-textfield__label" for="netFloorArea"><fmt:message key="application.input.floorarea" bundle="${msg}" /></label>
                                    </div>
                                    
                                </div>
                                <span class="error-msg" id="netFloorAreaErrMsg"></span>
                            </div>
                        </div>

                        <div class="col-xs-12 col-md-6">
                                <div class="form-group b-left">
                                    <div class="fld-wrapper">
                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-date">
                                            <input value="${editableHomeCareDetails.effectiveDate }" class="mdl-textfield__input mobiscroll-date" type="text" id="effectdate" name="effectiveDate">
                                            <label class="mdl-textfield__label" for="effectdate"><fmt:message key="application.input.eff.coverage" bundle="${msg}" /></label>
                                        </div>
                                        
                                    </div>
                                    <span class="error-msg" id="effectdateErrMsg"></span>
                                </div>
                        </div>
                    </div>
                </div>
                
            </div>

            <div class="row form-block">
                <div class="col-xs-12">
                    <h3 class="heading-title"><fmt:message key="application.jumbo.declaration" bundle="${msg}" /></h3>
                </div>
                <div class="col-xs-12 col-md-12">
                    <div class="form-group no-border">
                        <div class="checkbox">
                            <input type="checkbox" name="checkbox1" id="checkbox1"><label for="checkbox1"><fmt:message key="application.declaration.text1" bundle="${msg}" />
<br><fmt:message key="application.declaration.home.text2" bundle="${msg}" />
<br><fmt:message key="application.declaration.home.text3" bundle="${msg}" />
<br><fmt:message key="application.declaration.home.text4" bundle="${msg}" />
<br><fmt:message key="application.declaration.home.text5" bundle="${msg}" />
<br><fmt:message key="application.declaration.home.text6" bundle="${msg}" /></label>
                            <span class="error-msg" id="declarrationErrMsg"></span>
                        </div>
                        <div class="checkbox sep">
                            <input type="checkbox" name="checkbox2" id="checkbox2"><label for="checkbox2"><fmt:message key="application.declaration.tickbox1.prefix" bundle="${msg}" /><a href="<fmt:message key="application.declaration.tickbox1.link" bundle="${msg}" />" target="_blank"><fmt:message key="application.declaration.tickbox1.text" bundle="${msg}" /></a><fmt:message key="application.declaration.tickbox1.suffix" bundle="${msg}" /></label>
                            <span class="error-msg" id="declarration2ErrMsg"></span>
                        </div>
                        <hr>
                        <p><fmt:message key="application.declaration.home.text7" bundle="${msg}" /></p>
                        <div class="checkbox">
                            <input type="checkbox" name="checkbox3" id="donotWishDirectMarketing"><label for="donotWishDirectMarketing"><fmt:message key="application.declaration.tickbox2" bundle="${msg}" /></label>
                            
                        </div>
                        <div class="checkbox">
                            <input type="checkbox" name="checkbox4" id="donotDisclose"><label for="donotDisclose"><fmt:message key="application.declaration.tickbox3" bundle="${msg}" /></label>                            
                        </div>
						<div class="checkboxBubble">
							<fmt:message key="general.declarations.PDPO.warning" bundle="${msg}" />
						</div>                        
                    </div>
                </div>
            </div>




            <div class="btn-row text-center">
                <a href="javascript:void(0);" onclick="perventRedirect=false;BackMe();" class="btn-app eh-btn-back grey-out"><fmt:message key="application.button.back" bundle="${msg}" /></a>
                <a href="javascript:void(0);" class="btn-app eh-btn-next"><fmt:message key="application.button.next" bundle="${msg}" /></a>
            </div>
            
            <div class="submit__error">
                <div class="text-center">
                    <span class="submit__errormsg" id="submit__errormsg"></span>
                </div>
            </div>
            
        </div>
        <input type="hidden" name="totalDue" value="${ homeQuoteDetails.totalDue}">
	    <input type="hidden" name="grossPremium" value="${ homeQuoteDetails.grossPremium}">
		<input type="hidden" name="planCode" value="${ homeQuoteDetails.planCode}">
		<input type="hidden" name="answer1" value="${answer1}">
		<input type="hidden" name="answer2" value="${answer2}">
        </form>
    </div>
    <!-- Main Content End-->

		
    </div>
</div>
<script type="text/javascript">
function BackMe() {
    window.history.back();
}

function setDropArea(id, selectId, setId) {
    $('#' + selectId).find('option[value="' + id + '"]').attr('selected', 'selected');
    $('#' + setId).val($("#" + selectId + " option[value='"+id+"']").text());
    $('#' + setId).parent().addClass('is-dirty');
    $('#' + setId).parent().parent().parent().addClass('has-success');
    $('#' + setId).change();
}
</script>
