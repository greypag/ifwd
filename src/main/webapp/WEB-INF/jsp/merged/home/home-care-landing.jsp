<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page import="java.util.*"%>
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<script type="text/javascript">
var context="<%=request.getContextPath()%>";
var plan="${plan}"; 
var lang1 = "${language}";
</script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/easy-home/easyhome-landing.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/savie-regular-styles.css">
<script src="<%=request.getContextPath()%>/resources/js/vendor/jquery.inview.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/easy-home/easyhome-app-landing.js"></script>
<script type="application/ld+json">
{
  "@context":"http://schema.org/",
  "@type":"Product",
  "name":"${scriptName}",
  "image":"${scriptImg}",
  "description":"${scriptDescription}",
  "brand":{
    "@type":"Insurance",
    "name":"${scriptChildName}"
  },
  "offers":{
    "@type":"Offer",
    "priceCurrency":"HKD",
    "price":"420",
    "priceValidUntil":"2017-12-31",
    "availability":"http://schema.org/InStock",
    "seller":{
      "@type":"Organization",
      "name":"${scriptChildName}"
    }
  }
}
</script>
<div class="fwd-savie-wrapper ">
    <div class="fwd-container container-fluid breadcrumbs savie-regular-pay-breadcrumbs">
        <div class="breadcrumb-container">
            <ol class="breadcrumb breadcrumbs-product-details et-breadcrumbs">
                <li><a href="#"><fmt:message key="breadcrumb.item.home" bundle="${msg}" /></a> </li>
                <li class="divider"><i class="fa fa-angle-right"></i> </li>
                <li><a href="#"><fmt:message key="breadcrumb.item.protect" bundle="${msg}" /> </a> </li>
                <li class="divider"><i class="fa fa-angle-right"></i> </li>
                <li><a href="#"><fmt:message key="breadcrumb.item.household" bundle="${msg}" /> </a> </li>
                <li class="divider"><i class="fa fa-angle-right"></i> </li>
                <li class="active-bc" id="et-active-bc-menu"><fmt:message key="breadcrumb.item.easyhome" bundle="${msg}" /></li>
            </ol>
        </div>
    </div>
