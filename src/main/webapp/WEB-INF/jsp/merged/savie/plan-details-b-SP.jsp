<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<c:set var="slider_min" value="${sliderMin}"/>
<c:set var="slider_max" value="${sliderMax}" />
<c:set var="slider_value" value="${sliderValue}" />
<script type="text/javascript">
var context = "${pageContext.request.contextPath}";
var languageP = "${language}";
var affordabilityMin = ${slider_min};
var affordabilityPremium = ${sliderMax};
</script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/material.min.css" />

<%!
	boolean isSaleActiveClass = false;
	boolean isEservicesActiveClass = false;
%>
 <c:set var="applicationType" scope="session" value="${'online'}"/>
<div class="fwd-savie-wrapper savie-online-container with-breadcrumbs-steps" id="plan-details-b-page">
	<!-- HEADER -->
	<div class="fwd-container container-fluid breadcrumbs">
		<div class="breadcrumb-container">
            <ol class="breadcrumb breadcrumbs-product-details et-breadcrumbs">
			   <li><a href="#"><fmt:message key="breadcrumb.home" bundle="${msg}" /></a></li>
               <li class="divider"><i class="fa fa-play"></i></li>
               <li><a href="#"><fmt:message key="breadcrumb.savie.category" bundle="${msg}" /></a></li>
               <li class="divider"><i class="fa fa-play"></i></li>
               <li><a href="#"><fmt:message key="breadcrumb.savie.insurance.plan" bundle="${msg}" /></a></li>
               <li class="divider last"><i class="fa fa-play"></i></i></li>
               <li class="active-bc" id="et-active-bc-menu"><fmt:message key="breadcrumb.savie.plandetails" bundle="${msg}" /></li>
            </ol>
         </div>
    </div>
    <!-- STEPS -->
	<div class="container-fluid fwd-full-container browse-holder">
		<div class="application-page-header et-header-browse">
		   <div class="browse-container">
			  <div class="row reset-margin hidden-xs hidden-sm">
				 <ul class="common-steps-list six-steps nav nav-pills">
					<li class="step-number" id="first-step"><button type="button" class="et-header-info-btn active"><span class="status">1</span></i><fmt:message key="stepindicator.savie.selectplan" bundle="${msg}" /></button></li>
					<li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
					<li class="step-number"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">2</span><fmt:message key="stepindicator.savie.application" bundle="${msg}" /></button></li>
					<li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
					<li class="step-number"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">3</span><fmt:message key="stepindicator.savie.summary.declaration" bundle="${msg}" /></button></li>
					<li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
					<li class="step-number"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">4</span><fmt:message key="stepindicator.savie.sign" bundle="${msg}" /></button></li>
					<li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
					<li class="step-number"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">5</span><fmt:message key="stepindicator.savie.upload.document" bundle="${msg}" /></button></li>
					<li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
					<li class="step-number"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">6</span><fmt:message key="stepindicator.savie.confirmation" bundle="${msg}" /></button></li>
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
					<h3 id=""><fmt:message key="stepindicator.savie.selectplan" bundle="${msg}" /></h3>
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
					<h3 class="heading-title"><fmt:message key="label.savie.plan.details.label" bundle="${msg}" /> <i data-toggle="tooltip" data-html="true" data-placement="right" title="<fmt:message key="info.savie.payment.method.tooltip" bundle="${msg}" />" class="fa hidden fa-info-circle info-tooltip"></i><c:choose><c:when test="${type == '2' || type == '3' || backSummary == 'y'}"><p><fmt:message key="plan.detail.guild_2" bundle="${msg}" /></p></c:when><c:otherwise> <p><fmt:message key="plan.detail.guild" bundle="${msg}" /></p> </c:otherwise></c:choose></h3>
					<div class="col-md-4 plan-payment-type">
						<div class="row">
							<div class="col-xs-12">
								<div class="selectDiv centreDiv gray-text-bg" id="payment-type">
									<select name="payment-type" id="type-of-payment" class="form-control gray-dropdown pd-dropdown" data-bv-field="payment-type" <c:if test="${type == '2' }">disabled</c:if>>
									   <option value="regular-payment"><fmt:message key="savie.online.select.regular" bundle="${msg}" /></option>
									   <option value="one-off-premium"><fmt:message key="savie.online.select.oneoff" bundle="${msg}" /></option>
									</select>
									<img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg">
									<label class="mdl-textfield__label so-mdl-textfield-label custom-made-label" for="payment-type"><fmt:message key="label.savie.plan.details.paymentmode" bundle="${msg}" /></label>
								</div>
							</div>
							<div class="col-xs-12 hidden" id="plan-amount-holder">
								<div class="selectDiv centreDiv gray-text-bg">
									<select name="plan-amount" id="plan-amount" class="form-control gray-dropdown pd-dropdown" data-bv-field="plan-amount">
									   <!-- <option value="" disabled="" selected=""><fmt:message key="label.savie.amount" bundle="${msg}" /></option>
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
									<label class="mdl-textfield__label so-mdl-textfield-label custom-made-label" for="plan-amount"><fmt:message key="label.savie.amount" bundle="${msg}" /></label>
								</div>
							</div>
							<div class="col-xs-12" id="amount-slide-holder">
								<div class="one-off-premium">
				                   <div>
				                   		<h3 class="amount-selected">
				                   			<span class="pull-left"><fmt:message key="label.savie.amount.sp" bundle="${msg}" /></span>
				                   			<span class="pull-right"><c:if test="${language != 'tc'}"><fmt:message key="label.hkd" bundle="${msg}" /></c:if><span id="range"><fmt:formatNumber value="${slider_value}" type="number"/></span><c:if test="${language == 'tc'}"><fmt:message key="label.hkd" bundle="${msg}" /></c:if></span>
				                   		</h3>
				                   </div>
				                    <input  class="span2 amount-slider" name="amount"
				                    value="${slider_value}"
				                    data-slider-min="${slider_min}"
				                    data-slider-max="${slider_max}"
				                    data-slider-step="1000"
				                    data-slider-value="${slider_value}"
				                    data-slider-id="RC" id="R" data-slider-tooltip="hide" data-slider-handle="square" />
									<div class="min-max-holder clearfix">
										<div class="pull-left text-center">
											<p><fmt:message key="label.min" bundle="${msg}" /></p>
											<p><c:if test="${language != 'tc'}"><fmt:message key="label.hkd" bundle="${msg}" /> </c:if><span id="min-value"><fmt:formatNumber value="${slider_min}" type="number"/></span><c:if test="${language == 'tc'}"><fmt:message key="label.hkd" bundle="${msg}" /></c:if></p>
										</div>
										<div class="pull-right text-center">
											<p><fmt:message key="label.max" bundle="${msg}" /></p>
											<p><c:if test="${language != 'tc'}"><fmt:message key="label.hkd" bundle="${msg}" /> </c:if><span id="max-value"><fmt:formatNumber value="${slider_max}" type="number"/></span><c:if test="${language == 'tc'}"><fmt:message key="label.hkd" bundle="${msg}" /></c:if></p>
										</div>
									</div>
								</div>
							</div>
							<div class="clearfix"></div>
						</div>
					</div>
					<div class="col-md-3 plan-dob">
						<div class="row">
							<div class="col-xs-12">
								<div class="selectDiv centreDiv gray-text-bg" id="plan-dob">
									<input  name="plan-dob" id="plan-dob-datepicker" readonly value="${savingDob!=null && type != '2' ? savingDob:defaultDOB }" <c:if test="${type == '2' }">readonly="readonly"</c:if> placeholder="<fmt:message key="label.dob" bundle="${msg}" />" class="form-control" />
									<img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg">
										<label class="mdl-textfield__label so-mdl-textfield-label custom-made-label" for="plan-dob"><fmt:message key="label.dob" bundle="${msg}" /></label>
								</div>
								<%-- <div class="input-group input-append date" id="plan-dob">
									<input readonly value="${savingDob!=null ? savingDob:defaultDOB }"  name="plan-dob" id="plan-dob-datepicker" placeholder="Date of birth" class="date" />
									<span class="input-group-addon add-on"><img class="arrow" src="<%=request.getContextPath()%>/resources/images/savie/arrow-down.png"></span>
								</div> --%>
							</div>
							<div class="col-xs-12 hidden" id="total-years-holder">
								<div class="selectDiv centreDiv gray-text-bg">
									<select name="total-payment-years" id="total-payment-years" class="form-control gray-dropdown pd-dropdown" data-bv-field="total-payment-years">
									   <option value=""></option>
									</select>
									<img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg">
									<label class="mdl-textfield__label so-mdl-textfield-label custom-made-label" for="total-payment-years"><fmt:message key="label.payment.year" bundle="${msg}" /></label>
								</div>
							</div>
						</div>
					</div>
					<c:if test="${type == '2' || type == '3' || backSummary == 'y'}">
					<div class="col-xs-12 col-md-3 plan-promo-code">
						<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield" class="promo-code">
							<input id="promoCode" class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input"  value="${promoCode}" />
							<label class="mdl-textfield__label so-mdl-textfield-label promocode-label" for="promoCode"><fmt:message key="label.promocode.referral" bundle="${msg}" /></label>
						</div>
						<span class="error-msg hidden" id="promoCodeErrorMsg"><fmt:message key="plan.detail.promo.code.error" bundle="${msg}" /></span>
						<span class="success-msg hidden" id="promoCodeSuccessMsg"><fmt:message key="plan.detail.promo.code.success" bundle="${msg}" /></span>
					</div>
					</c:if>
					<div class="col-xs-12 col-md-2 plan-calculate">
						<button type="button" class="btn savie-common-btn" id="plan-calculate-btn"><fmt:message key="button.calculate" bundle="${msg}" /></button>
					</div>
				</div>
			</div>
		</div>
		</div>
