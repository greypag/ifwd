<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeQuoteBean"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/savie-regular-styles.css">
<script type="text/javascript">
var context = "${pageContext.request.contextPath}";
</script>


	<div class="fwd-savie-wrapper fwd-evergreen-wrapper">	
		<div class="container-fluid fwd-full-container">
			<div class="application-page-header et-header-browse">
				<div class="et-back-arrow hidden-xs hidden-sm">
					<a href="#" class="et-back-arrow-link">
						<span class="icon-arrow-left2 arrow-left"></span>
					</a>
			    </div>
				<div class="row reset-margin hidden-xs hidden-sm">
	                  <div class="col-md-4 reset-padding">
	                      <button type="button" class="et-header-info-btn et-bind-btn-header active" id="plan-detail" data-et-section-target="et-select-plan-section"><fmt:message key="stepindicator.savie.plandetails" bundle="${msg}" /></button>
	                  </div>
	                  <div class="col-md-4 reset-padding">
	                      <button type="button" class="et-header-info-btn et-bind-btn-header no-hover" id="make-appointment" data-et-section-target="et-application-section"><fmt:message key="stepindicator.savie.make.appointment" bundle="${msg}" /></button>
	                  </div>
	                  <div class="col-md-4 reset-padding">
	                      <button type="button" class="et-header-info-btn et-bind-btn-header no-hover" id="confirmation" data-et-section-target="et-dec-sign-section"><fmt:message key="stepindicator.savie.confirmation" bundle="${msg}" /></button>
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
							<h3 id="et-active-section-label"><fmt:message key="stepindicator.savie.plandetails" bundle="${msg}" /></h3>
						</div>
					</div>
				</div>
			</div>
		</div>
	
		<div class="application-flux savie-regular-plan-details">
			<span id="username" data-userid="<%=session.getAttribute("username")%>"></span>
			<div class="fwd-container-limit">
				<ol class="breadcrumb breadcrumbs-product-details et-breadcrumbs hidden-sm hidden-xs">
	               <li><a href="#"><fmt:message key="breadcrumb.savie.category" bundle="${msg}" /></a></li>
	               <li class="divider"><i class="fa fa-play"></i></li>
	               <li><a href="#"><fmt:message key="breadcrumb.savie.insurance.plan" bundle="${msg}" /> </a></li>
	               <li class="divider last"><i class="fa fa-play"></i></li>
	               <li class="active-bc" id="et-active-bc-menu"><fmt:message key="breadcrumb.savie.plandetails" bundle="${msg}" /></li>
            	</ol>
            </div>
			<!--Sales Illustration Block-->
			
			<h2 class="text-center hidden-xs hidden-sm desktop-title"><fmt:message key="label.savie.plandetails.title" bundle="${msg}" /></h2>
			<div id="illustration-filters" class="fwd-full-container container-fluid">
				
				<form class="fwd-container-limit">
						<div id="triangle"></div>
						<img class="money" src="<%=request.getContextPath()%>/resources/images/savie/money-logo.png">
						<div id="investment-amount" class="one-off">    
							<div id="desktop-left">
								<h3 class="saving"><fmt:message key="label.savie.payment.mode" bundle="${msg}" /> <button id="payment-button-tooltip" type="button" class="btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="" data-original-title=" ">
										<img src="<%=request.getContextPath()%>/resources/images/savie/sprite-icons-info-2.png">
									</button></h3>
								<div class="selectDiv centreDiv gray-text-bg payment-select">
			                        <select class="form-control gray-dropdown" id="payment-mode">
			                        	
			                           <option value="one-off" <c:if test="${savieType=='SP' }">selected</c:if>><fmt:message key="label.savie.oneoffpremium" bundle="${msg}" /></option>
			                           <option value="regular" <c:if test="${savieType=='RP' }">selected</c:if>><fmt:message key="label.savie.regular.pay" bundle="${msg}" /></option>
			                        </select>
			                        <img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg" />
			                    </div>
			                    <div class="one-off-premium">
				                    <div class="clearfix">
										<h3 class="pull-right total"><span id="range">200,000</span></h3>
										<label id="hkd" class="pull-right total"><fmt:message key="label.hkd" bundle="${msg}" /></label>
									</div>
									<input type="text" class="span2" name="amount" value="" data-slider-min="30000" data-slider-max="400000" data-slider-step="1000" data-slider-value="200000" data-slider-id="RC" id="R" data-slider-tooltip="hide" data-slider-handle="square" />
									
									<div class="clearfix min-max">
										<div class="pull-left text-center">
											<fmt:message key="label.min" bundle="${msg}" />
										</div>
			
										<div class="pull-right text-center">
											<fmt:message key="label.max" bundle="${msg}" />
										</div>
									</div>
								</div>
								<div class="regular-payment amount hidden">
									<h3 class="saving"><fmt:message key="label.savie.amount" bundle="${msg}" /></h3>
									<div class="selectDiv centreDiv gray-text-bg payment-select">
				                        <select id="amount-rp" class="form-control gray-dropdown">
				                           <option value="1000">1,000</option>
				                           <option value="2000">2,000</option>
				                           <option value="3000" selected>3,000</option>
				                           <option value="4000">4,000</option>
				                           <option value="5000">5,000</option>
				                           <option value="6000">6,000</option>
				                           <option value="7000">7,000</option>
				                           <option value="8000">8,000</option>
				                           <option value="9000">9,000</option>
				                           <option value="10000">10,000</option>
				                        </select>
				                        <img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg" />
				                    </div>
								</div>
							</div>
	
							<div id="desktop-right">
								<img class="promo-code hidden-xs hidden-sm" src="<%=request.getContextPath()%>/resources/images/savie/bday-icon.png">
								<h2 id="promo"><fmt:message key="label.dob" bundle="${msg}" /></h2>
								<div id="birthday">
									<!-- <div class="hidden-md hidden-lg">
										<input placeholder="yyyy-mm-dd" type="date" name="mobile-date" id="mobile-date"/> 
									</div> -->
									<div class="input-group input-append date" id="datePicker">
										<input type="text" class="date" name="dob" id="sales-illu-dob" value="15-10-1997" placeholder="15-10-1997" onfocusin="" readonly />
										<span class="input-group-addon add-on"><img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg" /></span>                        
									</div>
									<!-- <span class="error-msg-dob hideSpan" id="promo-code-dateOfBirth">Invalid date of birth. You must be 19 and above to apply.</span>
									<span class="error-msg-promo hideSpan" id="promo-code-dateOfBirthEmpty">Please input date of birth.</span> -->
								</div>
								<div class="regular-payment hidden last" id="total-payment-years">
									<h3 class="saving"><fmt:message key="label.payment.year" bundle="${msg}" /></h3>
									<div class="selectDiv centreDiv gray-text-bg payment-select last">
				                        <select class="form-control gray-dropdown" id="payment-years">
				                           <option value="3" selected>3</option>
				                        </select>
				                        <img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg" />
				                    </div>
								</div>
							</div>
	
						<!-- <p id="crediting-rate">Guaranteed crediting rates: 3%, 3%, 4%</p> -->
						</div>
	
						<div id="information">							
							<div id="pictures">
								<img id="birthday" src="<%=request.getContextPath()%>/resources/images/savie/promo-img.png">
							</div>
	
							<h2><fmt:message key="label.promocode" bundle="${msg}" /></h2>
							<input name="promocode" type="text" placeholder="<fmt:message key="savie.planDetails.promo.code.placeholder" bundle="${msg}" />" class="promocode" id="promocode">
							<span class="error-msg-promo promo-code-error hideSpan" id="promo-code-errmsg">Invalid promo code. Try again?</span>
						</div>
						
						<div class="calculate-holder">
							<button onclick="getSaviePlanDetails()" class="btn btn-orange calculate" type="button" id="sales-illu-apply-now"><fmt:message key="button.calculate" bundle="${msg}" /><span class="icon icon-chevron-thin-right"></span></button>
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
	                                <h2><fmt:message key="savie.planDetails.Summary" bundle="${msg}" /><!--
	                                	<button type="button" class="btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="savie.planDetails.Summary.tooltips">
	                                		<img src="<fmt:message key="savie.planDetails.info-image" bundle="${msg}" />">
	                                	</button>-->
	                                </h2>
	                                <h3><fmt:message key="saviee.planoption.summarytable1.first3years" bundle="${msg}" /></h3>
	                                <br class="hidden-lg hidden-md" />
	                                <h3 class="desktop-right"><fmt:message key="savie.planDetails.End.of.3rd.years.part1" bundle="${msg}" /><span id="3rd_policy_year">0</span><fmt:message key="savie.planDetails.End.of.3rd.years.part2" bundle="${msg}" /></h3>
	                            </div>
	                            <div class="rate-table">
	                                <table class="table table-hover">
	                                    <thead>
	                                    <tr>
	                                        <th class="left-border">
	                                        	<button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="<fmt:message key="savie.planDetails.End.of.policy.year.tooltips" bundle="${msg}" />"></button><fmt:message key="saviee.planoption.summarytable1.col1" bundle="${msg}" />
	                                        </th>
	                                        <th class="desktop-only"><fmt:message key="saviee.planoption.summarytable1.col2" bundle="${msg}" /></th>
	                                        <th class="premium">
	                                           	<button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="<fmt:message key="savie.planDetails.Total.paid.tooltips" bundle="${msg}" />"></button><fmt:message key="saviee.planoption.summarytable1.col3" bundle="${msg}" />
	                                        </th>
	                                        <th class="desktop-only">
	                                        	<button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="<fmt:message key="savie.planDetails.Account.value.tooltips" bundle="${msg}" />"></button><fmt:message key="saviee.planoption.summarytable1.col4" bundle="${msg}" />
	                                        </th>
	                                        <th class="right-border">
	                                        	<button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="<fmt:message key="savie.planDetails.Surrender.benefit.tooltips" bundle="${msg}" />"></button><fmt:message key="saviee.planoption.summarytable1.col5" bundle="${msg}" />
	                                        </th>
	                                    </tr>
	                                    </thead>
	                                    <tbody>
                                            <tr>    <td class="left-border">1</td>  <td class="black-text desktop-only" id="credit-rate-change-1"><span>3%</span></td>   <td class="black-text" id="premium-1"><span>$</span> 0</td> <td class="black-text desktop-only" id="account-value-1"><span>$</span> 0</td>    <td class="black-text right-border" id="surrender-1"><span>$</span> 0</td>    </tr>
                                            <tr>    <td class="left-border">2</td>  <td class="black-text desktop-only" id="credit-rate-change-2"><span>3%</span></td>   <td class="black-text" id="premium-2"><span>$</span> 0</td> <td class="black-text desktop-only" id="account-value-2"><span>$</span> 0</td>    <td class="black-text right-border" id="surrender-2"><span>$</span> 0</td>    </tr>
                                            <tr class="bottom-border">  <td class="left-border">3</td>  <td class="black-text desktop-only" id="credit-rate-change-3"><span>3.3%</span></td>   <td class="black-text" id="premium-3"><span>$</span> 0</td> <td class="black-text desktop-only" id="account-value-3"><span>$</span> 0</td>    <td class="black-text right-border" id="surrender-3"><span>$</span> 0</td>    </tr>
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
											<p class="hidden-xs hidden-sm"><fmt:message key="savie.planDetails.Choose.to.stay" bundle="${msg}" /></p>
											<p class="hidden-md hidden-lg text-center"><fmt:message key="savie.planDetails.Choose.to.stay" bundle="${msg}" /></p>
											<p class="hidden-md hidden-lg text-center"><fmt:message key="savie.planDetails.Check.rate" bundle="${msg}" /></p>
	                                    </div>  
	                                    <div class="col-md-6 col-xs-12 fwd-chart-col">
	                                        <div class="clearfix right-side">
	                                        	<div class="check-rate-box text-right hidden-xs hidden-sm">
		                                            <span class="check-rate-holder"><fmt:message key="savie.planDetails.Check.rate" bundle="${msg}" /></span>
		                                        </div>
		                                        <div class="chart-button-holder">
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
	                                        <th class="left-border"><button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="<fmt:message key="savie.planDetails.End.of.policy.year.tooltips" bundle="${msg}" />"></button><fmt:message key="saviee.planoption.summarytable1.col1" bundle="${msg}" /></th>
											<th class="credit-rate desktop-only"><fmt:message key="saviee.planoption.summarytable1.col2" bundle="${msg}" /></th>
	                                        <th class="premium"><button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="<fmt:message key="savie.planDetails.Total.paid.tooltips" bundle="${msg}" />"></button><fmt:message key="saviee.planoption.summarytable1.col3" bundle="${msg}" /></th>
	                                        <th class="desktop-only"><button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="<fmt:message key="savie.planDetails.Account.value.tooltips" bundle="${msg}" />"></button><fmt:message key="saviee.planoption.summarytable1.col4" bundle="${msg}" /></th>
	                                        <th class="right-border"><button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="<fmt:message key="savie.planDetails.Surrender.benefit.tooltips" bundle="${msg}" />"></button><fmt:message key="saviee.planoption.summarytable1.col5" bundle="${msg}" /></th>
	                                    </tr>
	                                    </thead>
	                                    <tbody>
	                                        <tr>    
												<td class="left-border" id='policy-year-0-1'>5</td>  
												<td class="black-text desktop-only" id="credit-rate-0-1">0%</td> 
												<td class="black-text" id="premium-change-0-1"><span>$</span> 0</td> 
												<td class="black-text desktop-only" id="account-value-change-0-1"><span>$</span> 0</td>    
												<td class="black-text right-border" id="surrender-change-0-1"><span>$</span> 0</td>    
											</tr>
	                                        <tr>    
												<td class="left-border" id='policy-year-0-2'>10</td> 
												<td class="black-text desktop-only" id="credit-rate-0-2">0%</td>  
												<td class="black-text" id="premium-change-0-2"><span>$</span> 0</td> 
												<td class="black-text desktop-only" id="account-value-change-0-2"><span>$</span> 0</td>    
												<td class="black-text right-border" id="surrender-change-0-2"><span>$</span> 0</td>    
											</tr>
	                                        <tr class="bottom-border">  
												<td class="left-border" id='policy-year-0-3'><fmt:message key="savie.planDetails.Age.100" bundle="${msg}" /></td>  
												<td class="black-text desktop-only" id="credit-rate-0-3">0%</td> 
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
	                                        <th class="left-border"><button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="<fmt:message key="savie.planDetails.End.of.policy.year.tooltips" bundle="${msg}" />"></button><fmt:message key="saviee.planoption.summarytable1.col1" bundle="${msg}" /></th>
											<th class="credit-rate desktop-only"><fmt:message key="saviee.planoption.summarytable1.col2" bundle="${msg}" /></th>
	                                        <th class="premium"><button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="<fmt:message key="savie.planDetails.Total.paid.tooltips" bundle="${msg}" />"></button><fmt:message key="saviee.planoption.summarytable1.col3" bundle="${msg}" /></th>
	                                        <th class="desktop-only"><button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="<fmt:message key="savie.planDetails.Account.value.tooltips" bundle="${msg}" />"></button><fmt:message key="saviee.planoption.summarytable1.col4" bundle="${msg}" /></th>
	                                        <th class="right-border"><button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="<fmt:message key="savie.planDetails.Surrender.benefit.tooltips" bundle="${msg}" />"></button><fmt:message key="saviee.planoption.summarytable1.col5" bundle="${msg}" /></th>
	                                    </tr>
	                                    </thead>
	                                    <tbody>
	                                        <tr>    
												<td class="left-border" id='policy-year-2-1'>5</td>  
												<td class="black-text desktop-only" id="credit-rate-2-1">2%</td> 
												<td class="black-text" id="premium-change-2-1"><span>$</span> 0</td> 
												<td class="black-text desktop-only" id="account-value-change-2-1"><span>$</span> 0</td>    
												<td class="black-text right-border" id="surrender-change-2-1"><span>$</span> 0</td>    
											</tr>
	                                        <tr>    
												<td class="left-border" id='policy-year-2-2'>10</td> 
												<td class="black-text desktop-only" id="credit-rate-2-2">2%</td>  
												<td class="black-text" id="premium-change-2-2"><span>$</span> 0</td> 
												<td class="black-text desktop-only" id="account-value-change-2-2"><span>$</span> 0</td>    
												<td class="black-text right-border" id="surrender-change-2-2"><span>$</span> 0</td>    
											</tr>
	                                        <tr class="bottom-border">  
												<td class="left-border" id='policy-year-2-3'><fmt:message key="savie.planDetails.Age.100" bundle="${msg}" /></td>  
												<td class="black-text desktop-only" id="credit-rate-2-3">2%</td> 
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
	                                        <th class="left-border"><button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="<fmt:message key="savie.planDetails.End.of.policy.year.tooltips" bundle="${msg}" />"></button><fmt:message key="saviee.planoption.summarytable1.col1" bundle="${msg}" /></th>
											<th class="credit-rate desktop-only"><fmt:message key="saviee.planoption.summarytable1.col2" bundle="${msg}" /></th>
	                                        <th class="premium"><button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="<fmt:message key="savie.planDetails.Total.paid.tooltips" bundle="${msg}" />"></button><fmt:message key="saviee.planoption.summarytable1.col3" bundle="${msg}" /></th>
	                                        <th class="desktop-only"><button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="<fmt:message key="savie.planDetails.Account.value.tooltips" bundle="${msg}" />"></button><fmt:message key="saviee.planoption.summarytable1.col4" bundle="${msg}" /></th>
	                                        <th class="right-border"><button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="<fmt:message key="savie.planDetails.Surrender.benefit.tooltips" bundle="${msg}" />"></button><fmt:message key="saviee.planoption.summarytable1.col5" bundle="${msg}" /></th>
	                                    </tr>
	                                    </thead>
	                                    <tbody>
	                                        <tr>    
												<td class="left-border" id='policy-year-3-1'>5</td>  
												<td class="black-text desktop-only" id="credit-rate-3-1">3%</td> 
												<td class="black-text" id="premium-change-3-1"><span>$</span> 0</td> 
												<td class="black-text desktop-only" id="account-value-change-3-1"><span>$</span> 0</td>    
												<td class="black-text right-border" id="surrender-change-3-1"><span>$</span> 0</td>    
											</tr>
	                                        <tr>    
												<td class="left-border" id='policy-year-3-2'>10</td> 
												<td class="black-text desktop-only" id="credit-rate-3-2">3%</td>  
												<td class="black-text" id="premium-change-3-2"><span>$</span> 0</td> 
												<td class="black-text desktop-only" id="account-value-change-3-2"><span>$</span> 0</td>    
												<td class="black-text right-border" id="surrender-change-3-2"><span>$</span> 0</td>    
											</tr>
	                                        <tr class="bottom-border">  
												<td class="left-border" id='policy-year-3-3'><fmt:message key="savie.planDetails.Age.100" bundle="${msg}" /></td>  
												<td class="black-text desktop-only" id="credit-rate-3-3">3%</td> 
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
	                                        <th class="left-border"><button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="<fmt:message key="savie.planDetails.End.of.policy.year.tooltips" bundle="${msg}" />"></button><fmt:message key="saviee.planoption.summarytable1.col1" bundle="${msg}" /></th>
											<th class="credit-rate desktop-only"><fmt:message key="saviee.planoption.summarytable1.col2" bundle="${msg}" /></th>
	                                        <th class="premium"><button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="<fmt:message key="savie.planDetails.Total.paid.tooltips" bundle="${msg}" />"></button><fmt:message key="saviee.planoption.summarytable1.col3" bundle="${msg}" /></th>
	                                        <th class="desktop-only"><button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="<fmt:message key="savie.planDetails.Account.value.tooltips" bundle="${msg}" />"></button><fmt:message key="saviee.planoption.summarytable1.col4" bundle="${msg}" /></th>
	                                        <th class="right-border"><button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="<fmt:message key="savie.planDetails.Surrender.benefit.tooltips" bundle="${msg}" />"></button><fmt:message key="saviee.planoption.summarytable1.col5" bundle="${msg}" /></th>
	                                    </tr>
	                                    </thead>
	                                    <tbody>
	                                        <tr>    
												<td class="left-border" id='policy-year-4-1'>5 </td>  
												<td class="black-text desktop-only" id="credit-rate-4-1">4%</td> 
												<td class="black-text" id="premium-change-4-1"><span>$</span> 0</td> 
												<td class="black-text desktop-only" id="account-value-change-4-1"><span>$</span> 0</td>    
												<td class="black-text right-border" id="surrender-change-4-1"><span>$</span> 0</td>    
											</tr>
	                                        <tr>    
												<td class="left-border" id='policy-year-4-2'>10</td> 
												<td class="black-text desktop-only" id="credit-rate-4-2">4%</td>  
												<td class="black-text" id="premium-change-4-2"><span>$</span> 0</td> 
												<td class="black-text desktop-only" id="account-value-change-4-2"><span>$</span> 0</td>    
												<td class="black-text right-border" id="surrender-change-4-2"><span>$</span> 0</td>    
											</tr>
	                                        <tr class="bottom-border">  
												<td class="left-border" id='policy-year-4-3'><fmt:message key="savie.planDetails.Age.100" bundle="${msg}" /></td>  
												<td class="black-text desktop-only" id="credit-rate-4-3">4%</td> 
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
				<!--<h2><fmt:message key="savie.planDetails.login.create" bundle="${msg}" /></h2> -->
				<button id="create-account" type="button" class="btn btn-orange proceed-btn"><fmt:message key="saviee.planoption.createaccount.button" bundle="${msg}" /></button>
				<button id="proceed" type="button" class="btn btn-orange proceed-btn hidden" onclick="showThankYouPopUp();"><fmt:message key="saviee.planoption.proceed" bundle="${msg}" /></button>
				<div class="login-holder">
					<p><fmt:message key="saviee.planoption.login.1" bundle="${msg}" /></p>
					<button id="made-decision-next-btn" type="button" class="login-button"><fmt:message key="saviee.planoption.login.2" bundle="${msg}" /></button>
					<p><fmt:message key="saviee.planoption.login.3" bundle="${msg}" /></p>
				</div>	
 			</div>

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
							<p class="expl-txt"><fmt:message key="savie.planDetails.context1" bundle="${msg}" /></p>
						</li>
						<li class="explanation-li">
							<p class="expl-txt"><fmt:message key="savie.planDetails.context3" bundle="${msg}" /></p>
						</li>
						<li class="explanation-li">
							<p class="expl-txt"><fmt:message key="savie.planDetails.context2" bundle="${msg}" /></p>
						</li>
					</ul>
				</div>
			</div>			

			<a href="#" id="gotop-rp" class="go-top go-top-default rp"><img src="<%=request.getContextPath()%>/resources/images/savie-regular/to-top.jpg"></a>
			
			<!-- Thank you -->
			<div class="modal fade thank-you-modal" id="thankYouModal" role="dialog" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content thank-you-content">
						<img src="<%=request.getContextPath()%><fmt:message key="savie.planDetails.thank.you.image.desktop" bundle="${msg}" />" class="img-responsive hidden-xs">
						<img src="<%=request.getContextPath()%><fmt:message key="savie.planDetails.thank.you.image.mobile" bundle="${msg}" />" class="img-responsive visible-xs">
						<div class="text-right continue-holder">
							<button id="thank-you-continue" class="btn next" onclick="goServiceCenter();"><fmt:message key="savie.planDetails.thank.you.btn.text" bundle="${msg}" /></button>
						</div>
					</div>
				</div>
			</div>

			<!-- AJAX loading mask -->
			<div class="loading-mask">
				<div class="content">
					<img src="<%=request.getContextPath()%>/resources/images/savie/iFWD_O2O_payment-in-progress.gif" class="img-responsive">
				</div>
			</div>
	</div>
	
		
		
		
		<!--For Sales Illustration page js-->
		<script src="<%=request.getContextPath()%>/resources/js/savie/bootstrap-slider.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/savie/highcharts.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/savie/fwd-chart.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/savie/savie.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/bootstrap-datepicker.min.js"></script>
		<script type="text/javascript">	
			$(function() {
				
				var current_date = new Date();
				var month_now = (parseInt((current_date.getMonth()+1), 10) + 100).toString().substr(1);
				var day_now = (parseInt(current_date.getDate(), 10) + 100).toString().substr(1);
				$('#sales-illu-dob').attr('placeholder',day_now +'-'+ month_now +'-'+ (current_date.getFullYear()-18));
				$('#sales-illu-dob').val(day_now +'-'+ month_now +'-'+ (current_date.getFullYear()-18));
				
				var from = $('#sales-illu-dob').val().split("-");
				var birthdate = new Date(from[2], from[1] - 1, from[0]);
				var cur = new Date();
				var diff = cur-birthdate;
				var age = Math.floor(diff/31536000000); //the age val
				var max = 99;
				var looplimit = max - Number(age);
				
				//console.log(looplimit);
				$('#payment-years').html('');
				for(var i = 1; i <= looplimit; i++ ) {
					if(i == 3) {
						$('#payment-years').append('<option value='+i+' selected>'+i+'</option>');
					} else {
						$('#payment-years').append('<option value='+i+'>'+i+'</option>');
					}
				}
				
				
				$('#thankYouModal').on('shown.bs.modal', function() {
				    $('body').addClass('modal-open');
				    $('.navbar.navbar-default.navbar-fixed-top.hidden-lg.hidden-md.pad-none').removeClass('navbar-fixed-top').addClass('navbar-no-scroll');
				})
				$('#thankYouModal').on('hidden.bs.modal', function() {
					$('body').removeClass('modal-open');
					$('.navbar.navbar-default.navbar-no-scroll.hidden-lg.hidden-md.pad-none').addClass('navbar-fixed-top').removeClass('navbar-no-scroll');
				});
				
	        	$("#payment-button-tooltip").tooltip().on('show.bs.tooltip', function() { 
					setTimeout(function(){
						$("#payment-button-tooltip").next().html('<div class="tooltip-arrow"></div><div class="tooltip-inner"><fmt:message key="tooltip.savie.payment.method" bundle="${msg}" /></div>'); 
						var css = $("#payment-button-tooltip").next().attr('style')+"top:-65px;";
						$("#payment-button-tooltip").next().removeAttr('style');
						$("#payment-button-tooltip").next().attr('style',css);
					}, 1);
				});	
	        	$(document).on('change','#payment-mode',function(){
					console.log($(this).val());
					if($(this).val()=="regular") {
						$('.regular-payment').removeClass('hidden');
						$('.one-off-premium').addClass('hidden');
						$('#promo').addClass('dob-reg-payment');
						$('#investment-amount').removeClass('one-off');
						$('#total-payment-years').css('display','block');
					}
					else {
						$('.regular-payment').addClass('hidden');
						$('.one-off-premium').removeClass('hidden');
						$('#promo').removeClass('dob-reg-payment');
						$('#investment-amount').addClass('one-off');
						$('#total-payment-years').removeAttr('style');
						
		        		$('#policy-year-3-1').html('5');
					}
				});
	        	
	        	if($('#payment-mode').val()=="regular") {
	        		$('#total-payment-years').css('display','block');
	        	}
	        	$(document).on('change','#sales-illu-dob',function(){
					if($(this).val()!="") {
						
						var from = $(this).val().split("-");
						var birthdate = new Date(from[2], from[1] - 1, from[0]);
						var cur = new Date();
						var diff = cur-birthdate;
						var age = Math.floor(diff/31536000000); //the age val
						var max = 99;
						var looplimit = max - Number(age);
						
						//console.log(looplimit);
						$('#payment-years').html('');
						for(var i = 1; i <= looplimit; i++ ) {
							$('#payment-years').append('<option value='+i+'>'+i+'</option>');
						}
					}
				});
	        	if(getWidth() < 992) {
		        	$('body').css('margin-top','98px');
	        	}
				$('#datePicker').datepicker({
					format: "dd-mm-yyyy",
					startDate: '${startDOB }',
					endDate: '${defaultDOB }',
					autoclose: true,
					startView: 2
				});
				
				$('#see-more-3-years').click(function(){
					$('#after-3-years-div').addClass('hidden');
					$('#after-3-years').removeClass('hidden');
					
					$('#rate-table-0').addClass('hidden');
					$('#rate-table-2').addClass('hidden');
					$('#rate-table-3').removeClass('hidden');
					$('#rate-table-4').addClass('hidden');
				});
				
				//Proceed button
				if($('#username').data('userid')!=null && $('#username').data('userid')!='*DIRECTGI' ) {
					$('#proceed').removeClass('hidden');
					$('#create-account').addClass('hidden');
					$('.proceed-block .login-holder').addClass('hidden');
				}

				//Create account
				$("#create-account").on('click', function(){
					window.location.href= '${pageContext.request.contextPath}'+'/'+'${language}'+'/joinus';
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
						$('#thankYouModal').modal({backdrop: 'static', keyboard: false});
						$('#thankYouModal').modal('show');
					}
					else{
						$('#loginpopup').modal('show');
					}
			    });	

				var thankyou = "${thankyou}";
				if(thankyou == "thankyou" && "${authenticate}" == "true" && "${authenticate}" != "*DIRECTGI"){
					$('#thankYouModal').modal({backdrop: 'static', keyboard: false});
					$('#thankYouModal').modal('show');
				}
			});
			
			function goServiceCenter(){
				window.location.href= '${pageContext.request.contextPath}'+'/'+'${language}'+'/'+'savings-insurance/'+'${nextPageFlow2 }'; 
			}

			function showThankYouPopUp(){
				$('#thankYouModal').modal({backdrop: 'static', keyboard: false});
				$('#thankYouModal').modal('show');
			}
			
			<%
			String type = (String)session.getAttribute("savieType");
		    if("RP".equals(type)) {%>
		    	$('.regular-payment').removeClass('hidden');
				$('.one-off-premium').addClass('hidden');
				$('#promo').addClass('dob-reg-payment');
				$('#investment-amount').removeClass('one-off');
		    <% }else if("SP".equals(type)) {%>
		    	$('.regular-payment').addClass('hidden');
				$('.one-off-premium').removeClass('hidden');
				$('#promo').removeClass('dob-reg-payment');
				$('#investment-amount').addClass('one-off');
		    <% } %>
		    
		    function appendPaymentEnds() {
		    	$('#policy-year-3-1 .payment-ends').append('<fmt:message key="label.final.payment.year" bundle="${msg}" />');
		    }
		</script>
