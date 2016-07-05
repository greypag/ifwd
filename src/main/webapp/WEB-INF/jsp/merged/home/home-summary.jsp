<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeCareDetailsBean"%>

<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate var="year" value="${now}" pattern="yyyy" />
<script type="text/javascript">
var context = "<%=request.getContextPath()%>";
var plan="${plan}";
</script>

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/icomoon.min.css"></head>

<div class="fwd-savie-wrapper">
    
    <!-- Breadcrumb Component Start-->

    <c:set var="breadcrumbItems" value="breadcrumb.item.home" /> 
    <c:set var="breadcrumbActive" value="0" />

    <c:if test="${planIndex == 'easy-home-care'}">
        <c:set var="breadcrumbItems">
            breadcrumb.item.home,breadcrumb.item.protect,breadcrumb.item.household,breadcrumb.item.easyhome,breadcrumb.item.summary.payment
        </c:set>
        <c:set var="breadcrumbActive">4</c:set>
    </c:if>
    <c:if test="${planIndex == 'home-liability'}">
        <c:set var="breadcrumbItems">
            breadcrumb.item.home,breadcrumb.item.protect,breadcrumb.item.household,breadcrumb.item.home.liability,breadcrumb.item.summary.payment
        </c:set>
        <c:set var="breadcrumbActive">4</c:set>
    </c:if>

    <jsp:include page="/WEB-INF/jsp/merged/comp/breadcrumb.jsp">
        <jsp:param name="breadcrumbItems" value="${breadcrumbItems}"/>
        <jsp:param name="breadcrumbActive" value="${breadcrumbActive}"/>
    </jsp:include>

    <!-- Breadcrumb Component End-->

     <div class="savie-online-container app-pg-ctnr" id="ehome-app-summary">
     <!-- <div class="container-fluid fwd-full-container browse-holder">
        <div class="application-page-header et-header-browse">
           <div class="browse-container">
              <div class="row reset-margin hidden-xs hidden-sm">
                 <ul class="common-steps-list six-steps nav nav-pills">
                    <li class="step-number" id="first-step"><button type="button" class="et-header-info-btn completed-step"><i class="fa fa-check"></i>Select Plan</button></li>
                    <li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/easy-home/header-browse-arrow.png" class="browse-arrow"></li>
                    <li class="step-number"><button type="button" class="et-header-info-btn completed-step"><i class="fa fa-check"></i>Application</button></li>
                    <li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/easy-home/header-browse-arrow.png" class="browse-arrow"></li>
                    <li class="step-number" id="last-steps"><button type="button" class="et-header-info-btn active"><span class="status">3</span>Summary &amp; Payment</button></li>
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
                        <a href="<%=request.getContextPath()%>/${language}/household-insurance/${planIndex}/application" class="btn-summary-back"><i class="icon icon-arrow-left2"></i></a>
                    </li>
                    <li class="first">
                        <div class="form-group">
                            <div class="fld-wrapper">
                            <p class="fld-label">
                                ${plan == 'home-liability' ? language == 'en' ? 'Personal Liability':'個人法律責任':language == 'en' ? 'Easy HomeCare':'易安心家居保' }
                            </p>
                            <p class="fld-val"><!-- Standard cover, Annual --></p>
                            </div>
                        </div>                        
                    </li>
                    <li class="hidden-xs">
                        <div class="form-group">
                            <div class="fld-wrapper">
                            <p class="fld-label"><fmt:message key="lable.promo.code" bundle="${msg}" /></p>
                            <p class="fld-val"><span class="txt-promote-code">${homeQuoteDetails.referralCode == "" ? '-' : homeQuoteDetails.referralCode}</span></p>
                            </div>
                        </div>
                    </li>
                    <li class="hidden-xs">
                        <div class="form-group">
                            <div class="fld-wrapper">
                            <p class="fld-label"><fmt:message key="lable.theclub.member" bundle="${msg}" /></p>
                            <p class="fld-val"><span class="txt-theclub-member">${theClubMembershipNo == "" ? '-' : theClubMembershipNo}</span></p>
                            </div>
                        </div>
                    </li>
                    <li class="hidden-xs">
                        <div class="form-group">
                            <div class="fld-wrapper">
                            <p class="fld-label"><fmt:message key="lable.original.price" bundle="${msg}" /></p>
                            <p class="fld-val"><fmt:message key="label.dollar.hkd.en" bundle="${msg}" /> ${homeQuoteDetails.grossPremium } <fmt:message key="label.dollar.hkd.cn" bundle="${msg}" /></p>
                            </div>
                        </div>
                    </li>
                    <li class="hidden-xs">
                        <div class="form-group">
                            <div class="fld-wrapper">
                            <p class="fld-label"><fmt:message key="lable.discount" bundle="${msg}" /></p>
                            <p class="fld-val"><fmt:message key="label.dollar.hkd.en" bundle="${msg}" /> ${homeQuoteDetails.discountAmount } <fmt:message key="label.dollar.hkd.cn" bundle="${msg}" /></p>
                            </div>
                        </div>
                    </li>
                    <li class="last hidden-xs">
                    	<div class="form-group">
                            <div class="fld-wrapper">
                            <p class="fld-label"><fmt:message key="lable.amount.due" bundle="${msg}" /></p>
                            <p class="fld-val"><span class="txt-hkd-prefix"><fmt:message key="label.dollar.hkd.en" bundle="${msg}" /></span><span class="txt-price">${homeQuoteDetails.totalDue }</span><span class="txt-hkd-suffix"><fmt:message key="label.dollar.hkd.cn" bundle="${msg}" /></span></p>
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
                                        <p class="fld-val"><span class="txt-theclub-member">${theClubMembershipNo == "" ? '-' : theClubMembershipNo}</span></p>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="form-group">
                                    <div class="fld-wrapper">
                                        <p class="fld-label"><fmt:message key="lable.original.price" bundle="${msg}" /></p>
                                        <p class="fld-val"><fmt:message key="label.dollar.hkd.en" bundle="${msg}" /> ${homeQuoteDetails.grossPremium } <fmt:message key="label.dollar.hkd.cn" bundle="${msg}" /></p>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="form-group">
                                    <div class="fld-wrapper">
                                        <p class="fld-label"><fmt:message key="lable.discount" bundle="${msg}" /></p>
                                        <p class="fld-val"><fmt:message key="label.dollar.hkd.en" bundle="${msg}" /> ${homeQuoteDetails.discountAmount } <fmt:message key="label.dollar.hkd.cn" bundle="${msg}" /></p>
                                    </div>
                                </div>
                            </li>
                             <li>
                                <div class="form-group">
                                    <div class="fld-wrapper">
                                        <p class="fld-label"><fmt:message key="lable.amount.due" bundle="${msg}" /></p>
                                        <p class="fld-val"><span class="txt-hkd-prefix"><fmt:message key="label.dollar.hkd.en" bundle="${msg}" /> </span><span class="txt-price">${homeQuoteDetails.totalDue }</span> <fmt:message key="label.dollar.hkd.cn" bundle="${msg}" /></p>
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
        <form id="ef-form-summary" name="paymentForm" method="post">
        <div class="container-fluid">

            <div class="row form-block">
                <div class="col-xs-12">
                    <h3 class="heading-title"><fmt:message key="payment.jumbo.details" bundle="${msg}" /> <a href="<%=request.getContextPath()%>/${language}/household-insurance/${plan }/application" class="btn-edit"><fmt:message key="label.edit" bundle="${msg}" /></a></h3>
                </div>
                    
                <div class="col-xs-12 col-md-12 tbl-summary">
                    <div class="row">
                        
                        <div class="col-xs-12 col-md-6">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <p class="fld-label"><fmt:message key="payment.input.engname" bundle="${msg}" /></p>
                                    <p class="fld-val">${userDetails.fullName}</p>
                                </div>
                            </div>
                        </div>

                        <div class="col-xs-12 col-md-6">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <p class="fld-label"><fmt:message key="payment.input.birth" bundle="${msg}" /></p>
                                    <p class="fld-val">${userDetails.dob}</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">

                        <div class="col-xs-12 col-md-6">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <p class="fld-label"><fmt:message key="payment.input.idno" bundle="${msg}" /></p>
                                    <p class="fld-val">${userDetails.hkid != "" ? userDetails.hkid : userDetails.passport}</p>
                                </div>
                            </div>                            
                        </div>

                        <div class="col-xs-12 col-md-6">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <p class="fld-label"><fmt:message key="payment.input.mobileno" bundle="${msg}" /></p>
                                    <p class="fld-val">${userDetails.mobileNo }</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">

                        <div class="col-xs-12 col-md-6">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <p class="fld-label"><fmt:message key="payment.input.email" bundle="${msg}" /></p>
                                    <p class="fld-val">${userDetails.emailAddress }</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12">
                            <h5><fmt:message key="payment.input.address" bundle="${msg}" /></h5>
                        </div>
                        <div class="col-xs-12 col-md-4">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <p class="fld-label"><fmt:message key="application.input.address.room" bundle="${msg}" /></p>
                                    <p class="fld-val">${homeCareDetails.applicantRoom }</p>
                                </div>
                            </div>
                        </div>

                        <div class="col-xs-12 col-md-4">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <p class="fld-label"><fmt:message key="application.input.address.floor" bundle="${msg}" /></p>
                                    <p class="fld-val">${homeCareDetails.applicantFloor }</p>
                                </div>
                            </div>
                        </div>

                        <div class="col-xs-12 col-md-4">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <p class="fld-label"><fmt:message key="application.input.address.block" bundle="${msg}" /></p>
                                    <p class="fld-val">${homeCareDetails.applicantBlock }</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">

                        <div class="col-xs-12 col-md-6">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <p class="fld-label"><fmt:message key="application.input.address.building" bundle="${msg}" /></p>
                                    <p class="fld-val">${homeCareDetails.applicantBuilding }</p>
                                </div>
                            </div>
                        </div>
                    
                        <div class="col-xs-12 col-md-6">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <p class="fld-label"><fmt:message key="application.input.address.estate" bundle="${msg}" /></p>
                                    <p class="fld-val">${homeCareDetails.applicantEstate }</p>
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="row">

                        <div class="col-xs-12 col-md-6">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <p class="fld-label"><fmt:message key="application.input.address.street.no" bundle="${msg}" /></p>
                                    <p class="fld-val">${homeCareDetails.applicantStreetNo } </p>
                                </div>
                            </div>
                        </div>

                        <div class="col-xs-12 col-md-6">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <p class="fld-label"><fmt:message key="application.input.address.street.name" bundle="${msg}" /></p>
                                    <p class="fld-val">${homeCareDetails.applicantStreetName }</p>
                                </div>
                            </div>
                        </div>
                    </div>

                     <div class="row">

                        <div class="col-xs-12 col-md-6">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <p class="fld-label"><fmt:message key="application.input.address.district" bundle="${msg}" /></p>
                                    <p class="fld-val">${homeCareDetails.applicantDistrictDesc }</p>
                                </div>
                            </div>
                        </div>

                        <div class="col-xs-12 col-md-6">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <p class="fld-label"><fmt:message key="application.input.address.area" bundle="${msg}" /></p>
                                    <p class="fld-val">${homeCareDetails.applicantAreaDesc }</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    
                </div>
            </div>

             <div class="row form-block">
                    
                <div class="col-xs-12 tbl-summary">

                    <div class="row">
                        <div class="col-xs-12">
                            <h5><fmt:message key="payment.input.insured.address" bundle="${msg}" /></h5>
                        </div>
                        <div class="col-xs-12 col-md-4">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <p class="fld-label"><fmt:message key="application.input.address.room" bundle="${msg}" /></p>
                                    <p class="fld-val">${homeCareDetails.aRoom }</p>
                                </div>
                            </div>
                        </div>

                        <div class="col-xs-12 col-md-4">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <p class="fld-label"><fmt:message key="application.input.address.floor" bundle="${msg}" /></p>
                                    <p class="fld-val">${homeCareDetails.aFloor }</p>
                                </div>
                            </div>
                        </div>

                        <div class="col-xs-12 col-md-4">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <p class="fld-label"><fmt:message key="application.input.address.block" bundle="${msg}" /></p>
                                    <p class="fld-val">${homeCareDetails.aBlock }</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">

                        <div class="col-xs-12 col-md-6">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <p class="fld-label"><fmt:message key="application.input.address.building" bundle="${msg}" /></p>
                                    <p class="fld-val">${homeCareDetails.aBuilding }</p>
                                </div>
                            </div>
                        </div>
                    
                        <div class="col-xs-12 col-md-6">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <p class="fld-label"><fmt:message key="application.input.address.estate" bundle="${msg}" /></p>
                                    <p class="fld-val">${homeCareDetails.aEstate }</p>
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="row">

                        <div class="col-xs-12 col-md-6">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <p class="fld-label"><fmt:message key="application.input.address.street.no" bundle="${msg}" /></p>
                                    <p class="fld-val">${homeCareDetails.aStreetNo } </p>
                                </div>
                            </div>
                        </div>

                        <div class="col-xs-12 col-md-6">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <p class="fld-label"><fmt:message key="application.input.address.street.name" bundle="${msg}" /></p>
                                    <p class="fld-val">${homeCareDetails.aStreetName }</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">

                        <div class="col-xs-12 col-md-6">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <p class="fld-label"><fmt:message key="application.input.address.district" bundle="${msg}" /></p>
                                    <p class="fld-val">${homeCareDetails.aDistrictDesc }</p>
                                </div>
                            </div>
                        </div>

                        <div class="col-xs-12 col-md-6">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <p class="fld-label"><fmt:message key="application.input.address.area" bundle="${msg}" /></p>
                                    <p class="fld-val">${homeCareDetails.aAreaDesc }</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12">
                            <br>
                        </div>
                    </div>

                    <div class="col-xs-12">
                        <h3 class="heading-title"><fmt:message key="payment.jumbo.plan.summary" bundle="${msg}" /></h3>
                    </div>

                    <div class="row">

                        <div class="col-xs-12 col-md-6">

                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <p class="fld-label"><fmt:message key="payment.input.insurance.period" bundle="${msg}" /></p>
                                    <p class="fld-val">Yearly</p>
                                </div>
                            </div>
                        </div>

                        <div class="col-xs-12 col-md-6">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <p class="fld-label"><fmt:message key="payment.input.area" bundle="${msg}" /></p>
                                    <p class="fld-val">${homeCareDetails.netFloorAreaDesc }</p>
                                </div>
                            </div>
                        </div>
                       

                    </div>
                    <div class="row">
                        <div class="col-xs-12 col-md-6">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <p class="fld-label"><fmt:message key="payment.input.eff.coverage" bundle="${msg}" /></p>
                                    <p class="fld-val">${homeCareDetails.effectiveDate }</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">

                        
                        
                         <div class="col-xs-12 col-md-6">
                             <div class="form-group">
                                <div class="fld-wrapper">
                                    <p class="fld-label"><fmt:message key="payment.input.original.amount" bundle="${msg}" /></p>
                                    <p class="fld-val"><fmt:message key="label.dollar.hkd.en" bundle="${msg}" /> ${homeQuoteDetails.grossPremium } <fmt:message key="label.dollar.hkd.cn" bundle="${msg}" /></p>
                                </div>
                            </div>
                        </div>

                        <div class="col-xs-12 col-md-6">
                             <div class="form-group">
                                <div class="fld-wrapper">
                                    <p class="fld-label"><fmt:message key="lable.discount" bundle="${msg}" /></p>
                                    <p class="fld-val"><fmt:message key="label.dollar.hkd.en" bundle="${msg}" /> ${homeQuoteDetails.discountAmount } <fmt:message key="label.dollar.hkd.cn" bundle="${msg}" /></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>                   
            </div>
            <div class="row amount-due">
                
                <div class="col-xs-12">
                    <div class="row">
                        <div class="col-xs-12 col-md-2">
                            <div class="lbl-wrapper">
                                <span class="lbl"><fmt:message key="payment.input.amount" bundle="${msg}" /></span>
                            </div>
                        </div>

                        <div class="col-xs-12 col-md-10">
                            <span class="val xl"><fmt:message key="label.dollar.hkd.en" bundle="${msg}" /> ${homeQuoteDetails.totalDue } <fmt:message key="label.dollar.hkd.cn" bundle="${msg}" /></span>
                        </div>
                    </div>
                </div>
                
            </div>

			<fmt:formatNumber var="quoteTotal" value="${homeQuoteDetails.totalDue}" pattern="#"/>
			<c:choose>
				<c:when test="${quoteTotal<=0}">
		        	<div class="row form-block payment-wrapper">
			            <div class="btn-row text-center">
			                <a href="javascript:void(0);" class="btn-app eh-btn-back grey-out">Back</a>
			                <a href="<%=request.getContextPath()%>/${language}/household-insurance/${plan }/confirmation" class="btn-app">Next</a>
			            </div>
		        	</div>
				</c:when>
				<c:otherwise>
		            <div class="row form-block payment-wrapper">
		                <div class="col-xs-12">
		                    <h3 class="heading-title"><fmt:message key="payment.title" bundle="${msg}" /></h3>
		                </div>
		                    
		                <div class="col-xs-12">
		                    <div class="row">
		
		                        <div class="col-xs-12 col-md-6">
		                            
		                            <div class="form-group">
		                                <div class="fld-wrapper">
		                                    <p class="fld-label"><fmt:message key="payment.card.type" bundle="${msg}" /></p>
		                                    <p class="fld-val cardtype"><span class="visa">Visa</span>&nbsp;/&nbsp;<span class="mastercard">Master</span></p>
		                                </div>
		                            </div>
		                            <div class="form-group">
		                                <div class="fld-wrapper">
		                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
		                                        <input class="mdl-textfield__input" type="tel" id="ccNumber" name="ccNumber" data-keyblock-num="true" maxlength="19" autocomplete="off">
		                                        <label class="mdl-textfield__label" for="ccNumber"><fmt:message key="payment.card.no" bundle="${msg}" /></label>
		                                    </div>
		                                    
		                                </div>
		                                <span class="error-msg" id="ccNumberErrMsg"></span>
		                            </div>
		                            <div class="form-group">
		                                <div class="fld-wrapper">
		                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
		                                        <input class="mdl-textfield__input" type="text" id="ccName" name="cardHolder" data-keyblock-alphabet-num-space="true" autocomplete="off">
		                                        <label class="mdl-textfield__label" for="ccName"><fmt:message key="payment.card.holder.name" bundle="${msg}" /></label>
		                                    </div>
		                                </div>
		                                <span class="error-msg" id="ccNameErrMsg"></span>
		                            </div>
		                        </div>
		
		                        <div class="col-xs-12 col-md-6">
		                            
		                            <div class="row">
		                                <div class="col-xs-6">
		                                    <div class="form-group">
		                                        <div class="fld-wrapper">
		                                            <div class="mdl-select">
		                                                <select id="expMonth" name="epMonth">
		                                                    <option value="" disabled selected></option>
		                                                    <option value="1">01</option>
					                                        <option value="2">02</option>
					                                        <option value="3">03</option>
					                                        <option value="4">04</option>
					                                        <option value="5">05</option>
					                                        <option value="6">06</option>
					                                        <option value="7">07</option>
					                                        <option value="8">08</option>
					                                        <option value="9">09</option>
					                                        <option value="10">10</option>
					                                        <option value="11">11</option>
					                                        <option value="12">12</option>
		                                                </select>
		                                                <label class="mdl-textfield__label" for="ccName"><fmt:message key="payment.card.expiry.date" bundle="${msg}" /></label>
		                                            </div>
		                                            
		                                        </div>
		                                        <span class="error-msg" id="expMonthErrMsg"></span>
		                                    </div>
		                                </div>
		                                <div class="col-xs-6">
		                                    <div class="form-group">
		                                        <div class="fld-wrapper">
		                                            <div class="mdl-select">
		                                                <select id="expYear" name="epYear">
		                                                    <option value="" disabled selected></option>
		                                                    <c:forEach begin="0" end="10" varStatus="loop">
						                                        <c:set var="currentYear" value="${year + loop.index}" />
						                                        <option value="${currentYear}">${currentYear}</option>
						                                    </c:forEach>
		                                                </select>
		                                                <label class="mdl-textfield__label" for="ccName"><fmt:message key="payment.card.expiry.date" bundle="${msg}" /></label>
		
		                                            </div>
		                                        </div>
		                                        <span class="error-msg" id="expYearErrMsg"></span>
		                                    </div>
		                                </div>
		                            </div>
		                            <div class="row">
		                                <div class="col-xs-9 col-md-9">
		                                    <div class="form-group">
		                                        <div class="fld-wrapper">
		                                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
		                                                <input class="mdl-textfield__input" type="tel" id="cvvNumber" name="securityCode" data-keyblock-num="true" maxlength="3" autocomplete="off">
		                                                <label class="mdl-textfield__label" for="cvvNumber"><fmt:message key="payment.security.code" bundle="${msg}" /></label>
		                                            </div>
		                                        </div>
		                                        <span class="error-msg" id="cvvNumberErrMsg"></span>
		                                    </div>
		                                </div>
		                                <div class="col-xs-3 col-md-3">
		                                    <img src="<%=request.getContextPath()%>/resources/images/easy-home/cvv-logo.png" alt="" class="img-responsive">
		                                </div>
		                            </div>
		                        </div>
		                    </div>
		
		                    <div class="row">
		                        <div class="col-xs-12">
			                        <div class="form-group no-border">
				                        <div class="checkbox">
				                            <input type="checkbox" name="cbTNC" id="cbTNC" value=""><label for="cbTNC"><fmt:message key="home.summary.declarations" bundle="${msg}" /></label>
				                            <span class="error-msg" id="cbTNCErrMsg"></span>
				                        </div>
			
			                            
			                        </div>
		                    	</div>
		
		                	</div>
		                
		            	</div>
			            <div class="btn-row text-center">
			                <a href="javascript:void(0);" onclick="perventRedirect=false;BackMe();" class="btn-app eh-btn-back grey-out"><fmt:message key="payment.button.back" bundle="${msg}" /></a>
			                <%
			                    HomeCareDetailsBean homeCareDetails = (HomeCareDetailsBean) request.getAttribute("homeCareDetails");
			                %>
			                <c:choose>
								<c:when test="${language=='en'}">
					                <a href="javascript:void(0);" onclick="perventRedirect=false; javascript:kenshoo_conv('Registration_Step3','<%=String.format("%.2f",Double.parseDouble(homeCareDetails.getTotalDue()))%>','','Regis_Home_Step3 EN','USD');" class="btn-app eh-btn-next"><fmt:message key="payment.button.confirm" bundle="${msg}" /></a>
								</c:when>
						        <c:otherwise>
						            <a href="javascript:void(0);" onclick="perventRedirect=false; javascript:kenshoo_conv('Registration_Step3','<%=String.format("%.2f",Double.parseDouble(homeCareDetails.getTotalDue()))%>','','Regis_Home_Step3 EN','USD');" class="btn-app eh-btn-next"><fmt:message key="payment.button.confirm" bundle="${msg}" /></a>
								</c:otherwise>
							</c:choose>
			            </div>
			            <div class="submit__error">
			                <div class="text-center">
			                    <span class="submit__errormsg" id="submit__errormsg"></span>
			                </div>
			            </div>
		        	</div>
                </c:otherwise>
			</c:choose>
        <input type="hidden" id="pMethod" name="pMethod" value="">
        <input type="hidden" id="emailAddress" name="emailAddress" value="${userDetails.emailAddress}">
        <input type="hidden" name="referenceNo" value="${createdPolicy.referenceNo}">
        <input type="hidden" name="merchantId" value="${createdPolicy.merchantId}">
        <input type="hidden" name="currCode" value="${createdPolicy.currCode}">
        <input type="hidden" name="payType" value="${createdPolicy.paymentType}">
        <input type="hidden" id="gateway" name="gateway" value="${createdPolicy.paymentGateway}">
        <input type="hidden" name="orderRef" value="${confirm.transactionNo}">
        <input type="hidden" name="secureHash" value="${confirm.secureHash}">
        <input type="hidden" name="amount" value="${totalDue.trim()}">
        <input type="hidden" name="remark" value="${referralCode.trim()}">
        <input type="hidden" name="successUrl" value="${path}">
        <input type="hidden" name="failUrl" value="${failurePath}">
        <input type="hidden" name="errorUrl" value="${failurePath}">
        <input type="hidden" name="lang" value="C">
        <input type="hidden" id="transactionDate" name="transactionDate" value="${effectiveDate}">
        <input type="hidden" id="cardNo" name="cardNo">
    	</div>
        </form>
    </div>
</div>

<script type="text/javascript">
function BackMe() {
	window.location="<%=request.getContextPath()%>/${language}/household-insurance/${planIndex}/application";
}
</script>