<div class="container-fluid fwd-container" id="plan-details-wrapper">
	<div class="pd-summary-table" id="table-content-pd">
		<div class="summary-table">
			<div class="summary-table-head clearfix">
				<h4 class="summary-note-title"><fmt:message key="label.summary" bundle="${msg}" /></h4>
				<p class="summary-note"><fmt:message key="label.savie.crediting.rate.copy" bundle="${msg}" /></p>
			</div>
			<div class="table-content">
				<div class="rate-table">
					<table class="table table-hover">
						<thead>
							<tr>
								<th class="first-head"><fmt:message key="product.details.savie.ratetable.col1" bundle="${msg}" /></th>
								<th class="hidden-sm hidden-xs"><fmt:message key="label.guaranteedcreditingrate" bundle="${msg}" /> <span data-toggle="tooltip" data-html="true" data-placement="right" title="<fmt:message key="tooltips.savie.ratetable.col2" bundle="${msg}" />" class="glyphicon glyphicon-info-sign default-pointer"></span></th>
								<th><fmt:message key="product.details.savie.ratetable.col3" bundle="${msg}" /> <span data-toggle="tooltip" data-html="true" data-placement="right" title="<fmt:message key="tooltips.savie.ratetable.col3" bundle="${msg}" />" class="glyphicon glyphicon-info-sign hidden-sm hidden-xs default-pointer"></span></th>
								<th class="hidden-sm hidden-xs"><fmt:message key="product.details.savie.ratetable1.col4" bundle="${msg}" /> <span data-toggle="tooltip" data-html="true" data-placement="right" title="<fmt:message key="tooltips.savie.ratetable1.col4" bundle="${msg}" />" class="glyphicon glyphicon-info-sign default-pointer"></span></th>
								<th><fmt:message key="product.details.savie.ratetable1.col5" bundle="${msg}" /> <span data-toggle="tooltip" data-html="true" data-placement="right" title="<fmt:message key="tooltips.savie.ratetable1.col5" bundle="${msg}" />" class="glyphicon glyphicon-info-sign hidden-sm hidden-xs default-pointer"></span></th>
								<th class="hidden-sm hidden-xs"><fmt:message key="product.details.savie.ratetable1.col6" bundle="${msg}" /></th>
							</tr>
						</thead>
						<tbody>
							<tr class="pinkish-shade">
								<td class="policy-credit policy-number bold">1</td>
								<td class="policy-credit hidden-sm hidden-xs" id="credit-rate-change-1">3</td>
								<td id="premium-1">0</td>
								<td class="hidden-sm hidden-xs" id="account-value-1">0</td>
								<td id="surrender-1">0</td>
								<td class="hidden-sm hidden-xs" id="death-1"><span data-toggle="tooltip" data-html="true" data-placement="right" title="Death Benefit (HK$) / Accidental Death Benefit (HK$)" class=" default-pointer">108,141 / 211,132</span></td>
							</tr>
							<tr>
								<td class="policy-credit policy-number bold">2</td>
								<td class="policy-credit hidden-sm hidden-xs" id="credit-rate-change-2">3</td>
								<td id="premium-2">0</td>
								<td class="hidden-sm hidden-xs" id="account-value-2">0</td>
								<td id="surrender-2">0</td>
								<td class="hidden-sm hidden-xs" id="death-2"><span data-toggle="tooltip" data-html="true" data-placement="right" title="Death Benefit (HK$) / Accidental Death Benefit (HK$)" class=" default-pointer">111,385 / 217,466</span></td>
							</tr>
							<tr class="pinkish-shade">
								<td class="policy-credit policy-number bold">3</td>
								<td class="policy-credit hidden-sm hidden-xs" id="credit-rate-change-3">3.3</td>
								<td id="premium-3">0</td>
								<td class="hidden-sm hidden-xs" id="account-value-3">0</td>
								<td id="surrender-3">0</td>
								<td class="hidden-sm hidden-xs" id="death-3"><span data-toggle="tooltip" data-html="true" data-placement="right" title="Death Benefit (HK$) / Accidental Death Benefit (HK$)" class=" default-pointer">115,841 / 226,165</span></td>
							</tr>
						</tbody>
					</table>
					<p class="small"><fmt:message key="saive.plandetails.summary.totalpremium.remark" bundle="${msg}" /></p>
				</div>
			</div>
			<div class="after-3-years-container" id="after-3-years-container" style="display:none">
				<div class="crediting-rate">
					<h4 class="crediting-rate-title"><fmt:message key="label.creditingrate" bundle="${msg}" /></h4>
					<div class="rate-buttons">
						<button data-toggle="tooltip" data-html="true" data-placement="right" title='<fmt:message key="label.guaranteed.basis" bundle="${msg}" />' class="rate-btn" id="rate-0" type="button"><fmt:message key="label.savie.crediting.rate1" bundle="${msg}" /></button>
						<button data-toggle="tooltip" data-html="true" data-placement="right" title='<fmt:message key="label.current.assumed.basis" bundle="${msg}" />' class="rate-btn active" id="rate-2" type="button"><fmt:message key="label.savie.crediting.rate2" bundle="${msg}" /></button>
						<button class="rate-btn" id="rate-3" type="button"><fmt:message key="label.savie.crediting.rate3" bundle="${msg}" /></button>
						<!--<button class="rate-btn" id="rate-4" type="button"><fmt:message key="label.savie.crediting.rate4" bundle="${msg}" /></button>-->
					</div>
				</div>
				<div class="table-content" id="after-3-years">
					<div id="rate-table-0" class="rate-table hidden">
						<table class="table table-hover">
							<thead>
								<tr>
									<th class="first-head"><fmt:message key="product.details.savie.ratetable.col1" bundle="${msg}" /></th>
									<th class="hidden-sm hidden-xs"><fmt:message key="label.creditingrate.br" bundle="${msg}" /> <span data-toggle="tooltip" data-html="true" data-placement="right" title="<fmt:message key="tooltips.savie.ratetable.col2" bundle="${msg}" />" class="glyphicon glyphicon-info-sign default-pointer"></span></th>
									<th><fmt:message key="product.details.savie.ratetable.col3" bundle="${msg}" /> <span data-toggle="tooltip" data-html="true" data-placement="right" title="<fmt:message key="tooltips.savie.ratetable.col3" bundle="${msg}" />" class="glyphicon glyphicon-info-sign hidden-sm hidden-xs default-pointer"></span></th>
									<th class="hidden-sm hidden-xs"><fmt:message key="product.details.savie.ratetable1.col4" bundle="${msg}" /> <span data-toggle="tooltip" data-html="true" data-placement="right" title="<fmt:message key="tooltips.savie.ratetable1.col4" bundle="${msg}" />" class="glyphicon glyphicon-info-sign default-pointer"></span></th>
									<th><fmt:message key="product.details.savie.ratetable1.col5" bundle="${msg}" /> <span data-toggle="tooltip" data-html="true" data-placement="right" title="<fmt:message key="tooltips.savie.ratetable1.col5" bundle="${msg}" />" class="glyphicon glyphicon-info-sign hidden-sm hidden-xs default-pointer"></span></th>
									<th class="hidden-sm hidden-xs"><fmt:message key="product.details.savie.ratetable1.col6" bundle="${msg}" /></th>
								</tr>
							</thead>
							<tbody>
								<tr id="new-table-added">
									<td class="policy-credit policy-number bold" id="policy-year-0-0">0</td>
									<td class="policy-credit hidden-sm hidden-xs" id="credit-rate-0-0">0</td>
									<td id="premium-change-0-0">0</td>
									<td class="hidden-sm hidden-xs" id="account-value-change-0-0">0</td>
									<td id="surrender-change-0-0">0</td>
									<td class="hidden-sm hidden-xs" id="death-change-0-0"><span data-toggle="tooltip" data-html="true" data-placement="right" title="Death Benefit (HK$) / Accidental Death Benefit (HK$)" class=" default-pointer">0 / 0</span></td>
								</tr>
								<tr class="pinkish-shade">
									<td class="policy-credit policy-number bold" id="policy-year-0-1">0</td>
									<td class="policy-credit hidden-sm hidden-xs" id="credit-rate-0-1">0</td>
									<td id="premium-change-0-1">0</td>
									<td class="hidden-sm hidden-xs" id="account-value-change-0-1">0</td>
									<td id="surrender-change-0-1">0</td>
									<td class="hidden-sm hidden-xs" id="death-change-0-1"><span data-toggle="tooltip" data-html="true" data-placement="right" title="Death Benefit (HK$) / Accidental Death Benefit (HK$)" class=" default-pointer">0 / 0</span></td>
								</tr>
								<tr>
									<td class="policy-credit policy-number bold" id="policy-year-0-2"><fmt:message key="savie.planDetails.Age.100" bundle="${msg}" /></td>
									<td class="policy-credit hidden-sm hidden-xs" id="credit-rate-0-2">0</td>
									<td id="premium-change-0-2">0</td>
									<td class="hidden-sm hidden-xs" id="account-value-change-0-2">0</td>
									<td id="surrender-change-0-2">0</td>
									<td class="hidden-sm hidden-xs" id="death-change-0-2"><span data-toggle="tooltip" data-html="true" data-placement="right" title="Death Benefit (HK$) / Accidental Death Benefit (HK$)" class=" default-pointer">0 / 0</span></td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- rate2 -->
					<div id="rate-table-2" class="rate-table">
						<table class="table table-hover">
							<thead>
								<tr>
									<th class="first-head"><fmt:message key="product.details.savie.ratetable.col1" bundle="${msg}" /></th>
									<th class="hidden-sm hidden-xs"><fmt:message key="label.creditingrate.br" bundle="${msg}" /> <span data-toggle="tooltip" data-html="true" data-placement="right" title="<fmt:message key="tooltips.savie.ratetable.col2" bundle="${msg}" />" class="glyphicon glyphicon-info-sign default-pointer"></span></th>
									<th><fmt:message key="product.details.savie.ratetable.col3" bundle="${msg}" /> <span data-toggle="tooltip" data-html="true" data-placement="right" title="<fmt:message key="tooltips.savie.ratetable.col3" bundle="${msg}" />" class="glyphicon glyphicon-info-sign hidden-sm hidden-xs default-pointer"></span></th>
									<th class="hidden-sm hidden-xs"><fmt:message key="product.details.savie.ratetable1.col4" bundle="${msg}" /> <span data-toggle="tooltip" data-html="true" data-placement="right" title="<fmt:message key="tooltips.savie.ratetable1.col4" bundle="${msg}" />" class="glyphicon glyphicon-info-sign default-pointer"></span></th>
									<th><fmt:message key="product.details.savie.ratetable1.col5" bundle="${msg}" /> <span data-toggle="tooltip" data-html="true" data-placement="right" title="<fmt:message key="tooltips.savie.ratetable1.col5" bundle="${msg}" />" class="glyphicon glyphicon-info-sign hidden-sm hidden-xs default-pointer"></span></th>
									<th class="hidden-sm hidden-xs"><fmt:message key="product.details.savie.ratetable1.col6" bundle="${msg}" /></th>
								</tr>
							</thead>
							<tbody>
								<tr id="new-table-added">
									<td class="policy-credit policy-number bold" id="policy-year-2-0">0</td>
									<td class="policy-credit hidden-sm hidden-xs" id="credit-rate-2-0">2</td>
									<td id="premium-change-2-0">0</td>
									<td class="hidden-sm hidden-xs" id="account-value-change-2-0">0</td>
									<td id="surrender-change-2-0">0</td>
									<td class="hidden-sm hidden-xs" id="death-change-2-0"><span data-toggle="tooltip" data-html="true" data-placement="right" title="Death Benefit (HK$) / Accidental Death Benefit (HK$)" class=" default-pointer">0 / 0</span></td>
								</tr>
								<tr class="pinkish-shade">
									<td class="policy-credit policy-number bold" id="policy-year-2-1">0</td>
									<td class="policy-credit hidden-sm hidden-xs" id="credit-rate-2-1">2</td>
									<td id="premium-change-2-1">0</td>
									<td class="hidden-sm hidden-xs" id="account-value-change-2-1">0</td>
									<td id="surrender-change-2-1">0</td>
									<td class="hidden-sm hidden-xs" id="death-change-2-1"><span data-toggle="tooltip" data-html="true" data-placement="right" title="Death Benefit (HK$) / Accidental Death Benefit (HK$)" class=" default-pointer">0 / 0</span></td>
								</tr>
								<tr>
									<td class="policy-credit policy-number bold" id="policy-year-2-2"><fmt:message key="savie.planDetails.Age.100" bundle="${msg}" /></td>
									<td class="policy-credit hidden-sm hidden-xs" id="credit-rate-2-2">2</td>
									<td id="premium-change-2-2">0</td>
									<td class="hidden-sm hidden-xs" id="account-value-change-2-2">0</td>
									<td id="surrender-change-2-2">0</td>
									<td class="hidden-sm hidden-xs" id="death-change-2-2"><span data-toggle="tooltip" data-html="true" data-placement="right" title="Death Benefit (HK$) / Accidental Death Benefit (HK$)" class=" default-pointer">0 / 0</span></td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- rate3 -->
					<div id="rate-table-3" class="rate-table hidden">
						<table class="table table-hover">
							<thead>
								<tr>
									<th class="first-head"><fmt:message key="product.details.savie.ratetable.col1" bundle="${msg}" /></th>
									<th class="hidden-sm hidden-xs"><fmt:message key="label.creditingrate.br" bundle="${msg}" /> <span data-toggle="tooltip" data-html="true" data-placement="right" title="<fmt:message key="tooltips.savie.ratetable.col2" bundle="${msg}" />" class="glyphicon glyphicon-info-sign default-pointer"></span></th>
									<th><fmt:message key="product.details.savie.ratetable.col3" bundle="${msg}" /> <span data-toggle="tooltip" data-html="true" data-placement="right" title="<fmt:message key="tooltips.savie.ratetable.col3" bundle="${msg}" />" class="glyphicon glyphicon-info-sign hidden-sm hidden-xs default-pointer"></span></th>
									<th class="hidden-sm hidden-xs"><fmt:message key="product.details.savie.ratetable1.col4" bundle="${msg}" /> <span data-toggle="tooltip" data-html="true" data-placement="right" title="<fmt:message key="tooltips.savie.ratetable1.col4" bundle="${msg}" />" class="glyphicon glyphicon-info-sign default-pointer"></span></th>
									<th><fmt:message key="product.details.savie.ratetable1.col5" bundle="${msg}" /> <span data-toggle="tooltip" data-html="true" data-placement="right" title="<fmt:message key="tooltips.savie.ratetable1.col5" bundle="${msg}" />" class="glyphicon glyphicon-info-sign hidden-sm hidden-xs default-pointer"></span></th>
									<th class="hidden-sm hidden-xs"><fmt:message key="product.details.savie.ratetable1.col6" bundle="${msg}" /></th>
								</tr>
							</thead>
							<tbody>
								<tr id="new-table-added">
									<td class="policy-credit policy-number bold" id="policy-year-3-0">0</td>
									<td class="policy-credit hidden-sm hidden-xs" id="credit-rate-3-0">3</td>
									<td id="premium-change-3-0">0</td>
									<td class="hidden-sm hidden-xs" id="account-value-change-3-0">0</td>
									<td id="surrender-change-3-0">0</td>
									<td class="hidden-sm hidden-xs" id="death-change-3-0"><span data-toggle="tooltip" data-html="true" data-placement="right" title="Death Benefit (HK$) / Accidental Death Benefit (HK$)" class=" default-pointer">0 / 0</span></td>
								</tr>
								<tr class="pinkish-shade">
									<td class="policy-credit policy-number bold" id="policy-year-3-1">0</td>
									<td class="policy-credit hidden-sm hidden-xs" id="credit-rate-3-1">3</td>
									<td id="premium-change-3-1">0</td>
									<td class="hidden-sm hidden-xs" id="account-value-change-3-1">0</td>
									<td id="surrender-change-3-1">0</td>
									<td class="hidden-sm hidden-xs" id="death-change-3-1"><span data-toggle="tooltip" data-html="true" data-placement="right" title="Death Benefit (HK$) / Accidental Death Benefit (HK$)" class=" default-pointer">0 / 0</span></td>
								</tr>
								<tr>
									<td class="policy-credit policy-number bold" id="policy-year-3-2"><fmt:message key="savie.planDetails.Age.100" bundle="${msg}" /></td>
									<td class="policy-credit hidden-sm hidden-xs" id="credit-rate-3-2">3</td>
									<td id="premium-change-3-2">0</td>
									<td class="hidden-sm hidden-xs" id="account-value-change-3-2">0</td>
									<td id="surrender-change-3-2">0</td>
									<td class="hidden-sm hidden-xs" id="death-change-3-2"><span data-toggle="tooltip" data-html="true" data-placement="right" title="Death Benefit (HK$) / Accidental Death Benefit (HK$)" class=" default-pointer">0 / 0</span></td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- rate4 -->
					<div id="rate-table-4" class="rate-table hidden">
						<table class="table table-hover">
							<thead>
								<tr>
									<th class="first-head"><fmt:message key="product.details.savie.ratetable.col1" bundle="${msg}" /></th>
									<th class="hidden-sm hidden-xs"><fmt:message key="label.creditingrate.br" bundle="${msg}" /> <span data-toggle="tooltip" data-html="true" data-placement="right" title="<fmt:message key="tooltips.savie.ratetable.col2" bundle="${msg}" />" class="glyphicon glyphicon-info-sign default-pointer"></span></th>
									<th><fmt:message key="product.details.savie.ratetable.col3" bundle="${msg}" /> <span data-toggle="tooltip" data-html="true" data-placement="right" title="<fmt:message key="tooltips.savie.ratetable.col3" bundle="${msg}" />" class="glyphicon glyphicon-info-sign hidden-sm hidden-xs default-pointer"></span></th>
									<th class="hidden-sm hidden-xs"><fmt:message key="product.details.savie.ratetable1.col4" bundle="${msg}" /> <span data-toggle="tooltip" data-html="true" data-placement="right" title="<fmt:message key="tooltips.savie.ratetable1.col4" bundle="${msg}" />" class="glyphicon glyphicon-info-sign default-pointer"></span></th>
									<th><fmt:message key="product.details.savie.ratetable1.col5" bundle="${msg}" /> <span data-toggle="tooltip" data-html="true" data-placement="right" title="<fmt:message key="tooltips.savie.ratetable1.col5" bundle="${msg}" />" class="glyphicon glyphicon-info-sign hidden-sm hidden-xs default-pointer"></span></th>
									<th class="hidden-sm hidden-xs"><fmt:message key="product.details.savie.ratetable1.col6" bundle="${msg}" /></th>
								</tr>
							</thead>
							<tbody>
								<tr id="new-table-added">
									<td class="policy-credit policy-number bold" id="policy-year-4-0">0</td>
									<td class="policy-credit hidden-sm hidden-xs" id="credit-rate-4-0">4</td>
									<td id="premium-change-4-0">0</td>
									<td class="hidden-sm hidden-xs" id="account-value-change-4-0">0</td>
									<td id="surrender-change-4-0">0</td>
									<td class="hidden-sm hidden-xs" id="death-change-4-0"><span data-toggle="tooltip" data-html="true" data-placement="right" title="Death Benefit (HK$) / Accidental Death Benefit (HK$)" class=" default-pointer">0 / 0</span></td>
								</tr>
								<tr class="pinkish-shade">
									<td class="policy-credit policy-number bold" id="policy-year-4-1">0</td>
									<td class="policy-credit hidden-sm hidden-xs" id="credit-rate-4-1">4</td>
									<td id="premium-change-4-1">0</td>
									<td class="hidden-sm hidden-xs" id="account-value-change-4-1">0</td>
									<td id="surrender-change-4-1">0</td>
									<td class="hidden-sm hidden-xs" id="death-change-4-1"><span data-toggle="tooltip" data-html="true" data-placement="right" title="Death Benefit (HK$) / Accidental Death Benefit (HK$)" class=" default-pointer">0 / 0</span></td>
								</tr>
								<tr>
									<td class="policy-credit policy-number bold" id="policy-year-4-2"><fmt:message key="savie.planDetails.Age.100" bundle="${msg}" /></td>
									<td class="policy-credit hidden-sm hidden-xs" id="credit-rate-4-2">4</td>
									<td id="premium-change-4-2">0</td>
									<td class="hidden-sm hidden-xs" id="account-value-change-4-2">0</td>
									<td id="surrender-change-4-2">0</td>
									<td class="hidden-sm hidden-xs" id="death-change-4-2"><span data-toggle="tooltip" data-html="true" data-placement="right" title="Death Benefit (HK$) / Accidental Death Benefit (HK$)" class=" default-pointer">0 / 0</span></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="after-3-years-btn">
				<button type="button" class="text-bold white-btn up" id="first-3-years-btn" onclick="toggleImg()"><span id="after-3"><fmt:message key="label.savie.after3year" bundle="${msg}" /></span><span id="first-3" class="hidden"><fmt:message key="label.savie.first3year" bundle="${msg}" /></span> <img id="arrow-img-years" src="<%=request.getContextPath()%>/resources/images/savie-2016/arrow-down2.png" /></button>
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
					<a href="#pd-sf-sale-illustration-sample-pane" class="bold" aria-controls="pd-sf-sale-illustration-sample-pane" role="tab" data-toggle="tab"><fmt:message key="product.details.savie.group1" bundle="${msg}" /></a>
				</li>
				<li class="pd-sf-tab pd-sf-tab-right text-center" role="presentation">
					<a href="#pd-sf-faq-and-glossary-pane" class="bold" aria-controls="pd-sf-faq-and-glossary-pane" role="tab" data-toggle="tab"><fmt:message key="product.details.savie.group2" bundle="${msg}" /></a>
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
									<fmt:message key="product.details.savie.product.details.keyproduct.risk" bundle="${msg}" />
									<span class="pull-right">
									   <img src="<%=request.getContextPath()%>/resources/images/savie-2016/arrow-down1.png" />
									</span>
								 </a>
							  </h4>
						   </div>
						   <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="pd-sf-product-related">
							  <div class="panel-body">
							  	<div class="js-display-savie-sp">
							  		<fmt:message key="product.details.savie.group1.section1.copy" bundle="${msg}" />
							  	</div>
							  	<div class="js-display-savie-rp">
							  		<fmt:message key="product.details.savie.rp.group1.section1.copy" bundle="${msg}" />
							  	</div>
							  </div>
						   </div>
						</div>
						<div class="panel panel-default pd-sf-sale-illustration-sample-panel">
						   <div class="panel-heading" role="tab" id="pd-sf-claim-related">
							  <h4 class="panel-title">
								 <a class="collapsed" role="button" data-toggle="collapse" data-parent="#pd-sf-faq-and-glossary-group" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
									<fmt:message key="product.details.savie.keyrisk.exclusion" bundle="${msg}" />
									<span class="pull-right">
									   <img src="<%=request.getContextPath()%>/resources/images/savie-2016/arrow-down1.png" />
									</span>
								 </a>
							  </h4>
						   </div>
						   <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="pd-sf-claim-related">
							  <div class="panel-body"><fmt:message key="product.details.savie.group1.section2.copy" bundle="${msg}" /></div>
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
									<fmt:message key="product.details.savie.group2" bundle="${msg}" />
									<span class="pull-right">
									   <img src="<%=request.getContextPath()%>/resources/images/savie-2016/arrow-down1.png" />
									</span>
								 </a>
							  </h4>
						   </div>
						   <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="pd-sf-product-related">
							  <div class="panel-body"><fmt:message key="product.details.savie.group2.section1.copy" bundle="${msg}" /></div>
						   </div>
						</div>
					</div>
				</div>
				<p><fmt:message key="label.savie.plan.detail.note.productrisk" bundle="${msg}" /></p>
				<br/>
				<%--<p><fmt:message key="label.savie.plan.detail.note.productrisk2" bundle="${msg}" /></p>--%>
				<ul class="availability-notice" style="padding-left: 15px;">
	  				<li><fmt:message key="product.detail.savie.remark.copy1_9" bundle="${msg}" /></li>
	  				<li><fmt:message key="product.detail.savie.remark.copy1_10" bundle="${msg}" /></li>
	  				<li><fmt:message key="product.detail.savie.remark.copy1_11" bundle="${msg}" /></li>
	  				<li><fmt:message key="product.detail.savie.remark.copy1_12" bundle="${msg}" /></li>
	  				<li><fmt:message key="product.detail.savie.remark.copy1_13" bundle="${msg}" /></li>
	  			</ul>
			</div>
		</div>
		<div class="next-btn text-center">

			<!-- for online -->
			<div class="btn__proceed_online js-display-savie-sp">
				<button id="btn-proceed" class="btn plan-details-btn savie-common-btn white-btn"><fmt:message key="button.proceed.next" bundle="${msg}" /></button>
			</div>
			<a onclick="applyCentre();" class="pd-link" style="color: #ff8200;"><fmt:message key="label.savie.makeanappointment" bundle="${msg}" /></a>
			<!-- for offline -->
			<%--<div class="">
				<button onclick="applyCentre();" class="btn plan-details-btn savie-common-btn white-btn text-orange text-hover-orange"><fmt:message key="label.savie.makeanappointment" bundle="${msg}" /></button>
			</div>
			<div class="btn__proceed_online js-display-savie-sp">
				<a id="btn-proceed" class="pd-link" style="color: #ff8200;"><fmt:message key="button.proceed.next" bundle="${msg}" /></a>
			</div>
			--%>
			<a id="btn-login" class="pd-link hidden"><fmt:message key="button.proceed.login" bundle="${msg}" /></a>
			<!-- <button type="button" id="btn-proceed" class="btn plan-details-btn savie-common-btn hidden white-btn"><fmt:message key="button.proceed.next" bundle="${msg}" /></button> -->
			<a id="btn-back" class="pd-link hidden"><fmt:message key="button.back.summary" bundle="${msg}" /></a>
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
			    						<p class="procedure"><fmt:message key="product.details.savie.step2.copy" bundle="${msg}" /></p>
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
			    				</div>
			    				<div class="col-md-6 col-xs-12" id="step-offline">
			    					<div class="step">
					    				<div class="media">
					    					<div class="media-left">
					    						 <img class="media-object" src="<%=request.getContextPath()%>/resources/images/savie-2016/clockfold-icon.png" />
					    					</div>
					    					<div class="media-body">
					    						<p class="procedure"><fmt:message key="product.details.savie.step4.copy" bundle="${msg}" /></p>
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
					<img src="<%=request.getContextPath()%><fmt:message key="savie.planDetails.thank.you.image.desktop" bundle="${msg}" />" class="img-responsive hidden-xs">
					<img src="<%=request.getContextPath()%><fmt:message key="savie.planDetails.thank.you.image.mobile" bundle="${msg}" />" class="img-responsive visible-xs">
					<button id="thank-you-continue" class="btn next" onclick="goServiceCenter();"><fmt:message key="savie.planDetails.thank.you.btn.text" bundle="${msg}" /></button>
				</div>
			</div>
		</div>
		<div class="modal fade common-welcome-modal" id="prev-savie-app-modal" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog">
		  <div class="modal-dialog">
		    <div class="modal-content">
		    	<!-- <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button> -->
		     	<h4 class="text-center welcome-msg"><fmt:message key="label.savie.repeat.buy.title" bundle="${msg}" /><span id="fullName1" class="hidden">${userDetails.fullName }</span></h4>
		     	<p class="text-center description-msg"><fmt:message key="label.savie.repeat.buy.copy" bundle="${msg}" /></p>
		     	<center><button class="btn savie-common-btn" id="make-appointment-btn"><fmt:message key="button.backtohome" bundle="${msg}" /></button></center>
		    </div>
		  </div>
		</div>
		<div class="modal fade common-welcome-modal" id="review-fna-modal"  data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog">
			<div class="modal-dialog">
			    <div class="modal-content">
			     	<h4 class="text-center welcome-msg"><fmt:message key="label.review.fna.title" bundle="${msg}" /> <span id="fullName">${userDetails.fullName }</span></h4>
			     	<p class="text-center description-msg"><fmt:message key="label.review.fna.copy" bundle="${msg}" /></p>
			     	<center><button class="btn savie-common-btn" id="review-fna-btn"><fmt:message key="button.review.fna" bundle="${msg}" /></button></center>
			    </div>
			 </div>
		</div>
		<div class="modal fade common-welcome-modal" id="retrieve-application-modal" tabindex="-1" role="dialog">
		  <div class="modal-dialog">
		    <div class="modal-content">
		    	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
		     	<h4 class="text-center welcome-msg"><fmt:message key="label.savie.welcome.back" bundle="${msg}" /> <span id="fullNames">${userDetails.fullName }</span></h4>
		     	<p class="text-center description-msg"><fmt:message key="label.resume.or.start.over" bundle="${msg}" /></p>
		     	<center><button class="btn savie-common-btn" id="resume-btn"><fmt:message key="button.resume" bundle="${msg}" /></button><button class="btn savie-common-btn disabled-gray-btn" id="start-over-btn"><fmt:message key="button.start.over" bundle="${msg}" /></button></center>
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

	var language = "en";
	var getpath = "<%=request.getContextPath()%>";
	$(document).ready(function () {
	    $('#loadingDiv').toggle();
		$('body').addClass('modal-open');
		//console.log('${savieType}');
		if('${savieType}' == 'RP') {
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

		if('2'!='${type }'){
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
			startDate: '${startDOB }',
			endDate: '${defaultDOB }',
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
			$('#loadingDiv').toggle();
			$('body').addClass('modal-open');

			$("#errorMsg").html("");
			$("#apiData").html("");
		/*
			if($('#promoCode').val()!='' && $('#promoCodeErrorMsg').hasClass('hidden')){
				$('#promoCodeErrorMsg').removeClass('hidden');
			}else if ($('#promoCode').val()!='' && !$('#promoCodeErrorMsg').hasClass('hidden')){
				//do nothing
			}else{
				$('#promoCodeErrorMsg').addClass('hidden');
			}
		*/
			//alert('clicked');
			var planCode=$("#type-of-payment").val();
			//alert('planCode=' + planCode + '<<<');
			if (planCode=='one-off-premium'){
				validatePromoCode();
			} else {
				if($('#promoCode').val()!='' && $('#promoCodeErrorMsg').hasClass('hidden')){
					$('#promoCodeErrorMsg').removeClass('hidden');
				}else if ($('#promoCode').val()!='' && !$('#promoCodeErrorMsg').hasClass('hidden')){
					//do nothing
				}else{
					$('#promoCodeErrorMsg').addClass('hidden');
				}
			}
			getSavieOnlinePlandetails(false);
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
		if('3'=='${type }'){
			getSavieOnlinePlandetails(true);
		} else {
			getSavieOnlinePlandetails(false);
		}

		//changing labels of promo code
		$('#promoCode').focus(function() {
			$('.promocode-label').text('<fmt:message key="label.promocode.referral" bundle="${msg}" />');
		}).focusout(function () {
			if($(this).val() == '' ) {
				$('.promocode-label').text('<fmt:message key="label.promocode.referral" bundle="${msg}" />');
			} else {
				$('.promocode-label').text('<fmt:message key="label.promocode.referral" bundle="${msg}" />');
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
			document.getElementById('arrow-img-years').src='<%=request.getContextPath()%>/resources/images/savie-2016/arrow-up2.png';
			$('#first-3-years-btn').addClass('down');
			$('#first-3-years-btn').removeClass('up');
		} else {
			$('#after-3').removeClass('hidden');
			$('#first-3').addClass('hidden');
			document.getElementById('arrow-img-years').src='<%=request.getContextPath()%>/resources/images/savie-2016/arrow-down2.png';
			$('#first-3-years-btn').addClass('up');
			$('#first-3-years-btn').removeClass('down');
		}
		return false;
	}

	$("#btn-proceed").on('click', function(){
		apply=false;
		//alert('plan-details-b-SP.jsp type=' + '${type}');
		if('2'=='${type }'){
			proceedLogin('<%=request.getContextPath()%>/${language}/savings-insurance/${nextPageFlow2}');
		}else {
			//$('#offline-online-modal').modal('show');
			if($("#type-of-payment").val() == 'regular-payment') {
				if("${authenticate}" == "true" && "${authenticate}" != "*DIRECTGI"){
		        	//window.location = '<%=request.getContextPath()%>/${language}/savings-insurance/customer-service-centre';
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
		 <c:set var="applicationType" scope="session" value="${'offline'}"/>
		if("${authenticate}" == "true" && "${authenticate}" != "*DIRECTGI"){
        	window.location = '<%=request.getContextPath()%>/${language}/savings-insurance/customer-service-centre';
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
		if("${authenticate}" == "true" && "${authenticate}" != "*DIRECTGI"){
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
			//window.location = '<%=request.getContextPath()%>/${language}/savings-insurance/customer-service-centre';
			$('#thankYouModal').modal('show');
		}else {
			if($("#type-of-payment").val() == 'regular-payment') {
				window.location = '<%=request.getContextPath()%>/${language}/savings-insurance/customer-service-centre';
			}else {
				$.ajax({
				    url:'${pageContext.request.contextPath}/ajax/savings-insurance/getPurchaseHistoryByPlanCode',
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
				    		    url:'${pageContext.request.contextPath}/ajax/savings-insurance/getPolicyApplicationSaveforLater',
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
								    		    url:'${pageContext.request.contextPath}/ajax/savings-insurance/show',
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
								    		    		window.location = '<%=request.getContextPath()%>/${language}/FNA/${nextPageFlow}';
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
		<%-- window.location = '<%=request.getContextPath()%>/${language}/savings-insurance/customer-service-centre'; --%>
		window.location = '<%=request.getContextPath()%>/${language}/savings-insurance';
	});

	$("#back-home").on('click', function(){
		window.location = '<%=request.getContextPath()%>/${language}/savings-insurance';
	});

	$("#review-fna-btn").on('click', function(){
		window.location = '<%=request.getContextPath()%>/${language}/FNA/review';
	});

	$("#resume-btn").on('click', function(){
		window.location = '<%=request.getContextPath()%>/'+nextPage;
	});

	$("#start-over-btn").on('click', function(){
		$.ajax({
			url:'${pageContext.request.contextPath}/ajax/savings-insurance/clearPolicyApplication',
			type:'get',
		    cache:false,
		    async:false,
		    error:function(){
		    },
		    success:function(data){
		    	if(data != null && data.errorMsg == null){
		    		window.location = '<%=request.getContextPath()%>/${language}/savings-insurance/sales-illustration';
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
		if("${authenticate}" == "true" && "${authenticate}" != "*DIRECTGI"){
			window.location = '<%=request.getContextPath()%>/${language}/savings-insurance/customer-service-centre';
		}else{
			apply=true;
            $('#loginpopup #fna-check').val("true");
            $('#loginpopup #nav-bar-check').val("false");
			$('#loginpopup').modal('show');
		}
	}

	function goServiceCenter() {
		window.location = '<%=request.getContextPath()%>/${language}/savings-insurance/customer-service-centre';
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
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/savie-2016/bootstrap-slider.js"></script>
<%--<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/savie-online/savie-online.js"></script> --%>
