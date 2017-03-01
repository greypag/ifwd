<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>

<%@page import="com.ifwd.fwdhk.model.PurchaseHistory"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<!DOCTYPE html>
<html lang="en">
    <link href="<%=request.getContextPath()%>/resources/css/savie/styles.css" rel="stylesheet">
    <body>
        <%!
            boolean isSaleActiveClass = false;
            boolean isEservicesActiveClass = true;
            String eServicesPage = "default";
        %>
        <div class="fwd-savie-wrapper">
            <!-- HEADER -->
            <div class="container-fluid fwd-full-container" id="eServices-personal-info">
                <div class="fwd-container-limit clearfix sidebar">
                    <div class="btn-group account-dropdown hidden-md hidden-lg clearfix" id="eServices-sidebar-mp">
                        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                            <span class="button-text"><fmt:message key="userAccount.Profile.setting" bundle="${msg}" /></span> <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu" role="menu">
                            <li class="active"><a href="#personal-info-tab" data-toggle="tab"><fmt:message key="userAccount.Profile.setting" bundle="${msg}" /></a></li>
                            <li><a href="#purchase-history-tab" data-toggle="tab"><fmt:message key="userAccount.Purchase.history" bundle="${msg}" /></a></li>
                            <li><a href="#referral-tab" data-toggle="tab"><fmt:message key="userAccount.Referrals.promo" bundle="${msg}" /></a></li>
                        </ul>
                    </div>
                    <div class="pull-left eServices-sidebar hidden-xs hidden-sm" id="eServices-sidebar">
                        <%--@include file="includes/eServices-sidebar.jsp" --%> 
                        <div class="row reset-margin">
                            <div class="col-xs-12 profile">
                                <img src="<%=request.getContextPath()%>/resources/images/avatar.png" class="avatar">
                                <p class="name">${userDetails.userName }</p>
                                <!-- <p class="age"></p> -->
                            </div>
                            <div class="col-xs-6 col-md-12 menu setting">
                                <a href="#personal-info-tab" class="profile-meu-item link-menu active" id="profile-setting" data-toggle="tab">
                                    <span class="icon-sidebar-menu">
                                        <span class="eServices-icons profile-setting" id="profile-setting-span"></span>
                                    </span>
                                    <span class="text"><fmt:message key="userAccount.Profile.setting" bundle="${msg}" /></span>
                                </a>
                            </div>
                            <div class="col-xs-6 col-md-12 menu purchase">
                                <a href="#purchase-history-tab" class="profile-meu-item link-menu" id="purchase-history" data-toggle="tab">
                                    <span class="icon-sidebar-menu">
                                        <span class="eServices-icons purchase-history-icon " id="purchase-history-span"></span>
                                    </span>
                                    <span class="text"><fmt:message key="userAccount.Purchase.history" bundle="${msg}" /></span>
                                </a>
                            </div>
                            <div class="col-xs-6 col-md-12 menu referrals">
                                <a href="#referral-tab" class="profile-meu-item link-menu" id="referrals-and-promo" data-toggle="tab">
                                    <span class="icon-sidebar-menu">
                                        <span class="eServices-icons menu-referrals-icon " id="referrals-and-promo-span"></span>
                                    </span>
                                    <span class="text"><fmt:message key="userAccount.Referrals.promo" bundle="${msg}" /></span>
                                </a>
                            </div>
                            <!--<div class="col-xs-6 col-md-12 menu logout">
                                <a href="<%=request.getContextPath()%>/userLogout" class="link-menu " id="logout">
                                    <span class="icon-sidebar-menu">
                                        <span class="eServices-icons menu-logout-icon " id="logout-span"></span>
                                    </span>
                                    <span class="text"><fmt:message key="userAccount.Logout" bundle="${msg}" /></span>
                                </a>
                            </div>-->
                        </div>
                    </div>
                    <div class="pull-left eServices-body tab-content" id="eServices-body">
                        <!--<div class="fwd-full-container container-fluid notification-header hidden-md hidden-lg">
                            <div class=" clearfix">
                                <div class="pull-left">
                                    <a href="eServices-landing" class="arrow-left-notify" href="eServices-landing">
                                        <span class="icon-arrow-left2 arrow-left"></span>
                                    </a>
                                </div>
                                <div class="pull-left notifications">
                                    <div class="text"><fmt:message key="userAccount.Profile.setting" bundle="${msg}" /></div>
                                </div>
                            </div>
                        </div>-->
                  
                        <!-- eServices Personal Info Block -->
                        <div class="fwd-full-container container-fluid eservices-personal-info tab-pane in active" id="personal-info-tab">
                            <div class="fwd-container fwd-container-limit personal-info">
                                <div class="row personal-row inner-personal-row">
                                    <div class="clearfix inner-personal-col">
                                        <h3 class="text-center"><fmt:message key="userAccount.Personal.info" bundle="${msg}" /></h3>
                                        <div class="col-xs-12 col-md-12 inner-col">
                                            <div class="row">
                                                <form id="eservices-personal-info" method="post">                      
                                                    <!-- <div class="col-xs-12 col-md-12 no-left">
                                                        <p>Name in English</p>
                                                    </div>  
                                                    <div class="clearfix"></div> -->

                                                    <!--  -->
                                                    <div class="col-xs-4 col-md-4 no-left upper lower">
                                                        <p><fmt:message key="userAccount.Full.name" bundle="${msg}" /></p>
                                                    </div>
                                                    <div class="col-xs-8 col-md-8 personal-col last">
                                                        <input type="text" id="fullName" name="fullName" value="${userDetails.fullName }" readonly />
                                                    </div>                
                                                    <div class="clearfix"></div>

                                                    <!--  -->
                                                    <div class="col-xs-4 col-md-4 no-left upper lower">
                                                        <p><fmt:message key="userAccount.Mobile.no" bundle="${msg}" /></p>
                                                    </div>
                                                    <div class="col-xs-8 col-md-8 personal-col">
                                                        <input class="mobile" type="text" id="mobileNumber" name="mobileNumber" value="${userDetails.mobileNo }" readonly />
                                                    </div>
                                                    <div class="clearfix"></div>

                                                    <!--  -->
                                                    <div class="col-xs-4 col-md-4 no-left upper lower">
                                                        <p><fmt:message key="userAccount.Email.address" bundle="${msg}" /></p>
                                                    </div>
                                                    <div class="col-xs-8 col-md-8 personal-col">
                                                        <input type="email" id="emailAddress" name="emailAddress" value="${userDetails.emailAddress }" readonly />
                                                    </div>  
                                                    <div class="clearfix"></div>                 
                                                    <!-- <div class="col-xs-12 col-md-4 no-left">
                                                        <p class="given-name">Given name</p>
                                                    </div>
                                                    <div class="col-xs-12 col-md-8 personal-col name-given">
                                                        <input type="text" id="firstName" name="firstName" value="Andy" readonly />
                                                    </div>                
                                                    <div class="clearfix"></div>                        
                                                    <div class="col-xs-12 col-md-4 no-left lower">
                                                        <p>Name in Chinese</p>
                                                    </div>
                                                    <div class="col-xs-12 col-md-8 personal-col chinese">
                                                        <input type="text" id="chineseName" name="chineseName" value="???" readonly />
                                                    </div>                      
                                                    <div class="clearfix"></div>
                                                    <div class="col-xs-12 col-md-4 no-left lower">
                                                        <p>HKID</p>
                                                    </div>
                                                    <div class="col-xs-12 col-md-8 personal-col">
                                                        <input type="text" id="hkid" name="hkid" value="X123456(7)" readonly />
                                                    </div>
                                                    <div class="clearfix"></div> -->
                                                    <div class="col-xs-4 col-md-4 no-left upper lower">
                                                        <p><fmt:message key="userAccount.Username" bundle="${msg}" /></p>
                                                    </div>
                                                    <div class="col-xs-8 col-md-8 personal-col">
                                                        <input type="text" id="username" name="username" value="${userDetails.userName }" readonly />
                                                    </div>
                                                    <div class="clearfix"></div>
                                                    <!-- <div class="col-xs-12 col-md-4 no-left upper lower">
                                                        <p>Password</p>
                                                    </div>
                                                    <div class="col-xs-12 col-md-8 personal-col">
                                                        <input type="password" id="password" name="password" value="******" readonly />
                                                    </div>
                                                    <div class="clearfix"></div>     -->                
                                                    <!-- <div class="btn-style btn-edit text-center">
                                                        <button id="personal-info-done" type="button" class="text-center btn-next done-btn input-done">Done</button>
                                                        <button id="personal-info-edit" type="button" class="text-center btn-next edit-btn input-edit">Edit</button>
                                                    </div> -->
                                                </form>
                                            </div>
                                        </div>
                                    </div>              
                                </div>
                            </div>
                        </div>

                        <!-- eServices Purchase History Block -->
                        <div class="purchase-history tab-pane" id="purchase-history-tab">
                            <div class="clearfix hidden-xs hidden-sm">
                                <h2><fmt:message key="userAccount.Purchase.history" bundle="${msg}" /></h2>
                                <!-- <div class="filter clearfix">
                                    <p>Period</p>
                                    <div class="selectDiv">
                                        <span class="icon-chevron-thin-down orange-caret"></span>
                                        <select class="form-control gray-dropdown" name="savieApplicantBean.maritalStatus" id="savieApplicantBean.maritalStatus">
                                            <option selected="" value="">Last 90 days</option>
                                            <option value="">Lorem</option>
                                            <option value="">Ipsum</option>  
                                        </select>
                                    </div>
                                </div> -->
                            </div>
                            <div class="plans">
                                <div class="plan-item hidden-sm hidden-xs title">
                                    <div class="plan-item-cols">
                                        <p><fmt:message key="userAccount.Plan.name" bundle="${msg}" /></p>
                                    </div>
                                    <div class="plan-item-cols">
                                        <p><fmt:message key="userAccount.Policy.no" bundle="${msg}" /></p>
                                    </div>
                                    <div class="plan-item-cols esph-bottom">
                                        <p><fmt:message key="userAccount.Day.start" bundle="${msg}" /></p>
                                    </div>
                                    <div class="plan-item-cols esph-bottom">
                                        <p><fmt:message key="userAccount.Day.end" bundle="${msg}" /></p>
                                    </div>
                                </div>
                                <c:choose>  
                                    <c:when test="${purchaseHistory.policies.size() > 0}">
                                        <c:forEach var="list" varStatus="obj" items="${purchaseHistory.policies}">
                                            <div class="plan-item <c:if test="${obj.count%2 != '0'}">first</c:if><c:if test="${obj.count%2 == '0'}">colored</c:if>">
                                                <div class="plan-item-cols">
                                                    <h5 class="hidden-md hidden-lg"><fmt:message key="userAccount.Plan.name" bundle="${msg}" /></h5>
                                                    <p>${ list.planCode != null ? list.planCode : "&nbsp" }</p>
                                                </div>
                                                <div class="plan-item-cols">
                                                    <h5 class="hidden-md hidden-lg"><fmt:message key="userAccount.Policy.no" bundle="${msg}" /></h5>
                                                    <p>${ list.policyNumber != null ? list.policyNumber : "&nbsp" }</p>
                                                </div>
                                                <div class="plan-item-cols esph-bottom">
                                                    <h5 class="hidden-md hidden-lg"><fmt:message key="userAccount.Day.start" bundle="${msg}" /></h5>
                                                    <p>${ list.commencementDate != null ? list.commencementDate : "&nbsp" }</p>
                                                </div>
                                                <div class="plan-item-cols esph-bottom">
                                                    <h5 class="hidden-md hidden-lg"><fmt:message key="userAccount.Day.end" bundle="${msg}" /></h5>
                                                    <p class="hidden-lg hidden-md">${ list.expiryDate != null ? list.expiryDate : "&nbsp" }</p>
                                                    <p class="hidden-sm hidden-xs">${ list.expiryDate != null ? list.expiryDate : "&nbsp" }</p>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </c:when>  
                                    <c:otherwise>
                                        <div class="plan-item first">
                                            <fmt:message key="userAccount.0.record.found" bundle="${msg}" />
                                        </div>
                                    </c:otherwise>  
                                </c:choose>
                            </div>

                            <!--<div class="plans savie">
                                <div class="plan-item hidden-sm hidden-xs title">
                                    <div class="plan-item-cols">
                                        <p><fmt:message key="userAccount.Plan.name" bundle="${msg}" /></p>
                                    </div>
                                    <div class="plan-item-cols">
                                        <p><fmt:message key="userAccount.Reference.no" bundle="${msg}" /></p>
                                    </div>
                                    <div class="plan-item-cols esph-bottom">
                                        <p><fmt:message key="userAccount.Status" bundle="${msg}" /></p>
                                    </div>
                                    <div class="plan-item-cols esph-bottom">
                                        <p><fmt:message key="userAccount.Account.value" bundle="${msg}" /><span class="asterisk">*</span></p>
                                    </div>
                                </div>
                                <c:choose>  
                                   <c:when test="${accountBalance.accountBalances.size() > 0}">
                                      <c:forEach var="list" items="${accountBalance.accountBalances}">
                                        <div class="plan-item savie-plan">
                                            <div class="clearfix">
                                                <div class="plan-item-cols">
                                                    <h5 class="hidden-md hidden-lg"><fmt:message key="userAccount.Plan.name" bundle="${msg}" /></h5>
                                                    <p>${ list.planCode != null ? list.planCode : "&nbsp" }</p>
                                                </div>
                                                <div class="plan-item-cols">
                                                    <h5 class="hidden-md hidden-lg"><fmt:message key="userAccount.Reference.no" bundle="${msg}" /></h5>
                                                    <p>${ list.policyNo != null ? list.policyNo : "&nbsp" }</p>
                                                </div>
                                                <div class="plan-item-cols esph-bottom">
                                                    <h5 class="hidden-md hidden-lg"><fmt:message key="userAccount.Status" bundle="${msg}" /></h5>
                                                    <p>${ list.status != null ? list.status : "&nbsp" }</p>
                                                </div>
                                                <div class="plan-item-cols esph-bottom">
                                                    <h5 class="hidden-md hidden-lg"><fmt:message key="userAccount.Account.value" bundle="${msg}" /> <span class="asterisk">*</span></h5>
                                                    <p>HK$ ${ list.accountBalance != null ? list.accountBalance : "&nbsp" }</p>
                                                </div>
                                            </div>
                                        </div>
                                      </c:forEach>
                                   </c:when>  
                                   <c:otherwise>
                                        <div class="plan-item savie-plan">
                                             <fmt:message key="userAccount.0.record.found" bundle="${msg}" />
                                        </div>
                                   </c:otherwise>  
                                </c:choose> 
                            </div>

                            <div class="notice text-center ">
                                <p class="notice-text"><span class="next-line"><span class="asterisk">* </span>
                              <fmt:message key="userAccount.Amount.indicative.only" bundle="${msg}" /></span>
                                <span class="next-line"><fmt:message key="userAccount.Please.call.our" bundle="${msg}" /></span>
                                <span class="next-line"><fmt:message key="userAccount.up-to-date" bundle="${msg}" /></span></p>
                            </div>
                            <div class="text-center hidden-md hidden-lg">
                                <button type="button" class="btn view-all"><fmt:message key="userAccount.View.all" bundle="${msg}" /></button>
                            </div>-->
                        </div>
                  
                        <!-- eServices Referal Block -->
                        <div class="referral tab-pane" id="referral-tab">
                            <h2 class="text-center"><fmt:message key="userAccount.Referrals" bundle="${msg}" /></h2>

                            <div class="referral-list">
                                <div class="referral-item hidden-sm hidden-xs title-gray">
                                    <div class="referral-item-cols">
                                        <p class="hidden-md hidden-lg"><fmt:message key="userAccount.Date" bundle="${msg}" /></p>
                                    </div>
                                    <div class="referral-item-cols">
                                        <p><fmt:message key="userAccount.Partner" bundle="${msg}" /></p>
                                    </div>
                                    <div class="referral-item-cols esph-bottom">
                                        <p><fmt:message key="userAccount.Discount" bundle="${msg}" /></p>
                                    </div>
                                    <div class="referral-item-cols esph-bottom">
                                        <p><fmt:message key="userAccount.Discount.code" bundle="${msg}" /></p>
                                    </div>
                                </div>
                                <div class="referral-item first">
                                    <div class="referral-item-cols" id="referral-date">
                                        <h5 class="hidden-md hidden-lg"><fmt:message key="userAccount.Date" bundle="${msg}" /></h5>
                                        <p class="hidden-md hidden-lg">3<sup>rd</sup> April 15</p>
                                    </div>
                                    <div class="referral-item-cols">
                                        <h5 class="hidden-md hidden-lg"><fmt:message key="userAccount.Partner" bundle="${msg}" /></h5>
                                        <p><fmt:message key="member.account.referral.benefits.table.row4.col2" bundle="${msg}" /></p>
                                    </div>
                                    <div class="referral-item-cols esph-bottom" id="referral-discount">
                                        <h5 class="hidden-md hidden-lg"><fmt:message key="userAccount.Discount" bundle="${msg}" /></h5>
                                        <p><fmt:message key="userAccount.5%" bundle="${msg}" /></p>
                                    </div>
                                    <div class="referral-item-cols esph-bottom">
                                        <h5 class="hidden-md hidden-lg"><fmt:message key="userAccount.Discount.code" bundle="${msg}" /></h5>
                                        <p class="discount-code"><fmt:message key="userAccount.agoda5DFGRL" bundle="${msg}" /></p>
                                    </div>
                                    <div class="text-center copy-code-holder">
                                        <button type="button" class="btn copy-code"><fmt:message key="userAccount.Copy.code" bundle="${msg}" /></button>
                                    </div>
                                </div>

                                <div class="referral-item gray-color-referrals display hidden-xs hidden-sm">
                                    <!--<div class="referral-item-cols">
                                        <h5 class="hidden-md hidden-lg">Date</h5>
                                        <p class="hidden-md hidden-lg">19<sup>th</sup> March 15</p>
                                    </div>-->
                                    <div class="referral-item-cols">
                                        <h5 class="hidden-md hidden-lg"><fmt:message key="userAccount.Partner" bundle="${msg}" /></h5>
                                        <p ><fmt:message key="userAccount.Y5buddy" bundle="${msg}" /></p>
                                    </div>
                                    <div class="referral-item-cols">
                                        <h5 class="hidden-md hidden-lg"><fmt:message key="userAccount.Discount" bundle="${msg}" /></h5>
                                        <p><fmt:message key="userAccount.10%" bundle="${msg}" /></p>
                                    </div>
                                    <div class="referral-item-cols esph-bottom">
                                        <h5 class="hidden-md hidden-lg"><fmt:message key="userAccount.Discount.code" bundle="${msg}" /></h5>
                                        <p class="discount-code"><fmt:message key="userAccount.pace10" bundle="${msg}" /></p>
                                    </div>
                                    <div class="text-center  copy-code-holder">
                                        <button type="button" class="btn copy-code"><fmt:message key="userAccount.Copy.code" bundle="${msg}" /></button>
                                    </div>
                                </div>

                                <div class="referral-item display hidden-xs hidden-sm">
                                   <!-- <div class="referral-item-cols">
                                        <h5 class="hidden-md hidden-lg">Date</h5>
                                        <p class="hidden-md hidden-lg">28<sup>th</sup> February 15</p>
                                    </div>-->
                                    <div class="referral-item-cols">
                                        <h5 class="hidden-md hidden-lg"><fmt:message key="userAccount.Partner" bundle="${msg}" /></h5>
                                        <p><fmt:message key="userAccount.BoConcept" bundle="${msg}" /></p>
                                    </div>
                                    <div class="referral-item-cols">
                                        <h5 class="hidden-md hidden-lg"><fmt:message key="userAccount.Discount" bundle="${msg}" /></h5>
                                        <p><fmt:message key="userAccount.8%" bundle="${msg}" /></p>
                                    </div>
                                    <div class="referral-item-cols esph-bottom">
                                        <h5 class="hidden-md hidden-lg"><fmt:message key="userAccount.Discount.code" bundle="${msg}" /></h5>
                                        <p class="discount-code"><fmt:message key="userAccount.get8Save" bundle="${msg}" /></p>
                                    </div>
                                    <div class="text-center copy-code-holder">
                                        <button type="button" class="btn copy-code"><fmt:message key="userAccount.Copy.code" bundle="${msg}" /></button>
                                    </div>
                                </div>

                                <div class="text-center hidden-md hidden-lg">
                                    <button type="button" class="btn view-all" id="referral-view"><fmt:message key="userAccount.View.all" bundle="${msg}" /></button>
                                </div>                            
                            </div>

                            <h2 class="text-center personal-promotion-code"><fmt:message key="userAccount.Personal.promotion.code" bundle="${msg}" /><span>${userDetails.referralCode }</span></h2>
                          
                            <div class="promo-item hidden-sm hidden-xs title-orange">
                                <div class="promo-item-cols">
                                    <p><fmt:message key="userAccount.Promotion.type" bundle="${msg}" /></p>
                                </div>
                                <div class="promo-item-cols">
                                    <p><fmt:message key="userAccount.Type.of.Offer" bundle="${msg}" /></p>
                                </div>
                                <div class="promo-item-cols esph-bottom">
                                    <p><fmt:message key="userAccount.Discount" bundle="${msg}" /></p>
                                </div>
                                <div class="promo-item-cols esph-bottom">
                                    <p><fmt:message key="userAccount.Offer.period" bundle="${msg}" /></p>
                                </div>
                            </div>
                            <div class="promo-list">
                                
                                <div class="promo-item first">
                                    <div class="clear">
                                        <div class="promo-item-cols">
                                            <h5 class="hidden-md hidden-lg"><fmt:message key="userAccount.Promotion.type" bundle="${msg}" /></h5>
                                            <p><fmt:message key="userAccount.Personal.Promotional.Code" bundle="${msg}" /></p>
                                        </div>
                                        <div class="promo-item-cols">
                                            <h5 class="hidden-md hidden-lg"><fmt:message key="userAccount.Type.of.Offer" bundle="${msg}" /></h5>
                                            <p><fmt:message key="userAccount.TravelCare" bundle="${msg}" /></p>
                                        </div>
                                    </div>
                                    <div class="promo-item-cols esph-bottom">
                                        <h5 class="hidden-md hidden-lg"><fmt:message key="userAccount.Discount" bundle="${msg}" /></h5>
                                        <p><fmt:message key="member.account.referral.benefits.table.row1.col3" bundle="${msg}" /></p>
                                    </div>
                                    <div class="promo-item-cols esph-bottom">
                                        <h5 class="hidden-md hidden-lg"><fmt:message key="userAccount.Offer.period" bundle="${msg}" /></h5>
                                        <p><fmt:message key="member.account.referral.benefits.table.row1.col4" bundle="${msg}" /></p>
                                    </div>
                                </div>

                                <div class="promo-item gray-color">
                                    <div class="clear">
                                        <div class="promo-item-cols">
                                            <h5 class="hidden-md hidden-lg"><fmt:message key="userAccount.Promotion.type" bundle="${msg}" /></h5>
                                            <p class="invisible">Personal Promotional Code</p>
                                        </div>
                                        <div class="promo-item-cols">
                                            <h5 class="hidden-md hidden-lg"><fmt:message key="userAccount.Type.of.Offer" bundle="${msg}" /></h5>
                                            <p><fmt:message key="home.main.quote.subheading" bundle="${msg}" /></p>
                                        </div>
                                    </div>
                                    <div class="promo-item-cols esph-bottom">
                                        <h5 class="hidden-md hidden-lg"><fmt:message key="userAccount.Discount" bundle="${msg}" /></h5>
                                        <p><fmt:message key="home.referral.benefits.member.table.row2.col3" bundle="${msg}" /></p>
                                    </div>
                                    <div class="promo-item-cols esph-bottom">
                                        <h5 class="hidden-md hidden-lg"><fmt:message key="userAccount.Offer.period" bundle="${msg}" /></h5>
                                        <p><fmt:message key="home.referral.benefits.member.table.row2.col4" bundle="${msg}" /></p>
                                    </div>
                                </div>

                                <div class="promo-item">
                                    <div class="clear">
                                        <div class="promo-item-cols">
                                            <h5 class="hidden-md hidden-lg"><fmt:message key="userAccount.Promotion.type" bundle="${msg}" /></h5>
                                            <p>Referal Program<sup class="hidden-xs hidden-sm">1</sup></p>
                                        </div>
                                        <div class="promo-item-cols">
                                            <h5 class="hidden-md hidden-lg"><fmt:message key="userAccount.Type.of.Offer" bundle="${msg}" /></h5>
                                            <p><fmt:message key="home.confirmation.other.subheading" bundle="${msg}" /></p>
                                        </div>
                                    </div>
                                    <div class="promo-item-cols esph-bottom">
                                        <h5 class="hidden-md hidden-lg"><fmt:message key="userAccount.Discount" bundle="${msg}" /></h5>
                                        <p><fmt:message key="travel.referral.benefits.member.table.row3.col3" bundle="${msg}" /></p>
                                    </div>
                                    <div class="promo-item-cols esph-bottom">
                                        <h5 class="hidden-md hidden-lg"><fmt:message key="userAccount.Offer.period" bundle="${msg}" /></h5>
                                        <p><fmt:message key="travel.referral.benefits.member.table.row3.col4" bundle="${msg}" /></p>
                                    </div>
                                </div>

                                <div class="promo-item gray-color">
                                    <div class="clear">
                                        <div class="promo-item-cols">
                                            <h5 class="hidden-md hidden-lg"><fmt:message key="userAccount.Promotion.type" bundle="${msg}" /></h5>
                                            <p class="invisible"><span>Referal Program</span></p>
                                        </div>
                                        <div class="promo-item-cols">
                                            <h5 class="hidden-md hidden-lg"><fmt:message key="userAccount.Type.of.Offer" bundle="${msg}" /></h5>
                                            <p><fmt:message key="travel.referral.benefits.member.table.row4.col2" bundle="${msg}" /></p>
                                        </div>
                                    </div>
                                    <div class="promo-item-cols esph-bottom">
                                        <h5 class="hidden-md hidden-lg"><fmt:message key="userAccount.Discount" bundle="${msg}" /></h5>
                                        <p><fmt:message key="travel.referral.benefits.member.table.row4.col3" bundle="${msg}" /></p>
                                    </div>
                                    <div class="promo-item-cols esph-bottom">
                                        <h5 class="hidden-md hidden-lg"><fmt:message key="userAccount.Offer.period" bundle="${msg}" /></h5>
                                        <p><fmt:message key="travel.referral.benefits.member.table.row4.col4" bundle="${msg}" /></p>
                                    </div>
                                </div>
                                <div class="promo-item ">
                                    <div class="clear">
                                        <div class="promo-item-cols">
                                            <h5 class="hidden-md hidden-lg"><fmt:message key="userAccount.Promotion.type" bundle="${msg}" /></h5>
                                            <p class="invisible"><span>Referal Program</span></p>
                                        </div>
                                        <div class="promo-item-cols">
                                            <h5 class="hidden-md hidden-lg"><fmt:message key="userAccount.Type.of.Offer" bundle="${msg}" /></h5>
                                            <p><fmt:message key="travel.referral.benefits.member.table.row6.col2" bundle="${msg}" /></p>
                                        </div>
                                    </div>
                                    <div class="promo-item-cols esph-bottom">
                                        <h5 class="hidden-md hidden-lg"><fmt:message key="userAccount.Discount" bundle="${msg}" /></h5>
                                        <p><fmt:message key="travel.referral.benefits.member.table.row6.col3" bundle="${msg}" /></p>
                                    </div>
                                    <div class="promo-item-cols esph-bottom">
                                        <h5 class="hidden-md hidden-lg"><fmt:message key="userAccount.Offer.period" bundle="${msg}" /></h5>
                                        <p><fmt:message key="travel.referral.benefits.member.table.row6.col4" bundle="${msg}" /></p>
                                    </div>
                                </div>

                          
                            
                                <div class="promo-item gray-color">
                                    <div class="clear">
                                        <div class="promo-item-cols">
                                            <h5 class="hidden-md hidden-lg"><fmt:message key="userAccount.Promotion.type" bundle="${msg}" /></h5>
                                            <p><fmt:message key="member.account.referral.benefits.table.row5.col1" bundle="${msg}" /></p>
                                        </div>
                                        <div class="promo-item-cols">
                                            <h5 class="hidden-md hidden-lg"><fmt:message key="userAccount.Type.of.Offer" bundle="${msg}" /></h5>
                                            <p><fmt:message key="member.account.referral.benefits.table.row5.col2" bundle="${msg}" /></p>
                                            <button type="button" class="btn btn-orange get-now" onclick="getPromoCode();"><fmt:message key="userAccount.Get.now" bundle="${msg}" /></button>
                                        </div>
                                    </div>
                                    <div class="promo-item-cols esph-bottom">
                                        <h5 class="hidden-md hidden-lg"><fmt:message key="userAccount.Discount" bundle="${msg}" /></h5>
                                        <p><fmt:message key="member.account.referral.benefits.table.row2.col3" bundle="${msg}" /></p>
                                    </div>
                                    <div class="promo-item-cols esph-bottom">
                                        <h5 class="hidden-md hidden-lg"><fmt:message key="userAccount.Offer.period" bundle="${msg}" /></h5>
                                        <p><fmt:message key="travel.referral.benefits.member.table.row6.col4" bundle="${msg}" /></p>
                                    </div>
                                </div>
                            </div>
                            

                            <div class="notice">
                                <p><sup class="hidden-xs hidden-sm">1</sup> <fmt:message key="userAccount.This.referral.offer" bundle="${msg}" /></p>

                                <p><sup class="hidden-xs hidden-sm">2</sup> <fmt:message key="userAccount.Please.review" bundle="${msg}" /> <a href="<%=request.getContextPath()%>/<fmt:message key="referral.tnc.link" bundle="${msg}" />" class="terms" target="_blank"><fmt:message key="userAccount.terms.and.conditions" bundle="${msg}" /></a> <fmt:message key="userAccount.of.the.referral.program" bundle="${msg}" />  </p>

                                <p><sup class="hidden-xs hidden-sm">3</sup> <fmt:message key="userAccount.Applicable.to.puchase" bundle="${msg}" /> <a href="<fmt:message key="pricerite.eshop.link" bundle="${msg}" />" class="terms" target="_blank"><fmt:message key="userAccount.Pricerite.eShop" bundle="${msg}" /></a>.</p>
                            </div>

                            <div class="referral-link gray-color-referral-link">
                                <div class="social-share">
                                    <div class="row">
                                        <div class="col-xs-3">
                                            <img src="<%=request.getContextPath()%>/resources/images/agonda-logo.png" class="img-responsive">
                                        </div>
                                        <div class="col-xs-3">
                                            <img src="<%=request.getContextPath()%>/resources/images/boconcept-logo.png" class="img-responsive boconcept">
                                        </div>
                                        <div class="col-xs-3">
                                            <img src="<%=request.getContextPath()%>/resources/images/y5buddy-logo.png" class="img-responsive">
                                        </div>
                                        <div class="col-xs-3">
                                            <img src="<%=request.getContextPath()%>/resources/images/pricerite-logo.png" class="img-responsive">
                                        </div>
                                    </div>
                                </div>
                                <div class="your-referral-link">
                                    <h2 class="text-center"> <fmt:message key="userAccount.Your.referral.link" bundle="${msg}" /></h2>
                                    <div class="link"><a class="padding6 h4-5-b " href="<%=request.getScheme() + "://" + request.getServerName() +  request.getContextPath()%>/${language}?promo=<%=session.getAttribute("myReferralCode")%>" target="_blank"><%=request.getScheme() + "://" + request.getServerName() +  request.getContextPath()%>/${language}?promo=<%=session.getAttribute("myReferralCode")%></a></div>
                                    
                                        <button type="button" class="btn copy-link" id="copy-link"><fmt:message key="userAccount.Copy.link" bundle="${msg}" /></button>
                                        <div class="share">
                                            <a href="#"><i class="fa fa-facebook"></i></a>
                                            <a href="#"><i class="fa fa-twitter"></i></a>
                                            <a href="#"><i class="fa fa-google-plus"></i></a>
                                        </div>
                                    
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>              
            </div>

            <!--Eservices Landing Page-->
            <div class="container-fluid fwd-full-container hidden hidden-md hidden-lg" id="notifications-mobile">
                <div class="notifications-mobile" >
                    <div class="notification-header">
                        <div class="clearfix">
                            <div class="pull-left">
                                <a class="arrow-left-notify" id="notifications-mobile-back">
                                    <span class="icon-arrow-left2 arrow-left"></span>
                                </a>
                            </div>
                            <div class="pull-left notifications">
                                <div class="text"><fmt:message key="userAccount.Notifications" bundle="${msg}" /></div>
                            </div>
                        </div>
                    </div>
                    <div class="notification-body">
                        <ul class="notifications-ul">
                            <li class="notifications-list">
                                <a href="eServices-document-upload">
                                    <div class="table">
                                        <div class="table-cell icons">
                                            <span class="eServices-notification-icon exclamation"></span>
                                        </div>
                                        <div class="table-cell text">
                                            <fmt:message key="userAccount.Please.upload.your" bundle="${msg}" />
                                            <p class="time"><fmt:message key="userAccount.1.hour.ago" bundle="${msg}" /></p>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li class="notifications-list">
                                <a href="eServices-signature">
                                    <div class="table">
                                        <div class="table-cell icons">
                                            <span class="eServices-notification-icon exclamation"></span>
                                        </div>
                                        <div class="table-cell text">
                                            <fmt:message key="userAccount.Please.add.your" bundle="${msg}" />
                                            <p class="time"><fmt:message key="userAccount.1.hour.ago" bundle="${msg}" /></p>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li class="notifications-list">
                                <a href="eServices-referral">
                                    <div class="table">
                                        <div class="table-cell icons">
                                            <span class="eServices-notification-icon star"></span>
                                        </div>
                                        <div class="table-cell text">
                                            <fmt:message key="userAccount.Your.received.20%" bundle="${msg}" />
                                            <p class="time">11 hour ago</p>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li class="notifications-list">
                                <a href="eServices-personal-info">
                                    <div class="table">
                                        <div class="table-cell icons">
                                            <span class="eServices-notification-icon check"></span>
                                        </div>
                                        <div class="table-cell text">
                                            <fmt:message key="userAccount.You.just.updated.your" bundle="${msg}" />
                                            <p class="time">Jun 10 at 7: 41</p>
                                        </div>
                                    </div>
                                </a>
                            </li>
                        </ul>
                        
                    </div>
                </div>
            </div>


            <div class="modal fade details-popup" id="agoda_promo_code_popup" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="display: none;">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content plan-modal">
                        <a class="close" aria-label="Close" data-dismiss="modal">
                            <span aria-hidden="true" style="font-size:30px;">×</span>
                        </a>
                        <div class="fwdpanel-heading">
                            <span class="fwdpanel-title h4-4-full "><fmt:message key="partner.agoda.get.title" bundle="${msg}" /></span><span id="agoda_promo_code" style="font-weight:bold;font-size: 24px;line-height: 42px;"></span>
                        </div>
                        <div class="fwdpanel-body" >
                            <table id="Premium" class="table table-bordred">
                                <tbody>
                                    <tr>
                                        <td><fmt:message key="agoda.link.desc" bundle="${msg}" /></td>
                                        <td><a href="<fmt:message key="agoda.promo.link" bundle="${msg}" />" class="sub-link" target="_blank"><fmt:message key="agoda.promo.link" bundle="${msg}" /></a></td>
                                    </tr>
                                    <tr>
                                        <td style="color: #fff;background-color: #f68a1d;"><fmt:message key="agoda.desc1.title" bundle="${msg}" /></td>
                                        <td><fmt:message key="agoda.desc1.detail" bundle="${msg}" /></td>
                                    </tr>
                                    <tr>
                                        <td><fmt:message key="agoda.desc2.title" bundle="${msg}" /></td>
                                        <td><fmt:message key="agoda.desc2.detail" bundle="${msg}" /></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>       
        </div>
        <script src="<%=request.getContextPath()%>/resources/js/vendor/ZeroClipboard.js"></script>
        <script type="text/javascript">
            $('#eServices-sidebar-mp a[data-toggle="tab"]').on('show.bs.tab', function(e) {
                var $self = $(this);
                var $parent = $self.parent('li');
                $parent.siblings().removeClass('active');
                $parent.addClass('active');
            });
      
            $('#personal-info-edit').click(function(){        
                $('#eservices-personal-info').addClass('invert');
                $('input').removeAttr("readonly");
            });

            $('#personal-info-done').click(function(){        
                $('#eservices-personal-info').removeClass('invert');
                $('input').attr("readonly");
            });
         
            // Profile menu item toggle event
            $('.profile-meu-item').on('show.bs.tab', function(e) {
                $('.profile-meu-item').removeClass('active');
                $(this).addClass('active');
            });
         
            function getPromoCode(){
                $.ajax({
                    type : "POST",
                    url : '<%=request.getContextPath()%>/getPromoCode',
                    async : false,
                    success : function(data) {
                        $("#agoda_promo_code").html(data);
                        $('#agoda_promo_code_popup').modal();
                    }
                });
            }
        </script>
    </body>
</html>