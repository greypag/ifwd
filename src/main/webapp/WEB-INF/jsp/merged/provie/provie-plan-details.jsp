<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeQuoteBean"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="enhance" uri="http://pukkaone.github.com/jsp" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<fmt:setBundle basename="provie" var="provieMsg" />
<!DOCTYPE html>
<script type="text/javascript">
	var context = "${pageContext.request.contextPath}";	
	
	var languageP = "${language}";
	var affordabilityMin = 30000;
	var affordabilityPremium = 1000000;
	var affordabilityMinUSD = 3750;
	var affordabilityPremiumUSD = 125000;

	var option_rider_cancer = '<fmt:message key="provie.plandetails.rider3" bundle="${provieMsg}" />';
	var option_rider_term = '<fmt:message key="provie.plandetails.rider1" bundle="${provieMsg}" />';
	var option_rider_adb = '<fmt:message key="provie.plandetails.rider2" bundle="${provieMsg}" />';
</script>


<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/material.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/provie/provie-styles.css">
<link href="<%=request.getContextPath()%>/resources/css/mobiscroll.custom-2.17.2.min.css" rel="stylesheet" type="text/css" />


 
<div class="fwd-savie-wrapper savie-online-container with-breadcrumbs-steps provie-plan-select" id="plan-details-b-page">
	<!-- HEADER -->

	<!-- Breadcrumb Component Start-->
    <div class="container container-fluid container--breadcrumb">
		<c:set var="breadcrumbItems" value="breadcrumb.item.home"/>
		<c:set var="breadcrumbActive" value="0"/>

		<c:set var="breadcrumbItems">
			breadcrumb.item.home,breadcrumb.item.save,breadcrumb.item.provie,breadcrumb.item.plan.details
		</c:set>
		<c:set var="breadcrumbActive">3</c:set>

		<jsp:include page="/WEB-INF/jsp/merged/comp/breadcrumb.jsp">
			<jsp:param name="breadcrumbItems" value="${breadcrumbItems}"/>
			<jsp:param name="breadcrumbActive" value="${breadcrumbActive}"/>
		</jsp:include>
	</div>
	<!-- Breadcrumb Component End-->

	<!-- StepIndicator Component Start-->

	<c:set var="stepItems" value="stepindicator.selectplan"/>
	<c:set var="stepActive" value="0"/>

	<c:set var="stepItems">
		stepindicator.plan.details,stepindicator.appointment,stepindicator.confirmation
	</c:set>
	<c:set var="stepActive">0</c:set>

	<!--<div class="container-fluid fwd-full-container browse-holder">-->
	<jsp:include page="/WEB-INF/jsp/merged/comp/step-indicator.jsp">
		<jsp:param name="stepItems" value="${stepItems}"/>
		<jsp:param name="stepActive" value="${stepActive}"/>
	</jsp:include>
	<!--</div>-->

	<!-- StepIndicator Component End-->

	<div class="clearfix"></div>

	<div class="container-fluid fwd-full-container headerStick">
		<div class="plan-calculator-holder">
			<div class="fwd-container-limit container-fluid clearfix sidebar plan-form-holder">
				<div class="col-md-8">
					<div class="row mob-full">
						<h3 class="heading-title"><fmt:message key="provie.plandetails.title.plandeatils" bundle="${provieMsg}" /> <i data-toggle="tooltip" data-html="true" data-placement="right" title="<p class='bold'>一筆過供款</p><p class='info-content'>您可設定每月直接扣帳銀行戶口以支付保費。</p><p class='bold'>定期供款</p><p class='info-content'>您可設定每月直接扣帳銀行戶口以支付保費。</p>" class="fa hidden fa-info-circle info-tooltip"></i></h3>
						<div class="col-md-6">
							<div class="row">
								<div class="col-xs-12">
									<div class="selectDiv centreDiv gray-text-bg">
										<select name="payment-type" id="type-of-payment" class="form-control gray-dropdown pd-dropdown" data-bv-field="payment-type" >
											<option value="regular-payment" data-val="rp-HKD"><fmt:message key="provie.plandetails.dropdown.paymentmode.monthly.hkd" bundle="${provieMsg}" /></option>
											<option value="regular-payment" data-val="rp-USD"><fmt:message key="provie.plandetails.dropdown.paymentmode.monthly.usd" bundle="${provieMsg}" /></option>
											<option value="one-off-premium" data-val="sp-HKD" selected><fmt:message key="provie.plandetails.dropdown.paymentmode.oneoff.hkd" bundle="${provieMsg}" /></option>
											<option value="one-off-premium"  data-val="sp-USD"><fmt:message key="provie.plandetails.dropdown.paymentmode.oneoff.usd" bundle="${provieMsg}" /></option>
										</select>
										<img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg">
										<label class="mdl-textfield__label so-mdl-textfield-label custom-made-label" for="payment-type"><fmt:message key="provie.plandetails.text1" bundle="${provieMsg}" /></label>
									</div>
								</div>								
							</div>
						</div>
						<div class="col-md-6">
							<div class="row">
								<div class="col-xs-12 plan-dob">
									<div class="selectDiv centreDiv gray-text-bg">
										<input  name="plan-dob" id="plan-dob-datepicker" value="" class="form-control" />
										<img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg">
											<label class="mdl-textfield__label so-mdl-textfield-label custom-made-label" for="plan-dob"><fmt:message key="provie.plandetails.dropdown.dob" bundle="${provieMsg}" /></label>
									</div>
								</div>
<!-- 								
 -->
							</div>
						</div>
						<div class="col-md-6">
							<div class="row">
								<div class="col-xs-12" id="amount-slide-holder">
									
									<div class="mdl-custom-slider">
									   
											<label class="mdl-textfield__label so-mdl-textfield-label custom-made-label">
												<span class="pull-left"><fmt:message key="provie.plandetails.label.amount" bundle="${provieMsg}" /></span>
												<span class="pull-right">
													<span class="currency_switcher is_en"><span class="USD"><fmt:message key="provie.plandetails.currency.usd" bundle="${provieMsg}" /></span><span class="HKD"><fmt:message key="provie.plandetails.currency.hkd" bundle="${provieMsg}" /></span></span>
													<span id="range">100,000</span>
													<span class="currency_switcher is_chin"><span class="USD"><fmt:message key="provie.plandetails.currency.usd" bundle="${provieMsg}" /></span><span class="HKD"><fmt:message key="provie.plandetails.currency.hkd" bundle="${provieMsg}" /></span></span>
												</span>
											</label>
									  	<div>
										<input  class="span2 amount-slider" name="amount"
										value="100000"
										data-slider-min="30000"
										data-slider-max="1000000"
										data-slider-step="1000"
										data-slider-value="100000"
										data-slider-id="RC" id="R" data-slider-tooltip="hide" data-slider-handle="square" />
										</div> 
									</div>
									<div class="min-max-holder clearfix">
										<div class="pull-left text-left">
											<p><fmt:message key="provie.plandetails.label.amount.min" bundle="${provieMsg}" /></p>
											<p>
												<span class="currency_switcher is_en"><span class="USD"><fmt:message key="provie.plandetails.currency.usd" bundle="${provieMsg}" /></span><span class="HKD"><fmt:message key="provie.plandetails.currency.hkd" bundle="${provieMsg}" /></span></span>
												<span id="min-value">30,000</span>
												<span class="currency_switcher is_chin"><span class="USD"><fmt:message key="provie.plandetails.currency.usd" bundle="${provieMsg}" /></span><span class="HKD"><fmt:message key="provie.plandetails.currency.hkd" bundle="${provieMsg}" /></span></span></p>
										</div>
										<div class="pull-right text-right">
											<p><fmt:message key="provie.plandetails.label.amount.max" bundle="${provieMsg}" /></p>
											<p>
												<span class="currency_switcher is_en"><span class="USD"><fmt:message key="provie.plandetails.currency.usd" bundle="${provieMsg}" /></span><span class="HKD"><fmt:message key="provie.plandetails.currency.hkd" bundle="${provieMsg}" /></span></span>
												<span id="max-value">400,000</span>
												<span class="currency_switcher is_chin"><span class="USD"><fmt:message key="provie.plandetails.currency.usd" bundle="${provieMsg}" /></span><span class="HKD"><fmt:message key="provie.plandetails.currency.hkd" bundle="${provieMsg}" /></span></span>
											</p>
										</div>
									</div>
								</div>
								<div class="col-xs-12 hidden" id="plan-amount-holder">
									<div class="selectDiv centreDiv gray-text-bg">
										<select name="plan-amount" id="plan-amount" class="form-control gray-dropdown pd-dropdown" data-bv-field="plan-amount">
										   <!-- <option value="" disabled="" selected="">每月供款</option>
										   <option value="100000">100,000</option>
										   <option value="200000">200,000</option> -->
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
										   <option value="10000">11,000</option>
										   <option value="10000">12,000</option>
										   <option value="10000">13,000</option>
										   <option value="10000">14,000</option>
										   <option value="10000">15,000</option>
										   <option value="10000">16,000</option>
										   <option value="10000">17,000</option>
										   <option value="10000">18,000</option>
										   <option value="10000">19,000</option>
										   <option value="10000">20,000</option>
										</select>
										<img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg">
										<label class="mdl-textfield__label so-mdl-textfield-label custom-made-label" for="plan-amount">
												<fmt:message key="provie.plandetails.dropdown.monthly.prefix" bundle="${provieMsg}" />
												<%-- (
													<span class="currency_switcher">
														<span class="USD"><fmt:message key="provie.plandetails.currency.usd" bundle="${provieMsg}" /></span>
														<span class="HKD"><fmt:message key="provie.plandetails.currency.hkd" bundle="${provieMsg}" /></span>
													</span>
													
												) --%>
										</label>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="row">
								<div class="col-xs-12 hidden" id="total-years-holder">
									<div class="selectDiv centreDiv gray-text-bg">
										<select name="total-payment-years" id="total-payment-years" class="form-control gray-dropdown pd-dropdown" data-bv-field="total-payment-years">
										   <option value=""></option>
										</select>
										<img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg">
										<label class="mdl-textfield__label so-mdl-textfield-label custom-made-label" for="total-payment-years"><fmt:message key="provie.plandetails.dropdown.ttlpayment" bundle="${provieMsg}" /></label>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="row">
								<div class="col-xs-12 plan-promo-code">
									<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield" class="promo-code">
										<input id="promoCode" class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input"   />
										<label class="mdl-textfield__label so-mdl-textfield-label promocode-label" for="promoCode"><fmt:message key="provie.plandetails.promocode" bundle="${provieMsg}" /></label>
									</div>
									<span class="error-msg hidden" id="promoCodeErrorMsg"><fmt:message key="plan.detail.promo.code.error" bundle="${msg}" /></span>
								</div>
							</div>
						</div>
						<div class="col-md-12 visible-md visible-lg">
							<div class="row">
								<div class="col-md-6 col-md-push-6 col-xs-12 plan-calculate text-center">
									<button type="button" class="btn savie-common-btn" id="plan-calculate-btn"><fmt:message key="provie.plandetails.cta.calculate" bundle="${provieMsg}" /></button>
								</div>
							</div>
						</div>
						
					</div>
				</div>
				<div class="col-md-4 extra-rider er-color-swap">
					<div class="row">
						<h3 class="heading-title"><fmt:message key="provie.plandetails.riders.title" bundle="${provieMsg}" /></h3>
						<div class="col-xs-12">
							<div class="row">
								<div class="col-xs-12">
									<div class="selectDiv centreDiv gray-text-bg" id="payment-type">
										<select name="payment-type" id="type-of-extra-rider" class="form-control gray-dropdown pd-dropdown">
										   <option value="CANCER_BENEFIT" data-cls="p50" ><fmt:message key="provie.plandetails.rider3" bundle="${provieMsg}" /></option>
										   <option value="TERM_LIFE_BENEFIT" data-cls="p100" ><fmt:message key="provie.plandetails.rider1" bundle="${provieMsg}" /></option>
										   <option value="ACCIDENTIAL_DEATH_BENEFIT" data-cls="p500" ><fmt:message key="provie.plandetails.rider2" bundle="${provieMsg}" /></option>
										</select>
										<img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg">
										<label class="mdl-textfield__label so-mdl-textfield-label custom-made-label" for="payment-type"><fmt:message key="provie.plandetails.extrarider" bundle="${provieMsg}" /></label>
									</div>
								</div>
								<div class="col-xs-12 hidden-md hidden-lg">
									<a href="#extra-desc" data-toggle="collapse" class="btn-more collapsed"><fmt:message key="provie.plandetails.text.detail" bundle="${provieMsg}" /></a>
								</div>
								<div class="col-xs-12 hidden-md hidden-lg">
									<div class="collapse" id="extra-desc">
										<p class="p50 active"><fmt:message key="provie.plandetails.rider3.text" bundle="${provieMsg}" /></p>
										<p class="p100"><fmt:message key="provie.plandetails.rider1.text" bundle="${provieMsg}" /></p>
										<p class="p500"><fmt:message key="provie.plandetails.rider2.text" bundle="${provieMsg}" /></p>
									</div>
								</div>
								<div class="col-xs-12 visible-md visible-lg" id="extra-desc-desktop">
									<p class="p50 active"><fmt:message key="provie.plandetails.rider3.text" bundle="${provieMsg}" /></p>
									<p class="p100"><fmt:message key="provie.plandetails.rider1.text" bundle="${provieMsg}" /></p>
									<p class="p500"><fmt:message key="provie.plandetails.rider2.text" bundle="${provieMsg}" /></p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xs-12 hidden-md hidden-lg">
					<div class="row">
						<div class="col-md-6 col-md-push-6 col-xs-12 plan-calculate text-center">
							<button type="button" class="btn savie-common-btn" id="plan-calculate-btn-mob"><fmt:message key="provie.plandetails.cta.calculate" bundle="${provieMsg}" /></button>
						</div>
					</div>
				</div>

			</div>
		</div>
		</div>
