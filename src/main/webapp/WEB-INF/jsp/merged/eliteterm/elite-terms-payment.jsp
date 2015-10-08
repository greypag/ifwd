<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeQuoteBean"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/styles.css">
		<%!
			boolean isSaleActiveClass = false;
			boolean isEservicesActiveClass = false;
		%>
		<div class="fwd-savie-wrapper">


			<div class="fwd-container container-fluid breadcrumbs hidden-xs hidden-sm">
               <ol class="breadcrumb breadcrumbs-product-details et-breadcrumbs">
                  <li><a href="#"><fmt:message key="eliteTerms.payment.Home" bundle="${msg}" /></a></li>
                  <li class="divider"><i class="fa fa-play"></i></li>
                  <li><a href="#"><fmt:message key="eliteTerms.payment.Protection" bundle="${msg}" /> </a></li>
                  <li class="divider"><i class="fa fa-play"></i></li>
                  <li><a href="#"><fmt:message key="eliteTerms.payment.Elite.term" bundle="${msg}" /> </a></li>
                  <li class="divider last"><i class="fa fa-play"></i></li>
                  <li class="active-bc" id="et-active-bc-menu"><fmt:message key="eliteTerms.payment.Payment" bundle="${msg}" /></li>
               </ol>
            </div>
			
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
				<div class="container-fluid fwd-container">
					<div class="et-payment page-application">
						<div class="page-header text-center">
							<h2 class="page-header-title hidden-xs hidden-sm"><span class="hidden-md hidden-lg"><fmt:message key="eliteTerms.payment.Payment.details" bundle="${msg}" /></span> <span class="hidden"><fmt:message key="eliteTerms.payment.Your.summary" bundle="${msg}" /></span></h2>
							<p class="page-header-motto"><span><fmt:message key="eliteTerms.payment.We.will.now" bundle="${msg}" /></span> <span><fmt:message key="eliteTerms.payment.premium.as.deposit" bundle="${msg}" /></span></p>
							<p class="page-header-motto"><fmt:message key="eliteTerms.payment.Your.1-month" bundle="${msg}" /></p>	
							<p class="amount-holder">
								<span class="total-amount"><fmt:message key="eliteTerms.payment.Total.amount" bundle="${msg}" /></span>
								<span class="amount">HKD 1000</span>
							</p>
						</div>	
						<div class="page-content clearfix">
							<form>
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
										<input type="text" class="form-control gray-textbox desktop-half" placeholder="Credit card number" id="card-num" data-mask="9999 9999 9999 9999" name="card-num">
									</div>
									<div class="page-content-item">
										<label for="card-num"><fmt:message key="eliteTerms.payment.Expiry.date" bundle="${msg}" /></label>
										<div class="clearfix desktop-half">
											<div class="selectDiv month">
												<select name="month" id="month" class="form-control gray-dropdown">
													<option value="" disabled selected><fmt:message key="eliteTerms.payment.Month" bundle="${msg}" /></option>
													<option value=""><fmt:message key="eliteTerms.payment.January" bundle="${msg}" /></option>
													<option value=""><fmt:message key="eliteTerms.payment.February" bundle="${msg}" /></option>
													<option value=""><fmt:message key="eliteTerms.payment.March" bundle="${msg}" /></option>
													<option value=""><fmt:message key="eliteTerms.payment.April" bundle="${msg}" /></option>
													<option value=""><fmt:message key="eliteTerms.payment.May" bundle="${msg}" /></option>
													<option value=""><fmt:message key="eliteTerms.payment.June" bundle="${msg}" /></option>
													<option value=""><fmt:message key="eliteTerms.payment.July" bundle="${msg}" /></option>
													<option value=""><fmt:message key="eliteTerms.payment.August" bundle="${msg}" /></option>
													<option value=""><fmt:message key="eliteTerms.payment.September" bundle="${msg}" /></option>
													<option value=""><fmt:message key="eliteTerms.payment.October" bundle="${msg}" /></option>
													<option value=""><fmt:message key="eliteTerms.payment.November" bundle="${msg}" /></option>
													<option value=""><fmt:message key="eliteTerms.payment.December" bundle="${msg}" /></option>
												</select>
											</div>
											<div class="selectDiv">
												<select name="year" id="year" class="form-control gray-dropdown">
													<option value="" disabled selected><fmt:message key="eliteTerms.payment.Year" bundle="${msg}" /></option>
													<option value=""><fmt:message key="eliteTerms.payment.Lorem" bundle="${msg}" /></option>
													<option value=""><fmt:message key="eliteTerms.payment.Ipsum" bundle="${msg}" /></option>
												</select>
											</div>
										</div>
									</div>
									<div class="page-content-item">
										<label for="card-name"><fmt:message key="eliteTerms.payment.Name.on.credit.card" bundle="${msg}" /></label>
										<input type="text" class="form-control gray-textbox desktop-half" placeholder="Name on credit card" value="" id="card-name" name="card-name">
									</div>
									<div class="page-content-item">
										<label for="card-name"><fmt:message key="eliteTerms.payment.Security.code" bundle="${msg}" /></label>
										<div class="clearfix desktop-half">
											<input type="text" class="form-control gray-textbox card-cvv" placeholder="CVV" id="card-cvv" name="card-cvv">
											<div class="cvv-image-holder">
												<img src="<%=request.getContextPath()%>/resources/images/elite-terms/cvv-logo.png" class="cvv-image">
											</div>
										</div>
									</div>
								</div>
								<div class="page-content-item">
									<div class="fwd-checkbox">
										<input type="checkbox" id="personal-information-statement">
										<label for="personal-information-statement"></label>
										<p class="notice"><span class="hidden-md hidden-lg"><fmt:message key="eliteTerms.payment.I.hereby.authorize" bundle="${msg}" /></span>
										<span class="hidden-xs hidden-sm"><fmt:message key="eliteTerms.payment.I.as.Policy.owner" bundle="${msg}" /></span>
										</p>
									</div>
								</div>

								<div class="button-holder hidden-md hidden-lg clearfix">
									<button type="button" class="btn next et-payment-button-back hidden-xs hidden-sm"><fmt:message key="eliteTerms.payment.Back" bundle="${msg}" /></button>
									<button type="button" class="btn next et-payment-button-confirm"><fmt:message key="eliteTerms.payment.Complete" bundle="${msg}" /></button>
								</div>
								<div class="line hidden-xs hidden-sm"></div>
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
							<button type="button" class="btn next "><fmt:message key="eliteTerms.payment.Complete" bundle="${msg}" /></button>
						</div>				
					</div>
				</div>
			</div>
			
			<!-- FOOTER -->
			
		</div>
		<!-- JS INCLUDES -->
		
		<!-- <script src="assets/js/fwd-dropzone.js"></script> -->
      <script type="text/javascript">
         $(document).on('click', '.et-header-info-btn', function(e) {
            e.preventDefault();
            
            var url = 'elite-terms-select-plan.jsp';
            var $self = $(this);
            
            if ($self.attr('id') === 'select-plan') {
               url += '#select-plan';
               window.location.href = url;
            } else if ($self.attr('id') === 'application') {
               url += '#application';
               window.location.href = url;
            }
         });
      </script>
