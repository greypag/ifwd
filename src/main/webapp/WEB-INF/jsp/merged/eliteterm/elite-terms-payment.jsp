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
                  <li><a href="#">Home</a></li>
                  <li class="divider"><i class="fa fa-play"></i></li>
                  <li><a href="#">Protection </a></li>
                  <li class="divider"><i class="fa fa-play"></i></li>
                  <li><a href="#">Elite term </a></li>
                  <li class="divider last"><i class="fa fa-play"></i></li>
                  <li class="active-bc" id="et-active-bc-menu">Payment</li>
               </ol>
            </div>
			
			<!--Elite Terms Header Info Widget-->        
			<div class="container-fluid fwd-full-container">
				<div class="application-page-header et-header-browse">
					<div class="clearfix reset-margin hidden-xs hidden-sm">
		                  <div class="reset-padding">
		                      <button type="button" class="et-header-info-btn et-bind-btn-header" id="select-plan" data-et-section-target="et-select-plan-section">Select plan</button>
		                  </div>
		                  <div class="reset-padding">
		                      <button type="button" class="et-header-info-btn et-bind-btn-header" id="application" data-et-section-target="et-application-section" >Application</button>
		                  </div>
		                  <div class="reset-padding">
		                      <button type="button" class="et-header-info-btn et-bind-btn-header active no-hover" id="payment" data-et-section-target="et-dec-sign-section">Payment</button>
		                  </div>
		                  <div class="reset-padding">
		                      <button type="button" class="et-header-info-btn no-hover" id="summary" data-toggle="modal" data-target="#summary-modal">Upload document</button>
		                  </div>
		                  <div class="reset-padding">
		                      <button type="button" class="et-header-info-btn et-bind-btn-header no-hover" id="confirmation" data-et-section-target="et-confirmation-section">Confirmation</button>
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
								<h3 id="et-active-section-label">Payment </h3>
							</div>
						</div>
						
					</div>
				</div>
			</div>
			

			<div class="application-flux">        
				<div class="container-fluid fwd-container">
					<div class="et-payment page-application">
						<div class="page-header text-center">
							<h2 class="page-header-title hidden-xs hidden-sm"><span class="hidden-md hidden-lg">Payment details</span> <span class="hidden">Your summary & payment</span></h2>
							<p class="page-header-motto"><span>We will now collect upfront a 2-month</span> <span>premium as deposit</span></p>
							<p class="page-header-motto">Your 1-month premium: HKD 500.</p>	
							<p class="amount-holder">
								<span class="total-amount">Total amount: </span>
								<span class="amount">HKD 1000</span>
							</p>
						</div>	
						<div class="page-content clearfix">
							<form>
								<h2 class="hidden-xs hidden-sm">Payment details</h2>
								<div class="card-inputs clearfix">
									<div class="page-content-item">
										<label for="cards">Card type</label>
										<div class="card-image-holder" id="cards">
										    <img src="<%=request.getContextPath()%>/resources/images/elite-terms/mastercard-logo.png">
											<img src="<%=request.getContextPath()%>/resources/images/elite-terms/visa-logo.png">
										</div>
									</div>

									<div class="page-content-item">
										<label for="card-num">Credit card number</label>
										<input type="text" class="form-control gray-textbox desktop-half" placeholder="Credit card number" id="card-num" data-mask="9999 9999 9999 9999" name="card-num">
									</div>
									<div class="page-content-item">
										<label for="card-num">Expiry date</label>
										<div class="clearfix desktop-half">
											<div class="selectDiv month">
												<select name="month" id="month" class="form-control gray-dropdown">
													<option value="" disabled selected>Month</option>
													<option value="">January</option>
													<option value="">February</option>
													<option value="">March</option>
													<option value="">April</option>
													<option value="">May</option>
													<option value="">June</option>
													<option value="">July</option>
													<option value="">August</option>
													<option value="">September</option>
													<option value="">October</option>
													<option value="">November</option>
													<option value="">December</option>
												</select>
											</div>
											<div class="selectDiv">
												<select name="year" id="year" class="form-control gray-dropdown">
													<option value="" disabled selected>Year</option>
													<option value="">Lorem</option>
													<option value="">Ipsum</option>
												</select>
											</div>
										</div>
									</div>
									<div class="page-content-item">
										<label for="card-name">Name on credit card</label>
										<input type="text" class="form-control gray-textbox desktop-half" placeholder="Name on credit card" value="" id="card-name" name="card-name">
									</div>
									<div class="page-content-item">
										<label for="card-name">Security code</label>
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
										<p class="notice"><span class="hidden-md hidden-lg">I hereby authorize FWD General Insurance Company Limited to debit my Credit Card Account for the premium of this insurance.</span>
										<span class="hidden-xs hidden-sm">I, as Policy owner, confirm that I am not acting on behalf of any other person, that the above payment is made on my own behalf, and that I authorize FWD life insurance Company (Bermuda) Limited, until further written notice, to debit the account listed above to pay the insurance premium.</span>
										</p>
									</div>
								</div>

								<div class="button-holder hidden-md hidden-lg clearfix">
									<button type="button" class="btn next et-payment-button-back hidden-xs hidden-sm">Back</button>
									<button type="button" class="btn next et-payment-button-confirm">Complete</button>
								</div>
								<div class="line hidden-xs hidden-sm"></div>
							</form>

							<div class="line hidden-md hidden-lg"></div>

							<div class="credit-cards-definition clearfix">
								<div class="card-item clearfix">
									<div class="text-center">
										<img src="<%=request.getContextPath()%>/resources/images/elite-terms/paydollar-icon.png">
									</div>
									<p>We adopt PayDollar Payment Gateway, a leading, secure, reliable international payment service provider to banks and online merchants.</p>
								</div>
								<div class="card-item clearfix">
									<div class="text-center">
										<img src="<%=request.getContextPath()%>/resources/images/elite-terms/verifiedbyvisa-icon.png">
									</div>
									<p>Verified by Visa (VbV) is a program designed to help make shopping online more secure.</p>
								</div>
								<div class="card-item last clearfix">
									<div class="text-center">
										<img src="<%=request.getContextPath()%>/resources/images/elite-terms/mastercard-icon.png">
									</div>
									<p>Get an extra layer of online shopping security with MasterCard SecureCode - a private, secure code. that protects your purchases.</p>
								</div>
							</div>
						</div>

						<div class="text-center complete-holder hidden-sm hidden-xs">
							<button type="button" class="btn next ">Complete</button>
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
