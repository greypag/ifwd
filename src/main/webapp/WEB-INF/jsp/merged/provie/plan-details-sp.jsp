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
	var languageP = "${language}";
	var affordabilityMin = 3000;
	var affordabilityPremium = 40000;
</script>


<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/material.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/provie/provie-styles.css">
<link href="<%=request.getContextPath()%>/resources/css/mobiscroll.custom-2.17.2.min.css" rel="stylesheet" type="text/css" />


 
<div class="fwd-savie-wrapper savie-online-container with-breadcrumbs-steps provie-plan-select" id="plan-details-b-page">
	<!-- HEADER -->

	<!-- Breadcrumb Component Start-->

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
												<span class="pull-left">供款總額</span>
												<span class="pull-right"><span id="range">100,000</span>港元</span>
											</label>
									  	<div>
										<input  class="span2 amount-slider" name="amount"
										value="100000"
										data-slider-min="30000"
										data-slider-max="400000"
										data-slider-step="1000"
										data-slider-value="100000"
										data-slider-id="RC" id="R" data-slider-tooltip="hide" data-slider-handle="square" />
										</div> 
									</div>
									<div class="min-max-holder clearfix">
										<div class="pull-left text-left">
											<p>最低供款</p>
											<p><span id="min-value">30,000</span>港元</p>
										</div>
										<div class="pull-right text-right">
											<p>最高供款</p>
											<p><span id="max-value">400,000</span>港元</p>
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
										</select>
										<img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg">
										<label class="mdl-textfield__label so-mdl-textfield-label custom-made-label" for="plan-amount">每月供款</label>
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
										<label class="mdl-textfield__label so-mdl-textfield-label custom-made-label" for="total-payment-years">供款年期</label>
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
									<span class="error-msg hidden" id="promoCodeErrorMsg">推廣編號無效。</span>
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
										   <option value="AccidentalDeathBenefit" data-cls="p50"><fmt:message key="provie.plandetails.rider3" bundle="${provieMsg}" /></option>
										   <option value="CancerBenefit" data-cls="p100"><fmt:message key="provie.plandetails.rider1" bundle="${provieMsg}" /></option>
										   <option value="TermLifeBenefit" data-cls="p500"><fmt:message key="provie.plandetails.rider2" bundle="${provieMsg}" /></option>
										</select>
										<img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg">
										<label class="mdl-textfield__label so-mdl-textfield-label custom-made-label" for="payment-type">Extra riders</label>
									</div>
								</div>
								<div class="col-xs-12 hidden-md hidden-lg">
									<a href="#extra-desc" data-toggle="collapse" class="btn-more collapsed">Detail</a>
								</div>
								<div class="col-xs-12 hidden-md hidden-lg">
									<div class="collapse" id="extra-desc">
										<p>Provides a Death Benefit where 100% of the sum insured will be payable 2 in the unfortunate event of the death of the insured. During the term of the Plan, if the death of the insured is highly likely within a year, a lump sum equivalent to the Death Benefit will be paid in advance2,3 to help you to cope with the financial strain.</p>
									</div>
								</div>
								<div class="col-xs-12 visible-md visible-lg">
									<p>Provides a Death Benefit where 100% of the sum insured will be payable 2 in the unfortunate event of the death of the insured. During the term of the Plan, if the death of the insured is highly likely within a year, a lump sum equivalent to the Death Benefit will be paid in advance2,3 to help you to cope with the financial strain.</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xs-12 hidden-md hidden-lg">
					<div class="row">
						<div class="col-md-6 col-md-push-6 col-xs-12 plan-calculate text-center">
							<button type="button" class="btn savie-common-btn" id="plan-calculate-btn"><fmt:message key="provie.plandetails.cta.calculate" bundle="${provieMsg}" /></button>
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
								<td class="policy-credit policy-number bold premiumYear">1</td>
								<td class="policy-credit hidden-sm hidden-xs rate">1.5</td>
								<td class="totalPaid">100,000</td>
								<td class="hidden-sm hidden-xs accountValue">100,997</td>
								<td class="hidden-sm hidden-xs deathBenefit">103,047</td>
								<td class="cell-extra-rider er-color-swap riderValue"><span>503,047</span></td>
							</tr>
							<tr class="tbl_mob_header">
								<td class="premiumYear">1</td>
							</tr>
							
							<tr class="tbl_mob">
								<td class="rate">1.5</td>
								<td class="totalPaid">100,000</td>
								<td class="accountValue">100,997</td>
								<td class="deathBenefit">103,047</td>
								<td class="cell-extra-rider er-color-swap riderValue">503,047</td>
							</tr>
						</tr>
					</table>	
					<table class="table tbl_desktop">
						<thead>
							<tr>
								<th class="first-head"><fmt:message key="provie.plandetails.summary.year" bundle="${provieMsg}" /></th>
								<th class="hidden-sm hidden-xs"><fmt:message key="provie.plandetails.summary.interestrate" bundle="${provieMsg}" /><span data-toggle="tooltip" data-html="true" data-placement="right" title="所有繳付的保費將於保單年期內享有下述有關的派息率。" class="glyphicon glyphicon-info-sign default-pointer"></span></th>
								<th><fmt:message key="provie.plandetails.summary.totalpremium" bundle="${provieMsg}" /><span data-toggle="tooltip" data-html="true" data-placement="right" title="由保單生效起，您已支付的保費總額。" class="glyphicon glyphicon-info-sign hidden-sm hidden-xs default-pointer"></span></th>
								<th class="hidden-sm hidden-xs"><fmt:message key="provie.plandetails.summary.acctvalue" bundle="${provieMsg}" /> <span data-toggle="tooltip" data-html="true" data-placement="right" title="所有已繳保費及利息的累積金額。" class="glyphicon glyphicon-info-sign default-pointer"></span><br><fmt:message key="provie.plandetails.summary.acctvalue2" bundle="${provieMsg}" /> <span data-toggle="tooltip" data-html="true" data-placement="right" title="當您結束保單時可獲得的金額。" class="glyphicon glyphicon-info-sign hidden-sm hidden-xs default-pointer"></span></th>
								<th class="hidden-sm hidden-xs"><fmt:message key="provie.plandetails.summary.deathbenefit" bundle="${provieMsg}" /> <span data-toggle="tooltip" data-html="true" data-placement="right" title="倘若被保人於保單生效期內死亡，受限於本保單其他條款 ，本公司於收到身故證明及本公司所規定的其他文件後，將支付戶口價值的百分之一百零五予受益人作為身故權益。" class="glyphicon glyphicon-info-sign default-pointer"></span></th>
								<th class="hidden-sm cell-extra-rider er-color-swap"><fmt:message key="provie.plandetails.summary.extrabenefit" bundle="${provieMsg}" /></th>
							</tr>
						</thead>
						<tbody>
							<tr class="pinkish-shade">
								<td class="policy-credit policy-number bold">1</td>
								<td class="policy-credit hidden-sm hidden-xs" id="credit-rate-change-1">1.5</td>
								<td id="premium-1">100,000</td>
								<td class="hidden-sm hidden-xs" id="account-value-1">100,997</td>
								<td class="hidden-sm hidden-xs" id="surrender-1">103,047</td>
								<td class="cell-extra-rider er-color-swap" id="death-1"><span>503,047</span></td>
							</tr>
							<tr>
								<td class="policy-credit policy-number bold">2</td>
								<td class="policy-credit hidden-sm hidden-xs" id="credit-rate-change-2">1.5</td>
								<td id="premium-2">100,000</td>
								<td class="hidden-sm hidden-xs" id="account-value-2">103,017</td>
								<td class="hidden-sm hidden-xs" id="surrender-2">106,047</td>
								<td class="cell-extra-rider er-color-swap" id="death-2"><span>506,047</span></td>
							</tr>
							<tr class="pinkish-shade">
								<td class="policy-credit policy-number bold">3</td>
								<td class="policy-credit hidden-sm hidden-xs" id="credit-rate-change-3">2</td>
								<td id="premium-3">100,000</td>
								<td class="hidden-sm hidden-xs" id="account-value-3">106,107</td>
								<td class="hidden-sm hidden-xs" id="surrender-3">109,047</td>
								<td class="cell-extra-rider er-color-swap" id="death-3"><span>509,047</span></td>
							</tr>
							<tr>
								<td class="policy-credit policy-number bold">4</td>
								<td class="policy-credit hidden-sm hidden-xs" id="credit-rate-change-3">2</td>
								<td id="premium-3">100,000</td>
								<td class="hidden-sm hidden-xs" id="account-value-3">109,997</td>
								<td class="hidden-sm hidden-xs" id="surrender-3">112,047</td>
								<td class="cell-extra-rider er-color-swap" id="death-3"><span>512,047</span></td>
							</tr>
							<tr class="pinkish-shade">
								<td class="policy-credit policy-number bold">5</td>
								<td class="policy-credit hidden-sm hidden-xs" id="credit-rate-change-3">3</td>
								<td id="premium-3">100,000</td>
								<td class="hidden-sm hidden-xs" id="account-value-3">111,997</td>
								<td class="hidden-sm hidden-xs" id="surrender-3">116,047</td>
								<td class="cell-extra-rider er-color-swap" id="death-3"><span>516,047</span></td>
							</tr>
						</tbody>
					</table>
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
									<th><fmt:message key="provie.plandetails.riders.interestrate" bundle="${provieMsg}" /></th>
									<th><fmt:message key="provie.plandetails.riders.totalpremium" bundle="${provieMsg}" /></th>
									<th><fmt:message key="provie.plandetails.riders.acctvalue" bundle="${provieMsg}" />/<br><fmt:message key="provie.plandetails.riders.acctvalue2" bundle="${provieMsg}" /></th>
									<th><fmt:message key="provie.plandetails.riders.deathbenefit" bundle="${provieMsg}" /></th>
									<th class="cell-extra-rider er-color-swap"><fmt:message key="provie.plandetails.riders.extrabenefit" bundle="${provieMsg}" /></th>
								</tr>
							</thead>
							<tbody>
								<tr class="pinkish-shade">
									<td>1.5</td>
									<td>100,000</td>
									<td>100,997</td>
									<td>103,047</td>
									<td class="cell-extra-rider er-color-swap">503,047</td>
								</tr>
								<tr>
									<td>1.5</td>
									<td>100,000</td>
									<td>103,997</td>
									<td>106,047</td>
									<td class="cell-extra-rider er-color-swap">506,047</td>
								</tr>
								<tr class="pinkish-shade">
									<td>2</td>
									<td>100,000</td>
									<td>106,997</td>
									<td>109,047</td>
									<td class="cell-extra-rider er-color-swap">509,047</td>
								</tr>
								<tr>
									<td>2</td>
									<td>100,000</td>
									<td>109,997</td>
									<td>112,047</td>
									<td class="cell-extra-rider er-color-swap">512,047</td>
								</tr>
								<tr class="pinkish-shade">
									<td>3</td>
									<td>100,000</td>
									<td>111,997</td>
									<td>116,047</td>
									<td class="cell-extra-rider er-color-swap">516,047</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="collapse" id="after-5-years-container">
				<div class="crediting-rate">
					<h4 class="crediting-rate-title">派息率(%)</h4>
					<div class="rate-buttons">
						<button data-toggle="tooltip" data-html="true" data-placement="right" title='<p class="bold">保守假設基礎</p>' class="rate-btn" id="rate-0" type="button">0%</button>
						<button data-toggle="tooltip" data-html="true" data-placement="right" title='<p class="bold">現時假設基礎</p>' class="rate-btn active" id="rate-2" type="button">2%</button>
						<button class="rate-btn" id="rate-3" type="button">3%</button>
						<!--<button class="rate-btn" id="rate-4" type="button">4%</button>-->
					</div>
				</div>
				<div class="table-content hidden-xs hidden-sm" id="after-5-years">
					<div id="rate-table-0" class="rate-table">
						<table class="table">
							<thead>
								<tr>
									<th class="first-head">保單年度終結</th>
									<th class="hidden-sm hidden-xs">保證派息率(%) <span data-toggle="tooltip" data-html="true" data-placement="right" title="所有繳付的保費將於保單年期內享有下述有關的派息率。" class="glyphicon glyphicon-info-sign default-pointer"></span></th>
									<th>繳付保費總額 （港元） <span data-toggle="tooltip" data-html="true" data-placement="right" title="由保單生效起，您已支付的保費總額。" class="glyphicon glyphicon-info-sign hidden-sm hidden-xs default-pointer"></span></th>
									<th class="hidden-sm hidden-xs">戶口價值（港元） <span data-toggle="tooltip" data-html="true" data-placement="right" title="所有已繳保費及利息的累積金額。" class="glyphicon glyphicon-info-sign default-pointer"></span><br>退保價值（港元） <span data-toggle="tooltip" data-html="true" data-placement="right" title="當您結束保單時可獲得的金額。" class="glyphicon glyphicon-info-sign hidden-sm hidden-xs default-pointer"></span></th>
									<th>身故賠償（港元） <span data-toggle="tooltip" data-html="true" data-placement="right" title="倘若被保人於保單生效期內死亡，受限於本保單其他條款 ，本公司於收到身故證明及本公司所規定的其他文件後，將支付戶口價值的百分之一百零五予受益人作為身故權益。" class="glyphicon glyphicon-info-sign default-pointer"></span></th>
									<th class="hidden-sm cell-extra-rider er-color-swap">Extra Rider<br>500% Accidental Death Benefit</th>
								</tr>
							</thead>
							<tbody>
								<tr id="new-table-added">
									<td class="policy-credit policy-number bold">1</td>
									<td class="policy-credit">2</td>
									<td>100,000</td>
									<td>100,997</td>
									<td>103,047</td>
									<td class="cell-extra-rider er-color-swap">503,047</td>
								</tr>
								<tr class="pinkish-shade">
									<td class="policy-credit policy-number bold">2</td>
									<td class="policy-credit">2</td>
									<td>100,000</td>
									<td>100,997</td>
									<td>103,047</td>
									<td class="cell-extra-rider er-color-swap">503,047</td>
								</tr>
								<tr>
									<td class="policy-credit policy-number bold">3</td>
									<td class="policy-credit">2</td>
									<td>100,000</td>
									<td>100,997</td>
									<td>103,047</td>
									<td class="cell-extra-rider er-color-swap">503,047</td>
								</tr>
								<tr class="pinkish-shade">
									<td class="policy-credit policy-number bold">4</td>
									<td class="policy-credit">2</td>
									<td>100,000</td>
									<td>100,997</td>
									<td>103,047</td>
									<td class="cell-extra-rider er-color-swap">503,047</td>
								</tr>
								<tr>
									<td class="policy-credit policy-number bold">5</td>
									<td class="policy-credit">2</td>
									<td>100,000</td>
									<td>100,997</td>
									<td>103,047</td>
									<td class="cell-extra-rider er-color-swap">503,047</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="tbl-rate-mobile visible-xs visible-sm clearfix sticky-table">
					<div class="sticky-header">
						<table>
							<tbody>
								<tr>
									<th>保單年度終結</th>
								</tr>
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

						<table>
							<tbody>
								<tr>
									<th>保證派息率(%)</th>
									<th>繳付保費總額 （港元）</th>
									<th>退保價值（港元）/<br>退保價值（港元）</th>
									<th>身故賠償（港元）</th>
									<th class="cell-extra-rider er-color-swap">Extra Rider<br>500% Accidental<br>Death Benefit</th>
								</tr>
								<tr class="pinkish-shade">
									<td>2</td>
									<td>100,000</td>
									<td>100,997</td>
									<td>103,047</td>
									<td class="cell-extra-rider er-color-swap">503,047</td>
								</tr>
								<tr>
									<td>2</td>
									<td>100,000</td>
									<td>103,997</td>
									<td>106,047</td>
									<td class="cell-extra-rider er-color-swap">506,047</td>
								</tr>
								<tr class="pinkish-shade">
									<td>2</td>
									<td>100,000</td>
									<td>106,997</td>
									<td>109,047</td>
									<td class="cell-extra-rider er-color-swap">509,047</td>
								</tr>
								<tr>
									<td>2</td>
									<td>100,000</td>
									<td>103,997</td>
									<td>106,047</td>
									<td class="cell-extra-rider er-color-swap">506,047</td>
								</tr>
								<tr class="pinkish-shade">
									<td>2</td>
									<td>100,000</td>
									<td>106,997</td>
									<td>109,047</td>
									<td class="cell-extra-rider er-color-swap">509,047</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="text-center">
				<button type="button" class="text-bold white-btn collapsed btn-after-5-years" data-toggle="collapse" data-target="#after-5-years-container" aria-expanded="false" ><span class="after-5">首五個保單年度後</span><span class="hidden first-5">首五個保單年度</span></button>
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
					<a href="#pd-sf-faq-and-glossary-pane" class="bold" aria-controls="pd-sf-faq-and-glossary-pane" role="tab" data-toggle="tab"><fmt:message key="provie.plandetails.risks.exclusions.tab2" bundle="${provieMsg}" /></a>
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
								<div class="js-display-savie-sp">
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
									<p>
										<fmt:message key="provie.plandetails.nonguranteedbenefits.text1" bundle="${provieMsg}" /><br>
										<fmt:message key="provie.plandetails.nonguranteedbenefits.text3" bundle="${provieMsg}" /><br>
										<fmt:message key="provie.plandetails.nonguranteedbenefits.text3" bundle="${provieMsg}" /><br>

									</p>
								</div>
								<div class="js-display-savie-rp">
									<p>信貸風險</p><p>本產品是由富衛發出的保單。投保本保險產品或其任何保單利益須承受富衛的信貸風險。您將承擔富衛無法履行保單財務責任的違約風險。</p><br/><p>流動性風險</p><p>本產品為長期保險保單。此長期保險保單有既定的保單期限，保單期限由保單生效日至期滿日止。保單提供一定價值，如您於期滿日前作退保，或在保單生效早期提取戶口價值，或提前停止支付保費，您可能會損失將來利息及保單保障。投保本產品有機會對您的財務狀況構成流動性風險，您須承擔本產品之流動性風險。</p><br/><p>外幣匯率及貨幣風險</p><p>投保外幣為保單貨幣的保險產品須承受外幣匯率及貨幣風險。請注意外幣或會受相關監管機構控制及管理（例如，外匯限制）。若保險產品的貨幣單位與您的本國貨幣不同，任何保單貨幣對您的本國貨幣匯率之變動將直接影響您的應付保費及可取利益。舉例來說，如果保單貨幣對您的本國貨幣大幅貶值，這種匯率波動可能對您的應付保費及可取利益帶來潛在損失。</p><br/><p>通脹風險</p><p>請注意通脹會導致未來生活費用增加。即使富衛履行所有合約責任，實際保單權益可能不足以應付將來的保障需要。</p><br/><p>提早退保風險</p><p>如您在保單期滿日前提早退保，或在保單生效早期提取戶口價值，或提前停止支付保費，您可能會損失將來派息及保單保障。</p><br/><p>終止保單</p><p>保單將在下列其中一個日期終止，以最早者為準: 1. 被保人身故 2. 被保人100歲生日前之保單週年日 3. 保單之退保日。此日期為依富衛退保相關規定所認定之退保日 4. 當保單戶口價值低於零。</p><br/><p>不保證保障</p><p>不保證保障包括派息率是非保證的，並按照釐定派息率的理念由富衛自行決定。</p><br/><p>保費年期及欠繳保費（只適用於月供計劃）</p><p>保單的供款年期的終結日為被保人100歲生日前之保單週年日。任何到期應繳付之保費均可獲富衛30天寬限期。若在寬限期後仍未繳付保費，富衛將為保單執行保費假期。若保單已行使保費假期，保單應繳的基本計劃保費、附加於本保單之附約保費（如適用）及相關的收費將會持續從保單戶口內扣除。當保單戶口價值不足以支付基本計劃保費，任何附加於本保單之附約保費及相關的收費，或當保單戶口價值低於最低戶口結餘時，保單將會自動被終止。請注意，如保單是因此而自動終止，您可能會失去全部權益。
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
									詞彙表
									<span class="pull-right">
									   <img src="<%=request.getContextPath()%>/resources/images/savie-2016/arrow-down1.png" />
									</span>
								 </a>
							  </h4>
						   </div>
						   <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="pd-sf-product-related">
							  <div class="panel-body"><p><b>意外</b> – 在本保單生效期間所發生非預見及突如其來的一宗或連串外在及可見的意外事故並導致身體受傷。 </p><br/><p><b>戶口價值</b> – 本保單「戶口價值條款」內說明由本公司為此保單成立並持有之內部戶口內的戶口結存。 </p><br/><p><b>保單生效日</b> – 用作釐定被保人的投保年齡之日，此日列明於保單資料頁內。</p><br/><p><b>公司</b> –富衛人壽保險（百慕達）有限公司。 </p><br/><p><b>期滿日</b> – 緊接被保人一百歲生日前之保單週年日。 </p><br/><p><b>被保人</b> – 保單資料頁內指定為被保人的人士，其生命受本保單保障。 </p><br/><p><b>部份提款</b> – 根據下述「權益條款」內的「部份提款」條款可從戶口價值內提取的部份提款。</p><br/><p><b>保單週年日</b> – 期後每年與保單生效日相同的日子。保單週年日根據保單資料頁內列明之保單生效日而釐定。</p><br/><p><b>保單</b> – 「Savie自助息理財壽險」之條款。</p><br/><p><b>保單簽發日</b> – 保單資料頁內列明之保單簽發日，即保單開始生效之日。</p><br/><p><b>保單年期</b> – 由本保單的保單生效日起計的每 12 個月。保單年期根據保單資料頁內列明之保單生效日而釐定。</p><br/><p><b>保費假期 </b>– 根據下述「保費條款」內的「保費假期」條款暫停繳付定期儲蓄保費但本保單仍然維持有效的一段時間。</p><br/><p><b>定期儲蓄保費</b> – 列明於「保費條款」內之定期儲蓄保費。</p><br/><p><b>躉繳保費</b> – 保單權益人投入之躉繳保費，此保費列明於保單資料頁內。</p><br/><p><b>投保額</b> – 保單資料頁內註明之投保額或本保單最新加簽批註之最新投保額。</p></div>
						   </div>
						</div>
					</div>
				</div>
				<p><fmt:message key="provie.plandetails.note.title" bundle="${provieMsg}" /><br><fmt:message key="provie.plandetails.note.text1" bundle="${provieMsg}" /></p>
				<br/>

				<p><fmt:message key="provie.plandetails.note.text2" bundle="${provieMsg}" /></p>
				<br/>
				<p><fmt:message key="provie.plandetails.note.text3" bundle="${provieMsg}" /></p>
				<br/>
				<p><fmt:message key="provie.plandetails.note.text4" bundle="${provieMsg}" /></p>
				<br/>
				
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
					<p class="center">(將不能享受保費折扣優惠)</p>
				</div>
				<a id="btn-back" class="pd-link hidden">返回申請摘要</a>
		</div>
		<!-- MODALS / LIGHTBOXES -->
		<div class="modal fade common-welcome-modal" id="offline-online-modal" tabindex="-1" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="row">
						<div class="col-xs-2 col-md-1 numbering-holder">
							<img src="<%=request.getContextPath()%>/resources/images/savie-2016/dk-numbering_TC.PNG" class="visible-md visible-lg" />
							<img src="<%=request.getContextPath()%>/resources/images/savie-2016/mb-numbering_TC.PNG" class="visible-xs visible-sm" />
						</div>
						<div class="col-xs-10 col-md-10" id="steps-holder">
							<h4 class="text-center">多謝您對本計劃有興趣</h4>
							<div id="step-1" class="step">
								<div class="media">
									<div class="media-left" id="step1-img-holder">
										 <img class="media-object" src="<%=request.getContextPath()%>/resources/images/savie-2016/book-icon.png" />
									</div>
									<div class="media-body">
										<p class="procedure">根據香港保險業聯會之指引，保險公司需要在客戶投保前進行財務需要分析，我們會按分析結果為您提供適合的產品選擇，讓您作出比較。</p>
									</div>
								</div>
							</div>
							<div id="step-2" class="step">
								<div class="media">
									<div class="media-left" id="step2-img-holder">
										  <img class="media-object" src="<%=request.getContextPath()%>/resources/images/savie-2016/note-icon.png" />
									</div>
									<div class="media-body">
										<p class="procedure">當完成財務需要分析及產品比較並確認Savie自助息切合您的需要後，您便可立即進行投保。</p>
									</div>
								</div>
							</div>
							<div class="row" id="on-of-holder">
								<div class="col-md-6 col-xs-12" id="step-online">
									<div class="step">
										<div class="media">
											<div class="media-left" id="stepon-img-holder">
												 <img class="media-object" src="<%=request.getContextPath()%>/resources/images/savie-2016/pc-icon.png" />
											</div>
											<div class="media-body">
												<p class="procedure"><span class="bold-head">網上投保</span> <span class="hidden-dash">-</span><br class="visible-md visible-lg" /> 您可於此平台上完成整個財務需要分析及投保程序。於投保過程中您可使用” 儲存並稍後繼續”的功能，以便您可於任何時間繼續您的投保程序。</p>
												<button class="btn savie-common-btn" id="online-application-btn">網上登記</button>
											</div>
										</div>
									</div>
								</div>
								<div class="or-word">
									<div id="or-mobile">
										<span>或</span>
									</div>
								</div>
								<div class="col-md-6 col-xs-12" id="step-offline">
									<div class="step">
										<div class="media">
											<div class="media-left">
												 <img class="media-object" src="<%=request.getContextPath()%>/resources/images/savie-2016/clockfold-icon.png" />
											</div>
											<div class="media-body">
												<p class="procedure"><span class="bold-head">親身投保</span> <span class="hidden-dash">-</span><br class="visible-md visible-lg" /> 您可以選擇親身到客戶服務中心完成整個財務需要分析和投保程序。請您選擇時間及客戶服務中心與我們的客戶服務代表進行會面 。整個財務需要分析及投保過程需時約30－45分鐘。</p>
												<button class="btn savie-common-btn" id="offline-application-btn">親臨登記</button>
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

	var current_date = new Date();
	var month_now = (parseInt((current_date.getMonth()+1), 10) + 100).toString().substr(1);
	var day_now = (parseInt(current_date.getDate(), 10) + 100).toString().substr(1);
	/* $('#sales-illu-dob').attr('placeholder',day_now +'-'+ month_now +'-'+ (current_date.getFullYear()-18)); */
	/*$('#plan-dob-datepicker').val(day_now +'-'+ month_now +'-'+ (current_date.getFullYear()-18));*/

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
			$('#plan-dob-datepicker').datepicker({
				format: "dd-mm-yyyy",
				startView: "decade",
				startDate: dob_start_date,
				endDate: dob_end_date,
				autoclose: true,
				startView: 2
			}).css('cursor', 'default');
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

		$('#rate-0').on('click', function() {
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
		$('#promoCode').focus(function() {
			$('.promocode-label').text('推廣編號');
		}).focusout(function () {
			if($(this).val() == '' ) {
				$('.promocode-label').text('推廣編號(如適用)');
			} else {
				$('.promocode-label').text('推廣編號');
			}
		});

		$('#plan-dob-datepicker').focus(function () {
			$(this).parent().find('.custom-made-label').css({color: '#ff8200'});
		}).focusout(function (){
			$(this).parent().find('.custom-made-label').css({color: '#000000'});
		});

		$('.rate-btn').on('click', function (){
			$('.tooltip').hide();
		});
		$(document).on('click touchstart', function (){
			$('.tooltip').hide();
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

	$("#btn-proceed").on('click', function(){
		apply=false;
		if('2'=='2'){
			//alert("clicked");
			window.location = '<%=request.getContextPath()%>/tc/savings-insurance/provie/customer-service-centre';
			//proceedLogin('/tc/savings-insurance/sales-illustration');
		}else {
			//$('#offline-online-modal').modal('show');
			if($("#type-of-payment").val() == 'regular-payment') {
				if("" == "true" && "" != "*DIRECTGI"){
					//window.location = '/tc/savings-insurance/customer-service-centre';
					$('#thankYouModal').modal('show');
				}else{
					apply=true;
					$('#offline-online-modal').modal('hide');
					$('.login-info').addClass('hidden');
					$('#loginpopup .modal-dialog').removeClass('loginpopupext');
					$('#loginpopup #fna-check').val("false");
					$('#loginpopup #nav-bar-check').val("false");
					$('#loginpopup').modal('show');
				}
			}else {
				$('#offline-online-modal').modal('show');

			}
		}
	});

	$("#online-application-btn").on('click', function(){
		$('#offline-online-modal').modal('hide');
		proceedLogin(null);
	});

	$("#offline-application-btn").on('click', function(){
		 
		if("" == "true" && "" != "*DIRECTGI"){
			window.location = '/tc/savings-insurance/customer-service-centre';
		}else{
			apply=true;
			$('#offline-online-modal').modal('hide');
			$('.login-info').addClass('hidden');
			$('#loginpopup .modal-dialog').removeClass('loginpopupext');
			$('#loginpopup #fna-check').val("false");
			$('#loginpopup #nav-bar-check').val("false");
			$('#loginpopup').modal('show');
		}
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
				window.location = '/tc/savings-insurance/customer-service-centre';
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
			window.location = '/tc/savings-insurance/customer-service-centre';
		}else{
			apply=true;
			$('#loginpopup #fna-check').val("true");
			$('#loginpopup #nav-bar-check').val("false");
			$('#loginpopup').modal('show');
		}
	}

	function goServiceCenter() {
		window.location = '/tc/savings-insurance/customer-service-centre';
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
<script src="<%=request.getContextPath()%>/resources/js/mobiscroll.custom-2.17.2.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/js/mobiscroll.i18n.en_fwd.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/js/mobiscroll.i18n.zh_fwd.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/provie/provie-app-uifn.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/provie/provie-rate-table.js"></script>
  
