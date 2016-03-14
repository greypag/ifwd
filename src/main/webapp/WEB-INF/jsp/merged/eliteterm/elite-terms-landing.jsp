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
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/mini-calcu/js/jquery-ui-1.11.4.custom/jquery-ui.theme.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/mini-calcu/js/jquery-ui-1.11.4.custom/jquery-ui.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/mini-calcu/css/style.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/styles-et.css">
		<%!
			boolean isSaleActiveClass = false;
			boolean isEservicesActiveClass = false;
		%>
		<div class="fwd-savie-wrapper fwd-et-wrapper">			
			<span id="language-holder" value="${language}"></span>
			<div class="text-center banner-widget container-fluid">
			<div class="col-lg-12 col-md-12 breadcrumb-wrapper">
			     <ol class="breadcrumb container pad-none">
			         <li><fmt:message key="eliteTerms.breadcrumb.home" bundle="${msg}" /></li>
			        <i class="fa fa-chevron-right"></i>
			        <li><fmt:message key="eliteTerms.breadcrumb.category" bundle="${msg}" /></li>
			        <i class="fa fa-chevron-right"></i>        
			        <li class="active"><fmt:message key="eliteTerms.breadcrumb.product" bundle="${msg}" /></li>
			     </ol>
			</div>			  
            <img src="<%=request.getContextPath()%>/<fmt:message key="eliteterms.hero.image.mobile" bundle="${msg}" />" alt="Team Insurance" class="hidden-md hidden-lg img-responsive">
            <img src="<%=request.getContextPath()%>/<fmt:message key="eliteterms.hero.image" bundle="${msg}" />" alt="Team Insurance" class="hidden-sm hidden-xs img-responsive desktop-cover">
            <div class="tagline-holder">
            	<img src="<%=request.getContextPath()%>/<fmt:message key="eliteterms.hero.tagline" bundle="${msg}" />" alt="Protection for your family's future" class="img-responsive elite-term-tagline">
            </div>
            <div class="et-banner-label">
               <a id="get-quote-link" class="buy-now et-quote btn-color-ylw" href="#" ><fmt:message key="eliteTerms.landing.Get.Quote" bundle="${msg}" /></a>
				</div>
			</div>
			
         <div id="flux" class="et-page">
            <div class="center wow fadeInDown"> 
               <!--desktop-->
               <p class="hidden-sm hidden-xs"><fmt:message key="eliteTerms.landing.Elite.Term.Plan" bundle="${msg}" /></p>
               <!--end desktop--> 
               <!--Mobile-->
               <p class="hidden-lg hidden-md feature-ttl">
                  <fmt:message key="eliteTerms.landing.Elite.Term.Plan" bundle="${msg}" />
               </p>
               <!--end Mobile-->
            </div>
            <div class="et-three-columns-wrapper">
               <div id="landing-three-column" class="fwd-container container-fluid three-column-widget et-three-column-widget">
                  <div class="row row-top et-usp-section">
                     <div class="col-xs-12 col-md-4 fwd-col">
                           <div class="col-content et-bordered-col-content">
                              <div class="clearfix">
                                 <div class="mobile-image hidden-md hidden-lg et-img-col pull-left">
                                    <img src="<%=request.getContextPath()%>/resources/images/elite-terms/protection.png" alt="protection.png" class="img-responsive">
                                 </div>
                                 <div class="right et-desc-col">
                                    <h2><fmt:message key="eliteTerms.landing.Fill.the.Protection" bundle="${msg}" /></h2>
                                    <div class="text-center">
                                       <div class="hidden-xs hidden-sm">
                                          <img src="<%=request.getContextPath()%>/resources/images/elite-terms/protection.png" alt="protection.png">
                                       </div>
                                       <p><fmt:message key="eliteTerms.landing.Regardless.of.your" bundle="${msg}" /></p>
                                    </div>
                                 </div>
                              </div>
                           </div>
                     </div>
                     <div class="hidden-xs hidden-sm et-usp-gutter"></div>
                     <div class="col-xs-12 col-md-4 fwd-col">
                           <div class="col-content et-bordered-col-content">
                              <div class="clearfix">
                                 <div class="mobile-image hidden-md hidden-lg et-img-col pull-left">
                                    <img src="<%=request.getContextPath()%>/resources/images/elite-terms/guarantee.png" alt="guarantee.png" class="img-responsive">
                                 </div>
                                 <div class="right et-desc-col">
                                    <h2><fmt:message key="eliteTerms.landing.Guaranteed.Level.premium" bundle="${msg}" /></h2>
                                    <div class="text-center">
                                       <div class="hidden-xs hidden-sm">
                                          <img src="<%=request.getContextPath()%>/resources/images/elite-terms/guarantee.png" alt="guarantee.png">
                                       </div>
                                       <p><fmt:message key="eliteTerms.landing.The.premiums.payable" bundle="${msg}" /></p>
                                    </div>
                                 </div>
                              </div>
                           </div>
                     </div>
                     <div class="hidden-xs hidden-sm et-usp-gutter"></div>
                     <div class="col-xs-12 col-md-4 fwd-col">
                           <div class="col-content et-bordered-col-content">
                              <div class="clearfix">
                                 <div class="mobile-image hidden-md hidden-lg et-img-col pull-left">
                                    <img src="<%=request.getContextPath()%>/resources/images/elite-terms/flexible.png" alt="flexible.png" class="img-responsive">
                                 </div>
                                 <div class="right et-desc-col">
                                    <h2><fmt:message key="eliteTerms.landing.Flexible.in.choosing" bundle="${msg}" /></h2>
                                    <div class="text-center">
                                       <div class="hidden-xs hidden-sm">
                                          <img src="<%=request.getContextPath()%>/resources/images/elite-terms/flexible.png" alt="flexible.png">
                                       </div>
                                       <p><fmt:message key="eliteTerms.landing.It.is.flexible" bundle="${msg}" /></p>
                                    </div>
                                 </div>
                              </div>
                           </div>
                     </div>
                  </div>
                  <div class="btn-download-section" style="text-align:left;">
                     <a href="<%=request.getContextPath()%>/<fmt:message key="eliteterms.brochure.link" bundle="${msg}" />" title="Download product brochure" class="et-btn-download-item" target="_blank">
                        <img src="<%=request.getContextPath()%>/resources/images/elite-terms/download-icon.png" alt="download-icon.png" />
                        <fmt:message key="eliteTerms.landing.Product.brochure" bundle="${msg}" />
                     </a>
                     <a href="<%=request.getContextPath()%>/<fmt:message key="eliteterms.provision.link" bundle="${msg}" />" title="Download policy provisions" class="et-btn-download-item" target="_blank">
                        <img src="<%=request.getContextPath()%>/resources/images/elite-terms/download-icon.png" alt="download-icon.png" />
                        <fmt:message key="eliteTerms.landing.Policy.provisions" bundle="${msg}" />
                     </a>
                  </div>
               </div>
            </div>
               
            <!-- BENEFITS -->
            <div class="et-benefit-bg">
               <div class="fwd-container container-fluid  et-benefits-wrapper">     
                  <div class="row">
                     <div class="col-xs-12 text-center et-benefit-title">
                        <h2><fmt:message key="eliteTerms.landing.Benefits" bundle="${msg}" /></h2>
                     </div>	                    
                     <div class="col-xs-12 et-benefit-lists">
                        <div class="row">
                           <div class="col-xs-6 col-md-4 text-center et-benefit-item">
                              <img src="<%=request.getContextPath()%>/resources/images/elite-terms/protection-95.png" alt="protection-95.png" />
                              <h4><fmt:message key="eliteTerms.landing.Protection.till.age.95" bundle="${msg}" /></h4>
                              <div class="hidden-content">
                                 <div class="col-xs-12 hidden-md hidden-lg">
                                    <img src="<%=request.getContextPath()%>/resources/images/elite-terms/protection-95.png" alt="protection-95.png" />
                                 </div>
                                 <div class="col-xs-12 hidden-content-title"><fmt:message key="eliteTerms.landing.Protection.till.age.95" bundle="${msg}" /></div>
                                 <div class="col-xs-12 hidden-content-p">
                                    <p>
                                       <fmt:message key="eliteTerms.landing.Protection.till.age.95.details" bundle="${msg}" />
                                    </p>
                                 </div>
                                 <div class="clearfix"></div>
                              </div>
                           </div>
                           <div class="col-xs-6 col-md-4 text-center et-benefit-item">
                              <img src="<%=request.getContextPath()%>/resources/images/elite-terms/pure-protection2.png" alt="pure-protection.png" />
                              <h4><fmt:message key="eliteTerms.landing.Pure.protection" bundle="${msg}" /></h4>
                              <div class="hidden-content">
                                 <div class="col-xs-12 hidden-md hidden-lg">
                                    <img src="<%=request.getContextPath()%>/resources/images/elite-terms/pure-protection2.png" alt="pure-protection.png" />
                                 </div>
                                 <div class="col-xs-12 hidden-content-title"><fmt:message key="eliteTerms.landing.Pure.protection" bundle="${msg}" /></div>
                                 <div class="col-xs-12 hidden-content-p">
                                    <p>
                                       <fmt:message key="eliteTerms.landing.Pure.protection.details" bundle="${msg}" />
                                    </p>
                                 </div>
                                 <div class="clearfix"></div>
                              </div>
                           </div>
                           <div class="clearfix hidden-md hidden-lg"></div>
                           <div class="col-xs-6 col-md-4 text-center et-benefit-item">
                              <img src="<%=request.getContextPath()%>/resources/images/elite-terms/tailor-lifestyle.png" alt="tailor-lifestyle.png" />
                              <h4><fmt:message key="eliteTerms.landing.Tailored.to.your" bundle="${msg}" /></h4>
                              <div class="hidden-content">
                                 <div class="col-xs-12 hidden-md hidden-lg">
                                    <img src="<%=request.getContextPath()%>/resources/images/elite-terms/tailor-lifestyle.png" alt="tailor-lifestyle.png" />
                                 </div>
                                 <div class="col-xs-12 hidden-content-title"><fmt:message key="eliteTerms.landing.Tailored.to.your" bundle="${msg}" /></div>
                                 <div class="col-xs-12 hidden-content-p">
                                    <p>
                                       <fmt:message key="eliteTerms.landing.Tailored.to.your.details" bundle="${msg}" />
                                    </p>
                                 </div>
                                 <div class="clearfix"></div>
                              </div>
                           </div>
                           <div class="clearfix hidden-xs hidden-sm"></div>
                           <div class="col-xs-6 col-md-4 text-center et-benefit-item">
                              <img src="<%=request.getContextPath()%>/resources/images/elite-terms/purchase-process.png" alt="purchase-process.png" />
                              <h4><fmt:message key="eliteTerms.landing.Simplified.purchase.process" bundle="${msg}" /></h4>
                              <div class="hidden-content">
                                 <div class="col-xs-12 hidden-md hidden-lg">
                                    <img src="<%=request.getContextPath()%>/resources/images/elite-terms/purchase-process.png" alt="purchase-process.png" />
                                 </div>
                                 <div class="col-xs-12 hidden-content-title"><fmt:message key="eliteTerms.landing.Simplified.purchase.process" bundle="${msg}" /></div>
                                 <div class="col-xs-12 hidden-content-p">
                                    <p>
                                       <fmt:message key="eliteTerms.landing.Simplified.purchase.process.details" bundle="${msg}" />
                                    </p>
                                 </div>
                                 <div class="clearfix"></div>
                              </div>
                           </div>
                           <div class="clearfix hidden-md hidden-lg"></div>
                           <div class="col-xs-6 col-md-4 text-center et-benefit-item">
                              <img src="<%=request.getContextPath()%>/resources/images/elite-terms/peace-mind.png" alt="peace-mind.png" />
                              <h4><fmt:message key="eliteTerms.landing.Protection.peace.of.mind" bundle="${msg}" /></h4>
                              <div class="hidden-content">
                                 <div class="col-xs-12 hidden-md hidden-lg">
                                    <img src="<%=request.getContextPath()%>/resources/images/elite-terms/peace-mind.png" alt="peace-mind.png" />
                                 </div>
                                 <div class="col-xs-12 hidden-content-title"><fmt:message key="eliteTerms.landing.Protection.peace.of.mind" bundle="${msg}" /></div>
                                 <div class="col-xs-12 hidden-content-p">
                                    <p>
                                       <fmt:message key="eliteTerms.landing.Protection.peace.of.mind.details" bundle="${msg}" />
                                    </p>
                                 </div>
                                 <div class="clearfix"></div>
                              </div>
                           </div>
                           <div class="col-xs-6 col-md-4 text-center et-benefit-item">
                              <img src="<%=request.getContextPath()%>/resources/images/elite-terms/claim-ambassador2.png" alt="claim-ambassador.png" />
                              <h4><fmt:message key="eliteTerms.landing.Claim.Ambassador" bundle="${msg}" /></h4>
                              <div class="hidden-content">
                                 <div class="col-xs-12 hidden-md hidden-lg">
                                    <img src="<%=request.getContextPath()%>/resources/images/elite-terms/claim-ambassador2.png" alt="claim-ambassador.png" />
                                 </div>
                                 <div class="col-xs-12 hidden-content-title"><fmt:message key="eliteTerms.landing.Claim.Ambassador" bundle="${msg}" /></div>
                                 <div class="col-xs-12 hidden-content-p">
                                    <p>
                                       <fmt:message key="eliteTerms.landing.Claim.Ambassador.details" bundle="${msg}" />
                                    </p>
                                 </div>
                                 <div class="clearfix"></div>
                              </div>
                           </div>
                           <div class="clearfix hidden-md hidden-lg"></div>
                           <div class="clearfix hidden-xs hidden-sm"></div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            
            <!-- PRODUCT REMARKS -->
            <section class="et-remarks-wrapper">
               <div class="container">
                  <fmt:message key="eliteTerms.landing.product.remarks.t1" bundle="${msg}" />
                  <div>
                     <ol>
                        <li><fmt:message key="eliteTerms.landing.product.remarks.copy1" bundle="${msg}" /></li>
                        <li><fmt:message key="eliteTerms.landing.product.remarks.copy2" bundle="${msg}" /></li>
                        <li><fmt:message key="eliteTerms.landing.product.remarks.copy3" bundle="${msg}" /></li>
                        <li><fmt:message key="eliteTerms.landing.product.remarks.copy4" bundle="${msg}" /></li>
                     </ol>
                  </div>
               </div>
            </section>
            <!-- PRODUCT REMARKS -->
            
            <!-- FEATURES PLAN AND TESTIMONIALS -->
            <section class="et-plan-wrapper hidden-xs hidden-sm">
               <div class="container">
                  <div class="row hidden-sm hidden-xs">
                     <div class="col-xs-12 col-sm-4 col-md-4 et-pad-none">
                        <div class="et-recent-work-wrap et-wrap text-center">
                           <div class="et-recent-work-inner"> 
                              <div class="et-recent-work-img"><img src="<%=request.getContextPath()%>/resources/images/elite-terms/feature-time.png" alt="feature-time.png" /></div>
                              <h1><fmt:message key="eliteTerms.landing.Here.when.you.need.us" bundle="${msg}" /></h1>
                              <p>
                                 <fmt:message key="eliteTerms.landing.Our.24x7.call" bundle="${msg}" /> <a href="<fmt:message key="app.download.link" bundle="${msg}" />" target="_blank"><fmt:message key="eliteTerms.landing.eServices.App" bundle="${msg}" /></a> <fmt:message key="eliteTerms.landing.ensures.you.get" bundle="${msg}" />
                              </p>
                           </div>
                        </div>
                     </div>
                     <div class="col-xs-12 col-sm-4 col-md-4 et-pad-none">
                        <div class="et-recent-work-wrap et-recent-work-wrap-mid et-wrap text-center">
                           <div class="et-recent-work-inner"> 
                              <div class="et-recent-work-img"><img src="<%=request.getContextPath()%>/resources/images/elite-terms/feature-secure-stable.png" alt="feature-secure-stable.png" /></div>
                              <h1><fmt:message key="eliteTerms.landing.Secure.stable" bundle="${msg}" /></h1>
                              <p><fmt:message key="eliteTerms.landing.We.have.been.assigned" bundle="${msg}" /> <br>
                              <br>
                              </p>
                           </div>
                        </div>
                     </div>
                     <div class="col-xs-12 col-sm-4 col-md-4 et-pad-none ">
                        <div class="et-recent-work-wrap et-wrap text-center">
                           <div class="et-recent-work-inner"> 
                              <div class="et-recent-work-img"><img src="<%=request.getContextPath()%>/resources/images/elite-terms/feature-reward.png" alt="feature-reward.png" /></div>
                              <h1><fmt:message key="eliteTerms.landing.Rewards.benefits" bundle="${msg}" /></h1>
                              <p><fmt:message key="eliteTerms.landing.We.continue.to.find" bundle="${msg}" /></p>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </section>

            <!-- ADVISORY -->
            <section class="et-advisory-wrapper">
               <div class="container">
                  <div class="row">
                     <div class="col-xs-12 et-advisory">
                        <p>
                           <fmt:message key="eliteTerms.landing.For.a.complete.explanation" bundle="${msg}" />
                        </p>
                     </div>
                  </div>
               </div>
            </section>
            
            <!-- 
               FEATURES PLAN MOBILE VERSION 
            -->
            <!-- FEATURES PLAN MOBILE VERSION -->
            <section id="et-recent-works-mob" class="hidden-lg hidden-md" data-ride="carousel" data-interval="false">
               <div class="carousel slide">
                  
                  <div class="carousel-inner">  
                     <div class="item active">
                        <div>
                           <div class="slide-margin">
                              <div class="et-recent-work-wrap text-center">
                              <div class="et-recent-work-inner"> <img src="<%=request.getContextPath()%>/resources/images/elite-terms/feature-time.png" alt="feature-time.png" />
                                 <h2><fmt:message key="eliteTerms.landing.Here.when.you.need.us" bundle="${msg}" /></h2>
                                 <p>
                                 <fmt:message key="eliteTerms.landing.Our.24x7.call" bundle="${msg}" /> <a href="http://www.fwd.com.hk/en-US/fwd-n-you/e_services_app.html" target="_blank"><fmt:message key="eliteTerms.landing.eServices.App" bundle="${msg}" /></a> <fmt:message key="eliteTerms.landing.ensures.you.get" bundle="${msg}" />
                              </p>
                              </div>
                              </div>
                           </div>
                        </div>
                     </div>
                     
                     <div class="item">
                        <div>
                           <div class="slide-margin">
                              <div class="et-recent-work-wrap et-recent-work-wrap-mid text-center">
                              <div class="et-recent-work-inner"> <img src="<%=request.getContextPath()%>/resources/images/elite-terms/feature-secure-stable.png" alt="feature-secure-stable.png" />
                                 <h2><fmt:message key="eliteTerms.landing.Secure.stable" bundle="${msg}" /></h2>
                                 <p><fmt:message key="eliteTerms.landing.We.have.been.assigned" bundle="${msg}" /></p>
                              </div>
                              </div>
                           </div>
                        </div>
                     </div>
                     
                     <div class="item">
                        <div>
                           <div class="row slide-margin">
                              <div class="et-recent-work-wrap text-center">
                              <div class="et-recent-work-inner"> <img src="<%=request.getContextPath()%>/resources/images/elite-terms/feature-reward.png" alt="feature-reward.png" />
                                 <h2><fmt:message key="eliteTerms.landing.Rewards.benefits" bundle="${msg}" /></h2>
                                 <p><fmt:message key="eliteTerms.landing.We.continue.to.find" bundle="${msg}" /></p>
                              </div>
                              </div>
                           </div>
                     </div>
                     </div>
                     
                  </div>
                  
                  <a class="prev" href="#et-recent-works-mob" role="button" data-slide="prev"> 
                     <img src="<%=request.getContextPath()%>/resources/images/elite-terms/plan-left-arrow.png" alt="plan-left-arrow.png" />
                  </a> 
                  <a class="next" href="#et-recent-works-mob" role="button" data-slide="next"> 
                     <img src="<%=request.getContextPath()%>/resources/images/elite-terms/plan-right-arrow.png" alt="plan-right-arrow.png" />
                  </a> 
               </div>
            </section>
            
            <!-- TESTIMONIALS DESKTOP -->
			
			<!--
            <section id="et-testimonials" class="hidden-sm hidden-xs">
               <div class="container"> 
                  <div class="row hidden-sm hidden-xs">
                     <div class="text-center">
                     <h2 class="et-testimonial-title">Customer testimonials</h2>
                     </div>
                     <div class="col-xs-12 col-sm-5 col-md-5 pad-none">
                        <div class="et-testimonials-wrap text-center">
                           <div class="et-testimonials-inner text-center">
                              <div class="et-h1-1"> <blockquote class="et-testimonial"></blockquote></div>
                              <p>I always go for FWD Travel Insurance because there is always someone to pick up my calls, 24/7, which is particularly important after office hours and while I am travelling overseas.</p>
                              <div class="et-hr1"></div>
                              <h2>William</h2>
                              <h4>(aged 30)</h4>
                           </div>
                        </div>
                     </div>
                     <div class="col-xs-12 col-sm-5 col-md-5 pad-none pull-right">
                        <div class="et-testimonials-wrap text-center">
                           <div class="et-testimonials-inner text-center">
                              <div class="et-h1-1"> <blockquote class="et-testimonial"></blockquote></div>
                              <p>I am a backpacker. The only 2 things I carry with me are my FWD TravelCare policy no. and ISOS emergency number – especially when you don’t know what to expect in the Amazon jungle.</p>
                              <div class="et-hr1"></div>
                              <h2>Gabriel </h2>
                              <h4>(aged 26)</h4>
                           </div>
                        </div>
                     </div>
                     <br>
                     <p class="et-pad-none et-p1 pull-left"><br>
                     The opinions and views expressed here are entirely the writers' own and do not represent the views of FWD Life Insurance Company (Bermuda) Limited and its affiliates ("FWD"). FWD does not take any responsibility for that opinions and views, nor endorse their accuracy or completeness.</p>
                  </div>
               </div>
            </section>
            
            <!-- TESTIMONIALS MOBILE 
            <section id="et-testimonials-mob" class="hidden-lg hidden-md" data-ride="carousel" data-interval="false">
               <div class="carousel slide">
                  <div class="text-center">
                     <h2 class="et-testimonial-title">Customer testimonials</h2>
                  </div>
      
                  <div class="carousel-inner">
                     <div class="item active">
                        <div class="container">
                           <div class="row slide-margin">
                              <div class="et-testimonials-wrap text-center">
                                 <div class="et-testimonials-inner text-center">
                                    <blockquote class="et-testimonial"></blockquote>
                                    <p>I always go for FWD Travel Insurance because there is always someone to pick up my calls, 24/7, which is particularly important after office hours and while I am travelling overseas.</p>
                                    <div class="et-hr1"></div>
                                    <h2>William</h2>
                                    <h4>(aged 30)</h4>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                     
                     <div class="item">
                        <div class="container">
                           <div class="row slide-margin">
                              <div class="et-testimonials-wrap text-center">
                                 <div class="et-testimonials-inner text-center">
                                    <blockquote class="et-testimonial"></blockquote>
                                    <p>I am a backpacker. The only 2 things I carry with me are my FWD TravelCare policy no. and ISOS emergency number – especially when you don’t know what to expect in the Amazon jungle.</p>
                                    <div class="et-hr1"></div>
                                    <h2>Gabriel</h2>
                                    <h4>(aged 26)</h4>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
                  
               </div>
               
               <a class="prev" href="#et-testimonials-mob" data-slide="prev"> <i class="fa fa-chevron-left"></i> </a> 
               <a class="next" href="#et-testimonials-mob" data-slide="next"> <i class="fa fa-chevron-right"></i> </a> 
            </section>
            
            <section class="et-blog-item hidden-md hidden-lg">
              <div class="container">
                 <p>The information provided in the blogs is for reference only. While FWD Life Insurance Company (Bermuda) Limited and its affiliates ("FWD") use all reasonable efforts to ensure the information is accurate, FWD makes no warranties or representations as to the accuracy or completeness of any of the information and assumes no liability for any errors or omissions thereof. FWD shall not be liable for any direct, incidental, consequential, indirect or punitive damages arising out of access to, use of or inability to use the information, or any errors or omissions in the content of this material. Users should carefully evaluate the information.</p>
              </div>
            </section>-->
            
            <a href="#" title="Get Quote" class="et-get-qoute hide-element hidden-md hidden-lg">
               <img src="<%=request.getContextPath()%>/resources/images/elite-terms/get-qoute.png" alt="get-qoute.png" />
            </a>
                              
         </div>
			
			<!-- FOOTER -->
		</div>
		
		<!-- JS INCLUDES -->
		<script type="text/javascript">
			var language = "en";
		</script>
		<script src="<%=request.getContextPath()%>/resources/css/mini-calcu/js/jquery.animateSprite.js"></script>
		<script src="<%=request.getContextPath()%>/resources/css/mini-calcu/js/jquery-ui-1.11.4.custom/jquery-ui.js"></script>
		<script src="<%=request.getContextPath()%>/resources/css/mini-calcu/js/jquery.ui.touch-punch.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/css/mini-calcu/js/jquery.loadImages.1.1.0.js"></script>
		<script src="<%=request.getContextPath()%>/resources/css/mini-calcu/js/index.js"></script>
      <script>
	      $("#get-quote-link").click(function(){
	    	  ga('create', 'UA-60032236-1', 'auto');
	    	  ga('send', 'pageview', '/${language}/term-life-insurance'); 
	    	  setTimeout(function(){
		    	  window.location = '<%=request.getContextPath()%>/${language}/term-life-insurance/${nextPageFlow}';
	    	  }, 1000);
	      });
      
      
         var isMobile = /Android|webOS|iPhone|iPad|iPod|BlackBerry/i.test(navigator.userAgent) ? true : false;

         $(window).scroll(function (event) {
            var scroll = $(window).scrollTop();
            var $quoteElement = $('.et-get-qoute');
            
            if (scroll > 180) {
               $quoteElement.fadeIn(function() {
                  $quoteElement.removeClass('hide-element');
               });
            } else if (scroll <= 0) {
               $quoteElement.fadeOut(function() {
                  $quoteElement.addClass('hide-element');
               });
            }
         });      

         /* Lightbox for benefit items */
         $(document).ready(function() {
             if(isMobile){
                 $(".et-benefit-item").click(function(){
                    itemTop = $(this).offset();
                    //console.log(itemTop);
                    var html=$(this).children('.hidden-content').children().clone();
                    $("#modal_policy_container").html(html);
                    $("#benefitsPopup").modal("show");
                    $("#benefitsPopup").on('show.bs.modal', function () {
                        $('body').css("position", "inital");
                        //$('body').css("position", "fixed");
                        $('body').animate({scrollTop: itemTop.top - 60}, 0);      
                    });
                    $("#benefitsPopup").on('hide.bs.modal', function () {
                        //alert(itemTop.top);
                        $('body').css("position", "initial");
                        $('body').animate({scrollTop: itemTop.top - 60}, 0);
                        //$('body').css("position", "relative");
                    });
                    $("#benefitsPopup").on('hidden.bs.modal', function () {
                        $('body').attr("style", "");
                    });                   
                 });  
              }        	 
         });
        
      </script>
      <style>
         @media screen and (max-width: 991px) {
         body {
            /* Hero image Position Fix*/
            padding-top: 50px;
         }
      </style>

<!-- Modal Box -->
<div class="modal fade bs-example-modal-lg  in" id="benefitsPopup" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content plan-modal">
        <div class="modal-body">
            <a class="close" aria-label="Close" data-dismiss="modal"><span aria-hidden="true" style="font-size:30px;">×</span></a>
            <div id="modal_policy_container" style="padding-top: 10px;text-align: center;">
            </div>
      </div>
    </div>
  </div>
</div>