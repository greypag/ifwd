<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<script type="text/javascript">
var context = "${pageContext.request.contextPath}";
var languageP = "${language}";
</script>

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/material.min.css" />

<%!
	boolean isSaleActiveClass = false;
	boolean isEservicesActiveClass = false;
%>
<div class="fwd-savie-wrapper savie-online-container with-breadcrumbs-steps" id="plan-details-b-page">
	<!-- HEADER -->
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
					<li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
					<li class="step-number"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">2</span>Application &amp; payment</button></li>
					<li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
					<li class="step-number"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">3</span>Summary &amp; declaration</button></li>
					<li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
					<li class="step-number"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">4</span>Signature</button></li>
					<li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
					<li class="step-number"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">5</span>Document upload</button></li>
					<li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
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
									<select name="payment-type" id="type-of-payment" class="form-control gray-dropdown pd-dropdown" data-bv-field="payment-type">
									   <option value="regular-payment">Regular Payment</option>
									   <option value="one-off-premium" selected="">One-off premium</option>
									</select>
									<img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg">
								</div>
							</div>
							<div class="col-xs-12 hidden" id="plan-amount-holder">
								<div class="selectDiv centreDiv gray-text-bg">
									<select name="plan-amount" id="plan-amount" class="form-control gray-dropdown pd-dropdown" data-bv-field="plan-amount">
									   <!-- <option value="" disabled="" selected="">Amount (HK$)</option>
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
								</div>
							</div>
							<div class="col-xs-12" id="amount-slide-holder">
								<div class="one-off-premium">
				                   <div class="pull-right">
				                   		<h3 class="amount-selected">HKD <span id="range">${saviePlanDetails.insuredAmount1 !=null ? saviePlanDetails.insuredAmount1:"100,000" }</span></h3>
				                   </div>
									<input type="text" class="span2 amount-slider" name="amount" value="${saviePlanDetails.insuredAmount !=null ? saviePlanDetails.insuredAmount:'100000' }" data-slider-step="2000" data-slider-min="30000" data-slider-max="" data-slider-step="500" data-slider-value="${saviePlanDetails.insuredAmount !=null ? saviePlanDetails.insuredAmount:'100000' }" data-slider-id="RC" id="R" data-slider-tooltip="hide" data-slider-handle="square" />
									<div class="min-max-holder clearfix">
										<div class="pull-left text-center">
											<p>Min</p>
											<p id="min-value">30,000</p>
										</div>
										<div class="pull-right text-center">
											<p>Max</p>
											<p id="max-value">400,000</p>
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
									<input type="text" name="plan-dob" id="plan-dob-datepicker" value="${savingDob!=null && type != '2' ? savingDob:defaultDOB }" <c:if test="${type == '2' }">readonly="readonly"</c:if> placeholder="Date of birth" class="form-control" />
									<img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg">
								</div>
								<%-- <div class="input-group input-append date" id="plan-dob">
									<input readonly value="${savingDob!=null ? savingDob:defaultDOB }" type="text" name="plan-dob" id="plan-dob-datepicker" placeholder="Date of birth" class="date" />
									<span class="input-group-addon add-on"><img class="arrow" src="<%=request.getContextPath()%>/resources/images/savie/arrow-down.png"></span>
								</div> --%>
							</div>
							<div class="col-xs-12 hidden" id="total-years-holder">
								<div class="selectDiv centreDiv gray-text-bg">
									<select name="total-payment-years" id="total-payment-years" class="form-control gray-dropdown pd-dropdown" data-bv-field="total-payment-years">
									   <option value="3" selected="">3</option>
									</select>
									<img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg">
								</div>
							</div>								
						</div>
					</div>
					<div class="col-xs-12 col-md-2 plan-promo-code">
						<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield" class="promo-code">
				            <input id="promoCode" class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input"  type="text" />
				           	<label class="mdl-textfield__label so-mdl-textfield-label" for="correspondenceAddress3">Promo code</label> 
			           	</div>
					</div>
					<div class="col-xs-12 col-md-2 plan-calculate">
						<button type="button" class="btn savie-common-btn" id="plan-calculate-btn">Calculate</button>
					</div>
				</div>
			</div>
		</div>
		<div class="container-fluid fwd-container" id="plan-details-wrapper">
	<div class="pd-summary-table" id="table-content-pd">
		<div class="summary-table">
			<div class="summary-table-head clearfix">
				<h4 class="summary-note-title">Summary</h4>
				<p class="summary-note">You will receive <span id="3rd_policy_year" class="received-money">HK$0</span> at the end of 3rd policy year</p>
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
				</div>
			</div>
			<div class="after-3-years-container" id="after-3-years-container" style="display:none">
				<div class="crediting-rate">
					<h4 class="crediting-rate-title">Crediting rate : </h4>
					<div class="rate-buttons">
						<button class="rate-btn" id="rate-0" type="button">0%</button>
						<button data-toggle="tooltip" data-html="true" data-placement="right" title='<p class="bold">Conservative Basis</p><p class="info-content">Most adverse investment return scenario</p>' class="rate-btn active" id="rate-2" type="button">2%</button>
						<button class="rate-btn" id="rate-3" type="button">3%</button>
						<button class="rate-btn" id="rate-4" type="button">3.3%</button>
					</div>
				</div>
				<div class="table-content" id="after-3-years">
					<div id="rate-table-0" class="rate-table hidden">
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
									<td class="policy-credit policy-number bold" id="policy-year-4-0">0</td>
									<td class="policy-credit hidden-sm hidden-xs" id="credit-rate-4-0">3.3</td> 
									<td id="premium-change-4-0">0</td> 
									<td class="hidden-sm hidden-xs" id="account-value-change-4-0">0</td>    
									<td id="surrender-change-4-0">0</td>
									<td class="hidden-sm hidden-xs" id="death-change-4-0"><span data-toggle="tooltip" data-html="true" data-placement="right" title="Death Benefit (HK$) / Accidental Death Benefit (HK$)" class=" default-pointer">0 / 0</span></td>
								</tr>
								<tr class="pinkish-shade">
									<td class="policy-credit policy-number bold" id="policy-year-4-1">0</td>
									<td class="policy-credit hidden-sm hidden-xs" id="credit-rate-4-1">3.3</td> 
									<td id="premium-change-4-1">0</td> 
									<td class="hidden-sm hidden-xs" id="account-value-change-4-1">0</td>    
									<td id="surrender-change-4-1">0</td>
									<td class="hidden-sm hidden-xs" id="death-change-4-1"><span data-toggle="tooltip" data-html="true" data-placement="right" title="Death Benefit (HK$) / Accidental Death Benefit (HK$)" class=" default-pointer">0 / 0</span></td>
								</tr>
								<tr>
									<td class="policy-credit policy-number bold" id="policy-year-4-2"><fmt:message key="savie.planDetails.Age.100" bundle="${msg}" /></td> 
									<td class="policy-credit hidden-sm hidden-xs" id="credit-rate-4-2">3.3</td>
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
				<button type="button" class="white-btn up" id="first-3-years-btn" onclick="toggleImg()"><span id="after-3">After 3 years </span><span id="first-3" class="hidden">First 3 years </span><img id="arrow-img-years" src="<%=request.getContextPath()%>/resources/images/savie-2016/arrow-down2.png" /></button>
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
									   <img src="<%=request.getContextPath()%>/resources/images/savie-2016/arrow-down1.png" />
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
									   <img src="<%=request.getContextPath()%>/resources/images/savie-2016/arrow-down1.png" />
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
									   <img src="<%=request.getContextPath()%>/resources/images/savie-2016/arrow-down1.png" />
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
									   <img src="<%=request.getContextPath()%>/resources/images/savie-2016/arrow-down1.png" />
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
			<button type="button" id="btn-login" class="btn plan-details-btn savie-common-btn hidden">Login to proceed</button>
			<button type="button" id="btn-proceed" class="btn plan-details-btn savie-common-btn hidden">Proceed</button>
			<button type="button" id="btn-back" class="btn plan-details-btn savie-common-btn hidden">Back to summary</button>
			<a href="<%=request.getContextPath()%>/${language}/savings-insurance/customer-service-centre" class="pd-link">Apply at Customer Service Centre</a>
		</div>
		<!-- MODALS / LIGHTBOXES -->
		<div class="modal fade common-welcome-modal" id="offline-online-modal" tabindex="-1" role="dialog">
			<div class="modal-dialog">
			    <div class="modal-content">
			    	<div class="row">
			    		<div class="col-xs-2 col-md-1 numbering-holder">
			    			<img src="<%=request.getContextPath()%>/resources/images/savie-2016/dk-numbering.png" class="visible-md visible-lg" />
			    			<img src="<%=request.getContextPath()%>/resources/images/savie-2016/mb-numbering.png" class="visible-xs visible-sm" />
			    		</div>
			    		<div class="col-xs-10 col-md-10" id="steps-holder">
			    			<h4 class="text-center">Thank you for your interest on this product</h4>
			    			<div id="step-1" class="step">
			    				<div class="media">
			    					<div class="media-left" id="step1-img-holder">
			    						 <img class="media-object" src="<%=request.getContextPath()%>/resources/images/savie-2016/book-icon.png" />
			    					</div>
			    					<div class="media-body">
			    						<p class="procedure">According to the Hong Kong Federation of Insurers’ guidelines, insurance companies should carry out Financial Need Analysis(FNA) before selling insurance products. Our professional Customer Service Representatives will provide suitable product options for your comparison after FNA.</p>
			    					</div>
			    				</div>
			    			</div>
			    			<div id="step-2" class="step">
			    				<div class="media">
			    					<div class="media-left" id="step2-img-holder">
			    						  <img class="media-object" src="<%=request.getContextPath()%>/resources/images/savie-2016/note-icon.png" />
			    					</div>
			    					<div class="media-body">
			    						<p class="procedure">Once FNA and the product comparison confirmed Savie is suitable for you, you may begin the application process immediately at the customer service centre.</p>
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
					    						<p class="procedure"><span class="bold-head">Online procedure</span> <span class="hidden-dash">-</span><br class="visible-md visible-lg" />  You may proceed both FNA and application on this platform, you may take your time to fill in the information, we provide a “Save for later” function available at the application section, you may save your application progress and come back to complete later. </p>
					    						<button class="btn savie-common-btn" id="online-application-btn">Online application</button>
					    					</div>
					    				</div>
			    					</div>
			    				</div>
			    				<div class="or-word">
			    					<div id="or-mobile"><img src="<%=request.getContextPath()%>/resources/images/savie-2016/or-mobile.png" />
			    					</div>
			    				</div>
			    				<div class="col-md-6 col-xs-12" id="step-offline">
			    					<div class="step">
					    				<div class="media">
					    					<div class="media-left">
					    						 <img class="media-object" src="<%=request.getContextPath()%>/resources/images/savie-2016/clockfold-icon.png" />
					    					</div>
					    					<div class="media-body">
					    						<p class="procedure"><span class="bold-head">Offline procedure</span> <span class="hidden-dash">-</span><br class="visible-md visible-lg" /> To maintain a high service quality standard, the FNA and application process (if applicable) will take about 30 to 45 minutes. Please choose your preferred timeslot and customer service centre for the appointment. </p>
					    						<button class="btn savie-common-btn" id="offline-application-btn">Offline application</button>
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
		<div class="modal fade common-welcome-modal" id="prev-savie-app-modal" tabindex="-1" role="dialog">
		  <div class="modal-dialog">
		    <div class="modal-content">
		    	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
		     	<h4 class="text-center welcome-msg">Welcome back to Savie!</h4>
		     	<p class="text-center description-msg">Unfortunately, each member can buy one online application only, please make an appointment to our Customer Services center.</p>
		     	<center><button class="btn savie-common-btn" id="make-appointment-btn">Make an appointment</button></center>
		    </div>
		  </div>
		</div>
		<div class="modal fade common-welcome-modal" id="review-fna-modal" tabindex="-1" role="dialog">
			<div class="modal-dialog">
			    <div class="modal-content">
			    	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
			     	<h4 class="text-center welcome-msg">Welcome back! <span id="fullName">${userDetails.fullName }</span></h4>
			     	<p class="text-center description-msg">You have already completed a Financial Needs Analysis previously, you may review and edit your FNA for an updated Product Recommendation.</p>
			     	<center><button class="btn savie-common-btn" id="review-fna-btn">Review FNA</button></center>
			    </div>
			 </div>
		</div>
	</div>
      </div>
