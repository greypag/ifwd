<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeQuoteBean"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/styles.css">
		<%!
			boolean isSaleActiveClass = false;
			boolean isEservicesActiveClass = false;
		%>
		<div class="fwd-savie-wrapper">			
			<!--Elite Terms Header Info Widget-->
         <div class="fwd-container container-fluid breadcrumbs hidden-xs hidden-sm">
            <ol class="breadcrumb breadcrumbs-product-details et-breadcrumbs">
               <li><a href="#">Home</a></li>
               <li class="divider"><i class="fa fa-play"></i></li>
               <li><a href="#">Protection </a></li>
               <li class="divider"><i class="fa fa-play"></i></li>
               <li><a href="#">Elite term </a></li>
               <li class="divider last"><i class="fa fa-play"></i></li>
               <li class="active-bc" id="et-active-bc-menu">Select plan</li>
            </ol>
         </div>
            
			<div class="container-fluid fwd-full-container">
				<div class="application-page-header et-header-browse">
					<div class="row reset-margin hidden-xs hidden-sm">
                  <div class="col-md-2 reset-padding">
                      <button type="button" class="et-header-info-btn et-bind-btn-header active" id="select-plan" data-et-section-target="et-select-plan-section">Select plan</button>
                  </div>
                  <div class="col-md-2 reset-padding">
                      <button type="button" class="et-header-info-btn et-bind-btn-header" id="application" data-et-section-target="et-application-section" >Application</button>
                  </div>
                  <div class="col-md-3 reset-padding">
                      <button type="button" class="et-header-info-btn et-bind-btn-header no-hover" id="payment" data-et-section-target="et-dec-sign-section">Payment</button>
                  </div>
                  <div class="col-md-3 reset-padding">
                      <button type="button" class="et-header-info-btn no-hover" id="summary" >Upload document</button>
                  </div>
                  <div class="col-md-2 reset-padding">
                      <button type="button" class="et-header-info-btn et-bind-btn-header no-hover" id="confirmation" data-et-section-target="et-confirmation-section">Confirmation</button>
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
								<h3 id="et-active-section-label">Select plan</h3>
							</div>
						</div>
					</div>
				</div>
			</div>
         
         <div class="application-flux">
         
            <!--
               SELECT PLAN SECTION
            -->
            <div id="et-select-plan-section" class="et-element-section-wrapper">
               
               <!--Elite Terms Before We Start Widget-->
               <div class="container-fluid fwd-container">
                  <!--Before we start-->
                  <div class="et-before-we-start">
                     <h2 class="et-bfr-txt">Before we start...</h2>
                     <div class="et-broken-line et-padding"></div>
                     <p class="et-bfr-start-txt">
                        If you want to fill in a Financial Need Analysis, please call our Customer Service 3123 3123, to arrange an appointment to our Customer Service Center.
                     </p>

                     <div class="et-broken-line et-padding"></div>
                     
                     <p class="et-bfr-start-txt bottom">
                        Do you have an existing insurance policy that the insured amount more than HK$2,000,000 with FWD?
                     </p>
                     
                     <div class="clearfix">
                        <input type="radio" id="et-before-yes" name="et-before" value="et-before-yes">
                        <label class="et-before-we-start-yes pull-left" for="et-before-yes" data-toggle="modal" data-target="#cannot-apply-modal">	
                           <span class="et-before-text">Yes</span>
                        </label>
                        
                        <input type="radio" id="et-before-no" name="et-before" value="et-before-no">
                        <label class="et-before-we-start-no no pull-right" for="et-before-no">
                           <span class="et-before-text">No</span>
                        </label>
                     </div>
                  </div>
                  <div class="et-next-btn-div">
                     <button type="button" id="et-btn-before-start" class="btn btn-orange et-next-btn et-pad-bot-50" data-toggle="">Next</button>
                  </div>
               </div>
                  
               <!--ABOUT YOURSELF-->
               <div id="et-about-yoursel-section" class="hide-element">
                  <div class="et-broken-line et-full"></div>
                  <div class="container-fluid fwd-container">
                     <div class="et-about-urself">
                        <h2 class="et-about-urself-text">About yourself</h2>
                        
                        <div class="et-broken-line et-padding"></div>
                        
                        <div class="row reset-margin et-gender-main-div">
                           <div class="col-md-4 col-xs-12">
                              <h4 class="et-gender-txt">Your gender</h4>
                              
                              <div class="clearfix et-gender-wrapper">
                                 <div class="et-gender-div">
                                    <input type="radio" id="et-gender-male" name="et-gender" value="et-gender-male" />
                                    <label for="et-gender-male">
                                       <img src="assets/images/elite-terms/et-nb-male-icon.png" alt="et-male.png" />
                                    </label>
                                    <div class="et-gnder-txt text-center">Male</div>
                                 </div>
                                 
                                 <div class="et-gender-div">
                                    <input type="radio" id="et-gender-female" name="et-gender" value="et-gender-male" checked />
                                    <label for="et-gender-female">
                                       <img src="assets/images/elite-terms/et-nb-female-icon.png" alt="et-male.png" />
                                    </label>
                                    <div class="et-gnder-txt text-center">Female</div>
                                 </div>
                              </div>
                              
                              <div class="et-broken-line et-padding hidden-md hidden-lg"></div>
                           </div>
                           
                           <div class="col-md-4 col-xs-12">
                              <h4 class="et-dob-txt">Your date of birth</h4>
                              <div id="et-select-plan-date" class="selectDiv et-select-plan-date">
                                 <input type="text" class="date" name="et-select-plan-date" id="et-select-plan-date-input" placeholder="DD-MM-YYYY" readonly="">
                              </div>
                              <div class="et-broken-line et-padding hidden-md hidden-lg"></div>
                           </div>
                           <div class="col-md-4 col-xs-12">
                              <h4 class="et-dob-txt smoker">Are you a smoker?</h4>
                              
                              <div class="clearfix et-smoke-wrapper">
                                 <div class="et-gender-div">
                                    <input type="radio" id="et-smoker-yes" name="et-smoker" value="et-smoker-yes">
                                    <label for="et-smoker-yes" class="et-smoker-label">
                                       <img src="assets/images/elite-terms/et-nb-smoker.png" alt="et-male.png" />
                                    </label>
                                    <div class="et-smoker-txt yes text-center">Yes</div>
                                 </div>
                                 
                                 <div class="et-gender-div">
                                    <input type="radio" id="et-smoker-no" name="et-smoker" value="et-smoker-no" checked>
                                    <label for="et-smoker-no" class="et-smoker-label">
                                       <img src="assets/images/elite-terms/et-nb-non-smoker.png" alt="et-male.png" />
                                    </label>
                                    <div class="et-smoker-txt no text-center">No</div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                     
                     <div class="et-next-btn-div">
                        <button type="button" id="et-btn-ay-self" class="btn btn-orange et-next-btn et-pad-bot-50">Next</button>
                     </div>
                  </div>
               </div><!--END OF ABOUT YOURSELF-->
               
               <!--PLAN OPTION-->
               <div id="et-plan-option-section" class="hide-element">
                  <div class="et-broken-line et-full"></div>
                  <div class="container-fluid fwd-container">			
                     
                     <div class="et-plan-option">
                        <div class="et-option-wrapper">
                           <h2 class="et-plan-option-text">Plan option</h2>
                           <div class="et-broken-line et-padding"></div>
                           
                           <div class="row reset-margin">
                              <div class="col-xs-12 col-md-6 et-insurance-amount">
                                 <div class="et-tooltip-wrapper">
                                    <h3 class="et-insured-amount">Insured amount </h3> 
                                    <button type="button" class="et-minimal et-insured-amount-tooltip" data-container="body" data-trigger="hover focus click" data-html="true" data-toggle="tooltip" data-placement="top" title="Our online application only accept up to <strong>HK$2,000,000</strong> insured amount, if you want to insure more than the above amount, please call our Customer Service on 3123 3123, to arrange an appointment at our Customer Service Center to complete a detail examination." data-template='<div class="tooltip et-sp-tooltip-wrapper" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>'><span class="et-info-tooltip "></span></button>
                                 </div>
                                 <p class="et-hkd">HKD <span class="et-hkd-dollars" id="et-slider-range">800,000</span></p>
                                 <div class="clearfix et-slider-info-div">
                                    <div class="pull-left">
                                       <p class="et-slider-info center">Min</p>
                                       <p class="et-slider-info">400,000</p>
                                    </div>
                                    <div class="pull-right">
                                       <p class="et-slider-info center">Max</p>
                                       <p class="et-slider-info">2,000,000</p>
                                    </div>
                                 </div>
                                 <input type="text" class="span2" name="amount" value="" data-slider-min="400000" data-slider-max="2000000" data-slider-step="10000" data-slider-value="800000" data-slider-ticks-snap-bounds="10000" data-slider-id="ET" id="R2" data-slider-tooltip="hide" data-slider-handle="square" />
                                 <div class="et-broken-line et-padding hidden-md hidden-lg"></div>
                              </div>
                              <div class="col-xs-12 col-md-5">
                                 <div class="et-tooltip-wrapper">
                                    <h3 id="promocode-hide-switch" class="et-promo-code-txt et-mbot-15">Promo code <img src="assets/images/orange-caret.png" class="reversed hidden-md hidden-lg"></h3>
                                    <button type="button" class="et-minimal et-promo-code-tooltip" data-container="body" data-trigger="hover focus click" data-html="true" data-toggle="tooltip" data-placement="top" title="Our online application only accept up to <strong>HK$2,000,000</strong> insured amount, if you want to insure more than the above amount, please call our Customer Service on 3123 3123, to arrange an appointment at our Customer Service Center to complete a detail examination." data-template='<div class="tooltip et-sp-tooltip-wrapper" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>'><span class="et-question-tooltip"></span></button>  
                                 </div>
                                 <div id="promocode-hidden" class="hidden-sm hidden-xs">
                                    <div class="clearfix">
                                       <div class="pull-left et-promo-code-txtbox">
                                          <input name="promocode" type="text" placeholder="e.g. SAVIE50" class="et-promocode" id="et-promocode">
                                       </div>
                                       <div class="pull-right et-apply-btn">
                                          <button type="button" class="btn btn-white et-apply">Apply</button>
                                       </div>
                                    </div>
                                    <a href="#" title="Get your promotion code" class="et-promo-code-question" data-toggle="modal" data-target="#get-promotion-code"><i>How do I get promotion code?</i></a>
                                 </div>
                              </div>	
                           </div>
                           <div id="promocode-hidden-button" class="et-next-btn-div et-calcu">
                              <button type="button" class="btn btn-orange et-calculate-btn">Calculate</button>
                           </div>
                        </div>
                        
                        <!-- <div class="et-broken-line et-padding hidden-md hidden-lg"></div> -->
                        
                        <div class="et-plan-option-extra-info">
                           <div class="et-extra-info top">
                              <span class="et-amount">Amount</span>
                           </div>
                           <div class="et-extra-info bottom">
                              <div class="et-center-div">
                                 <p class="et-amount">HK$ 1, 000 <span>/per month</span></p>
                                 <p class="et-per et-month">(only HK$ 100 per day)</p>
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
                                    Product highlights
                                    <span class="fa fa-angle-up pull-right et-arrow-down" ></span>
                                    <span class="fa fa-angle-down pull-right et-arrow-down" ></span>
                                 </a>
                              </div>
                              <div id="collapseOne" class="panel-collapse collapse in et-select-plan-panel" role="tabpanel" aria-labelledby="headingOne">
                                 <div class="et-panel-body et-panel-body-first" id="panelOne">
                                    <p class="et-accrdion-txt-bold">Elite Term Plan Series offers additional plan coverage, which can only be insured through offline examination, please call <a href="#" class="et-contact-link" title="Contact customer service" data-toggle="modal" data-target="#customer-service-modal">3123-3123</a> to arrange an appointment for detail examination.</p>
                                    <p class="et-accrdion-txt-normal">Additional plan include:</p>
                                    <p class="et-accrdion-txt-normal bottom">- Preferred / Preferred Plus - Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin gravida dolor sit amet lacus accumsan et viverra justo commodo.</p>
                                    <p class="et-accrdion-txt-normal">- Rider - Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin gravida dolor sit amet lacus accumsan et viverra justo commodo.</p>
                                 </div>
                              </div>
                           </div>
                           <div class="panel et-panel-accordion ">
                              <div class="panel-heading et-panel-heading" role="tab" id="headingTwo">
                                 <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseOne" class="et-collapse-link clearfix" id="headingTwo">
                                    Additional Premium
                                    <span class="fa fa-angle-up pull-right et-arrow-down" ></span>
                                    <span class="fa fa-angle-down pull-right et-arrow-down" ></span>
                                 </a>
                              </div>
                              <div id="collapseTwo" class="panel-collapse collapse et-select-plan-panel" role="tabpanel" aria-labelledby="headingTwo">
                              <div class="et-panel-body" id="panelTwo">
                                    <p>
                                       Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec in ligula id sem tristique ultrices
                                       eget id neque. Duis enim turpis, tempus at accumsan vitae, lobortis id sapien. Pellentesque nec orci
                                       mi, in pharetra ligula. Nulla facilisi. Nulla facilisi. Mauris convallis venenatis massa, quis
                                       consectetur felis ornare quis. Sed aliquet nunc ac ante molestie ultricies. Nam pulvinar ultricies
                                       bibendum. Vivamus diam leo, faucibus et vehicula eu, molestie sit amet dui. Proin nec orci et elit
                                       semper ultrices. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus
                                       mus. Sed quis urna mi, ac dignissim mauris. Quisque mollis ornare mauris, sed laoreet diam malesuada
                                       quis. Proin vel elementum ante. Donec hendrerit arcu ac odio tincidunt posuere. Vestibulum nec risus
                                       eu lacus semper viverra.
                                    </p>
                                    <p>
                                       Vestibulum dictum consectetur magna eu egestas. Praesent molestie dapibus erat, sit amet sodales
                                       lectus congue ut. Nam adipiscing, tortor ac blandit egestas, lorem ligula posuere ipsum, nec
                                       faucibus nisl enim eu purus. Quisque bibendum diam quis nunc eleifend at molestie libero tincidunt.
                                       Quisque tincidunt sapien a sapien pellentesque consequat. Mauris adipiscing venenatis augue ut
                                       tempor. Donec auctor mattis quam quis aliquam. Nullam ultrices erat in dolor pharetra bibendum.
                                       Suspendisse eget odio ut libero imperdiet rhoncus. Curabitur aliquet, ipsum sit amet aliquet varius,
                                       est urna ullamcorper magna, sed eleifend libero nunc non erat. Vivamus semper turpis ac turpis
                                       volutpat non cursus velit aliquam. Fusce id tortor id sapien porta egestas. Nulla venenatis luctus
                                       libero et suscipit. Sed sed purus risus. Donec auctor, leo nec eleifend vehicula, lacus felis
                                       sollicitudin est, vitae lacinia lectus urna nec libero. Aliquam pellentesque, arcu condimentum
                                       pharetra vestibulum, lectus felis malesuada felis, vel fringilla dolor dui tempus nisi. In hac
                                       habitasse platea dictumst. Ut imperdiet mauris vitae eros varius eget accumsan lectus adipiscing.
                                    </p>
                              </div>
                              </div>
                           </div>
                           <div class="panel et-panel-accordion ">
                              <div class="panel-heading et-panel-heading" role="tab" id="headingThree">
                                 <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseOne" class="et-collapse-link clearfix" id="headingThree">
                                    Key Product Risks
                                    <span class="fa fa-angle-up pull-right et-arrow-down" ></span>
                                    <span class="fa fa-angle-down pull-right et-arrow-down" ></span>
                                 </a>
                              </div>
                              <div id="collapseThree" class="panel-collapse collapse et-select-plan-panel" role="tabpanel" aria-labelledby="headingThree">
                              <div class="et-panel-body" id="panelThree">
                                    <p>
                                       Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec in ligula id sem tristique ultrices
                                       eget id neque. Duis enim turpis, tempus at accumsan vitae, lobortis id sapien. Pellentesque nec orci
                                       mi, in pharetra ligula. Nulla facilisi. Nulla facilisi. Mauris convallis venenatis massa, quis
                                       consectetur felis ornare quis. Sed aliquet nunc ac ante molestie ultricies. Nam pulvinar ultricies
                                       bibendum. Vivamus diam leo, faucibus et vehicula eu, molestie sit amet dui. Proin nec orci et elit
                                       semper ultrices. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus
                                       mus. Sed quis urna mi, ac dignissim mauris. Quisque mollis ornare mauris, sed laoreet diam malesuada
                                       quis. Proin vel elementum ante. Donec hendrerit arcu ac odio tincidunt posuere. Vestibulum nec risus
                                       eu lacus semper viverra.
                                    </p>
                                    <p>
                                       Vestibulum dictum consectetur magna eu egestas. Praesent molestie dapibus erat, sit amet sodales
                                       lectus congue ut. Nam adipiscing, tortor ac blandit egestas, lorem ligula posuere ipsum, nec
                                       faucibus nisl enim eu purus. Quisque bibendum diam quis nunc eleifend at molestie libero tincidunt.
                                       Quisque tincidunt sapien a sapien pellentesque consequat. Mauris adipiscing venenatis augue ut
                                       tempor. Donec auctor mattis quam quis aliquam. Nullam ultrices erat in dolor pharetra bibendum.
                                       Suspendisse eget odio ut libero imperdiet rhoncus. Curabitur aliquet, ipsum sit amet aliquet varius,
                                       est urna ullamcorper magna, sed eleifend libero nunc non erat. Vivamus semper turpis ac turpis
                                       volutpat non cursus velit aliquam. Fusce id tortor id sapien porta egestas. Nulla venenatis luctus
                                       libero et suscipit. Sed sed purus risus. Donec auctor, leo nec eleifend vehicula, lacus felis
                                       sollicitudin est, vitae lacinia lectus urna nec libero. Aliquam pellentesque, arcu condimentum
                                       pharetra vestibulum, lectus felis malesuada felis, vel fringilla dolor dui tempus nisi. In hac
                                       habitasse platea dictumst. Ut imperdiet mauris vitae eros varius eget accumsan lectus adipiscing.
                                    </p>
                              </div>
                              </div>
                           </div>
                           <div class="panel et-panel-accordion ">
                              <div class="panel-heading et-panel-heading" role="tab" id="headingFour">
                                 <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseOne" class="et-collapse-link clearfix" id="headingFour">
                                    Exclusions
                                    <span class="fa fa-angle-up pull-right et-arrow-down" ></span>
                                    <span class="fa fa-angle-down pull-right et-arrow-down" ></span>
                                 </a>
                              </div>
                              <div id="collapseFour" class="panel-collapse collapse et-select-plan-panel" role="tabpanel" aria-labelledby="headingTwo">
                              <div class="et-panel-body" id="panelFour">
                                    <p>
                                       Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec in ligula id sem tristique ultrices
                                       eget id neque. Duis enim turpis, tempus at accumsan vitae, lobortis id sapien. Pellentesque nec orci
                                       mi, in pharetra ligula. Nulla facilisi. Nulla facilisi. Mauris convallis venenatis massa, quis
                                       consectetur felis ornare quis. Sed aliquet nunc ac ante molestie ultricies. Nam pulvinar ultricies
                                       bibendum. Vivamus diam leo, faucibus et vehicula eu, molestie sit amet dui. Proin nec orci et elit
                                       semper ultrices. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus
                                       mus. Sed quis urna mi, ac dignissim mauris. Quisque mollis ornare mauris, sed laoreet diam malesuada
                                       quis. Proin vel elementum ante. Donec hendrerit arcu ac odio tincidunt posuere. Vestibulum nec risus
                                       eu lacus semper viverra.
                                    </p>
                                    <p>
                                       Vestibulum dictum consectetur magna eu egestas. Praesent molestie dapibus erat, sit amet sodales
                                       lectus congue ut. Nam adipiscing, tortor ac blandit egestas, lorem ligula posuere ipsum, nec
                                       faucibus nisl enim eu purus. Quisque bibendum diam quis nunc eleifend at molestie libero tincidunt.
                                       Quisque tincidunt sapien a sapien pellentesque consequat. Mauris adipiscing venenatis augue ut
                                       tempor. Donec auctor mattis quam quis aliquam. Nullam ultrices erat in dolor pharetra bibendum.
                                       Suspendisse eget odio ut libero imperdiet rhoncus. Curabitur aliquet, ipsum sit amet aliquet varius,
                                       est urna ullamcorper magna, sed eleifend libero nunc non erat. Vivamus semper turpis ac turpis
                                       volutpat non cursus velit aliquam. Fusce id tortor id sapien porta egestas. Nulla venenatis luctus
                                       libero et suscipit. Sed sed purus risus. Donec auctor, leo nec eleifend vehicula, lacus felis
                                       sollicitudin est, vitae lacinia lectus urna nec libero. Aliquam pellentesque, arcu condimentum
                                       pharetra vestibulum, lectus felis malesuada felis, vel fringilla dolor dui tempus nisi. In hac
                                       habitasse platea dictumst. Ut imperdiet mauris vitae eros varius eget accumsan lectus adipiscing.
                                    </p>
                              </div>
                              </div>
                           </div>
                     </div>
                     </div>
                     
                  </div>
                  
                  <div class="container-fluid fwd-container">
                     <div class="row et-select-plan-btns">
                        <!-- <div class="col-xs-12 col-md-6 left">
                           <button type="button" class="btn btn-white et-customer-srvce left" id="cust-service" data-toggle="modal" data-target="#customer-service-modal" >Contact customer service</button>
                        </div> -->
                        <div class="col-xs-12 col-md-12 right text-center">
                           <button type="button" class="btn btn-white et-proceed-appl bottom active" id="et-brn-proceed-to-application">Proceed to application</button>
                        </div>
                     </div>
                  </div>
               
               </div><!--PLAN OPTION-->
               
            </div><!--END OF SELECT PLAN SECTION-->
            
            <!--MEDICAL, APPLICATION INFO, EMPLOYMENT INFO, & BENEFICIARY INFO SECTION-->
            <div id="et-application-first-section" class="hide-element">
               <!--Medical Declaration Widget-->
               <div class="container-fluid fwd-container">
                  <div id="et-medical-declaration" class="personal-info-widget page-application et-medical-declaration-wrapper">
                     <h2>Medical declaration</h2>
                                    
                     <div class="row margin">
                        <div class="col-sm-12 et-medial-col">
                           
                           <div class="panel-group" id="et-medic-accordion" role="tablist" aria-multiselectable="true">
                              
                              <div class="panel panel-default et-medic-panel">
                                 <div class="panel-heading" role="tab" id="et-medi-question-1-heading">
                                    <h4 class="panel-title">
                                       <a role="button" data-toggle="collapse" data-parent="#et-medic-accordion" href="#et-medi-question-1" aria-expanded="true" aria-controls="et-medi-question-1">
                                          Question 1
                                       </a>
                                    </h4>
                                 </div>
                                 <div id="et-medi-question-1" class="panel-collapse collapse in et-collapse" role="tabpanel" data-next-target="et-medi-question-2" data-prev-target="" data-is-answered="false" aria-labelledby="et-medi-question-1-heading">
                                    <div class="panel-body">
                                       <div class="row">
                                          <div class="col-xs-12 col-md-8">
                                             <p>Has your proposal, renewal or reinstatement for life, disability, accident, critical illness or health insurance made to any company ever been declined, postponed or modified in anyway?</p>
                                          </div>
                                          <div class="col-xs-12 col-md-4">
                                             <div class="row">
                                                <div class="col-xs-6 et-pad-right-reduce-7">
                                                   <a  href="#" class="btn et-btn-medic btn et-btn-medic-yes" data-current-target="et-medi-question-1" data-next-target="et-medi-question-2" title="Yes"  data-toggle="modal" data-target="#cannot-apply-modal">Yes</a>
                                                </div>
                                                <div class="col-xs-6 et-pad-left-reduce-7">
                                                   <a href="#" class="btn et-btn-medic et-btn-medic-no" title="No" data-current-target="et-medi-question-1" data-next-target="et-medi-question-2" >No</a>
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
                                          Question 2
                                       </a>
                                    </h4>
                                 </div>
                                 <div id="et-medi-question-2" class="panel-collapse collapse et-collapse" role="tabpanel" data-next-target="et-medi-question-3" data-prev-target="et-medi-question-1" data-is-answered="false" aria-labelledby="et-medi-question-2-heading">
                                    <div class="panel-body">
                                       <div class="row">
                                          <div class="col-xs-12 col-md-8">
                                             <p>Has your proposal, renewal or reinstatement for life, disability, accident, critical illness or health insurance made to any company ever been declined, postponed or modified in anyway?</p>
                                          </div>
                                          <div class="col-xs-12 col-md-4">
                                             <div class="row">
                                                <div class="col-xs-6 et-pad-right-reduce-7">
                                                   <a  href="#" class="btn et-btn-medic et-btn-medic-yes" data-current-target="et-medi-question-2" data-next-target="et-medi-question-3" title="Yes"  data-toggle="modal" data-target="#cannot-apply-modal">Yes</a>
                                                </div>
                                                <div class="col-xs-6 et-pad-left-reduce-7">
                                                   <a href="#" class="btn et-btn-medic et-btn-medic-no" title="No" data-current-target="et-medi-question-2" data-next-target="et-medi-question-3">No</a>
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
                                          Question 3
                                       </a>
                                    </h4>
                                 </div>
                                 <div id="et-medi-question-3" class="panel-collapse collapse et-collapse" role="tabpanel" data-next-target="" data-prev-target="et-medi-question-2" data-is-answered="false" aria-labelledby="et-medi-question-3-heading">
                                    <div class="panel-body">
                                       <div class="row">
                                          <div class="col-xs-12 col-md-8">
                                             <p>Has your proposal, renewal or reinstatement for life, disability, accident, critical illness or health insurance made to any company ever been declined, postponed or modified in anyway?</p>
                                          </div>
                                          <div class="col-xs-12 col-md-4">
                                             <div class="row">
                                                <div class="col-xs-6 et-pad-right-reduce-7">
                                                   <a  href="#" class="btn et-btn-medic et-btn-medic-yes" data-current-target="et-medi-question-3" data-next-target="" title="Yes"  data-toggle="modal" data-target="#cannot-apply-modal">Yes</a>
                                                </div>
                                                <div class="col-xs-6 et-pad-left-reduce-7">
                                                   <a href="#" class="btn et-btn-medic et-btn-medic-no last" title="No" data-current-target="et-medi-question-3" data-next-target="">No</a>
                                                </div>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                              
                           </div>
                           
                           <div class="et-medical-next-brn next-btn">
                              <button id="et-medical-dec-next" type="submit" class="btn next pi et-medic-next hide-element">Next</button>
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
                        <h2>Applicant / Insured person info	
                           <!-- <button type="button" class="tooltip-button btn-app-info-tooltip"  data-container="body" data-toggle="tooltip" data-placement="top" title="Applicant and the insured must be the same person" data-template= 	'<div class="tooltip et-app-info-tooltip" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>'><span class="info-tooltip"></span></button> -->
                           <button type="button" class="tooltip-button btn-app-info-tooltip" title="Applicant and the insured must be the same person" ><span class="info-tooltip"></span></button>
                        </h2>
                        
                        <form id="eliteTermsInsuredInfoForm" method="post" class="form-horizontal" action="" onSubmit="return false;">
                           <div class="row margin">
                              <div class="col-sm-12 col-md-6 left">
                                 
                                 <div class="clearfix">
                                    <div class="left-desktop description">
                                       <label for="give-last-name" class="application-page-input-text et-input-label">Name in English <span class="hidden-xs hidden-sm">Same as HKID</span></label>
                                    </div>
                                    <div class="left-desktop text-box">
                                       <input class="form-control gray-textbox" id="savieApplicantBean.firstName" name="savieApplicantBean.firstName" type="text" placeholder="Given Name " value="">
                                       <span class="error-msg" id="savieApplicantBeanFirstNameMsg"><small class="help-block hide-element">English first name is required.</small></span>
                                       <input class="form-control gray-textbox" id="savieApplicantBean.lastName" name="savieApplicantBean.lastName" type="text" placeholder="Last Name " value="">
                                       <span class="error-msg" id="savieApplicantBeanlastNameMsg"><small class="help-block hide-element">English last name is required.</small></span>
                                    </div>
                                 </div>
                                 
                                 <div class="clearfix">
                                    <div class="left-desktop description">
                                       <label for="savieApplicantBean.chineseName" class="application-page-input-text et-input-label">Name in Chinese <span class="hidden-xs hidden-sm">Same as HKID</span></label>
                                    </div>
                                    <div class="left-desktop text-box">
                                       <input class="form-control gray-textbox" id="savieApplicantBean.chineseName" name="savieApplicantBean.chineseName" type="text" placeholder="Name in Chinese " value="" >
                                       <span class="error-msg" id="savieApplicantBeanchineseNameMsg"><small class="help-block hide-element">Chinese name is required.</small></span>
                                    </div>
                                 </div>
                                 
                                 <div class="clearfix form-group">
                                    <div class="left-desktop description">
                                       <label for="savieApplicantBean.chineseName" class="application-page-input-text et-input-label">Date of birth</label>
                                    </div>
                                    <div class="left-desktop text-box et-date-info">
                                       <input type="text" class="date form-control gray-textbox" name="dob" id="sales-illu-dob" placeholder="DD-MM-YYYY " onfocusin="fnSetStyle()" readonly  />
                                       <span class="error-msg" id="sales-illu-dob-msg"><small class="help-block hide-element">Date of birth is required.</small></span>
                                    </div>
                                 </div>
                                 
                                 <div class="clearfix hidden-xs hidden-sm">
                                    <div class="left-desktop description">
                                       <label for="savieApplicantBean.gender" class="application-page-input-text et-input-label">Gender</label>
                                    </div>
                                    <div class="left-desktop text-box ">
                                       <div class="gender-section">
                                          <div class="clearfix">
                                             <div class="pull-left male">
                                                <label class="pi-male-radio" for="pi-male-now">
                                                <input type="radio" id="pi-male-now" name="savieApplicantBean.gender" value="pi-male-now" checked>
                                                <span class="pi-male-text">
                                                   <span class="text">Male</span>
                                                </span>
                                                </label>
                                                <div class="descriptions male">
                                                   <span class="desktop-text">Male</span>
                                                </div>
                                             </div>
                                             <div class="pull-left female">
                                                <label class="pi-female-radio" for="pi-female-now">
                                                <input type="radio" id="pi-female-now" name="savieApplicantBean.gender" value="pi-female-now" >
                                                <span class="pi-female-text">
                                                   <span class="text">Female</span>
                                                </span>
                                                </label>
                                                <div class="descriptions female">
                                                   <span class="desktop-text">Female</span>
                                                </div>
                                                
                                             </div>
                                             <span class="error-msg" id="genderMessage"></span>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                                 
                                 <div class="clearfix form-group has-error">
                                    <div class="left-desktop description">
                                       <label for="savieApplicantBean.hkId" class="application-page-input-text et-input-label">HKID</label>
                                    </div>
                                    <div class="left-desktop text-box">
                                       <input class="form-control gray-textbox" id="savieApplicantBean.hkId" name="savieApplicantBean.hkId" type="text" placeholder="X123456(7)" pattern="^([A-Z0-9])*$" >
                                       <span class="error-msg" id="hkidMessage"></span>
                                    </div>
                                 </div>
                                 
                                 <div class="clearfix  form-group has-error">
                                    <div class="left-desktop description">
                                       <label for="savieApplicantBean.maritalStatus" class="application-page-input-text et-input-label">Marital status</label>
                                    </div>
                                    <div class="left-desktop text-box">

                                       <div class="selectDiv">
                                          <span class="icon-chevron-thin-down orange-caret"></span>
                                          <select class="form-control gray-dropdown" name="savieApplicantBean.maritalStatus"  id="savieApplicantBean.maritalStatus">
                                             <option selected disabled value="">- Please select -</option>
                                             <option value="single">Single</option>
                                             <option value="married">Married</option>	
                                          </select>
                                       </div>
                                       <span class="error-msg" id="maritalStatusMessage"></span>
                                    </div>
                                 </div>
                              
                                 <div class="clearfix form-group has-error">
                                    <div class="left-desktop description">
                                       <label for="savieApplicantBean.placeOfBirth" class="application-page-input-text et-input-label">Place of birth</label>
                                    </div>
                                    <div class="left-desktop text-box">
                                       <div class="selectDiv">
                                          <span class="icon-chevron-thin-down orange-caret"></span>
                                          <select class="form-control gray-dropdown" data-style="application-select selection" id="savieApplicantBean.placeOfBirth" name="savieApplicantBean.placeOfBirth">
                                             <option selected disabled value="">- Please select -</option>
                                             <option value="US">US</option>
                                             <option value="Germany">Germany</option>	
                                          </select>
                                       </div>
                                       <span class="error-msg" id="placeOfBirthMessage"></span>
                                    </div>
                                 </div>
                                 
                                 <div class="clearfix form-group has-error">
                                    <div class="left-desktop description">
                                       <label for="savieApplicantBean.nationality" class="application-page-input-text et-input-label">Nationality</label>
                                    </div>
                                    <div class="left-desktop text-box">
                                       <div class="selectDiv">
                                          <span class="icon-chevron-thin-down orange-caret"></span>
                                          <select class="form-control gray-dropdown"  data-style="application-select selection" id="savieApplicantBean.nationality" name="savieApplicantBean.nationality">
                                             <option selected disabled value="">- Please select -</option>
                                             <option value="US">US</option>
                                             <option value="Germany">Germany</option>	
                                          </select>
                                       </div>
                                       <span class="error-msg" id="nationalityMessage"></span>
                                    </div>
                                 </div>
                                 
                                 <div class="clearfix">
                                    <div class="left-desktop right-description">
                                       <label for="savieApplicantBean.residentialTelNo" class="application-page-input-text et-input-label">Residential tel no.</label>
                                    </div>
                                    <div class="left-desktop text-box clearfix">
                                       <div class="pull-left prefix">
                                          <input class="form-control gray-textbox" id="residential-first" name="savieApplicantBean[0].residentialTelNo" type="text" placeholder="852" onchange="getResidentialFinalValue()" maxlength="3" oninput="maxLengthCheck(this)"  max="999" min ="1"/>
                                       </div>
                                       <div class="pull-left suffix">
                                          <input class="form-control gray-textbox" id="residential-second" name="savieApplicantBean[1].residentialTelNo" type="text" placeholder="12345678" onchange="getResidentialFinalValue()" maxlength="8" oninput="maxLengthCheck(this)"  max="99999999" min ="1"/>
                                       </div>
                                       <span class="error-msg" id="resPrefixMessage"></span>
                                          <span class="error-msg" id="resSuffixMessage"></span>
                                    </div>
                                    
                                 </div>
                           
                                 <div class="clearfix form-group has-error">
                                    <div class="left-desktop right-description">
                                       <label for="savieApplicantBean.mobileNo" class="application-page-input-text et-input-label">Mobile no.</label>
                                    </div>
                                    <div class="left-desktop text-box">
                                       <div class="clearfix form-group">
                                          <div class="pull-left prefix">
                                             <input class="form-control gray-textbox" id="mobile-first" name="savieApplicantBean[0].mobileNo" type="text" placeholder="852" onchange="getMobileFinalValue()" maxlength="3" oninput="maxLengthCheck(this)"  max="999" min ="1"/>
                                          </div>
                                          <div class="pull-left suffix">
                                             <input class="form-control gray-textbox" id="mobile-second" name="savieApplicantBean[1].mobileNo" type="text" placeholder="12345678" onchange="getMobileFinalValue()" maxlength="8" oninput="maxLengthCheck(this)"  max="99999999" min ="1"/>
                                          </div>
                                          <input id="savieApplicantBean.mobileNo" name="savieApplicantBean.mobileNo" value="" type="hidden" />
                                          <span class="error-msg" id="mobilePrefixMessage"></span>
                                          <span class="error-msg" id="mobileSuffixMessage"></span>
                                       </div>
                                    </div>
                                 </div>
                                 
                                 <div class="clearfix form-group has-error hidden-xs hidden-sm">
                                    <div class="left-desktop right-description">
                                       <label for="savieApplicantBean.emailAddress" class="application-page-input-text et-input-label">Email address</label>
                                    </div>
                                    <div class="left-desktop text-box">
                                       <input class="form-control gray-textbox" id="savieApplicantBean.emailAddress" name="savieApplicantBean.emailAddress" type="text" placeholder="Email address">
                                       <span class="error-msg" id="emailMessage"></span>
                                    </div>
                                 </div>
                              </div>
                              <div class="col-sm-12 col-md-6 right">
                                 <div class="clearfix form-group has-error">
                                    <div class="left-desktop right-description">
                                       <label for="inputdefault" class="application-page-input-text et-input-label">Permanent address</label>
                                    </div>
                                    <div class="left-desktop text-box">
                                       <input class="form-control gray-textbox residential" id="savieApplicantBean.permanentAddress1" name="savieApplicantBean.permanentAddress1" type="text" placeholder="Line 1">
                                       <span class="error-msg" id="resLine1Message"></span>
                                       <input class="form-control gray-textbox residential" id="savieApplicantBean.permanentAddress2" name="savieApplicantBean.permanentAddress2" type="text" placeholder="Line 2">
                                       <input class="form-control gray-textbox residential" id="savieApplicantBean.permanentAddress3" name="savieApplicantBean.permanentAddress3" type="text" placeholder="Line 3">
                                       <div class="selectDiv">
                                          <span class="icon-chevron-thin-down orange-caret"></span>
                                          <select class="form-control gray-dropdown"  data-style="application-select selection" name="savieApplicantBean.permanentAddress" id="savieApplicantBean.permanentAddress">
                                             <option selected disabled value="">District</option>
                                             <option value="US">US</option>
                                             <option value="Germany">Germany</option>	
                                          </select>
                                       </div>
                                       <span class="error-msg" id="perAddressMessage"></span>
                                       <span class="warning-note"><span class="orange">*</span> No P.O. Box address allowed</span>
                                    </div>
                                 </div>
                                 
                                 <div class="clearfix form-group has-error">
                                    <div class="left-desktop right-description">
                                       <label for="inputdefault" class="application-page-input-text et-input-label">Residential address</label>
                                    </div>
                                    <div class="left-desktop text-box">
                                       <input class="form-control gray-textbox residential" id="savieApplicantBean.residentialAdress1" name="savieApplicantBean.residentialAdress1" type="text" placeholder="Line 1">
                                       <span class="error-msg" id="resLine1Message"></span>
                                       <input class="form-control gray-textbox residential" id="savieApplicantBean.residentialAdress2" name="savieApplicantBean.residentialAdress2" type="text" placeholder="Line 2">
                                       <input class="form-control gray-textbox residential" id="savieApplicantBean.residentialAdress3" name="savieApplicantBean.residentialAdress3" type="text" placeholder="Line 3">
                                       <div class="selectDiv">
                                          <span class="icon-chevron-thin-down orange-caret"></span>
                                          <select class="form-control gray-dropdown"  data-style="application-select selection" name="savieApplicantBean.residentialDistrict" id="savieApplicantBean.residentialDistrict">
                                             <option selected disabled value="">District</option>
                                             <option value="US">US</option>
                                             <option value="Germany">Germany</option>	
                                          </select>
                                       </div>
                                       <span class="error-msg" id="resDistrictMessage"></span>
                                       <span class="warning-note"><span class="orange">*</span> No P.O. Box address allowed</span>
                                    </div>
                                 </div>
                                 
                                 <div class="clearfix">
                                    <div class="left-desktop description">
                                       
                                    </div>
                                    <div class="left-desktop check-box">
                                       <div class="checkbox-section">
                                          <div class="clearfix">
                                             <div class="pull-left left-checkbox">
                                                <input type="checkbox" value="None" id="savieApplicantBean.addressIsSame" name="savieApplicantBean.addressIsSame" />
                                                <label for="savieApplicantBean.addressIsSame"></label>
                                             </div>
                                             <div class="pull-left right-checkbox">
                                                <span class="checkbox-text">My correspondence address is different as my residential address</span>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                                 
                                 <div class="clearfix form-group has-error hidden et-correspondence-address" id="correspondence-address">
                                    <div class="left-desktop right-description">
                                       <label for="inputdefault" class="application-page-input-text et-input-label">Correspondence address</label>
                                    </div>
                                    <div class="left-desktop text-box">
                                       <input class="form-control gray-textbox residential" id="savieApplicantBean.correspondenceAdress1" name="savieApplicantBean.correspondenceAdress1" type="text" placeholder="Line 1">
                                       <span class="error-msg" id="resLine1Message"></span>
                                       <input class="form-control gray-textbox residential" id="savieApplicantBean.correspondenceAdress2" name="savieApplicantBean.correspondenceAdress2" type="text" placeholder="Line 2">
                                       <input class="form-control gray-textbox residential" id="savieApplicantBean.correspondenceAdress3" name="savieApplicantBean.correspondenceAdress3" type="text" placeholder="Line 3">
                                       
                                       <div class="selectDiv">
                                          <span class="icon-chevron-thin-down orange-caret"></span>
                                          <select class="form-control gray-dropdown"  data-style="application-select selection" name="savieApplicantBean.correspondenceDistrict" id="savieApplicantBean.correspondenceDistrict">
                                             <option selected disabled value="">District</option>
                                             <option value="US">US</option>
                                             <option value="Germany">Germany</option>	
                                          </select>
                                       </div>
                                       <span class="error-msg" id="correspondenceDistricttMessage"></span>
                                       <span class="warning-note"><span class="orange">*</span> No P.O. Box address allowed</span>
                                    </div>
                                 </div>
                                 
                              </div>		
                           </div>
                           <div class="next-btn">
                              <button id="et-personal-info-next" type="submit" class="btn next pi">Next</button>
                           </div>
                        </form>
                     </div>
                  </div>
                  
                  <!--EMPLOYEMENT INFO SECTION-->
                  <div id="et-employment-info-section" class="hide-element">
                     <div class="page-divider"></div>
                     
                     <!--Employement Info Widget-->
                     <div id="employment-info" class="page-application container-fluid fwd-container et-employement-info">
                        <h2 class="text-center">Employment Info &amp; Education level</h2>
                        <form class="content"  id="etEmploymentInfoForm" method="post" action="" onsubmit="return false">
                           <div class="content-left">
                              <div class="clearfix form-group has-error employment-info-row">
                                 <label for="savieEmploymentBean.employmentStatus">Employment status</label>
                                 <div class="selectEmployment">
                                    <span class="icon-chevron-thin-down orange-caret"></span>
                                    <select class="form-control gray-dropdown" id="savieEmploymentBean.employmentStatus" name="savieEmploymentBean.employmentStatus" data-style="application-select">
                                       <option selected disabled value="">- Please select -</option>
                                       <option value="employed">Employed</option>
                                       <option value="self-employed">Self Employed</option>	
                                       <option value="unemployed">Unemployed</option>	
                                    </select>
                                 </div>
                                 <span class="error-msg" id="employmentStatusMessage"></span>
                              </div>
                              <div class="clearfix form-group has-error employment-info-row et-emp-info-occupation-container">
                                 <label for="savieEmploymentBean.occupation">Occupation</label>
                                 <div class="selectEmployment">
                                    <span class="icon-chevron-thin-down orange-caret"></span>
                                    <select class="form-control gray-dropdown" id="savieEmploymentBean.occupation" name="savieEmploymentBean.occupation" data-style="application-select">
                                       <option selected disabled value="">- Please select -</option>
                                       <option value="it">IT</option>
                                       <option value="others">Others</option>	
                                    </select>
                                 </div>
                                 <span class="error-msg" id="occupationMessage"></span>
                              </div>
                              <div class="clearfix form-group has-error employment-info-row et-emp-info-liq-assets-container hide-element ">
                                 <label for="savieEmploymentBean.liquidAssets">Liquid assets</label>
                                 <div class="selectEmployment">
                                    <span class="icon-chevron-thin-down orange-caret"></span>
                                    <select class="form-control gray-dropdown" id="savieEmploymentBean.liquidAssets" name="savieEmploymentBean.liquidAssets" data-style="application-select">
                                       <option selected disabled value="">- Please select -</option>
                                       <option value="asset1">Asset 1</option>
                                       <option value="asset2">Asset 2</option>	
                                    </select>
                                 </div>
                                 <span class="error-msg" id="liquidAssets"></span>
                              </div>
                              <div class="clearfix form-group has-error employment-info-row">
                                 <label for="savieEmploymentBean.educationLevel">Education level</label>
                                 <div class="selectEmployment">
                                    <span class="icon-chevron-thin-down orange-caret"></span>
                                    <select class="form-control gray-dropdown" id="savieEmploymentBean.educationLevel" name="savieEmploymentBean.educationLevel" data-style="application-select">
                                       <option selected disabled value="">- Please select -</option>
                                       <option value="college-graduate">College Graduate</option>
                                       <option value="master-degree-holder">Masters Degree Holder</option>	
                                    </select>
                                 </div>
                                 <span class="error-msg" id="educationLevelMessage"></span>
                              </div>
                           </div>
                           <div class="content-right">
                              <div class="clearfix form-group has-error employment-info-row et-emp-info-nat-business-container">
                                 <label for="savieEmploymentBean.natureOfBusiness">Nature of business</label>
                                 <div class="selectEmployment">
                                    <span class="icon-chevron-thin-down orange-caret"></span>
                                    <select class="form-control gray-dropdown" id="savieEmploymentBean.natureOfBusiness" name="savieEmploymentBean.natureOfBusiness" data-style="application-select">
                                       <option selected disabled value="">- Please select -</option>
                                       <option value="it">IT</option>
                                       <option value="others">Others</option>	
                                    </select>
                                 </div>
                                 <span class="error-msg" id="natureOfBusinessMessage"></span>
                              </div>
                              <div class="clearfix form-group has-error employment-info-row et-emp-info-mon-income-container">
                                 <label for="savieEmploymentBean.monthlyPersonalIncome" class="monthly-income">Monthly personal income (HK$)</label>
                                 <div class="selectEmployment">
                                    <span class="icon-chevron-thin-down orange-caret"></span>
                                    <select class="form-control gray-dropdown" id="savieEmploymentBean.monthlyPersonalIncome" name="savieEmploymentBean.monthlyPersonalIncome" data-style="application-select">
                                       <option selected disabled value="">- Please select -</option>
                                       <option value="10,000">10,000</option>
                                       <option value="others">Others</option>	
                                    </select>
                                 </div>
                                 <span class="error-msg" id="monthlyIncomeMessage"></span>
                              </div>
                           </div>
                           <div class="button-row text-center">
                                 <button id="et-employment-info-next" type="submit" class="next">Next</button>
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
                           <h2 class="text-center">Beneficiary info <button type="button" class="tooltip-button btn-beneficiary-tooltip" title="Beneficiary Info"><span class="info-tooltip"></span></button></h2>
                           <h4 class="text-center">You can add up to three (3) persons</h4>
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
                                             <span class="text">Own Estate</span>
                                          </span>
                                          </label>
                                          <span class="description">
                                             Own Estate
                                          </span>
                                       </div>
                                       <div class="left-desktop">
                                          <label class="name-others-radio" for="name-others-now">
                                          <input type="radio" id="name-others-now" name="beneficiary-info" value="name-others-now" checked>
                                          <span class="name-others-text">
                                             <span class="text">Name Others</span>
                                          </span>
                                          </label>
                                          <span class="description">
                                             Name Others
                                          </span>
                                       </div>
                                    </div>
                                 </div>
                                 <div id="beneficiary-contents" class="">
                                    <h3 class="mobile-desc hidden-md hidden-lg">Beneficiary <span>(Person 1)</span></h3>
                                    <div class="form-group has-error beneficiary-info-row">
                                       <label for="savieBeneficiaryBean[0].firstName">Name in English</label>
                                       <input type="text" id="savieBeneficiaryBean[0].fullName" hidden>
                                       <input type="text" id="savieBeneficiaryBean[0].firstName" name="savieBeneficiaryBean[0].firstName" onchange="getBeneficiaryFullName0()" class="form-control gray-textbox form-textbox" placeholder="Given name" maxlength="25">
                                       <span class="error-msg" id="beneficiaryFnameMessage[0]"></span>
                                       <input type="text" id="savieBeneficiaryBean[0].lastName" name="savieBeneficiaryBean[0].lastName" onchange="getBeneficiaryFullName0()" class="form-control gray-textbox" placeholder="Last name" maxlength="25">
                                       <span class="error-msg" id="beneficiaryLnameMessage[0]"></span>
                                       <span class="dup-error-msg hidden" id="duplicate-english-name[0]">Duplicate English Name</span>
                                    </div>
                                    <div class="form-group has-error beneficiary-info-row">
                                       <label for="savieBeneficiaryBean[0].chineseName">Name in Chinese <span class="optional">(optional)</span></label>
                                       <input type="text" id="savieBeneficiaryBean[0].chineseName" name="savieBeneficiaryBean[0].chineseName" class="form-control gray-textbox form-textbox" placeholder="Name in Chinese">
                                       <span class="error-msg" id="beneficiaryChineseNameMessage[0]"></span>
                                       <span class="dup-error-msg hidden" id="duplicate-chinese-name[0]">Duplicate Chinese Name</span>
                                    </div>
                                    <div class="form-group beneficiary-info-row">
                                       <label for="savieBeneficiaryBean[0].hkId">HKID / Passport No</label>
                                       <!--<select class="selectpicker" id="savieBeneficiaryBean[0].hkId" name="savieBeneficiaryBean[0].hkId" data-style="application-select">
                                          <option disabled selected>- Please select -</option>
                                          <option>Lorem ipsum</option>
                                          <option>Lorem ipsum</option>
                                       </select>-->
                                       <!--<input type="text" id="savieBeneficiaryBean[0].hkId" name="savieBeneficiaryBean[0].hkId" class="form-control gray-textbox form-textbox" placeholder="HKID/Passport No" value="">-->
                                       <div class="clearfix et-hkid-pass">
                                          <div class="pull-left select">
                                             <div class="selectDiv">
                                                <span class="icon-chevron-thin-down orange-caret"></span>
                                                <select class="form-control gray-dropdown" id="beneficiaryHkidPassport[0]">
                                                   <option selected value="HKID">HKID</option>
                                                   <option value="Passport">Passport No</option>	
                                                </select>
                                             </div>
                                          </div>
                                          <div class="pull-left input">
                                             <input class="form-control gray-textbox" type="text" placeholder="HKID/Passport No" id="savieBeneficiaryBean[0].hkId" name="savieBeneficiaryBean[0].hkId" value="">
                                             <input class="form-control gray-textbox hidden" type="text" placeholder="HKID/Passport No" id="savieBeneficiaryBean[0].passportNo" name="savieBeneficiaryBean[0].passportNo" value="">
                                          </div>
                                       </div>
                                       <span class="error-msg" id="bnfPassportMessage[0]"></span>
                                       <span class="error-msg" id="hkidOrPassportMessage[0]"></span>
                                       <span class="dup-error-msg hidden" id="duplicate-beneficiaries[0]">Duplicate Beneficiaries HKID</span>
                                       <span class="dup-error-msg hidden" id="duplicate-beneficiariesPAssport[0]">Duplicate Beneficiaries Passport</span>
                                    </div>
                                    
                                    <div class="beneficiary-info-row">
                                       <label for="savieBeneficiaryBean[0].gender">Gender</label>
                                       <div id="gender-0" class="clearfix radio-buttons">
                                          <input type="radio" name="savieBeneficiaryBean[0].gender" value="male" id="male-0" checked>
                                          <label for="male-0" class="male-0" >
                                             <span class="hidden-lg hidden-md">Male</span>
                                             <span class="orange-hover hidden-xs hidden-sm pull-left"></span>
                                          </label>
                                          <span id="male-label-0" class="pull-left second-label">Male</span>

                                          <input type="radio" name="savieBeneficiaryBean[0].gender" value="female" id="female-0">
                                          <label for="female-0" class="female">
                                             <span class="hidden-lg hidden-md">Female</span>
                                             <span class="orange-hover hidden-xs hidden-sm pull-left"></span>
                                          </label>
                                          <span id="female-label-0" class="pull-left second-label-female">Female</span>
                                       </div>
                                    </div>
                                    <div class="form-group has-error beneficiary-info-row relationship">
                                       <label for="savieBeneficiaryBean[0].relationship">Relationship with you</label>
                                       <!--<select class="selectpicker" id="savieBeneficiaryBean[0].relationship" name="savieBeneficiaryBean[0].relationship" data-style="application-select">
                                          <option disabled selected>- Please select -</option>
                                          <option>Lorem ipsum</option>
                                          <option>Lorem ipsum</option>
                                       </select>-->
                                       <div class="selectBeneficiary">
                                          <span class="icon-chevron-thin-down orange-caret"></span>
                                          <select class="form-control gray-dropdown"  id="savieBeneficiaryBean[0].relationship" name="savieBeneficiaryBean[0].relationship" data-style="application-select">
                                             <option selected disabled value="">- Please select -</option>
                                             <option value="father">Father</option>
                                             <option value="mother">Mother</option>	
                                          </select>
                                       </div>
                                       <span class="error-msg" id="relationshipMessage[0]"></span>
                                    </div>
                                    <div class="form-group has-error beneficiary-info-row entitle">
                                       <label for="savieBeneficiaryBean[0].entitlement">Entitlement (%)</label>
                                       <input type="number" id="savieBeneficiaryBean[0].entitlement" name="savieBeneficiaryBean[0].entitlement" class="form-control gray-textbox percentage" placeholder="100%" value="" maxlength="3" oninput="maxLengthCheck(this)"  max="101" min ="1"/>
                                       <span class="error-msg" id="entitlementMessage[0]"></span>
                                    </div>		                
                                 </div>
                              </div>
                              </form>
                              
                              
                              <div id="add-beneficiary-1" class="col-md-4">
                                 <div class="add-beneficiary" id="beneficiary1">
                                    <button id="add-beneficiary-button-2" value="1" class="circle" type="button"><img src="assets/images/orange-plus.png"></button>
                                    <div class="add-beneficiary-text"><h4>Add beneficiary</h4></div>
                                 </div>
                              </div>

                              <div id="add-beneficiary-2" class="col-md-4 last-row">  
                                 <div class="add-beneficiary" id="beneficiary2">
                                    <button id="add-beneficiary-button-3" value="2" class="circle" type="button"><img src="assets/images/orange-plus.png"></button>
                                    <div class="add-beneficiary-text"><h4>Add beneficiary</h4></div>
                                 </div>
                              </div>
                           </div>
                           <div class="button-row text-center btn-beneficiary">
                              <button id="et-beneficiary-info-next" type="button" class="next">Next</button><!--Bind a click event temporarily to show the hidden Declaration & authorization section-->
                           </div>              
                     </div>
                  </div> <!--END OF BENEFICIARIES INFO SECTION-->
               
               </div><!--END OF APPLICATION INFO FORM-->
            
            </div><!--END OF MEDICAL, APPLICATION INFO, EMPLOYMENT INFO, & BENEFICIARY INFO SECTION-->
            
            <!--DECLARATION AND AUTHORIZATION PAGE-->
            <div class="container-fluid fwd-container hide-element" id="et-application-second-section">
               <div class="declare-authorize page-application et-declaration-section">
                  <h2>Declaration & authorization</h2>
                  <div class="agreement-description">						
                     <h4>Declaration - Personal Information Collection Statement </h4>
                     <div class="clearfix declaration">
                        <div class="pull-left pics-check">
                           <input type="checkbox" value="pics" id="pics-check" name="isPics" />
                           <label for="pics-check"></label>
                        </div>
                        <div class="pull-left pics-desc">
                           I have read and I understand and accept this <a href="#" class="link"> Personal Information Collection Statement.</a>
                        </div>
                     </div>
                     
                     <h4 class="policy-replace">Policy replacement declarations</h4>
                     <div class="policy-desc bottom">
                        Have you, in the past 12 months, replaced any or a substantial part of your existing life insurance policy upon this application?
                     </div>
                     
                     <div class="clearfix">
                        <div class="left-desktop no">
                           <div class="clearfix">
                              <div class="pull-left policy-replace-check">
                                 <input type="checkbox" value="cancellation" id="no-policy-replace-check" name="isCancel" />
                                 <label for="no-policy-replace-check"></label>
                              </div>
                              <div class="pull-left policy-replace-desc">
                                 No
                              </div>
                           </div>
                        </div>
                        <div class="left-desktop yes">
                           <div class="clearfix yes-policy">
                              <div class="pull-left yes-policy-replace-check">
                                 <input type="checkbox" value="cancellation" id="yes-policy-replace-check" name="isCancel" disabled/>
                                 <label for="yes-policy-replace-check"></label>
                              </div>
                              <div class="pull-left yes-policy-replace-desc">
                                 Yes (Please call customer service hotline <span class="orange-number">3123-3123</span>)
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="policy-desc bottom">
                        Do you, in the next 12 months, intend to replace any or a substantial part of your existing life insurance policy upon this application?
                     </div>
                     
                     <div class="clearfix">
                        <div class="left-desktop no">
                           <div class="clearfix">
                              <div class="pull-left policy-replace-check">
                                 <input type="checkbox" value="cancellation" id="no-policy-replace-existing-check" name="isCancel" />
                                 <label for="no-policy-replace-existing-check"></label>
                              </div>
                              <div class="pull-left policy-replace-desc">
                                 No
                              </div>
                           </div>
                        </div>
                        <div class="left-desktop yes">
                           <div class="clearfix yes-policy">
                              <div class="pull-left yes-policy-replace-check">
                                 <input type="checkbox" value="cancellation" id="yes-policy-replace-existing-check" name="isCancel" disabled/>
                                 <label for="yes-policy-replace-existing-check"></label>
                              </div>
                              <div class="pull-left yes-policy-replace-desc">
                                 Yes (Please call customer service hotline <span class="orange-number">3123-3123</span>)
                              </div>
                           </div>
                        </div>
                     </div>
                     
                     <div class="clearfix"></div>
                     
                     <h4>Declaration - Cancellation Right and Refund of Premium(s)  </h4>
                     <div class="clearfix declaration">
                        <div class="pull-left cancellation-check">
                           <input type="checkbox" value="cancellation" id="cancellation-check" name="isCancel" />
                           <label for="cancellation-check"></label>
                        </div>
                        <div class="pull-left cancellation-desc">
                           I understand that I have the right to cancel and obtain a refund of any premium(s) paid less any market value adjustments by giving written notice. Such notice must be signed by me and received directly by FWD Life Insurance Company (Bermuda) Limited at 1/F., FWD Financial Centre, 308 Des Voeux Road Central, Hong Kong within 21 days after the delivery of the policy or issue of a Notice to the policyholder or the policyholders representative, whichever is the earlier.
                        </div>
                     </div>

                     
                     <h4 class="application">Application</h4>
                     
                     <div class="clearfix declaration application-declaration sub-header">
                        <div class="pull-left cancellation-check">
                           <input type="checkbox" value="cancellation" id="application-declaration" name="isCancel" />
                           <label for="application-declaration"></label>
                        </div>
                        <div class="pull-left cancellation-desc">
                           <h5 class="declare-agree">I hereby DECLARE and AGREE that:</h5>
                        </div>
                     </div>
                     <div class="clearfix declaration application-declaration">
                        <div class="pull-left cancellation-check">
                           
                        </div>
                        <div class="pull-left cancellation-desc">
                           <div class="clearfix">
                              <div class="pull-left span">
                                 <span class="order">i</span>
                              </div>
                              <div class="pull-left text">
                                 The answers to all the above questions are complete, true and accurate and are given to the best of my knowledge and belief;
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
                                 <span class="order">ii</span>
                              </div>
                              <div class="pull-left text">
                                 I have the duty to immediately inform the Company and correct the answers to the above questions if they have become incomplete, untrue and inaccurate subsequently before any policy is issued;
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
                                 <span class="order">iii</span>
                              </div>
                              <div class="pull-left text">
                                 Any payment made in connection with this application does not guarantee immediate approval of the coverage applied for. The insurance coverage applied for shall only take effect when the relevant policy has been issued and the initial premium paid (including any additional initial premium payable due to revisions of the policy terms and conditions) [during my or the Insured's (if different) life time and whilst I and or the Insured (if different)is in good health].
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
                                 I/We hereby declare and confirm that the Policy Owner is the beneficial owner of this Policy(ies) and I am not acting or holding this policy on behalf of any other person including legal person or trust.
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
                           I/We hereby declare and confirm that the Policy Owner is the beneficial owner of this Policy(ies) and I am not acting or holding this policy on behalf of any other person including legal person or trust. 
                        </div>
                     </div>
                     
                     <div class="page-divider"></div>
                     
                     <h5>If you do NOT wish FWD Life Insurance Company (Bermuda) Limited to use Your Personal Data in direct marketing or provide Your Personal Data to other persons or companies for their use in direct marketing, please tick the appropriate box(es) below to exercise</h5>
                     
                     <div class="clearfix authorization">
                        <div class="pull-left marketing-info-check">
                           <input type="checkbox" value="marketing-info" id="marketing-info-check" name="isMarketingInfo"  />
                           <label for="marketing-info-check"></label>
                        </div>
                        <div class="pull-left marketing-info-desk">
                           Please do not send direct marketing information to me.
                        </div>
                     </div>
                     
                     <div class="clearfix authorization">
                        <div class="pull-left personal-data-check">
                           <input type="checkbox" value="personal-data" id="personal-data-check" name="isPersonalData" />
                           <label for="personal-data-check"></label>
                        </div>
                        <div class="pull-left personal-data-desc">
                           Please do not provide my personal data to other persons or companies for their use in direct marketing.
                        </div>
                     </div>
                     
                     <div class="row et-proceed-btn-wrapper">
                        <div class="col-xs-12 col-md-6 proceed-btn text-center">
                           <button id="et-app-sum-proceed-btn" type="button" class="btn next et-btn-view-summary">View summary</button> <!--Bind a click event temporarily to show the hidden Application Summary section-->
                        </div>
                        <div class="col-xs-12 col-md-6 proceed-btn text-center">
                           <button id="et-declaration-proceed-btn" type="button" class="btn next et-btn-confirm-sign">Confirm and sign</button> <!--Bind a click event temporarily to show the hidden Application Summary section-->
                        </div>
                     </div>
                     
                  </div>
               </div>
            </div><!--END OF DECLARATION AND AUTHORIZATION PAGE-->
            
            <!-- APPLICATION SUMMARY SECTION -->
            <div id="et-application-third-section" class="hide-element">
               <div class="" id="application-summary">
                  <div class="modal-dialog container-fluid fwd-container" role="document">
                     <div class="summary-content">
                        <div class="summary-header">
                           <h4 class="text-center">Application summary</h4>
                        </div>
                        <div class="page-divider hidden-xs hidden-sm"></div>
                        <div class="summary-body">

                           <!-- PLAN DETAIL -->
                              <div class="summary-body-item">
                                 <h3 class="plan-detail">Plan detail <a href="#" title="Edit" class="et-app-sum-edit" data-target="#et-plan-option-section">Edit</a></h3>
                                 <div class="clearfix plan-detail-holder">
                                    <h4 class="info-label">Selected plan</h4>
                                    <p class="info" id="etaspd-selected-plan">Elite term</p>
                                 </div>
                                 <div class="clearfix plan-detail-holder">
                                    <h4 class="info-label">Age range</h4>
                                    <p class="info" id="etaspd-age-range">Up to 95</p>
                                 </div>
                                 <div class="clearfix plan-detail-holder">
                                    <h4 class="info-label">Insured amount</h4>
                                    <p class="info" id="etaspd-insured-amount"></p>
                                 </div>
                                 <div class="clearfix plan-detail-holder">
                                    <h4 class="info-label">Monthly premium</h4>
                                    <p class="info" id="etaspd-monthly-premium">HK$ 1000</p>
                                 </div>
                              </div>
                           <!-- PLAN DETAIL END-->

                           <!-- PERSONAL INFO -->
                           <div class="summary-body-item">
                              <h3 class="personal-info">Personal Info <a href="#" title="Edit" class="et-app-sum-edit" data-target="#et-application-info-section">Edit</a></h3>
                              <h4 class="clearfix info-holder-title">Name in English</h4>
                              <div class="clearfix info-holder">
                                 <h4 class="info-label">Last Name</h4>
                                 <p class="info" id="etaspi-en-lname"></p>
                              </div>
                              <div class="clearfix info-holder">
                                 <h4 class="info-label">Given Name</h4>
                                 <p class="info" id="etaspi-fname"></p>
                              </div>
                              <div class="clearfix info-holder-below">
                                 <h4 class="info-label">Name in Chinese</h4>
                                 <p class="info" id="etaspi-chName"></p>
                              </div>
                              <div class="clearfix info-holder-below">
                                 <h4 class="info-label">HKID</h4>
                                 <p class="info" id="etaspi-hkid"></p>
                              </div>
                              <div class="clearfix info-holder-below">
                                 <h4 class="info-label">Gender</h4>
                                 <p class="info" id="etaspi-gender"></p>
                              </div>
                              <div class="clearfix info-holder-below">
                                 <h4 class="info-label">Smooker/Non-smooker</h4>
                                 <p class="info" id="etaspi-is-smooker"></p>
                              </div>
                              <div class="clearfix info-holder-below">
                                 <h4 class="info-label">Marital status</h4>
                                 <p class="info" id="etaspi-marital-status"></p>
                              </div>
                              <div class="clearfix info-holder-below">
                                 <h4 class="info-label">Date of birth</h4>
                                 <p class="info" id="etaspi-dob"></p>
                              </div>
                              <div class="clearfix info-holder-below">
                                 <h4 class="info-label">Place of birth</h4>
                                 <p class="info" id="etaspi-pob"></p>
                              </div>
                              <div class="clearfix info-holder-below">
                                 <h4 class="info-label">Nationality</h4>
                                 <p class="info" id="etaspi-nationality"></p>
                              </div>
                              <div class="clearfix info-holder-below">
                                 <h4 class="info-label">Email address</h4>
                                 <p class="info" id="etaspi-email"></p>
                              </div>
                              <div class="clearfix info-holder-below">
                                 <h4 class="info-label">Telephone no</h4>
                                 <p class="info" id="etaspi-tel-no"></p>
                              </div>
                              <div class="clearfix info-holder-below">
                                 <h4 class="info-label">Mobile no</h4>
                                 <p class="info" id="etaspi-mob-no"></p>
                              </div>
                              <div class="clearfix info-holder-below">
                                 <h4 class="info-label">Permanent address</h4>
                                 <p class="info" id="etaspi-per-add"></p>
                              </div>
                              <div class="clearfix info-holder-below">
                                 <h4 class="info-label">Residential address</h4>
                                 <p class="info" id="etaspi-res-add"></p>
                              </div>
                              <div class="clearfix info-holder-below et-corr-add hide-element">
                                 <h4 class="info-label">Correspondence address</h4>
                                 <p class="info" id="etaspi-corr-add"></p>
                              </div>
                           </div>
                           <!-- PERSONAL INFO END -->

                           <!-- EMPLOYMENT INFO -->
                           <div class="summary-body-item">
                              <h3 class="employment-info">Employment Info <a href="#" title="Edit" class="et-app-sum-edit" data-target="#et-employment-info-section">Edit</a></h3>
                              <div class="clearfix info-holder">
                                 <h4 class="info-label employment">Employment status</h4>
                                 <p class="info" id="etasei-emp-status"></p>
                              </div>
                              <div class="et-stat-unemployed hide-element">
                                 <div class="clearfix info-holder">
                                    <h4 class="info-label employment">Liquid Assets</h4>
                                    <p class="info" id="etasei-liq-asset"></p>
                                 </div>
                              </div>
                              <div class="et-not-stat-unemployed hide-element">
                                 <div class="clearfix info-holder">
                                    <h4 class="info-label employment">Occupation</h4>
                                    <p class="info" id="etasei-occupation"></p>
                                 </div>
                                 <div class="clearfix info-holder">
                                    <h4 class="info-label employment">Nature of business</h4>
                                    <p class="info" id="etasei-nat-business"></p>
                                 </div>
                                 <div class="clearfix info-holder">
                                    <h4 class="info-label employment">Monthly personal income (HK$)</h4>
                                    <p class="info" id="etasei-mon-income"></p>
                                 </div>
                              </div>
                              <div class="clearfix info-holder">
                                 <h4 class="info-label employment">Education level</h4>
                                 <p class="info" id="etasei-edu-level"></p>
                              </div>
                           </div>
                           <!-- EMPLOMENT INFO END -->

                           <!-- BENEFICIARY -->
                           <div class="summary-body-item">
                              <div class="et-person-1 hide-element">
                                 <h3 class="beneficiary">Beneficiary <span>(Person 1)</span> <a href="#" title="Edit" class="et-app-sum-edit" data-target="#et-beneficiary-info-section">Edit</a></h3>
                                 <h4 class="clearfix info-holder-title">Name in English</h4>
                                 <div class="clearfix info-holder">
                                    <h4 class="info-label employment">Last name</h4>
                                    <p class="info" id="etasbi-en-fname-1"></p>
                                 </div>
                                 <div class="clearfix info-holder">
                                    <h4 class="info-label">Given Name</h4>
                                    <p class="info" id="etasbi-en-lname-1"></p>
                                 </div>
                                 <div class="clearfix info-holder">
                                    <h4 class="info-label employment">Name in Chinese</h4>
                                    <p class="info" id="etasbi-ch-name-1"></p>
                                 </div>
                                 <div class="clearfix info-holder">
                                    <h4 class="info-label employment">HKID/Passport No</h4>
                                    <p class="info" id="etasbi-hkid-pass-1"></p>
                                 </div>
                                 <div class="clearfix info-holder-below">
                                    <h4 class="info-label">Relationship</h4>
                                    <p class="info" id="etasbi-relationship-1"></p>
                                 </div>
                                 <div class="clearfix info-holder-below">
                                    <h4 class="info-label">Gender</h4>
                                    <p class="info" id="etasbi-gender-1"></p>
                                 </div>
                                 <div class="clearfix info-holder-below">
                                    <h4 class="info-label">Entitlement (%)</h4>
                                    <p class="info" id="etasbi-entitlement-1"></p>
                                 </div>
                              </div>
                              <div class="et-person-2 hide-element">
                                 <h3 class="beneficiary">Beneficiary <span>(Person 2)</span> <a href="#" title="Edit" class="et-app-sum-edit" data-target="#et-beneficiary-info-section">Edit</a></h3>
                                 <h4 class="clearfix info-holder-title">Name in English</h4>
                                 <div class="clearfix info-holder">
                                    <h4 class="info-label employment">Last name</h4>
                                    <p class="info" id="etasbi-en-fname-2"></p>
                                 </div>
                                 <div class="clearfix info-holder">
                                    <h4 class="info-label">Given Name</h4>
                                    <p class="info" id="etasbi-en-lname-2"></p>
                                 </div>
                                 <div class="clearfix info-holder">
                                    <h4 class="info-label employment">Name in Chinese</h4>
                                    <p class="info" id="etasbi-ch-name-2"></p>
                                 </div>
                                 <div class="clearfix info-holder">
                                    <h4 class="info-label employment">HKID/Passport No</h4>
                                    <p class="info" id="etasbi-hkid-pass-2"></p>
                                 </div>
                                 <div class="clearfix info-holder-below">
                                    <h4 class="info-label">Relationship</h4>
                                    <p class="info" id="etasbi-relationship-2"></p>
                                 </div>
                                 <div class="clearfix info-holder-below">
                                    <h4 class="info-label">Gender</h4>
                                    <p class="info" id="etasbi-gender-2"></p>
                                 </div>
                                 <div class="clearfix info-holder-below">
                                    <h4 class="info-label">Entitlement (%)</h4>
                                    <p class="info" id="etasbi-entitlement-2"></p>
                                 </div>
                              </div>
                              <div class="et-person-3 hide-element">
                                 <h3 class="beneficiary">Beneficiary <span>(Person 3)</span> <a href="#" title="Edit" class="et-app-sum-edit" data-target="#et-beneficiary-info-section">Edit</a></h3>
                                 <h4 class="clearfix info-holder-title">Name in English</h4>
                                 <div class="clearfix info-holder">
                                    <h4 class="info-label employment">Last name</h4>
                                    <p class="info" id="etasbi-en-fname-3"></p>
                                 </div>
                                 <div class="clearfix info-holder">
                                    <h4 class="info-label">Given Name</h4>
                                    <p class="info" id="etasbi-en-lname-3"></p>
                                 </div>
                                 <div class="clearfix info-holder">
                                    <h4 class="info-label employment">Name in Chinese</h4>
                                    <p class="info" id="etasbi-ch-name-3"></p>
                                 </div>
                                 <div class="clearfix info-holder">
                                    <h4 class="info-label employment">HKID/Passport No</h4>
                                    <p class="info" id="etasbi-hkid-pass-3"></p>
                                 </div>
                                 <div class="clearfix info-holder-below">
                                    <h4 class="info-label">Relationship</h4>
                                    <p class="info" id="etasbi-relationship-3"></p>
                                 </div>
                                 <div class="clearfix info-holder-below">
                                    <h4 class="info-label">Gender</h4>
                                    <p class="info" id="etasbi-gender-3"></p>
                                 </div>
                                 <div class="clearfix info-holder-below">
                                    <h4 class="info-label">Entitlement (%)</h4>
                                    <p class="info" id="etasbi-entitlement-3"></p>
                                 </div>
                              </div>
                           </div>
                           <!-- BENEFECIARY END -->

                           <!-- UNDERWRITING SUMMARY -->
                           <div class="summary-body-item">
                              <h3 class="uwriting">Underwriting Summary <a href="#" title="Edit" class="et-app-sum-edit" data-target="#et-application-second-section">Edit</a></h3>
                              <div class="fwd-checkbox">
                                 <input type="checkbox" id="summary-one" checked disabled>
                                 <label for="summary-one"></label>
                                 <p class="notice">I DO NOT have proposal, renewal or reinstatement for life, disability, accident, critical illness or health insurance made to any company ever been declined, postponed or modified in anyway</p>
                              </div>
                              <div class="fwd-checkbox below">
                                 <input type="checkbox" id="summary-two" checked disabled>
                                 <label for="summary-two"></label>
                                 <p class="notice">I DO NOT have had, or been told to</p>
                                 <div class="row et-apsum-disease-list"> 
                                    <ul class="col-xs-12 col-md-6">
                                       <li><img src="assets/images/et-bullet.png"><span>Digestive Problems (excluding Acute Gastritis and Gastro-Enteritis)</span></li>
                                       <li><img src="assets/images/et-bullet.png"><span>Liver Problems (including Hepatitis B and C)</span></li>
                                       <li><img src="assets/images/et-bullet.png"><span>Blood Disease</span></li>
                                       <li><img src="assets/images/et-bullet.png"><span>Disorder of the Bones</span></li>
                                       <li><img src="assets/images/et-bullet.png"><span>Spine or Muscle</span></li>
                                       <li><img src="assets/images/et-bullet.png"><span>Cancer or Tumor</span></li>
                                       <li><img src="assets/images/et-bullet.png"><span>Breast Disease or Disorder</span></li>
                                    </ul>
                                    <ul class="col-xs-12 col-md-6">
                                       <li><img src="assets/images/et-bullet.png"><span>Uro-Genital Disease or Disorder</span></li>
                                       <li><img src="assets/images/et-bullet.png"><span>AIDS Related Complex</span></li>
                                       <li><img src="assets/images/et-bullet.png"><span>High Blood Pressure</span></li>
                                       <li><img src="assets/images/et-bullet.png"><span>Stroke</span></li>
                                       <li><img src="assets/images/et-bullet.png"><span>Chest Pain</span></li>
                                       <li><img src="assets/images/et-bullet.png"><span>Heart Disease</span></li>
                                    </ul>
                                 </div>
                              </div>
                              <div class="fwd-checkbox below">
                                 <input type="checkbox" id="summary-three" checked disabled>
                                 <label for="summary-three"></label>
                                 <p class="notice second-format">In the past 3 years, I DO NOT have had any accident or illness treatment (medication or drugs) for more than 14 days or have you undergone surgical operation at a hospital or clinic, or been advised by a registered physician to undergo any investigations including ECG, CT Scan, Blood Test, Biopsy etc. (Excluding Routine Medical or Employment check-up)
                                 </p>
                              </div>
                              <div class="fwd-checkbox below">
                                 <input type="checkbox" id="summary-four" checked disabled>
                                 <label for="summary-four"></label>
                                 <p class="notice">I DO NOT have an existing insurance policy that the insured amount more than HK$2,000,000 with FWD
                                 </p>
                              </div>
                           </div>
                           <!-- UNDERWRITING SUMMARY -->
                        </div> <!-- END OF SUMMARY BODY   -->
                     </div> <!-- END OF SUMMARY CONTENT -->

                     <div class="text-center confirm-and-sign-holder">
                        <button id="et-confirm-and-sign-btn" type="button" class="btn next">Confirm &amp; Sign</button><!--Bind a click event temporarily to show the hidden Signature section-->
                     </div>

                  </div>
               </div>
            </div><!-- APPLICATION SUMMARY END -->
            
            <!-- SIGNATURE SECTION -->
            <div id="et-application-fourth-section" class="hide-element">
               <div class="container-fluid fwd-container">
                  <div class="signature page-application et-signature">
                     <div class="signature-section" id="signature-section">
                        
                        <h2>Your signature</h2>
                        <p class="et-sig-label text-center">Please sign in the grey area</p>
                        
                        <div id="signature" class="signature-image"></div>
                        
                        <div class="et-clear-signature"><a href="#" id="et-clear-signature" title="Clear signature" class="">Clear</a></div>
                        
                        <div class="correct-signature hide-element">
                           <img src="assets/images/correct-signature.png" class="correct-sign-image"/><span class="span-text-img">Correct Signature</span>
                        </div>
                     </div>
                     
                     <div class="proceed-btn">
                        <button id="et-signature-proceed-btn" type="button" class="btn next">Proceed to payment</button>
                     </div>
                     <canvas id="et-temp-canvas"></canvas>
                  </div>
               </div>
            </div><!-- END OF SIGNATURE SECTION -->
            
         </div>
         
         <!--
            MODAL SECTION 
         -->
         <!-- GET PROMOTION CODE MODAL -->
         <div id="get-promotion-code" class="modal fade login-modal"tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
               <div class="modal-content plan-modal">
                   <div class="login-form" id="sendmailofpromocode">
                   <div style="overflow: hidden;"><a id="getPromotionClose" class="close" aria-label="Close" data-dismiss="modal">
                        <span aria-hidden="true" style="font-size:30px;">×</span>
                      </a>
                   </div>
                   <form>
                        <div class="form-container">
                           <h2>Don't have a promotion code? Enter your email address and we'll send you one.</h2>
                           <div class="alert alert-success hide proSuccess"></div>
                           <h4>Email address</h4>
                           <div class="form-group">
                               <input type="email" class="form-control" placeholder="" name="emailToSendPromoCode" id="emailToSendPromoCode">
                               <input type="hidden" name="planCode" id="planCode" value="TRAVELCARE">                         
                           </div>
                           <span id="errPromoEmail" class="text-red"></span>
                           <button type="submit" onclick="return sendEmail()" class="btn next">Submit</button>
                           <p>By submitting my email address I agree to receive FWD's promotion code and other offers in the future.</p>
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
							<h5>Sorry, you cannot apply this policy online.</h5>
						</div>
						<div class="modal-body">
							<p>Please call our Customer Service Hotline <a href="#" class="et-top-no"  title="Customer Service Hotline">3123 3123</a> to find out more or leave your contact and let us call you back.</p>
							<form action="">
								<div class="input-items clearfix">
									<label for="name">Name</label>
									<input type="text" class="form-control gray-textbox" placeholder="Name" id="name" name="name">
								</div>
								<div class="input-items clearfix">
									<label for="email">Email address</label>
									<input type="text" class="form-control gray-textbox" placeholder="Email Address" id="email" name="email">
								</div>
								<div class="input-items clearfix">
									<label for="tel">Telephone no.</label>
									<input type="text" class="form-control gray-textbox" placeholder="Telephone no" id="tel" name="tel">
								</div>
								<div class="input-items clearfix">
									<label for="day">Preffered day</label>
									<div class="select-holder">
										<select class="form-control gray-textbox" id="day" name="day">
											<option>Monday - Friday</option>
											<option>Lorem Ipsum</option>
										</select>
									</div>
								</div>
								<div class="input-items clearfix">
									<label for="time">Preffered timeslot</label>
									<div class="select-holder">
										<select class="form-control gray-textbox" id="time" name="time">
											<option>After hour</option>
											<option>Lorem Ipsum</option>
										</select>
									</div>
								</div>
								<div class="input-items clearfix">
									<label for="enquiry">Enquire type</label>
									<div class="select-holder">
										<select class="form-control gray-textbox" id="enquiry" name="enquiry">
											<option>Product enquiry</option>
											<option>Lorem Ipsum</option>
										</select>
									</div>
								</div>
                        <div class="fwd-checkbox modal-checkbox">
                           <input type="checkbox" id="cannot-apply-checkbox">
                           <label for="cannot-apply-checkbox"></label>
                           <p class="notice">I have read and I understand and accept this
                           <a href="#">Personal Information Collection Statement.</a></p>
                        </div>
								<button type="submit" class="btn next">Submit</button>
							</form>
						</div>
					</div><!-- /.modal-content -->
				</div><!-- /.modal-dialog -->	
			</div><!--END OF CANNOT APPLY MODAL-->
         
         <!-- DOB ATTENTION -->
         <div id="bdayModal" class="modal fade" role="dialog">
            <div class="modal-dialog">
            
               <div class="modal-content">
                  <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal">&times;</button>
                     <h4 class="modal-title">Attention</h4>
                  </div>
                     
                  <div class="modal-body">
                     <p>The Date of birth Input from Plan options does not match
                     with the Date of Birth from your membership account, please
                     go back to quote and try again.</p>	
                  </div>
                  
                  <div>
                     <button type="button" class="btn-block" id="et-btn-change-date" data-dismiss="modal">Change my data</button>
                  </div>
               </div>

            </div>
         </div><!-- END OF DOB ATTENTION -->
         
         <!--CUSTOMER SERVICE MODAL-->
			<div class="modal et-modal fade" role="dialog" aria-labelledby="cantapply" id="customer-service-modal">
				<div class="container-fluid modal-dialog" role="document">
					<div class="modal-content et-modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							<h4>Customer Service</h4>
						</div>
						<div class="modal-body">
							<p>Please call our Customer Service Hotline <a href="#" class="et-top-no" title="Customer Service Hotline" >3123 3123</a> to find out more or leave your contact and let us call you back.</p>
							<form action="">
								<div class="input-items clearfix">
									<label for="cs_name">Name</label>
									<input type="text" class="form-control gray-textbox" placeholder="Name" id="cs_name" name="cs_name">
								</div>
								<div class="input-items clearfix">
									<label for="cs_email">Email address</label>
									<input type="text" class="form-control gray-textbox" placeholder="Email Address" id="cs_email" name="cs_email">
								</div>
								<div class="input-items clearfix">
									<label for="cs_tel">Telephone no.</label>
									<input type="text" class="form-control gray-textbox" placeholder="Telephone no" id="cs_tel" name="cs_tel">
								</div>
								<div class="input-items clearfix">
									<label for="cs_day">Preffered day</label>
									<div class="select-holder">
										<select class="form-control gray-textbox" id="cs_day" name="cs_day">
											<option>Monday - Friday</option>
											<option>Lorem Ipsum</option>
										</select>
									</div>
								</div>
								<div class="input-items clearfix">
									<label for="cs_time">Preffered timeslot</label>
									<div class="select-holder">
										<select class="form-control gray-textbox" id="cs_time" name="cs_time">
											<option>After hour</option>
											<option>Lorem Ipsum</option>
										</select>
									</div>
								</div>
								<div class="input-items clearfix">
									<label for="cs_enquiry">Enquire type</label>
									<div class="select-holder">
										<select class="form-control gray-textbox" id="cs_enquiry" name="cs_enquiry">
											<option>Product enquiry</option>
											<option>Lorem Ipsum</option>
										</select>
									</div>
								</div>
                        <div class="fwd-checkbox modal-checkbox">
                           <input type="checkbox" id="customer-service-checkbox">
                           <label for="customer-service-checkbox"></label>
                           <p class="notice">I have read and I understand and accept this
                           <a href="#">Personal Information Collection Statement.</a></p>
                        </div>

								<button type="submit" class="btn next">Submit</button>
							</form>
						</div>
					</div><!-- /.modal-content -->
				</div><!-- /.modal-dialog -->	
			</div><!--END OF CUSTOMER SERVICE MODAL-->
         
         <!-- FOOTER -->	
		</div>
		
		<!-- JS INCLUDES -->
		<!--<script src="assets/js/jquery.nicescroll.min.js"></script>-->
		<script src="assets/js/bootstrap-et-slider.js"></script>
		<script src="assets/js/highcharts.js"></script>
		
      <!--[if lt IE 9]>
		<script type="text/javascript" src="assets/js/flashcanvas.js"></script>
		<![endif]-->
		<script src="assets/js/jSignature/jSignature.min.js"></script>
		<!-- SELECT PLAN JS -->
      <script type="text/javascript" src="assets/js/fwd-select-plan.js"></script>
