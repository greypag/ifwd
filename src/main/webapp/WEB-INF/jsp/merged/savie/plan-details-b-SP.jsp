<%@page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<link rel="stylesheet" href="assets/css/material.min.css" />
		<%@include file="includes/head.jsp" %>
		<meta name="apple-mobile-web-app-capable" content="yes" />
	</head>
	<body>
		<%!
			boolean isSaleActiveClass = false;
			boolean isEservicesActiveClass = false;
		%>
		<div class="fwd-savie-wrapper savie-online-container with-breadcrumbs-steps" id="plan-details-b-page">
			<!-- HEADER -->
			<%@include file="includes/header-block.jsp" %>
			<div class="fwd-container container-fluid breadcrumbs">
				<div class="breadcrumb-container">
		            <ol class="breadcrumb breadcrumbs-product-details et-breadcrumbs">
					   <li><a href="#">Home</a></li>
		               <li class="divider"><i class="fa fa-play"></i></li>
		               <li><a href="#">Save </a></li>
		               <li class="divider"><i class="fa fa-play"></i></li>
		               <li><a href="#">Savie </a></li>
		               <li class="divider last"><i class="fa fa-play"></i></i></li>
		               <li class="active-bc" id="et-active-bc-menu">Application</li>
		            </ol>
		         </div>
		    </div>
		    <!-- STEPS -->
			<div class="container-fluid fwd-full-container browse-holder">
				<div class="application-page-header et-header-browse">
				   <div class="browse-container">
					  <div class="row reset-margin hidden-xs hidden-sm">
						 <ul class="common-steps-list six-steps nav nav-pills">
							<li class="step-number" id="first-step"><button type="button" class="et-header-info-btn active"><span class="status">1</span></i>Select plan</button></li>
							<li class="arrow-next-step"> <img src="assets/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
							<li class="step-number"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">2</span>Application &amp; payment</button></li>
							<li class="arrow-next-step"> <img src="assets/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
							<li class="step-number"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">3</span>Summary &amp; declaration</button></li>
							<li class="arrow-next-step"> <img src="assets/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
							<li class="step-number"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">4</span>Signature</button></li>
							<li class="arrow-next-step"> <img src="assets/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
							<li class="step-number"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">5</span>Document upload</button></li>
							<li class="arrow-next-step"> <img src="assets/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
							<li class="step-number"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">6</span>Confirmation</button></li>
						 </ul>
					 </div>
				   </div>  
				   <div class="et-mobile-header-info hidden-md hidden-lg">
					  <div class="clearfix">
						 <div class="et-back-arrow">
							<a href="#" class="back-arrow-link">
							   <span class="icon-arrow-left2 arrow-left"></span>
							</a>
						 </div>
						 <div class="et-header-tex">
							<h3 id="">Select Plan</h3>
						 </div>
						 <p id="step-of">1 of 6</p>
					  </div>
				   </div>
				</div>
			</div>
			<div class="container-fluid fwd-full-container mobile-step-indicator visible-xs visible-sm">
				<div class="step-indicator-container clearfix">
					<ul class="common-step-indicator six-steps nav nav-pills">
						 <li id="first-step"><a href="#" class="active"><span class="step-no">1</span></a></li>
						 <li><a href="#"><span class="step-no">2</span></a></li>
						 <li><a href="#"><span class="step-no">3</span></a></li>
						 <li><a href="#"><span class="step-no">4</span></a></li>
						 <li><a href="#"><span class="step-no">5</span></a></li>
						 <li id="last-step"><a href="#"><span class="step-no">6</span></a></li>
					</ul>
					<div class="step-line"></div>
				</div>
			</div>
			
			<div class="container-fluid fwd-full-container headerStick">
				<div class="plan-calculator-holder">
					<div class="fwd-container-limit container-fluid clearfix sidebar plan-form-holder">
						<div class="row">
							<h3 class="heading-title">Plan calculator <i data-toggle="tooltip" data-html="true" data-placement="right" title="<p class='bold'>One-off premium</p><p class='info-content'>You may have a one-off premium payment on savie insurance</p><p class='bold'>Regular payment</p><p class='info-content'>You may set up direct debit to pay premium on a monthly basis</p>" class="fa fa-info-circle info-tooltip"></i></h3>
							<div class="col-md-4 plan-payment-type">
								<div class="row">
									<div class="col-xs-12">							
										<div class="selectDiv centreDiv gray-text-bg" id="payment-type">
											<select name="payment-type" id="type-of-payment" class="form-control gray-dropdown" data-bv-field="payment-type">
											   <option value="regular-payment">Regular Payment</option>
											   <option value="one-off-premium" selected="">One-off premium</option>
											</select>
											<img src="assets/images/orange-caret.png" class="orange-caret-bg">
										</div>
									</div>
									<div class="col-xs-12 hidden" id="plan-amount-holder">
										<div class="selectDiv centreDiv gray-text-bg">
											<select name="plan-amount" id="plan-amount" class="form-control gray-dropdown" data-bv-field="plan-amount">
											   <option value="" disabled="" selected="">Amount (HK$)</option>
											   <option value="1">100,000</option>
											   <option value="2">200,000</option>
											</select>
											<img src="assets/images/orange-caret.png" class="orange-caret-bg">
										</div>
									</div>
									<div class="col-xs-12" id="amount-slide-holder">
										<div class="one-off-premium">
						                   <div class="pull-right">
						                   		<h3 class="amount-selected">HKD <span id="amount-value">100,000</span></h3>
						                   </div>
											<input type="text" class="span2 amount-slider" name="amount" value="" data-slider-min="30000" data-slider-max="400000" data-slider-step="1000" data-slider-value="100000" data-slider-id="RC" id="R" data-slider-tooltip="hide" data-slider-handle="square" />
											<div class="min-max-holder clearfix">
												<div class="pull-left text-center">
													<p>Min</p>
													<p>30,000</p>
												</div>
												<div class="pull-right text-center">
													<p>Max</p>
													<p>400,000</p>
												</div>
											</div>
										</div>
									</div>
									<div class="clearfix"></div>
								</div>									
							</div>
							<div class="col-md-4 plan-dob">
								<div class="row">
									<div class="col-xs-12">
										<div class="selectDiv centreDiv gray-text-bg" id="plan-dob">
											<input type="text" name="plan-dob" id="plan-dob-datepicker" placeholder="Date of birth" class="form-control" />
											<img src="assets/images/orange-caret.png" class="orange-caret-bg">
										</div>
									</div>
									<div class="col-xs-12 hidden" id="total-years-holder">
										<div class="selectDiv centreDiv gray-text-bg">
											<select name="total-payment-years" id="total-payment-years" class="form-control gray-dropdown" data-bv-field="total-payment-years">
											   <option value="3" selected="">3</option>
											</select>
											<img src="assets/images/orange-caret.png" class="orange-caret-bg">
										</div>
									</div>								
								</div>
							</div>
							<div class="col-xs-12 col-md-2 plan-promo-code">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield" class="promo-code">
						            <input class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input"  type="text" />
						           	<label class="mdl-textfield__label so-mdl-textfield-label" for="correspondenceAddress3">Promo code</label> 
					           	</div>
							</div>
							<div class="col-xs-12 col-md-2 plan-calculate">
								<button type="submit" class="btn savie-common-btn" id="plan-calculate-btn">Calculate</button>
							</div>
						</div>
					</div>
				</div>
				<div class="container-fluid fwd-container" id="plan-details-wrapper">
			<div class="pd-summary-table" id="table-content-pd">
				<div class="summary-table">
					<div class="summary-table-head clearfix">
						<h4 class="summary-note-title">Summary</h4>
						<p class="summary-note">You will receive <span class="received-money">HK$220,649</span> at the end of 3rd policy year</p>
					</div>
					<div class="table-content">					
						<div class="rate-table">
							<table class="table table-hover">
								<thead>
									<tr>
										<th class="first-head">End of<br />policy year</th>
										<th class="hidden-sm hidden-xs">Crediting<br />Rate (%) <span data-toggle="tooltip" data-html="true" data-placement="right" title="Crediting Rate (%)" class="glyphicon glyphicon-info-sign default-pointer"></span></th>
										<th>Total Premium<br />Paid (HK$) <span data-toggle="tooltip" data-html="true" data-placement="right" title="Total Premium Paid (HK$)" class="glyphicon glyphicon-info-sign hidden-sm hidden-xs default-pointer"></span></th>
										<th class="hidden-sm hidden-xs">Account<br />value (HK$) <span data-toggle="tooltip" data-html="true" data-placement="right" title="Account value (HK$)" class="glyphicon glyphicon-info-sign default-pointer"></span></th>
										<th>Surrender<br />Benefit (HK$) <span data-toggle="tooltip" data-html="true" data-placement="right" title="Surrender Benefit (HK$)" class="glyphicon glyphicon-info-sign hidden-sm hidden-xs default-pointer"></span></th>
										<th class="hidden-sm hidden-xs">Death Benefit (HK$) / <span data-toggle="tooltip" data-html="true" data-placement="right" title="Death Benefit (HK$)" class="glyphicon glyphicon-info-sign default-pointer"></span><br />Accidental Death Benefit (HK$) <span data-toggle="tooltip" data-html="true" data-placement="right" title="Accidental Death Benefit (HK$)" class="glyphicon glyphicon-info-sign default-pointer"></span></th>
									</tr>
								</thead>
								<tbody>
									<tr class="pinkish-shade">
										<td class="policy-credit policy-number bold">1</td>
										<td class="policy-credit hidden-sm hidden-xs" id="credit-rate-change-1">3</td>
										<td id="premium-1">100,000</td>
										<td class="hidden-sm hidden-xs" id="account-value-1">102,991</td>
										<td id="surrender-1">102,991</td>
										<td class="hidden-sm hidden-xs" id="death-1"><span data-toggle="tooltip" data-html="true" data-placement="right" title="Death Benefit (HK$) / Accidental Death Benefit (HK$)" class=" default-pointer">108,141 / 211,132</span></td>
									</tr>
									<tr>
										<td class="policy-credit policy-number bold">2</td>
										<td class="policy-credit hidden-sm hidden-xs" id="credit-rate-change-2">3</td>
										<td id="premium-2">100,000</td>
										<td class="hidden-sm hidden-xs" id="account-value-2">106,081</td>
										<td id="surrender-2">106,081</td>
										<td class="hidden-sm hidden-xs" id="death-2"><span data-toggle="tooltip" data-html="true" data-placement="right" title="Death Benefit (HK$) / Accidental Death Benefit (HK$)" class=" default-pointer">111,385 / 217,466</span></td>
									</tr>
									<tr class="pinkish-shade">
										<td class="policy-credit policy-number bold">3</td>
										<td class="policy-credit hidden-sm hidden-xs" id="credit-rate-change-3">3.3</td>
										<td id="premium-3">100,000</td>
										<td class="hidden-sm hidden-xs" id="account-value-3">110,324</td>
										<td id="surrender-3">110,324</td>
										<td class="hidden-sm hidden-xs" id="death-3"><span data-toggle="tooltip" data-html="true" data-placement="right" title="Death Benefit (HK$) / Accidental Death Benefit (HK$)" class=" default-pointer">115,841 / 226,165</span></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="after-3-years-container" id="after-3-years-container" style="display:none">
						<div class="crediting-rate">
							<h4 class="crediting-rate-title">Crediting rate : </h4>
							<div class="rate-buttons">
								<button data-toggle="tooltip" data-html="true" data-placement="right" title='<p class="bold">Conservative Basis</p><p class="info-content">Most adverse investment return scenario</p>' class="rate-btn active" id="rate-0" type="button">0%</button>
								<button class="rate-btn" id="rate-2" type="button">2%</button>
								<button id="rate-3" class="rate-btn" type="button">3%</button>
								<button class="rate-btn" id="rate-4" type="button">3.3%</button>
							</div>
						</div>
						<div class="table-content" id="after-3-years">
							<div id="rate-table-0" class="rate-table">
								<table class="table table-hover">
									<thead>
										<tr>
											<th class="first-head">End of<br />policy year</th>
											<th class="hidden-xs hidden-sm credit-rate">Crediting<br />Rate (%) <span data-toggle="tooltip" data-html="true" data-placement="right" title="Crediting Rate (%)" class="glyphicon glyphicon-info-sign default-pointer"></span></th>
											<th class="premium">Total Premium<br />Paid (HK$) <span data-toggle="tooltip" data-html="true" data-placement="right" title="Total Premium Paid (HK$)" class="glyphicon glyphicon-info-sign hidden-sm hidden-xs default-pointer"></span></th>
											<th class="hidden-sm hidden-xs">Account<br />value (HK$) <span data-toggle="tooltip" data-html="true" data-placement="right" title="Account value (HK$)" class="glyphicon glyphicon-info-sign default-pointer"></span></th>
											<th>Surrender<br />Benefit (HK$) <span data-toggle="tooltip" data-html="true" data-placement="right" title="Surrender Benefit (HK$)" class="glyphicon glyphicon-info-sign hidden-sm hidden-xs default-pointer"></span></th>
											<th class="hidden-sm hidden-xs">Death Benefit (HK$) / <span data-toggle="tooltip" data-html="true" data-placement="right" title="Death Benefit (HK$)" class="glyphicon glyphicon-info-sign default-pointer"></span><br />Accidental Death Benefit (HK$) <span data-toggle="tooltip" data-html="true" data-placement="right" title="Accidental Death Benefit (HK$)" class="glyphicon glyphicon-info-sign default-pointer"></span></th>
										</tr>
									</thead>
									<tbody>
										<tr id="new-table-added">
											<td class="policy-credit policy-number bold" id="policy-year-0-0">1</td>
											<td class="policy-credit hidden-sm hidden-xs" id="credit-rate-0-0">0</td> 
											<td id="premium-change-0-1">100,000</td> 
											<td class="hidden-sm hidden-xs" id="account-value-change-0-0">110,324</td>    
											<td id="surrender-change-0-0">110,324</td>
											<td class="hidden-sm hidden-xs" id="death-change-0-0"><span data-toggle="tooltip" data-html="true" data-placement="right" title="Death Benefit (HK$) / Accidental Death Benefit (HK$)" class=" default-pointer">115,841 / 226,165</span></td>
										</tr>
										<tr class="pinkish-shade">    
											<td class="policy-credit policy-number bold" id="policy-year-0-1">5</td>
											<td class="policy-credit hidden-sm hidden-xs" id="credit-rate-0-1">0</td> 
											<td id="premium-change-0-1">100,000</td> 
											<td class="hidden-sm hidden-xs" id="account-value-change-0-1">110,324</td>    
											<td id="surrender-change-0-1">110,324</td>
											<td class="hidden-sm hidden-xs" id="death-change-0-1"><span data-toggle="tooltip" data-html="true" data-placement="right" title="Death Benefit (HK$) / Accidental Death Benefit (HK$)" class=" default-pointer">115,841 / 226,165</span></td>
										</tr>
										<tr>
											<td class="policy-credit policy-number bold" id="policy-year-0-2">10</td> 
											<td class="policy-credit hidden-sm hidden-xs" id="credit-rate-0-2">0</td>
											<td id="premium-change-0-2">100,000</td> 
											<td class="hidden-sm hidden-xs" id="account-value-change-0-2">110,324</td>    
											<td id="surrender-change-0-2">110,324</td>
											<td class="hidden-sm hidden-xs" id="death-change-0-2"><span data-toggle="tooltip" data-html="true" data-placement="right" title="Death Benefit (HK$) / Accidental Death Benefit (HK$)" class=" default-pointer">115,841 / 226,165</span></td>
										</tr>
										<tr class="pinkish-shade">
											<td class="policy-credit policy-number bold" id="policy-year-0-3">20</td> 
											<td class="policy-credit hidden-sm hidden-xs" id="credit-rate-0-3">0</td>
											<td id="premium-change-0-3">100,000</td> 
											<td class="hidden-sm hidden-xs" id="account-value-change-0-3">110,324</td>    
											<td id="surrender-change-0-3">110,324</td>
											<td class="hidden-sm hidden-xs" id="death-change-0-3"><span data-toggle="tooltip" data-html="true" data-placement="right" title="Death Benefit (HK$) / Accidental Death Benefit (HK$)" class=" default-pointer">115,841 / 226,165</span></td>
										</tr>
										<tr>
											<td class="policy-credit policy-number bold" id="policy-year-0-4">55</td> 
											<td class="policy-credit hidden-sm hidden-xs" id="credit-rate-0-4">0</td>
											<td id="premium-change-0-4">100,000</td> 
											<td class="hidden-sm hidden-xs" id="account-value-change-0-4">110,324</td>    
											<td id="surrender-change-0-4">110,324</td>
											<td class="hidden-sm hidden-xs" id="death-change-0-4"><span data-toggle="tooltip" data-html="true" data-placement="right" title="Death Benefit (HK$) / Accidental Death Benefit (HK$)" class=" default-pointer">115,841 / 226,165</span></td>
										</tr>
										<tr class="pinkish-shade">
											<td class="policy-credit policy-number bold" id="policy-year-0-5">60</td> 
											<td class="policy-credit hidden-sm hidden-xs" id="credit-rate-0-5">0</td>
											<td id="premium-change-0-5">100,000</td> 
											<td class="hidden-sm hidden-xs" id="account-value-change-0-5">110,324</td>    
											<td id="surrender-change-0-5">110,324</td>
											<td class="hidden-sm hidden-xs" id="death-change-0-5"><span data-toggle="tooltip" data-html="true" data-placement="right" title="Death Benefit (HK$) / Accidental Death Benefit (HK$)" class=" default-pointer">115,841 / 226,165</span></td>
										</tr>
										<tr>
											<td class="policy-credit policy-number bold" id="policy-year-0-6">100</td>
											<td class="policy-credit hidden-sm hidden-xs" id="credit-rate-0-6">0</td>
											<td id="premium-change-0-6">100,000</td> 
											<td class="hidden-sm hidden-xs" id="account-value-change-0-6">110,324</td>    
											<td id="surrender-change-0-6">110,324</td>
											<td class="hidden-sm hidden-xs" id="death-change-0-6"><span data-toggle="tooltip" data-html="true" data-placement="right" title="Death Benefit (HK$) / Accidental Death Benefit (HK$)" class=" default-pointer">115,841 / 226,165</span></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="after-3-years-btn">
						<button type="button" class="white-btn up" id="first-3-years-btn" onclick="toggleImg()"><span id="after-3">After 3 years </span><span id="first-3" class="hidden">First 3 years </span><img id="arrow-img-years" src="assets/images/savie-2016/arrow-down2.png" /></button>
					</div>
				</div>
			</div>
			<div class="plan-details-note-container hidden-sm hidden-xs">
				<h5>Note</h5>
				<ul>
					<li>This summary is for illustrative and information purposes only. This summary is not an insurance illustration document or insurance contract, nor it does not belong to or constitute part of an insurance illustration or insurance contract.</li>
					<li>All values in this summary are rounded down to the dollar amount and may differ slightly from the actual values in the policy. All premium paid begin accruing interest on the following day.</li>
					<li>Please refer to the sales illustration provided by our professional Customer Service Representatives for more information.</li>
				</ul>
			</div>
			<div id="plan-details-sample-and-faq">
				<div id="pd-sf-tabs-container" class="container-fluid content-container-fluid">
				   <ul id="pd-sf-nav-tabs" class="nav nav-tabs" role="tablist">
						<li class="pd-sf-tab text-center" role="presentation">
							<a href="#sale-illustration-sample" class="bold" aria-controls="sale-illustration-sample" role="tab" data-toggle="tab">Key Product Risks &amp; Exclusions</a>
						</li>
						<li class="pd-sf-tab pd-sf-tab-right text-center active" role="presentation">
							<a href="#faq-and-glossary" class="bold" aria-controls="faq-and-glossary" role="tab" data-toggle="tab">FAQ &amp; Glossary</a>
						</li>
				   </ul>
				</div>
				<div class="pd-sf-divider"></div>
				<div id="pd-sf-tab-content-container" class="container-fluid content-container-fluid">
					<div class="tab-content">
						<div role="tabpanel" class="tab-pane" id="pd-sf-sale-illustration-sample"></div>
						<div role="tabpanel" class="tab-pane active" id="pd-sf-faq-and-glossary-pane">
							<div class="panel-group" id="pd-sf-faq-and-glossary-group" role="tablist" aria-multiselectable="true">
								<div class="panel panel-default pd-sf-faq-and-glossary-panel">
								   <div class="panel-heading" role="tab" id="pd-sf-product-related">
									  <h4 class="panel-title">
										 <a class="collapsed" role="button" data-toggle="collapse" data-parent="#pd-sf-faq-and-glossary-group" href="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
											Product related questions
											<span class="pull-right">
											   <img src="assets/images/savie-2016/arrow-down1.png" />
											</span>
										 </a>
									  </h4>
								   </div>
								   <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="pd-sf-product-related">
									  <div class="panel-body">
										 Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
									  </div>
								   </div>
								</div>
								<div class="panel panel-default pd-sf-faq-and-glossary-panel">
								   <div class="panel-heading" role="tab" id="pd-sf-claim-related">
									  <h4 class="panel-title">
										 <a class="collapsed" role="button" data-toggle="collapse" data-parent="#pd-sf-faq-and-glossary-group" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
											Claim related questions
											<span class="pull-right">
											   <img src="assets/images/savie-2016/arrow-down1.png" />
											</span>
										 </a>
									  </h4>
								   </div>
								   <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="pd-sf-claim-related">
									  <div class="panel-body">
										 Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
									  </div>
								   </div>
								</div>
								<div class="panel panel-default pd-sf-faq-and-glossary-panel">
								   <div class="panel-heading" role="tab" id="pd-sf-withdrawal">
									  <h4 class="panel-title">
										 <a class="collapsed" role="button" data-toggle="collapse" data-parent="#pd-sf-faq-and-glossary-group" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
											Withdrawal related questions
											<span class="pull-right">
											   <img src="assets/images/savie-2016/arrow-down1.png" />
											</span>
										 </a>
									  </h4>
								   </div>
								   <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="pd-sf-withdrawal">
									  <div class="panel-body">
										 Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
									  </div>
								   </div>
								</div>
								<div class="panel panel-default pd-sf-faq-and-glossary-panel">
								   <div class="panel-heading" role="tab" id="pd-sf-glossary">
									  <h4 class="panel-title">
										 <a class="collapsed" role="button" data-toggle="collapse" data-parent="#pd-sf-faq-and-glossary-group" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
											Glossary
											<span class="pull-right">
											   <img src="assets/images/savie-2016/arrow-down1.png" />
											</span>
										 </a>
									  </h4>
								   </div>
								   <div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="pd-sf-glossary">
									  <div class="panel-body">
										 Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
									  </div>
								   </div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="next-btn text-center">
					<button type="button" class="btn plan-details-btn savie-common-btn">Proceed to your sales illustration</button>
					<a href="#" class="pd-link">Apply at Customer Service Centre</a>
				</div>
			</div>
        </div>
			</div>
			<!-- FOOTER -->
			<%@include file="includes/footer-block.jsp" %>
		</div>
		
		<!-- JS INCLUDES -->
		<%@include file="includes/js-include.jsp" %>
		<script type="text/javascript" src="assets/js/savie-2016/bootstrap-slider.js"></script>
		<script type="text/javascript">
			var language = "en";
			$(document).ready(function () {
				$('#first-3-years-btn').on('click', function () {
					$('#after-3-years-container').toggle();
				});
				
				var value = $('#policy-year-0-1').html();
				$(document).on('change','#total-payment-years',function() {
					$('#policy-year-0-1').html('');
					if($(this).val() > 65) {
						//$('#new-table-added').removeClass('hidden');
						$('#policy-year-0-1').html(value+"<span id='payment-ends'>(Payment ends)</span>");
					} else {
						//$('#new-table-added').addClass('hidden');
						$('#policy-year-0-1').html(value);
					}
				});
			});
			// changing first/after 3 years button content
			function toggleImg() {
				if($('#first-3-years-btn').hasClass('up')) {
					$('#after-3').addClass('hidden');
					$('#first-3').removeClass('hidden');
					document.getElementById('arrow-img-years').src='assets/images/savie-2016/arrow-up2.png';
					$('#first-3-years-btn').addClass('down');
					$('#first-3-years-btn').removeClass('up');
				} else {
					$('#after-3').removeClass('hidden');
					$('#first-3').addClass('hidden');
					document.getElementById('arrow-img-years').src='assets/images/savie-2016/arrow-down2.png';
					$('#first-3-years-btn').addClass('up');
					$('#first-3-years-btn').removeClass('down');
				}
				return false;
			}
		</script>
	</body>
</html>