<div id="loadingDiv" class="waitingDiv" style="display: none; margin-left:auto; margin-right:auto;">
    <img style="width: 300px; height: 300px;"
        src="<%=request.getContextPath()%>/resources/images/ajax-loader2.gif">
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
		
		if('2'!='${type }'){
			$('#plan-dob-datepicker').datepicker({
				format: "dd-mm-yyyy",
				startView: "decade",
				startDate: dob_start_date,
				endDate: dob_end_date,
				autoclose: true,
				startView: 2
			});
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
			getSavieOnlinePlandetails();
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
	    
		getSavieOnlinePlandetails();
		if($("#plan-dob-datepicker").val()!="") {
			setPaymentYears($("#plan-dob-datepicker").val())
		}
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
		if('2'=='${type }'){
			window.location = '<%=request.getContextPath()%>/${language}/savings-insurance/${nextPageFlow2}';
		}else {
			$('#offline-online-modal').modal('show');
		}
	});
	
	$("#online-application-btn").on('click', function(){
		$('#offline-online-modal').modal('hide');
		if("${authenticate}" == "true" && "${authenticate}" != "*DIRECTGI"){
			saviePlanDetailsGoNext();
		}else{
			$('.modal').modal('hide');
            $('.login-info').removeClass('hidden');
            $('#loginpopup .modal-dialog').addClass('loginpopupext');			
			$('#loginpopup').modal('show');			
		}
	});
	
	$("#offline-application-btn").on('click', function(){
		window.location = '<%=request.getContextPath()%>/${language}/savings-insurance/customer-service-centre';
	});
	
	function saviePlanDetailsGoNext(){
		if($("#type-of-payment").val() == 'regular-payment') {
			window.location = '<%=request.getContextPath()%>/${language}/savings-insurance/customer-service-centre';
		}else {
			$.ajax({     
			    url:'${pageContext.request.contextPath}/ajax/savings-insurance/getPurchaseHistoryByPlanCode',     
			    type:'get',     
			    error:function(){       
			    },     
			    success:function(data){
   		    		$('#loginpopup').modal('hide');
			    	if(data != null && data.errMsgs == null && data.policies !=null && data.policies.length > 0){
			    		$('#prev-savie-app-modal').modal({backdrop: 'static', keyboard: false});
			    		$('#prev-savie-app-modal').modal('show');
			    		
			    	}else{
			    		$.ajax({     
			    		    url:'${pageContext.request.contextPath}/ajax/savings-insurance/show',     
			    		    type:'get',     
			    		    error:function(){       
			    		    },     
			    		    success:function(data){
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
			});
		}
	}
	
	$("#make-appointment-btn").on('click', function(){
		window.location = '<%=request.getContextPath()%>/${language}/savings-insurance/customer-service-centre';
	});
	
	$("#review-fna-btn").on('click', function(){
		window.location = '<%=request.getContextPath()%>/${language}/FNA/review';
	});
	
	$(document).on('change','#plan-dob-datepicker',function(){
		if($(this).val()!="") {
			setPaymentYears($(this).val())
		}
	});
	
	function setPaymentYears(dob){
		var from = dob.split("-");
		var birthdate = new Date(from[0], from[1] - 1, from[2]);
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
</script>
<%-- <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/savie-2016/bootstrap-slider.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/savie-online/savie-online.js"></script> --%>