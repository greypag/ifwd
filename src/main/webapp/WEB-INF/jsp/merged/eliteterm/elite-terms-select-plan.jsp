<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeQuoteBean"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/icomoon.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/jquery.jscrollpane.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap-slider.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/styles.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/styles-et.css">
<script type="text/javascript">
var context = "${pageContext.request.contextPath}";
var signatureFileSize = "${signatureFileSize}";
var selectPlanNextPageFlow = "${nextPageFlow}";
var languageP = "${language}";
var home_url = "<%=request.getContextPath()%>";
</script>
		<%!
			boolean isSaleActiveClass = false;
			boolean isEservicesActiveClass = false;
		%>
		<div class="fwd-savie-wrapper fwd-et-wrapper">			          
			<div class="container-fluid fwd-full-container">
				<div class="application-page-header et-header-browse">
					<div class="row reset-margin hidden-xs hidden-sm">
                  <div class="col-md-2 reset-padding">
                      <button type="button" class="et-header-info-btn et-bind-btn-header active" id="select-plan" data-et-section-target="et-select-plan-section"><fmt:message key="eliteTerms.selectPlan.Select.plan" bundle="${msg}" /></button>
                  </div>
                  <div class="col-md-2 reset-padding">
                      <button type="button" class="et-header-info-btn et-bind-btn-header" id="application" data-et-section-target="et-application-section" ><fmt:message key="eliteTerms.selectPlan.Application" bundle="${msg}" /></button>
                  </div>
                  <div class="col-md-3 reset-padding">
                      <button type="button" class="et-header-info-btn et-bind-btn-header no-hover" id="payment" data-et-section-target="et-dec-sign-section"><fmt:message key="eliteTerms.selectPlan.Payment" bundle="${msg}" /></button>
                  </div>
                  <div class="col-md-3 reset-padding">
                      <button type="button" class="et-header-info-btn no-hover" id="summary" ><fmt:message key="eliteTerms.selectPlan.Upload.document" bundle="${msg}" /></button>
                  </div>
                  <div class="col-md-2 reset-padding">
                      <button type="button" class="et-header-info-btn et-bind-btn-header no-hover" id="confirmation" data-et-section-target="et-confirmation-section"><fmt:message key="eliteTerms.selectPlan.Confirmation" bundle="${msg}" /></button>
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
								<h3 id="et-active-section-label"><fmt:message key="eliteTerms.selectPlan.Select.plan" bundle="${msg}" /></h3>
							</div>
						</div>
					</div>
				</div>
			</div>
         
         <div class="application-flux">
            <!--Elite Terms Header Info Widget-->
         <div class="fwd-container container-fluid breadcrumbs hidden-xs hidden-sm">
            <ol class="breadcrumb breadcrumbs-product-details et-breadcrumbs">
               <li><fmt:message key="home.breadcrumb1.item1" bundle="${msg}" /></li>
               <li class="divider"><i class="fa fa-play"></i></li>
               <li><fmt:message key="home.breadcrumb1.type1" bundle="${msg}" /></li>
               <li class="divider"><i class="fa fa-play"></i></li>
               <li><fmt:message key="home.breadcrumb1.term" bundle="${msg}" /></li>
               <li class="divider last"><i class="fa fa-play"></i></li>
               <li class="active-bc" id="et-active-bc-menu"><fmt:message key="home.breadcrumb2.term.item1" bundle="${msg}" /></li>
            </ol>
         </div>         
            <!--
               SELECT PLAN SECTION
            -->
            <div id="et-select-plan-section" class="et-element-section-wrapper">
               
               <!--Elite Terms Before We Start Widget-->
               <div class="container-fluid fwd-container">
                  <!--Before we start-->
                  <p class="et-bfr-start-txt">
                    <fmt:message key="eliteTerms.selectPlan.If.you.want.to.fill" bundle="${msg}" />
                  </p>
                  
                  <div class="et-before-we-start">
                     <h2 class="et-bfr-txt"><fmt:message key="eliteTerms.selectPlan.Before.we.start" bundle="${msg}" /></h2>
                     
                     <div class="et-broken-line et-padding"></div>
                     
                     <p class="et-bfr-start-txt bottom">
                        <fmt:message key="eliteTerms.selectPlan.Do.you.have.an" bundle="${msg}" />
                     </p>
                     
                     <div class="clearfix">
                        <input type="radio" id="et-before-yes" name="et-before" value="et-before-yes">
                        <input type="hidden" id="channel">
                        <label class="et-before-we-start-yes pull-left" for="et-before-yes" data-toggle="modal" data-target="#cannot-apply-modal" onclick="getCsChannel('ET2M');">	
                           <span class="et-before-text"><fmt:message key="eliteTerms.selectPlan.Yes" bundle="${msg}" /></span>
                        </label>
                        
                        <input type="radio" id="et-before-no" name="et-before" value="et-before-no">
                        <label class="et-before-we-start-no no pull-right" for="et-before-no">
                           <span class="et-before-text"><fmt:message key="eliteTerms.selectPlan.No" bundle="${msg}" /></span>
                        </label>
                     </div>
                  </div>
                  <div class="et-next-btn-div">
                     <button type="button" id="et-btn-before-start" class="btn btn-orange hidden et-next-btn et-pad-bot-50" data-toggle=""><fmt:message key="eliteTerms.selectPlan.Next" bundle="${msg}" /></button>
                  </div>
               </div>
               </div>
                  
               <!--ABOUT YOURSELF-->
               <div id="et-about-yoursel-section" class="hide-element">
                  <div class="et-broken-line et-full"></div>
                  <div class="container-fluid fwd-container">
                     <form id="eliteTermsAboutYourselfForm" method="post" action="" onSubmit="return false;">
                        <div class="et-about-urself">
                           <h2 class="et-about-urself-text"><fmt:message key="eliteTerms.selectPlan.About.yourself" bundle="${msg}" /></h2>
                           
                           <div class="et-broken-line et-padding"></div>
                           
                           <div class="row reset-margin et-gender-main-div">
                              <div class="col-md-4 col-xs-12">
                                 <h4 class="et-gender-txt"><fmt:message key="eliteTerms.selectPlan.Your.gender" bundle="${msg}" /></h4>
                                 
                                 <div class="clearfix et-gender-wrapper">
                                    <div class="et-gender-div">
                                       <input type="radio" id="et-gender-male" name="et-gender" class="et-gender-radio" value="M" />
                                       <label for="et-gender-male">
                                          <img src="<%=request.getContextPath()%>/resources/images/elite-terms/et-nb-male-icon.png" alt="et-male.png" />
                                       </label>
                                       <div class="et-gnder-txt text-center"><fmt:message key="eliteTerms.selectPlan.Male" bundle="${msg}" /></div>
                                    </div>
                                    
                                    <div class="et-gender-div">
                                       <input type="radio" id="et-gender-female" class="et-gender-radio" name="et-gender" value="F" />
                                       <label for="et-gender-female">
                                          <img src="<%=request.getContextPath()%>/resources/images/elite-terms/et-nb-female-icon.png" alt="et-male.png" />
                                       </label>
                                       <div class="et-gnder-txt text-center"><fmt:message key="eliteTerms.selectPlan.Female" bundle="${msg}" /></div>
                                    </div>
                                 </div>
                                 <span class="err-msg" id="et-gender-message"></span>

                                 <div class="et-broken-line et-padding hidden-md hidden-lg"></div>
                              </div>
                              
                              <div class="col-md-4 col-xs-12">
                                 <h4 class="et-dob-txt"><fmt:message key="eliteTerms.selectPlan.Your.date.of.birth" bundle="${msg}" /></h4>
                                 <div id="et-select-plan-date" class="selectDiv et-select-plan-date">
                                    <input type="text" class="date et-ays-datepicker" name="et-select-plan-date" id="et-select-plan-date-input" placeholder="DD-MM-YYYY" readonly="" >
                                 </div>
                                 <span class="err-msg" id="et-ays-datepicker-message"></span>
                                 <div class="et-broken-line et-padding hidden-md hidden-lg"></div>
                              </div>
                              <div class="col-md-4 col-xs-12">
                                 <h4 class="et-dob-txt smoker"><fmt:message key="eliteTerms.selectPlan.Are.you.a" bundle="${msg}" /></h4>    
                                 
                                 <div class="clearfix et-smoke-wrapper">
                                    <div class="et-gender-div">
                                       <input type="radio" id="et-smoker-yes" name="et-smoker" value="true">
                                       <label for="et-smoker-yes" class="et-smoker-label">
                                          <img src="<%=request.getContextPath()%>/resources/images/elite-terms/et-nb-smoker.png" alt="et-male.png" />
                                       </label>
                                       <div class="et-smoker-txt yes text-center"><fmt:message key="eliteTerms.selectPlan.Yes" bundle="${msg}" /></div>
                                    </div>
                                    
                                    <div class="et-gender-div">
                                       <input type="radio" id="et-smoker-no" name="et-smoker" value="false">
                                       <label for="et-smoker-no" class="et-smoker-label">
                                          <img src="<%=request.getContextPath()%>/resources/images/elite-terms/et-nb-non-smoker.png" alt="et-male.png" />
                                       </label>
                                       <div class="et-smoker-txt no text-center"><fmt:message key="eliteTerms.selectPlan.No" bundle="${msg}" /></div>
                                    </div>
                                 </div>
                                 <span class="err-msg" id="et-smoke-message"></span>
                              </div>
                           </div>
                        </div>
                     
                     
                        <div class="et-next-btn-div">
                           <button id="et-btn-ay-self" class="btn btn-orange et-next-btn et-pad-bot-50"><fmt:message key="eliteTerms.selectPlan.Next" bundle="${msg}" /></button>
                        </div>
                     </form>
                  </div>
               </div><!--END OF ABOUT YOURSELF-->
               
               <!--PLAN OPTION-->
               <div id="et-plan-option-section" class="hide-element">
                  <div class="et-broken-line et-full"></div>
                  <div class="container-fluid fwd-container">			
                     
                     <div class="et-plan-option">
                        <div class="et-option-wrapper">
                           <h2 class="et-plan-option-text"><fmt:message key="eliteTerms.selectPlan.Plan.option" bundle="${msg}" /></h2>
                           <div class="et-broken-line et-padding"></div>
                           
                           <div class="row reset-margin">
                              <div class="col-xs-12 col-md-6 et-insurance-amount">
                                 <div class="et-tooltip-wrapper">
                                    <h3 class="et-insured-amount">
                                       <span><fmt:message key="eliteTerms.selectPlan.Insured.amount" bundle="${msg}" /></span>
                                       <span>
                                          <button type="button" class="et-minimal et-insured-amount-tooltip" data-container="body" data-trigger="hover focus click" data-html="true" data-toggle="tooltip" data-placement="top" title="<fmt:message key="eliteTerms.selectPlan.Insured.amount.tooltip" bundle="${msg}" />" data-template='<div class="tooltip et-sp-tooltip-wrapper" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>'><span class="et-info-tooltip "></span></button>
                                       </span>
                                    </h3> 
                                 </div>
                                 <p class="et-hkd"><fmt:message key="eliteTerms.selectPlan.HKD" bundle="${msg}" /> <span class="et-hkd-dollars" id="et-slider-range">${(etPolicyApplication.amount != null && etPolicyApplication.amount != '') ? etPolicyApplication.amount:'800000' }</span></p>
                                 <div class="clearfix et-slider-info-div">
                                    <div class="pull-left">
                                       <p class="et-slider-info center"><fmt:message key="eliteTerms.selectPlan.Min" bundle="${msg}" /></p>
                                       <p class="et-slider-info"><fmt:message key="eliteTerms.selectPlan.Min.val" bundle="${msg}" /></p>
                                    </div>
                                    <div class="pull-right">
                                       <p class="et-slider-info center"><fmt:message key="eliteTerms.selectPlan.Max" bundle="${msg}" /></p>
                                       <p id="et-ins-amt-max-display" class="et-slider-info"><fmt:message key="eliteTerms.selectPlan.Max.val" bundle="${msg}" /></p>
                                    </div>
                                 </div>
                                 <input type="text" class="span2" name="amount" value="" data-slider-min="400000" data-slider-max="2000000" data-slider-step="10000" data-slider-value="${(etPolicyApplication.amount != null && etPolicyApplication.amount != '') ? etPolicyApplication.amount:'800000' }" data-slider-ticks-snap-bounds="10000" data-slider-id="ET" id="R2" data-slider-tooltip="hide" data-slider-handle="square" />
                                 <div class="et-broken-line et-padding hidden-md hidden-lg"></div>
                              </div>
                              <div class="col-xs-12 col-md-5">
                                 <div class="et-tooltip-wrapper">
                                    <h3 id="promocode-hide-switch" class="et-promo-code-txt et-mbot-15">
                                       <span>
                                          <fmt:message key="eliteTerms.selectPlan.Promo.code" bundle="${msg}" />
                                       </span>
                                       <span>
                                          <button type="button" class="et-minimal et-promo-code-tooltip" data-container="body" data-trigger="hover focus click" data-html="true" data-toggle="tooltip" data-placement="top" title="<fmt:message key="eliteTerms.selectPlan.Promo.code.tooltip" bundle="${msg}" />" data-template='<div class="tooltip et-sp-tooltip-wrapper" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>'><span class="et-question-tooltip"></span></button>
                                          <img src="<%=request.getContextPath()%>/resources/images/elite-terms/orange-caret.png" class="reversed">
                                       </span>
                                    </h3>
                                 </div>
                                 <div id="promocode-hidden" class="hidden-sm hidden-xs">
                                    <div class="clearfix">
                                       <div class="et-promo-code-txtbox">
                                          <input name="promocode" type="text" autocomplete="off" placeholder="<fmt:message key="eliteTerms.selectPlan.IF.APPLICABLE" bundle="${msg}" />" class="et-promocode" id="et-promocode" value="${etPolicyApplication.promocode }">
                                       </div>
                                    </div>
                                    <a href="#" title="Get your promotion code" class="et-promo-code-question" data-toggle="modal" data-target="#get-promotion-code-popup"><i><fmt:message key="eliteTerms.selectPlan.How.do.I.get" bundle="${msg}" /></i></a>
                                 </div>
                              </div>	
                           </div>
                           <div id="promocode-hidden-button" class="et-next-btn-div et-calcu">
                              <button type="button" class="btn btn-orange et-calculate-btn" onclick="getEliteTermPremium();"><fmt:message key="eliteTerms.selectPlan.Calculate" bundle="${msg}" /></button>
                           </div>
                        </div>
                        
                        <!-- <div class="et-broken-line et-padding hidden-md hidden-lg"></div> -->
                        
                        <div class="et-plan-option-extra-info hide-element" id="et-dis-promo-amount">
                           <div class="et-extra-info top">
                              <span class="et-amount"><fmt:message key="eliteTerms.selectPlan.Amount" bundle="${msg}" /></span>
                              <div class="et-po-amount-label"><fmt:message key="eliteTerms.selectPlan.discount.period1" bundle="${msg}" /></div>
                           </div>
                           <div class="et-extra-info bottom">
                              <div class="et-center-div">
                                 <p class="et-amount"><fmt:message key="eliteTerms.selectPlan.HK$" bundle="${msg}" /> <span id="et-month-dis-amount"><fmt:formatNumber value="${eliteTermPremium.monthlyDuePremium }" pattern="#.00"/></span> <fmt:message key="eliteTerms.selectPlan.permonth" bundle="${msg}" /></p>
                                 <p class="et-per et-month"><fmt:message key="eliteTerms.selectPlan.perday1" bundle="${msg}" /> <span id="et-day-dis-amount"><fmt:formatNumber value="${eliteTermPremium.dailyDuePremium }" pattern="#.00"/></span> <fmt:message key="eliteTerms.selectPlan.perday2" bundle="${msg}" /></p>
                              </div>
                              
                           </div>
                        </div>
                        <div class="et-plan-option-extra-info" id="et-act-promo-amount">
                           <div class="et-extra-info top">
                              <span class="et-amount"><fmt:message key="eliteTerms.selectPlan.Amount" bundle="${msg}" /></span>
                              <div class="et-po-amount-label" data-et-default-period="<fmt:message key="eliteTerms.selectPlan.default.period" bundle="${msg}" />" data-et-discount-period="<fmt:message key="eliteTerms.selectPlan.discount.period2" bundle="${msg}" />"><fmt:message key="eliteTerms.selectPlan.default.period" bundle="${msg}" /></div>
                           </div>
                           <div class="et-extra-info bottom">
                              <div class="et-center-div">
                                 <p class="et-amount"><fmt:message key="eliteTerms.selectPlan.HK$" bundle="${msg}" /> <span id="et-month-amount"><fmt:formatNumber value="${eliteTermPremium.monthlyPremium }" pattern="#.00"/></span> <fmt:message key="eliteTerms.selectPlan.permonth" bundle="${msg}" /></p>
                                 <p class="et-per et-month"><fmt:message key="eliteTerms.selectPlan.perday1" bundle="${msg}" /> <span id="et-day-amount"><fmt:formatNumber value="${eliteTermPremium.dailyPremium }" pattern="#.00"/></span> <fmt:message key="eliteTerms.selectPlan.perday2" bundle="${msg}" /></p>
                              </div>
                              
                           </div>
                        </div>
                     </div>
                  </div>
               
                  <!--Accordion Highlights-->
                  <div class="container-fluid fwd-full-container">
                     <div class="et-accrdn-list">
                        <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                           <div class="panel et-panel-accordion ">
                              <div class="panel-heading et-panel-heading" role="tab" id="headingOne">
                                 <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne" class="et-collapse-link clearfix" id="headingOne">
                                    <fmt:message key="eliteTerms.selectPlan.Product.highlights" bundle="${msg}" />
                                    <span class="fa fa-angle-up pull-right et-arrow-down" ></span>
                                    <span class="fa fa-angle-down pull-right et-arrow-down" ></span>
                                 </a>
                              </div>
                              <div id="collapseOne" class="panel-collapse collapse in et-select-plan-panel" role="tabpanel" aria-labelledby="headingOne">
                                 <div class="et-panel-body et-panel-body-first" id="panelOne">
                                    <p class="et-accrdion-txt-bold"><fmt:message key="eliteTerms.selectPlan.Product.highlights.line1" bundle="${msg}" /></p>
                                    <p class="et-accrdion-txt-normal"><fmt:message key="eliteTerms.selectPlan.Product.highlights.line2.part1" bundle="${msg}" /> <a href="#" class="et-contact-link" title="Contact customer service" data-toggle="modal" data-target="#cannot-apply-modal" onclick="getCsChannel('ETMD1');"><fmt:message key="eliteTerms.selectPlan.Product.highlights.line2.part2" bundle="${msg}" /></a> <fmt:message key="eliteTerms.selectPlan.Product.highlights.line2.part3" bundle="${msg}" /></p>
                                    <p class="et-accrdion-txt-normal bottom"><fmt:message key="eliteTerms.selectPlan.Product.highlights.line3" bundle="${msg}" /></p>
                                    <p class="et-accrdion-txt-normal"><fmt:message key="eliteTerms.selectPlan.Product.highlights.line4" bundle="${msg}" /></p>
                                 </div>
                              </div>
                           </div>
                           <div class="panel et-panel-accordion ">
                              <div class="panel-heading et-panel-heading" role="tab" id="headingTwo">
                                 <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseOne" class="et-collapse-link clearfix" id="headingTwo">
                                    <fmt:message key="eliteTerms.selectPlan.important.notes" bundle="${msg}" />
                                    <span class="fa fa-angle-up pull-right et-arrow-down" ></span>
                                    <span class="fa fa-angle-down pull-right et-arrow-down" ></span>
                                 </a>
                              </div>
                              <div id="collapseTwo" class="panel-collapse collapse et-select-plan-panel" role="tabpanel" aria-labelledby="headingTwo">
                              <div class="et-panel-body" id="panelTwo">
                                    <p>
                                       <ol>
                                          <li><fmt:message key="eliteTerms.selectPlan.important.notes.line1" bundle="${msg}" /></li>
                                          <li><fmt:message key="eliteTerms.selectPlan.important.notes.line2" bundle="${msg}" /></li>
                                       </ol>
                                    </p>
                              </div>
                              </div>
                           </div>
                           <div class="panel et-panel-accordion ">
                              <div class="panel-heading et-panel-heading" role="tab" id="headingThree">
                                 <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseOne" class="et-collapse-link clearfix" id="headingThree">
                                    <fmt:message key="eliteTerms.selectPlan.Key.Product.Risks" bundle="${msg}" />
                                    <span class="fa fa-angle-up pull-right et-arrow-down" ></span>
                                    <span class="fa fa-angle-down pull-right et-arrow-down" ></span>
                                 </a>
                              </div>
                              <div id="collapseThree" class="panel-collapse collapse et-select-plan-panel" role="tabpanel" aria-labelledby="headingThree">
                              <div class="et-panel-body" id="panelThree">
                                    <p class="et-accrdion-txt-bold accordion-title"><fmt:message key="eliteTerms.selectPlan.Key.Product.Risks.t1" bundle="${msg}" /></p>
                                    <p class="et-accrdion-txt-normal accordion-copy"><fmt:message key="eliteTerms.selectPlan.Key.Product.Risks.t1.copy" bundle="${msg}" /></p>
                                    <p class="et-accrdion-txt-bold accordion-title"><fmt:message key="eliteTerms.selectPlan.Key.Product.Risks.t2" bundle="${msg}" /></p>
                                    <p class="et-accrdion-txt-normal accordion-copy"><fmt:message key="eliteTerms.selectPlan.Key.Product.Risks.t2.copy" bundle="${msg}" /></p>
                                    <p class="et-accrdion-txt-bold accordion-title"><fmt:message key="eliteTerms.selectPlan.Key.Product.Risks.t3" bundle="${msg}" /></p>
                                    <p class="et-accrdion-txt-normal accordion-copy"><fmt:message key="eliteTerms.selectPlan.Key.Product.Risks.t3.copy" bundle="${msg}" /></p>
                                    <p class="et-accrdion-txt-bold accordion-title"><fmt:message key="eliteTerms.selectPlan.Key.Product.Risks.t4" bundle="${msg}" /></p>
                                    <p class="et-accrdion-txt-normal accordion-copy"><fmt:message key="eliteTerms.selectPlan.Key.Product.Risks.t4.copy" bundle="${msg}" /></p>
                                    <p class="et-accrdion-txt-bold accordion-title"><fmt:message key="eliteTerms.selectPlan.Key.Product.Risks.t5" bundle="${msg}" /></p>
                                    <p class="et-accrdion-txt-normal accordion-copy"><fmt:message key="eliteTerms.selectPlan.Key.Product.Risks.t5.copy" bundle="${msg}" /></p>
                                    <p class="et-accrdion-txt-bold accordion-title"><fmt:message key="eliteTerms.selectPlan.Key.Product.Risks.t6" bundle="${msg}" /></p>
                                    <p class="et-accrdion-txt-normal accordion-copy"><fmt:message key="eliteTerms.selectPlan.Key.Product.Risks.t6.copy" bundle="${msg}" /></p>
                              </div>
                              </div>
                           </div>
                     </div>
                     </div>
                     
                  </div>
                  
                  <div class="container-fluid fwd-container">
                     <div class="row et-select-plan-btns">
                        <div class="col-xs-12 col-md-12 right text-center">
                           <input type="hidden" id="goApp"/>
                           <button type="button" class="btn btn-white et-proceed-appl bottom active" id="et-brn-proceed-to-application"><fmt:message key="eliteTerms.selectPlan.Proceed.to.application" bundle="${msg}" /></button>
                        </div>
                     </div>
                  </div>
               
               </div><!--PLAN OPTION-->
               
            </div><!--END OF SELECT PLAN SECTION-->
            <!--Application Wrapper -->
            <div id="et-application-wrapper">
            <!--MEDICAL, APPLICATION INFO, EMPLOYMENT INFO, & BENEFICIARY INFO SECTION-->
            <div id="et-application-first-section" class="hide-element">
               <!--Medical Declaration Widget-->
               <div class="container-fluid fwd-container">
                  <div id="et-medical-declaration" class="personal-info-widget page-application et-medical-declaration-wrapper">
                     <h2><fmt:message key="eliteTerms.selectPlan.Medical.declaration" bundle="${msg}" /></h2>
                                    
                     <div class="row margin">
                        <div class="col-sm-12 et-medial-col">
                           
                           <div class="panel-group" id="et-medic-accordion" role="tablist" aria-multiselectable="true">
                              
                              <div class="panel panel-default et-medic-panel">
                                 <div class="panel-heading" role="tab" id="et-medi-question-1-heading">
                                    <h4 class="panel-title">
                                       <a role="button" data-toggle="collapse" data-parent="#et-medic-accordion" href="#et-medi-question-1" aria-expanded="true" aria-controls="et-medi-question-1">
                                          <fmt:message key="eliteTerms.selectPlan.Question1" bundle="${msg}" />
                                       </a>
                                    </h4>
                                 </div>
                                 <div id="et-medi-question-1" class="panel-collapse collapse in et-collapse" role="tabpanel" data-next-target="et-medi-question-2" data-prev-target="" data-is-answered="false" aria-labelledby="et-medi-question-1-heading">
                                    <div class="panel-body">
                                       <div class="row">
                                          <div class="col-xs-12 col-md-8">
                                             <p><fmt:message key="eliteTerms.selectPlan.Question1.copy" bundle="${msg}" /></p>
                                          </div>
                                          <div class="col-xs-12 col-md-4">
                                             <div class="row">
                                                <div class="col-xs-6 et-pad-right-reduce-7">
                                                   <a  href="#" class="btn et-btn-medic btn et-btn-medic-yes" data-current-target="et-medi-question-1" data-next-target="et-medi-question-2" title="Yes"  data-toggle="modal" data-target="#cannot-apply-modal" onclick="getCsChannel('ETMD1');"><fmt:message key="eliteTerms.selectPlan.Yes" bundle="${msg}" /></a>
                                                </div>
                                                <div class="col-xs-6 et-pad-left-reduce-7">
                                                   <a href="#" class="btn et-btn-medic et-btn-medic-no" title="No" data-current-target="et-medi-question-1" data-next-target="et-medi-question-2" ><fmt:message key="eliteTerms.selectPlan.No" bundle="${msg}" /></a>
                                                </div>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                              
                              <div class="panel panel-default et-medic-panel">
                                 <div class="panel-heading" role="tab" id="et-medi-question-2-heading">
                                    <h4 class="panel-title">
                                       <a role="button" data-toggle="collapse" data-parent="#et-medic-accordion" href="#et-medi-question-2" aria-expanded="false" aria-controls="et-medi-question-2">
                                          <fmt:message key="eliteTerms.selectPlan.Question2" bundle="${msg}" />
                                       </a>
                                    </h4>
                                 </div>
                                 <div id="et-medi-question-2" class="panel-collapse collapse et-collapse" role="tabpanel" data-next-target="et-medi-question-3" data-prev-target="et-medi-question-1" data-is-answered="false" aria-labelledby="et-medi-question-2-heading">
                                    <div class="panel-body">
                                       <div class="row">
                                          <div class="col-xs-12 col-md-8">
                                             <p>
                                                <fmt:message key="eliteTerms.selectPlan.Question2.copy" bundle="${msg}" />
                                                <div class="row et-disease-list"> 
                                                   <ul class="col-xs-12 col-md-6">
                                                      <li><span><fmt:message key="eliteTerms.selectPlan.span1" bundle="${msg}" /></span></li>
                                                      <li><span><fmt:message key="eliteTerms.selectPlan.span2" bundle="${msg}" /></span></li>
                                                      <li><span><fmt:message key="eliteTerms.selectPlan.span3" bundle="${msg}" /></span></li>
                                                      <li><span><fmt:message key="eliteTerms.selectPlan.span4" bundle="${msg}" /></span></li>
                                                      <li><span><fmt:message key="eliteTerms.selectPlan.span5" bundle="${msg}" /></span></li>
                                                      <li><span><fmt:message key="eliteTerms.selectPlan.span6" bundle="${msg}" /></span></li>
                                                      <li><span><fmt:message key="eliteTerms.selectPlan.span7" bundle="${msg}" /></span></li>
                                                      <li><span><fmt:message key="eliteTerms.selectPlan.span8" bundle="${msg}" /></span></li>
                                                      </ul>
                                                   <ul class="col-xs-12 col-md-6">
                                                      <li><span><fmt:message key="eliteTerms.selectPlan.span9" bundle="${msg}" /></span></li>
                                                      <li><span><fmt:message key="eliteTerms.selectPlan.span10" bundle="${msg}" /></span></li>
                                                      <li><span><fmt:message key="eliteTerms.selectPlan.span11" bundle="${msg}" /></span></li>
                                                      <li><span><fmt:message key="eliteTerms.selectPlan.span12" bundle="${msg}" /></span></li>
                                                      <li><span><fmt:message key="eliteTerms.selectPlan.span13" bundle="${msg}" /></span></li>
                                                      <li><span><fmt:message key="eliteTerms.selectPlan.span14" bundle="${msg}" /></span></li>
                                                      <li><span><fmt:message key="eliteTerms.selectPlan.span15" bundle="${msg}" /></span></li>
                                                   </ul>
                                                </div>
                                             </p>
                                          </div>
                                          <div class="col-xs-12 col-md-4">
                                             <div class="row">
                                                <div class="col-xs-6 et-pad-right-reduce-7">
                                                   <a  href="#" class="btn et-btn-medic et-btn-medic-yes" data-current-target="et-medi-question-2" data-next-target="et-medi-question-3" title="Yes"  data-toggle="modal" data-target="#cannot-apply-modal" onclick="getCsChannel('ETMD2');"><fmt:message key="eliteTerms.selectPlan.Yes" bundle="${msg}" /></a>
                                                </div>
                                                <div class="col-xs-6 et-pad-left-reduce-7">
                                                   <a href="#" class="btn et-btn-medic et-btn-medic-no" title="No" data-current-target="et-medi-question-2" data-next-target="et-medi-question-3"><fmt:message key="eliteTerms.selectPlan.No" bundle="${msg}" /></a>
                                                </div>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                              
                              <div class="panel panel-default et-medic-panel">
                                 <div class="panel-heading" role="tab" id="et-medi-question-3-heading">
                                    <h4 class="panel-title">
                                       <a role="button" data-toggle="collapse" data-parent="#et-medic-accordion" href="#et-medi-question-3" aria-expanded="false" aria-controls="et-medi-question-3">
                                          <fmt:message key="eliteTerms.selectPlan.Question3" bundle="${msg}" />
                                       </a>
                                    </h4>
                                 </div>
                                 <div id="et-medi-question-3" class="panel-collapse collapse et-collapse" role="tabpanel" data-next-target="" data-prev-target="et-medi-question-2" data-is-answered="false" aria-labelledby="et-medi-question-3-heading">
                                    <div class="panel-body">
                                       <div class="row">
                                          <div class="col-xs-12 col-md-8">
                                             <p><fmt:message key="eliteTerms.selectPlan.Question3.copy" bundle="${msg}" /></p>
                                          </div>
                                          <div class="col-xs-12 col-md-4">
                                             <div class="row">
                                                <div class="col-xs-6 et-pad-right-reduce-7">
                                                   <a  href="#" class="btn et-btn-medic et-btn-medic-yes" data-current-target="et-medi-question-3" data-next-target="" title="Yes"  data-toggle="modal" data-target="#cannot-apply-modal" onclick="getCsChannel('ETMD3');"><fmt:message key="eliteTerms.selectPlan.Yes" bundle="${msg}" /></a>
                                                </div>
                                                <div class="col-xs-6 et-pad-left-reduce-7">
                                                   <a href="#" class="btn et-btn-medic et-btn-medic-no last" title="No" data-current-target="et-medi-question-3" data-next-target=""><fmt:message key="eliteTerms.selectPlan.No" bundle="${msg}" /></a>
                                                </div>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                              
                           </div>
                           
                           <div class="et-medical-next-brn next-btn">
                              <button id="et-medical-dec-next" type="submit" class="btn next pi et-medic-next hide-element"><fmt:message key="eliteTerms.selectPlan.Next" bundle="${msg}" /></button>
                           </div>
                        
                        </div>
                     </div>
                  </div>
               </div>
               
               <div id="et-application-info-section" class="hide-element">
                  <div class="page-divider"></div>
                  
                  <!--Personal Info Widget-->
                  <div class="container-fluid fwd-container">
                     <div id="personal-info" class="personal-info-widget page-application et-application-page">
                        <h2><fmt:message key="eliteTerms.selectPlan.person.info" bundle="${msg}" />
                           <!-- <button type="button" class="tooltip-button btn-app-info-tooltip"  data-container="body" data-toggle="tooltip" data-placement="top" title="Applicant and the insured must be the same person" data-template= 	'<div class="tooltip et-app-info-tooltip" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>'><span class="info-tooltip"></span></button> -->
                           <button type="button" class="tooltip-button btn-app-info-tooltip" title="<fmt:message key="eliteTerms.selectPlan.Applicant.and.the.insured" bundle="${msg}" />" ><span class="info-tooltip"></span></button>
                        </h2>
                        
                        <form id="eliteTermsInsuredInfoForm" method="post" class="form-horizontal" action="" onSubmit="return false;">
                           <div class="row margin">
                              <div class="col-sm-12 col-md-6 left">
                                 
                                 <div class="clearfix">
                                    <div class="left-desktop description">
                                       <label for="give-last-name" class="application-page-input-text et-input-label"><fmt:message key="eliteTerms.selectPlan.Name.in.English" bundle="${msg}" /> <span class="hidden-xs hidden-sm"><fmt:message key="eliteTerms.selectPlan.Same.as.HKID" bundle="${msg}" /></span></label>
                                    </div>
                                    <div class="left-desktop text-box form-group">
                                       <input class="form-control gray-textbox" autocomplete="off" id="savieApplicantBean.firstName" name="savieApplicantBean.firstName" type="text" placeholder="<fmt:message key="eliteTerms.selectPlan.Given.Name" bundle="${msg}" />" value="${userDetails.firstName }">
                                       <span class="error-msg" id="savieApplicantBeanFirstNameMsg"><small class="help-block hide-element"><fmt:message key="eliteTerms.selectPlan.English.first.name" bundle="${msg}" /></small></span>
                                       <input class="form-control gray-textbox" autocomplete="off" id="savieApplicantBean.lastName" name="savieApplicantBean.lastName" type="text" placeholder="<fmt:message key="eliteTerms.selectPlan.Last.Name" bundle="${msg}" />" value="${userDetails.lastName }">
                                       <span class="error-msg" id="savieApplicantBeanlastNameMsg"><small class="help-block hide-element"><fmt:message key="eliteTerms.selectPlan.English.last.name" bundle="${msg}" /></small></span>
                                    </div>
                                 </div>
                                 
                                 <div class="clearfix">
                                    <div class="left-desktop description">
                                       <label for="savieApplicantBean.chineseName" class="application-page-input-text et-input-label"><fmt:message key="eliteTerms.selectPlan.Name.in.Chinese" bundle="${msg}" /> <span class="hidden-xs hidden-sm"><fmt:message key="eliteTerms.selectPlan.Same.as.HKID" bundle="${msg}" /></span></label>
                                    </div>
                                    <div class="left-desktop text-box">
                                       <input class="form-control gray-textbox" autocomplete="off" id="savieApplicantBean.chineseName" name="savieApplicantBean.chineseName" type="text" placeholder="<fmt:message key="eliteTerms.selectPlan.Name.in.Chinese" bundle="${msg}" />" value="" >
                                       <span class="error-msg" id="savieApplicantBeanchineseNameMsg"><small class="help-block hide-element"><fmt:message key="eliteTerms.selectPlan.Chinese.name" bundle="${msg}" /></small></span>
                                    </div>
                                 </div>
                                 
                                 <div class="clearfix form-group">
                                    <div class="left-desktop description">
                                       <label for="sales-illu-dob" class="application-page-input-text et-input-label"><fmt:message key="eliteTerms.selectPlan.Date.of.birth" bundle="${msg}" /></label>
                                    </div>
                                    <div class="left-desktop text-box et-date-info clearfix">
                                    	<div class="clearfix">
	                                       <input type="text" class="form-control gray-textbox pull-left et-80-width" name="dob" id="sales-illu-dob" placeholder="<fmt:message key="eliteTerms.selectPlan.Date.of.birth.placeholder" bundle="${msg}" />" onfocusin="fnSetStyle()" readonly value="${etPolicyApplication.applicant.dobD }"  />
	                                       <div class="et-app-edit-wrapper">
	                                          <a href="#" title="Edit Date of birth" class="et-app-sum-edit et-app-edit" data-target="#et-about-yoursel-section">
	                                             <span class="text-center">
	                                                <fmt:message key="eliteTerms.selectPlan.Edit" bundle="${msg}" />
	                                             </span>
	                                          </a>
	                                       </div>
	                                    </div>
                                       <span class="error-msg" id="sales-illu-dob-msg"></span>
                                    </div>
                                 </div>
                                 
                                 <div class="clearfix">
                                    <div class="left-desktop description">
                                       <label for="savieApplicantBean.gender" class="application-page-input-text et-input-label"><fmt:message key="eliteTerms.selectPlan.Gender" bundle="${msg}" /></label>
                                    </div>
                                    <div class="left-desktop text-box et-date-info clearfix">
                                       <input type="hidden" name="savieApplicantBeanSmoke" id="savieApplicantBeanSmoke" value="${etPolicyApplication.applicant.smoke }"  />
                                       <input type="hidden" name="savieApplicantBeanGender" id="savieApplicantBeanGender" value="${etPolicyApplication.applicant.gender }"  />
                                       <input type="text" class="form-control gray-textbox pull-left et-80-width" name="savieApplicantBean.gender" id="savieApplicantBean.gender" placeholder="<fmt:message key="eliteTerms.selectPlan.Gender" bundle="${msg}" />" readonly value="${etPolicyApplication.applicant.gender == 'M' ? 'Male':'Female' }"  />
                                        <div class="et-app-edit-wrapper">
                                          <a href="#" title="Edit Gender" class="et-app-sum-edit et-app-edit" data-target="#et-about-yoursel-section">
                                             <span class="text-center">
                                                <fmt:message key="eliteTerms.selectPlan.Edit" bundle="${msg}" />
                                             </span>
                                          </a>
                                        </div>
                                    </div>
                                 </div>
                                 
                                 <div class="clearfix form-group has-error">
                                    <div class="left-desktop description">
                                       <label for="savieApplicantBean.hkId" class="application-page-input-text et-input-label"><fmt:message key="eliteTerms.selectPlan.HKID" bundle="${msg}" /></label>
                                    </div>
                                    <div class="left-desktop text-box">
                                       <input class="form-control gray-textbox capitalize" autocomplete="off" id="savieApplicantBean.hkId" name="savieApplicantBean.hkId" type="text" placeholder="<fmt:message key="eliteTerms.selectPlan.HKID.placeholder" bundle="${msg}" />" >
                                       <span class="error-msg" id="hkidMessage"></span>
                                    </div>
                                 </div>
                                 
                                 <div class="clearfix  form-group has-error">
                                    <div class="left-desktop description">
                                       <label for="savieApplicantBean.maritalStatus" class="application-page-input-text et-input-label"><fmt:message key="eliteTerms.selectPlan.Marital.status" bundle="${msg}" /></label>
                                    </div>
                                    <div class="left-desktop text-box">

                                       <div class="selectDiv">
                                          <span class="icon-chevron-thin-down orange-caret"></span>
                                          <select class="form-control gray-dropdown" name="savieApplicantBean.maritalStatus"  id="savieApplicantBean.maritalStatus">
                                             <option selected disabled value=""><fmt:message key="eliteTerms.selectPlan.Please.select" bundle="${msg}" /></option>
                                             <c:if test="${language == 'en'}">
													   <c:forEach var="list" items="${maritalStatusesEN}">
													      <option value="${list.itemCode }-${list.itemDesc }">${list.itemDesc }</option>
													   </c:forEach>
													</c:if>
													<c:if test="${language == 'tc'}">
													   <c:forEach var="list" items="${maritalStatusesCN}">
													      <option value="${list.itemCode }-${list.itemDesc }">${list.itemDesc }</option>
													   </c:forEach>
													</c:if>
                                          </select>
                                       </div>
                                       <span class="error-msg" id="maritalStatusMessage"></span>
                                    </div>
                                 </div>
                              
                                 <div class="clearfix form-group has-error">
                                    <div class="left-desktop description">
                                       <label for="savieApplicantBean.placeOfBirth" class="application-page-input-text et-input-label"><fmt:message key="eliteTerms.selectPlan.Place.of.birth" bundle="${msg}" /></label>
                                    </div>
                                    <div class="left-desktop text-box">
                                       <div class="selectDiv">
                                          <span class="icon-chevron-thin-down orange-caret"></span>
                                          <select class="form-control gray-dropdown" data-style="application-select selection" id="savieApplicantBean.placeOfBirth" name="savieApplicantBean.placeOfBirth">
                                             <option selected disabled value=""><fmt:message key="eliteTerms.selectPlan.Please.select" bundle="${msg}" /></option>
                                             <c:if test="${language == 'en'}">
													   <c:forEach var="list" items="${placeOfBirthEN}">
													      <option value="${list.itemCode }-${list.itemDesc }">${list.itemDesc }</option>
													   </c:forEach>
													</c:if>
													<c:if test="${language == 'tc'}">
													   <c:forEach var="list" items="${placeOfBirthCN}">
													      <option value="${list.itemCode }-${list.itemDesc }">${list.itemDesc }</option>
													   </c:forEach>
													</c:if>	
                                          </select>
                                       </div>
                                       <span class="error-msg" id="placeOfBirthMessage"></span>
                                    </div>
                                 </div>
                                 
                                 <div class="clearfix form-group has-error">
                                    <div class="left-desktop description">
                                       <label for="savieApplicantBean.nationality" class="application-page-input-text et-input-label"><fmt:message key="eliteTerms.selectPlan.Nationality" bundle="${msg}" /></label>
                                    </div>
                                    <div class="left-desktop text-box">
                                       <div class="selectDiv">
                                          <span class="icon-chevron-thin-down orange-caret"></span>
                                          <select class="form-control gray-dropdown"  data-style="application-select selection" id="savieApplicantBean.nationality" name="savieApplicantBean.nationality">
                                             <option selected disabled value=""><fmt:message key="eliteTerms.selectPlan.Please.select" bundle="${msg}" /></option>
                                             <c:if test="${language == 'en'}">
													   <c:forEach var="list" items="${nationalityEN}">
													      <option value="${list.itemCode }-${list.itemDesc }">${list.itemDesc }</option>
													   </c:forEach>
													</c:if>
													<c:if test="${language == 'tc'}">
													   <c:forEach var="list" items="${nationalityCN}">
													      <option value="${list.itemCode }-${list.itemDesc }">${list.itemDesc }</option>
													   </c:forEach>
													</c:if>	
                                          </select>
                                       </div>
                                       <span class="error-msg" id="nationalityMessage"></span>
                                    </div>
                                 </div>
                                 
                                 <div class="clearfix">
                                    <div class="left-desktop right-description">
                                       <label for="savieApplicantBean.residentialTelNo" class="application-page-input-text et-input-label"><fmt:message key="eliteTerms.selectPlan.Residential.tel.no" bundle="${msg}" /></label>
                                    </div>
                                    <div class="left-desktop text-box clearfix">
                                       <input type="text" class="form-control gray-textbox" name="savieApplicantBean.residentialTelNo" id="savieApplicantBean.residentialTelNo" placeholder="<fmt:message key="eliteTerms.selectPlan.Telephone.no." bundle="${msg}" />"/>
                                       <span class="error-msg" id="resTelMessage"></span>
                                    </div>
                                 </div>
                           
                                 <div class="clearfix form-group has-error">
                                    <div class="left-desktop right-description">
                                       <label for="savieApplicantBean.mobileNo" class="application-page-input-text et-input-label"><fmt:message key="eliteTerms.selectPlan.Mobile.no" bundle="${msg}" /></label>
                                    </div>
                                    <div class="left-desktop text-box clearfix">
                                       <input type="text" class="form-control gray-textbox" name="savieApplicantBean.mobileNo" id="savieApplicantBean.mobileNo" placeholder="<fmt:message key="eliteTerms.selectPlan.Mobile.no" bundle="${msg}" />" value="${userDetails.mobileNo }" />
                                       <span class="error-msg" id="mobileMessage"></span>
                                    </div>
                                 </div>
                                 
                                 <div class="clearfix form-group has-error hidden-xs hidden-sm">
                                    <div class="left-desktop right-description">
                                       <label for="savieApplicantBean.emailAddress" class="application-page-input-text et-input-label"><fmt:message key="eliteTerms.selectPlan.Email.address" bundle="${msg}" /></label>
                                    </div>
                                    <div class="left-desktop text-box">
                                       <input class="form-control gray-textbox" autocomplete="off" id="savieApplicantBean.emailAddress" name="savieApplicantBean.emailAddress" type="text" placeholder="<fmt:message key="eliteTerms.selectPlan.Email.address" bundle="${msg}" />" value="${userDetails.emailAddress }">
                                       <span class="error-msg" id="emailMessage"></span>
                                    </div>
                                 </div>
                              </div>
                              <div class="col-sm-12 col-md-6 right">
                                 <div class="clearfix form-group has-error">
                                    <div class="left-desktop right-description">
                                       <label for="inputdefault" class="application-page-input-text et-input-label"><fmt:message key="eliteTerms.selectPlan.Permanent.address" bundle="${msg}" /></label>
                                    </div>
                                    <div class="left-desktop text-box">
                                       <input class="form-control gray-textbox permanent-address" autocomplete="off" id="savieApplicantBean.permanentAddress1" name="savieApplicantBean.permanentAddress1" type="text" placeholder="<fmt:message key="eliteTerms.selectPlan.address.line1" bundle="${msg}" />">
                                       <span class="error-msg" id="permanentAddress1Message"></span>
                                       <input class="form-control gray-textbox permanent-address" autocomplete="off" id="savieApplicantBean.permanentAddress2" name="savieApplicantBean.permanentAddress2" type="text" placeholder="<fmt:message key="eliteTerms.selectPlan.address.line2" bundle="${msg}" />">
                                       <span class="error-msg" id="permanentAddress2Message"></span>
                                       <input class="form-control gray-textbox permanent-address" autocomplete="off" id="savieApplicantBean.permanentAddress3" name="savieApplicantBean.permanentAddress3" type="text" placeholder="<fmt:message key="eliteTerms.selectPlan.address.line3" bundle="${msg}" />">
                                       <span class="error-msg" id="permanentAddress3Message">
                                          <small class="help-block hide-element"><fmt:message key="eliteTerms.selectPlan.Must.enter" bundle="${msg}" /></small>
                                       </span>
                                       <!--  <div class="selectDiv">
                                          <span class="icon-chevron-thin-down orange-caret"></span>
                                          <select class="form-control gray-dropdown et-app-info-country"  data-style="application-select selection" name="savieApplicantBean.permanentAddressCountry" id="savieApplicantBean.permanentAddressCountry">
                                             <option selected disabled value="">Country</option>
                                             <option value="Hong Kong">Hong Kong</option>
                                             <option value="Australia">Australia</option>    
                                             <option value="Canada">Canada</option>    
                                             <option value="France">France</option>    
                                             <option value="Germany">Germany</option>
                                          </select>
                                       </div>
                                       <span class="error-msg" id="permanentAddressCountryMessage"></span>
									    -->
                                       <div class="selectDiv et-district-wrapper">
                                          <span class="icon-chevron-thin-down orange-caret"></span>
                                          <select class="form-control gray-dropdown "  data-style="application-select selection" name="savieApplicantBean.permanentAddress" id="savieApplicantBean.permanentAddress">
                                             <option value=""><fmt:message key="eliteTerms.selectPlan.Please.select" bundle="${msg}" /></option>
                                             <c:if test="${language == 'en'}">
													   <c:forEach var="list" items="${savieDistrictEN}">
													      <option value="${list.itemCode }-${list.itemDesc }">${list.itemDesc }</option>
													   </c:forEach>
													</c:if>
													<c:if test="${language == 'tc'}">
													   <c:forEach var="list" items="${savieDistrictCN}">
													      <option value="${list.itemCode }-${list.itemDesc }">${list.itemDesc }</option>
													   </c:forEach>
													</c:if>	
                                          </select>
                                       </div>
                                       <span class="error-msg" id="perAddressMessage"></span>
                                       <span class="warning-note"><span class="orange">*</span> <fmt:message key="eliteTerms.selectPlan.No.P.O.Box.address.allowed" bundle="${msg}" /></span>
                                    </div>
                                 </div>
                                 
                                 <!--start here --> 
                                 <div class="clearfix">
                                    <div class="left-desktop description">
                                       
                                    </div>
                                    <div class="left-desktop check-box">
                                       <div class="checkbox-section">
                                          <div class="clearfix">
                                             <div class="pull-left left-checkbox">
                                                <input type="checkbox" value="true" id="savieApplicantBean.isResidential" name="savieApplicantBean.isResidential" />
                                                <label for="savieApplicantBean.isResidential"></label>
                                             </div>
                                             <div class="pull-left right-checkbox">
                                                <span class="checkbox-text"><fmt:message key="eliteTerms.selectPlan.My.residential.address" bundle="${msg}" /></span>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                                 
                                 <div class="clearfix form-group has-error hidden et-residential-address" id= "residential-address">
                                    <div class="left-desktop right-description">
                                       <label for="inputdefault" class="application-page-input-text et-input-label"><fmt:message key="eliteTerms.selectPlan.Residential.address" bundle="${msg}" /></label>
                                    </div>
                                    <div class="left-desktop text-box">
                                       <input class="form-control gray-textbox residential residential-address" autocomplete="off" id="savieApplicantBean.residentialAdress1" name="savieApplicantBean.residentialAdress1" type="text" placeholder="<fmt:message key="eliteTerms.selectPlan.address.line1" bundle="${msg}" />">
                                       <span class="error-msg" id="residentialAddressMessage1"></span>
                                       <input class="form-control gray-textbox residential residential-address" autocomplete="off" id="savieApplicantBean.residentialAdress2" name="savieApplicantBean.residentialAdress2" type="text" placeholder="<fmt:message key="eliteTerms.selectPlan.address.line2" bundle="${msg}" />">
                                       <span class="error-msg" id="residentialAddressMessage2"></span>
                                       <input class="form-control gray-textbox residential residential-address" autocomplete="off" id="savieApplicantBean.residentialAdress3" name="savieApplicantBean.residentialAdress3" type="text" placeholder="<fmt:message key="eliteTerms.selectPlan.address.line3" bundle="${msg}" />">
                                       <span class="error-msg" id="residentialAddressMessage3">
                                          <small class="help-block hide-element"><fmt:message key="eliteTerms.selectPlan.Must.enter" bundle="${msg}" /></small>
                                       </span>
                                       <!-- <div class="selectDiv">
                                          <span class="icon-chevron-thin-down orange-caret"></span>
                                          <select class="form-control gray-dropdown et-app-info-country"  data-style="application-select selection" name="savieApplicantBean.residentialDistrictCountry" id="savieApplicantBean.residentialDistrictCountry">
                                             <option selected disabled value="">Country</option>
                                             <option value="Hong Kong">Hong Kong</option>
                                             <option value="Australia">Australia</option>    
                                             <option value="Canada">Canada</option>    
                                             <option value="France">France</option>    
                                             <option value="Germany">Germany</option>    
                                          </select>
                                       </div> 
                                       <span class="error-msg" id="residentialDistrictCountryMessage"></span> -->
                                       <div class="selectDiv et-district-wrapper">
                                          <span class="icon-chevron-thin-down orange-caret"></span>
                                          <select class="form-control gray-dropdown"  data-style="application-select selection" name="savieApplicantBean.residentialDistrict" id="savieApplicantBean.residentialDistrict">
                                             <option value=""><fmt:message key="eliteTerms.selectPlan.Please.select" bundle="${msg}" /></option>
                                             <c:if test="${language == 'en'}">
													   <c:forEach var="list" items="${savieDistrictEN}">
													      <option value="${list.itemCode }-${list.itemDesc }">${list.itemDesc }</option>
													   </c:forEach>
													</c:if>
													<c:if test="${language == 'tc'}">
													   <c:forEach var="list" items="${savieDistrictCN}">
													      <option value="${list.itemCode }-${list.itemDesc }">${list.itemDesc }</option>
													   </c:forEach>
													</c:if>	  	
                                          </select>
                                       </div>
                                       <span class="error-msg" id="resDistrictMessage"></span>
                                       <span class="warning-note"><span class="orange">*</span> <fmt:message key="eliteTerms.selectPlan.No.P.O.Box.address.allowed" bundle="${msg}" /></span>
                                    </div>
                                 </div>
                                 
                                 <div class="clearfix">
                                    <div class="left-desktop description">
                                       
                                    </div>
                                    <div class="left-desktop check-box">
                                       <div class="checkbox-section">
                                          <div class="clearfix">
                                             <div class="pull-left left-checkbox">
                                                <input type="checkbox" value="true" id="savieApplicantBean.addressIsSame" name="savieApplicantBean.addressIsSame" />
                                                <label for="savieApplicantBean.addressIsSame"></label>
                                             </div>
                                             <div class="pull-left right-checkbox">
                                                <span class="checkbox-text"><fmt:message key="eliteTerms.selectPlan.My.correspondence.address" bundle="${msg}" /></span>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                                 
                                 <div class="clearfix form-group has-error hidden et-correspondence-address" id="correspondence-address">
                                    <div class="left-desktop right-description">
                                       <label for="inputdefault" class="application-page-input-text et-input-label"><fmt:message key="eliteTerms.selectPlan.Correspondence.address" bundle="${msg}" /></label>
                                    </div>
                                    <div class="left-desktop text-box">
                                       <input class="form-control gray-textbox  correspondence-address" autocomplete="off" id="savieApplicantBean.correspondenceAdress1" name="savieApplicantBean.correspondenceAdress1" type="text" placeholder="<fmt:message key="eliteTerms.selectPlan.address.line1" bundle="${msg}" />">
                                       <span class="error-msg" id="corrAddressMessage1"></span>
                                       <input class="form-control gray-textbox correspondence-address" autocomplete="off" id="savieApplicantBean.correspondenceAdress2" name="savieApplicantBean.correspondenceAdress2" type="text" placeholder="<fmt:message key="eliteTerms.selectPlan.address.line2" bundle="${msg}" />">
                                       <span class="error-msg" id="corrAddressMessage2"></span>
                                       <input class="form-control gray-textbox correspondence-address" autocomplete="off" id="savieApplicantBean.correspondenceAdress3" name="savieApplicantBean.correspondenceAdress3" type="text" placeholder="<fmt:message key="eliteTerms.selectPlan.address.line3" bundle="${msg}" />">
                                       <span class="error-msg" id="corrAddressMessage3">
                                          <small  class="help-block hide-element"><fmt:message key="eliteTerms.selectPlan.Must.enter" bundle="${msg}" /></small>
                                       </span>
                                       <!-- <div class="selectDiv">
                                          <span class="icon-chevron-thin-down orange-caret"></span>
                                          <select class="form-control gray-dropdown et-app-info-country"  data-style="application-select selection" name="savieApplicantBean.correspondenceDistrictCountry" id="savieApplicantBean.correspondenceDistrictCountry">
                                             <option selected disabled value="">Country</option>
                                             <option value="Hong Kong">Hong Kong</option>
                                             <option value="Australia">Australia</option>    
                                             <option value="Canada">Canada</option>    
                                             <option value="France">France</option>    
                                             <option value="Germany">Germany</option>    
                                          </select>
                                       </div>
                                       <span class="error-msg" id="correspondenceCountryMessage"></span> -->
                                       <div class="selectDiv et-district-wrapper">
                                          <span class="icon-chevron-thin-down orange-caret"></span>
                                          <select class="form-control gray-dropdown"  data-style="application-select selection" name="savieApplicantBean.correspondenceDistrict" id="savieApplicantBean.correspondenceDistrict">
                                             <option value=""><fmt:message key="eliteTerms.selectPlan.Please.select" bundle="${msg}" /></option>
                                             <c:if test="${language == 'en'}">
													   <c:forEach var="list" items="${savieDistrictEN}">
													      <option value="${list.itemCode }-${list.itemDesc }">${list.itemDesc }</option>
													   </c:forEach>
													</c:if>
													<c:if test="${language == 'tc'}">
													   <c:forEach var="list" items="${savieDistrictCN}">
													      <option value="${list.itemCode }-${list.itemDesc }">${list.itemDesc }</option>
													   </c:forEach>
													</c:if>	
                                          </select>
                                       </div>
                                       <span class="error-msg" id="correspondenceDistrictMessage"></span>
                                       <span class="warning-note"><span class="orange">*</span> <fmt:message key="eliteTerms.selectPlan.No.P.O.Box.address.allowed" bundle="${msg}" /></span>
                                    </div>
                                 </div>
                                 
                              </div>		
                           </div>
                           <div class="next-btn">
                              <button id="et-personal-info-next" class="btn next pi"><fmt:message key="eliteTerms.selectPlan.Next" bundle="${msg}" /></button>
                           </div>
                        </form>
                     </div>
                  </div>
                  
                  <!--EMPLOYEMENT INFO SECTION-->
                  <div id="et-employment-info-section" class="hide-element">
                     <div class="page-divider"></div>
                     
                     <!--Employement Info Widget-->
                     <div id="employment-info" class="page-application container-fluid fwd-container et-employement-info">
                        <h2 class="text-center"><fmt:message key="eliteTerms.selectPlan.Employment.Info" bundle="${msg}" /></h2>
                        <form class="content"  id="etEmploymentInfoForm" method="post" action="" onsubmit="return false">
                           <div class="content-left">
                              <div class="clearfix form-group has-error employment-info-row">
                                 <label for="savieEmploymentBean.employmentStatus"><fmt:message key="eliteTerms.selectPlan.Employment.status" bundle="${msg}" /></label>
                                 <div class="selectEmployment">
                                    <span class="icon-chevron-thin-down orange-caret"></span>
                                    <select class="form-control gray-dropdown" id="savieEmploymentBean.employmentStatus" name="savieEmploymentBean.employmentStatus" data-style="application-select">
                                       <option value=""><fmt:message key="eliteTerms.selectPlan.Please.select" bundle="${msg}" /></option>
                                       <c:if test="${language == 'en'}">
                                 <c:forEach var="list" items="${employmentStatusEN}">
                                    <option value="${list.itemCode }-${list.itemDesc }">${list.itemDesc }</option>
                                 </c:forEach>
                              </c:if>
                              <c:if test="${language == 'tc'}">
                                 <c:forEach var="list" items="${employmentStatusCN}">
                                    <option value="${list.itemCode }-${list.itemDesc }">${list.itemDesc }</option>
                                 </c:forEach>
                              </c:if>  
                                    </select>
                                 </div>
                                 <span class="error-msg" id="employmentStatusMessage"></span>
                              </div>
                              <div class="clearfix form-group has-error employment-info-row et-emp-info-nat-business-container">
                                  <label for="savieEmploymentBean.natureOfBusiness"><fmt:message key="eliteTerms.selectPlan.Nature.of.business" bundle="${msg}" /></label>
                                 <div class="selectEmployment">
                                    <span class="icon-chevron-thin-down orange-caret"></span>
                                    <select class="form-control gray-dropdown" id="savieEmploymentBean.natureOfBusiness" name="savieEmploymentBean.natureOfBusiness" data-style="application-select" onclick="getOccupation(this.value,'${language }');">
                                       <option value=""><fmt:message key="eliteTerms.selectPlan.Please.select" bundle="${msg}" /></option>
                                       <c:if test="${language == 'en'}">
                                 <c:forEach var="list" items="${natureOfBusinessEN}">
                                   <option value="${list.itemCode }-${list.itemDesc }">${list.itemDesc }</option>
                                 </c:forEach>
                              </c:if>
                              <c:if test="${language == 'tc'}">
                                 <c:forEach var="list" items="${natureOfBusinessCN}">
                                   <option value="${list.itemCode }-${list.itemDesc }">${list.itemDesc }</option>
                                 </c:forEach>
                              </c:if>  
                                    </select>
                                 </div>
                                 <span class="error-msg" id="natureOfBusinessMessage"></span>
                              </div>
                              <div class="clearfix form-group has-error employment-info-row et-emp-info-occupation-container">
                                 <label for="savieEmploymentBean.occupation"><fmt:message key="eliteTerms.selectPlan.Occupation" bundle="${msg}" /></label>
                                 <div class="selectEmployment">
                                    <span class="icon-chevron-thin-down orange-caret"></span>
                                       <select class="form-control gray-dropdown" id="savieEmploymentBean.occupation" name="savieEmploymentBean.occupation" data-style="application-select">
                                           <option value=""><fmt:message key="eliteTerms.selectPlan.Please.select" bundle="${msg}" /></option>
                                           <c:if test="${language == 'en'}">
                                                <c:forEach var="list" items="${occupationEN}">
                                                  <option value="${list.itemCode }-${list.itemDesc }">${list.itemDesc }</option>
                                                </c:forEach>
                                            </c:if>
                                            <c:if test="${language == 'tc'}">
                                                <c:forEach var="list" items="${occupationCN}">
                                                  <option value="${list.itemCode }-${list.itemDesc }">${list.itemDesc }</option>
                                                </c:forEach>
                                            </c:if>   
                                        </select>
                                 </div>
                                 <span class="error-msg" id="occupationMessage"></span>
                              </div>

                              <div class="clearfix form-group has-error employment-info-row et-emp-info-sourceOfIncome-container hidden">
                                 <label for="savieEmploymentBean.sourceOfIncome"><fmt:message key="eliteTerms.selectPlan.Other.Source.Of.Income" bundle="${msg}" /></label>
                                 <div class="selectEmployment">
                                    <span class="icon-chevron-thin-down orange-caret"></span>
                                    <select class="form-control gray-dropdown" id="savieEmploymentBean.sourceOfIncome" name="savieEmploymentBean.sourceOfIncome" data-style="application-select">
                                       <option value=""><fmt:message key="eliteTerms.selectPlan.Please.select" bundle="${msg}" /></option>
                                           <c:if test="${language == 'en'}">
                                                <c:forEach var="list" items="${etAmountOtherSourceEN}">
                                                  <option value="${list.itemCode }-${list.itemDesc }">${list.itemDesc }</option>
                                                </c:forEach>
                                            </c:if>
                                            <c:if test="${language == 'tc'}">
                                                <c:forEach var="list" items="${etAmountOtherSourceCN}">
                                                  <option value="${list.itemCode }-${list.itemDesc }">${list.itemDesc }</option>
                                                </c:forEach>
                                            </c:if>     
                                    </select>
                                 </div>
                                 <span class="error-msg" id="sourceOfIncome"></span>
                              </div>

                              <div class="clearfix form-group has-error employment-info-row et-emp-info-liq-assets-container hidden">
                                 <label for="savieEmploymentBean.liquidAssets"><fmt:message key="eliteTerms.selectPlan.Liquid.assets" bundle="${msg}" /></label>
                                 <div class="selectEmployment">
                                    <span class="icon-chevron-thin-down orange-caret"></span>
                                    <select class="form-control gray-dropdown" id="savieEmploymentBean.liquidAssets" name="savieEmploymentBean.liquidAssets" data-style="application-select">
                                       <option value=""><fmt:message key="eliteTerms.selectPlan.Please.select" bundle="${msg}" /></option>
                                           <c:if test="${language == 'en'}">
                                                <c:forEach var="list" items="${etLiquidAssetEN}">
                                                  <option value="${list.itemCode }-${list.itemDesc }">${list.itemDesc }</option>
                                                </c:forEach>
                                            </c:if>
                                            <c:if test="${language == 'tc'}">
                                                <c:forEach var="list" items="${etLiquidAssetCN}">
                                                  <option value="${list.itemCode }-${list.itemDesc }">${list.itemDesc }</option>
                                                </c:forEach>
                                            </c:if> 
                                    </select>
                                 </div>
                                 <span class="error-msg" id="liquidAssets"></span>
                              </div>
                           </div>
                           <div class="content-right">
                              <div class="clearfix form-group has-error employment-info-row et-emp-info-employer-name-container">
                                 <label for="savieEmploymentBean.monthlyPersonalIncome" class="monthly-income"><fmt:message key="eliteTerms.selectPlan.Current.Employer.Name" bundle="${msg}" /></label>
                                 <div class="selectEmployment">
                                    <input type="text" class="form-control gray-textbox" id="savieEmploymentBean.currentEmployerName" name="savieEmploymentBean.currentEmployerName">
                                 </div>
                                 <span class="error-msg" id="employerNameMessage"></span>
                              </div>
                              <div class="clearfix form-group has-error employment-info-row et-emp-info-mon-income-container">
                                 <label for="savieEmploymentBean.monthlyPersonalIncome" class="monthly-income"><fmt:message key="eliteTerms.selectPlan.Monthly.personal.income" bundle="${msg}" /></label>
                                 <div class="selectEmployment">
                                    <span class="icon-chevron-thin-down orange-caret"></span>
                                    <select class="form-control gray-dropdown" id="savieEmploymentBean.monthlyPersonalIncome" name="savieEmploymentBean.monthlyPersonalIncome" data-style="application-select">
                                       <option value=""><fmt:message key="eliteTerms.selectPlan.Please.select" bundle="${msg}" /></option>
                                       <c:if test="${language == 'en'}">
                                 <c:forEach var="list" items="${monthlyPersonalIncomeEN}">
                                   <option value="${list.itemCode }-${list.itemDesc }">${list.itemDesc }</option>
                                 </c:forEach>
                              </c:if>
                              <c:if test="${language == 'tc'}">
                                 <c:forEach var="list" items="${monthlyPersonalIncomeCN}">
                                   <option value="${list.itemCode }-${list.itemDesc }">${list.itemDesc }</option>
                                 </c:forEach>
                              </c:if>
                                    </select>
                                 </div>
                                 <span class="error-msg" id="monthlyIncomeMessage"></span>
                              </div>
                              <div class="clearfix form-group has-error employment-info-row">
                                 <label for="savieEmploymentBean.educationLevel"><fmt:message key="eliteTerms.selectPlan.Education.level" bundle="${msg}" /></label>
                                 <div class="selectEmployment">
                                    <span class="icon-chevron-thin-down orange-caret"></span>
                                    <select class="form-control gray-dropdown" id="savieEmploymentBean.educationLevel" name="savieEmploymentBean.educationLevel" data-style="application-select">
                                       <option value=""><fmt:message key="eliteTerms.selectPlan.Please.select" bundle="${msg}" /></option>
                                           <c:if test="${language == 'en'}">
                                                <c:forEach var="list" items="${etEducationLevelEN}">
                                                  <option value="${list.itemCode }-${list.itemDesc }">${list.itemDesc }</option>
                                                </c:forEach>
                                            </c:if>
                                            <c:if test="${language == 'tc'}">
                                                <c:forEach var="list" items="${etEducationLevelCN}">
                                                  <option value="${list.itemCode }-${list.itemDesc }">${list.itemDesc }</option>
                                                </c:forEach>
                                            </c:if> 
                                    </select>
                                 </div>
                                 <span class="error-msg" id="educationLevelMessage"></span>
                              </div>
                           </div>
                           <div class="button-row text-center">
                                 <button id="et-employment-info-next" type="submit" class="next"><fmt:message key="eliteTerms.selectPlan.Next" bundle="${msg}" /></button>
                           </div>
                        </form>
                     </div>   
                  </div><!--END OF EMPLOYEMENT INFO SECTION-->
                  
                  <!--BENEFICIARIES INFO SECTION-->
                  <div id="et-beneficiary-info-section" class="hide-element">
                     <div class="page-divider"></div>
                     
                     <!--Beneficiary info Widget-->
                     <div id="beneficiary-info" class="page-application container-fluid fwd-container et-beneficiaries-section">
                        <div class="beneficiary-info-header">
                           <h2 class="text-center"><fmt:message key="eliteTerms.selectPlan.Beneficiary.info" bundle="${msg}" /> <button type="button" class="tooltip-button btn-beneficiary-tooltip" title="<fmt:message key="eliteTerms.selectPlan.Beneficiary.info" bundle="${msg}" />"><span class="info-tooltip"></span></button></h2>
                           <h4 class="text-center"><fmt:message key="eliteTerms.selectPlan.You.can.add.up" bundle="${msg}" /></h4>
                        </div>
                           <div class="row clearfix">
                              <form class="content" id="beneficiaryInfoForm[0]" method="post" action="" onsubmit="return false">
                           
                              <div class="col-md-4 first-row">
                                 <div class="beneficiary-info-row">
                                    <div class="clearfix upper-radio-buttons">
                                       <div class="left-desktop">
                                          <label class="own-estate-radio" for="own-estate-now">
                                          <input type="radio" id="own-estate-now" name="beneficiary-info" value="own-estate-now" >
                                          <span class="own-estate-text">
                                             <span class="text"><fmt:message key="eliteTerms.selectPlan.Own.Estate" bundle="${msg}" /></span>
                                          </span>
                                          </label>
                                          <span class="description">
                                             <fmt:message key="eliteTerms.selectPlan.Own.Estate" bundle="${msg}" />
                                          </span>
                                       </div>
                                       <div class="left-desktop">
                                          <label class="name-others-radio" for="name-others-now">
                                          <input type="radio" id="name-others-now" name="beneficiary-info" value="name-others-now" checked>
                                          <span class="name-others-text">
                                             <span class="text"><fmt:message key="eliteTerms.selectPlan.Name.Others" bundle="${msg}" /></span>
                                          </span>
                                          </label>
                                          <span class="description">
                                             <fmt:message key="eliteTerms.selectPlan.Name.Others" bundle="${msg}" />
                                          </span>
                                       </div>
                                    </div>
                                 </div>
                                 <div id="beneficiary-contents" class="">
                                    <h3 class="mobile-desc hidden-md hidden-lg"><fmt:message key="eliteTerms.selectPlan.Beneficiary" bundle="${msg}" /> <span><fmt:message key="eliteTerms.selectPlan.Person1" bundle="${msg}" /></span></h3>
                                    <div class="form-group has-error beneficiary-info-row">
                                       <label for="savieBeneficiaryBean[0].firstName"><fmt:message key="eliteTerms.selectPlan.Name.in.English" bundle="${msg}" /></label>
                                       <input type="text" autocomplete="off" id="savieBeneficiaryBean[0].fullName" hidden>
                                       <input type="text" id="savieBeneficiaryBean[0].firstName" name="savieBeneficiaryBean[0].firstName" onchange="getBeneficiaryFullName0()" class="form-control gray-textbox form-textbox" placeholder="<fmt:message key="eliteTerms.selectPlan.Given.Name" bundle="${msg}" />" maxlength="25">
                                       <span class="error-msg" autocomplete="off"id="beneficiaryFnameMessage[0]"></span>
                                       <input type="text" id="savieBeneficiaryBean[0].lastName" name="savieBeneficiaryBean[0].lastName" onchange="getBeneficiaryFullName0()" class="form-control gray-textbox" placeholder="<fmt:message key="eliteTerms.selectPlan.Last.Name" bundle="${msg}" />" maxlength="25">
                                       <span class="error-msg" id="beneficiaryLnameMessage[0]"></span>
                                       <span class="dup-error-msg hidden" id="duplicate-english-name[0]"><fmt:message key="eliteTerms.selectPlan.Duplicate.English.Name" bundle="${msg}" /></span>
                                    </div>
                                    <div class="form-group has-error beneficiary-info-row">
                                       <label for="savieBeneficiaryBean[0].chineseName"><fmt:message key="eliteTerms.selectPlan.Name.in.Chinese" bundle="${msg}" /> <span class="optional"><fmt:message key="eliteTerms.selectPlan.optional" bundle="${msg}" /></span></label>
                                       <input type="text" autocomplete="off" id="savieBeneficiaryBean[0].chineseName" name="savieBeneficiaryBean[0].chineseName" class="form-control gray-textbox form-textbox" placeholder="<fmt:message key="eliteTerms.selectPlan.Name.in.Chinese" bundle="${msg}" />">
                                       <span class="error-msg" id="beneficiaryChineseNameMessage[0]"></span>
                                       <span class="dup-error-msg hidden" id="duplicate-chinese-name[0]"><fmt:message key="eliteTerms.selectPlan.Duplicate.Chinese.Name" bundle="${msg}" /></span>
                                    </div>
                                    <div class="form-group beneficiary-info-row">
                                       <label for="savieBeneficiaryBean[0].hkId"><fmt:message key="eliteTerms.selectPlan.HKID.Passport.No" bundle="${msg}" /></label>
                                       <div class="clearfix et-hkid-pass">
                                          <div class="pull-left select">
                                             <div class="selectDiv">
                                                <span class="icon-chevron-thin-down orange-caret"></span>
                                                <select class="form-control gray-dropdown" id="beneficiaryHkidPassport[0]">
                                                   <option selected value="HKID"><fmt:message key="eliteTerms.selectPlan.HKID" bundle="${msg}" /></option>
                                                   <option value="Passport"><fmt:message key="eliteTerms.selectPlan.Passport.No" bundle="${msg}" /></option>	
                                                </select>
                                             </div>
                                          </div>
                                          <div class="pull-left input">
                                             <input class="form-control gray-textbox capitalize" type="text" autocomplete="off" placeholder="<fmt:message key="eliteTerms.selectPlan.HKID/Passport.No" bundle="${msg}" />" id="savieBeneficiaryBean[0].hkId" name="savieBeneficiaryBean[0].hkId" value="">
                                             <input class="form-control gray-textbox hidden" type="text" autocomplete="off" placeholder="HKID/Passport No" id="savieBeneficiaryBean[0].passportNo" name="savieBeneficiaryBean[0].passportNo" value="">
                                          </div>
                                       </div>
                                       <span class="error-msg" id="bnfPassportMessage[0]"></span>
                                       <span class="error-msg" id="hkidOrPassportMessage[0]"></span>
                                       <span class="dup-error-msg hidden" id="duplicate-beneficiaries[0]"><fmt:message key="eliteTerms.selectPlan.Duplicate.Beneficiaries.HKID" bundle="${msg}" /></span>
                                       <span class="dup-error-msg hidden" id="duplicate-beneficiariesPAssport[0]"><fmt:message key="eliteTerms.selectPlan.Duplicate.Beneficiaries.Passport" bundle="${msg}" /></span>
                                    </div>
                                    
                                    <div class="beneficiary-info-row">
                                       <label for="savieBeneficiaryBean[0].gender"><fmt:message key="eliteTerms.selectPlan.Gender" bundle="${msg}" /></label>
                                       <div id="gender-0" class="clearfix radio-buttons">
                                          <input type="radio" name="savieBeneficiaryBean[0].gender" value="M" id="male-0" checked>
                                          <label for="male-0" class="male-0" >
                                             <span class="hidden-lg hidden-md"><fmt:message key="eliteTerms.selectPlan.Male" bundle="${msg}" /></span>
                                             <span class="orange-hover hidden-xs hidden-sm pull-left"></span>
                                          </label>
                                          <span id="male-label-0" class="pull-left second-label hidden-xs hidden-sm"><fmt:message key="eliteTerms.selectPlan.Male" bundle="${msg}" /></span>

                                          <input type="radio" name="savieBeneficiaryBean[0].gender" value="F" id="female-0">
                                          <label for="female-0" class="female">
                                             <span class="hidden-lg hidden-md"><fmt:message key="eliteTerms.selectPlan.Female" bundle="${msg}" /></span>
                                             <span class="orange-hover hidden-xs hidden-sm pull-left"></span>
                                          </label>
                                          <span id="female-label-0" class="pull-left second-label-female hidden-xs hidden-sm"><fmt:message key="eliteTerms.selectPlan.Female" bundle="${msg}" /></span>
                                       </div>
                                    </div>
                                    <div class="form-group has-error beneficiary-info-row relationship">
                                       <label for="savieBeneficiaryBean[0].relationship"><fmt:message key="eliteTerms.selectPlan.Relationship" bundle="${msg}" /></label>
                                       <div class="selectBeneficiary">
                                          <span class="icon-chevron-thin-down orange-caret"></span>
                                          <select class="form-control gray-dropdown"  id="savieBeneficiaryBean[0].relationship" name="savieBeneficiaryBean[0].relationship" data-style="application-select">
                                             <option value=""><fmt:message key="eliteTerms.selectPlan.Please.select" bundle="${msg}" /></option>
                                             <c:if test="${language == 'en'}">
													<c:forEach var="list" items="${savieBeneficiaryRelationshipEN}">
													  <option value="${list.itemCode }-${list.itemDesc }">${list.itemDesc }</option>
													</c:forEach>
												</c:if>
												<c:if test="${language == 'tc'}">
													<c:forEach var="list" items="${savieBeneficiaryRelationshipCN}">
													  <option value="${list.itemCode }-${list.itemDesc }">${list.itemDesc }</option>
													</c:forEach>
												</c:if>	
                                          </select>
                                       </div>
                                       <span class="error-msg" id="relationshipMessage[0]"></span>
                                    </div>
                                    <div class="form-group has-error beneficiary-info-row entitle">
                                       <label for="savieBeneficiaryBean[0].entitlement"><fmt:message key="eliteTerms.selectPlan.Entitlement" bundle="${msg}" /></label>
                                       <input type="number" id="savieBeneficiaryBean[0].entitlement" name="savieBeneficiaryBean[0].entitlement" class="form-control gray-textbox percentage" placeholder="--" value="100" min="0" />
                                       <span class="error-msg" id="entitlementMessage[0]"></span>
                                    </div>		                
                                 </div>
                              </div>
                              </form>
                              
                              
                              <div id="add-beneficiary-1" class="col-md-4">
                                 <div class="add-beneficiary" id="beneficiary1">
                                    <button id="add-beneficiary-button-2" value="1" class="circle" type="button"><img src="<%=request.getContextPath()%>/resources/images/elite-terms/orange-plus.png"></button>
                                    <div class="add-beneficiary-text"><h4><fmt:message key="eliteTerms.selectPlan.Add.beneficiary" bundle="${msg}" /></h4></div>
                                 </div>
                              </div>

                              <div id="add-beneficiary-2" class="col-md-4 last-row">  
                                 <div class="add-beneficiary" id="beneficiary2">
                                    <button id="add-beneficiary-button-3" value="2" class="circle" type="button"><img src="<%=request.getContextPath()%>/resources/images/elite-terms/orange-plus.png"></button>
                                    <div class="add-beneficiary-text"><h4><fmt:message key="eliteTerms.selectPlan.Add.beneficiary" bundle="${msg}" /></h4></div>
                                 </div>
                              </div>
                           </div>
                           <div class="button-row text-center btn-beneficiary">
                              <button id="et-beneficiary-info-next" type="button" class="next"><fmt:message key="eliteTerms.selectPlan.Next" bundle="${msg}" /></button><!--Bind a click event temporarily to show the hidden Declaration & authorization section-->
                           </div>              
                     </div>
                  </div> <!--END OF BENEFICIARIES INFO SECTION-->
               
               </div><!--END OF APPLICATION INFO FORM-->
            
            </div><!--END OF MEDICAL, APPLICATION INFO, EMPLOYMENT INFO, & BENEFICIARY INFO SECTION-->
            <!--DECLARATION AND AUTHORIZATION PAGE-->
            <div class="container-fluid fwd-container hide-element" id="et-application-second-section">
               <div class="declare-authorize page-application et-declaration-section">
                  <h2><fmt:message key="eliteTerms.selectPlan.Declaration.authorization" bundle="${msg}" /></h2>
                  <div class="agreement-description">						
                     <h4><fmt:message key="eliteTerms.selectPlan.Declaration.Personal.Information" bundle="${msg}" /> </h4>
                     <div class="clearfix declaration">
                        <div class="pull-left pics-check">
                           <input type="checkbox" value="pics" id="pics-check" name="isPics" />
                           <label for="pics-check"></label>
                        </div>
                        <div class="pull-left pics-desc">
                           <fmt:message key="eliteTerms.selectPlan.PICS.part1" bundle="${msg}" /> <a href="<fmt:message key="PICS.life.link" bundle="${msg}" />" class="link" target="_blank"><fmt:message key="eliteTerms.selectPlan.PICS.part2" bundle="${msg}" /></a><fmt:message key="eliteTerms.selectPlan.PICS.part3" bundle="${msg}" />
                        </div>
                     </div>
                     <span id="chk1" class="text-red"></span> <br />
                     
                     <h4 class="policy-replace"><fmt:message key="eliteTerms.selectPlan.Policy.replacement.declarations" bundle="${msg}" /></h4>
                     <div class="policy-desc bottom">
                        <fmt:message key="eliteTerms.selectPlan.Have.you" bundle="${msg}" />
                     </div>
                     <div class="policy-replace-wrap clearfix">
                        <div class="left-desktop no">
                           <div class="clearfix">
                              <div class="pull-left policy-replace-check">
                                 <input type="checkbox" value="cancellation" id="no-policy-replace-check" name="isCancel"/>
                                 <label for="no-policy-replace-check"></label>
                              </div>
                              <div class="pull-left policy-replace-desc">
                                 <fmt:message key="eliteTerms.selectPlan.No" bundle="${msg}" />
                              </div>
                           </div>
                        </div>
                        <div class="left-desktop yes">
                           <div class="clearfix yes-policy">
                              <div class="pull-left yes-policy-replace-check">
                                 <input type="checkbox" value="cancellation" id="yes-policy-replace-check" name="isCancel"/>
                                 <label for="yes-policy-replace-check"></label>
                              </div>
                              <div class="pull-left yes-policy-replace-desc">
                                 <fmt:message key="eliteTerms.selectPlan.Yes" bundle="${msg}" />
                                 <span class="note"><fmt:message key="eliteTerms.selectPlan.Yes.(Please)" bundle="${msg}" /></span>
                              </div>
                           </div>
                        </div>
                     </div>
                     <span id="chk6" class="text-red"></span> <br/>
                     
                     <div class="clearfix"></div>
                     
                     <div class="policy-desc bottom">
                        <fmt:message key="eliteTerms.selectPlan.Do.you" bundle="${msg}" />
                     </div>
                     <div class="policy-replace-wrap clearfix">
                        <div class="left-desktop no">
                           <div class="clearfix">
                              <div class="pull-left policy-replace-check">
                                 <input type="checkbox" value="cancellation" id="no-policy-replace-existing-check" name="isCancel"/>
                                 <label for="no-policy-replace-existing-check"></label>
                              </div>
                              <div class="pull-left policy-replace-desc">
                                 <fmt:message key="eliteTerms.selectPlan.No" bundle="${msg}" />
                              </div>
                           </div>
                        </div>
                        <div class="left-desktop yes">
                           <div class="clearfix yes-policy">
                              <div class="pull-left yes-policy-replace-check">
                                 <input type="checkbox" value="cancellation" id="yes-policy-replace-existing-check" name="isCancel"/>
                                 <label for="yes-policy-replace-existing-check"></label>
                              </div>
                              <div class="pull-left yes-policy-replace-desc">
                                 <fmt:message key="eliteTerms.selectPlan.Yes" bundle="${msg}" />
                                 <span class="note"><fmt:message key="eliteTerms.selectPlan.Yes.(Please)" bundle="${msg}" /></span>
                              </div>
                           </div>
                        </div>
                     </div>
                     <span id="chk7" class="text-red"></span> <br/>
                     
                     <div class="clearfix"></div>
                     
                     <div class="policy-replacement-remarks">
                        <div class>
                           <p class="policy-desc bottom">
                              <fmt:message key="eliteTerms.selectPlan.Policy.replacement.declarations.remarks1" bundle="${msg}" />
                              <div class="clearfix declaration application-declaration">
                                 <div class="pull-left cancellation-check"></div>
                                 <div class="pull-left cancellation-desc">
                                    <div class="clearfix">
                                       <div class="pull-left span">
                                          <span class="order">i</span>
                                       </div>
                                       <div class="pull-left text">
                                          <fmt:message key="eliteTerms.selectPlan.Policy.replacement.declarations.remarks1.part1" bundle="${msg}" />
                                       </div>
                                    </div>   
                                 </div>
                              </div>
                              <div class="clearfix declaration application-declaration">
                                 <div class="pull-left cancellation-check"></div>
                                 <div class="pull-left cancellation-desc">
                                    <div class="clearfix">
                                       <div class="pull-left span">
                                          <span class="order">ii</span>
                                       </div>
                                       <div class="pull-left text">
                                          <fmt:message key="eliteTerms.selectPlan.Policy.replacement.declarations.remarks1.part2" bundle="${msg}" />
                                       </div>
                                    </div>   
                                 </div>
                              </div>
                           </p>
                           <p><fmt:message key="eliteTerms.selectPlan.Policy.replacement.declarations.remarks2" bundle="${msg}" /></p>
                        </div>
                     </div>

                     <div class="clearfix"></div>

                     <h4><fmt:message key="eliteTerms.selectPlan.Declaration.Cancellation" bundle="${msg}" />  </h4>
                     
                     <div class="policy-replace-wrap new-declaration">
                        <div class="policy-desc bottom">
                           <fmt:message key="eliteTerms.selectPlan.Residency.declarations.desc" bundle="${msg}" />
                        </div>
                        <div class="left-desktop no">
                           <div class="clearfix">
                              <div class="pull-left policy-replace-check">
                                 <input type="checkbox" value="no" id="is-new-declaration-check" name="isnNewDeclaration"/>
                                 <label for="is-new-declaration-check"></label>
                              </div>
                              <div class="pull-left policy-replace-desc">
                                 <fmt:message key="eliteTerms.selectPlan.No" bundle="${msg}" />
                              </div>
                           </div>
                        </div>
                        <div class="left-desktop yes">
                           <div class="clearfix yes-policy">
                              <div class="pull-left yes-policy-replace-check">
                                 <input type="checkbox" value="yes" id="non-new-declaration-check" name="nonNewDeclaration"/>
                                 <label for="non-new-declaration-check"></label>
                              </div>
                              <div class="pull-left yes-policy-replace-desc">
                                 <fmt:message key="eliteTerms.selectPlan.Yes" bundle="${msg}" />
                                 <span class="note"><fmt:message key="eliteTerms.selectPlan.Yes.(Please)" bundle="${msg}" /></span>
                              </div>
                           </div>
                        </div>
                     </div>
                     <span id="chk5" class="text-red"></span> <br/>
                     
                     <div class="clearfix"></div>
                     
                     <div class="clearfix declaration">
                        <div class="pull-left cancellation-check">
                           <input type="checkbox" value="cancellation" id="cancellation-check" name="isCancel" />
                           <label for="cancellation-check"></label>
                        </div>
                        <div class="pull-left cancellation-desc">
                           <fmt:message key="eliteTerms.selectPlan.I.understand.that" bundle="${msg}" />
                        </div>
                     </div>
                     <span id="chk2" class="text-red"></span> <br />
                     
                     <div class="policy-replace-wrap residency-declaration clearfix">
                        <h4 class="policy-replace"><fmt:message key="eliteTerms.selectPlan.Residency.declarations" bundle="${msg}" /></h4>
                        <div class="policy-desc bottom">
                           <fmt:message key="eliteTerms.selectPlan.Residency.declarations.desc" bundle="${msg}" />
                        </div>
                        <div class="left-desktop no">
                           <div class="clearfix">
                              <div class="pull-left policy-replace-check">
                                 <input type="checkbox" value="no" id="is-resident-check" name="isResident"/>
                                 <label for="is-resident-check"></label>
                              </div>
                              <div class="pull-left policy-replace-desc">
                                 <fmt:message key="eliteTerms.selectPlan.No" bundle="${msg}" />
                              </div>
                           </div>
                        </div>
                        <div class="left-desktop yes">
                           <div class="clearfix yes-policy">
                              <div class="pull-left yes-policy-replace-check">
                                 <input type="checkbox" value="yes" id="non-resident-check" name="nonResident"/>
                                 <label for="non-resident-check"></label>
                              </div>
                              <div class="pull-left yes-policy-replace-desc">
                                 <fmt:message key="eliteTerms.selectPlan.Yes" bundle="${msg}" />
                                 <span class="note"><fmt:message key="eliteTerms.selectPlan.Yes.(Please)" bundle="${msg}" /></span>
                              </div>
                           </div>
                        </div>
                     </div>
                     <span id="chk4" class="text-red"></span> <br />

                     <div class="clearfix"></div>

                     <h4 class="application"><fmt:message key="eliteTerms.selectPlan.Application" bundle="${msg}" /></h4>
                     
                     <div class="clearfix declaration application-declaration sub-header">
                        <div class="pull-left cancellation-check">
                           <input type="checkbox" value="cancellation" id="application-declaration" name="isCancel" />
                           <label for="application-declaration"></label>
                        </div>
                        <div class="pull-left cancellation-desc">
                           <h5 class="declare-agree"><fmt:message key="eliteTerms.selectPlan.I.hereby.DECLARE" bundle="${msg}" /></h5>
                        </div>
                     </div>
                     <span id="chk3" class="text-red"></span> <br />
                     
                     <div class="clearfix declaration application-declaration">
                        <div class="pull-left cancellation-check">
                           
                        </div>
                        <div class="pull-left cancellation-desc">
                           <div class="clearfix">
                              <div class="pull-left span">
                                 <span class="order">i</span>
                              </div>
                              <div class="pull-left text">
                                 <fmt:message key="eliteTerms.selectPlan.The.answers.to.all" bundle="${msg}" />
                              </div>
                           </div>
                              
                        </div>
                     </div>
                     <div class="clearfix declaration application-declaration">
                        <div class="pull-left cancellation-check">
                        </div>
                        <div class="pull-left cancellation-desc">
                           <div class="clearfix">
                              <div class="pull-left span">
                                 <span class="order">ii</span>
                              </div>
                              <div class="pull-left text">
                                 <fmt:message key="eliteTerms.selectPlan.I.have.the.duty" bundle="${msg}" />
                              </div>
                           </div>
                              
                        </div>
                     </div>
                     <div class="clearfix declaration application-declaration">
                        <div class="pull-left cancellation-check">
                           <!--<input type="checkbox" value="cancellation" id="cancellation-check" name="isCancel" />
                           <label for="cancellation-check"></label>-->
                        </div>
                        <div class="pull-left cancellation-desc">
                           <div class="clearfix">
                              <div class="pull-left span">
                                 <span class="order">iii</span>
                              </div>
                              <div class="pull-left text">
                                 <fmt:message key="eliteTerms.selectPlan.I.have.the.duty" bundle="${msg}" />
                              </div>
                           </div>		
                        </div>
                     </div>
                     <div class="clearfix declaration application-declaration">
                        <div class="pull-left cancellation-check">
                        </div>
                        <div class="pull-left cancellation-desc">
                           <div class="clearfix">
                              <div class="pull-left span">
                                 <span class="order">iv</span>
                              </div>
                              <div class="pull-left text">
                                 <fmt:message key="eliteTerms.selectPlan.Any.payment.made" bundle="${msg}" />
                              </div>
                           </div>
                              
                        </div>
                     </div>
                     <div class="clearfix hidden-md hidden-lg">
                        <div class="pull-left cancellation-check">
                           <input type="checkbox" value="cancellation" id="hereby-declare" name="isCancel" />
                           <label for="hereby-declare"></label>
                        </div>
                        <div class="pull-left cancellation-desc">
                           <fmt:message key="eliteTerms.selectPlan.I/We.hereby.declare.and" bundle="${msg}" />
                        </div>
                     </div>
                     
                     <div class="page-divider"></div>
                     
                     <h5><fmt:message key="eliteTerms.selectPlan.If.you.do.NOT.wish.FWD" bundle="${msg}" /></h5>
                     
                     <div class="clearfix authorization">
                        <div class="pull-left marketing-info-check">
                           <input type="checkbox" value="marketing-info" id="marketing-info-check" name="isMarketingInfo"  />
                           <label for="marketing-info-check"></label>
                        </div>
                        <div class="pull-left marketing-info-desk">
                           <fmt:message key="eliteTerms.selectPlan.Please.do.not.send" bundle="${msg}" />
                        </div>
                     </div>
                     
                     <div class="clearfix authorization">
                        <div class="pull-left personal-data-check">
                           <input type="checkbox" value="personal-data" id="personal-data-check" name="isPersonalData" />
                           <label for="personal-data-check"></label>
                        </div>
                        <div class="pull-left personal-data-desc">
                           <fmt:message key="eliteTerms.selectPlan.Please.do.not.provide" bundle="${msg}" />
                        </div>
                     </div>
                     
                     <div class="row et-proceed-btn-wrapper">
                        <div class="col-xs-12 col-md-6 proceed-btn text-center">
                           <button id="et-app-sum-proceed-btn" type="button" class="btn next et-btn-view-summary"><fmt:message key="eliteTerms.selectPlan.View.summary" bundle="${msg}" /></button> <!--Bind a click event temporarily to show the hidden Application Summary section-->
                        </div>
                        <div class="col-xs-12 col-md-6 proceed-btn text-center">
                           <button id="et-declaration-proceed-btn" type="button" class="btn next et-btn-confirm-sign"><fmt:message key="eliteTerms.selectPlan.Confirm.and.sign" bundle="${msg}" /></button> <!--Bind a click event temporarily to show the hidden Application Summary section-->
                        </div>
                     </div>
                     
                  </div>
               </div>
            </div><!--END OF DECLARATION AND AUTHORIZATION PAGE-->
            
            <!-- APPLICATION SUMMARY SECTION -->
            <div id="et-application-third-section" class="hide-element">
               <div class="" id="application-summary">
                  <div class="container-fluid fwd-container" role="document">
                     <div class="summary-content">
                        <div class="summary-header">
                           <h4 class="text-center"><fmt:message key="eliteTerms.selectPlan.Application.summary" bundle="${msg}" /></h4>
                        </div>
                        <div class="page-divider hidden-xs hidden-sm"></div>
                        <div class="summary-body">

                           <!-- PLAN DETAIL -->
                              <div class="summary-body-item">
                                 <h3 class="plan-detail"><fmt:message key="eliteTerms.selectPlan.Plan.detail" bundle="${msg}" /> <a href="#" title="Edit" class="et-app-sum-edit" data-target="#et-plan-option-section"><fmt:message key="eliteTerms.selectPlan.Edit" bundle="${msg}" /></a></h3>
                                 <div class="clearfix plan-detail-holder">
                                    <h4 class="info-label"><fmt:message key="eliteTerms.selectPlan.Selected.plan" bundle="${msg}" /></h4>
                                    <p class="info" id="etaspd-selected-plan"><fmt:message key="eliteTerms.selectPlan.Elite.term" bundle="${msg}" /></p>
                                 </div>
                                 <div class="clearfix plan-detail-holder">
                                    <h4 class="info-label"><fmt:message key="eliteTerms.selectPlan.Age.range" bundle="${msg}" /></h4>
                                    <p class="info" id="etaspd-age-range"><fmt:message key="eliteTerms.selectPlan.Up.to.95" bundle="${msg}" /></p>
                                 </div>
                                 <div class="clearfix plan-detail-holder">
                                    <h4 class="info-label"><fmt:message key="eliteTerms.selectPlan.Insured.amount" bundle="${msg}" /></h4>
                                    <p class="info" id="etaspd-insured-amount">HK$ <fmt:formatNumber value="${etPolicyApplication.amount }" pattern="#.00"/></p>
                                 </div>
                                 <div class="clearfix plan-detail-holder">
                                    <h4 class="info-label"><fmt:message key="eliteTerms.selectPlan.Monthly.premium" bundle="${msg}" /></h4>
                                    <p class="info" id="etaspd-monthly-premium" class="hidden">HK$ <fmt:formatNumber value="${eliteTermPremium.monthlyPremium }" pattern="#.00"/> <span class="extra-years-remarks"> (for the 1st year)</span></p>
                                    <p class="info" id="etaspd-monthly-premium-extra-years">HK$ <fmt:formatNumber value="${eliteTermPremium.monthlyDuePremium }" pattern="#.00"/> <span class="extra-years-remarks"> (first 20 policy years)</span></p>
                                 </div>
                              </div>
                           <!-- PLAN DETAIL END-->

                           <!-- PERSONAL INFO -->
                           <div class="summary-body-item">
                              <h3 class="personal-info"><fmt:message key="eliteTerms.selectPlan.Personal.Info" bundle="${msg}" /> <a href="#" title="Edit" class="et-app-sum-edit" data-target="#et-application-info-section"><fmt:message key="eliteTerms.selectPlan.Edit" bundle="${msg}" /></a></h3>
                              <h4 class="clearfix info-holder-title"><fmt:message key="eliteTerms.selectPlan.Name.in.English" bundle="${msg}" /></h4>
                              <div class="clearfix info-holder">
                                 <h4 class="info-label"><fmt:message key="eliteTerms.selectPlan.Last.Name" bundle="${msg}" /></h4>
                                 <p class="info" id="etaspi-en-lname"></p>
                              </div>
                              <div class="clearfix info-holder">
                                 <h4 class="info-label"><fmt:message key="eliteTerms.selectPlan.Given.Name" bundle="${msg}" /></h4>
                                 <p class="info" id="etaspi-fname"></p>
                              </div>
                              <div class="clearfix info-holder-below">
                                 <h4 class="info-label"><fmt:message key="eliteTerms.selectPlan.Name.in.Chinese" bundle="${msg}" /></h4>
                                 <p class="info" id="etaspi-chName"></p>
                              </div>
                              <div class="clearfix info-holder-below">
                                 <h4 class="info-label"><fmt:message key="eliteTerms.selectPlan.HKID" bundle="${msg}" /></h4>
                                 <p class="info" id="etaspi-hkid"></p>
                              </div>
                              <div class="clearfix info-holder-below">
                                 <h4 class="info-label"><fmt:message key="eliteTerms.selectPlan.Gender" bundle="${msg}" /></h4>
                                 <p class="info" id="etaspi-gender"></p>
                              </div>
                              <div class="clearfix info-holder-below">
                                 <h4 class="info-label"><fmt:message key="eliteTerms.selectPlan.Smooker/Non-smooker" bundle="${msg}" /></h4>
                                 <p class="info" id="etaspi-is-smooker"></p>
                              </div>
                              <div class="clearfix info-holder-below">
                                 <h4 class="info-label"><fmt:message key="eliteTerms.selectPlan.Marital.status" bundle="${msg}" /></h4>
                                 <p class="info" id="etaspi-marital-status"></p>
                              </div>
                              <div class="clearfix info-holder-below">
                                 <h4 class="info-label"><fmt:message key="eliteTerms.selectPlan.Date.of.birth" bundle="${msg}" /></h4>
                                 <p class="info" id="etaspi-dob"></p>
                              </div>
                              <div class="clearfix info-holder-below">
                                 <h4 class="info-label"><fmt:message key="eliteTerms.selectPlan.Place.of.birth" bundle="${msg}" /></h4>
                                 <p class="info" id="etaspi-pob"></p>
                              </div>
                              <div class="clearfix info-holder-below">
                                 <h4 class="info-label"><fmt:message key="eliteTerms.selectPlan.Nationality" bundle="${msg}" /></h4>
                                 <p class="info" id="etaspi-nationality"></p>
                              </div>
                              <div class="clearfix info-holder-below">
                                 <h4 class="info-label"><fmt:message key="eliteTerms.selectPlan.Email.address" bundle="${msg}" /></h4>
                                 <p class="info" id="etaspi-email"></p>
                              </div>
                              <div class="clearfix info-holder-below">
                                 <h4 class="info-label"><fmt:message key="eliteTerms.selectPlan.Telephone.no" bundle="${msg}" /></h4>
                                 <p class="info" id="etaspi-tel-no"></p>
                              </div>
                              <div class="clearfix info-holder-below">
                                 <h4 class="info-label"><fmt:message key="eliteTerms.selectPlan.Mobile.no" bundle="${msg}" /></h4>
                                 <p class="info" id="etaspi-mob-no"></p>
                              </div>
                              <div class="clearfix info-holder-below">
                                 <h4 class="info-label"><fmt:message key="eliteTerms.selectPlan.Permanent.address" bundle="${msg}" /></h4>
                                 <p class="info" id="etaspi-per-add"></p>
                              </div>
                              <div class="clearfix info-holder-below">
                                 <h4 class="info-label"><fmt:message key="eliteTerms.selectPlan.Residential.address" bundle="${msg}" /></h4>
                                 <p class="info" id="etaspi-res-add"></p>
                              </div>
                              <div class="clearfix info-holder-below et-corr-add">
                                 <h4 class="info-label"><fmt:message key="eliteTerms.selectPlan.Correspondence.address" bundle="${msg}" /></h4>
                                 <p class="info" id="etaspi-corr-add"></p>
                              </div>
                           </div>
                           <!-- PERSONAL INFO END -->

                           <!-- EMPLOYMENT INFO -->
                           <div class="summary-body-item">
                              <h3 class="employment-info"><fmt:message key="eliteTerms.selectPlan.Employment.Info1" bundle="${msg}" /> <a href="#" title="Edit" class="et-app-sum-edit" data-target="#et-employment-info-section"><fmt:message key="eliteTerms.selectPlan.Edit" bundle="${msg}" /></a></h3>
                              <div class="clearfix info-holder">
                                 <h4 class="info-label employment"><fmt:message key="eliteTerms.selectPlan.Employment.status" bundle="${msg}" /></h4>
                                 <p class="info" id="etasei-emp-status"></p>
                              </div>
                              <div class="et-stat-unemployed hide-element">
                                 <div class="clearfix info-holder">
                                    <h4 class="info-label employment"><fmt:message key="eliteTerms.selectPlan.Monthly.personal.income" bundle="${msg}" /></h4>
                                    <p class="info" id="etasei-source-income"></p>
                                 </div>
                                 <div class="clearfix info-holder">
                                    <h4 class="info-label employment"><fmt:message key="eliteTerms.selectPlan.Liquid.assets" bundle="${msg}" /></h4>
                                    <p class="info" id="etasei-liq-asset"></p>
                                 </div>
                              </div>
                              <div class="et-not-stat-unemployed hide-element">
                                <div class="clearfix info-holder">
                                    <h4 class="info-label employment"><fmt:message key="eliteTerms.selectPlan.Nature.of.business" bundle="${msg}" /></h4>
                                    <p class="info" id="etasei-nat-business"></p>
                                </div>
                              	<div class="clearfix info-holder">
                                    <h4 class="info-label employment"><fmt:message key="eliteTerms.selectPlan.Occupation" bundle="${msg}" /></h4>
                                    <p class="info" id="etasei-occupation"></p>
                                 </div>
                                 <div class="clearfix info-holder">
                                    <h4 class="info-label employment"><fmt:message key="eliteTerms.selectPlan.Monthly.personal.income" bundle="${msg}" /></h4>
                                    <p class="info" id="etasei-mon-income"></p>
                                 </div>
                                 <div class="clearfix info-holder">
                                    <h4 class="info-label employment"><fmt:message key="eliteTerms.selectPlan.Current.Employer.Name" bundle="${msg}" /></h4>
                                    <p class="info" id="etasei-employer-name"></p>
                                 </div>
                              </div>
                              <div class="clearfix info-holder">
                                 <h4 class="info-label employment"><fmt:message key="eliteTerms.selectPlan.Education.level" bundle="${msg}" /></h4>
                                 <p class="info" id="etasei-edu-level"></p>
                              </div>
                           </div>
                           <!-- EMPLOMENT INFO END -->

                           <!-- BENEFICIARY -->
                           <div class="summary-body-item">
	                           <div class="et-own-estate hide-element">
	                                 <h3 class="beneficiary"><fmt:message key="eliteTerms.selectPlan.Beneficiary" bundle="${msg}" /> <span><fmt:message key="eliteTerms.selectPlan.Person1" bundle="${msg}" /></span> <a href="#" title="Edit" class="et-app-sum-edit" data-target="#et-beneficiary-info-section"><fmt:message key="eliteTerms.selectPlan.Edit" bundle="${msg}" /></a></h3>
	                                 <p">Own Estate </p>
	                                 <%-- <h4 class="clearfix info-holder-title"><fmt:message key="eliteTerms.selectPlan.Name.in.English" bundle="${msg}" /></h4>
	                                 <div class="clearfix info-holder">
	                                    <h4 class="info-label employment"><fmt:message key="eliteTerms.selectPlan.Last.Name" bundle="${msg}" /></h4>
	                                    <p class="info" id="etasbi-en-fname-1"></p>
	                                 </div> --%>
                              </div>
                              <div class="et-person-1 hide-element">
                                 <h3 class="beneficiary"><fmt:message key="eliteTerms.selectPlan.Beneficiary" bundle="${msg}" /> <span><fmt:message key="eliteTerms.selectPlan.Person1" bundle="${msg}" /></span> <a href="#" title="Edit" class="et-app-sum-edit" data-target="#et-beneficiary-info-section"><fmt:message key="eliteTerms.selectPlan.Edit" bundle="${msg}" /></a></h3>
                                 <h4 class="clearfix info-holder-title"><fmt:message key="eliteTerms.selectPlan.Name.in.English" bundle="${msg}" /></h4>
                                 <div class="clearfix info-holder">
                                    <h4 class="info-label employment"><fmt:message key="eliteTerms.selectPlan.Last.Name" bundle="${msg}" /></h4>
                                    <p class="info" id="etasbi-en-fname-1"></p>
                                 </div>
                                 <div class="clearfix info-holder">
                                    <h4 class="info-label"><fmt:message key="eliteTerms.selectPlan.Given.Name" bundle="${msg}" /></h4>
                                    <p class="info" id="etasbi-en-lname-1"></p>
                                 </div>
                                 <div class="clearfix info-holder">
                                    <h4 class="info-label employment"><fmt:message key="eliteTerms.selectPlan.Name.in.Chinese" bundle="${msg}" /></h4>
                                    <p class="info" id="etasbi-ch-name-1"></p>
                                 </div>
                                 <div class="clearfix info-holder">
                                    <h4 class="info-label employment"><fmt:message key="eliteTerms.selectPlan.HKID.Passport.No" bundle="${msg}" /></h4>
                                    <p class="info" id="etasbi-hkid-pass-1"></p>
                                 </div>
                                 <div class="clearfix info-holder-below">
                                    <h4 class="info-label"><fmt:message key="eliteTerms.selectPlan.Relationship" bundle="${msg}" /></h4>
                                    <p class="info" id="etasbi-relationship-1"></p>
                                 </div>
                                 <div class="clearfix info-holder-below">
                                    <h4 class="info-label"><fmt:message key="eliteTerms.selectPlan.Gender" bundle="${msg}" /></h4>
                                    <p class="info" id="etasbi-gender-1"></p>
                                 </div>
                                 <div class="clearfix info-holder-below">
                                    <h4 class="info-label"><fmt:message key="eliteTerms.selectPlan.Entitlement" bundle="${msg}" /></h4>
                                    <p class="info" id="etasbi-entitlement-1"></p>
                                 </div>
                              </div>
                              <div class="et-person-2 hide-element">
                                 <h3 class="beneficiary"><fmt:message key="eliteTerms.selectPlan.Beneficiary" bundle="${msg}" /> <span><fmt:message key="eliteTerms.selectPlan.Person2" bundle="${msg}" /></span> <a href="#" title="Edit" class="et-app-sum-edit" data-target="#et-beneficiary-info-section"><fmt:message key="eliteTerms.selectPlan.Edit" bundle="${msg}" /></a></h3>
                                 <h4 class="clearfix info-holder-title"><fmt:message key="eliteTerms.selectPlan.Name.in.English" bundle="${msg}" /></h4>
                                 <div class="clearfix info-holder">
                                    <h4 class="info-label employment"><fmt:message key="eliteTerms.selectPlan.Last.Name" bundle="${msg}" /></h4>
                                    <p class="info" id="etasbi-en-fname-2"></p>
                                 </div>
                                 <div class="clearfix info-holder">
                                    <h4 class="info-label"><fmt:message key="eliteTerms.selectPlan.Given.Name" bundle="${msg}" /></h4>
                                    <p class="info" id="etasbi-en-lname-2"></p>
                                 </div>
                                 <div class="clearfix info-holder">
                                    <h4 class="info-label employment"><fmt:message key="eliteTerms.selectPlan.Name.in.Chinese" bundle="${msg}" /></h4>
                                    <p class="info" id="etasbi-ch-name-2"></p>
                                 </div>
                                 <div class="clearfix info-holder">
                                    <h4 class="info-label employment"><fmt:message key="eliteTerms.selectPlan.HKID.Passport.No" bundle="${msg}" /></h4>
                                    <p class="info" id="etasbi-hkid-pass-2"></p>
                                 </div>
                                 <div class="clearfix info-holder-below">
                                    <h4 class="info-label"><fmt:message key="eliteTerms.selectPlan.Relationship" bundle="${msg}" /></h4>
                                    <p class="info" id="etasbi-relationship-2"></p>
                                 </div>
                                 <div class="clearfix info-holder-below">
                                    <h4 class="info-label"><fmt:message key="eliteTerms.selectPlan.Gender" bundle="${msg}" /></h4>
                                    <p class="info" id="etasbi-gender-2"></p>
                                 </div>
                                 <div class="clearfix info-holder-below">
                                    <h4 class="info-label"><fmt:message key="eliteTerms.selectPlan.Entitlement" bundle="${msg}" /></h4>
                                    <p class="info" id="etasbi-entitlement-2"></p>
                                 </div>
                              </div>
                              <div class="et-person-3 hide-element">
                                 <h3 class="beneficiary"><fmt:message key="eliteTerms.selectPlan.Beneficiary" bundle="${msg}" /> <span><fmt:message key="eliteTerms.selectPlan.Person3" bundle="${msg}" /></span> <a href="#" title="Edit" class="et-app-sum-edit" data-target="#et-beneficiary-info-section"><fmt:message key="eliteTerms.selectPlan.Edit" bundle="${msg}" /></a></h3>
                                 <h4 class="clearfix info-holder-title"><fmt:message key="eliteTerms.selectPlan.Name.in.English" bundle="${msg}" /></h4>
                                 <div class="clearfix info-holder">
                                    <h4 class="info-label employment"><fmt:message key="eliteTerms.selectPlan.Last.Name" bundle="${msg}" /></h4>
                                    <p class="info" id="etasbi-en-fname-3"></p>
                                 </div>
                                 <div class="clearfix info-holder">
                                    <h4 class="info-label"><fmt:message key="eliteTerms.selectPlan.Given.Name" bundle="${msg}" /></h4>
                                    <p class="info" id="etasbi-en-lname-3"></p>
                                 </div>
                                 <div class="clearfix info-holder">
                                    <h4 class="info-label employment"><fmt:message key="eliteTerms.selectPlan.Name.in.Chinese" bundle="${msg}" /></h4>
                                    <p class="info" id="etasbi-ch-name-3"></p>
                                 </div>
                                 <div class="clearfix info-holder">
                                    <h4 class="info-label employment"><fmt:message key="eliteTerms.selectPlan.HKID.Passport.No" bundle="${msg}" /></h4>
                                    <p class="info" id="etasbi-hkid-pass-3"></p>
                                 </div>
                                 <div class="clearfix info-holder-below">
                                    <h4 class="info-label"><fmt:message key="eliteTerms.selectPlan.Relationship" bundle="${msg}" /></h4>
                                    <p class="info" id="etasbi-relationship-3"></p>
                                 </div>
                                 <div class="clearfix info-holder-below">
                                    <h4 class="info-label"><fmt:message key="eliteTerms.selectPlan.Gender" bundle="${msg}" /></h4>
                                    <p class="info" id="etasbi-gender-3"></p>
                                 </div>
                                 <div class="clearfix info-holder-below">
                                    <h4 class="info-label"><fmt:message key="eliteTerms.selectPlan.Entitlement" bundle="${msg}" /></h4>
                                    <p class="info" id="etasbi-entitlement-3"></p>
                                 </div>
                              </div>
                           </div>
                           <!-- BENEFECIARY END -->

                           <!-- UNDERWRITING SUMMARY -->
                           <div class="summary-body-item">
                              <h3 class="uwriting"><fmt:message key="eliteTerms.selectPlan.Underwriting.Summary" bundle="${msg}" /> <a href="#" id="underwriting-summary-edit" title="Edit" class="et-app-sum-edit" data-target="#et-select-plan-section"><fmt:message key="eliteTerms.selectPlan.Edit" bundle="${msg}" /></a></h3>
                              <div class="fwd-checkbox">
                                 <input type="checkbox" id="summary-one" checked disabled>
                                 <label for="summary-one"></label>
                                 <p class="notice"><fmt:message key="eliteTerms.selectPlan.I.DO.NOT.have.proposal" bundle="${msg}" /></p>
                              </div>
                              <div class="fwd-checkbox below">
                                 <input type="checkbox" id="summary-two" checked disabled>
                                 <label for="summary-two"></label>
                                 <p class="notice"><fmt:message key="eliteTerms.selectPlan.I.DO.NOT.have.had" bundle="${msg}" /></p>
                                 <div class="row et-apsum-disease-list"> 
                                    <ul class="col-xs-12 col-md-6">
                                       <li><img src="<%=request.getContextPath()%>/resources/images/elite-terms/et-bullet.png"><span><fmt:message key="eliteTerms.selectPlan.span1" bundle="${msg}" /></span></li>
                                       <li><img src="<%=request.getContextPath()%>/resources/images/elite-terms/et-bullet.png"><span><fmt:message key="eliteTerms.selectPlan.span2" bundle="${msg}" /></span></li>
                                       <li><img src="<%=request.getContextPath()%>/resources/images/elite-terms/et-bullet.png"><span><fmt:message key="eliteTerms.selectPlan.span3" bundle="${msg}" /></span></li>
                                       <li><img src="<%=request.getContextPath()%>/resources/images/elite-terms/et-bullet.png"><span><fmt:message key="eliteTerms.selectPlan.span4" bundle="${msg}" /></span></li>
                                       <li><img src="<%=request.getContextPath()%>/resources/images/elite-terms/et-bullet.png"><span><fmt:message key="eliteTerms.selectPlan.span5" bundle="${msg}" /></span></li>
                                       <li><img src="<%=request.getContextPath()%>/resources/images/elite-terms/et-bullet.png"><span><fmt:message key="eliteTerms.selectPlan.span6" bundle="${msg}" /></span></li>
                                       <li><img src="<%=request.getContextPath()%>/resources/images/elite-terms/et-bullet.png"><span><fmt:message key="eliteTerms.selectPlan.span7" bundle="${msg}" /></span></li>
                                       <li><img src="<%=request.getContextPath()%>/resources/images/elite-terms/et-bullet.png"><span><fmt:message key="eliteTerms.selectPlan.span8" bundle="${msg}" /></span></li>
                                       </ul>
                                    <ul class="col-xs-12 col-md-6">
                                       <li><img src="<%=request.getContextPath()%>/resources/images/elite-terms/et-bullet.png"><span><fmt:message key="eliteTerms.selectPlan.span9" bundle="${msg}" /></span></li>
                                       <li><img src="<%=request.getContextPath()%>/resources/images/elite-terms/et-bullet.png"><span><fmt:message key="eliteTerms.selectPlan.span10" bundle="${msg}" /></span></li>
                                       <li><img src="<%=request.getContextPath()%>/resources/images/elite-terms/et-bullet.png"><span><fmt:message key="eliteTerms.selectPlan.span11" bundle="${msg}" /></span></li>
                                       <li><img src="<%=request.getContextPath()%>/resources/images/elite-terms/et-bullet.png"><span><fmt:message key="eliteTerms.selectPlan.span12" bundle="${msg}" /></span></li>
                                       <li><img src="<%=request.getContextPath()%>/resources/images/elite-terms/et-bullet.png"><span><fmt:message key="eliteTerms.selectPlan.span13" bundle="${msg}" /></span></li>
                                       <li><img src="<%=request.getContextPath()%>/resources/images/elite-terms/et-bullet.png"><span><fmt:message key="eliteTerms.selectPlan.span14" bundle="${msg}" /></span></li>
                                       <li><img src="<%=request.getContextPath()%>/resources/images/elite-terms/et-bullet.png"><span><fmt:message key="eliteTerms.selectPlan.span15" bundle="${msg}" /></span></li>
                                    </ul>
                                 </div>
                              </div>
                              <div class="fwd-checkbox below">
                                 <input type="checkbox" id="summary-three" checked disabled>
                                 <label for="summary-three"></label>
                                 <p class="notice second-format"><fmt:message key="eliteTerms.selectPlan.In.the.past.3.years" bundle="${msg}" />
                                 </p>
                              </div>
                              <div class="fwd-checkbox below">
                                 <input type="checkbox" id="summary-four" checked disabled>
                                 <label for="summary-four"></label>
                                 <p class="notice"><fmt:message key="eliteTerms.selectPlan.I.DO.NOT.have.an" bundle="${msg}" />
                                 </p>
                              </div>
                           </div>
                           <!-- UNDERWRITING SUMMARY -->
                        </div> <!-- END OF SUMMARY BODY   -->
                     </div> <!-- END OF SUMMARY CONTENT -->

                     <div class="text-center confirm-and-sign-holder">
                        <button id="et-confirm-and-sign-btn" type="button" class="btn next"><fmt:message key="eliteTerms.selectPlan.Confirm" bundle="${msg}" /></button><!--Bind a click event temporarily to show the hidden Signature section-->
                     </div>

                  </div>
               </div>
            </div><!-- APPLICATION SUMMARY END -->
            
            <!-- SIGNATURE SECTION -->
            <div id="et-application-fourth-section" class="hide-element">
               <div class="container-fluid fwd-container">
                  <div class="signature page-application et-signature">
                     <div class="signature-section" id="signature-section">
                        
                        <h2><fmt:message key="eliteTerms.selectPlan.Your.signature" bundle="${msg}" /></h2>
                        <p class="et-sig-label text-center"><fmt:message key="eliteTerms.selectPlan.Please.sign.in.the.grey.area" bundle="${msg}" /></p>
                        
                        <div id="signature" class="signature-image"></div>
                        
                        <div class="et-clear-signature"><a href="#" id="et-clear-signature" title="Clear signature" class=""><fmt:message key="eliteTerms.selectPlan.Clear" bundle="${msg}" /></a></div>
                        
                        <div class="correct-signature hide-element">
                           <img src="<%=request.getContextPath()%>/resources/images/elite-terms/correct-signature.png" class="correct-sign-image"/><span class="span-text-img"><fmt:message key="eliteTerms.selectPlan.Correct.Signature" bundle="${msg}" /></span>
                        </div>
                     </div>
                     
                     <div class="proceed-btn">
                        <button id="et-signature-proceed-btn" type="button" class="btn next"><fmt:message key="eliteTerms.selectPlan.Proceed.to.payment" bundle="${msg}" /></button>
                     </div>
                     <canvas id="et-temp-canvas"></canvas>
                  </div>
               </div>
            </div><!-- END OF SIGNATURE SECTION -->
            
         </div>
         </div><!-- END Application Wrapper -->
         <!--
            MODAL SECTION 
         -->
         <!-- GET PROMOTION CODE MODAL -->
         <div id="get-promotion-code-popup" class="modal fade login-modal"tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
               <div class="modal-content plan-modal">
                   <div class="login-form" id="sendmailofpromocode">
                   <div style="overflow: hidden;"><a class="close" aria-label="Close" data-dismiss="modal">
                        <span aria-hidden="true" style="font-size:30px;">x</span>
                      </a>
                   </div>
                   <form onSubmit="return false;">
                        <div class="form-container">
                           <h2><fmt:message key="eliteTerms.selectPlan.Don't.have.a.promotion" bundle="${msg}" /></h2>
                           <div class="alert alert-success hide proSuccess"></div>
                           <h4><fmt:message key="eliteTerms.selectPlan.Email.address" bundle="${msg}" /></h4>
                           <div class="form-group">
                               <input type="text" class="form-control" placeholder="" name="emailToSendPromoCode" id="emailToSendPromoCode">
                               <input type="hidden" name="planCode" id="planCode" value="TRAVELCARE">                         
                           </div>
                           <span id="errPromoEmail" class="text-red"></span>
                           <div>
                              <button type="submit" onclick="getPromoteCode()" class="btn next"><fmt:message key="eliteTerms.selectPlan.Submit" bundle="${msg}" /></button>
                           </div>
                           <p><fmt:message key="eliteTerms.selectPlan.By.submitting.my" bundle="${msg}" /></p>
                        </div>
                   </form>
                   </div>
                   
                   
               </div>
            </div>
         </div>
         <!-- END OF GET PROMOTION CODE MODAL -->
         

         
         <!--CANNOT APPLY MODAL-->
         <div class="modal et-modal fade" role="dialog" aria-labelledby="cantapply" id="cannot-apply-modal">
            <div class="container-fluid modal-dialog" role="document">
               <div class="modal-content et-modal-content">
                  <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                     <h5><fmt:message key="eliteTerms.selectPlan.Sorry.you.cannot.apply" bundle="${msg}" /></h5>
                  </div>
                  <div class="modal-body">
                     <p><fmt:message key="eliteTerms.selectPlan.Please.call.our" bundle="${msg}" />
                     3123 3123 <fmt:message key="eliteTerms.selectPlan.to.find.out.more" bundle="${msg}" /></p>
                     <form action="" id="et-cust-serv-form" method="post">
                        <div class="input-items clearfix">
                           <label for="name"><fmt:message key="eliteTerms.selectPlan.Name" bundle="${msg}" /></label>
                           <input type="text" class="form-control gray-textbox chinese-input" placeholder="<fmt:message key="eliteTerms.selectPlan.Name" bundle="${msg}" />" id="name" name="name">
                           <span class="error-msg" id="cannotApplyNameMessage"></span>
                        </div>
                        <div class="input-items clearfix">
                           <label for="email"><fmt:message key="eliteTerms.selectPlan.Email.address" bundle="${msg}" /></label>
                           <input type="text" class="form-control gray-textbox" placeholder="<fmt:message key="eliteTerms.selectPlan.Email.address" bundle="${msg}" />" id="email" name="email">
                           <span class="error-msg" id="cannotApplyEmailMessage"></span>
                        </div>
                        <div class="input-items clearfix">
                           <label for="tel"><fmt:message key="eliteTerms.selectPlan.Telephone.no." bundle="${msg}" /></label>
                           <input type="text" class="form-control gray-textbox" placeholder="<fmt:message key="eliteTerms.selectPlan.Telephone.no." bundle="${msg}" />" id="tel" name="tel">
                           <span class="error-msg" id="cannotApplyTelMessage"></span>
                        </div>
                        <div class="input-items clearfix">
                           <label for="day"><fmt:message key="eliteTerms.selectPlan.Preffered.day" bundle="${msg}" /></label>
                           <div class="select-holder">
                                 <select class="form-control gray-textbox" id="day" name="day">
                                 <option value=""><fmt:message key="eliteTerms.selectPlan.Please.select" bundle="${msg}" /></option>
                                            <c:if test="${language == 'en'}">
                                    <c:forEach var="list" items="${etCsContactPreferredDayEN}">
                                       <option value="${list.itemCode }-${list.itemDesc }">${list.itemDesc }</option>
                                    </c:forEach>
                                 </c:if>
                                 <c:if test="${language == 'tc'}">
                                    <c:forEach var="list" items="${etCsContactPreferredDayCN}">
                                       <option value="${list.itemCode }-${list.itemDesc }">${list.itemDesc }</option>
                                    </c:forEach>
                                 </c:if>
                              </select>
                           </div>
                           <span class="error-msg" id="cannotApplyDayMessage"></span>
                        </div>
                        <div class="input-items clearfix">
                           <label for="time"><fmt:message key="eliteTerms.selectPlan.Preffered.timeslot" bundle="${msg}" /></label>
                           <div class="select-holder">
                              <select class="form-control gray-textbox" id="time" name="time">
                                 <option value=""><fmt:message key="eliteTerms.selectPlan.Please.select" bundle="${msg}" /></option>
                                            <c:if test="${language == 'en'}">
                                    <c:forEach var="list" items="${etCsContactPreferredTimeSlotEN}">
                                       <option value="${list.itemCode }-${list.itemDesc }">${list.itemDesc }</option>
                                    </c:forEach>
                                 </c:if>
                                 <c:if test="${language == 'tc'}">
                                    <c:forEach var="list" items="${etCsContactPreferredTimeSlotCN}">
                                       <option value="${list.itemCode }-${list.itemDesc }">${list.itemDesc }</option>
                                    </c:forEach>
                                 </c:if>
                              </select>
                           </div>
                           <span class="error-msg" id="cannotApplyTimeMessage"></span>
                        </div>
                        <div class="input-items clearfix">
                           <label for="enquiry"><fmt:message key="eliteTerms.selectPlan.Enquire.type" bundle="${msg}" /></label>
                           <div class="select-holder">
                              <select class="form-control gray-textbox" id="enquiry" name="enquiry">
                                 <option value=""><fmt:message key="eliteTerms.selectPlan.Please.select" bundle="${msg}" /></option>
                                            <c:if test="${language == 'en'}">
                                    <c:forEach var="list" items="${etEnquiryTypeEN}">
                                       <option value="${list.itemCode }-${list.itemDesc }">${list.itemDesc }</option>
                                    </c:forEach>
                                 </c:if>
                                 <c:if test="${language == 'tc'}">
                                    <c:forEach var="list" items="${etEnquiryTypeCN}">
                                       <option value="${list.itemCode }-${list.itemDesc }">${list.itemDesc }</option>
                                    </c:forEach>
                                 </c:if>
                              </select>
                           </div>
                           <span class="error-msg" id="cannotApplyEnquireMessage"></span>
                        </div>
                        <div class="">
                           <p class="notice">
                              <fmt:message key="eliteTerms.selectPlan.not.direct.marketing" bundle="${msg}" />
                           </p>
                        </div>
                        <button type="submit" class="btn next" id="et-cannot-apply-btn"><fmt:message key="eliteTerms.selectPlan.Submit" bundle="${msg}" /></button>
                     </form>
                  </div>
               </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog --> 
         </div><!--END OF CANNOT APPLY MODAL-->
         
         <!-- END OF BACK TO HOME -->
         <div id="back-to-home-modal" class="modal fade fwd-generic-modal back-to-home" role="dialog" data-keyboard="false" data-backdrop="static">
            <div class="modal-dialog">
                <div class="modal-content" align="center">
                  <div class="modal-body" style="color:#fc6d08">
                     <p><fmt:message key="eliteTerms.selectPlan.successfully.submitted" bundle="${msg}" /></p>	
                  </div>
                  <div>
                     <button type="button" class="btn btn-orange et-next-btn et-pad-bot-50" id="et-select-plan-go-homepage" data-dismiss="modal"><fmt:message key="eliteTerms.selectPlan.Back.to.homepage" bundle="${msg}" /></button>
                  </div>
               </div>

               
               <!--<div class="modal-content">
                  <div class="modal-header">
                     <h4 class="modal-title">Your request has been successfully submitted.</h4>
                  </div>
                     
                  <div class="modal-body"></div>
                  
                  <div class="modal-footer">
                     <a href="/" title="Back to homepage" class="btn-block">Back to homepage</a>
                     <button type="button" class="btn btn-orange et-next-btn et-pad-bot-50" id="et-select-plan-go-homepage" data-dismiss="modal"><fmt:message key="eliteTerms.selectPlan.Back.to.homepage" bundle="${msg}" /></button>
                  </div>
               </div>-->

            </div>
         </div>
         
         <!-- DOB ATTENTION -->
         <div id="bdayModal" class="modal fade fwd-generic-modal" role="dialog">
            <div class="modal-dialog">
            
               <div class="modal-content">
                  <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal">&times;</button>
                     <h4 class="modal-title"><fmt:message key="eliteTerms.selectPlan.Attention" bundle="${msg}" /></h4>
                  </div>
                     
                  <div class="modal-body">
                     <p><fmt:message key="eliteTerms.selectPlan.The.Date.of.birth" bundle="${msg}" /></p>	
                  </div>
                  
                  <div>
                     <button type="button" class="btn-block" id="et-btn-change-date" data-dismiss="modal"><fmt:message key="eliteTerms.selectPlan.Change.my.data" bundle="${msg}" /></button>
                  </div>
               </div>

            </div>
         </div><!-- END OF DOB ATTENTION -->
         
         <%-- <!--CUSTOMER SERVICE MODAL-->
			<div class="modal et-modal fade" role="dialog" aria-labelledby="cantapply" id="customer-service-modal">
				<div class="container-fluid modal-dialog" role="document">
					<div class="modal-content et-modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							<h4><fmt:message key="eliteTerms.selectPlan.Customer.Service" bundle="${msg}" /></h4>
						</div>
						<div class="modal-body">
							<p><fmt:message key="eliteTerms.selectPlan.Please.call.our" bundle="${msg}" /> <a href="#" class="et-top-no" title="Customer Service Hotline" >3123 3123</a> <fmt:message key="eliteTerms.selectPlan.to.find.out.more" bundle="${msg}" /></p>
							<form action="">
								<div class="input-items clearfix">
									<label for="cs_name"><fmt:message key="eliteTerms.selectPlan.Name" bundle="${msg}" /></label>
									<input type="text" class="form-control gray-textbox" placeholder="Name" id="cs_name" name="cs_name">
								</div>
								<div class="input-items clearfix">
									<label for="cs_email"><fmt:message key="eliteTerms.selectPlan.Email.address" bundle="${msg}" /></label>
									<input type="text" class="form-control gray-textbox" placeholder="Email Address" id="cs_email" name="cs_email">
								</div>
								<div class="input-items clearfix">
									<label for="cs_tel"><fmt:message key="eliteTerms.selectPlan.Telephone.no." bundle="${msg}" /></label>
									<input type="text" class="form-control gray-textbox" placeholder="Telephone no" id="cs_tel" name="cs_tel">
								</div>
								<div class="input-items clearfix">
									<label for="cs_day"><fmt:message key="eliteTerms.selectPlan.Preffered.day" bundle="${msg}" /></label>
									<div class="select-holder">
										<select class="form-control gray-textbox" id="cs_day" name="cs_day">
											<option><fmt:message key="eliteTerms.selectPlan.Monday.Friday" bundle="${msg}" /></option>
											<option><fmt:message key="eliteTerms.selectPlan.Lorem.Ipsum" bundle="${msg}" /></option>
										</select>
									</div>
								</div>
								<div class="input-items clearfix">
									<label for="cs_time"><fmt:message key="eliteTerms.selectPlan.Preffered.timeslot" bundle="${msg}" /></label>
									<div class="select-holder">
										<select class="form-control gray-textbox" id="cs_time" name="cs_time">
											<option><fmt:message key="eliteTerms.selectPlan.After.hour" bundle="${msg}" /></option>
											<option><fmt:message key="eliteTerms.selectPlan.Lorem.Ipsum" bundle="${msg}" /></option>
										</select>
									</div>
								</div>
								<div class="input-items clearfix">
									<label for="cs_enquiry"><fmt:message key="eliteTerms.selectPlan.Enquire.type" bundle="${msg}" /></label>
									<div class="select-holder">
										<select class="form-control gray-textbox" id="cs_enquiry" name="cs_enquiry">
											<option><fmt:message key="eliteTerms.selectPlan.Product.enquiry" bundle="${msg}" /></option>
											<option><fmt:message key="eliteTerms.selectPlan.Lorem.Ipsum" bundle="${msg}" /></option>
										</select>
									</div>
								</div>
                        <div class="fwd-checkbox modal-checkbox">
                           <input type="checkbox" id="customer-service-checkbox">
                           <label for="customer-service-checkbox"></label>
                           <p class="notice"><fmt:message key="eliteTerms.selectPlan.I.have.read.and.I" bundle="${msg}" />
                           <a href="#"><fmt:message key="eliteTerms.selectPlan.Personal.Information" bundle="${msg}" /></a></p>
                        </div>

								<button type="submit" class="btn next"><fmt:message key="eliteTerms.selectPlan.Submit" bundle="${msg}" /></button>
							</form>
						</div>
					</div><!-- /.modal-content -->
				</div><!-- /.modal-dialog -->	
			</div><!--END OF CUSTOMER SERVICE MODAL--> --%>
         
         <!-- FOOTER -->	
		</div>
		
		<!-- JS INCLUDES -->
		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		<!-- Include all compiled plugins (below), or include individual files as needed 
		<script src="<%=request.getContextPath()%>/resources/js/elite-term/bootstrap.min.js"></script>-->
		<script src="<%=request.getContextPath()%>/resources/js/elite-term/bootstrap-select.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/elite-term/jquery.touchSwipe.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/elite-term/bootstrapValidator.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/elite-term/jquery.mousewheel.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/elite-term/jquery.jscrollpane.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/jquery.i18n.properties-min-1.0.9.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/elite-term/fwd-validation.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/elite-term/placeholders.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/elite-term/date.format.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/elite-term/jquery.timepicker.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/bootstrap-datepicker.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/custom.js"></script>
		
		
		<!--For Sales Illustration Page only-->
		<!--<script src="<%=request.getContextPath()%>/resources/js/elite-term/bootstrap-slider.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/elite-term/jquery-ui-custom-ease.min.js"></script>-->
		
		
		
		<script src="<%=request.getContextPath()%>/resources/js/elite-term/bootstrap-et-slider.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/elite-term/highcharts.js"></script>
      <!--[if lt IE 9]>
		<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/elite-term/flashcanvas.js"></script>
		<![endif]-->
		<script src="<%=request.getContextPath()%>/resources/js/elite-term/jSignature.min.js"></script>
		<!-- SELECT PLAN JS -->
      <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/elite-term/fwd-select-plan.js"></script>
      <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/elite-term/elite-term.js"></script>
      <script type="text/javascript">
      
      //select-plan
      $(document).on('click', '#et-before-no', function(e) {
         $('#et-btn-before-start').removeClass('hidden');
      });

  		//applicant dob
  		$(document).on('click', '#et-personal-info-next', function(e) {
  			if($('#eliteTermsInsuredInfoForm #sales-illu-dob').val()!="") {
  				$('#eliteTermsInsuredInfoForm')
  			    .data('bootstrapValidator')
  			    .updateStatus('dob','VALID');
  			}
  		});

      //about yourself dob
      $(document).on('change', '#et-select-plan-date-input', function(e) {
         if($('#et-select-plan-date-input').val()!="") {
            $('#eliteTermsAboutYourselfForm')
            .data('bootstrapValidator')
            .updateStatus('et-select-plan-date','VALID');
         }
      });
      //ABout yourself validation
      $('#eliteTermsAboutYourselfForm').bootstrapValidator({
         excluded: [],
         fields: {
            "et-select-plan-date": {
               container: '#et-ays-datepicker-message',
               validators: {
                  notEmpty: {
                     message: '<fmt:message key="eliteTerms.selectPlan.Please.enter.your.Date.of.birth" bundle="${msg}" />'
                  },
                  callback: {
                     message: '<fmt:message key="eliteTerms.selectPlan.Please.enter.your.Date.of.birth" bundle="${msg}" />',
                     callback: function(value, validator) {
                        return value !== document.getElementById('et-select-plan-date-input').getAttribute('placeholder');
                     }
                  }
               }
            },
            "et-gender": {
               container: '#et-gender-message',
               validators: {
                  notEmpty: {
                     message: '<fmt:message key="eliteTerms.selectPlan.Please.select.your.gender" bundle="${msg}" />'
                  }
               }
            },
            "et-smoker": {
               container: '#et-smoke-message',
               validators: {
                  notEmpty: {
                     message: '<fmt:message key="eliteTerms.selectPlan.Are.you.a.smoker" bundle="${msg}" />'
                  }
               }
            }
         }
      }).on('success.form.bv', function(e) {
         e.preventDefault();
         var $form = $(this);
 
         var $planOption = $('#et-plan-option-section');

         $('#et-btn-ay-self').removeClass('et-pad-bot-50');
         $('#et-about-yoursel-section').removeAttr('style');
         $planOption.removeClass('hide-element');
         
         if(getWidth()>=992){
            $('.et-collapse-link[aria-expanded="true"]').parent()
               .next()
               .find('.et-panel-body')
               .jScrollPane({showArrows: true});
         }
         
         $('body, html').animate({
            scrollTop: ($planOption.offset().top - stickyHeight) + 'px'
         }, 500);
         
         // Store plan detail data
         if ($('#et-gender-male').prop('checked')) {
            planDetailData.gender = 'Male';
         } else if ($('#et-gender-female').prop('checked')) {
            planDetailData.gender = 'Female';
         }
         
         var age = getAge(parseInt($('#et-select-plan-date-input').val().substring(6,10)),
                 parseInt($('#et-select-plan-date-input').val().substring(3,5)),
                 parseInt($('#et-select-plan-date-input').val().substring(0,2)));
         if (age < 50) {
             $('#et-ins-amt-max-display').text('2,000,000');
             $('#et-slider-range').html('800,000');
             $('#R2').slider({max:2000000});
             $('#R2').slider('setValue', 800000);
         } else if (age < 55) {
             $('#et-ins-amt-max-display').text('1,500,000');
             $('#et-slider-range').html('800,000');
             $('#R2').slider({max:1500000});
             $('#R2').slider('setValue', 800000);
         } else {
             $('#et-ins-amt-max-display').text('500,000');
             $('#et-slider-range').html('450,000');
             $('#R2').slider({max:500000});
             $('#R2').slider('setValue', 450000);
         }         
         
         planDetailData.dob = $planDate.val();
      });
      $(document).ready(function() {
    	  if('${etPolicyApplication.applicant.gender}'=='M'){
    		  $("#et-gender-male").click();
    	  }
    	  else if('${etPolicyApplication.applicant.gender}'=='F'){
    		  $("#et-gender-female").click();
    	  }
    	  $('#et-select-plan-date-input').datepicker('setDate', '${etPolicyApplication.applicant.dobD }');
    	  if('${etPolicyApplication.applicant.smoke}'=='true'){
    		  $("#et-smoker-yes").click();
    	  }
    	  else if('${etPolicyApplication.applicant.smoke}'=='false'){
    		  $("#et-smoker-no").click();
    	  }
    	  
    	  if('${etPolicyApplication.promocode }'!=''){
    		  $('#et-dis-promo-amount').removeClass('hidden');
    		// Application PromoCode
    		  $('#etaspd-monthly-premium').removeClass('hidden');
    	  }
    	  else{
    		  $('#et-dis-promo-amount').addClass('hidden');
    		  
    		  $('#etaspd-monthly-premium').addClass('hidden');
    	  }
    	  
    	  if('${goApp}'!=null && '${goApp}'=='yes'){
  			  $('#et-btn-before-start').removeClass('et-pad-bot-50');
  			  $('#et-about-yoursel-section').removeClass('hide-element').css('margin-bottom', '125px');
  			  $('#et-btn-ay-self').removeClass('et-pad-bot-50');
  	          $('#et-about-yoursel-section').removeAttr('style');
  	          $('#et-plan-option-section').removeClass('hide-element');
  	          $('#et-application-first-section').removeClass('hide-element').css('margin-bottom', '190px');
  		      $('#' + currentSection).addClass('hide-element');
  		      currentSection = 'et-application-first-section';
  		      var $appInfo = $('#et-application-first-section');

  		    $('.application-page-header #select-plan').removeClass('active');
  		  	$('.application-page-header #application').addClass('active');
	  		  $('body, html').animate({
	  		      scrollTop: ($appInfo.offset().top - stickyHeight) + 'px'
	          }, 500);
    	  }

        /* Reset calculated amount when on input value change */
        $('input[name=et-gender]').on('change', resetCalculatedAmt);
        $('input[name=et-smoker]').on('change', resetCalculatedAmt);
        $('#et-select-plan-date-input').on('change', resetCalculatedAmt);
        $('#R2').on('change', resetCalculatedAmt);


        // Application Info tooltip
         $('.btn-app-info-tooltip, .btn-beneficiary-tooltip').tooltip({
            trigger: 'hover focus click',
            container: 'body',
            template:   '<div class="tooltip et-app-info-tooltip" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>',
            placement: tooltipPlacement
         });
      });
  
		      // Move to Medical declaration section
		      $('#et-brn-proceed-to-application').on('click', function(e) {
		    	  $.ajax({
		 			  type : "POST",
		 			  url : "<%=request.getContextPath()%>/ajax/eliteTerm/putEtPlanOptionSession",
		 			  data : {
		 				      gender : $('input[name="et-gender"]:checked ').val(),
		 				      dobD: $('#et-select-plan-date-input').val(),
		 				      smoke: $('input[name="et-smoker"]:checked ').val(),
		 				      amount: $('#R2').val(),
		 				      promocode: $('#et-promocode').val()
		 				     },
		 			  success : function(data) {
		 			  }
	 		      });
		    	  
	    	     if("${authenticate}" == "true" && "${authenticate}" != "*DIRECTGI"){
	    	    	 var $appInfo = $('#et-application-first-section');
			         $appInfo.removeClass('hide-element')
			                  .css('margin-bottom', '190px');
			         
			         $('body, html').animate({
			            scrollTop: ($appInfo.offset().top - stickyHeight) + 'px'
			         }, 500);
				 }
				 else{
					// Open login modal
					$('#goApp').val('yes');
					$('#loginpopup').modal('show');
				 }
		      });
		      
            //cannot apply modal 
           /*  $(document).on('change', '#et-cust-serv-form #email', function(e) {
               if(!$('#et-cust-serv-form #cannotApplyEmailMessage').find('small').is(':visible')) {
                  $('#et-cust-serv-form')
                     .data('bootstrapValidator')
                     .updateStatus('tel', 'VALID');
               } else {
                  $('#et-cust-serv-form')
                     .data('bootstrapValidator')
                     .updateStatus('tel', 'INVALID','callback');
               }
            }); */
            // ^ bootstrap validation
            $('#et-cust-serv-form').bootstrapValidator({
               excluded:[],
               fields: {
                  "name": {
                     container: '#cannotApplyNameMessage',
                     trigger: 'blur',
                     validators: {
                        notEmpty: {
                           message: '<fmt:message key="eliteTerms.selectPlan.Please.enter.your.name" bundle="${msg}" />'
                        },
                        regexp: {
                           regexp: /^[a-zA-Z\s\u4e00-\u9eff]*$/, /*chinese and english chars only*/
                           message: '<fmt:message key="eliteTerms.selectPlan.Your.name.is.invalid" bundle="${msg}" />'
                        },
                        callback: {
                           message: '<fmt:message key="eliteTerms.selectPlan.Please.enter.your.name" bundle="${msg}" />',
                           callback: function(value, validator) {
                              return value !== document.getElementById('name').getAttribute('placeholder');
                           }
                        }
                     }
                  },
                  "email": {
                     container: '#cannotApplyEmailMessage',
                     trigger: 'blur',
                     validators: {
                        notEmpty: {
                           message: '<fmt:message key="eliteTerms.selectPlan.Please.enter.your.email.address" bundle="${msg}" />'
                        },
                        emailAddress: {
                           message: '<fmt:message key="eliteTerms.selectPlan.Your.email.address.is.invalid" bundle="${msg}" />'
                        }
                     }
                  },
                  "tel": {
                     container: '#cannotApplyTelMessage',
                     trigger: 'blur',
                     validators: {
                    	notEmpty: {
                            message: '<fmt:message key="eliteTerms.selectPlan.Please.enter.your.mobile.no" bundle="${msg}" />'
                        },
                    	regexp: {
                           regexp: /^1[0-9]{10}$|^[5689][0-9]{7}$/, //^[5689]{3}[0-9]+$/,
                           message: '<fmt:message key="eliteTerms.selectPlan.Your.mobile.no.is.invalid" bundle="${msg}" />'
                        }/* ,
                        callback: {
                           message: 'c',
                           callback: function(value, validator) {
                              return isEmailEmpty(value);
                           }
                        } */
                     }
                  },
                  "day": {
                     container: '#cannotApplyDayMessage',
                     validators: {
                        notEmpty: {
                           message: '<fmt:message key="eliteTerms.selectPlan.Please.choose.a.perferred.day" bundle="${msg}" />'
                        }
                     }
                  },
                  "time": {
                     container: '#cannotApplyTimeMessage',
                     validators: {
                        notEmpty: {
                           message: '<fmt:message key="eliteTerms.selectPlan.Please.choose.a.perferred.timeslot" bundle="${msg}" />'
                        }
                     }
                  },
                  "enquiry": {
                      container: '#cannotApplyEnquireMessage',
                      validators: {
                         notEmpty: {
                            message: '<fmt:message key="eliteTerms.selectPlan.Please.choose.a.perferred.enquiry.type" bundle="${msg}" />'
                         }
                      }
                  }
               }
            }).on('success.form.bv', function(e) {
                  e.preventDefault();
                  var $form = $(this);
          
                   $('.modal').modal('hide');
                   $('#back-to-home-modal').modal('show');
                   
                    var name = $('#name').val();
	               	var email = $('#email').val();
	               	var mobile = $('#tel').val();
	               	var preferredDay = $('#day').val();
	               	var preferredTimeSlot = $('#time').val();
	               	var enquiryType = $('#enquiry').val();
	               	var channel = $("#channel").val();
	               	var product = "eliteterm";
	               	
	               	if(name ==null){
	               		console.log("data error");
	               	}
	               	else{
	               		$.get(contextPath+'/ajax/eliteTerm/contactCs',
	               		{ 
	               			name : name,
	               			email : email,
	               			mobile : mobile,
	               			preferredDay : preferredDay,
	               			preferredTimeSlot : preferredTimeSlot,
	               			enquiryType : enquiryType,
	               			channel : channel,
	               			product : product
	               		},
	               		function(data) {
	               			if(data.errMsgs == null){
	               				console.log("data success");
	               			}
	               			else{
	               				console.log("data error");
	               			}
	               		})
	               		.fail(function(data) {
	               		});
	               	}
            });

            function getAge(year, month, day)
            {
                var now = new Date()    
                var age = now.getFullYear() - year
                var mdif = now.getMonth() - month + 1 //0=jan    
                
                if(mdif < 0)
                {
                    --age
                }
                else if(mdif == 0)
                {
                    var ddif = now.getDate() - day
                    
                    if(ddif < 0)
                    {
                        --age
                    }
                }
                return age
            }            
                        
            function isEmailEmpty(number) {
               var isNotEmpty = false;
               var pref = number.split("");
               var isNotValid = 0;

               if($('#et-cust-serv-form #email').val().length > 0 || number.length > 0) {
                  isNotEmpty = true;
               }
               return isNotEmpty;
            }
            
            function getPromoteCode() {
            	if(validate_promo_val()){
            		$.ajax({
  		 			  type : "POST",
  		 			  url : "<%=request.getContextPath()%>/ajax/eliteTerm/getPromoteCode",
  		 			  data : {
  		 				      email: $('#emailToSendPromoCode').val()
  		 				     },
  		 			  success : function(data) {
  		 				if(data!=null && data.errMsgs == null){
  		 					$('#get-promotion-code-popup').modal('hide');
  		 				}
  		 				else{
  		 					$('#errPromoEmail').html('<fmt:message key="system.promotion.error.message" bundle="${msg}" />');
  		 				}
  		 			  }
  	 		      });
            	}
            	else{
            		$('#errPromoEmail').html('<fmt:message key="promotion.empty.error.message" bundle="${msg}" />');
            	}
			}
            
            /*Promo popup*/
            function validate_promo_val(){
            	var getLanguage = "";
                var lang = languageP;

                if(lang === "EN"){
                	getLanguage = "en";
                }else 
                if(lang === "tc"){
                	getLanguage = "zh";
                } 
                else{
                	getLanguage = "en";
                }
            	var valid = true;
            	var emailId = document.getElementById("emailToSendPromoCode").value; 
            	document.getElementById("errPromoEmail").style.display = "none";
            	// Email Address Validation
            	if (emailId.trim() == "") {
            		document.getElementById("errPromoEmail").style.display = "block";
            		document.getElementById("errPromoEmail").innerHTML = getBundle(getLanguage, "promotion.email.notNull.message");//"Your E-mail Address is invalid.";
            		valid = false;

            	} 
            	else {
            		if (emailreg.test(emailId) == false) {
            			document.getElementById("errPromoEmail").style.display = "block";
            			document.getElementById("errPromoEmail").innerHTML = getBundle(getLanguage, "promotion.email.notValid.message");//"Your E-mail Address is invalid.";
            			valid = false;
            		}
            	}
            	return valid;
            }
            
            function getCsChannel(channel) {
            	$("#channel").val(channel);
			}
      </script>
