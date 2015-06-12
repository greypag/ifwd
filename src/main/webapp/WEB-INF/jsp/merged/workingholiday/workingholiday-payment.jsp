<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="com.ifwd.fwdhk.model.WorkingHolidayDetailsBean"%>
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />

<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate var="year" value="${now}" pattern="yyyy" />

<script>
var clicked = false;
	function confirmHomeCarePayment(form, gatewayUrlId, paymentFormId) {
		var result=false;
		
		if (whPayValid() && clicked === false) {
 			clicked = true;
 			$("#PaymentingDiv").show();
 			var gatewayUrlId = '#' + gatewayUrlId;
 			var paymentFormId = '#' + paymentFormId;
 			var method = "<%=request.getContextPath()%>/processWorkingHolidayPayment";
 			
 			var geteWayUrl = $(gatewayUrlId).val();
 			<%-- form.action = '<%=request.getContextPath()%>/<%=session.getAttribute("language").toString()%>/working-holiday-insurance/confirmation'; --%>
 			
 			$.ajax({
 						type : "POST",
 						url : method,
 						data : $(paymentFormId).serialize(),
 						async : false,
 						success : function(data) {
 							if (data == 'success') {
 								form.action = geteWayUrl;
 								result=true;
 							} else {
 								result=false;
 							}
 						}
 					});

 		}else{
 			result=false;
 		}
		return result;
	}
	
