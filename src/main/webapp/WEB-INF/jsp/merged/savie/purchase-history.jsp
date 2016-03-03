<%@page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<%@include file="includes/head.jsp" %>
		<meta name="apple-mobile-web-app-capable" content="yes" />
	</head>
	<body>
		<%!
			boolean isSaleActiveClass = false;
			boolean isEservicesActiveClass = false;
		%>
		<div class="fwd-savie-wrapper">
			<!-- HEADER -->
			<%@include file="includes/header-block.jsp" %>
			<div class="fwd-container container-fluid breadcrumbs purchase-history-bc">
	            <div class="breadcrumb-container">
	               <ol class="breadcrumb breadcrumbs-product-details et-breadcrumbs">
						<li><a href="#">Home</a></li>
						<li class="divider last"><i class="fa fa-play"></i></li>
						<li class="active-bc">FWD Member Account</li>
	               </ol>
	            </div>
	         </div>
			<div class="container-fluid fwd-full-container eservices insurance-active-page" id="savie-online-purchase-history">
				<div class="fwd-container-limit clearfix sidebar">
					<div class="row" id="purchase-history-page">
						<h2>FWD member account</h2>
						<div class="btn-group account-dropdown hidden-md hidden-lg clearfix">
	                        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
	                            <span class="button-text">Insurance plan</span>
	                            <i class="fa fa-angle-down"></i>
	                        </button>
	                        <ul class="dropdown-menu" role="menu">
	                            <li class="mobile-dropdown dropdown-profile"><a href="#" data-toggle="tab" aria-expanded="true">Profile</a></li>
	                            <li class="mobile-dropdown dropdown-insurance-plan active"><a href="#" data-toggle="tab" aria-expanded="true">Insurance plan</a></li>
	                            <li class="mobile-dropdown dropdown-promo-offers"><a href="#" data-toggle="tab" aria-expanded="true">Promo &amp; offers</a></li>
	                        </ul>
	                    </div>
						<div class="col-md-3 side-menu hidden-xs hidden-sm">
							<ul class="nav nav-pills nav-stacked">
								<li class="left-side-tab-menu profile" id="profile-tab-link"><a href="#"><span class="side-menu-icon hidden-xs hidden-sm" id="profile"></span>Profile</a></li>
								<li class="left-side-tab-menu insurance-plan active" id="insurance-plan-tab-link"><a href="#"><span class="side-menu-icon  hidden-xs hidden-sm" id="insurance-plan"></span>Insurance plan</a></li>
								<li class="left-side-tab-menu promo-offers" id="promo-offers-tab-link"><a href="#"><span class="side-menu-icon  hidden-xs hidden-sm" id="promo-offers"></span>Promo &amp; offers</a></li>
							</ul>
						</div>
						<div class="col-xs-12 col-md-9 right-side-content">
							<div id="purchase-history-tab-contents">
								<ul class="nav nav-tabs nav-justified">
									<li class="active"><a href="#pending" data-toggle="tab">Pending</a></li>
									<li><a href="#active" data-toggle="tab">Active</a></li>
									<li id="past-tab"><a href="#past" data-toggle="tab">Past</a></li>
								</ul>
								<div class="tab-content">
									<div class="tab-pane active" id="pending">
										<div class="life-and-health-container">
											<div class="category-holder">
												<h4 class="category-title">Life &amp; Health</h4>
												<div class="row category-head">
													<div class="col-xs-6 col-md-2">
														<h4 class="hidden-xs hidden-sm info-head">Plan name</h4>
													</div>
													<div class="col-xs-6 col-md-2">
														<h4 class="hidden-xs hidden-sm info-head">Policy no.</h4>
													</div>
													<div class="col-xs-6 col-md-3">
														<h4 class="hidden-xs hidden-sm info-head">Start date <i class="fa fa-info-circle" data-toggle="tooltip" data-html="true" data-placement="right" title="<p>Start date</p>"></i></h4>
													</div>
													<div class="col-xs-6 col-md-3 visible-md visible-lg">
														<h4 class="hidden-xs hidden-sm info-head">Status</h4>
													</div>	
													<div class="col-xs-6 col-md-2 visible-md visible-lg" id="last-col-head">
														<h4 class="hidden-xs hidden-sm info-head">Insured amount(HK$)</h4>
													</div>
												</div>				
												<div class="row category-info-row row-gray">
													<div class="col-xs-6 col-md-2 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Plan name</h4>
														<p class="info-data plan-name">Elite Term</p>
													</div>
													<div class="col-xs-6 col-md-2 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Policy no.</h4>
														<p class="info-data">13110103</p>
													</div>
													<div class="col-xs-6 col-md-3 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Start date</i></h4>
														<p class="info-data">Not complete</p>
													</div>
													<div class="col-xs-6 col-md-3 visible-md visible-lg mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Status</h4>
														<p class="info-data"><a href="#">Upload document now</a></p>
													</div>											
													<div class="col-xs-6 col-md-2 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Insured amount(HK$)</h4>
														<p class="info-data">800,000.00</p>
													</div>
													<div class="col-xs-12 visible-xs visible-sm mbview-category-info">											
														<h4 class="visible-xs visible-sm info-head">Status</h4>
														<p class="info-data"><a href="#">Upload document now</a></p>													
													</div>
												</div>
												<div class="row category-info-row">
													<div class="col-xs-6 col-md-2 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Plan name</h4>
														<p class="info-data plan-name">Elite Term</p>
													</div>
													<div class="col-xs-6 col-md-2 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Policy no.</h4>
														<p class="info-data">13110116</p>
													</div>
													<div class="col-xs-6 col-md-3 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Start date</h4>
														<p class="info-data">13-11-2015</p>
													</div>
													<div class="col-xs-6 col-md-3 visible-md visible-lg mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Status</h4>
														<p class="info-data">Completed</p>
													</div>											
													<div class="col-xs-6 col-md-2 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Insured amount(HK$)</h4>
														<p class="info-data">800,000.00</p>
													</div>
													<div class="col-xs-12 visible-xs visible-sm mbview-category-info">												
														<h4 class="visible-xs visible-sm info-head">Status</h4>
														<p class="info-data">Completed</p>													
													</div>
												</div>
												<div class="row category-info-row row-gray">
													<div class="col-xs-6 col-md-2 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Plan name</h4>
														<p class="info-data plan-name">Elite Term</p>
													</div>
													<div class="col-xs-6 col-md-2 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Policy no.</h4>
														<p class="info-data">13110127</p>
													</div>
													<div class="col-xs-6 col-md-3 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Start date</h4>
														<p class="info-data">Not complete</p>
													</div>
													<div class="col-xs-6 col-md-3 visible-md visible-lg mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Status</h4>
														<p class="info-data"><a href="#">Upload document now</a></p>
													</div>											
													<div class="col-xs-6 col-md-2 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Insured amount(HK$)</h4>
														<p class="info-data">1,390,000.00</p>
													</div>
													<div class="col-xs-12 visible-xs visible-sm mbview-category-info">												
														<h4 class="visible-xs visible-sm info-head">Status</h4>
														<p class="info-data"><a href="#">Upload document now</a></p>													
													</div>
												</div>
											</div>	
										</div>											
										<!--TRAVEL -->	
										<div class="travel-container">
											<div class="category-holder">
												<h4 class="category-title">Travel</h4>
												<div class="row category-head">
													<div class="col-xs-6 col-md-2">
														<h4 class="hidden-xs hidden-sm info-head">Plan name</h4>
													</div>
													<div class="col-xs-6 col-md-2">
														<h4 class="hidden-xs hidden-sm info-head">Policy no.</h4>
													</div>
													<div class="col-xs-6 col-md-3">
														<h4 class="hidden-xs hidden-sm info-head">Cover period <i class="fa fa-info-circle" data-toggle="tooltip" data-html="true" data-placement="right" title="<p>Cover period</p>"></i></h4>
													</div>
													<div class="col-xs-6 col-md-3 visible-md visible-lg">
														<h4 class="hidden-xs hidden-sm info-head">Status</h4>
													</div>	
													<div class="col-xs-6 col-md-2 visible-md visible-lg" id="last-col-head">
														<h4 class="hidden-xs hidden-sm info-head">Resources <i class="fa fa-info-circle" data-toggle="tooltip" data-html="true" data-placement="right" title="<p>Resources</p>"></i></h4>
													</div>
												</div>				
												<div class="row category-info-row row-gray">
													<div class="col-xs-6 col-md-2 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Plan name</h4>
														<p class="info-data plan-name">Annual TravelCare</p>
													</div>
													<div class="col-xs-6 col-md-2 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Policy no.</h4>
														<p class="info-data">74AT0000038</p>
													</div>
													<div class="col-xs-6 col-md-3 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Cover period</h4>
														<p class="info-data">16-12-2015~15-12-2016</p>
													</div>
													<div class="col-xs-6 col-md-3 visible-md visible-lg mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Status</h4>
														<p class="info-data"><a href="#">Upload document now</a></p>
													</div>											
													<div class="col-xs-6 col-md-2 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Resources</i></h4>
														<p class="info-data"><a href="#">Claim form</a></p>
													</div>
													<div class="col-xs-12 visible-xs visible-sm mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Status</h4>
														<p class="info-data"><a href="#">Upload document now</a></p>													
													</div>
												</div>
												<div class="row category-info-row">
													<div class="col-xs-6 col-md-2 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Plan name</h4>
														<p class="info-data plan-name">FlightCare</p>
													</div>
													<div class="col-xs-6 col-md-2 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Policy no.</h4>
														<p class="info-data">74AT0000211</p>
													</div>
													<div class="col-xs-6 col-md-3 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Cover period</h4>
														<p class="info-data">Not complete</p>
													</div>
													<div class="col-xs-6 col-md-3 visible-md visible-lg mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Status</h4>
														<p class="info-data">Completed</p>
													</div>											
													<div class="col-xs-6 col-md-2 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Resources</h4>
														<p class="info-data"><a href="#">Claim form</a></p>
													</div>
													<div class="col-xs-12 visible-xs visible-sm mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Status</h4>
														<p class="info-data">Completed</p>													
													</div>
												</div>
												<div class="row category-info-row row-gray">
													<div class="col-xs-6 col-md-2 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Plan name</h4>
														<p class="info-data plan-name">Working HolidayCare</p>
													</div>
													<div class="col-xs-6 col-md-2 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Policy no.</h4>
														<p class="info-data">74AT0000130</p>
													</div>
													<div class="col-xs-6 col-md-3 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Cover period</h4>
														<p class="info-data">Not complete</p>
													</div>
													<div class="col-xs-6 col-md-3 visible-md visible-lg mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Status</h4>
														<p class="info-data"><a href="#">Upload document now</a></p>
													</div>											
													<div class="col-xs-6 col-md-2 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Resources</h4>
														<p class="info-data"><a href="#">Claim form</a></p>
													</div>
													<div class="col-xs-12 visible-xs visible-sm mbview-category-info">												
														<h4 class="visible-xs visible-sm info-head">Status</h4>
														<p class="info-data"><a href="#">Upload document now</a></p>												
													</div>
												</div>
											</div>
										</div>									
										<!--SAVING INSURANCE -->
										<div class="saving-insurance-container">
											<div class="category-holder">
												<h4 class="category-title">Saving Insurance</h4>
												<div class="row category-head">
													<div class="col-xs-6 col-md-2">
														<h4 class="hidden-xs hidden-sm info-head">Plan name</h4>
													</div>
													<div class="col-xs-6 col-md-2">
														<h4 class="hidden-xs hidden-sm info-head">Policy no.</h4>
													</div>
													<div class="col-xs-6 col-md-3">
														<h4 class="hidden-xs hidden-sm info-head">Start date <i class="fa fa-info-circle" data-toggle="tooltip" data-html="true" data-placement="right" title="<p>Start date</p>"></i></h4>
													</div>
													<div class="col-xs-6 col-md-3 visible-md visible-lg">
														<h4 class="hidden-xs hidden-sm info-head">Status</h4>
													</div>	
													<div class="col-xs-6 col-md-2 visible-md visible-lg" id="last-col-head">
														<h4 class="hidden-xs hidden-sm info-head acc-val">Account value (HK$) <i class="fa fa-info-circle" data-toggle="tooltip" data-html="true" data-placement="right" title="<p>Account value(HK$)</p>"></i></h4>
													</div>
												</div>				
												<div class="row category-info-row row-gray">
													<div class="col-xs-6 col-md-2 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Plan name</h4>
														<p class="info-data plan-name">Savie Insurance</p>
													</div>
													<div class="col-xs-6 col-md-2 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Policy no.</h4>
														<p class="info-data">74AT000038</p>
													</div>
													<div class="col-xs-6 col-md-3 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Start date</h4>
														<p class="info-data">Not complete</p>
													</div>
													<div class="col-xs-6 col-md-3 visible-md visible-lg mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Status</h4>
														<p class="info-data"><a href="#" data-toggle="modal" data-target="#retrieve-application-modal">Resume Application</a></p>
													</div>											
													<div class="col-xs-6 col-md-2 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Account value (HK$)</h4>
														<p class="info-data">300,000.00</p>
													</div>												
													<div class="col-xs-12 visible-xs visible-sm mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Status</h4>
														<p class="info-data"><a href="#" data-toggle="modal" data-target="#retrieve-application-modal">Resume Application</a></p>
													</div>																			
												</div>
												<div class="row category-info-row">
													<div class="col-xs-6 col-md-2 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Plan name</h4>
														<p class="info-data plan-name">Savie Insurance</p>
													</div>
													<div class="col-xs-6 col-md-2 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Policy no.</h4>
														<p class="info-data">74AT000211</p>
													</div>
													<div class="col-xs-6 col-md-3 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Start date</h4>
														<p class="info-data">13-11-2015</p>
													</div>
													<div class="col-xs-6 col-md-3 visible-md visible-lg mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Status</h4>
														<p class="info-data">Completed</p>
													</div>											
													<div class="col-xs-6 col-md-2 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Account value (HK$)</h4>
														<p class="info-data">400,000.00</p>
													</div>
													<div class="col-xs-12 visible-xs visible-sm mbview-category-info">												
														<h4 class="visible-xs visible-sm info-head">Status</h4>
														<p class="info-data">Completed</p>												
													</div>
												</div>
												<div class="row category-info-row row-gray">
													<div class="col-xs-6 col-md-2 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Plan name</h4>
														<p class="info-data plan-name">Savie Insurance</p>
													</div>
													<div class="col-xs-6 col-md-2 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Policy no.</h4>
														<p class="info-data">74AT000130</p>
													</div>
													<div class="col-xs-6 col-md-3 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Start date</h4>
														<p class="info-data">Not complete</p>
													</div>
													<div class="col-xs-6 col-md-3 visible-md visible-lg mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Status</h4>
														<p class="info-data pls-visit">Please visit<br>FWD customer Center</p>
													</div>											
													<div class="col-xs-6 col-md-2 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Account value</h4>
														<p class="info-data">10,000.00</p>
													</div>
													<div class="col-xs-12 visible-xs visible-sm mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Status</h4>
														<p class="info-data pls-visit">Please visit<br>FWD customer Center</p>											
													</div>
												</div>
											</div>
										</div>									
									</div>
									<div class="tab-pane" id="active">
										<div class="life-and-health-container">
											<div class="category-holder">
												<h4 class="category-title">Life &amp; Health</h4>
												<div class="row category-head">
													<div class="col-xs-6 col-md-2">
														<h4 class="hidden-xs hidden-sm info-head">Plan name</h4>
													</div>
													<div class="col-xs-6 col-md-2">
														<h4 class="hidden-xs hidden-sm info-head">Policy no.</h4>
													</div>
													<div class="col-xs-6 col-md-3">
														<h4 class="hidden-xs hidden-sm info-head">Start date <i class="fa fa-info-circle" data-toggle="tooltip" data-html="true" data-placement="right" title="<p>Start date</p>"></i></h4>
													</div>
													<div class="col-xs-6 col-md-3 visible-md visible-lg">
														<h4 class="hidden-xs hidden-sm info-head">Status</h4>
													</div>	
													<div class="col-xs-6 col-md-2 visible-md visible-lg" id="last-col-head">
														<h4 class="hidden-xs hidden-sm info-head">Insured amount(HK$)</h4>
													</div>
												</div>				
												<div class="row category-info-row row-gray">
													<div class="col-xs-6 col-md-2 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Plan name</h4>
														<p class="info-data plan-name">Elite Term</p>
													</div>
													<div class="col-xs-6 col-md-2 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Policy no.</h4>
														<p class="info-data">13110103</p>
													</div>
													<div class="col-xs-6 col-md-3 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Start date</i></h4>
														<p class="info-data">Not complete</p>
													</div>
													<div class="col-xs-6 col-md-3 visible-md visible-lg mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Status</h4>
														<p class="info-data"><a href="#">Upload document now</a></p>
													</div>											
													<div class="col-xs-6 col-md-2 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Insured amount(HK$)</h4>
														<p class="info-data">800,000.00</p>
													</div>
													<div class="col-xs-12 visible-xs visible-sm mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Status</h4>
														<p class="info-data"><a href="#">Upload document now</a></p>	
													</div>
												</div>
												<div class="row category-info-row">
													<div class="col-xs-6 col-md-2 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Plan name</h4>
														<p class="info-data plan-name">Elite Term</p>
													</div>
													<div class="col-xs-6 col-md-2 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Policy no.</h4>
														<p class="info-data">13110116</p>
													</div>
													<div class="col-xs-6 col-md-3 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Start date</h4>
														<p class="info-data">13-11-2015</p>
													</div>
													<div class="col-xs-6 col-md-3 visible-md visible-lg mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Status</h4>
														<p class="info-data">Completed</p>
													</div>											
													<div class="col-xs-6 col-md-2 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Insured amount(HK$)</h4>
														<p class="info-data">800,000.00</p>
													</div>
													<div class="col-xs-12 visible-xs visible-sm mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Status</h4>
														<p class="info-data">Completed</p>											
													</div>
												</div>
												<div class="row category-info-row row-gray">
													<div class="col-xs-6 col-md-2 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Plan name</h4>
														<p class="info-data plan-name">Elite Term</p>
													</div>
													<div class="col-xs-6 col-md-2 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Policy no.</h4>
														<p class="info-data">13110127</p>
													</div>
													<div class="col-xs-6 col-md-3 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Start date</h4>
														<p class="info-data">Not complete</p>
													</div>
													<div class="col-xs-6 col-md-3 visible-md visible-lg mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Status</h4>
														<p class="info-data"><a href="#">Upload document now</a></p>
													</div>											
													<div class="col-xs-6 col-md-2 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Insured amount(HK$)</h4>
														<p class="info-data">1,390,000.00</p>
													</div>
													<div class="col-xs-12 visible-xs visible-sm mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Status</h4>
														<p class="info-data"><a href="#">Upload document now</a></p>									
													</div>
												</div>
											</div>
										</div>												
										<!--TRAVEL -->	
										<div class="travel-container">
											<div class="category-holder">
												<h4 class="category-title">Travel</h4>
												<div class="row category-head">
													<div class="col-xs-6 col-md-2">
														<h4 class="hidden-xs hidden-sm info-head">Plan name</h4>
													</div>
													<div class="col-xs-6 col-md-2">
														<h4 class="hidden-xs hidden-sm info-head">Policy no.</h4>
													</div>
													<div class="col-xs-6 col-md-3">
														<h4 class="hidden-xs hidden-sm info-head">Cover period <i class="fa fa-info-circle" data-toggle="tooltip" data-html="true" data-placement="right" title="<p>Cover period</p>"></i></h4>
													</div>
													<div class="col-xs-6 col-md-3 visible-md visible-lg">
														<h4 class="hidden-xs hidden-sm info-head">Status</h4>
													</div>	
													<div class="col-xs-6 col-md-2 visible-md visible-lg" id="last-col-head">
														<h4 class="hidden-xs hidden-sm info-head">Resources <i class="fa fa-info-circle" data-toggle="tooltip" data-html="true" data-placement="right" title="<p>Resources</p>"></i></h4>
													</div>
												</div>				
												<div class="row category-info-row row-gray">
													<div class="col-xs-6 col-md-2 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Plan name</h4>
														<p class="info-data plan-name">Annual TravelCare</p>
													</div>
													<div class="col-xs-6 col-md-2 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Policy no.</h4>
														<p class="info-data">74AT0000038</p>
													</div>
													<div class="col-xs-6 col-md-3 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Cover period</h4>
														<p class="info-data">16-12-2015~15-12-2016</p>
													</div>
													<div class="col-xs-6 col-md-3 visible-md visible-lg mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Status</h4>
														<p class="info-data"><a href="#">Upload document now</a></p>
													</div>											
													<div class="col-xs-6 col-md-2 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Resources</i></h4>
														<p class="info-data"><a href="#">Claim form</a></p>
													</div>
													<div class="col-xs-12 visible-xs visible-sm mbview-category-info">												
														<h4 class="visible-xs visible-sm info-head">Status</h4>
														<p class="info-data"><a href="#">Upload document now</a></p>													
													</div>
												</div>
												<div class="row category-info-row">
													<div class="col-xs-6 col-md-2 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Plan name</h4>
														<p class="info-data plan-name">FlightCare</p>
													</div>
													<div class="col-xs-6 col-md-2 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Policy no.</h4>
														<p class="info-data">74AT0000211</p>
													</div>
													<div class="col-xs-6 col-md-3 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Cover period</h4>
														<p class="info-data">Not complete</p>
													</div>
													<div class="col-xs-6 col-md-3 visible-md visible-lg mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Status</h4>
														<p class="info-data">Completed</p>
													</div>											
													<div class="col-xs-6 col-md-2 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Resources</h4>
														<p class="info-data"><a href="#">Claim form</a></p>
													</div>
													<div class="col-xs-12 visible-xs visible-sm mbview-category-info">												
														<h4 class="visible-xs visible-sm info-head">Status</h4>
														<p class="info-data">Completed</p>											
													</div>
												</div>
												<div class="row category-info-row row-gray">
													<div class="col-xs-6 col-md-2 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Plan name</h4>
														<p class="info-data plan-name">Working HolidayCare</p>
													</div>
													<div class="col-xs-6 col-md-2 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Policy no.</h4>
														<p class="info-data">74AT0000130</p>
													</div>
													<div class="col-xs-6 col-md-3 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Cover period</h4>
														<p class="info-data">Not complete</p>
													</div>
													<div class="col-xs-6 col-md-3 visible-md visible-lg mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Status</h4>
														<p class="info-data"><a href="#">Upload document now</a></p>
													</div>											
													<div class="col-xs-6 col-md-2 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Resources</h4>
														<p class="info-data"><a href="#">Claim form</a></p>
													</div>
													<div class="col-xs-12 visible-xs visible-sm mbview-category-info">												
														<h4 class="visible-xs visible-sm info-head">Status</h4>
														<p class="info-data"><a href="#">Upload document now</a></p>												
													</div>
												</div>
											</div>
										</div>									
										<!--SAVING INSURANCE -->
										<div class="saving-insurance-container">
											<div class="category-holder">
												<h4 class="category-title">Saving Insurance</h4>
												<div class="row category-head">
													<div class="col-xs-6 col-md-2">
														<h4 class="hidden-xs hidden-sm info-head">Plan name</h4>
													</div>
													<div class="col-xs-6 col-md-2">
														<h4 class="hidden-xs hidden-sm info-head">Policy no.</h4>
													</div>
													<div class="col-xs-6 col-md-3">
														<h4 class="hidden-xs hidden-sm info-head">Start date <i class="fa fa-info-circle" data-toggle="tooltip" data-html="true" data-placement="right" title="<p>Start date</p>"></i></h4>
													</div>
													<div class="col-xs-6 col-md-3 visible-md visible-lg">
														<h4 class="hidden-xs hidden-sm info-head">Status</h4>
													</div>	
													<div class="col-xs-6 col-md-2 visible-md visible-lg" id="last-col-head">
														<h4 class="hidden-xs hidden-sm info-head acc-val">Account value (HK$) <i class="fa fa-info-circle" data-toggle="tooltip" data-html="true" data-placement="right" title="<p>Account value(HK$)</p>"></i></h4>
													</div>
												</div>				
												<div class="row category-info-row row-gray">
													<div class="col-xs-6 col-md-2 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Plan name</h4>
														<p class="info-data plan-name">Savie Insurance</p>
													</div>
													<div class="col-xs-6 col-md-2 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Policy no.</h4>
														<p class="info-data">74AT000038</p>
													</div>
													<div class="col-xs-6 col-md-3 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Start date</h4>
														<p class="info-data">Not complete</p>
													</div>
													<div class="col-xs-6 col-md-3 visible-md visible-lg mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Status</h4>
														<p class="info-data"><a href="#" data-toggle="modal" data-target="#retrieve-application-modal">Resume Application</a></p>
													</div>											
													<div class="col-xs-6 col-md-2 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Account value (HK$)</h4>
														<p class="info-data">300,000.00</p>
													</div>												
													<div class="col-xs-12 visible-xs visible-sm mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Status</h4>
														<p class="info-data"><a href="#" data-toggle="modal" data-target="#retrieve-application-modal">Resume Application</a></p>
													</div>
												</div>
												<div class="row category-info-row">
													<div class="col-xs-6 col-md-2 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Plan name</h4>
														<p class="info-data plan-name">Savie Insurance</p>
													</div>
													<div class="col-xs-6 col-md-2 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Policy no.</h4>
														<p class="info-data">74AT000211</p>
													</div>
													<div class="col-xs-6 col-md-3 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Start date</h4>
														<p class="info-data">13-11-2015</p>
													</div>
													<div class="col-xs-6 col-md-3 visible-md visible-lg mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Status</h4>
														<p class="info-data">Completed</p>
													</div>											
													<div class="col-xs-6 col-md-2 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Account value (HK$)</h4>
														<p class="info-data">400,000.00</p>
													</div>
													<div class="col-xs-12 visible-xs visible-sm mbview-category-info">												
														<h4 class="visible-xs visible-sm info-head">Status</h4>
														<p class="info-data">Completed</p>												
													</div>
												</div>
												<div class="row category-info-row row-gray">
													<div class="col-xs-6 col-md-2 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Plan name</h4>
														<p class="info-data plan-name">Savie Insurance</p>
													</div>
													<div class="col-xs-6 col-md-2 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Policy no.</h4>
														<p class="info-data">74AT000130</p>
													</div>
													<div class="col-xs-6 col-md-3 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Start date</h4>
														<p class="info-data">Not complete</p>
													</div>
													<div class="col-xs-6 col-md-3 visible-md visible-lg mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Status</h4>
														<p class="info-data pls-visit">Please visit<br>FWD customer Center</p>
													</div>											
													<div class="col-xs-6 col-md-2 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Account value</h4>
														<p class="info-data">10,000.00</p>
													</div>
													<div class="col-xs-12 visible-xs visible-sm mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Status</h4>
														<p class="info-data please-visit">Please visit<br>FWD customer Center</p>												
													</div>
												</div>
											</div>
										</div>								
									</div>
									<div class="tab-pane" id="past">
										<div class="life-and-health-container">
											<div class="category-holder">
												<h4 class="category-title">Life &amp; Health</h4>
												<div class="row category-head">
													<div class="col-xs-6 col-md-2">
														<h4 class="hidden-xs hidden-sm info-head">Plan name</h4>
													</div>
													<div class="col-xs-6 col-md-2">
														<h4 class="hidden-xs hidden-sm info-head">Policy no.</h4>
													</div>
													<div class="col-xs-6 col-md-3">
														<h4 class="hidden-xs hidden-sm info-head">Start date <i class="fa fa-info-circle" data-toggle="tooltip" data-html="true" data-placement="right" title="<p>Start date</p>"></i></h4>
													</div>
													<div class="col-xs-6 col-md-3 visible-md visible-lg">
														<h4 class="hidden-xs hidden-sm info-head">Status</h4>
													</div>	
													<div class="col-xs-6 col-md-2 visible-md visible-lg" id="last-col-head">
														<h4 class="hidden-xs hidden-sm info-head">Insured amount(HK$)</h4>
													</div>
												</div>				
												<div class="row category-info-row row-gray">
													<div class="col-xs-6 col-md-2 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Plan name</h4>
														<p class="info-data plan-name">Elite Term</p>
													</div>
													<div class="col-xs-6 col-md-2 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Policy no.</h4>
														<p class="info-data">13110103</p>
													</div>
													<div class="col-xs-6 col-md-3 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Start date</i></h4>
														<p class="info-data">Not complete</p>
													</div>
													<div class="col-xs-6 col-md-3 visible-md visible-lg mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Status</h4>
														<p class="info-data"><a href="#">Upload document now</a></p>
													</div>											
													<div class="col-xs-6 col-md-2 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Insured amount(HK$)</h4>
														<p class="info-data">800,000.00</p>
													</div>
													<div class="col-xs-12 visible-xs visible-sm mbview-category-info">
															<h4 class="visible-xs visible-sm info-head">Status</h4>
															<p class="info-data"><a href="#">Upload document now</a></p>
													</div>
												</div>
												<div class="row category-info-row">
													<div class="col-xs-6 col-md-2 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Plan name</h4>
														<p class="info-data plan-name">Elite Term</p>
													</div>
													<div class="col-xs-6 col-md-2 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Policy no.</h4>
														<p class="info-data">13110116</p>
													</div>
													<div class="col-xs-6 col-md-3 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Start date</h4>
														<p class="info-data">13-11-2015</p>
													</div>
													<div class="col-xs-6 col-md-3 visible-md visible-lg mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Status</h4>
														<p class="info-data">Completed</p>
													</div>											
													<div class="col-xs-6 col-md-2 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Insured amount(HK$)</h4>
														<p class="info-data">800,000.00</p>
													</div>
													<div class="col-xs-12 visible-xs visible-sm mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Status</h4>
														<p class="info-data">Completed</p>													
													</div>
												</div>
												<div class="row category-info-row row-gray">
													<div class="col-xs-6 col-md-2 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Plan name</h4>
														<p class="info-data plan-name">Elite Term</p>
													</div>
													<div class="col-xs-6 col-md-2 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Policy no.</h4>
														<p class="info-data">13110127</p>
													</div>
													<div class="col-xs-6 col-md-3 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Start date</h4>
														<p class="info-data">Not complete</p>
													</div>
													<div class="col-xs-6 col-md-3 visible-md visible-lg mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Status</h4>
														<p class="info-data"><a href="#">Upload document now</a></p>
													</div>											
													<div class="col-xs-6 col-md-2 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Insured amount(HK$)</h4>
														<p class="info-data">1,390,000.00</p>
													</div>
													<div class="col-xs-12 visible-xs visible-sm mbview-category-info">												
														<h4 class="visible-xs visible-sm info-head">Status</h4>
														<p class="info-data"><a href="#">Upload document now</a></p>
													</div>
												</div>
											</div>
										</div>												
										<!--TRAVEL -->
										<div class="travel-container">	
											<div class="category-holder">
												<h4 class="category-title">Travel</h4>
												<div class="row category-head">
													<div class="col-xs-6 col-md-2">
														<h4 class="hidden-xs hidden-sm info-head">Plan name</h4>
													</div>
													<div class="col-xs-6 col-md-2">
														<h4 class="hidden-xs hidden-sm info-head">Policy no.</h4>
													</div>
													<div class="col-xs-6 col-md-3">
														<h4 class="hidden-xs hidden-sm info-head">Cover period <i class="fa fa-info-circle" data-toggle="tooltip" data-html="true" data-placement="right" title="<p>Cover period</p>"></i></h4>
													</div>
													<div class="col-xs-6 col-md-3 visible-md visible-lg">
														<h4 class="hidden-xs hidden-sm info-head">Status</h4>
													</div>	
													<div class="col-xs-6 col-md-2 visible-md visible-lg" id="last-col-head">
														<h4 class="hidden-xs hidden-sm info-head">Resources <i class="fa fa-info-circle" data-toggle="tooltip" data-html="true" data-placement="right" title="<p>Resources</p>"></i></h4>
													</div>
												</div>				
												<div class="row category-info-row row-gray">
													<div class="col-xs-6 col-md-2 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Plan name</h4>
														<p class="info-data plan-name">Annual TravelCare</p>
													</div>
													<div class="col-xs-6 col-md-2 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Policy no.</h4>
														<p class="info-data">74AT0000038</p>
													</div>
													<div class="col-xs-6 col-md-3 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Cover period</h4>
														<p class="info-data">16-12-2015~15-12-2016</p>
													</div>
													<div class="col-xs-6 col-md-3 visible-md visible-lg mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Status</h4>
														<p class="info-data"><a href="#">Upload document now</a></p>
													</div>											
													<div class="col-xs-6 col-md-2 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Resources</i></h4>
														<p class="info-data"><a href="#">Claim form</a></p>
													</div>
													<div class="col-xs-12 visible-xs visible-sm mbview-category-info">												
														<h4 class="visible-xs visible-sm info-head">Status</h4>
														<p class="info-data"><a href="#">Upload document now</a></p>												
													</div>
												</div>
												<div class="row category-info-row">
													<div class="col-xs-6 col-md-2 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Plan name</h4>
														<p class="info-data plan-name">FlightCare</p>
													</div>
													<div class="col-xs-6 col-md-2 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Policy no.</h4>
														<p class="info-data">74AT0000211</p>
													</div>
													<div class="col-xs-6 col-md-3 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Cover period</h4>
														<p class="info-data">Not complete</p>
													</div>
													<div class="col-xs-6 col-md-3 visible-md visible-lg mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Status</h4>
														<p class="info-data">Completed</p>
													</div>											
													<div class="col-xs-6 col-md-2 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Resources</h4>
														<p class="info-data"><a href="#">Claim form</a></p>
													</div>
													<div class="col-xs-12 visible-xs visible-sm mbview-category-info">												
														<h4 class="visible-xs visible-sm info-head">Status</h4>
														<p class="info-data">Completed</p>													
													</div>
												</div>
												<div class="row category-info-row row-gray">
													<div class="col-xs-6 col-md-2 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Plan name</h4>
														<p class="info-data plan-name">Working HolidayCare</p>
													</div>
													<div class="col-xs-6 col-md-2 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Policy no.</h4>
														<p class="info-data">74AT0000130</p>
													</div>
													<div class="col-xs-6 col-md-3 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Cover period</h4>
														<p class="info-data">Not complete</p>
													</div>
													<div class="col-xs-6 col-md-3 visible-md visible-lg mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Status</h4>
														<p class="info-data"><a href="#">Upload document now</a></p>
													</div>											
													<div class="col-xs-6 col-md-2 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Resources</h4>
														<p class="info-data"><a href="#">Claim form</a></p>
													</div>
													<div class="col-xs-12 visible-xs visible-sm mbview-category-info">												
														<h4 class="visible-xs visible-sm info-head">Status</h4>
														<p class="info-data"><a href="#">Upload document now</a></p>												
													</div>
												</div>
											</div>
										</div>									
										<!--SAVING INSURANCE -->
										<div class="saving-insurance-container">
											<div class="category-holder">
												<h4 class="category-title">Saving Insurance</h4>
												<div class="row category-head">
													<div class="col-xs-6 col-md-2">
														<h4 class="hidden-xs hidden-sm info-head">Plan name</h4>
													</div>
													<div class="col-xs-6 col-md-2">
														<h4 class="hidden-xs hidden-sm info-head">Policy no.</h4>
													</div>
													<div class="col-xs-6 col-md-3">
														<h4 class="hidden-xs hidden-sm info-head">Start date <i class="fa fa-info-circle" data-toggle="tooltip" data-html="true" data-placement="right" title="<p>Start date</p>"></i></h4>
													</div>
													<div class="col-xs-6 col-md-3 visible-md visible-lg">
														<h4 class="hidden-xs hidden-sm info-head">Status</h4>
													</div>	
													<div class="col-xs-6 col-md-2 visible-md visible-lg" id="last-col-head">
														<h4 class="hidden-xs hidden-sm info-head acc-val">Account value (HK$) <i class="fa fa-info-circle" data-toggle="tooltip" data-html="true" data-placement="right" title="<p>Account value(HK$)</p>"></i></h4>
													</div>
												</div>				
												<div class="row category-info-row row-gray">
													<div class="col-xs-6 col-md-2 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Plan name</h4>
														<p class="info-data plan-name">Savie Insurance</p>
													</div>
													<div class="col-xs-6 col-md-2 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Policy no.</h4>
														<p class="info-data">74AT000038</p>
													</div>
													<div class="col-xs-6 col-md-3 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Start date</h4>
														<p class="info-data">Not complete</p>
													</div>
													<div class="col-xs-6 col-md-3 visible-md visible-lg mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Status</h4>
														<p class="info-data"><a href="#" data-toggle="modal" data-target="#retrieve-application-modal">Resume Application</a></p>
													</div>											
													<div class="col-xs-6 col-md-2 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Account value (HK$)</h4>
														<p class="info-data">300,000.00</p>
													</div>
														
													<div class="col-xs-12 visible-xs visible-sm mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Status</h4>
														<p class="info-data"><a href="#" data-toggle="modal" data-target="#retrieve-application-modal">Resume Application</a></p>
													</div>
														
									
												</div>
												<div class="row category-info-row">
													<div class="col-xs-6 col-md-2 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Plan name</h4>
														<p class="info-data plan-name">Savie Insurance</p>
													</div>
													<div class="col-xs-6 col-md-2 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Policy no.</h4>
														<p class="info-data">74AT000211</p>
													</div>
													<div class="col-xs-6 col-md-3 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Start date</h4>
														<p class="info-data">13-11-2015</p>
													</div>
													<div class="col-xs-6 col-md-3 visible-md visible-lg mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Status</h4>
														<p class="info-data">Completed</p>
													</div>											
													<div class="col-xs-6 col-md-2 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Account value (HK$)</h4>
														<p class="info-data">400,000.00</p>
													</div>
													<div class="col-xs-12 visible-xs visible-sm mbview-category-info">												
														<h4 class="visible-xs visible-sm info-head">Status</h4>
														<p class="info-data">Completed</p>												
													</div>
												</div>
												<div class="row category-info-row row-gray">
													<div class="col-xs-6 col-md-2 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Plan name</h4>
														<p class="info-data plan-name">Savie Insurance</p>
													</div>
													<div class="col-xs-6 col-md-2 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Policy no.</h4>
														<p class="info-data">74AT000130</p>
													</div>
													<div class="col-xs-6 col-md-3 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Start date</h4>
														<p class="info-data">Not complete</p>
													</div>
													<div class="col-xs-6 col-md-3 visible-md visible-lg mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Status</h4>
														<p class="info-data pls-visit">Please visit<br>FWD customer Center</p>
													</div>											
													<div class="col-xs-6 col-md-2 mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Account value</h4>
														<p class="info-data">10,000.00</p>
													</div>
													<div class="col-xs-12 visible-xs visible-sm mbview-category-info">
														<h4 class="visible-xs visible-sm info-head">Status</h4>
														<p class="info-data pls-visit">Please visit<br>FWD customer Center</p>											
													</div>
												</div>
											</div>		
										</div>						
									</div>
								</div>
								<p id="note"><span id="orange-ast">*</span> Amount indicative only. Please call our 24-hour hotline at 3123 3123 for up-to-date account value. </p>
							</div>
							<div id="eservices-tab-contents" class="hidden">
								<h3 class="heading-title">Member details</h4>
								<div id="member-details">	
									<div class="row member-data-holder">
										<div class="col-xs-6 col-md-4 member-data-label">
											Full name
										</div>
										<div class="col-xs-6 col-md-4 member-data-info">
											CHAN TAI MAN
										</div>
									</div>
									<div class="row member-data-holder">
										<div class="col-xs-6 col-md-4 member-data-label">
											Mobile no.
										</div>
										<div class="col-xs-6 col-md-4 member-data-info">
											52295139
										</div>
									</div>
									<div class="row member-data-holder">
										<div class="col-xs-6 col-md-4 member-data-label">
											Email address
										</div>
										<div class="col-xs-6 col-md-4 member-data-info">
											ALEX.PANG@FWD.COM
										</div>
									</div>
									<div class="row member-data-holder">
										<div class="col-xs-6 col-md-4 member-data-label">
											Username
										</div>
										<div class="col-xs-6 col-md-4 member-data-info">
											ALEX PANG
										</div>
									</div>
								</div>
								<h3 class="heading-title">Financial needs analysis</h4>	
								<p id="complete-statement">You have completed FNA on 08-11-2015. <a href="#" data-toggle="modal" data-target="#review-fna-modal">Review FNA</a></p>	
							</div>
							<div id="promo-offers-tab-contents" class="hidden">
								<ul class="nav nav-tabs nav-justified visible-xs visible-sm mobile-promo-navtab">
									<li class="active"><a href="#promo-code" data-toggle="tab">Personal<br /> promotion code</a></li>
									<li><a href="#ref-program" data-toggle="tab">Referral<br /> program</a></li>
									<li id="past-tab"><a href="#fwd-partner" data-toggle="tab">FWD<br/>partner</a></li>
								</ul>
								<div class="tab-content">
									<!--promotion code-->
									<div class="tab-pane active" id="promo-code">
										<div class="promotion-code-container">
											<h3 class="heading-title hidden-xs hidden-sm">Personal promotion code</h3>
											<p>Use your code to enjoy discounts from our partners</p>
											<p>Your code: <br class="visible-xs visible-sm" /><span class="your-code">V3B68V</span></p>
											<table class="table table-striped" id="promotion-code-table">
												 <thead>
												 	<tr>
												 		<th class="first-col">Type of Offer</th>
												 		<th>Discount</th>
												 		<th>Offer period</th>
												 	</tr>
												 </thead>
												 <tbody>
												 	<tr>
												 		<td class="first-col">Travel Insurance (single trip)</td>
												 		<td>25% off</td>
												 		<td>Year-round</td>
												 	</tr>
												 	<tr>
												 		<td class="first-col">Easy HomeCare Insurance</td>
												 		<td>8% off</td>
												 		<td>Year-round</td>
												 	</tr>
												 	<tr>
												 		<td class="first-col">Savie Insurance Plan</td>
												 		<td>20% off</td>
												 		<td>Year-round</td>
												 	</tr>
												 	<tr>
												 		<td class="first-col">Overseas StudyCare</td>
												 		<td>8% off</td>
												 		<td>Year-round</td>
												 	</tr>
												 </tbody>
											</table>
										</div>
									</div>	
									<!--referral program code-->
									<div class="tab-pane" id="ref-program">
										<div class="referral-program-container">
											<h3 class="heading-title hidden-xs hidden-sm">Referral program</h3>
											<p>Refer a friend to earn discounts and rewards now!</p>
											<div class="row" id="input-social-holder">
												<div class="col-xs-12 col-md-7" id="promo-input-holder">
													<input type="text" class="form-control gray-textbox promo-code-input" name="promo-code-link" value="https://uat-ecom.i.fwd.com.hk/en/home?promo=V3B68V"  readonly/>
												</div>
												<div class="col-xs-12 col-md-5" id="social-btns-holder">
													<ul class="nav nav-pills">
													  <li role="presentation" class="click-copy-btn"><a href="#" id="copy-link-btn">Copy link</a></li>
													  <li role="presentation" class="social-icon"><a id="fb-icon" href="#"><i class="fa fa-facebook"></i></a></li>
													  <li role="presentation" class="social-icon"><a id="twitter-icon" href="#"><i class="fa fa-twitter"></i></a></li>									
													  <li role="presentation" class="social-icon"><a id="gplus-icon" href="#"><img src="assets/images/savie-2016/gplus-icon.png" /></a></li>
													</ul>
												</div>
											</div>									
											<table class="table table-striped" id="referral-program-table">
												 <thead>
												 	<tr>
												 		<th class="first-col">Type of Offer</th>
												 		<th>Discount</th>
												 		<th>Offer period</th>
												 	</tr>
												 </thead>
												 <tbody>
												 	<tr>
												 		<td class="first-col">Travel Insurance (single trip)</td>
												 		<td>30% off</td>
												 		<td>One-off<sup>2</sup></td>
												 	</tr>
												 	<tr>
												 		<td class="first-col">Home Insurance</td>
												 		<td>30% off</td>
												 		<td>One-off<sup>2</sup></td>
												 	</tr>
												 	<tr>
												 		<td class="first-col">Savie Insurance Plan</td>
												 		<td>30% off</td>
												 		<td>One-off<sup>2</sup></td>
												 	</tr>
												 </tbody>
											</table>
											<p class="referral-notes"><sup>1</sup> Referral program is only applicable when the person you refer    	  has successfully purchased FWD TravelCare Insurance or Easy HomeCare Insurance.</p>
											<p class="referral-notes"><sup>2</sup> Please see the <a href="#">terms &amp; conditions</a> of our referral program.</p>
										</div>
									</div>	
									<!--fwd partner code-->	
									<div class="tab-pane" id="fwd-partner">
										<div class="fwd-partner-container">
											<h3 class="heading-title hidden-xs hidden-sm">FWD partner</h3>
											<p>Get offers from FWD partner!</p>									
											<table class="table table-striped" id="fwd-partner-table">
												 <thead>
												 	<tr>
												 		<th class="first-col">Type of Offer</th>
												 		<th>Discount</th>
												 		<th>Offer period</th>
												 	</tr>
												 </thead>
												 <tbody>
												 	<tr>
												 		<td class="first-col"><a href="#">Agoda</a></td>
												 		<td>8% off</td>
												 		<td>One-off</td>
												 	</tr>
												 	<tr>
												 		<td class="first-col"><a href="#">The Club</a></td>
												 		<td>8% off</td>
												 		<td>One-off</td>
												 	</tr>
												 	<tr>
												 		<td class="first-col"><a href="#">Agoda</a></td>
												 		<td>8% off</td>
												 		<td>One-off</td>
												 	</tr>												 	
												 </tbody>
											</table>
											<div id="partners-logo" class="visible-md visible-lg">
												<img src="assets/images/savie-2016/partner_theclub.png" id="the-club" />
												<img src="assets/images/savie-2016/partner_agoda.png" id="agoda" />
											</div>
										</div>
									</div>		
								</div>		
							</div>	
						</div>
					</div>
				</div>
			</div>
			
			<!-- Modal for resume application -->
			<div class="modal fade common-welcome-modal" id="retrieve-application-modal" tabindex="-1" role="dialog">
			  <div class="modal-dialog">
			    <div class="modal-content">
			    	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
			     	<h4 class="text-center welcome-msg">Welcome back! Chan Tai Man</h4>
			     	<p class="text-center description-msg">Do you want to resume your application or start over?</p>
			     	<center><button class="btn savie-common-btn" id="resume-btn">Resume</button><button class="btn savie-common-btn disabled-gray-btn" id="start-over-btn">Start over</button></center>
			    </div>
			  </div>
			</div>
			<div class="modal fade common-welcome-modal" id="review-fna-modal" tabindex="-1" role="dialog">
			  <div class="modal-dialog">
			    <div class="modal-content">
			    	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
			     	<h4 class="text-center welcome-msg">Welcome back! Chan Tai Man</h4>
			     	<p class="text-center description-msg">You have already completed a Financial Needs Analysis previously, you may review and edit your FNA for an updated Product Recommendation.</p>
			     	<center><button class="btn savie-common-btn" id="review-fna-btn">Review FNA</button></center>
			    </div>
			  </div>
			</div>
			
			<!-- Modal for application after 30 days -->
			<div class="modal fade common-welcome-modal" id="application-after-days" tabindex="-1" role="dialog">
			  <div class="modal-dialog">
			    <div class="modal-content">
			    	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
			     	<p class="text-center description-msg">The application must be completed within 30 days upon submission. The application has been expired. For any enquiry, please contact our 24-hour customer service hotline 3123-3123.</p>
			     	<center><button class="btn savie-common-btn" id="back-to-home-btn">Back to home</button></center>
			    </div>
			  </div>
			</div>
			
			<!-- FOOTER -->
			<%@include file="includes/footer-block.jsp" %>
		</div>
		
		<!-- JS INCLUDES -->
		<%@include file="includes/js-include.jsp" %>
		<script type="text/javascript">
			var language = "en";

			$(document).ready(function () {
				$(".dropdown-menu li a").click(function(){
				  var selText = $(this).text();
				  $(this).parents('.btn-group').find('.dropdown-toggle').html(selText+' <i class="fa fa-angle-down"></i>');
				  $('.dropdown-menu li').removeClass('active');
				  $(this).parent().addClass('active');
				  if($(this).parent('li').hasClass('dropdown-profile')) {
				  	$('.eservices').addClass('profile-active-page');
					$('.eservices').removeClass('insurance-active-page promo-active-page');
				  	$('.left-side-tab-menu').removeClass('active');
				  	$('.profile').addClass('active');
				  	$('#purchase-history-tab-contents').addClass('hidden');
					$('#eservices-tab-contents').removeClass('hidden');
					$('#promo-offers-tab-contents').addClass('hidden');
				  } else if($(this).parent('li').hasClass('dropdown-insurance-plan')) {
				  	$('.eservices').addClass('insurance-active-page');
					$('.eservices').removeClass('profile-active-page promo-active-page');
				  	$('.left-side-tab-menu').removeClass('active');
				  	$('.insurance-plan').addClass('active');
					$('#purchase-history-tab-contents').removeClass('hidden');
					$('#eservices-tab-contents').addClass('hidden');
					$('#promo-offers-tab-contents').addClass('hidden');
				  } else if($(this).parent('li').hasClass('dropdown-promo-offers')) {
				  	$('.eservices').addClass('promo-active-page');
					$('.eservices').removeClass('profile-active-page insurance-active-page');
				  	$('.fwd-savie-wrapper').attr('id', 'promo-page');
				  	$('.left-side-tab-menu').removeClass('active');
				  	$('.promo-offers').addClass('active');
					$('#promo-offers-tab-contents').removeClass('hidden');
					$('#eservices-tab-contents').addClass('hidden');
					$('#purchase-history-tab-contents').addClass('hidden');
				  }
				});

				$('.left-side-tab-menu').on('click', function () {
					$('.left-side-tab-menu').removeClass('active');
					$(this).addClass('active');
					if($(this).hasClass('profile')) {
						$('.eservices').addClass('profile-active-page');
						$('.eservices').removeClass('insurance-active-page promo-active-page');
						$('#purchase-history-tab-contents').addClass('hidden');
						$('#eservices-tab-contents').removeClass('hidden');
						$('#promo-offers-tab-contents').addClass('hidden');
						$('.mobile-dropdown').removeClass('active');
						$('.dropdown-profile').addClass('active');
						var selText = 'Profile';
				  		$('.dropdown-menu li a').parents('.btn-group').find('.dropdown-toggle').html(selText+' <i class="fa fa-angle-down"></i>');
					} else if ($(this).hasClass('insurance-plan')) {
						$('.eservices').addClass('insurance-active-page');
						$('.eservices').removeClass('profile-active-page promo-active-page');
						$('#purchase-history-tab-contents').removeClass('hidden');
						$('#eservices-tab-contents').addClass('hidden');
						$('#promo-offers-tab-contents').addClass('hidden');
						$('.mobile-dropdown').removeClass('active');
						$('.dropdown-insurance-plan').addClass('active');
						var selText = 'Insurance Plan';
				  		$('.dropdown-menu li a').parents('.btn-group').find('.dropdown-toggle').html(selText+' <i class="fa fa-angle-down"></i>');
					} else if ($(this).hasClass('promo-offers')) {
						$('.eservices').addClass('promo-active-page');
						$('.eservices').removeClass('profile-active-page insurance-active-page');
						$('#promo-offers-tab-contents').removeClass('hidden');
						$('#purchase-history-tab-contents').addClass('hidden');
						$('#eservices-tab-contents').addClass('hidden');
						$('.mobile-dropdown').removeClass('active');
						$('.dropdown-insurance-plan').addClass('active');
						var selText = 'Promo & Offers';
				  		$('.dropdown-menu li a').parents('.btn-group').find('.dropdown-toggle').html(selText+' <i class="fa fa-angle-down"></i>');
				  	}	
				});
				var winWidth = $(window).width();
				var computedWidth = winWidth - 180;
				if (winWidth < 992) {
					$('#copy-link-btn').css('width', computedWidth+'px' );
				}
				$(window).resize(function () {
					var winWidth = $(window).width();
					var computedWidth = winWidth - 180;
					if (winWidth < 972) {
						$('#copy-link-btn').css('width', computedWidth+'px' );
					} else {
						$('#copy-link-btn').css('width', '115px' );
					}
				});
			});
			
			// show application after 30 days modal
			function showApplicationAfterDaysModal() {
				$('#application-after-days').modal('show');
			}
		</script>
		
	</body>
</html>