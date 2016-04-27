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
<script type="text/javascript">
var context = "${pageContext.request.contextPath}";
var language = "${language}";
var affiliate = "${affiliate}";
var home_url = "<%=request.getContextPath()%>";
</script>

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/savie-regular-styles.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/easy-health/landing.css">

    
    <div class="fwd-savie-wrapper ">
        <div class="fwd-container container-fluid breadcrumbs savie-regular-pay-breadcrumbs">
                <div class="breadcrumb-container">
                    <ol class="breadcrumb breadcrumbs-product-details et-breadcrumbs">
                      <li><a href="#">Home</a></li>
                      <li class="divider"><i class="fa fa-angle-right"></i></li>
                      <li><a href="#">Protect </a></li>
                      <li class="divider"><i class="fa fa-angle-right"></i></li>
                      <li class="active-bc" id="et-active-bc-menu">EasyHealth Refundable Hospital Income Plan</li>
                     </ol>
                </div>
            </div>
    </div>
    <div class="savie-regular-container savie-regular-landing rp-only">
        <div class="whole-banner">
            <div class="page-banner">
                <img src="<%=request.getContextPath()%>/resources/images/easy-health/landing-bg-mobile.jpg" class="img-responsive hidden-md hidden-lg">
                <img src="<%=request.getContextPath()%>/resources/images/easy-health/landing-bg-desktop.jpg" class="img-responsive hidden-xs hidden-sm">
                <div class="fwd-container-limit">
                
                <form id="o2o-landing-form" action="<%=request.getContextPath()%>/${language}/${nextPageFlow}" method="post">
                    <div class="img-banner-text savie-landing">
                        <div id="clearfix-height-rp">
                            <button id="op-buy-now-O2O-mobile" class="savie-regular-btn start-btn">Quote Now</button>
                        </div>                      
                    <div class="savie-product text-bold">
                        <a href="/resources/brochure-pdf/savie_brochure_rp.pdf" target="_blank">Product brochure</a> | <a href="/resources/policy-provisions-pdf/Savie_En_Provisions.pdf" target="_blank">Product provisions</a>
                    </div>
                    </div>
                </form>
                </div>
            </div>
        </div>
                        
        <div class="payment-mode">
           
            <p class="availability-notice text-center"><strong>EasyHealth Refundable Hospital Income Plan</strong> (“the Plan”, “EasyHealth”) provides you Hospital Cash Benefit, regardless of the actual hospital expenses, for 15 years with 10 years of payment only, in addition, you will enjoy refund of 102% of actual total premium paid at maturity (i.e. end of the 15th policy year) regardless of any claims made during the protection period. Even if you surrender the policy before the maturity, you can still get back a percentage of actual premium paid starting at the 6th policy year.<span></span>
            </p>

            <!-- <h5 class="hidden-sm hidden-xs product-options text-center">
                <a href="#">Product brochure</a> | <a href="#">Product provisions</a>
            </h5> -->
        </div>
        
        <div class="fwd-container-limit">
                <div class="usp row">
                    <div class="usp-item clearfix col-xs-12 col-md-4">
                        <h5 class="hidden-xs hidden-sm">Cash Benefit</h5>
                        <img src="<%=request.getContextPath()%>/resources/images/easy-health/landing-usp-flexible.png" class="">
                        <div class="item-desc">
                            <h5 class="hidden-md hidden-lg">Cash Benefit</h5>
                            <p>You will receive a cash benefit from HK$300 to HK$1,200 per day (depend on your selected plan) when hospitalised for not less than 6 consecutive hours. You have the flexibility to use the money to suit your needs, such as paying for your medical or non-medical expenses or protecting against any loss of income.</p>
                        </div>
                    </div>
                    <div class="usp-item clearfix col-xs-12 col-md-4">
                        <h5 class="hidden-xs hidden-sm">HK$12 per day</h5>
                        <img src="<%=request.getContextPath()%>/resources/images/easy-health/landing-usp-protection.png" class="">
                        <div class="item-desc">
                            <h5 class="hidden-md hidden-lg">HK$12 per day</h5>
                            <p class="padded">Affordable premium for unexpected hospitalization to provide daily hospital cash. Enjoy as low as HK$12/day to get additional coverage on top of your existing medical plan. EasyHealth offers 4 benefit levels to cater your needs.</p>
                        </div>
                    </div>
                    <div class="usp-item clearfix col-xs-12 col-md-4">
                        <h5 class="hidden-xs hidden-sm">Return of Premium</h5>
                        <img src="<%=request.getContextPath()%>/resources/images/easy-health/landing-usp-save.png" class="">
                        <div class="item-desc">
                            <h5 class="hidden-md hidden-lg">Return of Premium</h5>
                            <p class="padded">You will enjoy refund of 102% of actual total premium paid at maturity (i.e. end of the 15th policy year) regardless of any claims made during the protection period.  Even if you surrender the policy before the maturity, you can still get back a percentage of actual premium paid starting the 6<sup>th</sup> policy year.</p>
                        </div>
                    </div>
                </div>
            </div>
 
            <div class="regular-benefit">
                    <div class="hidden-xs hidden-sm">
                <h3 class="benefits-desktop text-center">Benefits</h3>
                <div class="gray-divide"></div>
            </div>
                <div class="hidden-md hidden-lg">
                    <h4 class="text-center">Benefits</h4>
                    <div class="gray-divide"></div>
                </div>
                <div class="fwd-container-limit">
                    <div class="benefits-holder">
                        <div class="hidden-md hidden-lg">
                            <div class="row">
                                <!-- <div class="col-xs-6 text-center annualTravel_policy_item">
                                    <img src="/resources/images/savie-regular/benefit-1.png">
                                    <span>???product.details.savie.group1.section1.title.ocean???</span>
                                    <div class="hidden-benefits benefits-content">
                                        <img src="/resources/images/savie-regular/benefit-1.png" />
                                        <div class="info hidden-benefits-info">
                                            <h3 class="hidden-benefits-info">Benefits</h3>
                                            <p class="hidden-benefits-info">Ocean Park SmartFun Gold and Silver pass members now enjoy premium discount of HK$960 (gold) and HK$740 (silver), respectively upon a successfully application of Savie Insurance Plan with lump sum payment not less than HK$100,000.  </p>
                                        </div>
                                    </div>
                                </div>-->
                                <div class="col-xs-6 text-center annualTravel_policy_item">
                                    <img src="<%=request.getContextPath()%>/resources/images/easy-health/landing-benefit-2.png">
                                    <span class="two-lines">Additional Intensive Care Unit and Infectious Disease benefits</span>
                                    <div class="hidden-benefits benefits-content">
                                        <img src="<%=request.getContextPath()%>/resources/images/easy-health/landing-benefit-2.png" />
                                        <div class="info hidden-benefits-info">
                                            <h3 class="hidden-benefits-info">Additional Intensive Care Unit and Infectious Disease benefits</h3>
                                            <p class="hidden-benefits-info">If you are admitted to the intensive care unit during a quarantine, an additional benefit will be payable (up to HK$1,200 per day) up to 90 days per disability. Further, an additional Infectious Disease Benefit will be payable (up to HK$1,200 per day) up to 30 days per disability.</p>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="col-xs-6 text-center annualTravel_policy_item">
                                    <img src="<%=request.getContextPath()%>/resources/images/easy-health/landing-benefit-4.png">
                                    <span>Claim Ambassador</span>
                                    <div class="hidden-benefits benefits-content">
                                        <img src="<%=request.getContextPath()%>/resources/images/easy-health/landing-benefit-4.png" />
                                        <div class="info hidden-benefits-info">
                                            <h3 class="hidden-benefits-info">Claim Ambassador</h3>
                                            <p class="hidden-benefits-info">When you are hospitalised or requires assistance during the claim process, a claim ambassador will be present to help make the claim for the insured.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-6 text-center annualTravel_policy_item">
                                    <img src="<%=request.getContextPath()%>/resources/images/easy-health/landing-benefit-6.png">
                                    <span>Life protection</span>
                                    <div class="hidden-benefits benefits-content">
                                        <img src="<%=request.getContextPath()%>/resources/images/easy-health/landing-benefit-6.png" />
                                        <div class="info">
                                            <h3 class="hidden-benefits-info">Life protection</h3>
                                            <p class="hidden-benefits-info">The Plan will offer a life protection of 150% of Total Annualised Premium to ease your family needs at the unfortunate event of death of the insured person.  There will be an additional accidental death benefit of 50% of Total Annualised Premium if the death is caused by an accident.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-6 text-center annualTravel_policy_item">
                                    <img src="<%=request.getContextPath()%>/resources/images/easy-health/landing-benefit-6.png">
                                    <span>Easy Online Purchase</span>
                                    <div class="hidden-benefits benefits-content">
                                        <img src="<%=request.getContextPath()%>/resources/images/easy-health/landing-benefit-6.png" />
                                        <div class="info">
                                            <h3 class="hidden-benefits-info">Easy Online Purchase</h3>
                                            <p class="hidden-benefits-info">Simplified underwriting process enables you to complete the entire application process online. You may also visit our Customer Service Centers for more comprehensive coverage.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="hidden-xs hidden-sm">
                            <div class="" id="benefits-nav-holder">
                                <ul class="nav nav-tabs row so-fna-row" role="tablist">
                                    <!-- <li role="presentation" class="col-lg-3 col-md-3 col-sm-3 col-xs-3 navtabs-li active" id="benefits-nav-title-1">
                                        <a href="#benefits-navtabs-1" role="tab" data-toggle="tab" class="navtabs-title first-fna ui-link text-center">Benefits </a>
                                    </li>-->
                                    <li role="presentation" class="col-lg-3 col-md-3 col-sm-3 col-xs-3 navtabs-li active" id="benefits-nav-title-6">
                                        <a href="#benefits-navtabs-1" role="tab" data-toggle="tab" class="navtabs-title last-fna ui-link text-center">Additional Intensive Care Unit and Infectious Disease benefits</a>
                                    </li>                                   
                                    <li role="presentation" class="col-lg-3 col-md-3 col-sm-3 col-xs-3 navtabs-li" id="benefits-nav-title-2">
                                        <a href="#benefits-navtabs-2" role="tab" data-toggle="tab" class="navtabs-title ui-link text-center">Claim Ambassador</a>
                                    </li>
                                    <li role="presentation" class="col-lg-3 col-md-3 col-sm-3 col-xs-3 navtabs-li" id="benefits-nav-title-3">
                                        <a href="#benefits-navtabs-3" role="tab" data-toggle="tab" class="navtabs-title ui-link text-center">Life protection</span></a>
                                    </li>
                                    <li role="presentation" class="col-lg-3 col-md-3 col-sm-3 col-xs-3 navtabs-li last" id="benefits-nav-title-4">
                                        <a href="#benefits-navtabs-4" role="tab" data-toggle="tab" class="navtabs-title last-fna ui-link text-center">Easy Online Purchase</a>
                                    </li>
                                    <!-- <li role="presentation" class="col-lg-2 col-md-2 col-sm-2 col-xs-2 navtabs-li last" id="benefits-nav-title-5">
                                        <a href="#benefits-navtabs-5" role="tab" data-toggle="tab" class="navtabs-title last-fna ui-link text-center">24 hours <span>service hotline</span></a>
                                    </li>-->
                                </ul>
                                <div class="fna-carousel carousel slide" id="benefits-carousel" data-ride="carousel" data-interval="false">
                                    <div class="tab-content carousel-inner clearfix" role="listbox">
                                                <!--  <div role="tabpanel" class="fna-tab-content tab-pane item active" id="benefits-navtabs-1">
                                                    <div class="benefits-content clearfix">
                                                        <img src="/resources/images/savie-regular/new-benefit-1.png">
                                                        <div class="info">
                                                            <h3>???product.details.savie.group1.section1.title.ocean???</h3>
                                                            <p>Ocean Park SmartFun Gold and Silver pass members now enjoy premium discount of HK$960 (gold) and HK$740 (silver), respectively upon a successfully application of Savie Insurance Plan with lump sum payment not less than HK$100,000.  </p>
                                                        </div>
                                                    </div>
                                                </div>-->
                                                <div role="tabpanel" class="fna-tab-content tab-pane item active" id="benefits-navtabs-1">
                                                    <div class="benefits-content clearfix">
                                                        <img src="<%=request.getContextPath()%>/resources/images/easy-health/landing-benefit-2.png">
                                                        <div class="info">
                                                            <h3>Additional Intensive Care Unit and Infectious Disease benefits </h3>
                                                            <p>If you are admitted to the intensive care unit during a quarantine, an additional benefit will be payable (up to HK$1,200 per day) up to 90 days per disability. Further, an additional Infectious Disease Benefit will be payable (up to HK$1,200 per day) up to 30 days per disability.</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!--  <div role="tabpanel" class="fna-tab-content tab-pane item" id="benefits-navtabs-3">
                                                    <div class="benefits-content clearfix">
                                                        <img src="/resources/images/savie-regular/benefit-3.png">
                                                        <div class="info">
                                                            <h3>Earning after 3 years</h3>
                                                            <p>Savie while you play!  </p>
                                                        </div>
                                                    </div>
                                                </div> -->
                                                <div role="tabpanel" class="fna-tab-content tab-pane item" id="benefits-navtabs-2">
                                                    <div class="benefits-content clearfix">
                                                        <img src="<%=request.getContextPath()%>/resources/images/easy-health/landing-benefit-4.png">
                                                        <div class="info">
                                                            <h3>Claim Ambassador</h3>
                                                            <p>When you are hospitalised or requires assistance during the claim process, a claim ambassador will be present to help make the claim for the insured.</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- <div role="tabpanel" class="fna-tab-content tab-pane item" id="benefits-navtabs-5">
                                                    <div class="benefits-content clearfix">
                                                        <img src="/resources/images/savie-regular/benefit-5.png">
                                                        <div class="info">
                                                            <h3>Payment options</h3>
                                                            <p>Savie while you play!  </p>
                                                        </div>
                                                    </div>
                                                </div> -->
                                                <div role="tabpanel" class="fna-tab-content tab-pane item" id="benefits-navtabs-3">
                                                    <div class="benefits-content clearfix">
                                                        <img src="<%=request.getContextPath()%>/resources/images/easy-health/landing-benefit-6.png">
                                                        <div class="info">
                                                            <h3>Life protection</h3>
                                                            <p>The Plan will offer a life protection of 150% of Total Annualised Premium to ease your family needs at the unfortunate event of death of the insured person.  There will be an additional accidental death benefit of 50% of Total Annualised Premium if the death is caused by an accident.</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div role="tabpanel" class="fna-tab-content tab-pane item" id="benefits-navtabs-4">
                                                    <div class="benefits-content clearfix">
                                                        <img src="<%=request.getContextPath()%>/resources/images/easy-health/landing-benefit-6.png">
                                                        <div class="info">
                                                            <h3>Easy Online Purchase</h3>
                                                            <p>Simplified underwriting process enables you to complete the entire application process online. You may also visit our Customer Service Centers for more comprehensive coverage.</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                    <!-- Carousel 
                                    <a class="left carousel-control hidden-lg hidden-md ui-link" href="#so-carousel" role="button" data-slide="prev">
                                    </a>
                                    <a class="right carousel-control hidden-lg hidden-md ui-link" href="#so-carousel" role="button" data-slide="next">
                                    </a>
                                    -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="fna-icons-body text-center clearfix">
                <div class="fwd-container-limit" id="nav-holder">
                    <ul class="nav nav-tabs row so-fna-row visible-xs visible-sm" role="tablist">
                        <li role="presentation" class="col-lg-3 col-md-3 col-sm-3 col-xs-3 navtabs-li active" id="nav-title-1">
                            <a href="#navtabs-1" role="tab" data-toggle="tab" class="navtabs-title first-fna ui-link">Here when you need us</a>
                        </li>
                        <li role="presentation" class="col-lg-3 col-md-3 col-sm-3 col-xs-3 navtabs-li" id="nav-title-2">
                            <a href="#navtabs-2" role="tab" data-toggle="tab" class="navtabs-title ui-link">Come visit us</a>
                        </li>
                        <li role="presentation" class="col-lg-3 col-md-3 col-sm-3 col-xs-3 navtabs-li" id="nav-title-3">
                            <a href="#navtabs-3" role="tab" data-toggle="tab" class="navtabs-title ui-link">Make claims easy</a>
                        </li>
                        <li role="presentation" class="col-lg-3 col-md-3 col-sm-3 col-xs-3 navtabs-li last" id="nav-title-4">
                            <a href="#navtabs-4" role="tab" data-toggle="tab" class="navtabs-title last-fna ui-link">eService app available</a>
                        </li>
                    </ul>
                    <div class="fna-carousel carousel slide" id="so-carousel" data-ride="carousel" data-interval="false">
                        <div class="tab-content carousel-inner clearfix" role="listbox">
                            <div role="tabpanel" class="fna-tab-content tab-pane item active" id="navtabs-1" next-target="nav-title-2">
                                <div class="so-fna-content">
                                    <div class="fna-icon-circle">
                                        <img src="<%=request.getContextPath()%>/resources/images/savie-regular/fna-1.png">
                                    </div>
                                    <h3 class="visible-md visible-lg  tab-head">Here when you need us</h3>
                                     <p>Our 24/7 Live Chat and Customer Hotline 3123 3123 are ready to assist you anytime you need us! <!--<a href="#" class="eserv-link ui-link">eServices</a>--></p>
                                </div>
                            </div>
                            <div role="tabpanel" class="fna-tab-content tab-pane item" id="navtabs-2" next-target="nav-title-3">
                                <div class="so-fna-content">
                                    <div class="fna-icon-circle">
                                        <img src="<%=request.getContextPath()%>/resources/images/savie-regular/fna-2.png">
                                    </div>
                                    <h3 class="visible-md visible-lg tab-head">Come visit us</h3>
                                    <p> 6 Customer Service Centres across Hong Kong, Kowloon and New Territories, to provide efficient, personalised and quality service for you.</p>
                                </div>
                            </div>
                            <div role="tabpanel" class="fna-tab-content tab-pane item" id="navtabs-3" next-target="nav-title-4">
                                <div class="so-fna-content">
                                    <div class="fna-icon-circle">
                                        <img src="<%=request.getContextPath()%>/resources/images/savie-regular/fna-3.png">
                                    </div>
                                    <h3 class="visible-md visible-lg tab-head">Make claims easy</h3>
                                    <p>We have developed a simple and quick process to make it easier for you to make a claim. <a href="http://www.fwd.com.hk/en/support-claims/" class="eserv-link ui-link" target="_blank">Click here</a> to learn more</p>
                                </div>
                            </div>
                            <div role="tabpanel" class="fna-tab-content tab-pane item" id="navtabs-4" next-target="nav-title-1">
                                <div class="so-fna-content">
                                    <div class="fna-icon-circle">
                                        <img src="<%=request.getContextPath()%>/resources/images/savie-regular/fna-4.png">
                                    </div>
                                    <h3 class="visible-md visible-lg  tab-head">eService app available</h3>
                                    <p>Download our <a href="http://www.fwd.com.hk/en/support-claims/eservices-app/" class="eserv-link ui-link" target="_blank">eServices App</a> and get the support you need, when you need it.</p>
                                </div>
                            </div>
                        </div>
                        <!-- Carousel -->
                        <a class="left carousel-control hidden-lg hidden-md ui-link" href="#so-carousel" role="button" data-slide="prev">
                        </a>
                        <a class="right carousel-control hidden-lg hidden-md ui-link" href="#so-carousel" role="button" data-slide="next">
                        </a>
                    </div>
                </div>
            </div>
        
        <!-- OUR BLOG -->
        <div class="blog">
                <div class="hidden-md hidden-lg">
                    <div class="mini-banner-holder">
                        <img src="<%=request.getContextPath()%>/resources/images/savie-regular/read-our-blog.jpg" class="img-responsive">
                        <div class="black-overlay"></div>
                        <h5 class="text-center">Save before you spend</h5>
                    </div>
                    <div class="btn-holder">
                        <button id="btn-blog-link" class="savie-regular-btn">Read More from our blog</button>
                    </div>
                </div>
                <div class="hidden-xs hidden-sm">
                        <h3 class="text-center">Read more from our blog</h3>
                        <div class="gray-divide"></div>
                        <p class="definition text-center">Why not check out our savings tips?</p>
    
                        <div class="blogs-holder clearfix fwd-container-limit">
                            <div class="blogs first">
                                <img src="<%=request.getContextPath()%>/resources/images/savie-regular/blog-1.jpg" class="img-responsive">
                                <div class="orange-overlay text-center">
                                    <p class="title">Efficient and affordable lessons for babies</p>
                                    <span>SAVE</span>
                                    <p class="definition"></p>
                                    <a class="btn-read-now" href="http://blog.fwd.com.hk/en/2016/01/25/efficient-and-affordable-lessons-for-babie/" target="_blank">Read now</a>
                                </div>
                            </div>
                            <div class="blogs">
                                <img src="<%=request.getContextPath()%>/resources/images/savie-regular/blog-2.jpg" class="img-responsive">
                                <div class="orange-overlay text-center">
                                    <p class="title">Do holidays have to be savings traps?</p>
                                    <span>SAVE</span>
                                    <p class="definition"></p>
                                    <a class="btn-read-now" href="http://blog.fwd.com.hk/en/2015/12/30/do-holidays-have-to-be-saving-traps-2/" target="_blank">Read now</a>
                                </div>
                            </div>
                            <div class="blogs">
                                <img src="<%=request.getContextPath()%>/resources/images/savie-regular/blog-3.jpg" class="img-responsive">
                                <div class="orange-overlay text-center">
                                    <p class="title">Busting myths of savings traps</p>
                                    <span>SAVE</span>
                                    <p class="definition"></p>
                                    <a class="btn-read-now" href="http://blog.fwd.com.hk/en/2015/12/17/busting-the-myths-of-saving-traps-2/" target="_blank">Read now</a>
                                </div>
                            </div>
                            <div class="blogs last">
                                <img src="<%=request.getContextPath()%>/resources/images/savie-regular/blog-4.jpg" class="img-responsive">
                                <div class="orange-overlay text-center">
                                    <p class="title">That’s right! Coupons do save you BIG bucks!</p>
                                    <span>SAVE</span>
                                    <p class="definition"></p>
                                    <a class="btn-read-now" href="http://blog.fwd.com.hk/en/2015/12/09/thats-right-coupons-do-save-you-big-bucks-2/" target="_blank">Read now</a>
                                </div>
                            </div>
                        </div>
    
                        <div class="fwd-container-limit">
                            <p class="blog-notice">The information provided in the blogs is for reference only. While FWD Life Insurance Company (Bermuda) Limited and its affiliates ("FWD") use all reasonable efforts to ensure the information is accurate, FWD makes no warranties or representations as to the accuracy or completeness of any of the information and assumes no liability for any errors or omissions thereof. FWD shall not be liable for any direct, incidental, consequential, indirect or punitive damages arising out of access to, use of or inability to use the information, or any errors or omissions in the content of this material. Users should carefully evaluate the information.</p>
                        </div>
                    </div>
            </div>
            
            <a href="#" id="gotop-rp" class="go-top go-top-default rp"><img src="<%=request.getContextPath()%>/resources/images/savie-regular/to-top.jpg"></a>
        
        <!-- Customer Center Modal -->
        <div class="modal fade" role="dialog" aria-labelledby="customerCenter" id="customerCenter">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h2>Getting started is easy.<br>Just follow these simple steps to <br>complete your Savie applicaton.</h2>
                    </div>
                    <div class="modal-body">
                        <img src="<%=request.getContextPath()%>/resources/images/savie/o2o-landing/infographic-steps.jpg" />
                    </div>
                    <div class="modal-footer">
                        <div class="top-section">
                            <h2>Congratulations!</h2>
                            <h4>Your application is complete.</h4>
                            <p>Can't make it for your appointment? Call us at 3123 3123 for a reschedule.</p>
                        </div>
                        
                        <div class="bottom-section">
                            <button type="button" class="btn" data-dismiss="modal">Continue</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>

</div>
    <!-- -->

<div class="modal fade bs-example-modal-lg  in" id="policyCoveragePopup" tabindex="-1" role="dialog" aria-hidden="true">
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
