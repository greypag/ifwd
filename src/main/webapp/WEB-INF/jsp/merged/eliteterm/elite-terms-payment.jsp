<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeQuoteBean"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate var="year" value="${now}" pattern="yyyy" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/styles.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/styles-et.css">
<script type="text/javascript">
var context = "${pageContext.request.contextPath}";
var paymentNextPageFlow = "${nextPageFlow}";
var languageP = "${language}";
</script>
		<%!
			boolean isSaleActiveClass = false;
			boolean isEservicesActiveClass = false;
		%>
		<div class="fwd-savie-wrapper fwd-et-wrapper">


			<!--<div class="fwd-container container-fluid breadcrumbs hidden-xs hidden-sm">
               <ol class="breadcrumb breadcrumbs-product-details et-breadcrumbs">
                  <li><a href="#"><fmt:message key="eliteTerms.breadcrumb.home" bundle="${msg}" /></a></li>
                  <li class="divider"><i class="fa fa-play"></i></li>
                  <li><a href="#"><fmt:message key="eliteTerms.breadcrumb.category" bundle="${msg}" /> </a></li>
                  <li class="divider"><i class="fa fa-play"></i></li>
                  <li><a href="#"><fmt:message key="eliteTerms.breadcrumb.product" bundle="${msg}" /> </a></li>
                  <li class="divider last"><i class="fa fa-play"></i></li>
                  <li class="active-bc" id="et-active-bc-menu"><fmt:message key="eliteTerms.breadcrumb.payment" bundle="${msg}" /></li>
               </ol>
            </div>-->
			
			<!--Elite Terms Header Info Widget-->        
			<div class="container-fluid fwd-full-container">
				<div class="application-page-header et-header-browse">
					<div class="clearfix reset-margin hidden-xs hidden-sm">
		                  <div class="reset-padding">
		                      <button type="button" class="et-header-info-btn et-bind-btn-header" id="select-plan" data-et-section-target="et-select-plan-section"><fmt:message key="eliteTerms.payment.Select.plan" bundle="${msg}" /></button>
		                  </div>
		                  <div class="reset-padding">
		                      <button type="button" class="et-header-info-btn et-bind-btn-header" id="application" data-et-section-target="et-application-section" ><fmt:message key="eliteTerms.payment.Application" bundle="${msg}" /></button>
		                  </div>
		                  <div class="reset-padding">
		                      <button type="button" class="et-header-info-btn et-bind-btn-header active no-hover" id="payment" data-et-section-target="et-dec-sign-section"><fmt:message key="eliteTerms.payment.Payment" bundle="${msg}" /></button>
		                  </div>
		                  <div class="reset-padding">
		                      <button type="button" class="et-header-info-btn no-hover" id="summary" data-toggle="modal" data-target="#summary-modal"><fmt:message key="eliteTerms.payment.Upload.document" bundle="${msg}" /></button>
		                  </div>
		                  <div class="reset-padding">
		                      <button type="button" class="et-header-info-btn et-bind-btn-header no-hover" id="confirmation" data-et-section-target="et-confirmation-section"><fmt:message key="eliteTerms.payment.Confirmation" bundle="${msg}" /></button>
		                  </div>
		              </div>
					<div class="et-mobile-header-info hidden-md hidden-lg">
						<div class="clearfix">
							<div class="et-back-arrow">
								<a href="#" class="et-back-arrow-link">
									<span class="icon-arrow-left2 arrow-left"></span>
								</a>
							</div>
							<div class="et-header-tex">
								<h3 id="et-active-section-label"><fmt:message key="eliteTerms.payment.Payment" bundle="${msg}" /> </h3>
							</div>
						</div>
						
					</div>
				</div>
			</div>
			

			<div class="application-flux">
		         <div class="fwd-container container-fluid breadcrumbs hidden-xs hidden-sm">
		            <ol class="breadcrumb breadcrumbs-product-details et-breadcrumbs">
		               <li><fmt:message key="home.breadcrumb1.item1" bundle="${msg}" /></li>
		               <li class="divider"><i class="fa fa-play"></i></li>
		               <li><fmt:message key="home.breadcrumb1.type1" bundle="${msg}" /> </li>
		               <li class="divider"><i class="fa fa-play"></i></li>
		               <li><fmt:message key="home.breadcrumb1.term" bundle="${msg}" /></li>
		               <li class="divider last"><i class="fa fa-play"></i></li>
		               <li class="active-bc" id="et-active-bc-menu"><fmt:message key="home.breadcrumb2.term.item2" bundle="${msg}" /></li>
		            </ol>
		         </div>			        
				<div class="container-fluid fwd-container">
					<div class="et-payment page-application">
						<div class="page-header text-center">
							<h2 class="page-header-title hidden-xs hidden-sm"><span class="hidden-md hidden-lg"><fmt:message key="eliteTerms.payment.Payment.details" bundle="${msg}" /></span> <span class="hidden"><fmt:message key="eliteTerms.payment.Your.summary" bundle="${msg}" /></span></h2>
							<p class="page-header-motto"><span><fmt:message key="eliteTerms.payment.We.will.now" bundle="${msg}" /></span> <span><fmt:message key="eliteTerms.payment.premium.as.deposit" bundle="${msg}" /></span></p>
							<p class="page-header-motto"><fmt:message key="eliteTerms.payment.Your.1-month" bundle="${msg}" />${eliteTermPremium.monthlyDuePremium}</p>	
							<p class="amount-holder">
								<span class="total-amount"><fmt:message key="eliteTerms.payment.Total.amount.part1" bundle="${msg}" /></span>
								<span class="amount">${eliteTermPremium.monthlyDuePremium*2}</span>
								<span class=""><fmt:message key="eliteTerms.payment.Total.amount.part2" bundle="${msg}" /></span>
							</p>
						</div>	
						<div class="page-content clearfix">
							<form name="paymentForm" id="paymentForm" method="post">
								<h2 class="hidden-xs hidden-sm"><fmt:message key="eliteTerms.payment.Payment.details" bundle="${msg}" /></h2>
								<div class="card-inputs clearfix">
									<div class="page-content-item">
										<label for="cards"><fmt:message key="eliteTerms.payment.Card.type" bundle="${msg}" /></label>
										<div class="card-image-holder" id="cards">
										    <img src="<%=request.getContextPath()%>/resources/images/elite-terms/mastercard-logo.png">
											<img src="<%=request.getContextPath()%>/resources/images/elite-terms/visa-logo.png">
										</div>
									</div>

									<div class="page-content-item">
										<label for="card-num"><fmt:message key="eliteTerms.payment.Credit.card.number" bundle="${msg}" /></label>
										<input id="card-num" tabindex="1" type="tel" class="form-control gray-textbox desktop-half"   autocomplete="off" onkeypress="return isNumeric(event);" onblur="validatecardnumber($('#cardNo').val());">
										<span id="errcardno" class="error-msg"></span>
										<input type="hidden" id="cardNo" name="cardNo" maxlength="16" data-min="16">
					                    <input type="hidden" name="merchantId" value="${eliteTermPolicy.merchantId}">
					                    <input type="hidden" name="secureHash" value="${eliteTermPolicy.secureHash }">
					                    <input type="hidden" name="amount" value="<fmt:formatNumber value='${eliteTermPremium.monthlyDuePremium*2}' pattern="#.00"/>">
					                    <input type="hidden" name="orderRef" value="${eliteTermPolicy.transactionNumber }">
					                    <input type="hidden" name="currCode" value="344">
					                    <input type="hidden" name="successUrl" value="${successUrl}">
					                    <input type="hidden" name="failUrl" value="${failurePath }">
					                    <input type="hidden" name="cancelUrl" value="${failurePath }">
					                    <input type="hidden" name="payType" value="N">
					                    <input type="hidden" name="lang" value="C">
					                    <input type="hidden" name="remark" value="">
					                    <input type="hidden" name="pMethod" id="pMethod" value="Master">
					                    <input type="hidden" id="emailAddress" name="emailAddress" value="${eliteTermEmail}"> 
					                    <input type="hidden" id="appFirstName" value="${etPolicyApplication.applicant.firstName}"> 
					                    <input type="hidden" id="appLastName" value="${etPolicyApplication.applicant.lastName}"> 
					                    
									    <input type="hidden" name="referenceNo" value="${eliteTermPolicy.policyNo}">
									    <input type="hidden" id="gateway" name="gateway" value="${eliteTermPolicy.paymentGateway}"/>
									</div>
									<div class="page-content-item">
										<label for="card-num"><fmt:message key="eliteTerms.payment.Expiry.date" bundle="${msg}" /></label>
										<div class="clearfix desktop-half">
											<div class="selectDiv month">
												<select name="epMonth" tabindex="2" id="month" class="form-control gray-dropdown" onBlur="chkValidCreditCardExpDate(this, 'erryear', 'month', 'errmonth');">
													<option value="0" selected disabled><fmt:message key="home.summary.pmtdetail.desc3.month" bundle="${msg}" /></option>
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
											</div>
											<div class="selectDiv">
												<select name="epYear" tabindex="3" id="year" class="form-control gray-dropdown" onBlur="chkValidCreditCardExpDate(this, 'erryear', '', '');">
													<option value="0" selected disabled><fmt:message key="home.summary.pmtdetail.desc3.year" bundle="${msg}" /></option>
				                                    <c:forEach begin="0" end="10" varStatus="loop">
				                                        <c:set var="currentYear" value="${year + loop.index}" />
				                                        <option value="${currentYear}">${currentYear}</option>
				                                    </c:forEach>
												</select>
											</div>
										</div>
										<span id="errmonth" class="error-msg"></span>
										<span id="erryear" class="error-msg"></span>
									</div>
									<div class="page-content-item">
										<label for="card-name"><fmt:message key="eliteTerms.payment.Name.on.credit.card" bundle="${msg}" /></label>
										<input type="text" tabindex="4" class="form-control gray-textbox desktop-half"  value="" id="card-name" autocomplete="off" name="cardHolder" onblur="replaceAlphaEx2(this); chkNotNullCreditCareNameEx2(this, 'errname');">
									    <span id="errname" class="error-msg"></span>
									</div>
									<div class="page-content-item">
										<label for="card-name"><fmt:message key="eliteTerms.payment.Security.code" bundle="${msg}" /></label>
										<div class="clearfix desktop-half">
											<input type="password" tabindex="5" class="form-control gray-textbox card-cvv"  id="card-cvv" autocomplete="off" maxlength="3"  name="securityCode" onkeypress="return isNumeric(event);" onblur="chkNotNullCardCvv(this, 'errcode');">
											<div class="cvv-image-holder">
												<img src="<%=request.getContextPath()%>/resources/images/elite-terms/cvv-logo.png" class="cvv-image">
											</div>
										</div>
										<span id="errcode" class="error-msg"></span>
									</div>
								</div>
								<div class="page-content-item">
									<div class="fwd-checkbox">
										<input type="checkbox" tabindex="6" id="personal-information-statement">
										<label for="personal-information-statement"></label>
										<p class="notice"><span class="hidden-md hidden-lg"><fmt:message key="eliteTerms.payment.I.hereby.authorize" bundle="${msg}" /></span>
										<span class="hidden-xs hidden-sm"><fmt:message key="eliteTerms.payment.I.hereby.authorize" bundle="${msg}" /></span>
										</p>
									</div>
									<span id="errchk1" class="error-msg"></span>
								</div>

								<div class="button-holder hidden-md hidden-lg clearfix">
									<button type="button" class="btn next et-payment-button-back hidden-xs hidden-sm"><fmt:message key="eliteTerms.payment.Back" bundle="${msg}" /></button>
									<button type="button" class="btn next et-payment-button-confirm" onclick="confirmTermPayment();"><fmt:message key="eliteTerms.payment.Complete" bundle="${msg}" /></button>
								</div>
								<div class="payment-confirm-error line hidden-xs hidden-sm"></div>
							</form>

							<div class="line hidden-md hidden-lg"></div>

							<div class="credit-cards-definition clearfix">
								<div class="card-item clearfix">
									<div class="text-center">
										<img src="<%=request.getContextPath()%>/resources/images/elite-terms/paydollar-icon.png">
									</div>
									<p><fmt:message key="eliteTerms.payment.We.adopt.PayDollar" bundle="${msg}" /></p>
								</div>
								<div class="card-item clearfix">
									<div class="text-center">
										<img src="<%=request.getContextPath()%>/resources/images/elite-terms/verifiedbyvisa-icon.png">
									</div>
									<p><fmt:message key="eliteTerms.payment.Verified.by.Visa" bundle="${msg}" /></p>
								</div>
								<div class="card-item last clearfix">
									<div class="text-center">
										<img src="<%=request.getContextPath()%>/resources/images/elite-terms/mastercard-icon.png">
									</div>
									<p><fmt:message key="eliteTerms.payment.Get.an.extra" bundle="${msg}" /></p>
								</div>
							</div>
						</div>

						<div class="text-center complete-holder hidden-sm hidden-xs">
							<button type="button" class="btn next et-payment-button-confirm" onclick="confirmTermPayment();"><fmt:message key="eliteTerms.payment.Complete" bundle="${msg}" /></button>
							<div class="payment-confirm-error line"></div>
						</div>
					</div>
				</div>
			</div>
			
			<!-- FOOTER -->
			
		</div>
		<div id="PaymentingDiv" class="waitingDiv" style="display: none; margin-left:auto; margin-right:auto;">
		    <img
		        style="width: 300px; height: 300px;"
		        src="<%=request.getContextPath()%>/resources/images/ajax-loader2.gif">
		</div>
		<!-- JS INCLUDES -->
		
		<!-- <script src="assets/js/fwd-dropzone.js"></script> -->
		<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/elite-term/elite-term.js"></script>
      <script type="text/javascript">
      
	      $("#personal-information-statement").focus(function() {
	    	  $('#personal-information-statement').next('label').addClass('tabbed');
	      });
	      
	      $("#personal-information-statement").focusout(function() {
	    	  $('#personal-information-statement').next('label').removeClass('tabbed');
	      });
      
         $(document).on('click', '.et-header-info-btn', function(e) {
            e.preventDefault();
            
            var url = 'select-plan';
            var $self = $(this);
            
            if ($self.attr('id') === 'select-plan') {
               url += '#select-plan';
               window.location.href = url;
            } else if ($self.attr('id') === 'application') {
               url += '#application';
               window.location.href = url;
            }
         });
         
         // change language
         var isChangingLang;
			$(function(){
			    $("#anchor-lang").on("click", function() {
				 	isChangingLang = true;
			    });
			});
			
			function goodbye(e) {
			    if (!isChangingLang) { 
			        return; 
			    }
			    isChangingLang = false;
			    return 'Are you leaving the page';
			}
			window.onbeforeunload = goodbye;

      </script>
      
      <script>
	  var pay = false;
 	  var enablePayment=true;
      var clicked = false;
 	  function confirmTermPayment() {
 		 
 		 ga('create', 'UA-60032236-1', 'auto');
 		 ga('send', 'pageview', '/${language}/term-life-insurance/payment'); 
 		 
 		  if(payFormValid() && enablePayment){
              enablePayment=false;
              $("#PaymentingDiv").show();
	 		  if (clicked === false) {
	 			 var creditCaredNo = $('#card-num').val();
	 	 		 var expiryDate = $('#month').val()+$('#year').val().substr(2, 2);
	 	 		 var cardHolderName = $('#card-name').val();
		 		  clicked = true;
		 		  $.ajax({
		 			  type : "POST",
		 			  url : "<%=request.getContextPath()%>/ajax/eliteTerm/putEtPaymentSession",
		 			  data : {creditCaredNo : creditCaredNo,
		 					  expiryDate: expiryDate,
		 					  cardHolderName: cardHolderName},
		 			  success : function(data) {
			 			  clicked = false;
			 			  setTimeout(function(){
					   		  console.log($("#gateway").val());
		                      $("#paymentForm").attr('action', $("#gateway").val());
		                      $("#paymentForm").submit();
	                      }, 3000);
		 			  },
		 			  error:function(){
		 			      console.log('error');   
		 		      }
	 		      });
	 			  return true;
	 		  }else{
	              $("#PaymentingDiv").hide();
	              enablePayment=true;
	              return false;
	          }
 		  }
 	  }
 	  
 	 function payFormValid(){
 		var flag=true;
 		var cardNum = $('#card-num').val();
 		var month = $('#month').val();
 		var year = $('#year').val();
		var cardName = $('#card-name').val(); 
		var cardCvv = $('#card-cvv').val(); 
		var gateway = $("#gateway").val();
		
		if( document.getElementById('errcardno') ) document.getElementById('errcardno').innerHTML="";
 		if( document.getElementById('errmonth') ) document.getElementById('errmonth').innerHTML="";
 		if( document.getElementById('erryear') ) document.getElementById('erryear').innerHTML="";
 		if( document.getElementById('errname') ) document.getElementById('errname').innerHTML="";
 		if( document.getElementById('errcode') ) document.getElementById('errcode').innerHTML="";
 		if( document.getElementById('errchk1') ) document.getElementById('errchk1').innerHTML="";
 		
 		var firstErrorElementId="";
		
 		if(cardNum.length<16){
 			flag=false;
 			$('#errcardno').html(getBundle(getBundleLanguage, "payment.creditCard.number.notValid.message"));
 			$("#card-num").addClass("invalid-field");
 			if(firstErrorElementId==""){
 				firstErrorElementId="card-num";
 			}
 		}
 		else if(!isCreditCard(cardNum.replace(/\s+/g,""))){
 			flag=false;
 			$('#errcardno').html(getBundle(getBundleLanguage, "applicant.creditcard.notValid.message"));
 			$("#card-num").addClass("invalid-field");
 			if(firstErrorElementId==""){
 				firstErrorElementId="card-num";
 			}
 		}
 		if(!validateCardNumber(cardNum.replace(/\s+/g,""))){
 			flag=false;
 			$('#errcardno').html(getBundle(getBundleLanguage, "applicant.creditcard.notNull.message"));
 			$("#card-num").addClass("invalid-field");
 			if(firstErrorElementId==""){
 				firstErrorElementId="card-num";
 			}
 		} 		
 		else{
 			$("#card-num").removeClass("invalid-field");
 		}
 		if(month==null || month=="" || month== 0){
 			flag=false;
 			$('#errmonth').html(getBundle(getBundleLanguage, "payment.creditCard.expiryDate.month.notValid.message"));
 			$("#month").addClass("invalid-field");
 			if(firstErrorElementId==""){
 				firstErrorElementId="month";
 			}
 		}
 		else{
 			$("#month").removeClass("invalid-field");
 		}
 		if(year==null || year=="" || year == 0){
 			flag=false;
 			$('#erryear').html(getBundle(getBundleLanguage, "payment.creditCard.expiryDate.year.notValid.message"));
 			$("#year").addClass("invalid-field");
 			if(firstErrorElementId==""){
 				firstErrorElementId="year";
 			}
 		}
 		else{
 			$("#year").removeClass("invalid-field");
 		}
 		if(cardName.trim()==""){
 			flag=false;
 			$('#errname').html(getBundle(getBundleLanguage, "payment.creditCard.name.notValid.message"));
 			$("#card-name").addClass("invalid-field");
 			if(firstErrorElementId==""){
 				firstErrorElementId="card-name";
 			}
 		}
 		else if(!validateCardHolder()){
 			flag=false;
 			$('#errname').html(getBundle(getBundleLanguage, "form.payment.cardholder.name.unmatch"));
 			$("#card-name").addClass("invalid-field");
 			if(firstErrorElementId==""){
 				firstErrorElementId="card-name";
 			}
 		}
 		else{
 			$("#card-name").removeClass("invalid-field");
 		}
 		if(cardCvv.trim()==""){
 			flag=false;
 			$('#errcode').html(getBundle(getBundleLanguage, "payment.creditCard.securityCode.notNull.message"));
 			$("#card-cvv").addClass("invalid-field");
 			if(firstErrorElementId==""){
 				firstErrorElementId="card-cvv";
 			}
 		}
 		else if(cardCvv.trim() != "" && cardCvv.length <3){
 			flag=false;
 			$('#errcode').html(getBundle(getBundleLanguage, "payment.creditCard.securityCode.notValid.message"));
 			$("#card-cvv").addClass("invalid-field");
 			if(firstErrorElementId==""){
 				firstErrorElementId="card-cvv";
 			}
 		}
 		else{
 			$("#card-cvv").removeClass("invalid-field");
 		}
 		if(gateway.trim()==""){
 			flag=false;
 			console.log("gateway error");
 		}
 		if (!$('#personal-information-statement').is(':checked')){
 			flag = false;
 			$('#errchk1').html(getBundle(getBundleLanguage, "payment.tnc.notChecked.message"));
 			if(firstErrorElementId==""){
 				firstErrorElementId="personal-information-statement";
 			}
 		}
 		if(firstErrorElementId!=""){
 			scrollToElement(firstErrorElementId);
 		}
 		console.log(flag);
 		return flag;
 	}

 	function validateCardNumber(cardNum) {
 		// See if the card is valid
 		// The regex will capture the number in one of the capturing groups
 		var match = /^(?:(4[0-9]{12}(?:[0-9]{3})?)|(5[1-5][0-9]{14}))$/.exec(cardNum);
 		
 		if (match) {
 			// List of card types, in the same order as the regex capturing groups
 			var types = ['Unknown', 'VISA', 'Master'];
 			// Find the capturing group that matched
 			// Skip the zeroth element of the match array (the overall match)
 			for (var i = 1; i < match.length; i++) {
 				if (match[i]) {
 					// Display the card type for that group
				 	$('#pMethod').val(types[i]);
 					break;
 				}
 			}
 		} else {
 			return false;
 		}
 		return true;
 	}

    	
 	//function copyCardNo(){
 	//	$('#cardNo').val($('#card-num').val().replace(/\s+/g,""));
 	//	if($('#card-num').val().substring(0,1) == "5"){
 	//		$('#pMethod').val("Master");
 	//	}
 	//	else if($('#card-num').val().substring(0,1) == "4"){
 	//		$('#pMethod').val("VISA");
 	//	}
 	//	else{
 	//		$('#pMethod').val("Master");
 	//	}
 	//}
 	  
	function BackMe() {
		window.history.back();
	}

	function validateCardHolder(){
		
		var firstName= $('#paymentForm #appFirstName').val().trim().split(',')[0].toUpperCase();
		var lastName= $('#paymentForm #appLastName').val().trim().toUpperCase();
		var firstNameSub = firstName.split(' ');
		var shortNameSub = firstName.split(' ').map(function(name){ return name.substring(0,1).trim() + '.';});

		if ( firstName.trim() == '' || lastName.trim() == '' ) {
		 return false;
		}

		/* Build List */
		var whiteList = [];
		var ignoreList = [];
		var minWords = (firstNameSub.length==1)?1:2;
		for( var i=minWords; i<=firstNameSub.length; i++ ){
			var a1 = firstNameSub.slice(0, i).reduce(function(pV, cV, i){ return pV + ' ' + cV; }, []).trim();
			var a2 = firstNameSub.slice(0, i).reduce(function(pV, cV, i){ return pV + cV; }, []).trim();
		 	var b1 = shortNameSub.slice(0, i).reduce(function(pV, cV, i){ return pV + ' ' + cV; }, []).trim();
		 	var b2 = shortNameSub.slice(0, i).reduce(function(pV, cV, i){ return pV + cV; }, []).trim();
		 	whiteList.push(lastName + ' ' + a1);
		 	whiteList.push(lastName + ' ' + a2);
		 	whiteList.push(lastName + ' ' + b1);
		 	whiteList.push(lastName + ' ' + b2);
		 	whiteList.push(a1 + ' ' + lastName);
		 	whiteList.push(a2 + ' ' + lastName);
		 	whiteList.push(b1 + ' ' + lastName);
		 	whiteList.push(b2 + ' ' + lastName);
		}

		var cardHolderName = $('#paymentForm input[name="cardHolder"]').val().trim().toUpperCase();
		for( var i=0; i< whiteList.length; i++ ){
			if( cardHolderName.indexOf(whiteList[i])>-1 ) {
				return true; 
			}
		}
		return false;
	}

	$(document).ready(function(){
        $('#card-num').payment('formatCardNumber');
        $('#card-num').keyup(function() {
            var replaceSpace = $(this).val(); 
            var result = replaceSpace.replace(/\s/g,'');
            $("#cardNo").val(result);
        }); 

    })
</script>
