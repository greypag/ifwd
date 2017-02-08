﻿<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeQuoteBean"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="enhance" uri="http://pukkaone.github.com/jsp" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<script type="text/javascript">
var context = "${pageContext.request.contextPath}";
var language = "${language}";
var affiliate = "${affiliate}";
var home_url = "<%=request.getContextPath()%>";
</script>

    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/material.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/easy-health/application.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/easy-health/easyhealth-application.css">
    <script src="<%=request.getContextPath()%>/resources/jsignature/jSignature.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/application.common.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/easy-health/easyhealth-app-uifn.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/elite-term/bootstrapValidator.min.js"></script>
    <script>
        function showPaymentErrMsg(){
            $("#paymentErr").show();
        }
    </script>
    
    <!-- Breadcrumb Component Start-->
    <div class="container container-fluid container--breadcrumb">
    	<c:set var="breadcrumbItems">
    		breadcrumb.item.home,breadcrumb.item.protect,breadcrumb.item.health,breadcrumb.item.cansurance,breadcrumb.item.application
		</c:set>
    	<c:set var="breadcrumbActive">4</c:set>
	    
	    <jsp:include page="/WEB-INF/jsp/merged/comp/breadcrumb.jsp">
	    	<jsp:param name="breadcrumbItems" value="${breadcrumbItems}"/>
	    	<jsp:param name="breadcrumbActive" value="${breadcrumbActive}"/>
		</jsp:include>
	</div>
	<!-- Breadcrumb Component End-->
 
	<!-- StepIndicator Component Start-->

    	<c:set var="stepItems">
    		stepindicator.selectplan,stepindicator.application.summary.declaration,stepindicator.sign,stepindicator.payment,stepindicator.upload.document,stepindicator.confirmation
		</c:set>
    	<c:set var="stepActive">3</c:set>

        <jsp:include page="/WEB-INF/jsp/merged/comp/step-indicator.jsp">
        	<jsp:param name="stepItems" value="${stepItems}"/>
			<jsp:param name="stepActive" value="${stepActive}"/>
    	</jsp:include>

	<!-- StepIndicator Component End-->
	
	<div class="savie-online-container app-pg-ctnr" id="eh-app-payment">
	
	<!-- Application Content Start -->
	<div class="app-pg-cont">
	    <form name="paymentForm" id="paymentForm" method="post">
		<input type="hidden" id="cardNo" name="cardNo" maxlength="16" data-min="16">
        <input type="hidden" name="merchantId" value="${lifePolicy.merchantId}">
        <input type="hidden" name="secureHash" value="${lifePolicy.secureHash }">
        <input type="hidden" name="amount" value="<fmt:formatNumber value='${selectPlan.monthlyPremium *2}' pattern="#.00"/>">
        <input type="hidden" name="orderRef" value="${lifePolicy.transactionNumber }">
        <input type="hidden" name="currCode" value="344">
        <input type="hidden" name="successUrl" value="${successUrl}">
        <input type="hidden" name="failUrl" value="${failurePath }">
        <input type="hidden" name="cancelUrl" value="${failurePath }">
        <input type="hidden" name="payType" value="N">
        <input type="hidden" name="lang" value="C">
        <input type="hidden" name="remark" value="">
        <input type="hidden" name="pMethod" id="pMethod" value="Master">
        <input type="hidden" id="emailAddress" name="emailAddress" value="273128396@qq.com"> 
         <input type="hidden" id="appFirstName" value="<%= session.getAttribute("fname") %> ">  
        <input type="hidden" id="appLastName" value="<%= session.getAttribute("lname") %>"> 
       
		<input type="hidden" name="referenceNo" value="${lifePolicy.policyNo}">
		<input type="hidden" id="gateway" name="gateway" value="${lifePolicy.paymentGateway}"/>
		
		<div class="container-fluid">
			<div class="row">
				<div class="col-xs-12 col-md-12">
                    <h3 class="heading-title"><fmt:message key="payment.title" bundle="${msg}" /></h3>
                     <p><fmt:message key="payment.description.1" bundle="${msg}" /><br><fmt:message key="payment.description.2" bundle="${msg}" /> <fmt:formatNumber value='${selectPlan.monthlyPremium }' pattern="#.00"/><br><fmt:message key="payment.description.3" bundle="${msg}" /> <fmt:formatNumber value='${selectPlan.monthlyPremium *2}' pattern="#.00"/> <fmt:message key="payment.description.3.extra" bundle="${msg}" /></p>

                     <div class="row inner-row">
                         <div class="col-xs-12 col-md-6">
                         	<div class="form-group">
	                         	<div class="fld-wrapper">
									<p class="fld-label"><fmt:message key="payment.description.amount" bundle="${msg}" /></p>
									<p class="fld-val"><fmt:message key="easyhealth.plan.monthly.premium.basic" bundle="${msg}" /> <fmt:formatNumber value='${selectPlan.monthlyPremium *2}' pattern="#.00"/></p>
								</div>
							</div>
							<div class="form-group">
								<div class="fld-wrapper">
									<p class="fld-label"><fmt:message key="payment.card.type" bundle="${msg}" /></p>
									<p class="fld-val cardtype"><span class="visa">Visa</span><span class="cardtype-slash">&nbsp;/&nbsp;</span><span class="mastercard">Master</span></p>
								</div>
							</div>
							<div class="form-group">
								<div class="fld-wrapper">
		                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
										<input class="mdl-textfield__input" type="tel" id="ccNumber" name="ccNumber" data-keycheck-numOnly="true" maxlength="19">
										<label class="mdl-textfield__label" for="ccNumber"><fmt:message key="payment.card.no" bundle="${msg}" /></label>
									</div>
									
								</div>
								<span class="error-msg" id="ccNumberErrMsg"></span>
							</div>
						</div>
						<div class="col-xs-12 col-md-6">
							<div class="form-group">
								<div class="fld-wrapper">
									<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
										<input class="mdl-textfield__input" type="text" id="cardHolder" name="cardHolder" data-chkAlphabetOnly="true" data-blurcheck-replaceAlphabet="true">
										<label class="mdl-textfield__label" for="cardHolder"><fmt:message key="payment.card.holder.name" bundle="${msg}" /></label>
									</div>
								</div>
								  <span class="error-msg" id="cardHolderErrMsg"></span>   
							</div>
							<div class="row">
								<div class="col-xs-6">
									<div class="form-group">
										<div class="fld-wrapper">
											<div class="mdl-select">
												<select id="epMonth" name="epMonth">
													<option value="" disabled selected></option>
													<option value="01">01</option>
													<option value="02">02</option>
													<option value="03">03</option>
													<option value="04">04</option>
													<option value="05">05</option>
													<option value="06">06</option>
													<option value="07">07</option>
													<option value="08">08</option>
													<option value="09">09</option>
													<option value="10">10</option>
													<option value="11">11</option>
													<option value="12">12</option>
												</select>
												<label class="mdl-textfield__label" for="epMonth"><fmt:message key="payment.card.expiry.month" bundle="${msg}" /></label>
											</div>
											
										</div>
										<span class="error-msg" id="epMonthErrMsg"></span>
									</div>
								</div>
								<div class="col-xs-6">
									<div class="form-group">
										<div class="fld-wrapper">
											<div class="mdl-select">
												<select id="epYear" name="epYear">
													<option value="" disabled selected></option>
													<option value="2016">2016</option>
													<option value="2017">2017</option>
													<option value="2018">2018</option>
													<option value="2019">2019</option>
													<option value="2020">2020</option>
													<option value="2021">2021</option>
													<option value="2022">2022</option>
													<option value="2023">2023</option>
													<option value="2024">2024</option>
													<option value="2025">2025</option>
												</select>
												<label class="mdl-textfield__label" for="epYear"><fmt:message key="payment.card.expiry.year" bundle="${msg}" /></label>

											</div>
										</div>
										<span class="error-msg" id="epYearErrMsg"></span>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-9 col-md-9">
									<div class="form-group">
										<div class="fld-wrapper">
											<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
												<input class="mdl-textfield__input" type="password" id="securityCode" name="securityCode" data-keycheck-numOnly="true" maxlength="3">
												<label class="mdl-textfield__label" for="securityCode"><fmt:message key="payment.security.code" bundle="${msg}" /></label>
											</div>
										</div>
										<span class="error-msg" id="securityCodeErrMsg"></span>
									</div>
								</div>
								<div class="col-xs-3 col-md-3">
									<img src="<%=request.getContextPath()%>/resources/images/elite-terms/cvv-logo.png" alt="" class="img-responsive">
								</div>
							</div>
                         </div>
                     </div>
                </div>
                <div class="col-xs-12 easy_health_payment_address_wrapper">
                	<div class="form-group">
                		<div><fmt:message key="payment.life.address.line1" bundle="${msg}" /></div>
                		<div><fmt:message key="payment.life.address.line2" bundle="${msg}" /></div>
                		<div><fmt:message key="payment.life.address.line3" bundle="${msg}" /></div>
					</div>
                </div>
                <div class="col-xs-12">
                	<div class="form-group cbTNC-wrapper">
	    				<div class="checkbox">
							<input type="checkbox" name="cbTNC" id="cbTNC" value=""><label for="cbTNC"><fmt:message key="payment.declaration" bundle="${msg}" /></label>
						</div>
						<span class="error-msg" id="cbTNCErrMsg"></span>
					</div>
                </div>
                <div class="col-xs-12">
					<div class="payment-ico-info">
		                <div class="col-xs-12 col-md-4">
		                	<div class="text-center">
		                		<div class="ico-wrapper">
		                			<img src="<%=request.getContextPath()%>/resources/images/elite-terms/paydollar-icon.png" alt="">
		                		</div>
		                		<p><fmt:message key="home.action.paydollar" bundle="${msg}" /></p>
		                	</div>
		                </div>
		                <div class="col-xs-12 col-md-4">
		                	<div class="text-center">
		                		<div class="ico-wrapper">
			                		<img src="<%=request.getContextPath()%>/resources/images/elite-terms/verifiedbyvisa-icon.png" alt="">
			                	</div>
		                		<p><fmt:message key="home.action.visa" bundle="${msg}" /></p>
		                	</div>
		                </div>
		                <div class="col-xs-12 col-md-4">
		                	<div class="text-center">
		                		<div class="ico-wrapper">
		                			<img src="<%=request.getContextPath()%>/resources/images/elite-terms/mastercard-icon.png" alt="">
		                		</div>
		                		<p><fmt:message key="home.action.master" bundle="${msg}" /></p>
		                	</div>
		                </div>
	                </div>

                </div>
                
                <div class="col-xs-12">
                	<div class="text-center btn-row">
                        <a href="javascript:void(0);" class="text-bold btn btn-confirm btn-app" id="btn-payment"><fmt:message key="button.proceed.to.upload.document" bundle="${msg}" /></a><br>
                        <!-- <a href="javascript:void(0);" class="link-text">Save and continue later</a> -->
                    </div>
                </div>
                
                <div class="col-xs-12" id="paymentErr">
                	<div class="text-center">
                		<span class="error-msg" id="paymentErMsg"><fmt:message key="payment.error.msg1" bundle="${msg}" /></span>
                	</div>
                </div>
			</div>
		</div>
		</form>
	</div>
    </div>

