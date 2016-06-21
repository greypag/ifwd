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
                      <li><a href="#"><fmt:message key="breadcrumb.home" bundle="${msg}" /></a></li>
                      <li class="divider"><i class="fa fa-angle-right"></i></li>
                      <li><a href="#"><fmt:message key="easyhealth.breadcrumb.category" bundle="${msg}" /> </a></li>
                      <li class="divider"><i class="fa fa-angle-right"></i></li>
                      <li class="active-bc" id="et-active-bc-menu"><fmt:message key="easyhealth.breadcrumb.easyhealth" bundle="${msg}" /></li>
                     </ol>
                </div>
            </div>
    </div>
    <div class="savie-regular-container savie-regular-landing rp-only">
        <div class="whole-banner">
            <div class="page-banner">
                <img src="<%=request.getContextPath()%>/resources/images/easy-health/landing-bg-mobile.jpg" class="img-responsive hidden-md hidden-lg" alt="<fmt:message key="jumbo.easyhealth" bundle="${msg}" />">
                <img src="<%=request.getContextPath()%>/resources/images/easy-health/landing-bg-desktop.jpg" class="img-responsive hidden-xs hidden-sm" alt="<fmt:message key="jumbo.easyhealth" bundle="${msg}" />">
                <div class="fwd-container-limit">

                <form id="o2o-landing-form" action="<%=request.getContextPath()%>/${language}/${nextPageFlow}" method="post">
                    <div class="img-banner-text savie-landing">
                        <div id="clearfix-height-rp">
                            <button id="op-buy-now-O2O-mobile" class="savie-regular-btn start-btn"><fmt:message key="button.quote.easyhealth" bundle="${msg}" /></button>
                        </div>
                    <div class="savie-product text-bold">
                        <a href="<%=request.getContextPath()%>/<fmt:message key="link.provisions.easyhealth" bundle="${msg}" />" target="_blank"><fmt:message key="label.provisions" bundle="${msg}" /></a>
                        <a href="javascript:void(0);" id="cta_filler"></a>
                    </div>
                    </div>
                </form>
                </div>
            </div>
        </div>

        <div class="payment-mode">

            <p class="availability-notice text-center"><fmt:message key="label.product.statement.easyhealth" bundle="${msg}" /><span></span>
            </p>

            <!-- <h5 class="hidden-sm hidden-xs product-options text-center">
                <a href="#">Product brochure</a> | <a href="#">Product provisions</a>
            </h5> -->
        </div>

        <div class="fwd-container-limit">
                <div class="usp row">
                    <div class="usp-item clearfix col-xs-12 col-md-4">
                        <h5 class="hidden-xs hidden-sm"><fmt:message key="usp.title1.easyhealth" bundle="${msg}" /></h5>
                        <img src="<%=request.getContextPath()%>/resources/images/easy-health/landing-usp-flexible.png" class="">
                        <div class="item-desc">
                            <h5 class="hidden-md hidden-lg"><fmt:message key="usp.title1.easyhealth" bundle="${msg}" /></h5>
                            <p><fmt:message key="usp.copy1.easyhealth" bundle="${msg}" /></p>
                        </div>
                    </div>
                    <div class="usp-item clearfix col-xs-12 col-md-4">
                        <h5 class="hidden-xs hidden-sm"><fmt:message key="usp.title2.easyhealth" bundle="${msg}" /></h5>
                        <img src="<%=request.getContextPath()%>/resources/images/easy-health/landing-usp-protection.png" class="">
                        <div class="item-desc">
                            <h5 class="hidden-md hidden-lg"><fmt:message key="usp.title2.easyhealth" bundle="${msg}" /></h5>
                            <p class="padded"><fmt:message key="usp.copy2.easyhealth" bundle="${msg}" /></p>
                        </div>
                    </div>
                    <div class="usp-item clearfix col-xs-12 col-md-4">
                        <h5 class="hidden-xs hidden-sm"><fmt:message key="usp.title3.easyhealth" bundle="${msg}" /></h5>
                        <img src="<%=request.getContextPath()%>/resources/images/easy-health/landing-usp-save.png" class="">
                        <div class="item-desc">
                            <h5 class="hidden-md hidden-lg"><fmt:message key="usp.title3.easyhealth" bundle="${msg}" /></h5>
                            <p class="padded"><fmt:message key="usp.copy3.easyhealth" bundle="${msg}" /></p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="regular-benefit">
                    <div class="hidden-xs hidden-sm">
                <h3 class="benefits-desktop text-center"><fmt:message key="label.product.benefit" bundle="${msg}" /></h3>
                <div class="gray-divide"></div>
            </div>
                <div class="hidden-md hidden-lg">
                    <h4 class="text-center"><fmt:message key="label.product.benefit" bundle="${msg}" /></h4>
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
                                    <span class="two-lines"><fmt:message key="benfit.group1.easyhealth" bundle="${msg}" /></span>
                                    <div class="hidden-benefits benefits-content">
                                        <img src="<%=request.getContextPath()%>/resources/images/easy-health/landing-benefit-2.png" />
                                        <div class="info hidden-benefits-info">
                                            <h3 class="hidden-benefits-info"><fmt:message key="benfit.group1.title.easyhealth" bundle="${msg}" /></h3>
                                            <p class="hidden-benefits-info"><fmt:message key="benfit.group1.copy.easyhealth" bundle="${msg}" /></p>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-xs-6 text-center annualTravel_policy_item">
                                    <img src="<%=request.getContextPath()%>/resources/images/easy-health/landing-benefit-4.png">
                                    <span><fmt:message key="benfit.group2.easyhealth" bundle="${msg}" /></span>
                                    <div class="hidden-benefits benefits-content">
                                        <img src="<%=request.getContextPath()%>/resources/images/easy-health/landing-benefit-4.png" />
                                        <div class="info hidden-benefits-info">
                                            <h3 class="hidden-benefits-info"><fmt:message key="benfit.group2.title.easyhealth" bundle="${msg}" /></h3>
                                            <p class="hidden-benefits-info"><fmt:message key="benfit.group2.copy.easyhealth" bundle="${msg}" /></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-6 text-center annualTravel_policy_item">
                                    <img src="<%=request.getContextPath()%>/resources/images/easy-health/landing-benefit-6.png">
                                    <span><fmt:message key="benfit.group3.easyhealth" bundle="${msg}" /></span>
                                    <div class="hidden-benefits benefits-content">
                                        <img src="<%=request.getContextPath()%>/resources/images/easy-health/landing-benefit-6.png" />
                                        <div class="info">
                                            <h3 class="hidden-benefits-info"><fmt:message key="benfit.group3.title.easyhealth" bundle="${msg}" /></h3>
                                            <p class="hidden-benefits-info"><fmt:message key="benfit.group3.copy.easyhealth" bundle="${msg}" /></p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-6 text-center annualTravel_policy_item">
                                    <img src="<%=request.getContextPath()%>/resources/images/easy-health/landing-benefit-7.png">
                                    <span><fmt:message key="benfit.group4.easyhealth" bundle="${msg}" /></span>
                                    <div class="hidden-benefits benefits-content">
                                        <img src="<%=request.getContextPath()%>/resources/images/easy-health/landing-benefit-6.png" />
                                        <div class="info">
                                            <h3 class="hidden-benefits-info"><fmt:message key="benfit.group4.title.easyhealth" bundle="${msg}" /></h3>
                                            <p class="hidden-benefits-info"><fmt:message key="benfit.group4.copy.easyhealth" bundle="${msg}" /></p>
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
                                        <a href="#benefits-navtabs-1" role="tab" data-toggle="tab" class="navtabs-title last-fna ui-link text-center"><fmt:message key="benfit.group1.easyhealth" bundle="${msg}" /></a>
                                    </li>
                                    <li role="presentation" class="col-lg-3 col-md-3 col-sm-3 col-xs-3 navtabs-li" id="benefits-nav-title-2">
                                        <a href="#benefits-navtabs-2" role="tab" data-toggle="tab" class="navtabs-title ui-link text-center"><fmt:message key="benfit.group2.easyhealth" bundle="${msg}" /></a>
                                    </li>
                                    <li role="presentation" class="col-lg-3 col-md-3 col-sm-3 col-xs-3 navtabs-li" id="benefits-nav-title-3">
                                        <a href="#benefits-navtabs-3" role="tab" data-toggle="tab" class="navtabs-title ui-link text-center"><fmt:message key="benfit.group3.easyhealth" bundle="${msg}" /></span></a>
                                    </li>
                                    <li role="presentation" class="col-lg-3 col-md-3 col-sm-3 col-xs-3 navtabs-li last" id="benefits-nav-title-4">
                                        <a href="#benefits-navtabs-4" role="tab" data-toggle="tab" class="navtabs-title last-fna ui-link text-center"><fmt:message key="benfit.group4.easyhealth" bundle="${msg}" /></a>
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
                                                            <h3><fmt:message key="benfit.group1.title.easyhealth" bundle="${msg}" /></h3>
                                                            <p><fmt:message key="benfit.group1.copy.easyhealth" bundle="${msg}" /></p>
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
                                                            <h3><fmt:message key="benfit.group2.title.easyhealth" bundle="${msg}" /></h3>
                                                            <p><fmt:message key="benfit.group2.copy.easyhealth" bundle="${msg}" /></p>
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
                                                            <h3><fmt:message key="benfit.group3.title.easyhealth" bundle="${msg}" /></h3>
                                                            <p><fmt:message key="benfit.group3.copy.easyhealth" bundle="${msg}" /></p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div role="tabpanel" class="fna-tab-content tab-pane item" id="benefits-navtabs-4">
                                                    <div class="benefits-content clearfix">
                                                        <img src="<%=request.getContextPath()%>/resources/images/easy-health/landing-benefit-7.png">
                                                        <div class="info">
                                                            <h3><fmt:message key="benfit.group4.title.easyhealth" bundle="${msg}" /></h3>
                                                            <p><fmt:message key="benfit.group4.copy.easyhealth" bundle="${msg}" /></p>
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
                            <a href="#navtabs-1" role="tab" data-toggle="tab" class="navtabs-title first-fna ui-link"><fmt:message key="pillar.support.title" bundle="${msg}" /></a>
                        </li>
                        <li role="presentation" class="col-lg-3 col-md-3 col-sm-3 col-xs-3 navtabs-li" id="nav-title-2">
                            <a href="#navtabs-2" role="tab" data-toggle="tab" class="navtabs-title ui-link"><fmt:message key="pillar.convenience.title" bundle="${msg}" /></a>
                        </li>
                        <li role="presentation" class="col-lg-3 col-md-3 col-sm-3 col-xs-3 navtabs-li" id="nav-title-3">
                            <a href="#navtabs-3" role="tab" data-toggle="tab" class="navtabs-title ui-link"><fmt:message key="pillar.claims.easy.title" bundle="${msg}" /></a>
                        </li>
                        <li role="presentation" class="col-lg-3 col-md-3 col-sm-3 col-xs-3 navtabs-li last" id="nav-title-4">
                            <a href="#navtabs-4" role="tab" data-toggle="tab" class="navtabs-title last-fna ui-link"><fmt:message key="pillar.eService.app.title" bundle="${msg}" /></a>
                        </li>
                    </ul>
                    <div class="fna-carousel carousel slide" id="so-carousel" data-ride="carousel" data-interval="false">
                        <div class="tab-content carousel-inner clearfix" role="listbox">
                            <div role="tabpanel" class="fna-tab-content tab-pane item active" id="navtabs-1" next-target="nav-title-2">
                                <div class="so-fna-content">
                                    <div class="fna-icon-circle">
                                        <img src="<%=request.getContextPath()%>/resources/images/savie-regular/fna-1.png">
                                    </div>
                                    <h3 class="visible-md visible-lg  tab-head"><fmt:message key="pillar.support.title" bundle="${msg}" /></h3>
                                     <p><fmt:message key="pillar.support.copy1" bundle="${msg}" /> <!--<a href="#" class="eserv-link ui-link">eServices</a>--></p>
                                </div>
                            </div>
                            <div role="tabpanel" class="fna-tab-content tab-pane item" id="navtabs-2" next-target="nav-title-3">
                                <div class="so-fna-content">
                                    <div class="fna-icon-circle">
                                        <img src="<%=request.getContextPath()%>/resources/images/savie-regular/fna-2.png">
                                    </div>
                                    <h3 class="visible-md visible-lg tab-head"><fmt:message key="pillar.convenience.title" bundle="${msg}" /></h3>
                                    <p><fmt:message key="pillar.convenience.copy1" bundle="${msg}" /></p>
                                </div>
                            </div>
                            <div role="tabpanel" class="fna-tab-content tab-pane item" id="navtabs-3" next-target="nav-title-4">
                                <div class="so-fna-content">
                                    <div class="fna-icon-circle">
                                        <img src="<%=request.getContextPath()%>/resources/images/savie-regular/fna-3.png">
                                    </div>
                                    <h3 class="visible-md visible-lg tab-head"><fmt:message key="pillar.claims.easy.title" bundle="${msg}" /></h3>
                                    <p><fmt:message key="pillar.claims.easy.copy1.part1" bundle="${msg}" /> <a href="http://www.fwd.com.hk/en/support-claims/" class="eserv-link ui-link" target="_blank"><fmt:message key="pillar.claims.easy.copy1.part2" bundle="${msg}" /></a> <fmt:message key="pillar.claims.easy.copy1.part3" bundle="${msg}" /></p>
                                </div>
                            </div>
                            <div role="tabpanel" class="fna-tab-content tab-pane item" id="navtabs-4" next-target="nav-title-1">
                                <div class="so-fna-content">
                                    <div class="fna-icon-circle">
                                        <img src="<%=request.getContextPath()%>/resources/images/savie-regular/fna-4.png">
                                    </div>
                                    <h3 class="visible-md visible-lg  tab-head"><fmt:message key="pillar.eService.app.title" bundle="${msg}" /></h3>
                                    <p><fmt:message key="pillar.eService.app.copy1.part1" bundle="${msg}" /> <a href="http://www.fwd.com.hk/en/support-claims/eservices-app/" class="eserv-link ui-link" target="_blank"><fmt:message key="pillar.eService.app.copy1.part2" bundle="${msg}" /></a> <fmt:message key="pillar.eService.app.copy1.part3" bundle="${msg}" /></p>
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
                        <button id="btn-blog-link" class="savie-regular-btn"><fmt:message key="blog.home.title" bundle="${msg}" /></button>
                    </div>
                </div>
                <div class="hidden-xs hidden-sm">
                        <h3 class="text-center"><fmt:message key="blog.home.title" bundle="${msg}" /></h3>
                        <div class="gray-divide"></div>
                        <p class="definition text-center"><fmt:message key="blog.home.description" bundle="${msg}" /></p>

                        <div class="blogs-holder clearfix fwd-container-limit">
                            <div class="blogs first">
                                <img src="<%=request.getContextPath()%>/resources/images/savie-regular/blog-1.jpg" class="img-responsive">
                                <div class="orange-overlay text-center">
                                    <p class="title"><fmt:message key="blog.savie.post1.title" bundle="${msg}" /></p>
                                    <!-- <span>SAVE</span> -->
                                    <p class="definition"><fmt:message key="blog.savie.post1.copy" bundle="${msg}" /></p>
                                    <a class="btn-read-now" href="http://blog.fwd.com.hk/en/2016/01/25/efficient-and-affordable-lessons-for-babie/" target="_blank"><fmt:message key="blog.home.readmore" bundle="${msg}" /></a>
                                </div>
                            </div>
                            <div class="blogs">
                                <img src="<%=request.getContextPath()%>/resources/images/savie-regular/blog-2.jpg" class="img-responsive">
                                <div class="orange-overlay text-center">
                                    <p class="title"><fmt:message key="blog.savie.post2.title" bundle="${msg}" /></p>
                                    <!-- <span>SAVE</span> -->
                                    <p class="definition"><fmt:message key="blog.savie.post2.copy" bundle="${msg}" /></p>
                                    <a class="btn-read-now" href="http://blog.fwd.com.hk/en/2015/12/30/do-holidays-have-to-be-saving-traps-2/" target="_blank"><fmt:message key="blog.home.readmore" bundle="${msg}" /></a>
                                </div>
                            </div>
                            <div class="blogs">
                                <img src="<%=request.getContextPath()%>/resources/images/savie-regular/blog-3.jpg" class="img-responsive">
                                <div class="orange-overlay text-center">
                                    <p class="title"><fmt:message key="blog.savie.post3.title" bundle="${msg}" /></p>
                                    <!-- <span>SAVE</span> -->
                                    <p class="definition"><fmt:message key="blog.savie.post3.copy" bundle="${msg}" /></p>
                                    <a class="btn-read-now" href="http://blog.fwd.com.hk/en/2015/12/17/busting-the-myths-of-saving-traps-2/" target="_blank"><fmt:message key="blog.home.readmore" bundle="${msg}" /></a>
                                </div>
                            </div>
                            <div class="blogs last">
                                <img src="<%=request.getContextPath()%>/resources/images/savie-regular/blog-4.jpg" class="img-responsive">
                                <div class="orange-overlay text-center">
                                    <p class="title"><fmt:message key="blog.savie.post4.title" bundle="${msg}" /></p>
                                    <!-- <span>SAVE</span> -->
                                    <p class="definition"><fmt:message key="blog.savie.post4.copy" bundle="${msg}" /></p>
                                    <a class="btn-read-now" href="http://blog.fwd.com.hk/en/2015/12/09/thats-right-coupons-do-save-you-big-bucks-2/" target="_blank"><fmt:message key="blog.home.readmore" bundle="${msg}" /></a>
                                </div>
                            </div>
                        </div>

                        <div class="fwd-container-limit">
                            <p class="blog-notice"><fmt:message key="disclaimer.blog" bundle="${msg}" /></p>
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
