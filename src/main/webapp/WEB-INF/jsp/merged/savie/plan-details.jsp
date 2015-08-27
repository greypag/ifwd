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
						<li><a href="#"><fmt:message key="savie.planDetails.Save" bundle="${msg}" /></a></li>
						<li class="divider"><i class="fa fa-play"></i></li>
						<li><a href="#"><fmt:message key="savie.planDetails.Savie" bundle="${msg}" /></a></li>
						<li class="divider last"><i class="fa fa-play"></i></li>
						<li class="active-bc"><fmt:message key="savie.planDetails.plan.details" bundle="${msg}" /></li>
					</ol>
				</div>
				<!--  <div id="questions" class="text-center pull-right">
					<img src="<%=request.getContextPath()%>/resources/images/savie/question.png">              
					<a href="${nextPageFlow}">
						<div class="right">                 
							<h3><fmt:message key="savie.planDetails.Questions" bundle="${msg}" /></h3> <p><fmt:message key="savie.planDetails.Talk.us" bundle="${msg}" /><i class="glyphicon glyphicon-play"></i></p> 
						</div>
					</a>
				</div>
				-->
			</div>

			<div class="fwd-full-container container-fluid text-center sales-head">
				<h1><fmt:message key="savie.planDetails.plan.details" bundle="${msg}" /></h1>
			</div>
			
			<div id="illustration-filters" class="fwd-full-container container-fluid">

				<form class="fwd-container-limit">
				    <input type="hidden" id="language" value="${language }"/>
					<div id="triangle"></div>
					<img class="money" src="<%=request.getContextPath()%>/resources/images/savie/money-logo.png">
					<div id="investment-amount">    
						<div id="desktop-left">
							<h3 class="saving"><fmt:message key="savie.planDetails.Savings.amount" bundle="${msg}" /><button type="button" class="info-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="Initial savings amount you are planning to deposit."></button></h3>
							<div id="left" class="pull-left">
								<p><fmt:message key="savie.planDetails.Min" bundle="${msg}" /></p>
								<p>$30,000</p>
							</div>

							<div id="right" class="pull-right">
								<p><fmt:message key="savie.planDetails.Max" bundle="${msg}" /></p>
								<p>$400,000</p>
							</div>

							<input type="text" class="span2" name="amount" value="" data-slider-min="30000" data-slider-max="400000" data-slider-step="100" data-slider-value="${savingAmount != null && savingAmount != '' ? savingAmount : '200000'}" data-slider-id="RC" id="R" data-slider-tooltip="hide" data-slider-handle="square" />

							<h3 class="pull-right total"><span id="range">${formatSavingAmount != null && formatSavingAmount != '' ? formatSavingAmount : '200,000'}</span></h3>
							<label id="hkd" class="pull-right total"><fmt:message key="savie.planDetails.HK" bundle="${msg}" /></label>
						</div>

						<div id="desktop-right">
							<img class="promo-code hidden-xs hidden-sm" src="<%=request.getContextPath()%>/resources/images/savie/bday-icon.png">
							<h2 id="promo"><fmt:message key="savie.planDetails.Date.Birth" bundle="${msg}" />
								<button type="button" class="info-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="Your date of birth as per your HKID. You must be 19 and above to apply."></button>
							</h2>
							<div id="birthday">
							<!-- 
								<div class="hidden-md hidden-lg">
									<input placeholder="yyyy-mm-dd" type="date" name="mobile-date" id="mobile-date"/> 
								</div>
								hidden-xs hidden-sm
								 -->
								<div class="input-group input-append date" id="datePicker">
									<input type="text" class="date" value="${savingDob!=null ? savingDob:'08/25/1997' }" name="dob" id="sales-illu-dob" placeholder="08/25/1997" onfocusin="fnSetStyle()" readonly />
									<span class="input-group-addon add-on"><img class="arrow" src="<%=request.getContextPath()%>/resources/images/savie/arrow-down.png"></span>                        
								</div>
								<span class="error-msg-dob hideSpan" id="promo-code-dateOfBirth">Invalid date of birth. You must be 19 and above to apply.</span>
								<span class="error-msg-promo hideSpan" id="promo-code-dateOfBirthEmpty">Please input date of birth.</span>
							</div>
						</div>

					  <!--  <p id="crediting-rate"><fmt:message key="savie.planDetails.Guaranteed.rate" bundle="${msg}" /></p>-->
					</div>

					<div id="information">
						<div id="pictures">
							<img id="birthday" src="<%=request.getContextPath()%>/resources/images/savie/promo-img.png">
						</div>

						<h2>Promo code
							<button type="button" class="info-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="If you have received a promo code, enter below for special rates."></button>
						</h2>
						<input value="${savingPromocode }" name="promocode" type="text" placeholder="e.g. SAVIE50" class="promocode" id="promocode">
						<span class="error-msg-promo hideSpan" id="promo-code-errmsg">Invalid promo code. Try again?</span>
					</div>
					<div class="apply">
						<button onclick='getSaviePlanDetails()' class="btn btn-orange calculate" type="button" id="sales-illu-apply-now">Calculate<span class="icon icon-chevron-thin-right"></span></button>
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
	                                <h2><fmt:message key="savie.planDetails.Summary" bundle="${msg}" />
	                                	<button type="button" class="btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="Investment summary">
	                                		<img src="<fmt:message key="savie.planDetails.info-image" bundle="${msg}" />">
	                                	</button>
	                                </h2>
	                                <h3><fmt:message key="savie.planDetails.year.guaranteed" bundle="${msg}" /></h3>
	                                <h3 class="desktop-right hidden-xs hidden-sm">You will now have $ <span id="3rd_policy_year">0</span> in the 3rd policy year</h3>
	                            </div>
	                            <div class="rate-table">
	                                <table class="table table-hover">
	                                    <thead>
	                                    <tr>
	                                        <th class="left-border"><fmt:message key="savie.planDetails.End.of" bundle="${msg}" /><span><fmt:message key="savie.planDetails.policy.year" bundle="${msg}" /><button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="End of policy year"></button></span></th>
	                                        <th class="desktop-only"><fmt:message key="savie.planDetails.Annual.Crediting.Rate" bundle="${msg}" /></th>
	                                        <th class="premium"><span class="hidden-xs hidden-sm"><fmt:message key="savie.planDetails.Total.paid" bundle="${msg}" /></span><span class="hidden-md hidden-lg"><fmt:message key="savie.planDetails.Premium.paid" bundle="${msg}" /></span><button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="Total premium paid"></button></th>
	                                        <th class="desktop-only"><fmt:message key="savie.planDetails.Account.value" bundle="${msg}" /><button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="Account value"></button></th>
	                                        <th class="right-border"><fmt:message key="savie.planDetails.Surrender.benefit" bundle="${msg}" /><button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="Surrender benefit"></button></th>
	                                    </tr>
	                                    </thead>
	                                    <tbody>
                                            <tr>    <td class="left-border">1</td>  <td class="black-text desktop-only" id="credit-rate-change-1"><span>3%</span></td>   <td class="black-text" id="premium-1"><span>$</span> 0</td> <td class="black-text desktop-only" id="account-value-1"><span>$</span> 0</td>    <td class="black-text right-border" id="surrender-1"><span>$</span> 0</td>    </tr>
                                            <tr>    <td class="left-border">2</td>  <td class="black-text desktop-only" id="credit-rate-change-2"><span>3%</span></td>   <td class="black-text" id="premium-2"><span>$</span> 0</td> <td class="black-text desktop-only" id="account-value-2"><span>$</span> 0</td>    <td class="black-text right-border" id="surrender-2"><span>$</span> 0</td>    </tr>
                                            <tr class="bottom-border">  <td class="left-border">3</td>  <td class="black-text desktop-only" id="credit-rate-change-3"><span>4%</span></td>   <td class="black-text" id="premium-3"><span>$</span> 0</td> <td class="black-text desktop-only" id="account-value-3"><span>$</span> 0</td>    <td class="black-text right-border" id="surrender-3"><span>$</span> 0</td>    </tr>
	                                    </tbody>
	                                </table>
	                            </div>
	                        </div>
	                    </div>
	                    <div>   
	                     
	                   		<div class="after-3-years-btn" id="after-3-years-div">
								<button type="button" class="btn btn-white see-more" id="see-more-3-years"><fmt:message key="savie.planDetails.SeeMoreAfter3Years" bundle="${msg}" /></button>
							</div>
							
	                        <div class="container-fluid summary-tab-max-width hidden" id="after-3-years">
	                            <div class="investment-summary-title-desktop">
	                                <div class="row percent-buttons" >
										<div class="col-md-6 col-xs-12 after-year-three">
	                                        <h3><fmt:message key="savie.planDetails.After.year" bundle="${msg}" /></h3>
											<p class="hidden-md hidden-lg text-center"><fmt:message key="savie.planDetails.Check.rate" bundle="${msg}" /></p>
	                                    </div>  
	                                    <div class="col-md-6 col-xs-12 fwd-chart-col">
	                                        <div class="clearfix right-side">
	                                            <div class="left-side hidden-xs hidden-sm">
	                                                <p class="rate-text"><fmt:message key="savie.planDetails.Crediting.rate" bundle="${msg}" /></p>
	                                            </div>
	                                            <div class="left-side chart-button-left">
	                                                <button id="rate-0" type="button">0%</button>
	                                            </div>
	                                            <div class="left-side chart-button-left">
	                                                <button id="rate-2" type="button" >2%</button>
	                                            </div>
	                                            <div class="left-side chart-button-right">
	                                                <button id="rate-3" class="active" type="button">3%</button>
	                                            </div>
	                                            <div class="left-side chart-button-right">
	                                                <button id="rate-4" type="button">4%</button>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>                                
	                            </div>
	                     <!--   <div class="investment-summary">
									<p class="surrender-benefit"><fmt:message key="savie.planDetails.Surrender" bundle="${msg}" /> <span><fmt:message key="savie.planDetails.benefit" bundle="${msg}" /></span> (HK$ ‘000)</p>
									<div id="illustration-chart"></div>
									<div class="drag-more">
										<div>
											<span class="drag-more-text"><fmt:message key="savie.planDetails.Drag.to" bundle="${msg}" /><br /><fmt:message key="savie.planDetails.view.more" bundle="${msg}" /> <span class="glyphicon glyphicon-play"></span></span>
										</div>
									</div>
	                            </div>-->
	                            
	                            <div id="rate-table-0" class="rate-table">
	                                <table class="table table-hover">
	                                    <thead>
	                                    <tr>
	                                        <th class="left-border"><fmt:message key="savie.planDetails.End.of" bundle="${msg}" /><span><fmt:message key="savie.planDetails.policy.year" bundle="${msg}" /><button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="End of policy year"></button></span></th>
											<th class="credit-rate desktop-only">Annual crediting rate %</th>
	                                        <th class="premium"><span class="hidden-xs hidden-sm"><fmt:message key="savie.planDetails.Total.paid" bundle="${msg}" /></span><span class="hidden-md hidden-lg"><fmt:message key="savie.planDetails.Premium.paid" bundle="${msg}" /></span><button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="Total premium paid"></button></th>
	                                        <th class="desktop-only"><fmt:message key="savie.planDetails.Account.value" bundle="${msg}" /><button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="Account value"></button></th>
	                                        <th class="right-border"><fmt:message key="savie.planDetails.Surrender.benefit" bundle="${msg}" /><button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="Surrender benefit"></button></th>
	                                    </tr>
	                                    </thead>
	                                    <tbody>
	                                        <tr>    
												<td class="left-border" id='policy-year-0-1'>5</td>  
												<td class="black-text desktop-only" id="credit-rate-0-1">0</td> 
												<td class="black-text" id="premium-change-0-1"><span>$</span> 0</td> 
												<td class="black-text desktop-only" id="account-value-change-0-1"><span>$</span> 0</td>    
												<td class="black-text right-border" id="surrender-change-0-1"><span>$</span> 0</td>    
											</tr>
	                                        <tr>    
												<td class="left-border" id='policy-year-0-2'>10</td> 
												<td class="black-text desktop-only" id="credit-rate-0-2">0</td>  
												<td class="black-text" id="premium-change-0-2"><span>$</span> 0</td> 
												<td class="black-text desktop-only" id="account-value-change-0-2"><span>$</span> 0</td>    
												<td class="black-text right-border" id="surrender-change-0-2"><span>$</span> 0</td>    
											</tr>
	                                        <tr class="bottom-border">  
												<td class="left-border" id='policy-year-0-3'>Age 100</td>  
												<td class="black-text desktop-only" id="credit-rate-0-3">0</td> 
												<td class="black-text" id="premium-change-0-3"><span>$</span> 0</td> 
												<td class="black-text desktop-only" id="account-value-change-0-3"><span>$</span> 0</td>    
												<td class="black-text right-border" id="surrender-change-0-3"><span>$</span> 0</td>    
												</tr>
	                                    </tbody>
	                                </table>
	                            </div>
	                            
	                            <div id="rate-table-2" class="rate-table">
	                                <table class="table table-hover">
	                                    <thead>
	                                    <tr>
	                                        <th class="left-border"><fmt:message key="savie.planDetails.End.of" bundle="${msg}" /><span><fmt:message key="savie.planDetails.policy.year" bundle="${msg}" /><button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="End of policy year"></button></span></th>
											<th class="credit-rate desktop-only">Annual crediting rate %</th>
	                                        <th class="premium"><span class="hidden-xs hidden-sm"><fmt:message key="savie.planDetails.Total.paid" bundle="${msg}" /></span><span class="hidden-md hidden-lg"><fmt:message key="savie.planDetails.Premium.paid" bundle="${msg}" /></span><button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="Total premium paid"></button></th>
	                                        <th class="desktop-only"><fmt:message key="savie.planDetails.Account.value" bundle="${msg}" /><button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="Account value"></button></th>
	                                        <th class="right-border"><fmt:message key="savie.planDetails.Surrender.benefit" bundle="${msg}" /><button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="Surrender benefit"></button></th>
	                                    </tr>
	                                    </thead>
	                                    <tbody>
	                                        <tr>    
												<td class="left-border" id='policy-year-2-1'>5</td>  
												<td class="black-text desktop-only" id="credit-rate-2-1">2</td> 
												<td class="black-text" id="premium-change-2-1"><span>$</span> 0</td> 
												<td class="black-text desktop-only" id="account-value-change-2-1"><span>$</span> 0</td>    
												<td class="black-text right-border" id="surrender-change-2-1"><span>$</span> 0</td>    
											</tr>
	                                        <tr>    
												<td class="left-border" id='policy-year-2-2'>10</td> 
												<td class="black-text desktop-only" id="credit-rate-2-2">2</td>  
												<td class="black-text" id="premium-change-2-2"><span>$</span> 0</td> 
												<td class="black-text desktop-only" id="account-value-change-2-2"><span>$</span> 0</td>    
												<td class="black-text right-border" id="surrender-change-2-2"><span>$</span> 0</td>    
											</tr>
	                                        <tr class="bottom-border">  
												<td class="left-border" id='policy-year-2-3'>Age 100</td>  
												<td class="black-text desktop-only" id="credit-rate-2-3">2</td> 
												<td class="black-text" id="premium-change-2-3"><span>$</span> 0</td> 
												<td class="black-text desktop-only" id="account-value-change-2-3"><span>$</span> 0</td>    
												<td class="black-text right-border" id="surrender-change-2-3"><span>$</span> 0</td>    
												</tr>
	                                    </tbody>
	                                </table>
	                            </div>
	                            
	                            <div id="rate-table-3" class="rate-table">
	                                <table class="table table-hover">
	                                    <thead>
	                                    <tr>
	                                        <th class="left-border"><fmt:message key="savie.planDetails.End.of" bundle="${msg}" /><span><fmt:message key="savie.planDetails.policy.year" bundle="${msg}" /><button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="End of policy year"></button></span></th>
											<th class="credit-rate desktop-only">Annual crediting rate %</th>
	                                        <th class="premium"><span class="hidden-xs hidden-sm"><fmt:message key="savie.planDetails.Total.paid" bundle="${msg}" /></span><span class="hidden-md hidden-lg"><fmt:message key="savie.planDetails.Premium.paid" bundle="${msg}" /></span><button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="Total premium paid"></button></th>
	                                        <th class="desktop-only"><fmt:message key="savie.planDetails.Account.value" bundle="${msg}" /><button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="Account value"></button></th>
	                                        <th class="right-border"><fmt:message key="savie.planDetails.Surrender.benefit" bundle="${msg}" /><button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="Surrender benefit"></button></th>
	                                    </tr>
	                                    </thead>
	                                    <tbody>
	                                        <tr>    
												<td class="left-border" id='policy-year-3-1'>5</td>  
												<td class="black-text desktop-only" id="credit-rate-3-1">3</td> 
												<td class="black-text" id="premium-change-3-1"><span>$</span> 0</td> 
												<td class="black-text desktop-only" id="account-value-change-3-1"><span>$</span> 0</td>    
												<td class="black-text right-border" id="surrender-change-3-1"><span>$</span> 0</td>    
											</tr>
	                                        <tr>    
												<td class="left-border" id='policy-year-3-2'>10</td> 
												<td class="black-text desktop-only" id="credit-rate-3-2">3</td>  
												<td class="black-text" id="premium-change-3-2"><span>$</span> 0</td> 
												<td class="black-text desktop-only" id="account-value-change-3-2"><span>$</span> 0</td>    
												<td class="black-text right-border" id="surrender-change-3-2"><span>$</span> 0</td>    
											</tr>
	                                        <tr class="bottom-border">  
												<td class="left-border" id='policy-year-3-3'>Age 100</td>  
												<td class="black-text desktop-only" id="credit-rate-3-3">3</td> 
												<td class="black-text" id="premium-change-3-3"><span>$</span> 0</td> 
												<td class="black-text desktop-only" id="account-value-change-3-3"><span>$</span> 0</td>    
												<td class="black-text right-border" id="surrender-change-3-3"><span>$</span> 0</td>    
												</tr>
	                                    </tbody>
	                                </table>
	                            </div>
	                            
	                            <div id="rate-table-4" class="rate-table">
	                                <table class="table table-hover">
	                                    <thead>
	                                    <tr>
	                                        <th class="left-border"><fmt:message key="savie.planDetails.End.of" bundle="${msg}" /><span><fmt:message key="savie.planDetails.policy.year" bundle="${msg}" /><button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="End of policy year"></button></span></th>
											<th class="credit-rate desktop-only">Annual crediting rate %</th>
	                                        <th class="premium"><span class="hidden-xs hidden-sm"><fmt:message key="savie.planDetails.Total.paid" bundle="${msg}" /></span><span class="hidden-md hidden-lg"><fmt:message key="savie.planDetails.Premium.paid" bundle="${msg}" /></span><button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="Total premium paid"></button></th>
	                                        <th class="desktop-only"><fmt:message key="savie.planDetails.Account.value" bundle="${msg}" /><button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="Account value"></button></th>
	                                        <th class="right-border"><fmt:message key="savie.planDetails.Surrender.benefit" bundle="${msg}" /><button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="Surrender benefit"></button></th>
	                                    </tr>
	                                    </thead>
	                                    <tbody>
	                                        <tr>    
												<td class="left-border" id='policy-year-4-1'>5</td>  
												<td class="black-text desktop-only" id="credit-rate-4-1">4</td> 
												<td class="black-text" id="premium-change-4-1"><span>$</span> 0</td> 
												<td class="black-text desktop-only" id="account-value-change-4-1"><span>$</span> 0</td>    
												<td class="black-text right-border" id="surrender-change-4-1"><span>$</span> 0</td>    
											</tr>
	                                        <tr>    
												<td class="left-border" id='policy-year-4-2'>10</td> 
												<td class="black-text desktop-only" id="credit-rate-4-2">4</td>  
												<td class="black-text" id="premium-change-4-2"><span>$</span> 0</td> 
												<td class="black-text desktop-only" id="account-value-change-4-2"><span>$</span> 0</td>    
												<td class="black-text right-border" id="surrender-change-4-2"><span>$</span> 0</td>    
											</tr>
	                                        <tr class="bottom-border">  
												<td class="left-border" id='policy-year-4-3'>Age 100</td>  
												<td class="black-text desktop-only" id="credit-rate-4-3">4</td> 
												<td class="black-text" id="premium-change-4-3"><span>$</span> 0</td> 
												<td class="black-text desktop-only" id="account-value-change-4-3"><span>$</span> 0</td>    
												<td class="black-text right-border" id="surrender-change-4-3"><span>$</span> 0</td>    
												</tr>
	                                    </tbody>
	                                </table>
	                            </div>
	                            
	                            
	                        </div>
	                    </div>
					</div>
				</div>
			</div>
			
			<!-- Login, create account, Proceed buttons -->
			<div class="fwd-container container-fluid proceed-block text-center">
				<h2>Login or create an account to</h2>
				<button id="made-decision-next-btn" type="button" class="btn btn-orange proceed-btn">Proceed</button>
			</div>
			
			<!--Explanation Block-->
			<div class="fwd-container container-fluid reset-padding explanation-block">
				<button class="btn btn-gray explanation-button" type="button" data-toggle="collapse" data-target="#collapseExplanation" aria-expanded="false" aria-controls="collapseExplanation" id="explanation-button">
					<fmt:message key="savie.planDetails.Explanation" bundle="${msg}" />
				</button>
				<span class="explanation"><fmt:message key="savie.planDetails.Explanation" bundle="${msg}" /></span>
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
							<p class="expl-txt"><fmt:message key="savie.planDetails.context1" bundle="${msg}" /></p>
						</li>
						<li class="explanation-li">
							<p class="expl-txt"><fmt:message key="savie.planDetails.context2" bundle="${msg}" /></p>
						</li>
						<li class="explanation-li">
							<p class="expl-txt"><fmt:message key="savie.planDetails.context3" bundle="${msg}" /></p>
						</li>
						<li class="explanation-li">
							<p class="expl-txt"><fmt:message key="savie.planDetails.context4" bundle="${msg}" /></p>
						</li>
						<li class="explanation-li">
							<p class="expl-txt"><fmt:message key="savie.planDetails.context5" bundle="${msg}" /></p>
						</li>
						<li class="explanation-li">
							<p class="expl-txt"><fmt:message key="savie.planDetails.context6" bundle="${msg}" /></p>
						</li>
						<li class="explanation-li">
							<p class="expl-txt"><fmt:message key="savie.planDetails.context7" bundle="${msg}" /></p>
						</li>
						<li class="explanation-li">
							<p class="expl-txt"><fmt:message key="savie.planDetails.CurrentRate.declared.by.the.Company.shall.in.no.way.be" bundle="${msg}" /></p>
						</li> -->
					</ul>
				</div>
			</div>			

			<a href="#" id="gotop" class="go-top go-top-default"><img src="<%=request.getContextPath()%>/resources/images/savie/back-to-top.png"></a> 
			
			<!-- Thank you -->
			<div class="modal fade thank-you-modal" id="thankYouModal" role="dialog" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content thank-you-content">
						<img src="<%=request.getContextPath()%>/resources/images/savie/iFWD_savie_o2o_V2.jpg" class="img-responsive hidden-xs">
						<img src="<%=request.getContextPath()%>/resources/images/savie/FWD_savie_o2o_offline-procedure_mobile.jpg" class="img-responsive hidden-md hidden-lg hidden-sm">
						<button id="thank-you-continue" class="btn next" onclick="gotoFna();">Continue</button>
					</div>
				</div>
			</div>
	</div>
	
		
		
		<!--Login Modal-->
		<div class="modal fade login-modal" id="planDetailsLoginModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="false" data-keyboard="false">
			<div class="modal-dialog plan-details">
				<div class="modal-content plan-details">
					<div class="modal-header">
						<button type="button" class="close plan-details" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="h4-plan-details" id="myModalLabel">Log in to FWD</h4>
					</div>
					<div class="modal-body plan-details">
						<form>
							<div class="form-group">
								<div class="clearfix">
									<div class="pull-left txt">Username</div>
									<div class="pull-right border-bottom ">
										<a title="Forgot Username | FWD Hong Kong" href="https://i.fwd.com.hk/en/forgotUserName" class="link-plan-details">Forgot username?</a>
									</div>
								</div>
								<input class="form-control input-gray" id="planDetailsUsername" type="text" placeholder="Username">
							</div>
							<div class="form-group">
								<div class="clearfix">
									<div class="pull-left txt">Password</div>
									<div class="pull-right"><a title="Forgot Password | FWD Hong Kong" href="https://i.fwd.com.hk/en/forgotPassword" class="border-bottom link-plan-details">Forgot password?</a></div>
								</div>
								<input class="form-control input-gray" id="planDetailsPassword" type="password" placeholder="Password">
							</div>
						</form>
					</div>
					<div class="modal-footers">
						<p class="hidden-md hidden-lg plan-details mobile-txt">For the purpose of purchasing a specified insurance plan through this website (“the Plan”), I hereby consent the transfer of my personal data from FWD eServices to the issuer of the Plan.</p>
						<div class="row">
							<div class="col-md-6 col-sm-12">
								<button type="submit" class="btn btn-white btn-login-plan-details" data-dismiss="modal" id="planDetailsLogin">Log In</button>
							</div>
							<div class="col-md-5 col-sm-12 mobile-register">
								<h6 class="new-member">New Member?</h6>
								<a href="#" data-dismiss="modal" class="register">Register here</a>
							</div>					
						</div>
						<p class="hidden-xs hidden-sm plan-details txt">For the purpose of purchasing a specified insurance plan through this website (“the Plan”), I hereby consent the transfer of my personal data from FWD eServices to the issuer of the Plan.</p>
					</div>
				</div>
			</div>
		</div>
		
		<!--For Sales Illustration page js-->
		<!--  <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/bootstrap-datepicker.min.js"></script>-->
		<script src="<%=request.getContextPath()%>/resources/js/savie/bootstrap-slider.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/savie/highcharts.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/savie/fwd-chart.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/savie/savie.js"></script>
		<script type="text/javascript">		
			$(function () {	
				$('#made-decision-next-btn').click(function(){
					$('#planDetailsLoginModal').modal('show');
				});
				
				$('#see-more-3-years').click(function(){
					$('#after-3-years-div').addClass('hidden');
					$('#after-3-years').removeClass('hidden');
					
					$('#rate-table-0').addClass('hidden');
					$('#rate-table-2').addClass('hidden');
					$('#rate-table-3').removeClass('hidden');
					$('#rate-table-4').addClass('hidden');
				});
				
				$('#rate-0').click(function(){
					$('#rate-3').removeClass('active');
					$('#rate-table-0').removeClass('hidden');
					$('#rate-table-2').addClass('hidden');
					$('#rate-table-3').addClass('hidden');
					$('#rate-table-4').addClass('hidden');
				});
				$('#rate-2').click(function(){
					$('#rate-3').removeClass('active');
					$('#rate-table-0').addClass('hidden');
					$('#rate-table-2').removeClass('hidden');
					$('#rate-table-3').addClass('hidden');
					$('#rate-table-4').addClass('hidden');
				});
				$('#rate-3').click(function(){
					$('#rate-table-0').addClass('hidden');
					$('#rate-table-2').addClass('hidden');
					$('#rate-table-3').removeClass('hidden');
					$('#rate-table-4').addClass('hidden');
				});
				$('#rate-4').click(function(){
					$('#rate-3').removeClass('active');
					$('#rate-table-0').addClass('hidden');
					$('#rate-table-2').addClass('hidden');
					$('#rate-table-3').addClass('hidden');
					$('#rate-table-4').removeClass('hidden');
				});
			});
			
			//login
			$("#made-decision-next-btn").on('click', function(){
				var savingAmount = $("input[name='amount']").val();
				var savingDob = $("input[name='dob']").val();
				var savingPromocode = $("input[name='promocode']").val();
				$.ajax({     
				    url:'${pageContext.request.contextPath}/ajax/savie/savings-insurance/saveAmount',     
				    type:'post',     
				    data:{    
				    	"savingAmount": savingAmount,
				    	"savingDob": savingDob,
				    	"savingPromocode": savingPromocode,
			   		},     
				    error:function(){       
				    },     
				    success:function(data){  
				    }  
				});
				
				if("${authenticate}" == "true" && "${authenticate}" != "*DIRECTGI"){
					$("#thankYouModal").modal({backdrop:false});
					$('#thankYouModal').modal('show');
				}
				else{
					$('#loginpopup').modal('show');
				}
		    });	
			
			$(document).ready(function(){
				var thankyou = "${thankyou }";
				if(thankyou == "thankyou" && "${authenticate}" == "true" && "${authenticate}" != "*DIRECTGI"){
					$("#thankYouModal").modal({backdrop:false});
					$('#thankYouModal').modal('show');
				}
			});
			
			function goServiceCenter(){
				window.location.href= '${pageContext.request.contextPath}'+'/'+'${language}'+'/'+'savings-insurance/'+'${nextPageFlow2 }'; 
			}
		</script>