</div>
<div class="savie-regular-container savie-regular-landing rp-only">
    <div class="whole-banner">
        <div class="page-banner"> <img src="<%=request.getContextPath()%>/resources/images/easy-home/planB-landing-bg-mobile_${language}.jpg" class="img-responsive hidden-md hidden-lg"> <img src="<%=request.getContextPath()%>/resources/images/easy-home/planB-landing-bg-desktop_${language}.jpg" class="img-responsive hidden-xs hidden-sm">
            <div class="fwd-container-limit">
                <form id="o2o-landing-form" action="<%=request.getContextPath()%>/${language}/household-insurance/easy-home-care/${nextPageFlow}" method="post">
                    <div class="img-banner-text savie-landing">
                        <div id="clearfix-height-rp">
                            <button id="op-buy-now-O2O-mobile" class="savie-regular-btn start-btn"><fmt:message key="button.apply.easy.home" bundle="${msg}" /></button>
                        </div>
                        <div class="savie-product text-bold"> <a href="<fmt:message key="link.brochure.home" bundle="${msg}" />" target="_blank"><fmt:message key="label.brochure" bundle="${msg}" /></a> | <a href="<fmt:message key="link.provisions.home" bundle="${msg}" />" target="_blank"><fmt:message key="label.provisions" bundle="${msg}" /></a> </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="eh_lowest_price_container">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 center">
                    <h3 class="eh_sec_title">
                        <img src="<%=request.getContextPath()%>/resources/images/easy-home/home_s1_title_${language}.png" alt='<fmt:message key="label.title.easy.home" bundle="${msg}" />' class="img-responsive center">
                        <fmt:message key="label.title3.easy.home" bundle="${msg}" />
                    </h3>
                    <p><fmt:message key="label.gurantee.easy.home" bundle="${msg}" /></p>
                    <p><fmt:message key="label.gurantee.2.easy.home" bundle="${msg}" /> <a href="mailto:i-info.hk@fwd.com"><fmt:message key="link.fwd.email" bundle="${msg}" /></a> <fmt:message key="label.gurantee3.easy.home" bundle="${msg}" /></p>
                    <a href="javascript:void(0)" data-ani2=".eh_sale_container" class="eh_btn_more_details"><fmt:message key="button.more.easy.home" bundle="${msg}" /></a>
                    <div class="row">
                        <div class="col-xs-12 text-right nopadding">
                            <p class="eh_remark"><fmt:message key="label.remarks.easy.home" bundle="${msg}" /><a href="<%=request.getContextPath()%>/<fmt:message key="link.tnc.home.guaranteed.cheapest" bundle="${msg}" />" target="_blank"><fmt:message key="link.terms.easy.home" bundle="${msg}" /></a><fmt:message key="label.remarks2.easy.home" bundle="${msg}" /></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div>
        <div class="container eh_sec_color_wraping eh_showcase_container">
            <div class="row">
                <div class="col-xs-12">
                    <div class="col-xs-12">
                        <h3 class="text-center eh_sec_title"><fmt:message key="usp.home.jumbo" bundle="${msg}" /></h3> </div>
                    <div class="offset_card_holder">
                        <div class="col-xs-12 col-md-4 eh_example_card introAni waiting">
                            <div class="inner">
                                <h5 class="text-center eh_sec_title"><fmt:message key="usp.home.title1" bundle="${msg}" /></h5>
                                <img src="<%=request.getContextPath()%>/resources/images/easy-home/home_s2_icon_01.png" class="img-responsive center">
                                <div class="item-desc text-center">
                                    <p><fmt:message key="usp.home.text1" bundle="${msg}" /></p>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-md-4 eh_example_card introAni waiting">
                            <div class="inner">
                                <h5 class="text-center eh_sec_title"><fmt:message key="usp.home.title2" bundle="${msg}" /></h5>
                                <img src="<%=request.getContextPath()%>/resources/images/easy-home/home_s2_icon_02.png" class="img-responsive center">
                                <div class="item-desc text-center">
                                    <p class="padded"><fmt:message key="usp.home.text2" bundle="${msg}" /></p>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-md-4 eh_example_card introAni waiting">
                            <div class="inner">
                                <h5 class="text-center eh_sec_title"><fmt:message key="usp.home.title3" bundle="${msg}" /></h5>
                                <img src="<%=request.getContextPath()%>/resources/images/easy-home/home_s2_icon_03.png" class="img-responsive center">
                                <div class="item-desc text-center">
                                    <p class="padded"><fmt:message key="usp.home.text3" bundle="${msg}" /></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 text-center"> <a href="javascript:void(0);" data-ani2=".example-container" class="eh_btn_more_details"><fmt:message key="usp.home.button.case.sharing" bundle="${msg}" /></a> </div>
                    <div class="col-xs-12">
                        <p class="eh_remark"><fmt:message key="usp.home.remarks" bundle="${msg}" /></p>    
                    </div>  
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="container eh_sec_color_wraping eh_sale_container">
                <div class="col-xs-12 eh_halfbanner eh_cfucome_banner">
                    <div class="col-xs-12">
                        <h3 class="text-center eh_sec_title"><fmt:message key="joint.pro1.jumbo" bundle="${msg}" /></h3> </div>
                    <div class="row">
                        <div class="col-xs-12 col-md-6 nopadding ah_box"> <img src="<%=request.getContextPath()%>/resources/images/easy-home/home_s3_images.jpg" alt="Cfu Come" class="img-responsive"> </div>
                        <div class="col-xs-12 col-md-6 nopadding eh_hb_txt_box ah_box">
                            <div class="apr_content"> <img src="<%=request.getContextPath()%>/resources/images/easy-home/home_s3_logo.png" alt="CFu Come" class="img-responsive">
                                <div class="col-xs-12 nopadding eh_hb_desc"><fmt:message key="joint.pro1.description" bundle="${msg}" /></div>
                                <div class="col-xs-12 nopadding"> <a href="<%=request.getContextPath()%>/${language}/<fmt:message key="link.partner_offers" bundle="${msg}" />" class="eh_btn_more_details" target="_blank"><fmt:message key="button.details.esay.home" bundle="${msg}" /></a> </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="container eh_sec_color_wraping eh_3_feature">
                <div class="col-xs-12 nopadding eh_inner_color">
                    <div class="col-xs-12 eh_sec_title"> <img src="<%=request.getContextPath()%>/resources/images/easy-home/home_s3_title_${language}.png" alt='<fmt:message key="button.pro2.jumbo" bundle="${msg}" />' class="img-responsive center"> </div>
                    <div class="autoAlignBox">
                        <div class="col-xs-12 col-md-4 eh_feature_box f1">
                            <div class="inner introAni waiting">
                                <h4 class="eh_feature_box_title text-center">
                                <fmt:message key="joint.pro1.title1" bundle="${msg}" />
                        </h4> <img src="<%=request.getContextPath()%>/resources/images/easy-home/home_s3_icon_01.png" alt="" class="img-responsive center">
                                <p class="eh_feature_box_desc text-center"><fmt:message key="joint.pro1.text1.1" bundle="${msg}" /> <fmt:message key="joint.pro1.more.copy1" bundle="${msg}" /> <a href="<fmt:message key="link.partner.cfu.come.link1" bundle="${msg}" />" class="color-teal-blue" target="_blank"><fmt:message key="joint.pro1.more.copy2" bundle="${msg}" /></a> <fmt:message key="joint.pro1.more.copy3" bundle="${msg}" /></p>
                                <p class="expiryDate">
                                    <fmt:message key="joint.pro1.remarks.directed.out" bundle="${msg}" />
                                    <br>
                                    <fmt:message key="joint.pro1.text1.2" bundle="${msg}" />
                                </p>
                            </div>
                        </div>
                        <div class="col-xs-12 col-md-4 eh_feature_box f2">
                            <div class="inner introAni waiting">
                                <h4 class="eh_feature_box_title text-center">
                            <fmt:message key="joint.pro1.title2" bundle="${msg}" />
                        </h4> <img src="<%=request.getContextPath()%>/resources/images/easy-home/home_s3_icon_02.png" alt="" class="img-responsive center">
                                <p class="eh_feature_box_desc text-center"><fmt:message key="joint.pro1.text2.1" bundle="${msg}" /> <fmt:message key="joint.pro1.more.copy1" bundle="${msg}" /> <a href="<fmt:message key="link.partner.cfu.come.link2" bundle="${msg}" />" class="color-teal-blue" target="_blank"><fmt:message key="joint.pro1.more.copy2" bundle="${msg}" /></a> <fmt:message key="joint.pro1.more.copy3" bundle="${msg}" /></p>
                                <p class="expiryDate">
                                    <fmt:message key="joint.pro1.remarks.directed.out" bundle="${msg}" />
                                    <br>
                                    <fmt:message key="joint.pro1.text2.2" bundle="${msg}" />
                                </p>
                            </div>
                        </div>
                        <div class="col-xs-12 col-md-4 eh_feature_box f3">
                            <div class="inner introAni waiting">
                                <h4 class="eh_feature_box_title text-center">
                           <fmt:message key="joint.pro1.title3" bundle="${msg}" />
                        </h4> <img src="<%=request.getContextPath()%>/resources/images/easy-home/home_s3_icon_03.png" alt="" class="img-responsive center">
                                <p class="eh_feature_box_desc text-center"><fmt:message key="joint.pro1.title3.1" bundle="${msg}" /> <fmt:message key="joint.pro1.more.copy1" bundle="${msg}" /> <a href="<fmt:message key="link.partner.cfu.come.link3" bundle="${msg}" />" class="color-teal-blue" target="_blank"><fmt:message key="joint.pro1.more.copy2" bundle="${msg}" /></a> <fmt:message key="joint.pro1.more.copy3" bundle="${msg}" /></p>
                                <p class="expiryDate">
                                    <fmt:message key="joint.pro1.remarks.directed.out" bundle="${msg}" />
                                    <br>
                                    <fmt:message key="joint.pro1.title3.2" bundle="${msg}" />
                                </p>
                            </div>
                        </div>
                    </div>
                    <p class="eh_remark"><fmt:message key="joint.pro1.remarks" bundle="${msg}" /></p>
                </div>
            </div>
        </div>
    </div> 
    <div class="container">
        <div class="row">
            <div class="container eh_sec_color_wraping eh_theclub_container">
                <div class="col-xs-12 eh_halfbanner">
                    <div class="row">
                        <div class="col-xs-12 col-md-6 nopadding eh_hb_txt_box ah_box">
                            <div class="apr_content"> <img src="<%=request.getContextPath()%>/resources/images/easy-home/home_s4_logo.png" alt='<fmt:message key="partner.card.theclub.home.copy1" bundle="${msg}" />' class="img-responsive">
                                <div class="col-xs-12 nopadding eh_hb_desc"><a href="<fmt:message key="theclub.link" bundle="${msg}" />" target="_blank"><fmt:message key="partner.card.theclub.home.copy1" bundle="${msg}" /></a> <fmt:message key="partner.card.theclub.home.copy2" bundle="${msg}" /><br/><br/><%-- <fmt:message key="partner.the.club.3x.period" bundle="${msg}" /> --%></div>
                                <div class="col-xs-12 nopadding"><a href="<fmt:message key="theclub.clubpoint.link" bundle="${msg}" />" class="eh_btn_more_details" target="_blank"><fmt:message key="partner.card.theclub.home.copy3" bundle="${msg}" /></a></div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-md-6 nopadding ah_box"> <img src="<%=request.getContextPath()%>/resources/images/easy-home/home_s4_images.jpg" alt="Cfu Come" class="img-responsive"> </div>
                    </div>
                </div>
                <div class="col-xs-12">
                    <p class="text-center eh_theclub_txt"><fmt:message key="partner.card.theclub.home.copy4" bundle="${msg}" /><a href="<fmt:message key="link.provisions.home" bundle="${msg}" />" target="_blank"><fmt:message key="partner.card.theclub.home.copy5" bundle="${msg}" /></a><fmt:message key="partner.card.theclub.home.copy6" bundle="${msg}" /><a href="<fmt:message key="link.brochure.home" bundle="${msg}" />" target="_blank"><fmt:message key="partner.card.theclub.home.copy7" bundle="${msg}" /></a><fmt:message key="partner.card.theclub.home.copy8" bundle="${msg}" /> <fmt:message key="partner.card.theclub.home.copy9" bundle="${msg}" /></p>
                </div>
            </div>
        </div>
    </div>
    <div class="container example-container">
        <div class="row">
            <div class="col-xs-12 text-center">
                <h3 class="eh_sec_title"><fmt:message key="casesharing.home.liability.jumbo" bundle="${msg}" /></h3>
            </div>
            <div class="hidden-sm hidden-xs col-md-12  text-center">
                <canvas id="canvas" class="waiting" width="1024" height="480" style="background-color:#90D3DD"></canvas>
                <script src="https://code.createjs.com/createjs-2015.11.26.min.js"></script>
                <script>window.eh_caseAniImgPath = "<%=request.getContextPath()%>/resources/images/easy-home/caseA/${language}";</script>
                <script src="<%=request.getContextPath()%>/resources/js/easy-home/home_case _v2.js?1465281955995"></script>
                <script>
                    var canvas, stage, exportRoot;

                    startPerloadingCanvasImg();

                    function init() {
                        // --- write your JS code here ---
                        
                        canvas = document.getElementById("canvas");
                        images = images||{};

                        var loader = new createjs.LoadQueue(false);
                        loader.addEventListener("fileload", handleFileLoad);
                        loader.addEventListener("complete", handleComplete);
                        loader.loadManifest(lib.properties.manifest);
                    }

                    function handleFileLoad(evt) {
                        if (evt.item.type == "image") { images[evt.item.id] = evt.result; }
                    }

                    function handleComplete(evt) {
                        exportRoot = new lib.home_case_v2_en();

                        stage = new createjs.Stage(canvas);
                        stage.addChild(exportRoot);
                        stage.update();
                        stage.enableMouseOver();

                        createjs.Ticker.setFPS(lib.properties.fps);
                        createjs.Ticker.addEventListener("tick", stage);
                    }
                </script>
            </div>
            <div class="hidden-md hidden-lg col-xs-12 nopaddding eh_example_case_m">
                <div>
                    <img src="<%=request.getContextPath()%>/resources/images/easy-home/caseB/caseB_main_banner.jpg" alt="" class="img-responsive">
                </div>
                <div>
                    <a class="caseItem collapsed" role="button" data-toggle="collapse" href="#ce1" aria-expanded="false" aria-controls="ce1">
                      <fmt:message key="casesharing.home.case1.title" bundle="${msg}" />
                    </a>
                </div>
                <div class="collapse details" id="ce1">
                    <img src="<%=request.getContextPath()%>/resources/images/easy-home/caseA/caseA_A.png" alt="" class="img-responsive">
                    <p><fmt:message key="casesharing.home.case1.title2" bundle="${msg}" /><br><fmt:message key="casesharing.home.case1.text" bundle="${msg}" />
                    </p>
                </div>
                <div>
                    <a class="caseItem collapsed" role="button" data-toggle="collapse" href="#ce2" aria-expanded="false" aria-controls="ce2">
                      <fmt:message key="casesharing.home.case2.title" bundle="${msg}" />
                    </a>
                </div>
                <div class="collapse details" id="ce2">
                    <img src="<%=request.getContextPath()%>/resources/images/easy-home/caseA/caseA_B.png" alt="" class="img-responsive">
                    <p><fmt:message key="casesharing.home.case2.title2" bundle="${msg}" /><br><fmt:message key="casesharing.home.case2.text" bundle="${msg}" /></p>
                </div>
                <div>
                    <a class="caseItem collapsed" role="button" data-toggle="collapse" href="#ce3" aria-expanded="false" aria-controls="ce3">
                      <fmt:message key="casesharing.home.case3.title" bundle="${msg}" />
                    </a>
                </div>
                <div class="collapse details" id="ce3">
                    <img src="<%=request.getContextPath()%>/resources/images/easy-home/caseA/caseA_C.png" alt="" class="img-responsive">
                    <p><fmt:message key="casesharing.home.case3.title2" bundle="${msg}" /><br><fmt:message key="casesharing.home.case3.text" bundle="${msg}" /></p>
                </div>
                <div>
                    <a class="caseItem collapsed" role="button" data-toggle="collapse" href="#ce4" aria-expanded="false" aria-controls="ce4">
                      <fmt:message key="casesharing.home.case4.title" bundle="${msg}" />
                    </a>
                </div>
                <div class="collapse details" id="ce4">
                    <img src="<%=request.getContextPath()%>/resources/images/easy-home/caseA/caseA_D.png" alt="" class="img-responsive">
                    <p><fmt:message key="casesharing.home.case4.title2" bundle="${msg}" /><br><fmt:message key="casesharing.home.case4.text" bundle="${msg}" /></p>
                </div>
                <div>
                    <a class="caseItem collapsed" role="button" data-toggle="collapse" href="#ce5" aria-expanded="false" aria-controls="ce5">
                      <fmt:message key="casesharing.home.case5.title" bundle="${msg}" />
                    </a>
                </div>
                <div class="collapse details" id="ce5">
                    <img src="<%=request.getContextPath()%>/resources/images/easy-home/caseA/caseA_E.png" alt="" class="img-responsive">
                    <p><fmt:message key="casesharing.home.case5.title2" bundle="${msg}" /><br><fmt:message key="casesharing.home.case5.text" bundle="${msg}" /></p>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid applyBtn-container">
        <div class="row">
            <form id="o2o-landing-form" action="<%=request.getContextPath()%>/${language}/household-insurance/easy-home-care/${nextPageFlow}" method="post">
	            <div class="col-xs-12">
	                <h3 class="text-center"><fmt:message key="jointpro2.text6" bundle="${msg}" /></h3>
	                <div class="text-center">
	                    <button class="savie-regular-btn start-btn"><fmt:message key="button.apply.easy.home" bundle="${msg}" /></button>
	                </div>
	            </div>
	        </form>
        </div>
    </div>
    <div class="fna-icons-body text-center clearfix">
        <div class="fwd-container-limit" id="nav-holder">
            <ul class="nav nav-tabs row so-fna-row visible-xs visible-sm" role="tablist">
                <li role="presentation" class="col-lg-3 col-md-3 col-sm-3 col-xs-3 navtabs-li active" id="nav-title-1"> <a href="#navtabs-1" role="tab" data-toggle="tab" class="navtabs-title first-fna ui-link"><fmt:message key="pillar.support.title" bundle="${msg}" /></a> </li>
                <li role="presentation" class="col-lg-3 col-md-3 col-sm-3 col-xs-3 navtabs-li" id="nav-title-2"> <a href="#navtabs-2" role="tab" data-toggle="tab" class="navtabs-title ui-link"><fmt:message key="pillar.convenience.title" bundle="${msg}" /></a> </li>
                <li role="presentation" class="col-lg-3 col-md-3 col-sm-3 col-xs-3 navtabs-li" id="nav-title-3"> <a href="#navtabs-3" role="tab" data-toggle="tab" class="navtabs-title ui-link"><fmt:message key="pillar.claims.easy.title" bundle="${msg}" /></a> </li>
                <li role="presentation" class="col-lg-3 col-md-3 col-sm-3 col-xs-3 navtabs-li last" id="nav-title-4"> <a href="#navtabs-4" role="tab" data-toggle="tab" class="navtabs-title last-fna ui-link"><fmt:message key="pillar.eService.app.title" bundle="${msg}" /></a> </li>
            </ul>
            <div class="fna-carousel carousel slide" id="so-carousel" data-ride="carousel" data-interval="false">
                <div class="tab-content carousel-inner clearfix" role="listbox">
                    <div role="tabpanel" class="fna-tab-content tab-pane item active" id="navtabs-1" next-target="nav-title-2">
                        <div class="so-fna-content">
                            <div class="fna-icon-circle"> <img src="<%=request.getContextPath()%>/resources/images/pillar/pillar-01.png" alt="<fmt:message key="image.alt_13" bundle="${msg}" />"> </div>
                            <h3 class="visible-md visible-lg  tab-head"><fmt:message key="pillar.support.title" bundle="${msg}" /></h3>
                            <p><fmt:message key="pillar.support.copy1" bundle="${msg}" />
                                <!--<a href="#" class="eserv-link ui-link">eServices</a>-->
                            </p>
                        </div>
                    </div>
                    <div role="tabpanel" class="fna-tab-content tab-pane item" id="navtabs-2" next-target="nav-title-3">
                        <div class="so-fna-content">
                            <div class="fna-icon-circle"> <img src="<%=request.getContextPath()%>/resources/images/pillar/pillar-02.png" alt="<fmt:message key="image.alt_11" bundle="${msg}" />"> </div>
                            <h3 class="visible-md visible-lg tab-head"><fmt:message key="pillar.convenience.title" bundle="${msg}" /></h3>
                            <p><fmt:message key="pillar.convenience.copy1" bundle="${msg}" /></p>
                        </div>
                    </div>
                    <div role="tabpanel" class="fna-tab-content tab-pane item" id="navtabs-3" next-target="nav-title-4">
                        <div class="so-fna-content">
                            <div class="fna-icon-circle"> <img src="<%=request.getContextPath()%>/resources/images/pillar/pillar-03.png" alt="<fmt:message key="image.alt_9" bundle="${msg}" />"> </div>
                            <h3 class="visible-md visible-lg tab-head"><fmt:message key="pillar.claims.easy.title" bundle="${msg}" /></h3>
                            <p><fmt:message key="pillar.claims.easy.copy1.part1" bundle="${msg}" /><a href="<fmt:message key="link.claims" bundle="${msg}" />" class="eserv-link ui-link" target="_blank"><fmt:message key="pillar.claims.easy.copy1.part2" bundle="${msg}" /></a><fmt:message key="pillar.claims.easy.copy1.part3" bundle="${msg}" /></p>
                        </div>
                    </div>
                    <div role="tabpanel" class="fna-tab-content tab-pane item" id="navtabs-4" next-target="nav-title-1">
                        <div class="so-fna-content">
                            <div class="fna-icon-circle"> <img src="<%=request.getContextPath()%>/resources/images/pillar/pillar-04.png" alt="<fmt:message key="image.alt_12" bundle="${msg}" />"> </div>
                            <h3 class="visible-md visible-lg  tab-head"><fmt:message key="pillar.eService.app.title" bundle="${msg}" /></h3>
                            <p><fmt:message key="pillar.eService.app.copy1.part1" bundle="${msg}" /><a href="<fmt:message key="link.eservice.app" bundle="${msg}" />" class="eserv-link ui-link" target="_blank"><fmt:message key="pillar.eService.app.copy1.part2" bundle="${msg}" /></a><fmt:message key="pillar.eService.app.copy1.part3" bundle="${msg}" /></p>
                        </div>
                    </div>
                </div>
                <!-- Carousel -->
                <a class="left carousel-control hidden-lg hidden-md ui-link" href="#so-carousel" role="button" data-slide="prev"> </a>
                <a class="right carousel-control hidden-lg hidden-md ui-link" href="#so-carousel" role="button" data-slide="next"> </a>
            </div>
        </div>
    </div>
    <!-- OUR BLOG -->
    <div class="blog">
        <div class="hidden-md hidden-lg">
            <div class="mini-banner-holder"><img src="<%=request.getContextPath()%>/resources/images/easy-home/blog/homecare-blog1.jpg" class="img-responsive">
                <div class="black-overlay"></div>
                <h5 class="text-center"><fmt:message key="blog.homecare.title" bundle="${msg}" /></h5> </div>
            <div class="btn-holder">
                <button id="btn-blog-link" class="savie-regular-btn"><fmt:message key="blog.home.title" bundle="${msg}" /></button>
            </div>
        </div>
        <div class="hidden-xs hidden-sm">
            <h3 class="text-center"><fmt:message key="blog.home.title" bundle="${msg}" /></h3>
            <div class="gray-divide"></div>
            <p class="definition text-center"><fmt:message key="blog.homecare.title" bundle="${msg}" /></p>
            <div class="blogs-holder clearfix fwd-container-limit">
                <div class="blogs first"> <img src="<%=request.getContextPath()%>/resources/images/easy-home/blog/homecare-blog1.jpg" class="img-responsive">
                    <div class="orange-overlay text-center">
                        <p class="title"><fmt:message key="blog.homecare.blog1.topic" bundle="${msg}" /></p>
                        <p class="definition"></p> <a class="btn-read-now" href="<fmt:message key="blog.homecare.blog1.link" bundle="${msg}" />" target="_blank"><fmt:message key="button.readmore.blog" bundle="${msg}" /></a> </div>
                </div>
                <div class="blogs"> <img src="<%=request.getContextPath()%>/resources/images/easy-home/blog/homecare-blog2.jpg" class="img-responsive">
                    <div class="orange-overlay text-center">
                        <p class="title"><fmt:message key="blog.homecare.blog2.topic" bundle="${msg}" /></p>
                        <p class="definition"></p> <a class="btn-read-now" href="<fmt:message key="blog.homecare.blog2.link" bundle="${msg}" />" target="_blank"><fmt:message key="button.readmore.blog" bundle="${msg}" /></a> </div>
                </div>
                <div class="blogs"> <img src="<%=request.getContextPath()%>/resources/images/easy-home/blog/homecare-blog3.png" class="img-responsive">
                    <div class="orange-overlay text-center">
                        <p class="title"><fmt:message key="blog.homecare.blog3.topic" bundle="${msg}" /></p>
                        <p class="definition"></p> <a class="btn-read-now" href="<fmt:message key="blog.homecare.blog3.link" bundle="${msg}" />" target="_blank"><fmt:message key="button.readmore.blog" bundle="${msg}" /></a> </div>
                </div>
                <div class="blogs last"> <img src="<%=request.getContextPath()%>/resources/images/easy-home/blog/homecare-blog4.jpg" class="img-responsive">
                    <div class="orange-overlay text-center">
                        <p class="title"><fmt:message key="blog.homecare.blog4.topic" bundle="${msg}" /></p>
                        <p class="definition"></p> <a class="btn-read-now" href="<fmt:message key="blog.homecare.blog4.link" bundle="${msg}" />" target="_blank"><fmt:message key="button.readmore.blog" bundle="${msg}" /></a> </div>
                </div>
            </div>
            <div class="fwd-container-limit">
                <p class="blog-notice"><fmt:message key="disclaimer.blog" bundle="${msg}" /></p>
            </div>
        </div>
    </div>
    <!-- <a href="#" id="gotop-rp" class="go-top go-top-default rp"><img src="/resources/images/savie-regular/to-top.jpg"></a> -->
    <!-- Customer Center Modal -->
    <div class="modal fade" role="dialog" aria-labelledby="customerCenter" id="customerCenter">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h2>Getting started is easy.<br>Just follow these simple steps to <br>complete your Savie applicaton.</h2> </div>
                <div class="modal-body"> <img src="/resources/images/savie/o2o-landing/infographic-steps.jpg" /> </div>
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