</script>
<%
WorkingHolidayDetailsBean planDetailsForm = (WorkingHolidayDetailsBean) request.getAttribute("planDetailsForm");
%>
<!--/#main-Content-->
<section>
	<div id="cn" class="container">
		<div class="row">
			<form name="paymentForm" id="paymentForm" method="post" onsubmit="return confirmHomeCarePayment(this, 'gateway', 'paymentForm');">
				<ol class="breadcrumb pad-none">
					<li><a href="#"><fmt:message key="workingholiday.breadcrumb1.item1" bundle="${msg}" /></a> <i class="fa fa-caret-right"></i></li>
					<li><a href="#"><fmt:message key="workingholiday.breadcrumb1.item2" bundle="${msg}" /></a> <i class="fa fa-caret-right"></i></li>
					<li><a href="#"><span class="clearfix"></span> <fmt:message key="workingholiday.breadcrumb1.item3" bundle="${msg}" /></a><i
						class="fa fa-caret-right"></i></li>
					<li><a href="#"><fmt:message key="workingholiday.breadcrumb1.item4" bundle="${msg}" /></a></li>
					<li class="active "><i class="fa fa-caret-right"></i> <fmt:message key="workingholiday.breadcrumb1.item5" bundle="${msg}" /></li>
				</ol>
				<div class="container ">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 shop-tracking-status">
						<div class="center wow fadeInDown animated"
							style="visibility: visible;">
							<h2><fmt:message key="workingholiday.summary.jumbo" bundle="${msg}" /></h2>
						</div>
						<br>
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<div id="tr-wizard" class="shop-tracking-status">
								<div class="order-status has-four">
									<div class="order-status-timeline-new">
								<!--
										There can be n '.order-status-timeline-completion'
										dots-inactive and dots-active color the dots -->
										<div class="order-status-timeline-completion dots-active"></div>
										<div class="order-status-timeline-completion dots-active"></div>
										<div class="order-status-timeline-completion dots-inactive"></div>
									</div>
									<div
										class="image-order-status image-order-status-new active img-circle first">
										<span class="status color3"> <fmt:message key="workingholiday.breadcrumb2.item1" bundle="${msg}" /></span>
										<div class="icon">1</div>
									</div>
									<div
										class="image-order-status image-order-status-intransit  img-circle second">
										<span class="status color3"><fmt:message key="workingholiday.breadcrumb2.item2" bundle="${msg}" /></span>
										<div class="icon">2</div>
									</div>
									<div
										class="image-order-status image-order-status-delivered  img-circle act third">
										<span class="status color2"> <fmt:message key="workingholiday.breadcrumb2.item3" bundle="${msg}" /></span>
										<div class="icon">3</div>
									</div>
									<div
										class="image-order-status image-order-status-completed  img-circle disabled fourth">
										<span class="status lst-status"> <fmt:message key="workingholiday.breadcrumb2.item4" bundle="${msg}" /></span>
										<div class="icon">4</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="container pad-none bdr ur-opt-content gray-bg3">
					<div class="col-lg-12 col-xs-12 col-sm-12 col-md-12 pad-none white-bg1 summary-container">
						<!-- <div class="col-xs-12 col-md-7  pad-none"> -->
						   <div class="row summary-row">
                                <div style="width:80%;margin-left:10%;">
	                            <div class="col-xs-12 col-sm-12 col-md-10 col-lg-10 pad-none">
	                                <h3 class="h2-3-existing-fwd-head summary-header summary-header-margin" style="margin-left:0px !important;"><fmt:message key="workingholiday.summary.heading" bundle="${msg}" /></h3>
	                            </div>
	                            <!-- 
	                            <div class="hidden-xs hidden-sm col-md-2 col-lg-2 pad-none summary-header-margin">
	                                <h4 class="h4-trav-full">
	                                    <a href="<%=request.getContextPath()%>/${language}/home-insurance/user-details" onclick="perventRedirect=false;" ><fmt:message key="travel.summary.subheading" bundle="${msg}" /></a>
	                                </h4>
	                            </div>
	                             -->
	                             <div class="clearfix"></div>
                                </div>
	                        </div>
							<!-- <h3 class="margin-left-2 h2-3-existing-fwd-head"><fmt:message key="workingholiday.summary.heading" bundle="${msg}" /></h3> -->
							<div class="row summary-row">
                                <div style="width:80%;margin-left:10%;">
                            <!-- <table class="table activation-form margin-left-2"> -->
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-none">
                                <div class="table activation-form vert-middle travel-summary">
                                        <!-- <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 h2-1 pad-none"><span class="home-summary-applicant h2-3-existing-fwd-head"><fmt:message key="home.summary.changedetail.desc1" bundle="${msg}" /></span></div>
                                        </div> -->
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><fmt:message key="workingholiday.summary.applicant.name" bundle="${msg}" /></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none">${userDetails.getFullName()}</div>
                                        </div>
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><fmt:message key="workingholiday.summary.applicant.hkid" bundle="${msg}" /></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none">${userDetails.getHkid()}</div>
                                        </div>
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><fmt:message key="workingholiday.summary.applicant.email" bundle="${msg}" /></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none">${userDetails.getEmailAddress()}</div>
                                        </div>
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><fmt:message key="workingholiday.summary.applicant.mobileNo" bundle="${msg}" /></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none">${userDetails.getMobileNo()}</div>
                                        </div>
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><fmt:message key="workingholiday.summary.applicant.requestNo" bundle="${msg}" /></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none">${whCreatePolicy.getReferenceNo()}</div>
                                        </div>
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><fmt:message key="workingholiday.summary.plan" bundle="${msg}" /></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none">
                                                ${selectPlanName}  <fmt:message key="workingholiday.summary.plan" bundle="${msg}" />
	                                            <%String selectPlanName = (String) request.getAttribute("selectPlanName");%>
	                                            <%if (selectPlanName.equals("A")){%>
	                                                - <fmt:message key="workingholiday.quote.plan1.type" bundle="${msg}" />- HK$ 1,000,000 <fmt:message key="workingholiday.quote.plan1.medical" bundle="${msg}" />
	                                            <%} else{ %>
	                                                - <fmt:message key="workingholiday.quote.plan2.type" bundle="${msg}" />- HK$    500,000 <fmt:message key="workingholiday.quote.plan2.medical" bundle="${msg}" />
	                                            <%} %>
                                            </div>
                                        </div>
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><fmt:message key="workingholiday.summary.period" bundle="${msg}" /></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none">
                                                <fmt:message key="workingholiday.summary.period.from" bundle="${msg}" />
	                                            ${commencementDate} <fmt:message key="workingholiday.summary.period.to" bundle="${msg}" />
	                                            ${expiryDate}
                                            </div>
                                        </div>
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><fmt:message key="workingholiday.summary.days" bundle="${msg}" /></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none">${totalDays}
                                            </div>
                                        </div>
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head" style="color: #f68a1d !important;"><fmt:message key="workingholiday.summary.amountDue" bundle="${msg}" /></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none">
                                                <span class="h4-4-orange-b pad-none"><fmt:message key="workingholiday.dollar" bundle="${msg}" /> ${dueAmount} </span>
                                            </div>
                                        </div>
                                        <div class="row summary-row">
                                            <div class="hidden-xs hidden-sm col-md-12 col-lg-12 pad-none">
                                            <!-- Plan benefits -->
                                                <div class="fwdpanel summary-fwdpanel">
                                                    <c:if test="${selectPlanName=='A'}">
                                                        <div class="fwdpanel-heading">
                                                            <h4 class="benefits">
                                                                <span>
                                                                    <a href="#" class="fwdpanel-minimize uline"><i class="fa fa-plus"></i> <fmt:message key="workingholiday.quote.plan1.benefits" bundle="${msg}" /></a>
                                                                </span>
                                                            </h4>
                                                        </div>
                                                        <div class="fwdpanel-body" style="display: none;">
                                                        <div class="col-xs-11 col-xs-offset-1">
                                                        <div class="row">
                                                            <div class="col-lg-8 col-md-8 col-xs-7 pad-none">
                                                                    <i class="fa fa-circle small-fa-bullet"></i> <fmt:message key="workingholiday.quote.plan1.benefits.desc1" bundle="${msg}" /></div>
                                                        <div class="col-lg-4 col-md-4 col-xs-5">
                                                            <fmt:message key="workingholiday.quote.plan1.benefits.desc1.price" bundle="${msg}" />
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-8 col-md-8 col-xs-7 pad-none">
                                                            <i class="fa fa-circle small-fa-bullet"></i> <fmt:message key="workingholiday.quote.plan1.benefits.desc2" bundle="${msg}" />
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-xs-5">
                                                            <fmt:message key="workingholiday.quote.plan1.benefits.desc2.price" bundle="${msg}" />
                                                            </div>
                                                        </div> 
                                                        
                                                        <div class="row">
                                                            <div class="col-lg-8 col-md-8 col-xs-7 pad-none">
                                                            <i class="fa fa-circle small-fa-bullet"></i> <fmt:message key="workingholiday.quote.plan1.benefits.desc3" bundle="${msg}" /> </div>
                                                        <div class="col-lg-4 col-md-4 col-xs-5">
                                                            <fmt:message key="workingholiday.quote.plan1.benefits.desc3.price" bundle="${msg}" />
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-8 col-md-8 col-xs-7 pad-none">
                                                            <i class="fa fa-circle small-fa-bullet"></i> <fmt:message key="workingholiday.quote.plan1.benefits.desc4" bundle="${msg}" /></div>
                                                        <div class="col-lg-4 col-md-4 col-xs-5">
                                                            <fmt:message key="workingholiday.quote.plan1.benefits.desc4.price" bundle="${msg}" />
                                                                    </div>
                                                                    </div>
                                                                </div>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${selectPlanName=='B'}">
                                                        <div class="fwdpanel-heading">
                                                            <h4 class=" benefits">
                                                                <span>
                                                                  <a href="#" class="fwdpanel-minimize uline text-black"><i class="fa fa-plus"></i> <fmt:message key="workingholiday.quote.plan2.benefits" bundle="${msg}" /></a>
                                                                </span>
                                                            </h4>
                                                        </div>
                                                        <div class="fwdpanel-body" style="display: none;">
                                                        <div class="col-xs-11 col-xs-offset-1">
                                                        <div class="row">
                                                            <div class="col-lg-8 col-md-8 col-xs-7 pad-none">
                                                                    <i class="fa fa-circle small-fa-bullet"></i> <fmt:message key="workingholiday.quote.plan2.benefits.desc1" bundle="${msg}" /></div>
                                                        <div class="col-lg-4 col-md-4 col-xs-5">
                                                            <fmt:message key="workingholiday.quote.plan2.benefits.desc1.price" bundle="${msg}" />
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-8 col-md-8 col-xs-7 pad-none">
                                                            <i class="fa fa-circle small-fa-bullet"></i> <fmt:message key="workingholiday.quote.plan2.benefits.desc2" bundle="${msg}" />
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-xs-5">
                                                            <fmt:message key="workingholiday.quote.plan2.benefits.desc2.price" bundle="${msg}" />
                                                            </div>
                                                        </div> 
                                                        
                                                        <div class="row">
                                                            <div class="col-lg-8 col-md-8 col-xs-7 pad-none">
                                                            <i class="fa fa-circle small-fa-bullet"></i> <fmt:message key="workingholiday.quote.plan2.benefits.desc3" bundle="${msg}" /> </div>
                                                        <div class="col-lg-4 col-md-4 col-xs-5">
                                                            <fmt:message key="workingholiday.quote.plan2.benefits.desc3.price" bundle="${msg}" />
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-8 col-md-8 col-xs-7 pad-none">
                                                            <i class="fa fa-circle small-fa-bullet"></i> <fmt:message key="workingholiday.quote.plan2.benefits.desc4" bundle="${msg}" /></div>
                                                        <div class="col-lg-4 col-md-4 col-xs-5">
                                                            <fmt:message key="workingholiday.quote.plan2.benefits.desc4.price" bundle="${msg}" />
                                                                    </div>
                                                                    </div>
                                                                </div>
                                                        </div>
                                                    </c:if>
                                                    
                                                    
                                                    <div class="clearfix"></div>
                                                </div>
                                            <!-- / Plan benefits -->
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                            
                            <div id="no-more-tables" class="hidden-sm hidden-xs">
							<div style="width:80%;margin-left:10%;">
							<table class="col-md-12 table-condensed cf pad-left-20 beneList ">

								<tbody>
									<tr class="travel-tb-head">
										<td class=" h2-1  travel-tb-td"><fmt:message key="workingholiday.summary.insured" bundle="${msg}" /></td>
										<td class=" h2-1  travel-tb-td"><fmt:message key="workingholiday.summary.insured.name" bundle="${msg}" /></td>
										<%-- <td class=" h2-1  travel-tb-td"><fmt:message key="workingholiday.summary.insured.age" bundle="${msg}" /></td> --%>
										<td class=" h2-1  travel-tb-td"><fmt:message key="workingholiday.summary.insured.hkid" bundle="${msg}" /></td>
										<td class=" h2-1  travel-tb-td"><fmt:message key="workingholiday.summary.insured.beneficiary.relation" bundle="${msg}" /></td>
									</tr>
	                            </tbody>
								<tbody>
									<tr class="hidden-sm hidden-xs">
										<td data-title="Other"><span class="h2-1-td"><fmt:message key="workingholiday.summary.insured.traveller" bundle="${msg}" /></span></td>
										<td class=" h4-5" data-title="Full name">${userDetails.getFullName()}</td>
										<!-- <td class=" h4-5" data-title="Age range"></td> --> 
										<td class=" h4-5" data-title="HKID">${userDetails.getHkid()}</td>
										<td data-title="Relationship"><span class="h4-5"></span></td>
									</tr>
									
									<c:if test="${workingHolidayPlanDetailsForm != null && workingHolidayPlanDetailsForm.getWhInsBeneficary() != 'SE'}" >
									<tr>
										<td data-title="Personal1"><span class="h4-6-td"><fmt:message key="workingholiday.summary.insured.label.family.beneficiary" bundle="${msg}" /></span></td>
	                                    <td data-title="Full name" class="travel-tb-h3">${workingHolidayPlanDetailsForm.getWhInsFullName()}</td>
                                        <!-- <td data-title="Age range" class="travel-tb-h3">&nbsp;</td> -->
                                        <td data-title="HKID" class="travel-tb-h3">${workingHolidayPlanDetailsForm.getWhInsHKID()}</td>
	                                    <td data-title="Relationship" class="travel-tb-h3">${whInsBeneficaryDesc}</td>
									</tr>
									</c:if>
								</tbody>
							</table>
							</div>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="gray-bg1">
					<div style="width:80%;margin-left:10%;">
					<div class="col-xs-12 pad-none">
						<h2 class="from-control" style="padding:0px !important;"><fmt:message key="workingholiday.payment" bundle="${msg}" /></h2>
						<span id="paymentGatewayErrorMsg"  class="text-red">${errormsg}</span>
					</div>
					<input type="hidden" name="merchantId" value="${whCreatePolicy.getMerchantId()}">
					<input type="hidden" name="amount" value="${dueAmount.replace(',','').trim()}">
					<input type="hidden" name="orderRef" value="${whCreatePolicy.getTransactionNo() }">
					<input type="hidden" name="currCode" value="${whCreatePolicy.getCurrCode() }">
					<input type="hidden" name="successUrl" value="${path}">
					<input type="hidden" name="failUrl" value="${failurePath }">
					<input type="hidden" name="errorUrl" value="${failurePath }">
					<input type="hidden" name="payType" value="${whCreatePolicy.getPaymentType()}">
					<input type="hidden" name="referenceNo" value="${whCreatePolicy.getReferenceNo()}"> 
					<%
						String payLang = (String) session.getAttribute("language");
						//payLang = payLang.substring(0, 1);
						//System.out.println("getLanguage" + session.getAttribute("language"));
						payLang = "C";
						//System.out.println("payLang" + payLang);
						//if (payLang.equals("t"))
						
					%>
					<input type="hidden" name="lang" value="C">
					<input type="hidden" name="secureHash" value="${whCreatePolicy.getSecureHash() }">
					<input type="hidden" id="emailAddress" name="emailAddress" value="${userDetails.getEmailAddress()}">
					<input type="hidden" id="gateway" name="gateway" value="${whCreatePolicy.getPaymentGateway()}">

    
                    <div class="col-xs-12 pad-none">
                        <div class="form-group float">
                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 pad-none">
                                <label class="control-label h4-5"><fmt:message key="workingholiday.payment.card.type" bundle="${msg}" /></label>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 pad-none">
                                <img src="<%=request.getContextPath()%>/resources/images/payment.png" alt="">
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="form-group float" style="display: none;">
                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 pad-none">
                                <label class="control-label h4-5">Payment Method</label>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 pad-none">
                                <label class="radio-inline">                            
                                 <input type="radio" name="pMethod" checked="checked" value="VISA" id="chkVisa"> VISA
                                </label>    
                                <label class="radio-inline">        
                                    <input type="radio" name="pMethod" value="Master" id="chkMaster"> MasterCard 
                                </label>
                                
                                <!-- <input type="radio" name="pMethod" value="Diners">Diners
                                    Club <input type="radio" name="pMethod" value="JCB">JCB
                                    <input type="radio" name="pMethod" value="AMEX">AMEX
                                    
                                    -->
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="form-group float">
                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 pad-none">
                                <label class="control-label h4-5"><fmt:message key="workingholiday.payment.card.no" bundle="${msg}" /></label>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 pad-none">
                                <input id="cardnumber" name="cardNo" type="text"
                                            class="input-block-level" maxlength="16" data-min="16"
                                            title=""
                                            onkeyup="" onkeypress="return isNumeric(event)" 
                                            onBlur="validatecardnumber(this.value)"
                                             />
                                            
                                            <span
                                            id="errcardno" class="error-msg"></span>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="form-group float">
                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 pad-none">
                                <label class="control-label  h4-5"><fmt:message key="workingholiday.payment.card.expiryDate" bundle="${msg}" /></label>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-4 col-lg-4 pad-none" style="padding-right: 2% !important;">
                                <div class="styled-select payment-select"><select class="pay-details-select"
                                    id="month" name="epMonth" onBlur="chkValidCreditCardExpDate(this, 'erryear', 'month', 'errmonth');">
                                        <option value="0"><fmt:message key="workingholiday.payment.card.expiryDate.month" bundle="${msg}" /></option>
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
                                </select></div>
                                <span id="errmonth"
                                    class="error-msg"></span>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-4 col-lg-4 pad-none" style="padding-left: 2% !important;">
                                <div class="styled-select payment-select"><select class="pay-details-select" id="year"
                                    name="epYear" onBlur="chkValidCreditCardExpDate(this, 'erryear', '', '');">
                                        <option value="0"><fmt:message key="workingholiday.payment.card.expiryDate.year" bundle="${msg}" /></option>