<div class="container-fluid fwd-container" id="plan-details-wrapper">
	<div class="pd-summary-table" id="table-content-pd">
		<div class="summary-table">
			<div class="summary-table-head clearfix">
				<h4 class="summary-note-title"><fmt:message key="provie.plandetails.title.summary" bundle="${provieMsg}" /></h4>
				<!-- <p class="summary-note">如您於第三個保單年度退保，可獲得港幣<span id="3rd_policy_year" class="received-money">0</span></p> -->
			</div>
			<div class="table-content">
				<div class="rate-table hidden-xs hidden-sm">
					<table class="hidden" id="template">
						<tr id="">
							<tr class="tbl_desktop">
								<td class="policy-credit policy-number bold premiumYear"></td>
								<td class="policy-credit hidden-sm hidden-xs rate"></td>
								<td class="totalPaid"></td>
								<td class="hidden-sm hidden-xs accountValue"></td>
								<td class="hidden-sm hidden-xs deathBenefit"></td>
								<td class="cell-extra-rider er-color-swap riderValue"><span></span></td>
							</tr>
							<tr class="tbl_mob_header">
								<td class="premiumYear"></td>
							</tr>
							
							<tr class="tbl_mob">
								<td class="rate"></td>
								<td class="totalPaid"></td>
								<td class="accountValue"></td>
								<td class="deathBenefit"></td>
								<td class="cell-extra-rider er-color-swap riderValue"></td>
							</tr>
						</tr>
					</table>	
					<table class="table tbl_desktop">
						<thead>
							<tr>
								<th class="first-head"><fmt:message key="provie.plandetails.summary.year" bundle="${provieMsg}" /></th>
								<th class="hidden-sm hidden-xs"><fmt:message key="provie.plandetails.summary.interestrate" bundle="${provieMsg}" /><span data-toggle="tooltip" data-html="true" data-placement="right" title="<fmt:message key="provie.plandetails.summary.interestrate.tooltip" bundle="${provieMsg}" />" class="glyphicon glyphicon-info-sign default-pointer"></span></th>
								<th>
									<fmt:message key="provie.plandetails.summary.totalpremium" bundle="${provieMsg}" />
									(<span class="currency_switcher"><span class="USD"><fmt:message key="provie.plandetails.currency.usd" bundle="${provieMsg}" /></span><span class="HKD"><fmt:message key="provie.plandetails.currency.hkd" bundle="${provieMsg}" /></span></span>)
									<span data-toggle="tooltip" data-html="true" data-placement="right" title="<fmt:message key="provie.plandetails.summary.totalpremium.tooltip" bundle="${provieMsg}" />" class="glyphicon glyphicon-info-sign hidden-sm hidden-xs default-pointer"></span>
								</th>
								<th class="hidden-sm hidden-xs">
									<fmt:message key="provie.plandetails.summary.acctvalue" bundle="${provieMsg}" />
									(<span class="currency_switcher"><span class="USD"><fmt:message key="provie.plandetails.currency.usd" bundle="${provieMsg}" /></span><span class="HKD"><fmt:message key="provie.plandetails.currency.hkd" bundle="${provieMsg}" /></span></span>)
									<span data-toggle="tooltip" data-html="true" data-placement="right" title="<fmt:message key="provie.plandetails.summary.acctvalue.tooltip" bundle="${provieMsg}" />" class="glyphicon glyphicon-info-sign default-pointer"></span>
									/<br>
									<fmt:message key="provie.plandetails.summary.acctvalue2" bundle="${provieMsg}" />
																		(<span class="currency_switcher"><span class="USD"><fmt:message key="provie.plandetails.currency.usd" bundle="${provieMsg}" /></span><span class="HKD"><fmt:message key="provie.plandetails.currency.hkd" bundle="${provieMsg}" /></span></span>)
									<span data-toggle="tooltip" data-html="true" data-placement="right" title="<fmt:message key="provie.plandetails.summary.acctvalue2.tooltip" bundle="${provieMsg}" />" class="glyphicon glyphicon-info-sign hidden-sm hidden-xs default-pointer"></span>
									
								</th>
								<th class="hidden-sm hidden-xs">
									<fmt:message key="provie.plandetails.summary.deathbenefit" bundle="${provieMsg}" />
																		(<span class="currency_switcher"><span class="USD"><fmt:message key="provie.plandetails.currency.usd" bundle="${provieMsg}" /></span><span class="HKD"><fmt:message key="provie.plandetails.currency.hkd" bundle="${provieMsg}" /></span></span>)
									<span data-toggle="tooltip" data-html="true" data-placement="right" title="<fmt:message key="provie.plandetails.summary.deathbenefit.tooltip" bundle="${provieMsg}" />" class="glyphicon glyphicon-info-sign default-pointer"></span>
								</th>
								<!--th class="hidden-sm cell-extra-rider er-color-swap"><fmt:message key="provie.plandetails.summary.extrabenefit" bundle="${provieMsg}" /> <span class="cell-extra-rider-perc"></span> <span class="cell-extra-rider-name"></span> (<span class="currency_switcher"><span class="USD"><fmt:message key="provie.plandetails.currency.usd" bundle="${provieMsg}" /></span><span class="HKD"><fmt:message key="provie.plandetails.currency.hkd" bundle="${provieMsg}" /></span></span>)</th-->
								<th class="hidden-sm cell-extra-rider er-color-swap"><span class="cell-extra-rider-name"></span></th>
							</tr>
						</thead>
						<tbody>
							
						</tbody>
					</table>
					<p class="small"><fmt:message key="provie.plandetails.summary.totalpremium.remark" bundle="${provieMsg}" /></p>
				</div>

				<div class="tbl-rate-mobile visible-xs visible-sm clearfix sticky-table tbl_mob_header">
					<div class="sticky-header">
						<table>
							<thead>
								<tr>
									<th><fmt:message key="provie.plandetails.summary.year" bundle="${provieMsg}" /></th>
								</tr>
							</thead>
							<tbody>
								<tr class="pinkish-shade">
									<td>1</td>
								</tr>
								<tr>
									<td>2</td>
								</tr>
								<tr class="pinkish-shade">
									<td>3</td>
								</tr>
								<tr>
									<td>4</td>
								</tr>
								<tr class="pinkish-shade">
									<td>5</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="sticky-btns">
						<a href="javascript:void(0);" class="btn-left"><i class="fa fa-caret-left" aria-hidden="true"></i></a>
						<a href="javascript:void(0);" class="btn-right"><i class="fa fa-caret-right" aria-hidden="true"></i></a>
					</div>
					<div class="overflow-body">

						<table class="tbl_mob">
							<thead>
								<tr>
									<th><fmt:message key="provie.plandetails.summary.interestrate" bundle="${provieMsg}" /></th>
									<th>
										<fmt:message key="provie.plandetails.summary.totalpremium" bundle="${provieMsg}" />
										(<span class="currency_switcher"><span class="USD"><fmt:message key="provie.plandetails.currency.usd" bundle="${provieMsg}" /></span><span class="HKD"><fmt:message key="provie.plandetails.currency.hkd" bundle="${provieMsg}" /></span></span>)
									</th>
									<th>
										<fmt:message key="provie.plandetails.summary.acctvalue" bundle="${provieMsg}" />/<br>
										(<span class="currency_switcher"><span class="USD"><fmt:message key="provie.plandetails.currency.usd" bundle="${provieMsg}" /></span><span class="HKD"><fmt:message key="provie.plandetails.currency.hkd" bundle="${provieMsg}" /></span></span>)
										<fmt:message key="provie.plandetails.summary.acctvalue2" bundle="${provieMsg}" />
										(<span class="currency_switcher"><span class="USD"><fmt:message key="provie.plandetails.currency.usd" bundle="${provieMsg}" /></span><span class="HKD"><fmt:message key="provie.plandetails.currency.hkd" bundle="${provieMsg}" /></span></span>)
										</th>
									<th><fmt:message key="provie.plandetails.summary.deathbenefit" bundle="${provieMsg}" /> (<span class="currency_switcher"><span class="USD"><fmt:message key="provie.plandetails.currency.usd" bundle="${provieMsg}" /></span><span class="HKD"><fmt:message key="provie.plandetails.currency.hkd" bundle="${provieMsg}" /></span></span>)</th>
									<!--th class="cell-extra-rider er-color-swap"><fmt:message key="provie.plandetails.summary.extrabenefit" bundle="${provieMsg}" /> <span class="cell-extra-rider-perc"></span> <span class="cell-extra-rider-name"></span> (<span class="currency_switcher"><span class="USD"><fmt:message key="provie.plandetails.currency.usd" bundle="${provieMsg}" /></span><span class="HKD"><fmt:message key="provie.plandetails.currency.hkd" bundle="${provieMsg}" /></span></span>)</th-->
									<th class="cell-extra-rider er-color-swap"><span class="cell-extra-rider-name"></span></th>
								</tr>
							</thead>
							<tbody></tbody>
						</table>
					</div>
					<p class="small"><fmt:message key="provie.plandetails.summary.totalpremium.remark" bundle="${provieMsg}" /></p>
				</div>
			</div>
			<div class="collapse" id="after-5-years-container">
				<div class="crediting-rate">
					<h4 class="crediting-rate-title"><fmt:message key="provie.plandetails.summary.rate" bundle="${provieMsg}" /></h4>
					<div class="rate-buttons">
						<button data-toggle="tooltip" data-html="true" data-placement="right" title='<p class="bold">保守假設基礎</p>' class="rate-btn active" type="button" data-val="0">0%</button>
						<button data-toggle="tooltip" data-html="true" data-placement="right" title='<p class="bold">現時假設基礎</p>' class="rate-btn" type="button" data-val="1">1%</button>
						<button class="rate-btn" type="button" data-val="2">2%</button>
						<!--<button class="rate-btn" id="rate-4" type="button">4%</button>-->
					</div>
				</div>
				<div class="table-content" id="after-5-years">
					<div class="hidden-xs hidden-sm">
						
					
						<div id="rate-table-0" class="rate-table">
							<table class="table">
								<thead>
									<tr>
										<th class="first-head"><fmt:message key="provie.plandetails.summary.year" bundle="${provieMsg}" /></th>
										<th class="hidden-sm hidden-xs"><fmt:message key="provie.plandetails.summary.interestrate.extra" bundle="${provieMsg}" /><span data-toggle="tooltip" data-html="true" data-placement="right" title="<fmt:message key="provie.plandetails.summary.interestrate.tooltip" bundle="${provieMsg}" />" class="glyphicon glyphicon-info-sign default-pointer"></span></th>
										<th>
											<fmt:message key="provie.plandetails.summary.totalpremium" bundle="${provieMsg}" />
											(<span class="currency_switcher"><span class="USD"><fmt:message key="provie.plandetails.currency.usd" bundle="${provieMsg}" /></span><span class="HKD"><fmt:message key="provie.plandetails.currency.hkd" bundle="${provieMsg}" /></span></span>)
											<span data-toggle="tooltip" data-html="true" data-placement="right" title="<fmt:message key="provie.plandetails.summary.totalpremium.tooltip" bundle="${provieMsg}" />" class="glyphicon glyphicon-info-sign hidden-sm hidden-xs default-pointer"></span>
										</th>
										<th class="hidden-sm hidden-xs">
											<fmt:message key="provie.plandetails.summary.acctvalue" bundle="${provieMsg}" />
											(<span class="currency_switcher"><span class="USD"><fmt:message key="provie.plandetails.currency.usd" bundle="${provieMsg}" /></span><span class="HKD"><fmt:message key="provie.plandetails.currency.hkd" bundle="${provieMsg}" /></span></span>)
											<span data-toggle="tooltip" data-html="true" data-placement="right" title="<fmt:message key="provie.plandetails.summary.acctvalue.tooltip" bundle="${provieMsg}" />" class="glyphicon glyphicon-info-sign default-pointer"></span>
											/<br>
											<fmt:message key="provie.plandetails.summary.acctvalue2" bundle="${provieMsg}" />
																				(<span class="currency_switcher"><span class="USD"><fmt:message key="provie.plandetails.currency.usd" bundle="${provieMsg}" /></span><span class="HKD"><fmt:message key="provie.plandetails.currency.hkd" bundle="${provieMsg}" /></span></span>)
											<span data-toggle="tooltip" data-html="true" data-placement="right" title="<fmt:message key="provie.plandetails.summary.acctvalue2.tooltip" bundle="${provieMsg}" />" class="glyphicon glyphicon-info-sign hidden-sm hidden-xs default-pointer"></span>
											
										</th>
										<th class="hidden-sm hidden-xs">
											<fmt:message key="provie.plandetails.summary.deathbenefit" bundle="${provieMsg}" />
																				(<span class="currency_switcher"><span class="USD"><fmt:message key="provie.plandetails.currency.usd" bundle="${provieMsg}" /></span><span class="HKD"><fmt:message key="provie.plandetails.currency.hkd" bundle="${provieMsg}" /></span></span>)
											<span data-toggle="tooltip" data-html="true" data-placement="right" title="<fmt:message key="provie.plandetails.summary.deathbenefit.tooltip" bundle="${provieMsg}" />" class="glyphicon glyphicon-info-sign default-pointer"></span>
										</th>
										<!--th class="hidden-sm cell-extra-rider er-color-swap"><fmt:message key="provie.plandetails.summary.extrabenefit" bundle="${provieMsg}" /> <span class="cell-extra-rider-perc"></span> <span class="cell-extra-rider-name"></span> (<span class="currency_switcher"><span class="USD"><fmt:message key="provie.plandetails.currency.usd" bundle="${provieMsg}" /></span><span class="HKD"><fmt:message key="provie.plandetails.currency.hkd" bundle="${provieMsg}" /></span></span>)</th-->
										<th class="hidden-sm cell-extra-rider er-color-swap"><span class="cell-extra-rider-name"></span></th>
									</tr>
								</thead>
								<tbody>
									
								</tbody>
							</table>
							<p class="small"><fmt:message key="provie.plandetails.summary.totalpremium.remark" bundle="${provieMsg}" /></p>
						</div>
						<div id="rate-table-1" class="rate-table">
							<table class="table">
								<thead>
									<tr>
										<th class="first-head"><fmt:message key="provie.plandetails.summary.year" bundle="${provieMsg}" /></th>
										<th class="hidden-sm hidden-xs"><fmt:message key="provie.plandetails.summary.interestrate.extra" bundle="${provieMsg}" /><span data-toggle="tooltip" data-html="true" data-placement="right" title="<fmt:message key="provie.plandetails.summary.interestrate.tooltip" bundle="${provieMsg}" />" class="glyphicon glyphicon-info-sign default-pointer"></span></th>
										<th>
											<fmt:message key="provie.plandetails.summary.totalpremium" bundle="${provieMsg}" />
											(<span class="currency_switcher"><span class="USD"><fmt:message key="provie.plandetails.currency.usd" bundle="${provieMsg}" /></span><span class="HKD"><fmt:message key="provie.plandetails.currency.hkd" bundle="${provieMsg}" /></span></span>)
											<span data-toggle="tooltip" data-html="true" data-placement="right" title="<fmt:message key="provie.plandetails.summary.totalpremium.tooltip" bundle="${provieMsg}" />" class="glyphicon glyphicon-info-sign hidden-sm hidden-xs default-pointer"></span>
										</th>
										<th class="hidden-sm hidden-xs">
											<fmt:message key="provie.plandetails.summary.acctvalue" bundle="${provieMsg}" />
											(<span class="currency_switcher"><span class="USD"><fmt:message key="provie.plandetails.currency.usd" bundle="${provieMsg}" /></span><span class="HKD"><fmt:message key="provie.plandetails.currency.hkd" bundle="${provieMsg}" /></span></span>)
											<span data-toggle="tooltip" data-html="true" data-placement="right" title="<fmt:message key="provie.plandetails.summary.acctvalue.tooltip" bundle="${provieMsg}" />" class="glyphicon glyphicon-info-sign default-pointer"></span>
											/<br>
											<fmt:message key="provie.plandetails.summary.acctvalue2" bundle="${provieMsg}" />
																				(<span class="currency_switcher"><span class="USD"><fmt:message key="provie.plandetails.currency.usd" bundle="${provieMsg}" /></span><span class="HKD"><fmt:message key="provie.plandetails.currency.hkd" bundle="${provieMsg}" /></span></span>)
											<span data-toggle="tooltip" data-html="true" data-placement="right" title="<fmt:message key="provie.plandetails.summary.acctvalue2.tooltip" bundle="${provieMsg}" />" class="glyphicon glyphicon-info-sign hidden-sm hidden-xs default-pointer"></span>
											
										</th>
										<th class="hidden-sm hidden-xs">
											<fmt:message key="provie.plandetails.summary.deathbenefit" bundle="${provieMsg}" />
																				(<span class="currency_switcher"><span class="USD"><fmt:message key="provie.plandetails.currency.usd" bundle="${provieMsg}" /></span><span class="HKD"><fmt:message key="provie.plandetails.currency.hkd" bundle="${provieMsg}" /></span></span>)
											<span data-toggle="tooltip" data-html="true" data-placement="right" title="<fmt:message key="provie.plandetails.summary.deathbenefit.tooltip" bundle="${provieMsg}" />" class="glyphicon glyphicon-info-sign default-pointer"></span>
										</th>
										<!--th class="hidden-sm cell-extra-rider er-color-swap"><fmt:message key="provie.plandetails.summary.extrabenefit" bundle="${provieMsg}" /> <span class="cell-extra-rider-perc"></span> <span class="cell-extra-rider-name"></span> (<span class="currency_switcher"><span class="USD"><fmt:message key="provie.plandetails.currency.usd" bundle="${provieMsg}" /></span><span class="HKD"><fmt:message key="provie.plandetails.currency.hkd" bundle="${provieMsg}" /></span></span>)</th-->
										<th class="hidden-sm cell-extra-rider er-color-swap"><span class="cell-extra-rider-name"></span></th>
									</tr>
								</thead>
								<tbody>
									
								</tbody>
							</table>
							<p class="small"><fmt:message key="provie.plandetails.summary.totalpremium.remark" bundle="${provieMsg}" /></p>
						</div>
						<div id="rate-table-2" class="rate-table">
							<table class="table">
								<thead>
									<tr>
										<th class="first-head"><fmt:message key="provie.plandetails.summary.year" bundle="${provieMsg}" /></th>
										<th class="hidden-sm hidden-xs"><fmt:message key="provie.plandetails.summary.interestrate.extra" bundle="${provieMsg}" /><span data-toggle="tooltip" data-html="true" data-placement="right" title="<fmt:message key="provie.plandetails.summary.interestrate.tooltip" bundle="${provieMsg}" />" class="glyphicon glyphicon-info-sign default-pointer"></span></th>
										<th>
											<fmt:message key="provie.plandetails.summary.totalpremium" bundle="${provieMsg}" />
											(<span class="currency_switcher"><span class="USD"><fmt:message key="provie.plandetails.currency.usd" bundle="${provieMsg}" /></span><span class="HKD"><fmt:message key="provie.plandetails.currency.hkd" bundle="${provieMsg}" /></span></span>)
											<span data-toggle="tooltip" data-html="true" data-placement="right" title="<fmt:message key="provie.plandetails.summary.totalpremium.tooltip" bundle="${provieMsg}" />" class="glyphicon glyphicon-info-sign hidden-sm hidden-xs default-pointer"></span>
										</th>
										<th class="hidden-sm hidden-xs">
											<fmt:message key="provie.plandetails.summary.acctvalue" bundle="${provieMsg}" />
											(<span class="currency_switcher"><span class="USD"><fmt:message key="provie.plandetails.currency.usd" bundle="${provieMsg}" /></span><span class="HKD"><fmt:message key="provie.plandetails.currency.hkd" bundle="${provieMsg}" /></span></span>)
											<span data-toggle="tooltip" data-html="true" data-placement="right" title="<fmt:message key="provie.plandetails.summary.acctvalue.tooltip" bundle="${provieMsg}" />" class="glyphicon glyphicon-info-sign default-pointer"></span>
											/<br>
											<fmt:message key="provie.plandetails.summary.acctvalue2" bundle="${provieMsg}" />
																				(<span class="currency_switcher"><span class="USD"><fmt:message key="provie.plandetails.currency.usd" bundle="${provieMsg}" /></span><span class="HKD"><fmt:message key="provie.plandetails.currency.hkd" bundle="${provieMsg}" /></span></span>)
											<span data-toggle="tooltip" data-html="true" data-placement="right" title="<fmt:message key="provie.plandetails.summary.acctvalue2.tooltip" bundle="${provieMsg}" />" class="glyphicon glyphicon-info-sign hidden-sm hidden-xs default-pointer"></span>
											
										</th>
										<th class="hidden-sm hidden-xs">
											<fmt:message key="provie.plandetails.summary.deathbenefit" bundle="${provieMsg}" />
																				(<span class="currency_switcher"><span class="USD"><fmt:message key="provie.plandetails.currency.usd" bundle="${provieMsg}" /></span><span class="HKD"><fmt:message key="provie.plandetails.currency.hkd" bundle="${provieMsg}" /></span></span>)
											<span data-toggle="tooltip" data-html="true" data-placement="right" title="<fmt:message key="provie.plandetails.summary.deathbenefit.tooltip" bundle="${provieMsg}" />" class="glyphicon glyphicon-info-sign default-pointer"></span>
										</th>
										<!--th class="hidden-sm cell-extra-rider er-color-swap"><fmt:message key="provie.plandetails.summary.extrabenefit" bundle="${provieMsg}" /> <span class="cell-extra-rider-perc"></span> <span class="cell-extra-rider-name"></span> (<span class="currency_switcher"><span class="USD"><fmt:message key="provie.plandetails.currency.usd" bundle="${provieMsg}" /></span><span class="HKD"><fmt:message key="provie.plandetails.currency.hkd" bundle="${provieMsg}" /></span></span>)</th-->
										<th class="hidden-sm cell-extra-rider er-color-swap"><span class="cell-extra-rider-name"></span></th>
									</tr>
								</thead>
								<tbody>
									
								</tbody>
							</table>
							<p class="small"><fmt:message key="provie.plandetails.summary.totalpremium.remark" bundle="${provieMsg}" /></p>
						</div>
					</div>
					<div class="visible-xs visible-sm ">
						<div id="rate-table-0-mob" class="tbl-rate-mobile clearfix sticky-table">
						<div class="sticky-header">
							<table>
								<thead>
									<tr>
										<th><fmt:message key="provie.plandetails.summary.year" bundle="${provieMsg}" /></th>
									</tr>
								</thead>
								<tbody>
									
								</tbody>
							</table>
						</div>
						<div class="sticky-btns">
							<a href="javascript:void(0);" class="btn-left"><i class="fa fa-caret-left" aria-hidden="true"></i></a>
							<a href="javascript:void(0);" class="btn-right"><i class="fa fa-caret-right" aria-hidden="true"></i></a>
						</div>
						<div class="overflow-body">

							<table>
								<thead>
									<tr>
										<th><fmt:message key="provie.plandetails.summary.interestrate.extra" bundle="${provieMsg}" /></th>
										<th>
											<fmt:message key="provie.plandetails.summary.totalpremium" bundle="${provieMsg}" />
											(<span class="currency_switcher"><span class="USD"><fmt:message key="provie.plandetails.currency.usd" bundle="${provieMsg}" /></span><span class="HKD"><fmt:message key="provie.plandetails.currency.hkd" bundle="${provieMsg}" /></span></span>)
										</th>
										<th>
											<fmt:message key="provie.plandetails.summary.acctvalue" bundle="${provieMsg}" />/<br>
											(<span class="currency_switcher"><span class="USD"><fmt:message key="provie.plandetails.currency.usd" bundle="${provieMsg}" /></span><span class="HKD"><fmt:message key="provie.plandetails.currency.hkd" bundle="${provieMsg}" /></span></span>)
											<fmt:message key="provie.plandetails.summary.acctvalue2" bundle="${provieMsg}" />
											(<span class="currency_switcher"><span class="USD"><fmt:message key="provie.plandetails.currency.usd" bundle="${provieMsg}" /></span><span class="HKD"><fmt:message key="provie.plandetails.currency.hkd" bundle="${provieMsg}" /></span></span>)
											</th>
										<th><fmt:message key="provie.plandetails.summary.deathbenefit" bundle="${provieMsg}" /> (<span class="currency_switcher"><span class="USD"><fmt:message key="provie.plandetails.currency.usd" bundle="${provieMsg}" /></span><span class="HKD"><fmt:message key="provie.plandetails.currency.hkd" bundle="${provieMsg}" /></span></span>)</th>
										<!--th class="cell-extra-rider er-color-swap"><fmt:message key="provie.plandetails.summary.extrabenefit" bundle="${provieMsg}" /> <span class="cell-extra-rider-perc"></span> <span class="cell-extra-rider-name"></span> (<span class="currency_switcher"><span class="USD"><fmt:message key="provie.plandetails.currency.usd" bundle="${provieMsg}" /></span><span class="HKD"><fmt:message key="provie.plandetails.currency.hkd" bundle="${provieMsg}" /></span></span>)</th-->
										<th class="cell-extra-rider er-color-swap"><span class="cell-extra-rider-name"></span></th>
									</tr>
								</thead>
								<tbody>
									
								</tbody>
							</table>
						</div>
						<p class="small"><fmt:message key="provie.plandetails.summary.totalpremium.remark" bundle="${provieMsg}" /></p>
					</div>
					<div id="rate-table-1-mob" class="tbl-rate-mobile clearfix sticky-table">
						<div class="sticky-header">
							<table>
								<thead>
									<tr>
										<th><fmt:message key="provie.plandetails.summary.year" bundle="${provieMsg}" /></th>
									</tr>
								</thead>
								<tbody>
									
								</tbody>
							</table>
						</div>
						<div class="sticky-btns">
							<a href="javascript:void(0);" class="btn-left"><i class="fa fa-caret-left" aria-hidden="true"></i></a>
							<a href="javascript:void(0);" class="btn-right"><i class="fa fa-caret-right" aria-hidden="true"></i></a>
						</div>
						<div class="overflow-body">

							<table>
								<thead>
									<tr>
										<th><fmt:message key="provie.plandetails.summary.interestrate.extra" bundle="${provieMsg}" /></th>
										<th>
											<fmt:message key="provie.plandetails.summary.totalpremium" bundle="${provieMsg}" />
											(<span class="currency_switcher"><span class="USD"><fmt:message key="provie.plandetails.currency.usd" bundle="${provieMsg}" /></span><span class="HKD"><fmt:message key="provie.plandetails.currency.hkd" bundle="${provieMsg}" /></span></span>)
										</th>
										<th>
											<fmt:message key="provie.plandetails.summary.acctvalue" bundle="${provieMsg}" />/<br>
											(<span class="currency_switcher"><span class="USD"><fmt:message key="provie.plandetails.currency.usd" bundle="${provieMsg}" /></span><span class="HKD"><fmt:message key="provie.plandetails.currency.hkd" bundle="${provieMsg}" /></span></span>)
											<fmt:message key="provie.plandetails.summary.acctvalue2" bundle="${provieMsg}" />
											(<span class="currency_switcher"><span class="USD"><fmt:message key="provie.plandetails.currency.usd" bundle="${provieMsg}" /></span><span class="HKD"><fmt:message key="provie.plandetails.currency.hkd" bundle="${provieMsg}" /></span></span>)
											</th>
										<th><fmt:message key="provie.plandetails.summary.deathbenefit" bundle="${provieMsg}" /> (<span class="currency_switcher"><span class="USD"><fmt:message key="provie.plandetails.currency.usd" bundle="${provieMsg}" /></span><span class="HKD"><fmt:message key="provie.plandetails.currency.hkd" bundle="${provieMsg}" /></span></span>)</th>
										<!--th class="cell-extra-rider er-color-swap"><fmt:message key="provie.plandetails.summary.extrabenefit" bundle="${provieMsg}" /> <span class="cell-extra-rider-perc"></span> <span class="cell-extra-rider-name"></span> (<span class="currency_switcher"><span class="USD"><fmt:message key="provie.plandetails.currency.usd" bundle="${provieMsg}" /></span><span class="HKD"><fmt:message key="provie.plandetails.currency.hkd" bundle="${provieMsg}" /></span></span>)</th-->
										<th class="cell-extra-rider er-color-swap"><span class="cell-extra-rider-name"></span></th>
									</tr>
								</thead>
								<tbody>
									
								</tbody>
							</table>
						</div>
						<p class="small"><fmt:message key="provie.plandetails.summary.totalpremium.remark" bundle="${provieMsg}" /></p>
					</div>
					<div id="rate-table-2-mob" class="tbl-rate-mobile clearfix sticky-table">
						<div class="sticky-header">
							<table>
								<thead>
									<tr>
										<th><fmt:message key="provie.plandetails.summary.year" bundle="${provieMsg}" /></th>
									</tr>
								</thead>
								<tbody>
									
								</tbody>
							</table>
						</div>
						<div class="sticky-btns">
							<a href="javascript:void(0);" class="btn-left"><i class="fa fa-caret-left" aria-hidden="true"></i></a>
							<a href="javascript:void(0);" class="btn-right"><i class="fa fa-caret-right" aria-hidden="true"></i></a>
						</div>
						<div class="overflow-body">

							<table>
								<thead>
									<tr>
										<th><fmt:message key="provie.plandetails.summary.interestrate.extra" bundle="${provieMsg}" /></th>
										<th>
											<fmt:message key="provie.plandetails.summary.totalpremium" bundle="${provieMsg}" />
											(<span class="currency_switcher"><span class="USD"><fmt:message key="provie.plandetails.currency.usd" bundle="${provieMsg}" /></span><span class="HKD"><fmt:message key="provie.plandetails.currency.hkd" bundle="${provieMsg}" /></span></span>)
										</th>
										<th>
											<fmt:message key="provie.plandetails.summary.acctvalue" bundle="${provieMsg}" />/<br>
											(<span class="currency_switcher"><span class="USD"><fmt:message key="provie.plandetails.currency.usd" bundle="${provieMsg}" /></span><span class="HKD"><fmt:message key="provie.plandetails.currency.hkd" bundle="${provieMsg}" /></span></span>)
											<fmt:message key="provie.plandetails.summary.acctvalue2" bundle="${provieMsg}" />
											(<span class="currency_switcher"><span class="USD"><fmt:message key="provie.plandetails.currency.usd" bundle="${provieMsg}" /></span><span class="HKD"><fmt:message key="provie.plandetails.currency.hkd" bundle="${provieMsg}" /></span></span>)
											</th>
										<th><fmt:message key="provie.plandetails.summary.deathbenefit" bundle="${provieMsg}" /> (<span class="currency_switcher"><span class="USD"><fmt:message key="provie.plandetails.currency.usd" bundle="${provieMsg}" /></span><span class="HKD"><fmt:message key="provie.plandetails.currency.hkd" bundle="${provieMsg}" /></span></span>)</th>
										<!--th class="cell-extra-rider er-color-swap"><fmt:message key="provie.plandetails.summary.extrabenefit" bundle="${provieMsg}" /> <span class="cell-extra-rider-perc"></span> <span class="cell-extra-rider-name"></span> (<span class="currency_switcher"><span class="USD"><fmt:message key="provie.plandetails.currency.usd" bundle="${provieMsg}" /></span><span class="HKD"><fmt:message key="provie.plandetails.currency.hkd" bundle="${provieMsg}" /></span></span>)</th-->
										<th class="cell-extra-rider er-color-swap"><span class="cell-extra-rider-name"></span></th>
									</tr>
								</thead>
								<tbody>
									
								</tbody>
							</table>
						</div>
						<p class="small"><fmt:message key="provie.plandetails.summary.totalpremium.remark" bundle="${provieMsg}" /></p>
					</div>
					</div>	
					
				</div>
				
			
			</div>
			<div class="text-center">
				<button type="button" class="text-bold white-btn collapsed btn-after-5-years" data-toggle="collapse" data-target="#after-5-years-container" aria-expanded="false" ><span class="hidden after-5"><fmt:message key="provie.plandetails.5years.before" bundle="${provieMsg}" /></span><span class="first-5"><fmt:message key="provie.plandetails.5years.after" bundle="${provieMsg}" /></span></button>
			</div>
		</div>
	</div>
	<div class="plan-details-note-container hidden-sm hidden-xs hidden">
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
				<li class="pd-sf-tab text-center active" role="presentation">
					<a href="#pd-sf-sale-illustration-sample-pane" class="bold" aria-controls="pd-sf-sale-illustration-sample-pane" role="tab" data-toggle="tab"><fmt:message key="provie.plandetails.risks.exclusions.tab" bundle="${provieMsg}" /><br class="visible-xs"/><fmt:message key="provie.plandetails.risks.exclusions.tab.suffix" bundle="${provieMsg}" /></a>
				</li>
				<li class="pd-sf-tab pd-sf-tab-right text-center" role="presentation">
					<a href="#pd-sf-faq-and-glossary-pane" class="bold" aria-controls="pd-sf-faq-and-glossary-pane" role="tab" data-toggle="tab"><fmt:message key="provie.plandetails.glossary.title" bundle="${provieMsg}" /></a>
				</li>
		   </ul>
		</div>
		<div class="pd-sf-divider"></div>
		<div id="pd-sf-tab-content-container" class="container-fluid content-container-fluid">
			<div class="tab-content">
				<div role="tabpanel" class="tab-pane active" id="pd-sf-sale-illustration-sample-pane">
					<div class="panel-group" id="pd-sf-sale-illustration-sample-group" role="tablist" aria-multiselectable="true">
						<div class="panel panel-default pd-sf-sale-illustration-sample-panel">
						   <div class="panel-heading" role="tab" id="pd-sf-product-related">
							  <h4 class="panel-title">
								 <a class="collapsed" role="button" data-toggle="collapse" data-parent="#pd-sf-sale-illustration-sample-group" href="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
									<fmt:message key="provie.plandetails.productrisks.title" bundle="${provieMsg}" />
									<span class="pull-right">
									   <img src="<%=request.getContextPath()%>/resources/images/savie-2016/arrow-down1.png" />
									</span>
								 </a>
							  </h4>
						   </div>
						   <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="pd-sf-product-related">
							  <div class="panel-body">
								<div>
									<p><fmt:message key="provie.plandetails.risk1.title" bundle="${provieMsg}" /></p>
									<p><fmt:message key="provie.plandetails.risk1.text" bundle="${provieMsg}" /></p><br/>
									<p><fmt:message key="provie.plandetails.risk2.title" bundle="${provieMsg}" /></p>
									<p><fmt:message key="provie.plandetails.risk2.text" bundle="${provieMsg}" /></p><br/>
									<p><fmt:message key="provie.plandetails.risk3.title" bundle="${provieMsg}" /></p>
									<p><fmt:message key="provie.plandetails.risk3.text" bundle="${provieMsg}" /></p><br/>
									<p><fmt:message key="provie.plandetails.risk4.title" bundle="${provieMsg}" /></p>
									<p><fmt:message key="provie.plandetails.risk4.text" bundle="${provieMsg}" /></p><br/>
									<p><fmt:message key="provie.plandetails.risk5.title" bundle="${provieMsg}" /></p>
									<p><fmt:message key="provie.plandetails.risk5.text" bundle="${provieMsg}" /></p><br/>
									<p><fmt:message key="provie.plandetails.termination.title" bundle="${provieMsg}" /></p>
									<p><fmt:message key="provie.plandetails.termination.text" bundle="${provieMsg}" /></p><br/>
									<p><fmt:message key="provie.plandetails.rider.title" bundle="${provieMsg}" /></p>
									<p><fmt:message key="provie.plandetails.rider.text1" bundle="${provieMsg}" /></p>
									<ol>
										<li><fmt:message key="provie.plandetails.rider.text2" bundle="${provieMsg}" /></li>
										<li><fmt:message key="provie.plandetails.rider.text3" bundle="${provieMsg}" /></li>
										<li><fmt:message key="provie.plandetails.rider.text4" bundle="${provieMsg}" /></li>
										<li><fmt:message key="provie.plandetails.rider.text5" bundle="${provieMsg}" /></li>
										<li><fmt:message key="provie.plandetails.rider.text6" bundle="${provieMsg}" /></li>
									</ol>
									<p><fmt:message key="provie.plandetails.rider.text7" bundle="${provieMsg}" /></p>
									<ol>
										<li><fmt:message key="provie.plandetails.rider.text8" bundle="${provieMsg}" /></li>
										<li><fmt:message key="provie.plandetails.rider.text9" bundle="${provieMsg}" /></li>
										<li><fmt:message key="provie.plandetails.rider.text10" bundle="${provieMsg}" /></li>
										<li><fmt:message key="provie.plandetails.rider.text11" bundle="${provieMsg}" /></li>
										<li><fmt:message key="provie.plandetails.rider.text12" bundle="${provieMsg}" /></li>
										<li><fmt:message key="provie.plandetails.rider.text13" bundle="${provieMsg}" /></li>
									</ol>
									<p><fmt:message key="provie.plandetails.nonguranteedbenefits.title" bundle="${provieMsg}" /></p>
									<p><fmt:message key="provie.plandetails.nonguranteedbenefits.text1" bundle="${provieMsg}" /></p>
									<br>
									<p><fmt:message key="provie.plandetails.nonguranteedbenefits.text2" bundle="${provieMsg}" /></p>
									<p><fmt:message key="provie.plandetails.nonguranteedbenefits.text3" bundle="${provieMsg}" /></p>
								</div>
							  </div>
						   </div>
						</div>
						<div class="panel panel-default pd-sf-sale-illustration-sample-panel">
						   <div class="panel-heading" role="tab" id="pd-sf-claim-related">
							  <h4 class="panel-title">
								 <a class="collapsed" role="button" data-toggle="collapse" data-parent="#pd-sf-faq-and-glossary-group" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
									<fmt:message key="provie.plandetails.keyexclusion.title" bundle="${provieMsg}" />
									<span class="pull-right">
									   <img src="<%=request.getContextPath()%>/resources/images/savie-2016/arrow-down1.png" />
									</span>
								 </a>
							  </h4>
						   </div>
						   <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="pd-sf-claim-related">
							  <div class="panel-body">
							  	<p>
							  		<fmt:message key="provie.plandetails.keyexclusion.text0" bundle="${provieMsg}" /><br>
							  		<fmt:message key="provie.plandetails.keyexclusion.text1" bundle="${provieMsg}" />
							  	</p>
							  	<ol>
							  		<li><fmt:message key="provie.plandetails.keyexclusion.text2" bundle="${provieMsg}" /></li>
							  		<li><fmt:message key="provie.plandetails.keyexclusion.text3" bundle="${provieMsg}" /></li>
							  	</ol>
							  	<p><fmt:message key="provie.plandetails.keyexclusion.text4" bundle="${provieMsg}" /></p>
							  	<ol>
							  		<li><fmt:message key="provie.plandetails.keyexclusion.text5" bundle="${provieMsg}" /></li>
							  		<li><fmt:message key="provie.plandetails.keyexclusion.text6" bundle="${provieMsg}" /></li>
							  	</ol>
							  </div>
						   </div>
						</div>
					</div>
				</div>
				<div role="tabpanel" class="tab-pane" id="pd-sf-faq-and-glossary-pane">
					<div class="panel-group" id="pd-sf-faq-and-glossary-group" role="tablist" aria-multiselectable="true">
						<div class="panel panel-default pd-sf-faq-and-glossary-panel">
						   <div class="panel-heading" role="tab" id="pd-sf-product-related">
							  <h4 class="panel-title">
								 <a class="collapsed" role="button" data-toggle="collapse" data-parent="#pd-sf-faq-and-glossary-group" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
									<fmt:message key="provie.plandetails.glossary.title" bundle="${provieMsg}" />
									<span class="pull-right">
									   <img src="<%=request.getContextPath()%>/resources/images/savie-2016/arrow-down1.png" />
									</span>
								 </a>
							  </h4>
						   </div>
						   <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="pd-sf-product-related">
							  <div class="panel-body">
							  	<p><fmt:message key="provie.plandetails.glossary.pt1" bundle="${provieMsg}" /></p><br/>
							  	<ol>
						  			<li><fmt:message key="provie.plandetails.glossary.pt1.subpt1" bundle="${provieMsg}" /></li>
						  			<li><fmt:message key="provie.plandetails.glossary.pt1.subpt2" bundle="${provieMsg}" /></li>
						  		</ol><br/>
							  	<p><fmt:message key="provie.plandetails.glossary.pt2" bundle="${provieMsg}" /></p><br/>
							  	<p><fmt:message key="provie.plandetails.glossary.pt3" bundle="${provieMsg}" /></p><br/>
							  	<p><fmt:message key="provie.plandetails.glossary.pt4" bundle="${provieMsg}" /></p><br/>
							  	<p><fmt:message key="provie.plandetails.glossary.title.sub1" bundle="${provieMsg}" /></p>
							  	<ol>
							  		<li><fmt:message key="provie.plandetails.glossary.pt4.subpt1" bundle="${provieMsg}" /></li>
							  		<li><fmt:message key="provie.plandetails.glossary.pt4.subpt2" bundle="${provieMsg}" /></li>
							  		<li><fmt:message key="provie.plandetails.glossary.pt4.subpt3" bundle="${provieMsg}" /></li>
							  		<li><fmt:message key="provie.plandetails.glossary.pt4.subpt4" bundle="${provieMsg}" /></li>
							  		<li><fmt:message key="provie.plandetails.glossary.pt4.subpt5" bundle="${provieMsg}" /></li>
							  		<li><fmt:message key="provie.plandetails.glossary.pt4.subpt6" bundle="${provieMsg}" /></li>
							  		<li><fmt:message key="provie.plandetails.glossary.pt4.subpt7" bundle="${provieMsg}" /></li>
							  		<li><fmt:message key="provie.plandetails.glossary.pt4.subpt8" bundle="${provieMsg}" /></li>
							  	</ol><br/>
							  	<p><fmt:message key="provie.plandetails.glossary.pt5" bundle="${provieMsg}" /></p><br/>
							  	<p><fmt:message key="provie.plandetails.glossary.pt6" bundle="${provieMsg}" /></p><br/>
							  	<p><fmt:message key="provie.plandetails.glossary.pt7" bundle="${provieMsg}" /></p><br/>
							  	<p><fmt:message key="provie.plandetails.glossary.pt8" bundle="${provieMsg}" /></p><br/>
							  	<p><fmt:message key="provie.plandetails.glossary.pt9" bundle="${provieMsg}" /></p><br/>
							  	<p><fmt:message key="provie.plandetails.glossary.pt10" bundle="${provieMsg}" /></p><br/>
							  	<p><fmt:message key="provie.plandetails.glossary.pt11" bundle="${provieMsg}" /></p><br/>
							  	<p><fmt:message key="provie.plandetails.glossary.pt12" bundle="${provieMsg}" /></p><br/>
							  	<p><fmt:message key="provie.plandetails.glossary.pt13" bundle="${provieMsg}" /></p>
							  	<ol>
							  		<li><fmt:message key="provie.plandetails.glossary.pt13.subpt1" bundle="${provieMsg}" /></li>
							  		<li><fmt:message key="provie.plandetails.glossary.pt13.subpt2" bundle="${provieMsg}" /></li>
							  		<li><fmt:message key="provie.plandetails.glossary.pt13.subpt3" bundle="${provieMsg}" /></li>
							  		<li><fmt:message key="provie.plandetails.glossary.pt13.subpt4" bundle="${provieMsg}" /></li>
							  		<li><fmt:message key="provie.plandetails.glossary.pt13.subpt5" bundle="${provieMsg}" /></li>
							  		<li><fmt:message key="provie.plandetails.glossary.pt13.subpt6" bundle="${provieMsg}" /></li>
							  	</ol>
							  	<p><fmt:message key="provie.plandetails.glossary.title.sub2" bundle="${provieMsg}" /></p>
							  	<br/>
							  	<p><fmt:message key="provie.plandetails.glossary.pt14" bundle="${provieMsg}" /></p><br/>
							  	<p><fmt:message key="provie.plandetails.glossary.pt15" bundle="${provieMsg}" /></p><br/>
							  	<p><fmt:message key="provie.plandetails.glossary.pt16" bundle="${provieMsg}" /></p>	<br/>				  	
							  	<p><fmt:message key="provie.plandetails.glossary.pt17" bundle="${provieMsg}" /></p><br/>
							  	<p><fmt:message key="provie.plandetails.glossary.pt18" bundle="${provieMsg}" /></p><br/>
							  	<p><fmt:message key="provie.plandetails.glossary.pt19" bundle="${provieMsg}" /></p><br/>
							  	<p><fmt:message key="provie.plandetails.glossary.pt20" bundle="${provieMsg}" /></p>	<br/>						  	
							  	<p><fmt:message key="provie.plandetails.glossary.pt21" bundle="${provieMsg}" /></p><br/>
							  	<p><fmt:message key="provie.plandetails.glossary.pt22" bundle="${provieMsg}" /></p><br/>
							  	<p><fmt:message key="provie.plandetails.glossary.pt23" bundle="${provieMsg}" /></p><br/>
							  	<p><fmt:message key="provie.plandetails.glossary.pt24" bundle="${provieMsg}" /></p><br/>
							  	<p><fmt:message key="provie.plandetails.glossary.pt25" bundle="${provieMsg}" /></p><br/>
							  	<p><fmt:message key="provie.plandetails.glossary.pt26" bundle="${provieMsg}" /></p>
							  	
							  </div>
						   </div>
						</div>
					</div>
				</div>
				<p><fmt:message key="provie.plandetails.note.title" bundle="${provieMsg}" /><br><fmt:message key="provie.plandetails.note.text1" bundle="${provieMsg}" /></p>
				<br/>

				<ul>
					<li><fmt:message key="provie.plandetails.note.text2" bundle="${provieMsg}" /></li>
					<li><fmt:message key="provie.plandetails.note.text3" bundle="${provieMsg}" /></li>
					<li><fmt:message key="provie.plandetails.note.text4" bundle="${provieMsg}" /></li>
				</ul>
			</div>
		</div>
		<div class="next-btn text-center">
			<button type="button" id="btn-proceed" class="btn plan-details-btn savie-common-btn white-btn" style="color: #ff8200;"><fmt:message key="provie.plandetails.cta.appointment" bundle="${provieMsg}" /></button>
				<!-- <a href="javascript:void(0);" onclick="applyCentre();" class="pd-link">預約申請</a> -->

				<a id="btn-login" class="pd-link hidden">登入以繼續</a>
				<!-- <button type="button" id="btn-proceed" class="btn plan-details-btn savie-common-btn hidden white-btn">網上申請</button> -->
				<div class="btn__proceed_online js-display-savie-sp">
					<!-- <a id="btn-proceed" class="pd-link hidden">網上申請</a> -->
					<a class="pd-link hidden">網上申請</a>
					<!-- <p class="center">(將不能享受保費折扣優惠)</p> -->
				</div>
				<a id="btn-back" class="pd-link hidden">返回申請摘要</a>
		</div>
		<!-- MODALS / LIGHTBOXES -->
		<div class="modal fade common-welcome-modal" id="offline-online-modal" tabindex="-1" role="dialog">
			<div class="modal-dialog">
			    <div class="modal-content">
			    	<div class="row">
			    		<div class="col-xs-2 col-md-1 numbering-holder">
			    			<img src="<%=request.getContextPath()%><fmt:message key="savie.planDetails.oneoff.image.desktop" bundle="${msg}" />" class="visible-md visible-lg" />
			    			<img src="<%=request.getContextPath()%><fmt:message key="savie.planDetails.oneoff.image.mobile" bundle="${msg}" />" class="visible-xs visible-sm" />
			    		</div>
			    		<div class="col-xs-10 col-md-10" id="steps-holder">
			    			<h4 class="text-center"><fmt:message key="product.details.savie.step.title" bundle="${msg}" /></h4>
			    			<div id="step-1" class="step">
			    				<div class="media">
			    					<div class="media-left" id="step1-img-holder">
			    						 <img class="media-object" src="<%=request.getContextPath()%>/resources/images/savie-2016/book-icon.png" />
			    					</div>
			    					<div class="media-body">
			    						<p class="procedure"><fmt:message key="product.details.savie.step1.copy" bundle="${msg}" /></p>
			    					</div>
			    				</div>
			    			</div>
			    			<div id="step-2" class="step">
			    				<div class="media">
			    					<div class="media-left" id="step2-img-holder">
			    						  <img class="media-object" src="<%=request.getContextPath()%>/resources/images/savie-2016/note-icon.png" />
			    					</div>
			    					<div class="media-body">
			    						<p class="procedure"><fmt:message key="product.details.provie.step2.copy" bundle="${provieMsg}" /></p>
			    					</div>
			    				</div>
			    			</div>
			    			<div class="row" id="on-of-holder">
			    				<%-- <div class="col-md-6 col-xs-12" id="step-online">
			    					<div class="step">
					    				<div class="media">
					    					<div class="media-left" id="stepon-img-holder">
					    						 <img class="media-object" src="<%=request.getContextPath()%>/resources/images/savie-2016/pc-icon.png" />
					    					</div>
					    					<div class="media-body">
					    						<p class="procedure"><fmt:message key="product.details.savie.step3.copy" bundle="${msg}" /></p>
					    						<button class="btn savie-common-btn" id="online-application-btn"><fmt:message key="button.online.application" bundle="${msg}" /></button>
					    					</div>
					    				</div>
			    					</div>
			    				</div>
			    				<div class="or-word">
			    					<div id="or-mobile">
			    						<span><fmt:message key="label.icon.or" bundle="${msg}" /></span>
			    					</div>
			    				</div> --%>
			    				<div class="col-md-12 col-xs-12" id="step-offline">
			    					<div class="step">
					    				<div class="media">
					    					<div class="media-left">
					    						 <img class="media-object" src="<%=request.getContextPath()%>/resources/images/savie-2016/clockfold-icon.png" />
					    					</div>
					    					<div class="media-body">
					    						<p class="procedure"><fmt:message key="product.details.savie.step4.copy" bundle="${msg}" /></p>
					    					</div>
					    					<div class="text-center">
				    							<button class="btn savie-common-btn" id="offline-application-btn"><fmt:message key="button.offline.application" bundle="${msg}" /></button>
				    						</div>
					    				</div>
			    					</div>
			    				</div>
			    			</div>
			    		</div>
			    	</div>
			    </div>
			</div>
		</div>
		<!-- Thank you -->
		<div class="modal fade thank-you-modal" id="thankYouModal" role="dialog" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content thank-you-content">
					<img src="<%=request.getContextPath()%>/resources/images/savie/iFWD_o2o_infographic_desktop_CN_v2.jpg" class="img-responsive hidden-xs">
					<img src="<%=request.getContextPath()%>/resources/images/savie/iFWD_o2o_infographic_mobile_CN_v2.jpg" class="img-responsive visible-xs">
					<button id="thank-you-continue" class="btn next" onclick="goServiceCenter();">繼續</button>
				</div>
			</div>
		</div>
		<div class="modal fade common-welcome-modal" id="prev-savie-app-modal" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog">
		  <div class="modal-dialog">
			<div class="modal-content">
				<!-- <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button> -->
				<h4 class="text-center welcome-msg">歡迎回到Savie自助息投保網頁！<span id="fullName1" class="hidden"></span></h4>
				<p class="text-center description-msg">抱歉，每位會員只能於網上投保一份Savie自助息理財壽險。如閣下有任何疑問，敬請致電本公司之客戶熱線3123 3123。</p>
				<center><button class="btn savie-common-btn" id="make-appointment-btn">回到主頁</button></center>
			</div>
		  </div>
		</div>
		<div class="modal fade common-welcome-modal" id="review-fna-modal"  data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<h4 class="text-center welcome-msg">歡迎！ <span id="fullName"></span></h4>
					<p class="text-center description-msg">您過往曾經完成財務需要分析，您可以查看及修改您的財務需要分析，並更新產品推薦。</p>
					<center><button class="btn savie-common-btn" id="review-fna-btn">查看財務需要分析</button></center>
				</div>
			 </div>
		</div>
		<div class="modal fade common-welcome-modal" id="retrieve-application-modal" tabindex="-1" role="dialog">
		  <div class="modal-dialog">
			<div class="modal-content">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
				<h4 class="text-center welcome-msg">歡迎回來！ <span id="fullNames"></span></h4>
				<p class="text-center description-msg">您想要繼續申請，或是重新開始？</p>
				<center><button class="btn savie-common-btn" id="resume-btn">繼續</button><button class="btn savie-common-btn disabled-gray-btn" id="start-over-btn">重新開始</button></center>
			</div>
		  </div>
		</div>
	</div>
	  </div>