</div>

<script>

$(document).ready(function() {
	
	var fn=$('#appFirstName').val();
	var ln=$('#appLastName').val();
	console.log(fn+" "+ln)
	
	
    $('#ccNumber').keyup(function() {
        var replaceSpace = $(this).val(); 
        var result = replaceSpace.replace(/\s/g,'');
        $("#cardNo").val(result);
    });
    
    $("#btn-payment").on("click",function(){
    	
    	
    	$('#paymentForm').bootstrapValidator('validate');
		if($('#paymentForm').data('bootstrapValidator').isValid()){
			//do something
			var creditCaredNo = $('#cardNo').val();
 	 		 var expiryDate = $('#epMonth').val()+$('#epYear').val().substr(2, 2);
 	 		 var cardHolderName = $('#cardHolder').val();
	 		  $.ajax({
	 			  type : "POST",
	 			  cache:false, 
				  async:false, 
	 			  url : context+"/ajax/medical-insurance/putPaymentSession",
	 			  data : {creditCaredNo : creditCaredNo,
	 					  expiryDate: expiryDate,
	 					  cardHolderName: cardHolderName},
	 			  success : function(data) {
                     console.log($("#gateway").val());
                     if($("#gateway").val() != ""){
                    	 $("#paymentForm").attr('action', $("#gateway").val());
                    	 document.getElementById('paymentForm').submit();
                     }else {
                    	 showPaymentErrMsg();
                     }
                     //$("#paymentForm").attr('action', $("#gateway").val());
                     //document.getElementById('paymentForm').submit();
	 			  },
	 			  error:function(){
	 				 showPaymentErrMsg();
	 			      console.log('error');   
	 		      }
 		      });
		} 
	});
});

</script>

<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/common/fwd-payment.js"></script>

