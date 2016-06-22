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
                        <a href="javascript:void(0);" class="btn-summary-back"><i class="icon icon-arrow-left2"></i></a>
                    </li>
                    <li class="first">
                        <div class="form-group">
                            <div class="fld-wrapper">
                            <p class="fld-label">${plan=='home-liability'? 'Personal Liability' : 'Easy HomeCare' }</p>
                            <p class="fld-val"><!-- Standard cover, Annual --></p>
                            </div>
                        </div>                        
                    </li>
                    <li class="hidden-xs">
                        <div class="form-group">
                            <div class="fld-wrapper">
                            <p class="fld-label">Promote Code</p>
                            <p class="fld-val"><span class="txt-promote-code">${homeQuoteDetails.referralCode == "" ? '-' : homeQuoteDetails.referralCode}</span></p>
                            </div>
                        </div>
                    </li>
                    <li class="hidden-xs">
                        <div class="form-group">
                            <div class="fld-wrapper">
                            <p class="fld-label">The Club Member</p>
                            <p class="fld-val"><span class="txt-theclub-member">${theClubMembershipNo == "" ? '-' : theClubMembershipNo}</span></p>
                            </div>
                        </div>
                    </li>
                    <li class="hidden-xs">
                        <div class="form-group">
                            <div class="fld-wrapper">
                            <p class="fld-label">Original price</p>
                            <p class="fld-val">HK$${homeQuoteDetails.grossPremium }</p>
                            </div>
                        </div>
                    </li>
                    <li class="hidden-xs">
                        <div class="form-group">
                            <div class="fld-wrapper">
                            <p class="fld-label">Discount</p>
                            <p class="fld-val">HK$${homeQuoteDetails.discountAmount }</p>
                            </div>
                        </div>
                    </li>
                    <li class="last hidden-xs">
                    	<div class="form-group">
                            <div class="fld-wrapper">
                            <p class="fld-label">Discount</p>
                            <p class="fld-val"><span class="txt-hkd-prefix">HK$</span><span class="txt-price">${homeQuoteDetails.totalDue }</span><span class="txt-hkd-suffix"></span></p>
                            </div>
                        </div>
                    </li>
                    <li class="visible-xs dropdown-more">
                         <a href="javascript:void(0);" class="btn-summary-back" class="dropdown-toggle" data-toggle="dropdown"><i class="glyphicon glyphicon-chevron-down"></i></a>

                         <ul class="col-sm-12 dropdown-menu dropdown-menu-more">
                            <li>
                                <div class="form-group">
                                    <div class="fld-wrapper">
                                        <p class="fld-label">Promote Code</p>
                                        <p class="fld-val"><span class="txt-promote-code">${homeQuoteDetails.referralCode == "" ? '-' : homeQuoteDetails.referralCode}</span></p>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="form-group">
                                    <div class="fld-wrapper">
                                        <p class="fld-label">The Club Member</p>
                                        <p class="fld-val"><span class="txt-theclub-member">${theClubMembershipNo == "" ? '-' : theClubMembershipNo}</span></p>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="form-group">
                                    <div class="fld-wrapper">
                                        <p class="fld-label">Original price</p>
                                        <p class="fld-val">HK$${homeQuoteDetails.grossPremium }</p>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="form-group">
                                    <div class="fld-wrapper">
                                        <p class="fld-label">Discount</p>
                                        <p class="fld-val">HK$${homeQuoteDetails.discountAmount }</p>
                                    </div>
                                </div>
                            </li>
                             <li>
                                <div class="form-group">
                                    <div class="fld-wrapper">
                                        <p class="fld-label">Amount due</p>
                                        <p class="fld-val"><span class="txt-hkd-prefix">HK$</span><span class="txt-price">${homeQuoteDetails.totalDue }</span></p>
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
                    <h3 class="heading-title"><fmt:message key="payment.jumbo.details" bundle="${msg}" /> <a href="<%=request.getContextPath()%>/${language}/household-insurance/${plan }/application" class="btn-edit">Edit</a></h3>
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
                                    <p class="fld-label">Room</p>
                                    <p class="fld-val">${homeCareDetails.applicantRoom }</p>
                                </div>
                            </div>
                        </div>

                        <div class="col-xs-12 col-md-4">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <p class="fld-label">Floor</p>
                                    <p class="fld-val">${homeCareDetails.applicantFloor }</p>
                                </div>
                            </div>
                        </div>

                        <div class="col-xs-12 col-md-4">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <p class="fld-label">Block</p>
                                    <p class="fld-val">${homeCareDetails.applicantBlock }</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">

                        <div class="col-xs-12 col-md-6">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <p class="fld-label">Building</p>
                                    <p class="fld-val">${homeCareDetails.applicantBuilding }</p>
                                </div>
                            </div>
                        </div>
                    
                        <div class="col-xs-12 col-md-6">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <p class="fld-label">Estate</p>
                                    <p class="fld-val">${homeCareDetails.applicantEstate }</p>
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="row">

                        <div class="col-xs-12 col-md-6">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <p class="fld-label">Street No.</p>
                                    <p class="fld-val">${homeCareDetails.applicantStreetNo } </p>
                                </div>
                            </div>
                        </div>

                        <div class="col-xs-12 col-md-6">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <p class="fld-label">Street Name</p>
                                    <p class="fld-val">${homeCareDetails.applicantStreetName }</p>
                                </div>
                            </div>
                        </div>
                    </div>

                     <div class="row">

                        <div class="col-xs-12 col-md-6">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <p class="fld-label">District</p>
                                    <p class="fld-val">${homeCareDetails.applicantDistrictDesc }</p>
                                </div>
                            </div>
                        </div>

                        <div class="col-xs-12 col-md-6">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <p class="fld-label">Area</p>
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
                                    <p class="fld-label">Room</p>
                                    <p class="fld-val">${homeCareDetails.aRoom }</p>
                                </div>
                            </div>
                        </div>

                        <div class="col-xs-12 col-md-4">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <p class="fld-label">Floor</p>
                                    <p class="fld-val">${homeCareDetails.aFloor }</p>
                                </div>
                            </div>
                        </div>

                        <div class="col-xs-12 col-md-4">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <p class="fld-label">Block</p>
                                    <p class="fld-val">${homeCareDetails.aBlock }</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">

                        <div class="col-xs-12 col-md-6">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <p class="fld-label">Building</p>
                                    <p class="fld-val">${homeCareDetails.aBuilding }</p>
                                </div>
                            </div>
                        </div>
                    
                        <div class="col-xs-12 col-md-6">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <p class="fld-label">Estate</p>
                                    <p class="fld-val">${homeCareDetails.aEstate }</p>
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="row">

                        <div class="col-xs-12 col-md-6">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <p class="fld-label">Street No.</p>
                                    <p class="fld-val">${homeCareDetails.aStreetNo } </p>
                                </div>
                            </div>
                        </div>

                        <div class="col-xs-12 col-md-6">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <p class="fld-label">Street Name</p>
                                    <p class="fld-val">${homeCareDetails.aStreetName }</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">

                        <div class="col-xs-12 col-md-6">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <p class="fld-label">District</p>
                                    <p class="fld-val">${homeCareDetails.aDistrictDesc }</p>
                                </div>
                            </div>
                        </div>

                        <div class="col-xs-12 col-md-6">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <p class="fld-label">Area</p>
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
                                    <p class="fld-val">HK$ ${homeQuoteDetails.grossPremium }</p>
                                </div>
                            </div>
                        </div>

                        <div class="col-xs-12 col-md-6">
                             <div class="form-group">
                                <div class="fld-wrapper">
                                    <p class="fld-label">Discount</p>
                                    <p class="fld-val">HK$ ${homeQuoteDetails.discountAmount }</p>
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
                            <span class="val xl">HK$ ${homeQuoteDetails.totalDue }</span>
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
		                                        <input class="mdl-textfield__input" type="text" id="ccName" name="cardHolder" autocomplete="off">
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
		                                                <label class="mdl-textfield__label" for="ccName">Expiry Month</label>
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
		                                                <label class="mdl-textfield__label" for="ccName">Expiry Year</label>
		
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
				                            <input type="checkbox" name="cbTNC" id="cbTNC" value=""><label for="cbTNC"><fmt:message key="payment.declaration" bundle="${msg}" /></label>
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
    window.history.back();
}
</script>
