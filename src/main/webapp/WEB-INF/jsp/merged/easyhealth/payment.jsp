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
    <link href="<%=request.getContextPath()%>/resources/css/easy-health/mobiscroll.custom-2.17.1.min.css" rel="stylesheet" type="text/css" />
    <script src="<%=request.getContextPath()%>/resources/js/easy-health/mobiscroll.custom-2.17.1.min.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/resources/jsignature/jSignature.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/application.common.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/easy-health/easyhealth-app-uifn.js"></script>
    <div class="fwd-container container-fluid breadcrumbs">
        <div class="breadcrumb-container">
           <ol class="breadcrumb breadcrumbs-product-details et-breadcrumbs">
               <li><a href="https://uat-ecom.i.fwd.com.hk/fna/tc/savings-insurance/signature#">Home</a></li>
               <li class="divider"><i class="fa fa-play"></i></li>
               <li><a href="https://uat-ecom.i.fwd.com.hk/fna/tc/savings-insurance/signature#">Save</a></li>
               <li class="divider"><i class="fa fa-play"></i></li>
               <li><a href="https://uat-ecom.i.fwd.com.hk/fna/tc/savings-insurance/signature#">Life Insureance Plan</a></li>
               <li class="divider last"><i class="fa fa-play"></i></li>
               <li class="active-bc" id="et-active-bc-menu">Application</li>
           </ol>
        </div>
     </div>
     <div class="savie-online-container app-pg-ctnr" id="eh-app-payment">
     <div class="container-fluid fwd-full-container browse-holder">
        <div class="application-page-header et-header-browse">
           <div class="browse-container">
              <div class="row reset-margin hidden-xs hidden-sm">
                 <ul class="common-steps-list six-steps nav nav-pills">
                    <li class="step-number" id="first-step"><button type="button" class="et-header-info-btn completed-step"><i class="fa fa-check"></i>Select Plan</button></li>
                    <li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow"></li>
                    <li class="step-number"><button type="button" class="et-header-info-btn completed-step"><i class="fa fa-check"></i>Application, Summary &amp; Declaration</button></li>
                    <li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow"></li>
                    <li class="step-number" id="last-steps"><button type="button" class="et-header-info-btn completed-step"><i class="fa fa-check"></i>Signature</button></li>
                    <li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow"></li>
                    <li class="step-number" id="last-steps"><button type="button" class="et-header-info-btn active"><span class="status">4</span>Payment</button></li>
                    <li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow"></li>
                    <li class="step-number" id="last-steps"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">5</span>Document Upload</button></li>
                    <li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow"></li>
                    <li class="step-number"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">6</span>Confirmation</button></li>
                 </ul>
             </div>
           </div>  
           <div class="et-mobile-header-info hidden-md hidden-lg">
              <div class="clearfix">
                 <div class="et-back-arrow">
                    <a href="https://uat-ecom.i.fwd.com.hk/fna/tc/savings-insurance/signature#" class="back-arrow-link">
                       <span class="icon-arrow-left2 arrow-left"></span>
                    </a>
                 </div>
                 <div class="et-header-tex">
                    <h3 id="">簽署</h3>
                 </div>
              </div>
              <span id="step-of">4 out of 5</span>
           </div>
        </div>
     </div>
	
	<!-- Application Content Start -->
	<div class="app-pg-cont">
	    <form name="paymentForm" id="paymentForm" method="post">
		<input type="hidden" id="cardNo" name="cardNo" maxlength="16" data-min="16">
        <input type="hidden" name="merchantId" value="${lifePolicy.merchantId}">
        <input type="hidden" name="secureHash" value="${lifePolicy.secureHash }">
        <input type="hidden" name="amount" value="345.00" />
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
        <input type="hidden" id="appFirstName" value="testing"> 
        <input type="hidden" id="appLastName" value="card"> 
		<input type="hidden" name="referenceNo" value="${lifePolicy.policyNo}">
		<input type="hidden" id="gateway" name="gateway" value="${lifePolicy.paymentGateway}"/>
		
		<div class="container-fluid">
			<div class="row">
				<div class="col-xs-12 col-md-12">
                    <h3 class="heading-title">Payment details</h3>
                     <p>We will now charge the first 2 months' premium upfront<br>Monthly premium: HK$143.10<br>Total Amount: HK$ xxx (2 months)</p>

                     <div class="row inner-row">
                         <div class="col-xs-12 col-md-6">
                         	<div class="form-group">
	                         	<div class="fld-wrapper">
									<p class="fld-label">Amount</p>
									<p class="fld-val">HK$ 345</p>
								</div>
							</div>
							<div class="form-group">
								<div class="fld-wrapper">
									<p class="fld-label">Card Type</p>
									<p class="fld-val cardtype"><span class="visa">Visa</span>&nbsp;/&nbsp;<span class="mastercard">Master</span></p>
								</div>
							</div>
							<div class="form-group">
								<div class="fld-wrapper">
		                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
										<input class="mdl-textfield__input" type="tel" id="ccNumber" name="ccNumber" data-keycheck-numOnly="true" maxlength="19">
										<label class="mdl-textfield__label" for="ccNumber">Credit card Number</label>
									</div>
									
								</div>
								<span class="error-msg" id="ccNumberErrMsg"></span>
							</div>
						</div>
						<div class="col-xs-12 col-md-6">
							<div class="form-group">
								<div class="fld-wrapper">
									<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
										<input class="mdl-textfield__input" type="text" id="cardHolder" name="cardHolder">
										<label class="mdl-textfield__label" for="cardHolder">Name on credit card</label>
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
												<label class="mdl-textfield__label" for="epMonth">Expiry Month</label>
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
												<label class="mdl-textfield__label" for="epYear">Expiry Year</label>

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
												<input class="mdl-textfield__input" type="tel" id="securityCode" name="securityCode" data-keycheck-numOnly="true" maxlength="3">
												<label class="mdl-textfield__label" for="securityCode">Security Code</label>
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
                <div class="col-xs-12">
                	<div class="form-group cbTNC-wrapper">
	    				<div class="checkbox">
							<input type="checkbox" name="cbTNC" id="cbTNC" value=""><label for="cbTNC">I confirm that I am the policy owner and holder of the above credit card. I hereby authorize FWD Life Insurance Company (Bermuda) Limited ("FWD") to debit my Credit Card Account for the premium of this insurance. I further acknowledge and agree that this insurance policy will be automatically renewed and any subsequent renewal premium will be debited from my Credit Card Account specified above until my prior written instruction for cancellation.</label>
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
		                		<p>We adopt PayDollar Payment Gateway, a leading, secure, reliable international payment service provider to banks and online merchants.</p>
		                	</div>
		                </div>
		                <div class="col-xs-12 col-md-4">
		                	<div class="text-center">
		                		<div class="ico-wrapper">
			                		<img src="<%=request.getContextPath()%>/resources/images/elite-terms/verifiedbyvisa-icon.png" alt="">
			                	</div>
		                		<p>Verified by Visa (VbV) is a program designed to help make shopping online more secure.</p>
		                	</div>
		                </div>
		                <div class="col-xs-12 col-md-4">
		                	<div class="text-center">
		                		<div class="ico-wrapper">
		                			<img src="<%=request.getContextPath()%>/resources/images/elite-terms/mastercard-icon.png" alt="">
		                		</div>
		                		<p>Get an extra layer of online shopping security with MasterCard SecureCode - a private, secure code that protects your purchases.</p>
		                	</div>
		                </div>
	                </div>

                </div>
                
                <div class="col-xs-12">
                	<div class="text-center btn-row">
                        <a href="javascript:void(0);" class="text-bold btn btn-confirm btn-app" id="btn-payment">Proceed to Upload Document</a><br>
                        <!-- <a href="javascript:void(0);" class="link-text">Save and continue later</a> -->
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
    $('#ccNumber').keyup(function() {
        var replaceSpace = $(this).val(); 
        var result = replaceSpace.replace(/\s/g,'');
        $("#cardNo").val(result);
    });
    
    $("#btn-payment").on("click",function(){
    	$('#paymentForm').bootstrapValidator('validate');
		if($('#paymentForm').data('bootstrapValidator').isValid()){
			//do something
			var creditCaredNo = $('#securityCode').val();
 	 		 var expiryDate = $('#epMonth').val()+$('#epYear').val().substr(2, 2);
 	 		 var cardHolderName = $('#cardHolder').val();
	 		  $.ajax({
	 			  type : "POST",
	 			  cache:false, 
				  async:false, 
	 			  url : context+"/ajax/eliteTerm/putEtPaymentSession",
	 			  data : {creditCaredNo : creditCaredNo,
	 					  expiryDate: expiryDate,
	 					  cardHolderName: cardHolderName},
	 			  success : function(data) {
                     console.log($("#gateway").val());
                     $("#paymentForm").attr('action', $("#gateway").val());
                     //$("#paymentForm").submit();
                     document.getElementById('paymentForm').submit();
	 			  },
	 			  error:function(){
	 			      console.log('error');   
	 		      }
 		      });
		}
	});
});

</script>