<div id="loadingDiv" class="waitingDiv" style="display: none; margin-left:auto; margin-right:auto;">
	<img style="width: 300px; height: 300px;"
		src="<%=request.getContextPath()%>/resources/images/loading.gif">
</div>
<!-- FOOTER -->

<script type="text/javascript">

	/*var current_date = new Date();
	var month_now = (parseInt((current_date.getMonth()+1), 10) + 100).toString().substr(1);
	var day_now = (parseInt(current_date.getDate(), 10) + 100).toString().substr(1);*/
	/* $('#sales-illu-dob').attr('placeholder',day_now +'-'+ month_now +'-'+ (current_date.getFullYear()-18)); */
	//$('#plan-dob-datepicker').val(day_now +'-'+ month_now +'-'+ (current_date.getFullYear()-18));

	var from = $('#plan-dob-datepicker').val().split("-");
	var birthdate = new Date(from[2], from[1] - 1, from[0]);
	var cur = new Date();
	var diff = cur-birthdate;
	var age = Math.floor(diff/31536000000); //the age val
	var max = 99;
	var looplimit = max - Number(age);

	//console.log(looplimit);
	$('#total-payment-years').html('');
	for(var i = 1; i <= looplimit; i++ ) {
		if(i == 3) {
			$('#total-payment-years').append('<option value='+i+' selected>'+i+'</option>');
		} else {
			$('#total-payment-years').append('<option value='+i+'>'+i+'</option>');
		}
	}

	$(document).ready(function () {
		/**20160725 - commented for initial html development**/
		//$('#loadingDiv').toggle();
		//$('body').addClass('modal-open');
		/****/
		//console.log('SP');
		
		if('SP' == 'RP') {
			$("#type-of-payment").val("regular-payment");
			$('#plan-amount-holder').removeClass('hidden');
			$('#amount-slide-holder').addClass('hidden');
			if($('#plan-dob-datepicker').val() != '') {
				$('#total-years-holder').removeClass('hidden');
			}

			//Hide SP only elements
			$('.js-display-savie-sp').css('display', 'none');
			$('.js-display-savie-rp').css('display', 'block');

		} else {
			$("#type-of-payment").val("one-off-premium");
			$('#plan-amount-holder').addClass('hidden');
			$('#amount-slide-holder').removeClass('hidden');
			$('#total-years-holder').addClass('hidden');

			//Display SP only elements
			$('.js-display-savie-sp').css('display', 'block');
			$('.js-display-savie-rp').css('display', 'none');
		}
		
		if('2'!=''){
			/*$('#plan-dob-datepicker').datepicker({
				format: "dd-mm-yyyy",
				startView: "decade",
				startDate: dob_start_date,
				endDate: dob_end_date,
				autoclose: true,
				startView: 2
			}).css('cursor', 'default');*/
		}

		$('#first-3-years-btn').on('click', function () {
			$('#after-3-years-container').toggle();
		});

		var dummy = true;
		// dummy condition for displaying the back / proceed / login button
		if(dummy) {
			var hasLoggedIn = true
			if(hasLoggedIn) {
				// display proceed button when user logged in
				$('#btn-proceed').removeClass('hidden');
			} else {
				// display login button when user not yet logged in
				$('#btn-login').removeClass('hidden');
			}
		} else {
			// display the back button
			$('#btn-back').removeClass('hidden');
		}

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

		/* $('#plan-dob').datepicker({
			format: "dd-mm-yyyy",
			startDate: '26-07-1946',
			endDate: '25-07-1998',
			autoclose: true,
			startView: 2
		}); */

		var dummy = false;
		// dummy condition for displaying online-offline-fna modal/lightbox
		if(dummy) {
			// show online-offline-fna modal
			$('#offline-online-modal').modal('show');

		}

		var dummy = false;
		// dummy condition for displaying previous-savie-application modal/lightbox
		if(dummy) {
			// show previous-savie-application modal
			$('#prev-savie-app-modal').modal('show');
		}

		var dummy = false;
		// dummy condition for displaying review-fna modal/lightbox
		if(dummy) {
			// show review-fna modal
			$('#review-fna-modal').modal('show');
		}

		var dummy = false;
		// dummy condition for displaying retrieve application modal/lightbox
		if(dummy) {
			// show retrieve application modal
			$('#retrieve-application-modal').modal('show');
		}

		//dummy condition for plan details if it is RP or SP
		var isRP = false;
		if(isRP) {
			//display plan details for RP here
		} else {
			//display plan details for SP here
		}

/*
		$("#plan-calculate-btn").click(function(){
			//return;
			$('#loadingDiv').toggle();
			$('body').addClass('modal-open');

			$("#errorMsg").html("");
			$("#apiData").html("");

			if($('#promoCode').val()!='' && $('#promoCodeErrorMsg').hasClass('hidden')){
				$('#promoCodeErrorMsg').removeClass('hidden');
			}else if ($('#promoCode').val()!='' && !$('#promoCodeErrorMsg').hasClass('hidden')){
				//do nothing
			}else{
				$('#promoCodeErrorMsg').addClass('hidden');
			}
			//getSavieOnlinePlandetails(false);
			getProvieRiderPlan(false);
		});
*/
		/*$('#rate-0').on('click', function() {
			$('.rate-buttons button').removeClass('active');
			$(this).addClass('active');
			$('#rate-table-0').removeClass('hidden');
			$('#rate-table-2').addClass('hidden');
			$('#rate-table-3').addClass('hidden');
			$('#rate-table-4').addClass('hidden');
		});

		$('#rate-2').on('click', function() {
			$('.rate-buttons button').removeClass('active');
			$(this).addClass('active');
			$('#rate-table-0').addClass('hidden');
			$('#rate-table-2').removeClass('hidden');
			$('#rate-table-3').addClass('hidden');
			$('#rate-table-4').addClass('hidden');
		});

		$('#rate-3').on('click', function() {
			$('.rate-buttons button').removeClass('active');
			$(this).addClass('active');
			$('#rate-table-0').addClass('hidden');
			$('#rate-table-2').addClass('hidden');
			$('#rate-table-3').removeClass('hidden');
			$('#rate-table-4').addClass('hidden');
		});

		$('#rate-4').on('click', function() {
			$('.rate-buttons button').removeClass('active');
			$(this).addClass('active');
			$('#rate-table-0').addClass('hidden');
			$('#rate-table-2').addClass('hidden');
			$('#rate-table-3').addClass('hidden');
			$('#rate-table-4').removeClass('hidden');
		});
		*/

		/* if($("#plan-dob-datepicker").val()!="") {
			setPaymentYears($("#plan-dob-datepicker").val())
		} */
		if('3'==''){
			getSavieOnlinePlandetails(true);
		} else {
			/**20160725 - commented for initial html development**/
			//getSavieOnlinePlandetails(false);
			/****/
		}

		//changing labels of promo code
		/*
		$('#promoCode').focus(function() {
			$('.promocode-label').text('推廣編號');
		}).focusout(function () {
			if($(this).val() == '' ) {
				$('.promocode-label').text('推廣編號(如適用)');
			} else {
				$('.promocode-label').text('推廣編號');
			}
		});
		*/

		/*$('#plan-dob-datepicker').focus(function () {
			$(this).parent().find('.custom-made-label').css({color: '#ff8200'});
		}).focusout(function (){
			$(this).parent().find('.custom-made-label').css({color: '#000000'});
		});*/
	
		$('.rate-btn').on('click', function (){
			$('.tooltip').hide();
		});
		
		
		$(document).on('click touchstart', function (){
			$('.tooltip').hide();
		});
		
		//begin of getProvieRiderEligibility
		
		var fromFna = '<%= request.getParameter("f") %>';
		var planType ='<%= request.getParameter("planType") %>';

		

		if (fromFna=='true') {
			$.ajax({
				//url:fwdApi.url.getProvieRiderEligibility,
				url: '<%=request.getContextPath()%>/api/provie/getProvieRiderEligibility',
				type:"get",
				
				cache:false,
				async:false,
				error:function(xhr, textStatus, errorThrown){
					var resp = $.parseJSON(xhr.responseText);
					console.log("expected error");
			    },
			    success:function(response){
			    	if(response){
			    		//alert('clicked1');
			    		console.log(response);
			    		
			    		if(!response.accidentalDeathBenefit){
			    			$("#type-of-extra-rider option[value='ACCIDENTIAL_DEATH_BENEFIT']").remove();
			    		}
			    		if(!response.cancerBenefit) {
			    			$("#type-of-extra-rider option[value='CANCER_BENEFIT']").remove();
			    		}
			    		if(!response.termLifeBenefit) {
			    			$("#type-of-extra-rider option[value='TERM_LIFE_BENEFIT']").remove();
			    		}
			    	}
			    }
			});
			//alert('provie-plan-detals ' + planType);
			if (planType=="RP") {
				$("#type-of-payment option[value='one-off-premium']").remove();
			} else if (planType=="SP") {
				$("#type-of-payment option[value='regular-payment']").remove();
			}
			
		}
		
        //end of getProvieRiderEligibility
		  
		
		$('.btn-after-5-years').on('click touchup', function(){
			if($('.btn-after-5-years').hasClass('collapsed')){
				$('.btn-after-5-years .first-5').addClass('hidden');
				$('.btn-after-5-years .after-5').removeClass('hidden');
			}else{
				$('.btn-after-5-years .first-5').removeClass('hidden');
				$('.btn-after-5-years .after-5').addClass('hidden');
			}
		});
		
	});

	// changing first/after 3 years button content
	function toggleImg() {
		if($('#first-3-years-btn').hasClass('up')) {
			$('#after-3').addClass('hidden');
			$('#first-3').removeClass('hidden');
			document.getElementById('arrow-img-years').src='/resources/images/savie-2016/arrow-up2.png';
			$('#first-3-years-btn').addClass('down');
			$('#first-3-years-btn').removeClass('up');
		} else {
			$('#after-3').removeClass('hidden');
			$('#first-3').addClass('hidden');
			document.getElementById('arrow-img-years').src='/resources/images/savie-2016/arrow-down2.png';
			$('#first-3-years-btn').addClass('up');
			$('#first-3-years-btn').removeClass('down');
		}
		return false;
	}
	
	$("#btn-proceed").on('click',function(){
		$("#offline-online-modal").modal();
	});

	/* $("#btn-proceed").on('click', function(){
		apply=false;
		//alert('clicked');
		var paymentMode =  $("#type-of-payment option:selected").attr('data-val');
		var str=paymentMode.split("-");
		var planCode="";
		if(str[0]=='sp'){
			planCode="PROVIE-SP";
		} else {
			planCode="PROVIE-RP";
		}
		if(str[1]=='USD') {
			planCode=planCode+"-USD";
		} else{
			planCode=planCode+"-HKD";
		}
		//console.log(planCode);
		//alert(planCode);
		window.location = '<%=request.getContextPath()%>/${language}/savings-insurance/provie-customer-service-centre' + '?planCode=' + planCode;
	}); */

	$("#online-application-btn").on('click', function(){
		$('#offline-online-modal').modal('hide');
		proceedLogin(null);
	});

	$("#offline-application-btn").on('click', function(){
		 
		apply=false;
		//alert('clicked');
		var paymentMode =  $("#type-of-payment option:selected").attr('data-val');
		var str=paymentMode.split("-");
		var planCode="";
		if(str[0]=='sp'){
			planCode="PROVIE-SP";
		} else {
			planCode="PROVIE-RP";
		}
		if(str[1]=='USD') {
			planCode=planCode+"-USD";
		} else{
			planCode=planCode+"-HKD";
		}
		//console.log(planCode);
		//alert(planCode);
		window.location = '<%=request.getContextPath()%>/${language}/savings-insurance/provie-customer-service-centre' + '?planCode=' + planCode;
		/* if("" == "true" && "" != "*DIRECTGI"){
			window.location = '/tc/savings-insurance/provie-customer-service-centre';
		}else{
			apply=true;
			$('#offline-online-modal').modal('hide');
			$('.login-info').addClass('hidden');
			$('#loginpopup .modal-dialog').removeClass('loginpopupext');
			$('#loginpopup #fna-check').val("false");
			$('#loginpopup #nav-bar-check').val("false");
			$('#loginpopup').modal('show');
		} */
	});

	function proceedLogin(url){
		if("" == "true" && "" != "*DIRECTGI"){
			saviePlanDetailsGoNext(url);
		}else{
			$('.modal').modal('hide');
			$('.login-info').removeClass('hidden');
			$('#loginpopup #fna-check').val("true");
			$('#loginpopup #nav-bar-check').val("false");
			$('#loginpopup .modal-dialog').addClass('loginpopupext');
			$('#loginpopup').modal('show');
		}
	}

	var apply=false;//判断是否点击proceed
	var nextPage;
	function saviePlanDetailsGoNext(url){
		if(apply){
			//window.location = '/tc/savings-insurance/customer-service-centre';
			$('#thankYouModal').modal('show');
		}else {
			if($("#type-of-payment").val() == 'regular-payment') {
				window.location = '/tc/savings-insurance/provie-customer-service-centre';
			}else {
				$.ajax({
					url:'/ajax/savings-insurance/getPurchaseHistoryByPlanCode',
					type:'get',
					cache:false,
					async:false,
					data:{
						"planCode" : "SAVIE-SP"
					},
					error:function(){
					},
					success:function(data){
						if(data != null && data.errMsgs == null && data.policies !=null && data.policies.length > 0){
							$('#loginpopup').modal('hide');
							$('#prev-savie-app-modal').modal({backdrop: 'static', keyboard: false});
							$('#prev-savie-app-modal').modal('show');
						}else{
							$.ajax({
								url:'/ajax/savings-insurance/getPolicyApplicationSaveforLater',
								type:'get',
								cache:false,
								async:false,
								error:function(){
								},
								success:function(data){
									if(data != null && data.errMsgs == null && data.nextPage !=null){
										$('#loginpopup').modal('hide');
										$('#retrieve-application-modal').modal('show');
										nextPage = data.nextPage;
									}
									else{
										if (url != null){
											window.location = url;
										} else {
											$.ajax({
												url:'/ajax/savings-insurance/show',
												type:'get',
												cache:false,
												async:false,
												error:function(){
												},
												success:function(data){
													$('#loginpopup').modal('hide');
													if(data != null && data.errMsgs == null && data.name !=null){
														$('#review-fna-modal').modal({backdrop: 'static', keyboard: false});
														$('#review-fna-modal').modal('show');
													}
													else{
														window.location = '/tc/FNA/financial-needs-analysis';
													}
												}
											});
										}
									}
								}
							});
						}
					}
				});
			}
		}
	}

	$("#make-appointment-btn").on('click', function(){
		
		window.location = '/tc/savings-insurance';
	});

	$("#back-home").on('click', function(){
		window.location = '/tc/savings-insurance';
	});

	$("#review-fna-btn").on('click', function(){
		window.location = '/tc/FNA/review';
	});

	$("#resume-btn").on('click', function(){
		window.location = '/'+nextPage;
	});

	$("#start-over-btn").on('click', function(){
		$.ajax({
			url:'/ajax/savings-insurance/clearPolicyApplication',
			type:'get',
			cache:false,
			async:false,
			error:function(){
			},
			success:function(data){
				if(data != null && data.errorMsg == null){
					window.location = '/tc/savings-insurance/sales-illustration';
				}
			}
		});
	});

	$(document).on('change','#plan-dob-datepicker',function(){
		if($(this).val()!="") {
			setPaymentYears($(this).val())
		}
	});

	function setPaymentYears(dob){

		var from = dob.split("-");
		var birthdate = new Date(from[2], from[1] - 1, from[0]);
		var cur = new Date();
		var diff = cur-birthdate;
		var age = Math.floor(diff/31536000000); //the age val
		var max = 99;
		var looplimit = max - Number(age);

		//console.log(looplimit);
		$('#total-payment-years').html('');
		for(var i = 1; i <= looplimit; i++ ) {
			$('#total-payment-years').append('<option value='+i+'>'+i+'</option>');
		}
	}
	function applyCentre(){
		if("" == "true" && "" != "*DIRECTGI"){
			window.location = '/tc/savings-insurance/provie-customer-service-centre';
		}else{
			apply=true;
			$('#loginpopup #fna-check').val("true");
			$('#loginpopup #nav-bar-check').val("false");
			$('#loginpopup').modal('show');
		}
	}

	function goServiceCenter() {
		window.location = '/tc/savings-insurance/provie-customer-service-centre';
	}

	/* // Detect iOS
	function iOS() {
	  var iDevices = [
		'iPad Simulator',
		'iPhone Simulator',
		'iPod Simulator',
		'iPad',
		'iPhone',
		'iPod'
	  ];

	  if (!!navigator.platform) {
		while (iDevices.length) {
		  if (navigator.platform === iDevices.pop()) {
			return true;
		  }
		}
	  }
	  return false;
	}
	if(iOS()) {
		$('.rate-btn').attr('style', 'width:73px;');
		//console.log('browser: true');
	} else {
		console.log('browser: false');
		//$('.rate-btn').attr('style', 'width:60px;');
	} */



</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/savie-2016/bootstrap-slider.js"></script></div>
<script src="<%=request.getContextPath()%>/resources/js/vendor/mobiscroll.custom-2.17.2.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/js/vendor/mobiscroll.i18n.en_fwd.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/js/vendor/mobiscroll.i18n.zh_fwd.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/provie/provie-app-uifn.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/provie/provie-rate-table.js"></script>

<jsp:include page="/WEB-INF/jsp/merged/comp/pop-up-temp.jsp"></jsp:include>
<script>
$(window).on('load',function(){
	var modal_id = 'stop-rp-modal';
	var img_path = '<fmt:message key="provie.stop.rp.modal.img" bundle="${msg}" />';
	var title = '<fmt:message key="provie.stop.rp.modal.title" bundle="${msg}" />';
	var content = '<fmt:message key="provie.stop.rp.modal.content" bundle="${msg}" />';
	var button = '<fmt:message key="savie.provie.stop.rp.modal.btn.continue" bundle="${msg}" />';
	//imgModal(modal_id, img_path, title, content, button);
	imgModal_noImg(modal_id, title, content, button);
	// $('#stop-rp-modal').modal('show');
});
</script>