<!--                                        <option value="2015">2015</option> -->
<!--                                        <option value="2016">2016</option> -->
<!--                                        <option value="2017">2017</option> -->
<!--                                        <option value="2018">2018</option> -->
<!--                                        <option value="2019">2019</option> -->
<!--                                        <option value="2020">2020</option> -->

<!--                                        <option value="2021">2021</option> -->
<!--                                        <option value="2022">2022</option> -->
<!--                                        <option value="2023">2023</option> -->
<!--                                        <option value="2024">2024</option> -->
<!--                                        <option value="2025">2025</option> -->


                                    <c:forEach begin="0" end="10" varStatus="loop">
                                        <c:set var="currentYear" value="${year + loop.index}" />
                                        <option value="${currentYear}">${currentYear}</option>
                                    </c:forEach>
                                </select></div>
                                <span id="erryear"
                                    class="error-msg"></span>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="form-group float">
                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 pad-none">
                                <label class="control-label  h4-5"><fmt:message key="workingholiday.payment.card.holderName" bundle="${msg}" /></label>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 pad-none">
                                <input id="holdername" name="cardHolder" type="text"
                                            class="input-block-level"
                                            onblur="replaceAlpha(this); chkNotNullCreditCareName(this, 'errname');"
                                            onkeypress="return alphaOnly(event);"> <span
                                            id="errname" class="error-msg"></span>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="form-group float">
                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 pad-none">
                                <label class="control-label  h4-5"><fmt:message key="workingholiday.payment.card.cvv" bundle="${msg}" /></label>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-4 col-lg-4 pad-none" style="padding-right: 2% !important;">
                                <input id="seccode" type="password" name="securityCode"
                                            class="input-block-level" autocomplete="off" maxlength="3"
                                            title=""
                                            onblur="replaceAlphaNumeric(this);"
                                            onkeypress="return isAlphaNumeric(event);" >
                                <span id="errcode"
                                    class="error-msg"></span>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-4 col-lg-4 pad-none" style="padding-left: 2% !important;">
                                <img src="<%=request.getContextPath()%>/resources/images/icon-card.png" alt="">
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    
                    
					<div class="clearfix"></div>
					
					
					<div class="declaration-content" style="margin:0px !important;">
                        <div class="checkbox" style="padding-left: 24px;">
                            <input id="checkbox3" type="checkbox"> <label
                                for="checkbox3"> <fmt:message key="workingholiday.payment.declarations" bundle="${msg}" /></label>
                        </div>
                        <span id="errchk1" class="error-msg"></span>

                        <span id="errchk2" class="error-msg"></span>
                        <div class="clearfix"></div>
                        <div class="row">
                            <div class="col-lg-2 col-md-2 col-sm-6 col-xs-6 pull-left">
                                <a class="bdr-curve btn btn-primary bck-btn" onclick="perventRedirect=false;BackMe();"><fmt:message key="workingholiday.action.back" bundle="${msg}" /> </a>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-6 pull-left">
                                <input type="submit"
                                    class="bdr-curve btn btn-primary nxt-btn"
                                    value="<fmt:message key="workingholiday.payment.confirmPayment" bundle="${msg}" />" onclick="confirmPayment()" />
                            </div>
                        </div>
                            <div class="clearfix"></div>
                        </div>
					
						<hr class="summary-hr"/>
						
						<div id="paydoller-wrap" class="declaration-content" style="margin:0px !important;">
                          <div id="paydollar-container" class="col-xs-12 col-sm-12 col-md-4 col-lg-4 paymethod-container">
                            <div id="paydollar-icon" class="col-xs-6 col-sm-3 col-md-12 col-lg-12 pad-none pull-left paymethod-icon">
                             <img src="<%=request.getContextPath()%>/resources/images/icon-pay-dollar.png" alt="">
                            </div>
                            <div class="col-xs-6 col-sm-9 col-md-12 col-lg-12 pad-none pull-right">
                             <fmt:message key="workingholiday.action.paydollar" bundle="${msg}" />
                            </div>
                            <div class="clearfix"></div>
                          </div>
                          <div id="visa-container" class="col-xs-12 col-sm-12 col-md-4 col-lg-4 paymethod-container">
                            <div id="visa-icon" class="col-xs-6 col-sm-3 col-md-12 col-lg-12 pad-none pull-left paymethod-icon">
                             <img src="<%=request.getContextPath()%>/resources/images/icon-visa.png" alt="">
                            </div>
                            <div class="col-xs-6 col-sm-9 col-md-12 col-lg-12 pad-none pull-right">
                             <fmt:message key="workingholiday.action.visa" bundle="${msg}" />
                            </div>
                            <div class="clearfix"></div>
                          </div>
                          <div id="master-container" class="col-xs-12 col-sm-12 col-md-4 col-lg-4 paymethod-container">
                            <div id="master-icon" class="col-xs-6 col-sm-3 col-md-12 col-lg-12 pad-none pull-left paymethod-icon">
                             <img src="<%=request.getContextPath()%>/resources/images/icon-master.png" alt="">
                            </div>
                            <div class="col-xs-6 col-sm-9 col-md-12 col-lg-12 pad-none pull-right">
                             <fmt:message key="workingholiday.action.master" bundle="${msg}" />
                            </div>
                            <div class="clearfix"></div>
                          </div>
                          <div class="clearfix"></div>
                        </div>
						
							
							
													
							<div class="clearfix"></div>
						</div>
						</div>
						<br>
						<br>
					</div>
				</div>
			</form>
		</div>
		<!--/.row-->
	</div>
	<!--/.container-->
	<br>
</section>
<!--/end Main Content-->
<div id="PaymentingDiv" class="waitingDiv" style="display: none">
	<img
		style="width: 200px; height: 200px; position: absolute; top: 40%; left: 40%"
		src="<%=request.getContextPath()%>/resources/images/ajax-loader.gif">
</div>

<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/wh-details.js"></script>
