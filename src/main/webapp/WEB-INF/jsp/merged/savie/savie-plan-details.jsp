<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeQuoteBean"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
	<div class="page-sales-illustration">
			<!--Sales Illustration Block-->
			<div class="fwd-container container-fluid hidden-xs hidden-sm clearfix">
				<div class="breadcrumbs pull-left">
					<ol class="breadcrumb breadcrumbs-product-details breadcrumbs-landing">
						<li><a href="#"><fmt:message key="savie.plan.details.Save" bundle="${msg}" /></a></li>
						<li class="divider"><i class="fa fa-play"></i></li>
						<li><a href="#"><fmt:message key="savie.plan.details.Savie" bundle="${msg}" /></a></li>
						<li class="divider last"><i class="fa fa-play"></i></li>
						<li class="active-bc"><fmt:message key="savie.plan.details.plan.details" bundle="${msg}" /></li>
					</ol>
				</div>
				<div id="questions" class="text-center pull-right">
					<img src="<%=request.getContextPath()%>/resources/images/savie/question.png">              
					<a href="${nextPageFlow}">
						<div class="right">                 
							<h3><fmt:message key="savie.plan.details.Questions" bundle="${msg}" /></h3> <p><fmt:message key="savie.plan.details.Talk.us" bundle="${msg}" /><i class="glyphicon glyphicon-play"></i></p> 
						</div>
					</a>
				</div>
			</div>

			<div class="fwd-full-container container-fluid text-center sales-head">
				<h1><fmt:message key="savie.plan.details.plan.details" bundle="${msg}" /></h1>
			</div>
			
			<div id="illustration-filters" class="fwd-full-container container-fluid">

				<form class="fwd-container-limit">
				    <input type="hidden" id="language" value="${language }"/>
					<div id="triangle"></div>
					<img class="money" src="<%=request.getContextPath()%>/resources/images/savie/money-logo.png">
					<div id="investment-amount">    
						<div id="desktop-left">
							<h3 class="saving"><fmt:message key="savie.plan.details.Savings.amount" bundle="${msg}" /><img class="i" src="<%=request.getContextPath()%>/resources/images/savie/i.png"></h3>
							<div id="left" class="pull-left">
								<p><fmt:message key="savie.plan.details.Min" bundle="${msg}" /></p>
								<p>$30,000</p>
							</div>

							<div id="right" class="pull-right">
								<p><fmt:message key="savie.plan.details.Max" bundle="${msg}" /></p>
								<p>$400,000</p>
							</div>

							<input type="text" class="span2" name="amount" value="" data-slider-min="30000" data-slider-max="400000" data-slider-step="100" data-slider-value="60000" data-slider-id="RC" id="R" data-slider-tooltip="hide" data-slider-handle="square" />

							<h3 class="pull-right total"><span id="range">60,000</span></h3>
							<label id="hkd" class="pull-right total"><fmt:message key="savie.plan.details.HK" bundle="${msg}" /></label>
						</div>

						<div id="desktop-right">
							<img class="promo-code hidden-xs hidden-sm" src="<%=request.getContextPath()%>/resources/images/savie/promo-img.png">
							<h2 id="promo">Promo Code<img class="i" src="<%=request.getContextPath()%>/resources/images/savie/i.png"></h2>
							<input name="promocode" id="promocode" type="text" placeholder="eg: SAVIE50" class="promocode">
						</div>

					   <p id="crediting-rate" class="text-center"><fmt:message key="savie.plan.details.Guaranteed.rate" bundle="${msg}" /></p>
					</div>

					<div id="information">
						<div id="pictures">
							<img id="birthday" src="<%=request.getContextPath()%>/resources/images/savie/birthday.png">
						</div>

						<h2><fmt:message key="savie.plan.details.Date.Birth" bundle="${msg}" /><img class="i" src="<%=request.getContextPath()%>/resources/images/savie/i.png"></h2>

						<div id="birthday">
							<div class="input-group input-append date" id="datePicker">
								<input type="text" class="date" name="dob" id="dates" placeholder="28th May 1996" readonly />
								<input type="hidden" id="birthOfDay" value="05/28/1995"/>
								<span class="input-group-addon add-on"><img class="arrow" src="<%=request.getContextPath()%>/resources/images/savie/arrow-down.png"></span>                        
							</div>
						</div>
						
						<div class="apply">
							<button onclick='getSavieIllustration()' class="next" type="button" id="sales-illu-apply-now">Apply now<span class="icon icon-chevron-thin-right"></span></button>
						</div>
					</div>
				</form>
			</div>
			<!-- <div align="center" style="margin-top: 10px;">
			    <input type="button" onclick='getSavieIllustration()' class="btn btn-orange" value="getData"/>
			</div> -->
			
			<!-- Investment Summary and Table Block-->
			<div class="fwd-full-container container-fluid investment">		
				<div class="fwd-container-limit investment-summary-and-table">
					<div id="sales-contents" class="tab-content credits">
	                    <div>
	                        <div class="container-fluid summary-tab-max-width">
	                            <div class="investment-table-desktop">
	                                <h2><fmt:message key="savie.plan.details.Summary" bundle="${msg}" /><img src="<%=request.getContextPath()%>/resources/images/savie/investment-info.png" class="img-desktop-only"> </h2>
	                                <h3><fmt:message key="savie.plan.details.year.guaranteed" bundle="${msg}" /></h3>
	                            </div>
	                            <div class="rate-table">
	                                <table class="table table-hover">
	                                    <thead>
	                                    <tr>
	                                        <th class="left-border"><fmt:message key="savie.plan.details.End.of" bundle="${msg}" /><span><fmt:message key="savie.plan.details.policy.year" bundle="${msg}" /><img src="<%=request.getContextPath()%>/resources/images/savie/investment-info.png" class="img-desktop-only"></span></th>
	                                        <th class="premium"><span class="hidden-xs hidden-sm"><fmt:message key="savie.plan.details.Total.paid" bundle="${msg}" /></span><span class="hidden-md hidden-lg"><fmt:message key="savie.plan.details.Premium.paid" bundle="${msg}" /></span><img src="<%=request.getContextPath()%>/resources/images/savie/investment-info.png" class="img-desktop-only"></th>
	                                        <th class="desktop-only"><fmt:message key="savie.plan.details.Account.value" bundle="${msg}" /><img src="<%=request.getContextPath()%>/resources/images/savie/investment-info.png" class="img-desktop-only"></th>
	                                        <th class="right-border"><fmt:message key="savie.plan.details.Surrender.benefit" bundle="${msg}" /><img src="<%=request.getContextPath()%>/resources/images/savie/investment-info.png" class="img-desktop-only"></th>
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
	                                        <h3><fmt:message key="savie.plan.details.After.year" bundle="${msg}" /></h3>
											<p class="hidden-md hidden-lg text-center"><fmt:message key="savie.plan.details.Check.rate" bundle="${msg}" /></p>
	                                    </div>  
	                                    <div class="col-md-6 col-xs-12 fwd-chart-col">
	                                        <div class="clearfix right-side">
	                                            <div class="left-side hidden-xs hidden-sm">
	                                                <p class="rate-text"><fmt:message key="savie.plan.details.Crediting.rate" bundle="${msg}" /></p>
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
									<p class="surrender-benefit"><fmt:message key="savie.plan.details.Surrender" bundle="${msg}" /> <span><fmt:message key="savie.plan.details.benefit" bundle="${msg}" /></span> (HK$ ‘000)</p>
									<div id="illustration-chart"></div>
									<div class="drag-more">
										<div>
											<span class="drag-more-text"><fmt:message key="savie.plan.details.Drag.to" bundle="${msg}" /><br /><fmt:message key="savie.plan.details.view.more" bundle="${msg}" /> <span class="glyphicon glyphicon-play"></span></span>
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
						<img src="<%=request.getContextPath()%>/resources/images/savie/email-mob.png">
						<h5><fmt:message key="savie.plan.details.Email.table" bundle="${msg}" /><span class="hidden-xs hidden-sm">.</span></h5>
					</div>
					<div class="col-xs-12 col-md-6 email-input pull-right">
						<form class="text-center">
							<input name="email" type="email" class="email-text" onkeyup="return forceLower(this);" placeholder="Enter your email address" />
							<button type="submit" class="email-btn"><fmt:message key="savie.plan.details.Submit" bundle="${msg}" /><span class="icon icon-chevron-thin-right"></span></button>
							<input id="email-checkbox" name="email-disclaimer" type="checkbox" />
							<label for="email-checkbox"></label>
							<p>I have read, understand and accept the <a href="#">Personal Information Collection Statement</a></p>
						</form>
					</div>
				</div>
			</div>
			
			
			<!--Explanation Block-->
			<div class="fwd-container container-fluid reset-padding explanation-block">
				<button class="btn btn-gray explanation-button" type="button" data-toggle="collapse" data-target="#collapseExplanation" aria-expanded="false" aria-controls="collapseExplanation" id="explanation-button">
					<fmt:message key="savie.plan.details.Explanation" bundle="${msg}" />
				</button>
				<span class="explanation"><fmt:message key="savie.plan.details.Explanation" bundle="${msg}" /></span>
				<div class="collapse" id="collapseExplanation">
					<ul class="explanation-list">
						<li class="explanation-li">
							<p class="expl-txt">The above is only a summary illustration of the major benefits of your Policy. You should refer to the Company for more information or, if appropriate, a more detailed proposal.</p>
						</li>
						<li class="explanation-li">
							<p class="expl-txt">The Basic Plan Illustration in Section 1 and 2 relates only to your Basic Plan and assumes that all premiums are paid in full when due without exercising skip premium option (premium holiday) and the current scale of charges remain unchanged.</p>
						</li>
						<li class="explanation-li">
							<p class="expl-txt">Death Benefit is equal to the sum of initial sum insured and account value throughout the policy term. Besides Death Benefit, an additional accidental death benefit equivalent to 100% of the Account Value or HK$400,000, whichever is lower, will be offered.</p>
						</li>
						<!-- <li class="explanation-li">
							<p class="expl-txt"><fmt:message key="savie.plan.details.context1" bundle="${msg}" /></p>
						</li>
						<li class="explanation-li">
							<p class="expl-txt"><fmt:message key="savie.plan.details.context2" bundle="${msg}" /></p>
						</li>
						<li class="explanation-li">
							<p class="expl-txt"><fmt:message key="savie.plan.details.context3" bundle="${msg}" /></p>
						</li>
						<li class="explanation-li">
							<p class="expl-txt"><fmt:message key="savie.plan.details.context4" bundle="${msg}" /></p>
						</li>
						<li class="explanation-li">
							<p class="expl-txt"><fmt:message key="savie.plan.details.context5" bundle="${msg}" /></p>
						</li>
						<li class="explanation-li">
							<p class="expl-txt"><fmt:message key="savie.plan.details.context6" bundle="${msg}" /></p>
						</li>
						<li class="explanation-li">
							<p class="expl-txt"><fmt:message key="savie.plan.details.context7" bundle="${msg}" /></p>
						</li>
						<li class="explanation-li">
							<p class="expl-txt"><fmt:message key="savie.plan.details.CurrentRate.declared.by.the.Company.shall.in.no.way.be" bundle="${msg}" /></p>
						</li> -->
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
							<img src="<%=request.getContextPath()%>/resources/images/savie/explanation-image.png" class="img-responsive img-padding-left">
						</div>
						<div class="pull-left right-width">
							<div class="row">
								<div class="col-xs-12 col-md-8 text-padding">
									<h6><fmt:message key="savie.plan.details.context9" bundle="${msg}" /></h6>
									<p class="started"><fmt:message key="savie.plan.details.context10" bundle="${msg}" /></p>
								</div>
								<div class="col-xs-12 col-md-4 button-padding">
									<button id="made-decision-next-btn" type="button" class="btn btn-orange btn-explanation"><fmt:message key="savie.plan.details.Next" bundle="${msg}" /><span class="icon icon-chevron-thin-right"></span></button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<a href="#" id="gotop" class="go-top go-top-default"><img src="<%=request.getContextPath()%>/resources/images/savie/back-to-top.png"></a> 
	</div>	
		<!-- JS INCLUDES -->
		
		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		<script src="<%=request.getContextPath()%>/resources/js/jquery.min.js"></script>
		<!-- Include all compiled plugins (below), or include individual files as needed -->
		<script src="<%=request.getContextPath()%>/resources/js/savie/bootstrap.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/savie/bootstrap-datepicker.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/savie/jasny-bootstrap.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/savie/bootstrap-select.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/savie/jquery.touchSwipe.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/savie/custom.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/savie/placeholders.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/savie/date.format.js"></script>
		
		<!--For Sales Illustration page js-->
		<script src="<%=request.getContextPath()%>/resources/js/savie/bootstrap-slider.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/savie/highcharts.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/savie/fwd-chart.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/savie/savie.js"></script>
