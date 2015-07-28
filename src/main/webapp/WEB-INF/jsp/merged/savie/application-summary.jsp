<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeQuoteBean"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
		<%!
			boolean isSaleActiveClass = true;
		%>
		<div class="fwd-savie-wrapper">
			<!--Application Header Info Widget-->
			<div class="container-fluid fwd-full-container">
				<div class="application-page-header">
					<div class="row">
						<div class="col-xs-12 orange-section">
							<div class="clearfix position">
								<div class="back-arrow-left">
									<a id="order-summary-return-btn" class="btn back-arrow-btn" href="">
										<span class="icon-arrow-left2 arrow-left"></span>
									</a>
								</div>
								<div class="description-order-summary">
									<span>Great! Here is your purchase summary.</span>
								</div>
								<div class="dollars-monthly-right">
									<div class="figures">
										<span class="figure-description">Single premium</span>
										<span class="dollars">HK$ <span class="figure">100,000</span></span>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xs-12 gray-section">
							<div class="description">Great! Here is your purchase summary.</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="application-flux">
				<!-- Illustration Review Block -->
				<div class="fwd-full-container container-fluid illustration-review investment">     
					<div class="fwd-container-limit illustrate investment-summary-and-table">
						<div id="sales-contents" class="tab-content credits">
							<div>	                    	
								<div class="container-fluid summary-tab-max-width">
									<div id="application-review-container" class="fwd-container">
										<div class="illustration-head">
											<h2 class="text-center appli">Application summary</h2>
										</div>
										<div class="row plan-row inner-plan-row">
											<div class="clearfix inner-plan-col">
												<div class="col-xs-12 col-md-12 inner-col">
													<div class="row">
														<h3>Personal info <a class="hidden-xs hidden-sm" href="#">Edit</a></h3>
														<div class="col-xs-6 col-md-3">
															<p>Name in English</p>
														</div>
														<div class="col-xs-6 col-md-9 plan-col">
															<p></p>
														</div>
														<div class="clearfix"></div>
														<div class="col-xs-6 col-md-3 name-pad">
															<p>Last name</p>
														</div>
														<div class="col-xs-6 col-md-9 plan-col name-pad">
															<p>${savieDetail.savieApplicantBean.lastName }</p>
														</div>
														<div class="clearfix"></div>
														<div class="col-xs-6 col-md-3 name-pad">
															<p>Given Name</p>
														</div>
														<div class="col-xs-6 col-md-9 plan-col name-pad">
															<p>${savieDetail.savieApplicantBean.firstName }</p>
														</div>					                                
														<div class="clearfix"></div>
														<div class="col-xs-6 col-md-3">
															<p>Name in Chinese</p>
														</div>
														<div class="col-xs-6 col-md-9 plan-col chinese">
															<p>${savieDetail.savieApplicantBean.chineseName }</p>
														</div>
														<div class="clearfix"></div>
														<div class="col-xs-6 col-md-3">
															<p>HKID</p>
														</div>
														<div class="col-xs-6 col-md-9 plan-col">
															<p>${savieDetail.savieApplicantBean.hkId }</p>
														</div>
														<div class="clearfix"></div>
														<div class="col-xs-6 col-md-3">
															<p>Gender</p>
														</div>
														<div class="col-xs-6 col-md-9 plan-col">
															<p>${savieDetail.savieApplicantBean.gender }</p>
														</div>
														<div class="clearfix"></div>
														<div class="col-xs-6 col-md-3">
															<p>Marital status</p>
														</div>
														<div class="col-xs-6 col-md-9 plan-col">
															<p>Married</p>
														</div>
														<div class="clearfix"></div>
														<div class="col-xs-6 col-md-3">
															<p>Date of birth</p>
														</div>
														<div class="col-xs-6 col-md-9 plan-col">
															<p>27-09-1961</p>
														</div>
														<div class="clearfix"></div>
														<div class="col-xs-6 col-md-3">
															<p>Place of birth</p>
														</div>
														<div class="col-xs-6 col-md-9 plan-col">
															<p>Hong Kong</p>
														</div>
														<div class="clearfix"></div>
														<div class="col-xs-6 col-md-3">
															<p>Nationality</p>
														</div>
														<div class="col-xs-6 col-md-9 plan-col">
															<p>Hong Kong</p>
														</div>
														<div class="clearfix"></div>
														<div class="col-xs-6 col-md-3">
															<p>Email address</p>
														</div>
														<div class="col-xs-6 col-md-9 plan-col">
															<p>dakwa@gmail.com</p>
														</div>
														<div class="clearfix"></div>
														<div class="col-xs-6 col-md-3">
															<p>Telephone no</p>
														</div>
														<div class="col-xs-6 col-md-9 plan-col">
															<p>+852 1234-5678</p>
														</div>
														<div class="clearfix"></div>
														<div class="col-xs-6 col-md-3">
															<p>Residential address</p>
														</div>
														<div class="col-xs-6 col-md-9 plan-col">
															<p class="line">Tung Hip building, Room 601, 248 Des Voeux Road, Sheung Wan.</p>
														</div>
													</div>
												</div>
												<div class="col-xs-12 col-md-12 inner-col">
													<div class="row">
														<h3 class="h3-pad">Employment info <a class="hidden-xs hidden-sm" href="#">Edit</a></h3>
														<div class="col-xs-6 col-md-3">
															<p>Employment status</p>
														</div>
														<div class="col-xs-6 col-md-9 plan-col">
															<p>Employed</p>
														</div>	
														<div class="clearfix"></div>                                
														<div class="col-xs-6 col-md-3">
															<p>Occupation</p>
														</div>
														<div class="col-xs-6 col-md-9 plan-col">
															<p>Artist</p>
														</div>				        
														<div class="clearfix"></div>                        
														<div class="col-xs-6 col-md-3">
															<p>Nature of business</p>
														</div>
														<div class="col-xs-6 col-md-9 plan-col">
															<p>Entertainment</p>
														</div>				        
														<div class="clearfix"></div>                        
														<div class="col-xs-6 col-md-3">
															<p>Monthly personal <span class="p-monthly">income (HK$)</span></p>
														</div>
														<div class="col-xs-6 col-md-9 plan-col">
															<p>HK$ 55,000 and above</p>
														</div>
													</div>
												</div>
												<div class="col-xs-12 col-md-12 inner-col">
													<div class="row">
														<h3 class="h3-pad">Beneficiary <span>(Person 1)</span> <a class="hidden-xs hidden-sm" href="#">Edit</a></h3>
														<div class="col-xs-6 col-md-3">
															<p>Name in English</p>
														</div>
														<div class="col-xs-6 col-md-9 plan-col">
															<p></p>
														</div>	
														<div class="clearfix"></div>
														<div class="col-xs-6 col-md-3 name-pad">
															<p>Last name</p>
														</div>
														<div class="col-xs-6 col-md-9 plan-col name-pad">
															<p>Chu</p>
														</div>	
														<div class="clearfix"></div>    
														<div class="col-xs-6 col-md-3 name-pad">
															<p>Given name</p>
														</div>
														<div class="col-xs-6 col-md-9 plan-col name-pad">
															<p>Carol</p>
														</div>	
														<div class="clearfix"></div>        
														<div class="col-xs-6 col-md-3">
															<p>Relationship</p>
														</div>
														<div class="col-xs-6 col-md-9 plan-col">
															<p>Spouse</p>
														</div>	
														<div class="clearfix"></div>    
														<div class="col-xs-6 col-md-3">
															<p>Gender</p>
														</div>
														<div class="col-xs-6 col-md-9 plan-col">
															<p>Female</p>
														</div>
														<div class="clearfix"></div>    
														<div class="col-xs-6 col-md-3">
															<p>Entitlement (%)</p>
														</div>
														<div class="col-xs-6 col-md-9 plan-col">
															<p>Person 1: 100%</p>
														</div>
														<div class="clearfix"></div>    
														<div class="col-xs-6 col-md-3">
															<p>Plan name</p>
														</div>
														<div class="col-xs-6 col-md-9 plan-col">
															<p>SAVIE</p>
														</div>
														<div class="clearfix"></div>    
														<div class="col-xs-6 col-md-3">
															<p>Currency</p>
														</div>
														<div class="col-xs-6 col-md-9 plan-col">
															<p>HK$</p>
														</div>
														<div class="clearfix"></div>    
														<div class="col-xs-6 col-md-3">
															<p>Single premium</p>
														</div>
														<div class="col-xs-6 col-md-9 plan-col">
															<p>HK$ 100,000</p>
														</div>
													</div>
												</div>
												<div class="col-xs-12 col-md-12 inner-col">
													<div class="row">
														<h3 class="h3-pad">Payment Info <a class="hidden-xs hidden-sm" href="#">Edit</a></h3>           
														<div class="col-xs-6 col-md-3">
															<p>Payment method</p>
														</div>
														<div class="col-xs-6 col-md-9 plan-col">
															<p>Direct Debit</p>
														</div>
														<div class="clearfix"></div>    
														<div class="col-xs-6 col-md-3">
															<p>Amount</p>
														</div>
														<div class="col-xs-6 col-md-9 plan-col">
															<p>HK$ 100,000</p>
														</div>	
														<div class="clearfix"></div>    
														<div class="col-xs-6 col-md-3">
															<p>Account no</p>
														</div>
														<div class="col-xs-6 col-md-9 plan-col">
															<p>467823423</p>
														</div>	
														<div class="clearfix"></div>    
														<div class="col-xs-6 col-md-3">
															<p>Bank name (Code)</p>
														</div>
														<div class="col-xs-6 col-md-9 plan-col">
															<p>China Citi Bank (002)</p>
														</div>	
														<div class="clearfix"></div>    
														<div class="col-xs-6 col-md-3">
															<p>Branch name</p>
														</div>
														<div class="col-xs-6 col-md-9 plan-col">
															<p>Sheung Wan</p>
														</div>	
														<div class="clearfix"></div>    
														<div class="col-xs-6 col-md-3">
															<p>Expiry date</p>
														</div>
														<div class="col-xs-6 col-md-9 plan-col">
															<p>4-10-2015</p>                    
														</div>
													</div>
												</div>
											</div>              
										</div>
									</div> <!-- application-review end tag -->
									<div class="btn-style btn-pro text-center">
										<button id="order-summary-proceed-btn" type="button" class="text-center btn-next">Next</button>
									</div>
								</div> <!-- tab summary end -->
							</div>
						</div> <!-- tab content credits -->
					</div> <!-- investment summary table end -->
				</div> <!-- investment end -->
			</div>
		
			<!-- FOOTER -->
			<div id="illustration-result" class="modal fade illustration-result application-modal" role="dialog" data-backdrop="false" aria-labelledby="illustration-result">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
						<div class="modal-body">						
							<h2>Here’s your sales illustration result</h2>
							<p class="single-premium">Single premium</p>
							<span class="amount">HK$ 100,00</span>
							<p class="guaranteed">Guaranteed at the end of 3rd policy year HK$ 110,334</p>
							<button id="review-accept" class="btn next" data-dismiss="modal">Review and accept</button> 
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- JS INCLUDES -->
		<script>
			$(function() {
				//$('#illustration-result').modal('show');
			});
		</script>
