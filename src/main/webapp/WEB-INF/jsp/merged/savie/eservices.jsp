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
		<div class="fwd-savie-wrapper" id="eservices-page">
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
			<div class="container-fluid fwd-full-container" id="savie-online-purchase-history">
				<div class="fwd-container-limit clearfix sidebar">
					<div class="row" id="purchase-history-page">
						<h2>FWD member account</h2>
						<div class="btn-group account-dropdown hidden-md hidden-lg clearfix">
	                        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
	                            <span class="button-text">Insurance plan</span>
	                            <i class="fa fa-angle-down"></i>
	                        </button>
	                        <ul class="dropdown-menu" role="menu">
	                            <li class="mobile-dropdown dropdown-profile active"><a href="#" data-toggle="tab" aria-expanded="true">Profile</a></li>
	                            <li class="mobile-dropdown dropdown-insurance-plan"><a href="#" data-toggle="tab" aria-expanded="true">Insurance plan</a></li>
	                            <li class="mobile-dropdown dropdown-promo-offers"><a href="#" data-toggle="tab" aria-expanded="true">Promo &amp; offers</a></li>
	                        </ul>
	                    </div>
						<div class="col-md-3 side-menu hidden-xs hidden-sm">
							<ul class="nav nav-pills nav-stacked">
								<li class="left-side-tab-menu profile active" id="profile-tab-link"><a href="#"><span class="side-menu-icon hidden-xs hidden-sm" id="profile"></span>Profile</a></li>
								<li class="left-side-tab-menu insurance-plan" id="insurance-plan-tab-link"><a href="#"><span class="side-menu-icon  hidden-xs hidden-sm" id="insurance-plan"></span>Insurance plan</a></li>
								<li class="left-side-tab-menu promo-offers" id="promo-offers-tab-link"><a href="#"><span class="side-menu-icon  hidden-xs hidden-sm" id="promo-offers"></span>Promo &amp; offers</a></li>
							</ul>
						</div>
						<div class="col-xs-12 col-md-9 right-side-content">
							<div id="purchase-history-tab-contents" class="hidden">
								<ul class="nav nav-tabs nav-justified">
									<li class="active"><a href="#pending" data-toggle="tab">Pending</a></li>
									<li><a href="#active" data-toggle="tab">Active</a></li>
									<li id="past-tab"><a href="#past" data-toggle="tab">Past</a></li>
								</ul>
								<div class="tab-content">
									<div class="tab-pane active" id="pending">
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
										<!--TRAVEL -->	
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
										<!--SAVING INSURANCE -->
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
									<div class="tab-pane" id="active">
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
										<!--TRAVEL -->	
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
										<!--SAVING INSURANCE -->
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
									<div class="tab-pane" id="past">
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
										<!--TRAVEL -->	
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
										<!--SAVING INSURANCE -->
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
								<p id="note"><span id="orange-ast">*</span> Amount indicative only. Please call our 24-hour hotline at 3123 3123 for up-to-date account value. </p>
							</div>
							<div id="eservices-tab-contents">
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
						</div>
					</div>
				</div>
			</div>
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
				  	$('.fwd-savie-wrapper').attr('id', 'eservices-page');
				  	$('.left-side-tab-menu').removeClass('active');
				  	$('.profile').addClass('active');
				  	$('#purchase-history-tab-contents').addClass('hidden');
					$('#eservices-tab-contents').removeClass('hidden');
				  } else if($(this).parent('li').hasClass('dropdown-insurance-plan')) {
				  	$('.fwd-savie-wrapper').removeAttr('id');
				  	$('.left-side-tab-menu').removeClass('active');
				  	$('.insurance-plan').addClass('active');
					$('#purchase-history-tab-contents').removeClass('hidden');
					$('#eservices-tab-contents').addClass('hidden');
				  }
				});

				$('.left-side-tab-menu').on('click', function () {
					$('.left-side-tab-menu').removeClass('active');
					$(this).addClass('active');
					if($(this).hasClass('profile')) {
						$('.fwd-savie-wrapper').attr('id', 'eservices-page');
						$('#purchase-history-tab-contents').addClass('hidden');
						$('#eservices-tab-contents').removeClass('hidden');
						$('.mobile-dropdown').removeClass('active');
						$('.dropdown-profile').addClass('active');
						var selText = 'Profile';
				  		$('.dropdown-menu li a').parents('.btn-group').find('.dropdown-toggle').html(selText+' <i class="fa fa-angle-down"></i>');
					} else if ($(this).hasClass('insurance-plan')) {
						$('.fwd-savie-wrapper').removeAttr('id');
						$('#purchase-history-tab-contents').removeClass('hidden');
						$('#eservices-tab-contents').addClass('hidden');
						$('.mobile-dropdown').removeClass('active');
						$('.dropdown-insurance-plan').addClass('active');
						var selText = 'Insurance Plan';
				  		$('.dropdown-menu li a').parents('.btn-group').find('.dropdown-toggle').html(selText+' <i class="fa fa-angle-down"></i>');
					}
				});
			});
		</script>
		
	</body>
</html>