<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> %>
<!DOCTYPE html>
<html lang="en">
	<head>
	</head>
	<body class="page-sales-illustration">
		<%!
			boolean isSaleActiveClass = false;
		%>
		<div class="fwd-wrapper">			
			<!--Top Header-->
		
			<!--Sales Illustration Block-->
			<div class="fwd-container container-fluid hidden-xs hidden-sm clearfix">
				<div class="breadcrumbs pull-left">
					<ol class="breadcrumb breadcrumbs-product-details breadcrumbs-landing">
						<li><a href="#">Save</a></li>
						<li class="divider"><i class="fa fa-play"></i></li>
						<li><a href="#">Savie</a></li>
						<li class="divider last"><i class="fa fa-play"></i></li>
						<li class="active-bc">Sales illustration</li>
					</ol>
				</div>
				<div id="questions" class="text-center pull-right">
					<img src="assets/images/question.png">              
					<a href="#">
						<div class="right">                 
							<h3>Questions ?</h3> <p>Talk to us now<i class="glyphicon glyphicon-play"></i></p> 
						</div>
					</a>
				</div>
			</div>

			<div class="fwd-full-container container-fluid text-center sales-head">
				<h1>Sales illustration</h1>
			</div>
			
			<div id="illustration-filters" class="fwd-full-container container-fluid">

				<form class="fwd-container-limit">
					<div id="triangle"></div>
					<img class="money" src="assets/images/money-logo.png">
					<div id="investment-amount">    
						<div id="desktop-left">
							<h3 class="saving">Savings amount<img class="i" src="assets/images/i.png"></h3>
							<div id="left" class="pull-left">
								<p>Min</p>
								<p>30,000</p>
							</div>

							<div id="right" class="pull-right">
								<p>Max</p>
								<p>400,000</p>
							</div>

							<input type="text" class="span2" name="amount" value="" data-slider-min="30000" data-slider-max="400000" data-slider-step="1" data-slider-value="60000" data-slider-id="RC" id="R" data-slider-tooltip="hide" data-slider-handle="square" />

							<h3 class="pull-right total"><span id="range">60,000</span></h3>
							<label id="hkd" class="pull-right total">HK<span>$</span></label>
						</div>

						<div id="desktop-right">
							<img class="promo-code hidden-xs hidden-sm" src="assets/images/promo-img.png">
							<h2 id="promo">Promo Code<img class="i" src="assets/images/i.png"></h2>
							<input name="promocode" type="text" placeholder="eg: SAVIE50" class="promocode">
						</div>

					   <p id="crediting-rate" class="text-center">Guaranteed crediting rate 3%, 3%, 4%</p>
					</div>

					<div id="information">
						<div id="pictures">
							<img id="birthday" src="assets/images/birthday.png">
						</div>

						<h2>Date of Birth<img class="i" src="assets/images/i.png"></h2>

						<div id="birthday">
							<div class="input-group input-append date" id="datePicker">
								<input type="text" class="date" name="dob" id="dates" placeholder="28th May 1996" readonly />
								<span class="input-group-addon add-on"><img class="arrow" src="assets/images/arrow-down.png"></span>                        
							</div>
						</div>
					</div>
				</form>
			</div>
			
			<!-- Investment Summary and Table Block-->
			<div class="fwd-full-container container-fluid investment">		
				<div class="fwd-container-limit investment-summary-and-table">
					<div id="sales-contents" class="tab-content credits">
	                    <div>
	                        <div class="container-fluid summary-tab-max-width">
	                            <div class="investment-table-desktop">
	                                <h2>Summary<img src="assets/images/salesIllustration/investment-info.png" class="img-desktop-only"> </h2>
	                                <h3>1-3 year guaranteed (HK$)</h3>
	                            </div>
	                            <div class="rate-table">
	                                <table class="table table-hover">
	                                    <thead>
	                                    <tr>
	                                        <th class="left-border">End of<span>policy year<img src="assets/images/salesIllustration/investment-info.png" class="img-desktop-only"></span></th>
	                                        <th class="premium"><span class="hidden-xs hidden-sm">Total premium paid</span><span class="hidden-md hidden-lg">Premium paid</span><img src="assets/images/salesIllustration/investment-info.png" class="img-desktop-only"></th>
	                                        <th class="desktop-only">Account value<img src="assets/images/salesIllustration/investment-info.png" class="img-desktop-only"></th>
	                                        <th class="right-border">Surrender benefit<img src="assets/images/salesIllustration/investment-info.png" class="img-desktop-only"></th>
	                                    </tr>
	                                    </thead>
	                                    <tbody>
	                                        <tr>    <td class="left-border">1</td>  <td class="black-text"><span>$</span> 100,000</td> <td class="black-text desktop-only"><span>$</span> 100,000</td>    <td class="black-text right-border"><span>$</span> 100,000</td>    </tr>
	                                        <tr>    <td class="left-border">2</td>  <td class="black-text"><span>$</span> 100,000</td> <td class="black-text desktop-only"><span>$</span> 100,000</td>    <td class="black-text right-border"><span>$</span> 100,000</td>    </tr>
	                                        <tr class="bottom-border">  <td class="left-border">3</td>  <td class="black-text"><span>$</span> 100,000</td> <td class="black-text desktop-only"><span>$</span> 100,000</td>    <td class="black-text right-border"><span>$</span> 100,000</td>    </tr>
	                                    </tbody>
	                                </table>
	                            </div>
	                        </div>
	                    </div>
	                    <div>   
	                        <div class="container-fluid summary-tab-max-width">
	                            <div class="investment-summary-title-desktop">
	                                <div class="row percent-buttons" >
										<div class="col-md-6 col-xs-12 after-year-three">
	                                        <h3>After year 3 non guaranteed (HK$)</h3>
											<p class="hidden-md hidden-lg text-center">Check the return of different crediting rate</p>
	                                    </div>  
	                                    <div class="col-md-6 col-xs-12 fwd-chart-col">
	                                        <div class="clearfix right-side">
	                                            <div class="left-side hidden-xs hidden-sm">
	                                                <p class="rate-text">Crediting rate</p>
	                                            </div>
	                                            <div class="left-side chart-button-left">
	                                                <button id="zero-rate" type="button">0%</button>
	                                            </div>
	                                            <div class="left-side chart-button-left">
	                                                <button id="two-rate" type="button" >2%</button>
	                                            </div>
	                                            <div class="left-side chart-button-right">
	                                                <button id="three-rate" class="active" type="button">3%</button>
	                                            </div>
	                                            <div class="left-side chart-button-right">
	                                                <button id="four-rate" type="button">4%</button>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>                                
	                            </div>
	                            <div class="investment-summary">
									<p class="surrender-benefit">Surrender <span>benefit</span> (HK$ ‘000)</p>
									<div id="illustration-chart"></div>
									<div class="drag-more">
										<div>
											<span class="drag-more-text">Drag to<br />view more <span class="glyphicon glyphicon-play"></span></span>
										</div>
									</div>
	                            </div>
	                        </div>
	                    </div>
					</div>
				</div>
			</div>

			<!-- Email Block -->
			<div class="fwd-container container-fluid">     
				<div class="row email-row">
					<div class="col-xs-12 col-md-6 email-me pull-left">
						<img src="assets/images/email-mob.png">
						<h5>Email me a complete sales Illustration table<span class="hidden-xs hidden-sm">.</span></h5>
					</div>
					<div class="col-xs-12 col-md-6 email-input pull-right">
						<form class="text-center">
							<input name="email" type="email" class="email-text" onkeyup="return forceLower(this);" placeholder="Enter your email address" />
							<button type="submit" class="email-btn">Submit</button>
						</form>
					</div>
				</div>
			</div>
			
			
			<!--Explanation Block-->
			<div class="fwd-container container-fluid reset-padding explanation-block">
				<button class="btn btn-gray explanation-button" type="button" data-toggle="collapse" data-target="#collapseExplanation" aria-expanded="false" aria-controls="collapseExplanation" id="explanation-button">
					Explanation
				</button>
				<span class="explanation">Explanation</span>
				<div class="collapse" id="collapseExplanation">
					<ul class="explanation-list">
						<li class="explanation-li">
							<p class="expl-txt">The above is only a summary illustration of the major benefits of your Policy. You should refer to the Company for more information or, if appropriate, a more detailed proposal.</p>
						</li>
						<li class="explanation-li">
							<p class="expl-txt">The Basic Plan Illustration in Section 1 and 2 relates only to your Basic Plan and assumes that all premiums are paid in full when due without exercising skip premium option (premium holiday) and the current scale of charges remain unchanged. </p>
						</li>
						<li class="explanation-li">
							<p class="expl-txt">Death Benefit is equal to the sum of initial sum insured and account value throughout the policy term. Besides Death Benefit, an additional accidental death benefit equivalent to 100% of the Account Value or HK$400,000, whichever is lower, will be offered.</p>
						</li>
						<li class="explanation-li">
							<p class="expl-txt">All values in this illustration are rounded to the nearest dollar and will be different comparing to actual values. Illustrated values in Section 1 and 2 apply only when the Policy is inforce.</p>
						</li>
						<li class="explanation-li">
							<p class="expl-txt">Withdrawal Charges are 3% of the withdrawal amount for the first 3 policy years. The Withdrawal Charges will be deducted from the Account Value if you fully surrender your policy or partially withdraw an amount during the first 3 policy years.</p>
						</li>
						<li class="explanation-li">
							<p class="expl-txt">The total surrender value and death benefits payable shown in Section 1 Guaranteed Basis are calculated based on "Guaranteed Crediting Rate" in the first 3 policy years. You may decide fully surrender your policy after first 3 policy years or keep your Policy for longer period.</p>
						</li>
						<li class="explanation-li">
							<p class="expl-txt">The total surrender value and death benefits payable shown in Section 2 Non-guaranteed Basis are applicable after policy year 3 and calculated based on "Assumed Declared Rates" remain unchanged throughout the term of the policy. These rates are for illustrative purposes only and are neither guaranteed nor based on past performance. The actual return may be different.</p>
						</li>
						<li class="explanation-li">
							<p class="expl-txt">Current Rate declared by the Company shall in no way be interpreted as a projection or estimation of the future return after policy year 3. Future declared rate after policy year 3 may be higher or lower than the illustrated rate. Please refer to the Company’s website for the latest declared rate.</p>
						</li>
					</ul>
				</div>
			</div>
			
			<!-- Mobile Next Button -->
			<!--<div class="fwd-full-container container-fluid next-sales-block box-container hidden-md hidden-lg">
				<div class="fwd-container-limit">
					<button href="#" class="btn next-btn btn-orange">Next</button>
				</div>
			</div>-->
			<div class="fwd-full-container container-fluid made-your-decision-section">
				<div class="fwd-container-limit padding-to-zero">
					<div class="clearfix">
						<div class="pull-left left-width">
							<img src="assets/images/salesIllustration/explanation-image.png" class="img-responsive img-padding-left">
						</div>
						<div class="pull-left right-width">
							<div class="row">
								<div class="col-xs-12 col-md-8 text-padding">
									<h6>Made your decision?</h6>
									<p class="started">If you are happy with the numbers above, 
									let’s get started.</p>
								</div>
								<div class="col-xs-12 col-md-4 button-padding">
									<button id="made-decision-next-btn" type="button" class="btn btn-orange btn-explanation">Next</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<a href="#" id="gotop" class="go-top go-top-default"><img src="assets/images/back-to-top.png"></a> 
			
			<!-- FOOTER -->
		</div>
		<!-- JS INCLUDES -->
		<!--For Sales Illustration page js-->
		<script src="assets/js/bootstrap-slider.js"></script>
		<script src="assets/js/highcharts.js"></script>
		<script src="assets/js/fwd-chart.js"></script>		
	</body>
</html>