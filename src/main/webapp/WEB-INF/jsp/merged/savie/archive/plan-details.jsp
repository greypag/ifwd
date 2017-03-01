<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeQuoteBean"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<script type="text/javascript">
var context = "${pageContext.request.contextPath}";
</script>

	<div class="fwd-savie-wrapper">	
		<div class="container-fluid fwd-full-container">
			<div class="application-page-header et-header-browse">
				<div class="et-back-arrow hidden-xs hidden-sm">
					<a href="#" class="et-back-arrow-link">
						<span class="icon-arrow-left2 arrow-left"></span>
					</a>
			    </div>
				<div class="row reset-margin hidden-xs hidden-sm">
	                  <div class="col-md-4 reset-padding">
	                      <button type="button" class="et-header-info-btn et-bind-btn-header active" id="plan-detail" data-et-section-target="et-select-plan-section">Plan details</button>
	                  </div>
	                  <div class="col-md-4 reset-padding">
	                      <button type="button" class="et-header-info-btn et-bind-btn-header no-hover" id="make-appointment" data-et-section-target="et-application-section">Make appointment</button>
	                  </div>
	                  <div class="col-md-4 reset-padding">
	                      <button type="button" class="et-header-info-btn et-bind-btn-header no-hover" id="confirmation" data-et-section-target="et-dec-sign-section">Confirmation</button>
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
							<h3 id="et-active-section-label">Plan details</h3>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="page-sales-illustration application-flux">
			<span id="username" data-userid="<%=session.getAttribute("username")%>"></span>
			<!--Sales Illustration Block-->
			<div class="fwd-container container-fluid hidden-xs hidden-sm clearfix">
				<div class="breadcrumbs pull-left">
					<ol class="breadcrumb breadcrumbs-product-details breadcrumbs-landing">
						<li><a href="#"><fmt:message key="saviee.planoption.breadcrumb2" bundle="${msg}" /></a></li>
						<li class="divider"><i class="fa fa-play"></i></li>
						<li><a href="#"><fmt:message key="saviee.planoption.breadcrumb3" bundle="${msg}" /></a></li>
						<li class="divider last"><i class="fa fa-play"></i></li>
						<li class="active-bc"><fmt:message key="saviee.planoption.breadcrumb4" bundle="${msg}" /></li>
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
				
			</div>
			
			<div id="illustration-filters" class="fwd-full-container container-fluid">

				<form class="fwd-container-limit">
				    <input type="hidden" id="language" value="${language }"/>
					<div id="triangle"></div>
					<img class="money" src="<%=request.getContextPath()%>/resources/images/savie/money-logo.png">
					<div id="investment-amount">    
						<div id="desktop-left">
							<h3 class="saving"><fmt:message key="saviee.planoption.oneoff.premium.amount" bundle="${msg}" /><!--<button type="button" class="info-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="<fmt:message key="savie.planDetails.Savings.amount.tooltips" bundle="${msg}" />"></button>--></h3>
							
							<h3 class="pull-right total"><span id="range">${formatSavingAmount != null && formatSavingAmount != '' ? formatSavingAmount : '200,000'}</span></h3>
							<label id="hkd" class="pull-right total"><fmt:message key="saviee.planoption.q1.currency" bundle="${msg}" /></label>
							
							<input type="text" class="span2" name="amount" value="" data-slider-min="30000" data-slider-max="400000" data-slider-step="1000" data-slider-value="${savingAmount != null && savingAmount != '' ? savingAmount : '200000'}" data-slider-id="RC" id="R" data-slider-tooltip="hide" data-slider-handle="square" />
                           
                            <div id="left" class="pull-left">
								<p><fmt:message key="saviee.planoption.q1.min" bundle="${msg}" /></p>
								<p><fmt:message key="saviee.planoption.q1.min.value" bundle="${msg}" /></p>
							</div>

							<div id="right" class="pull-right">
								<p><fmt:message key="saviee.planoption.q1.max" bundle="${msg}" /></p>
								<p><fmt:message key="saviee.planoption.q1.max.value" bundle="${msg}" /></p>
							</div>	
						</div>

						<div id="desktop-right">
							<img class="promo-code hidden-xs hidden-sm" src="<%=request.getContextPath()%>/resources/images/savie/bday-icon.png">
							<h2 id="promo"><fmt:message key="saviee.planoption.dob" bundle="${msg}" /><!--
								<button type="button" class="info-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="<fmt:message key="savie.planDetails.birth.above" bundle="${msg}" />"></button>-->
							</h2>
							<div id="birthday">
							<!-- 
								<div class="hidden-md hidden-lg">
									<input placeholder="yyyy-mm-dd" type="date" name="mobile-date" id="mobile-date" value="${savingDob!=null ? savingDob:defaultDOB }"/> 
								</div>
								hidden-xs hidden-sm
								 -->
								<div class="input-group input-append date" id="datePicker">
									<input type="text" class="date" value="${savingDob!=null ? savingDob:defaultDOB }" name="dob" id="sales-illu-dob" placeholder="" readonly />
									<span class="input-group-addon add-on"><img class="arrow" src="<%=request.getContextPath()%>/resources/images/savie/arrow-down.png"></span>                        
								</div>
								<span class="error-msg-dob hideSpan" id="promo-code-dateOfBirth"><fmt:message key="savie.planDetails.birth.above" bundle="${msg}" /></span>
								<span class="error-msg-promo hideSpan" id="promo-code-dateOfBirthEmpty"><fmt:message key="savie.planDetails.birth.empty" bundle="${msg}" /></span>
							</div>
						</div>

					  <!--  <p id="crediting-rate"><fmt:message key="savie.planDetails.Guaranteed.rate" bundle="${msg}" /></p>-->
					</div>

					<div id="information">
						<div id="pictures">
							<img id="birthday" src="<%=request.getContextPath()%>/resources/images/savie/promo-img.png">
						</div>

						<h2><fmt:message key="saviee.planoption.promocode" bundle="${msg}" /><!--
							<button type="button" class="info-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="<fmt:message key="savie.planDetails.promo.code.tooltips" bundle="${msg}" />"></button>-->
						</h2>
						<input value="${savingPromocode }" name="promocode" type="text" placeholder="<fmt:message key="saviee.planoption.promocode.placeholder" bundle="${msg}" />" class="promocode" id="promocode">
						<span class="error-msg-promo hideSpan" id="promo-code-errmsg">Invalid promo code. Try again?</span>
					</div>
					<div class="apply">
						<button onclick='getSaviePlanDetails()' class="btn btn-orange calculate" type="button" id="sales-illu-apply-now"><fmt:message key="saviee.planoption.calculate.button" bundle="${msg}" /><span class="icon icon-chevron-thin-right"></span></button>
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
	                                <h3 class="desktop-right"><fmt:message key="saviee.planoption.summarytable1.remark" bundle="${msg}" /><span id="3rd_policy_year">0</span><fmt:message key="savie.planDetails.End.of.3rd.years.part2" bundle="${msg}" /></h3>
	                            </div>
	                            <div class="rate-table">
	                                <table class="table table-hover">
	                                    <thead>
	                                    <tr>
	                                        <th class="left-border">
	                                        	<button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="<fmt:message key="savie.planDetails.End.of.policy.year.tooltips" bundle="${msg}" />"></button><fmt:message key="saviee.planoption.summarytable1.col1" bundle="${msg}" /><fmt:message key="savie.planDetails.policy.year" bundle="${msg}" />
	                                        </th>
	                                        <th class="desktop-only"><fmt:message key="saviee.planoption.summarytable1.col2" bundle="${msg}" /></th>
	                                        <th class="premium">
	                                           	<button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="<fmt:message key="savie.planDetails.Total.paid.tooltips" bundle="${msg}" />"></button><fmt:message key="saviee.planoption.summarytable1.col3" bundle="${msg}" />
	                                        </th>
	                                        <th class="desktop-only">
	                                        	<button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="<fmt:message key="savie.planDetails.Account.value.tooltips" bundle="${msg}" />"></button><fmt:message key="saviee.planoption.summarytable1.col4" bundle="${msg}" />
	                                        </th>
	                                        <th class="right-border">
	                                        	<button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="<fmt:message key="savie.planDetails.Surrender.benefit.tooltips" bundle="${msg}" />"></button><fmt:message key="savie.planDetails.Surrender.benefit" bundle="${msg}" />
	                                        </th>
	                                    </tr>
	                                    </thead>
	                                    <tbody>
                                            <tr>    <td class="left-border">1</td>  <td class="black-text desktop-only" id="credit-rate-change-1"><span>3%</span></td>   <td class="black-text" id="premium-1"><span>$</span> 0</td> <td class="black-text desktop-only" id="account-value-1"><span>$</span> 0</td>    <td class="black-text right-border" id="surrender-1"><span>$</span> 0</td>    </tr>
                                            <tr>    <td class="left-border">2</td>  <td class="black-text desktop-only" id="credit-rate-change-2"><span>3%</span></td>   <td class="black-text" id="premium-2"><span>$</span> 0</td> <td class="black-text desktop-only" id="account-value-2"><span>$</span> 0</td>    <td class="black-text right-border" id="surrender-2"><span>$</span> 0</td>    </tr>
                                            <tr class="bottom-border">  <td class="left-border">3</td>  <td class="black-text desktop-only" id="credit-rate-change-3"><span>3%</span></td>   <td class="black-text" id="premium-3"><span>$</span> 0</td> <td class="black-text desktop-only" id="account-value-3"><span>$</span> 0</td>    <td class="black-text right-border" id="surrender-3"><span>$</span> 0</td>    </tr>
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
											<p class="hidden-md hidden-lg text-center"><fmt:message key="savie.planDetails.Check.rate" bundle="${msg}" /></p>
	                                    </div>  
	                                    <div class="col-md-6 col-xs-12 fwd-chart-col">
	                                        <div class="clearfix right-side">
	                                        	<div class="check-rate-box text-right hidden-xs hidden-sm">
		                                            <fmt:message key="savie.planDetails.Check.rate" bundle="${msg}" />
		                                        </div>
		                                        <div>
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
	                                        <th class="left-border"><button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="<fmt:message key="savie.planDetails.End.of.policy.year.tooltips" bundle="${msg}" />"></button><fmt:message key="saviee.planoption.summarytable1.col1" bundle="${msg}" /><fmt:message key="savie.planDetails.policy.year" bundle="${msg}" /></th>
											<th class="credit-rate desktop-only"><fmt:message key="savie.planDetails.annual.rate" bundle="${msg}" /></th>
	                                        <th class="premium"><button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="<fmt:message key="savie.planDetails.Total.paid.tooltips" bundle="${msg}" />"></button><fmt:message key="saviee.planoption.summarytable1.col3" bundle="${msg}" /></th>
	                                        <th class="desktop-only"><button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="<fmt:message key="savie.planDetails.Account.value.tooltips" bundle="${msg}" />"></button><fmt:message key="saviee.planoption.summarytable1.col4" bundle="${msg}" /></th>
	                                        <th class="right-border"><button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="<fmt:message key="savie.planDetails.Surrender.benefit.tooltips" bundle="${msg}" />"></button><fmt:message key="savie.planDetails.Surrender.benefit" bundle="${msg}" /></th>
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
	                                        <th class="left-border"><button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="<fmt:message key="savie.planDetails.End.of.policy.year.tooltips" bundle="${msg}" />"></button><fmt:message key="saviee.planoption.summarytable1.col1" bundle="${msg}" /><fmt:message key="savie.planDetails.policy.year" bundle="${msg}" /></th>
											<th class="credit-rate desktop-only"><fmt:message key="savie.planDetails.annual.rate" bundle="${msg}" /></th>
	                                        <th class="premium"><button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="<fmt:message key="savie.planDetails.Total.paid.tooltips" bundle="${msg}" />"></button><fmt:message key="saviee.planoption.summarytable1.col3" bundle="${msg}" /></th>
	                                        <th class="desktop-only"><button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="<fmt:message key="savie.planDetails.Account.value.tooltips" bundle="${msg}" />"></button><fmt:message key="saviee.planoption.summarytable1.col4" bundle="${msg}" /></th>
	                                        <th class="right-border"><button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="<fmt:message key="savie.planDetails.Surrender.benefit.tooltips" bundle="${msg}" />"></button><fmt:message key="savie.planDetails.Surrender.benefit" bundle="${msg}" /></th>
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
	                                        <th class="left-border"><button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="<fmt:message key="savie.planDetails.End.of.policy.year.tooltips" bundle="${msg}" />"></button><fmt:message key="saviee.planoption.summarytable1.col1" bundle="${msg}" /><fmt:message key="savie.planDetails.policy.year" bundle="${msg}" /></th>
											<th class="credit-rate desktop-only"><fmt:message key="savie.planDetails.annual.rate" bundle="${msg}" /></th>
	                                        <th class="premium"><button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="<fmt:message key="savie.planDetails.Total.paid.tooltips" bundle="${msg}" />"></button><fmt:message key="saviee.planoption.summarytable1.col3" bundle="${msg}" /></th>
	                                        <th class="desktop-only"><button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="<fmt:message key="savie.planDetails.Account.value.tooltips" bundle="${msg}" />"></button><fmt:message key="saviee.planoption.summarytable1.col4" bundle="${msg}" /></th>
	                                        <th class="right-border"><button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="<fmt:message key="savie.planDetails.Surrender.benefit.tooltips" bundle="${msg}" />"></button><fmt:message key="savie.planDetails.Surrender.benefit" bundle="${msg}" /></th>
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
	                                        <th class="left-border"><button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="<fmt:message key="savie.planDetails.End.of.policy.year.tooltips" bundle="${msg}" />"></button><fmt:message key="saviee.planoption.summarytable1.col1" bundle="${msg}" /><fmt:message key="savie.planDetails.policy.year" bundle="${msg}" /></th>
											<th class="credit-rate desktop-only"><fmt:message key="savie.planDetails.annual.rate" bundle="${msg}" /></th>
	                                        <th class="premium"><button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="<fmt:message key="savie.planDetails.Total.paid.tooltips" bundle="${msg}" />"></button><fmt:message key="saviee.planoption.summarytable1.col3" bundle="${msg}" /></th>
	                                        <th class="desktop-only"><button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="<fmt:message key="savie.planDetails.Account.value.tooltips" bundle="${msg}" />"></button><fmt:message key="saviee.planoption.summarytable1.col4" bundle="${msg}" /></th>
	                                        <th class="right-border"><button type="button" class="info-table-tip btn-tooltip-clear" data-toggle="tooltip" data-placement="right" title="<fmt:message key="savie.planDetails.Surrender.benefit.tooltips" bundle="${msg}" />"></button><fmt:message key="savie.planDetails.Surrender.benefit" bundle="${msg}" /></th>
	                                    </tr>
	                                    </thead>
	                                    <tbody>
	                                        <tr>    
												<td class="left-border" id='policy-year-4-1'>5</td>  
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
				<!--	<h2><fmt:message key="savie.planDetails.login.create" bundle="${msg}" /></h2> -->
				<button id="create-account" type="button" class="btn btn-orange proceed-btn"><fmt:message key="saviee.planoption.createaccount.button" bundle="${msg}" /></button>
				<button id="proceed" type="button" class="btn btn-orange proceed-btn hidden" onclick="goServiceCenter();">Proceed</button>
				<div class="login-holder">
					<p><fmt:message key="saviee.planoption.login.1" bundle="${msg}" /></p>
					<button id="made-decision-next-btn" type="button" class="login-button"><fmt:message key="saviee.planoption.login.2" bundle="${msg}" /></button>
					<p><fmt:message key="saviee.planoption.login.3" bundle="${msg}" /></p>
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

			<!-- <a href="#" id="gotop" class="go-top go-top-default"><img src="<%=request.getContextPath()%>/resources/images/savie/back-to-top.png"></a>--> 
			
			<!-- Thank you -->
			<div class="modal fade thank-you-modal" id="thankYouModal" role="dialog" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content thank-you-content">
						<img src="<%=request.getContextPath()%><fmt:message key="savie.planDetails.thank.you.image.desktop" bundle="${msg}" />" class="img-responsive hidden-xs">
						<img src="<%=request.getContextPath()%><fmt:message key="savie.planDetails.thank.you.image.mobile" bundle="${msg}" />" class="img-responsive visible-xs">
						<button id="thank-you-continue" class="btn next" onclick="goServiceCenter();"><fmt:message key="savie.planDetails.thank.you.btn.text" bundle="${msg}" /></button>
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
		<!--  <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/vendor/bootstrap-datepicker.min.js"></script>-->
		<script src="<%=request.getContextPath()%>/resources/js/savie/bootstrap-slider.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/savie/highcharts.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/savie/fwd-chart.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/savie/savie.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/vendor/bootstrap-datepicker.min.js"></script>
		<script type="text/javascript">	
		        $(function() {
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
				if($('#username').data('userid')!=null) {
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

				var thankyou = "${thankyou }";
				if(thankyou == "thankyou" && "${authenticate}" == "true" && "${authenticate}" != "*DIRECTGI"){
					$('#thankYouModal').modal({backdrop: 'static', keyboard: false});
					$('#thankYouModal').modal('show');
				}
			});
		    			
			function goServiceCenter(){
				window.location.href= '${pageContext.request.contextPath}'+'/'+'${language}'+'/'+'savings-insurance/'+'${nextPageFlow2 }'; 
			}
		</script>
