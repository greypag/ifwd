<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeQuoteBean"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="enhance" uri="http://pukkaone.github.com/jsp" %>

<c:set var="context" value="<%=request.getContextPath()%>"/>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<c:set var="langLink" value="${language == 'tc' ? 'zh-HK' : 'en-US'}" />
<c:set var="captchaLang" value="${language == 'tc' ? 'zh-TW' : 'en'}" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<fmt:setBundle basename="provie" var="provieMsg" />
<script type="text/javascript">
var context = "${pageContext.request.contextPath}";
var language = "${language}";
var affiliate = "${affiliate}";
var home_url = "<%=request.getContextPath()%>";
</script>
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
    "@type":"AggregateOffer",
    "lowPrice":"1000",
    "highPrice":"1000000",
    "priceCurrency":"HKD"
  }
}


</script>
<%
	boolean isSaleActiveClass = false;
	boolean isEservicesActiveClass = false;
%>

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/savie-regular-styles.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/provie/provie-styles.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/vendor/jquery-ui.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/provie/dropdowns-enhancement.css">



<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/vendor/nouislider.min.css">
<link href="<%=request.getContextPath()%>/resources/css/pnotify.custom.min.css" media="all" rel="stylesheet" type="text/css" />

<div class="fwd-savie-wrapper savie-online-container with-breadcrumbs-steps provie-plan-appointment" id="make-an-appointment-page">

       <!-- Breadcrumb Component Start-->
		<div class="fwd-savie-wrapper ">
            <div class="fwd-container container-fluid breadcrumbs savie-regular-pay-breadcrumbs">
                <div class="breadcrumb-container">
                    <ol class="breadcrumb breadcrumbs-product-details et-breadcrumbs">
                        <li><a href="#"><fmt:message key="breadcrumb.item.home" bundle="${provieMsg}" /></a></li>
                        <li class="divider"><i class="fa fa-angle-right"></i> </li>
                        <li><a href="#"><fmt:message key="breadcrumb.item.save" bundle="${provieMsg}" /></a></li>
                        <li class="divider"><i class="fa fa-angle-right"></i> </li>
                        <li class="active-bc" id="et-active-bc-menu"><fmt:message key="breadcrumb.item.provie" bundle="${provieMsg}" /></li>
                    </ol>
                </div>
            </div>
        </div>

		<!-- Breadcrumb Component End-->

		<!-- StepIndicator Component Start-->
		     <!--<div class="container-fluid fwd-full-container browse-holder">-->

		     <!--</div>-->

		<!-- StepIndicator Component End-->
		<!-- Kitchen Begin -->
		<div class="savie-regular-container savie-regular-landing rp-only">
		     <div class="whole-banner">
                <div class="page-banner">
                	<img src="<%=request.getContextPath()%>/<fmt:message key="provie.online.hero.image.mobile" bundle="${msg}" />" class="img-responsive hidden-sm hidden-md hidden-lg">
					<img src="<%=request.getContextPath()%>/<fmt:message key="provie.online.hero.image" bundle="${msg}" />" class="img-responsive hidden-xs">
						<a class="img-bg pop-youtube" href="#vModal" data-toggle="modal" data-youtube-link="<fmt:message key="provie.landing.youtube" bundle="${provieMsg}" />">
							<img class="play-btn" src="<%=request.getContextPath()%>/resources/images/savie-2016/videoplay.png">
						</a>
						<div class="pv_overlay_text_wrap">
            			<h2 class="pv_title">&nbsp;<%-- <fmt:message key="provie.landing.breadcrumb" bundle="${provieMsg}" /> --%></h2>
            			<p class="pv_desc">&nbsp;<%-- <fmt:message key="provie.landing.title1" bundle="${provieMsg}" /> --%></p>
                	</div>

                    <div class="fwd-container-limit hidden-sm hidden-xs">
                        <form id="o2o-landing-form" action="${pageContext.request.contextPath}/${language}/savings-insurance/${nextPageFlow}"  method="post">
                            <div class="img-banner-text savie-landing">
                                <div id="clearfix-height-rp">
                                    <button id="op-buy-now-O2O-mobile" class="savie-regular-btn start-btn"><fmt:message key="provie.landing.cta.start" bundle="${provieMsg}" /></button>
                                </div>
                                <div class="savie-product text-bold">
									<fmt:message key="provie.landing.link.productbrochure" bundle="${provieMsg}" />
									<fmt:message key="provie.landing.link.productbrochure.text1" bundle="${provieMsg}" />
									<a target="_blank" href='<fmt:message key="provie.landing.link.productbrochure.link.oneoff" bundle="${provieMsg}" />'>
										<fmt:message key="provie.landing.link.productbrochure.text2" bundle="${provieMsg}" />
									</a>
									<fmt:message key="provie.landing.link.productbrochure.text3" bundle="${provieMsg}" />
									<a target="_blank" href='<fmt:message key="provie.landing.link.productbrochure.link.monthly" bundle="${provieMsg}" />'>
										<fmt:message key="provie.landing.link.productbrochure.text4" bundle="${provieMsg}" />
									</a>
									<fmt:message key="provie.landing.link.productbrochure.text5" bundle="${provieMsg}" />
								</div>

								<div class="savie-product text-bold">
									<fmt:message key="provie.landing.link.policyprovision" bundle="${provieMsg}" />
									<fmt:message key="provie.landing.link.policyprovision.text1" bundle="${provieMsg}" />
									<a target="_blank" href='<%=request.getContextPath()%>/resources/pdf/provie/<fmt:message key="provie.landing.link.policyprovision.link.hkd" bundle="${provieMsg}" />'>
										<fmt:message key="provie.landing.link.policyprovision.text2" bundle="${provieMsg}" />
									</a>
									<fmt:message key="provie.landing.link.policyprovision.text3" bundle="${provieMsg}" />
									<a target="_blank" href='<%=request.getContextPath()%>/resources/pdf/provie/<fmt:message key="provie.landing.link.policyprovision.link.usd" bundle="${provieMsg}" />'>
										<fmt:message key="provie.landing.link.policyprovision.text4" bundle="${provieMsg}" />
									</a>
									<fmt:message key="provie.landing.link.policyprovision.text5" bundle="${provieMsg}" />
								</div>

                            </div>
                        </form>
                    </div>
                </div>
            </div>
			<div class="pv_mobile_middle_buttons hidden-lg hidden-md">
				<div class="fwd-container-limit">
					<form id="o2o-landing-form" action="${pageContext.request.contextPath}/${language}/savings-insurance/${nextPageFlow}"  method="post">
						<div class="img-banner-text savie-landing">
							<div id="clearfix-height-rp">
								<button id="op-buy-now-O2O-mobile" class="savie-regular-btn start-btn"><fmt:message key="provie.landing.cta.start" bundle="${provieMsg}" /></button>
							</div>
							<div class="savie-product text-bold">
								<fmt:message key="provie.landing.link.productbrochure" bundle="${provieMsg}" />
								<fmt:message key="provie.landing.link.productbrochure.text1" bundle="${provieMsg}" />
								<a target="_blank" href='<fmt:message key="provie.landing.link.productbrochure.link.oneoff" bundle="${provieMsg}" />'>
									<fmt:message key="provie.landing.link.productbrochure.text2" bundle="${provieMsg}" />
								</a>
								<fmt:message key="provie.landing.link.productbrochure.text3" bundle="${provieMsg}" />
								<a target="_blank" href='<fmt:message key="provie.landing.link.productbrochure.link.monthly" bundle="${provieMsg}" />'>
									<fmt:message key="provie.landing.link.productbrochure.text4" bundle="${provieMsg}" />
								</a>
								<fmt:message key="provie.landing.link.productbrochure.text5" bundle="${provieMsg}" />
							</div>

							<div class="savie-product text-bold">
								<fmt:message key="provie.landing.link.policyprovision" bundle="${provieMsg}" />
								<fmt:message key="provie.landing.link.policyprovision.text1" bundle="${provieMsg}" />
								<a target="_blank" href='<%=request.getContextPath()%>/resources/pdf/provie/<fmt:message key="provie.landing.link.policyprovision.link.hkd" bundle="${provieMsg}" />'>
									<fmt:message key="provie.landing.link.policyprovision.text2" bundle="${provieMsg}" />
								</a>
								<fmt:message key="provie.landing.link.policyprovision.text3" bundle="${provieMsg}" />
								<a target="_blank" href='<%=request.getContextPath()%>/resources/pdf/provie/<fmt:message key="provie.landing.link.policyprovision.link.usd" bundle="${provieMsg}" />'>
									<fmt:message key="provie.landing.link.policyprovision.text4" bundle="${provieMsg}" />
								</a>
								<fmt:message key="provie.landing.link.policyprovision.text5" bundle="${provieMsg}" />
							</div>

						</div>
					</form>
				</div>
			</div>
            <div class="pv_productInfo">
            	<div class="container">
            		<div class="row">
            			<div class="col-xs-12">
	            			<div class="pv_desc">
	            				<!-- 主動出擊，實現儲蓄大計！<fmt:message key="provie.title" bundle="${provieMsg}" /> 真息揀理財壽險計劃於<span class="pv_highlight">首 5 年享有年度保證派息率</span>，確保戶口持續增值；更可零收費隨時提取戶口金額，另設三選一額外保障，靈活儲蓄，就由今天開始！ -->
	            				<fmt:message key="provie.landing.fixrate.table.text0" bundle="${provieMsg}" />
	            			</div>
            			</div>
            			<div class="col-xs-12 text-center">
            				<a href="#pv_sec_features" class="pv_link"><fmt:message key="provie.landing.fixrate.table.title" bundle="${provieMsg}" /></a>
            			</div>
            			<div class="col-xs-12">
							<table class="pv_product_table">
								<tr>
									<td class="pv_table_head"><fmt:message key="provie.landing.fixrate.table.text1" bundle="${provieMsg}" /></td>
									<td>
										<fmt:message key="provie.landing.fixrate.table.year.text1" bundle="${provieMsg}" />
									</td>
									<td>
										<fmt:message key="provie.landing.fixrate.table.year.text2" bundle="${provieMsg}" />
									</td>
									<td>
										<fmt:message key="provie.landing.fixrate.table.year.text3" bundle="${provieMsg}" />
									</td>
									<td>
										<fmt:message key="provie.landing.fixrate.table.year.text4" bundle="${provieMsg}" />
									</td>
									<td>
										<fmt:message key="provie.landing.fixrate.table.year.text5" bundle="${provieMsg}" />
									</td>
								</tr>
								<tr>
									<td class="pv_table_head">
										<fmt:message key="provie.landing.fixrate.table.text2" bundle="${provieMsg}" />
									</td>
									<td>
										<fmt:message key="provie.landing.fixrate.table.textp1" bundle="${provieMsg}" />
									</td>
									<td>
										<fmt:message key="provie.landing.fixrate.table.textp1" bundle="${provieMsg}" />
									</td>
									<td>
										<fmt:message key="provie.landing.fixrate.table.textp2" bundle="${provieMsg}" />
									</td>
									<td>
										<fmt:message key="provie.landing.fixrate.table.textp2" bundle="${provieMsg}" />
									</td>
									<td>
										<fmt:message key="provie.landing.fixrate.table.textp3" bundle="${provieMsg}" />
									</td>
								</tr>
								<tr>
									<td class="pv_table_head"><fmt:message key="provie.landing.fixrate.table.text3" bundle="${provieMsg}" /></td>
									<td>
										<fmt:message key="provie.landing.fixrate.table.textp2" bundle="${provieMsg}" />
									</td>
									<td>
										<fmt:message key="provie.landing.fixrate.table.textp2" bundle="${provieMsg}" />
									</td>
									<td>
										<fmt:message key="provie.landing.fixrate.table.textp2" bundle="${provieMsg}" />
									</td>
									<td>
										<fmt:message key="provie.landing.fixrate.table.textp2" bundle="${provieMsg}" />
									</td>
									<td>
										<fmt:message key="provie.landing.fixrate.table.textp3" bundle="${provieMsg}" />
									</td>
								</tr>
							</table>
            			</div>
            		</div>
            	</div>
            </div>

            <div class="pv_offers">
            	<div class="container">
            		<div class="row">
		            	<div class="col-xs-12">
		            		<h2 class="pv_offer_title">
		            			<fmt:message key="provie.landing.discount.title" bundle="${provieMsg}" />
		            		</h2>
		            	</div>
		            	<div class="col-xs-12">
		            		<ul>
		            			<li class="pv_currency_btns"><a class="pv_currency_btn" data-childId="pv_offer_cat_1" href="javascript:void(0);"><fmt:message key="provie.landing.discount.btn.text1" bundle="${provieMsg}" /></a></li>
		            			<li class="pv_currency_btns usd"><a class="pv_currency_btn" data-childId="pv_offer_cat_2" href="javascript:void(0);"><fmt:message key="provie.landing.discount.btn.text2" bundle="${provieMsg}" /></a></li>
		            		</ul>
		            	</div>
	            	</div>
	            	<div id="pv_offer_cat_1" class="row pv_offer_cat">
	            		<div class="col-xs-12 col-md-4 pv_offer">
	            			<div class="inner">
	            				<div class="pv_offer_tag">
	            					<fmt:message key="provie.landing.discount.btn.text1" bundle="${provieMsg}" />
	            				</div>
		            			<p class="pv_offer_req">
		            				<span class="pv_req_type">
		            					<fmt:message key="provie.landing.discount.paymentmode.text1" bundle="${provieMsg}" />
		            				</span>
		            				<span class="pv_req_amount">
		            					<span class="pv_offer_gteq">></span>
		            					<fmt:message key="provie.landing.discount.hkd1.value.prefix" bundle="${provieMsg}" />
		            					<span class="value">
		            						<fmt:message key="provie.landing.discount.hkd1.value.text1" bundle="${provieMsg}" />
		            					</span>
		            				</span>
		            				<span class="pv_req_or">
		            					<fmt:message key="provie.landing.discount.or.text1" bundle="${provieMsg}" />
		            				</span>
		            				<span class="pv_req_type">
		            					<fmt:message key="provie.landing.discount.paymentmode.text2" bundle="${provieMsg}" />
		            				</span>
		            				<span class="pv_req_amount">
		            					<span class="pv_offer_gteq">></span>
		            					<fmt:message key="provie.landing.discount.hkd1.value.prefix" bundle="${provieMsg}" />
		            					<span class="value">
		            						<fmt:message key="provie.landing.discount.hkd1.value.text2" bundle="${provieMsg}" />
		            					</span>
		            				</span>
		            			</p>
		            			<div class="pv_offer_rslt">
		            				<p>
		            					<span class="pv_rslt_type">
		            						<fmt:message key="provie.landing.discount.paymentmode.text3" bundle="${provieMsg}" />
		            					</span>
		            					<span class="pv_rslt_amount">
			            					<fmt:message key="provie.landing.discount.hkd1.value.prefix" bundle="${provieMsg}" />
			            					<span class="value">
			            						<fmt:message key="provie.landing.discount.hkd1.value.text3" bundle="${provieMsg}" />
			            					</span>
		            					</span>
		            				</p>
		            			</div>
		            		</div>
	            		</div>
	            		<div class="col-xs-12 col-md-4 pv_offer">
	            			<div class="inner">
	            				<div class="pv_offer_tag">
	            					<fmt:message key="provie.landing.discount.btn.text1" bundle="${provieMsg}" />
	            				</div>
		            			<p class="pv_offer_req">
		            				<span class="pv_req_type">
		            					<fmt:message key="provie.landing.discount.paymentmode.text1" bundle="${provieMsg}" />
		            				</span>
		            				<span class="pv_req_amount">
		            					<span class="pv_offer_gteq">></span>
		            					<fmt:message key="provie.landing.discount.hkd1.value.prefix" bundle="${provieMsg}" />
		            					<span class="value">
		            						<fmt:message key="provie.landing.discount.hkd2.value.text1" bundle="${provieMsg}" />
		            					</span>
		            				</span>
		            				<span class="pv_req_or">
		            					<fmt:message key="provie.landing.discount.or.text1" bundle="${provieMsg}" />
		            				</span>
		            				<span class="pv_req_type">
		            					<fmt:message key="provie.landing.discount.paymentmode.text2" bundle="${provieMsg}" />
		            				</span>
		            				<span class="pv_req_amount">
		            					<span class="pv_offer_gteq">></span>
		            					<fmt:message key="provie.landing.discount.hkd1.value.prefix" bundle="${provieMsg}" />
		            					<span class="value">
		            						<fmt:message key="provie.landing.discount.hkd2.value.text2" bundle="${provieMsg}" />
		            					</span>
		            				</span>
		            			</p>
		            			<div class="pv_offer_rslt">
		            				<p>
		            					<span class="pv_rslt_type">
		            						<fmt:message key="provie.landing.discount.paymentmode.text3" bundle="${provieMsg}" />
		            					</span>
		            					<span class="pv_rslt_amount">
			            					<fmt:message key="provie.landing.discount.hkd1.value.prefix" bundle="${provieMsg}" />
			            					<span class="value">
			            						<fmt:message key="provie.landing.discount.hkd2.value.text3" bundle="${provieMsg}" />
			            					</span>
		            					</span>
		            				</p>
		            			</div>
		            		</div>
	            		</div>
	            		<div class="col-xs-12 col-md-4 pv_offer">
	            			<div class="inner">
	            				<div class="pv_offer_tag">
	            					<fmt:message key="provie.landing.discount.btn.text1" bundle="${provieMsg}" />
	            				</div>
		            			<p class="pv_offer_req">
		            				<span class="pv_req_type">
		            					<fmt:message key="provie.landing.discount.paymentmode.text1" bundle="${provieMsg}" />
		            				</span>
		            				<span class="pv_req_amount">
		            					<span class="pv_offer_gteq">></span>
		            					<fmt:message key="provie.landing.discount.hkd1.value.prefix" bundle="${provieMsg}" />
		            					<span class="value">
		            						<fmt:message key="provie.landing.discount.hkd3.value.text1" bundle="${provieMsg}" />
		            					</span>
		            				</span>
		            				<span class="pv_req_or">
		            					<fmt:message key="provie.landing.discount.or.text1" bundle="${provieMsg}" />
		            				</span>
		            				<span class="pv_req_type">
		            					<fmt:message key="provie.landing.discount.paymentmode.text2" bundle="${provieMsg}" />
		            				</span>
		            				<span class="pv_req_amount">
		            					<span class="pv_offer_gteq">></span>
		            					<fmt:message key="provie.landing.discount.hkd1.value.prefix" bundle="${provieMsg}" />
		            					<span class="value">
		            						<fmt:message key="provie.landing.discount.hkd3.value.text2" bundle="${provieMsg}" />
		            					</span>
		            				</span>
		            			</p>
		            			<div class="pv_offer_rslt">
		            				<p>
		            					<span class="pv_rslt_type">
		            						<fmt:message key="provie.landing.discount.paymentmode.text3" bundle="${provieMsg}" />
		            					</span>
		            					<span class="pv_rslt_amount">
			            					<fmt:message key="provie.landing.discount.hkd1.value.prefix" bundle="${provieMsg}" />
			            					<span class="value">
			            						<fmt:message key="provie.landing.discount.hkd3.value.text3" bundle="${provieMsg}" />
			            					</span>
		            					</span>
		            				</p>
		            			</div>
		            		</div>
	            		</div>
	            	</div>
	            	<div id="pv_offer_cat_2" class="row pv_offer_cat usd">
	            		<div class="col-xs-12 col-md-4 pv_offer">
	            			<div class="inner">
	            				<div class="pv_offer_tag">
	            					<fmt:message key="provie.landing.discount.btn.text2" bundle="${provieMsg}" />
	            				</div>
		            			<p class="pv_offer_req">
		            				<span class="pv_req_type">
		            					<fmt:message key="provie.landing.discount.paymentmode.text1" bundle="${provieMsg}" />
		            				</span>
		            				<span class="pv_req_amount">
		            					<span class="pv_offer_gteq">></span>
		            					<fmt:message key="provie.landing.discount.usd1.value.prefix" bundle="${provieMsg}" />
		            					<span class="value">
		            						<fmt:message key="provie.landing.discount.usd1.value.text1" bundle="${provieMsg}" />
		            					</span>
		            				</span>
		            				<span class="pv_req_or">
		            					<fmt:message key="provie.landing.discount.or.text1" bundle="${provieMsg}" />
		            				</span>
		            				<span class="pv_req_type">
		            					<fmt:message key="provie.landing.discount.paymentmode.text2" bundle="${provieMsg}" />
		            				</span>
		            				<span class="pv_req_amount">
		            					<span class="pv_offer_gteq">></span>
		            					<fmt:message key="provie.landing.discount.usd1.value.prefix" bundle="${provieMsg}" />
		            					<span class="value">
		            						<fmt:message key="provie.landing.discount.usd1.value.text2" bundle="${provieMsg}" />
		            					</span>
		            				</span>
		            			</p>
		            			<div class="pv_offer_rslt">
		            				<p>
		            					<span class="pv_rslt_type">
		            						<fmt:message key="provie.landing.discount.paymentmode.text3" bundle="${provieMsg}" />
		            					</span>
		            					<span class="pv_rslt_amount">
			            					<fmt:message key="provie.landing.discount.usd1.value.prefix" bundle="${provieMsg}" />
			            					<span class="value">
			            						<fmt:message key="provie.landing.discount.usd1.value.text3" bundle="${provieMsg}" />
			            					</span>
		            					</span>
		            				</p>
		            			</div>
		            		</div>
	            		</div>

	            		<div class="col-xs-12 col-md-4 pv_offer">
	            			<div class="inner">
	            				<div class="pv_offer_tag">
	            					<fmt:message key="provie.landing.discount.btn.text2" bundle="${provieMsg}" />
	            				</div>
		            			<p class="pv_offer_req">
		            				<span class="pv_req_type">
		            					<fmt:message key="provie.landing.discount.paymentmode.text1" bundle="${provieMsg}" />
		            				</span>
		            				<span class="pv_req_amount">
		            					<span class="pv_offer_gteq">></span>
		            					<fmt:message key="provie.landing.discount.usd1.value.prefix" bundle="${provieMsg}" />
		            					<span class="value">
		            						<fmt:message key="provie.landing.discount.usd2.value.text1" bundle="${provieMsg}" />
		            					</span>
		            				</span>
		            				<span class="pv_req_or">
		            					<fmt:message key="provie.landing.discount.or.text1" bundle="${provieMsg}" />
		            				</span>
		            				<span class="pv_req_type">
		            					<fmt:message key="provie.landing.discount.paymentmode.text2" bundle="${provieMsg}" />
		            				</span>
		            				<span class="pv_req_amount">
		            					<span class="pv_offer_gteq">></span>
		            					<fmt:message key="provie.landing.discount.usd1.value.prefix" bundle="${provieMsg}" />
		            					<span class="value">
		            						<fmt:message key="provie.landing.discount.usd2.value.text2" bundle="${provieMsg}" />
		            					</span>
		            				</span>
		            			</p>
		            			<div class="pv_offer_rslt">
		            				<p>
		            					<span class="pv_rslt_type">
		            						<fmt:message key="provie.landing.discount.paymentmode.text3" bundle="${provieMsg}" />
		            					</span>
		            					<span class="pv_rslt_amount">
			            					<fmt:message key="provie.landing.discount.usd1.value.prefix" bundle="${provieMsg}" />
			            					<span class="value">
			            						<fmt:message key="provie.landing.discount.usd2.value.text3" bundle="${provieMsg}" />
			            					</span>
		            					</span>
		            				</p>
		            			</div>
		            		</div>
	            		</div>

	            		<div class="col-xs-12 col-md-4 pv_offer">
	            			<div class="inner">
	            				<div class="pv_offer_tag">
	            					<fmt:message key="provie.landing.discount.btn.text2" bundle="${provieMsg}" />
	            				</div>
		            			<p class="pv_offer_req">
		            				<span class="pv_req_type">
		            					<fmt:message key="provie.landing.discount.paymentmode.text1" bundle="${provieMsg}" />
		            				</span>
		            				<span class="pv_req_amount">
		            					<span class="pv_offer_gteq">></span>
		            					<fmt:message key="provie.landing.discount.usd1.value.prefix" bundle="${provieMsg}" />
		            					<span class="value">
		            						<fmt:message key="provie.landing.discount.usd3.value.text1" bundle="${provieMsg}" />
		            					</span>
		            				</span>
		            				<span class="pv_req_or">
		            					<fmt:message key="provie.landing.discount.or.text1" bundle="${provieMsg}" />
		            				</span>
		            				<span class="pv_req_type">
		            					<fmt:message key="provie.landing.discount.paymentmode.text2" bundle="${provieMsg}" />
		            				</span>
		            				<span class="pv_req_amount">
		            					<span class="pv_offer_gteq">></span>
		            					<fmt:message key="provie.landing.discount.usd1.value.prefix" bundle="${provieMsg}" />
		            					<span class="value">
		            						<fmt:message key="provie.landing.discount.usd3.value.text2" bundle="${provieMsg}" />
		            					</span>
		            				</span>
		            			</p>
		            			<div class="pv_offer_rslt">
		            				<p>
		            					<span class="pv_rslt_type">
		            						<fmt:message key="provie.landing.discount.paymentmode.text3" bundle="${provieMsg}" />
		            					</span>
		            					<span class="pv_rslt_amount">
			            					<fmt:message key="provie.landing.discount.usd1.value.prefix" bundle="${provieMsg}" />
			            					<span class="value">
			            						<fmt:message key="provie.landing.discount.usd3.value.text3" bundle="${provieMsg}" />
			            					</span>
		            					</span>
		            				</p>
		            			</div>
		            		</div>
	            		</div>


	            	</div>

	            	<div class="row pv_offer_remarks">
	            		<p class="pv-landing-text0">
								<fmt:message key="provie.landing.offer.text0" bundle="${provieMsg}" />
	            		</p>
	            		<p>
	            			<fmt:message key="provie.landing.offer.text1" bundle="${provieMsg}" />
	            			<br>
	            			<fmt:message key="provie.landing.offer.text2" bundle="${provieMsg}" />
	            		</p>
						<ul>
							<li class="pv_offer_remark"><fmt:message key="provie.landing.offer.text3" bundle="${provieMsg}" /></li>
							<li class="pv_offer_remark"><fmt:message key="provie.landing.offer.text4" bundle="${provieMsg}" /></li>
							<li class="pv_offer_remark"><fmt:message key="provie.landing.offer.text5" bundle="${provieMsg}" /></li>
							<li class="pv_offer_remark"><fmt:message key="provie.landing.offer.text7" bundle="${provieMsg}" /></li>
							<li class="pv_offer_remark"><fmt:message key="provie.landing.offer.text8" bundle="${provieMsg}" /></li>
							<li class="pv_offer_remark"><fmt:message key="provie.landing.offer.text6" bundle="${provieMsg}" /></li>
						</ul>
	            	</div>

	            	<div class="row">
	            		<a href="<%=request.getContextPath()%>/resources/pdf/provie/Provie Premium discount TnC.pdf" class="pv_offer_link" target="_blank"><fmt:message key="provie.landing.discount.pdf.link1" bundle="${provieMsg}" /></a>
	            	</div>
				</div>
            </div>

            <!--div class="pv_sec_calculator">
            	<div class="container">
            		<div class="row">
            			<div class="col-xs-12">
            				<h2 class="pv_title"><fmt:message key="provie.landing.calculation.title1" bundle="${provieMsg}" /></h2>
			            	<p class="pv_sub_heading"><fmt:message key="provie.landing.calculation.title2" bundle="${provieMsg}" /></p>

							<%-- is display tc ?? --%>

							<c:if test="${language == 'tc'}">

							      <div class="pv_statement">
									<fmt:message key="provie.landing.calculation.text1" bundle="${provieMsg}" />
									<div class="btn-group">
									  <button data-toggle="dropdown" class="dropdown-toggle" data-placeholder='<fmt:message key="provie.landing.calculation.dropdown.sex" bundle="${provieMsg}" />'><fmt:message key="provie.landing.calculation.dropdown.sex" bundle="${provieMsg}" /></button>
									    <ul class="dropdown-menu">
									      <li><input type="radio" id="genderM" name="gender" value="M"><label for="genderM"><fmt:message key="provie.landing.calculation.dropdown.sexM" bundle="${provieMsg}" /></label></li>
									      <li><input type="radio" id="genderF" name="gender" value="F"><label for="genderF"><fmt:message key="provie.landing.calculation.dropdown.sexF" bundle="${provieMsg}" /></label></li>
									    </ul>
									</div>
									<fmt:message key="provie.landing.calculation.text3" bundle="${provieMsg}" />
									<div class="btn-group">
									  <input type="text" name="age" class="input_age" placeholder='<fmt:message key="provie.landing.calculation.dropdown.age" bundle="${provieMsg}" />'>
									</div>
									<fmt:message key="provie.landing.calculation.text4" bundle="${provieMsg}" />

									<fmt:message key="provie.landing.calculation.text5" bundle="${provieMsg}" />
									<div class="btn-group">
									  <button data-toggle="dropdown" class="dropdown-toggle" data-placeholder='<fmt:message key="provie.landing.calculation.dropdown.method" bundle="${provieMsg}" />'><fmt:message key="provie.landing.calculation.dropdown.method" bundle="${provieMsg}" /></button>
									    <ul class="dropdown-menu">
									      <li><input type="radio" id="method1" name="method" value="PROVIE-SP"><label for="method1"><fmt:message key="provie.landing.calculation.dropdown.method2" bundle="${provieMsg}" /></label></li>
									      <li><input type="radio" id="method2" name="method" value="PROVIE-RP"><label for="method2"><fmt:message key="provie.landing.calculation.dropdown.method1" bundle="${provieMsg}" /></label></li>
									    </ul>
									</div>
									<fmt:message key="provie.landing.calculation.text8" bundle="${provieMsg}" />
									<div class="btn-group">
									  <input type="text" name="amount" class="input_amount" placeholder='<fmt:message key="provie.landing.calculation.dropdown.amount" bundle="${provieMsg}" />'>
									</div>

									<div class="btn-group">
									  <button data-toggle="dropdown" class="dropdown-toggle" data-placeholder='<fmt:message key="provie.landing.calculation.dropdown.currency" bundle="${provieMsg}" />'><fmt:message key="provie.landing.calculation.dropdown.currency" bundle="${provieMsg}" /></button>
									    <ul class="dropdown-menu">
									      <li><input type="radio" id="currency1" name="currency" value="HKD"><label for="currency1"><fmt:message key="provie.landing.calculation.hkd" bundle="${provieMsg}" /></label></li>
									      <li><input type="radio" id="currency2" name="currency" value="USD"><label for="currency2"><fmt:message key="provie.landing.calculation.usd" bundle="${provieMsg}" /></label></li>
									    </ul>
									</div>
									<span class="txtMonth">
										<fmt:message key="provie.landing.calculation.text9" bundle="${provieMsg}" />
										<div class="btn-group">
										  <button data-toggle="dropdown" class="dropdown-toggle" data-placeholder='<fmt:message key="provie.landing.calculation.dropdown.years" bundle="${provieMsg}" />'><fmt:message key="provie.landing.calculation.dropdown.years" bundle="${provieMsg}" /></button>
										    <ul class="dropdown-menu yearList">
										    </ul>
										</div>
										<fmt:message key="provie.landing.calculation.text10" bundle="${provieMsg}" />
									</span>
									<fmt:message key="provie.landing.calculation.text10.1" bundle="${provieMsg}" />
								</div>
							</c:if>
							<c:if test="${language == 'en'}">
							      <div class="pv_statement">
									<fmt:message key="provie.landing.calculation.text1" bundle="${provieMsg}" />
									<div class="btn-group">
									  <input type="text" name="age" class="input_age" placeholder='<fmt:message key="provie.landing.calculation.dropdown.age" bundle="${provieMsg}" />'>
									</div>
									<fmt:message key="provie.landing.calculation.text3" bundle="${provieMsg}" />
									<fmt:message key="provie.landing.calculation.text4" bundle="${provieMsg}" />
									<div class="btn-group">
									  <button data-toggle="dropdown" class="dropdown-toggle" data-placeholder='<fmt:message key="provie.landing.calculation.dropdown.sex" bundle="${provieMsg}" />'><fmt:message key="provie.landing.calculation.dropdown.sex" bundle="${provieMsg}" /></button>
									    <ul class="dropdown-menu">
									      <li><input type="radio" id="genderM" name="gender" value="M"><label for="genderM"><fmt:message key="provie.landing.calculation.dropdown.sexM" bundle="${provieMsg}" /></label></li>
									      <li><input type="radio" id="genderF" name="gender" value="F"><label for="genderF"><fmt:message key="provie.landing.calculation.dropdown.sexF" bundle="${provieMsg}" /></label></li>
									    </ul>
									</div>


									<fmt:message key="provie.landing.calculation.text5" bundle="${provieMsg}" />
									<div class="btn-group">
									  <button data-toggle="dropdown" class="dropdown-toggle" data-placeholder='<fmt:message key="provie.landing.calculation.dropdown.currency" bundle="${provieMsg}" />'><fmt:message key="provie.landing.calculation.dropdown.currency" bundle="${provieMsg}" /></button>
									    <ul class="dropdown-menu">
									      <li><input type="radio" id="currency1" name="currency" value="HKD"><label for="currency1"><fmt:message key="provie.landing.calculation.hkd" bundle="${provieMsg}" /></label></li>
									      <li><input type="radio" id="currency2" name="currency" value="USD"><label for="currency2"><fmt:message key="provie.landing.calculation.usd" bundle="${provieMsg}" /></label></li>
									    </ul>
									</div>
									<div class="btn-group">
									  <input type="text" name="amount" class="input_amount" placeholder='<fmt:message key="provie.landing.calculation.dropdown.amount" bundle="${provieMsg}" />'>
									</div>
									<fmt:message key="provie.landing.calculation.text6" bundle="${provieMsg}" />
									<div class="btn-group">
									  <button data-toggle="dropdown" class="dropdown-toggle" data-placeholder='<fmt:message key="provie.landing.calculation.dropdown.method" bundle="${provieMsg}" />'><fmt:message key="provie.landing.calculation.dropdown.method" bundle="${provieMsg}" /></button>
									    <ul class="dropdown-menu">
									      <li><input type="radio" id="method1" name="method" value="PROVIE-SP"><label for="method1"><fmt:message key="provie.landing.calculation.dropdown.method2" bundle="${provieMsg}" /></label></li>
									      <li><input type="radio" id="method2" name="method" value="PROVIE-RP"><label for="method2"><fmt:message key="provie.landing.calculation.dropdown.method1" bundle="${provieMsg}" /></label></li>
									    </ul>
									</div>
									<span class="txtMonth">
									<fmt:message key="provie.landing.calculation.text7" bundle="${provieMsg}" />
									<fmt:message key="provie.landing.calculation.text9" bundle="${provieMsg}" />
									<div class="btn-group">
									  <button data-toggle="dropdown" class="dropdown-toggle" data-placeholder='<fmt:message key="provie.landing.calculation.dropdown.years" bundle="${provieMsg}" />'><fmt:message key="provie.landing.calculation.dropdown.years" bundle="${provieMsg}" /></button>
									    <ul class="dropdown-menu yearList">
									    </ul>
									</div>
									<fmt:message key="provie.landing.calculation.text10" bundle="${provieMsg}" />
									</span>
									<fmt:message key="provie.landing.calculation.text10.1" bundle="${provieMsg}" />
								</div>
							</c:if>


							<ul class="error_list errorMsg pad-0"></ul>

							<a href="javascript:void(0);" class="pv_btn btnSubmit"><fmt:message key="provie.landing.calculation.cta.calculate" bundle="${provieMsg}" /></a>
            			</div>

            		</div>
            	</div>
            </div-->

			<div class="pv_plan">
				<div class="container">
					<div class="row">
						<div class="col-xs-12">
							<h2 class="pv_title"><fmt:message key="provie.landing.calculation.title3" bundle="${provieMsg}" /></h2>
        					<p class="pv_sub_heading"><fmt:message key="provie.landing.calculation.text11" bundle="${provieMsg}" /></p>
						</div>
						<div class="col-xs-12">
							<div class="pv_plan_wrap">
								<div class="col-xs-12 visible-md visible-lg">
									<span class="pv_hint hint1"><fmt:message key="provie.landing.calculation.bubble.text1" bundle="${provieMsg}" /></span>
									<span class="pv_hint hint2"><fmt:message key="provie.landing.calculation.year" bundle="${provieMsg}" /></span>
								</div>
    							<div class="scale topScale">
    								<span class="floatNum num1">1</span>
    								<span class="floatNum num2">2</span>
    								<span class="floatNum num3">3</span>
    								<span class="floatNum num4">4</span>
    								<span class="floatNum num5">5</span>
    								<span class="floatNum num6">100</span>
    							</div>
								<div id="slider"></div>

								<div class="scale scaleBottom">
    								<span class="floatNum num1"></span>
    								<span class="floatNum num2"></span>
    								<span class="floatNum num3"></span>
    								<span class="floatNum num4"></span>
    								<span class="floatNum num5"></span>
    								<span class="floatNum num6">2%</span>
    							</div>

								<div class="yearWarp">
									<span class="year center">
										<fmt:message key="provie.landing.calculation.interestrate" bundle="${provieMsg}" />
										<span class="txtNoWrap">
											<fmt:message key="provie.landing.calculation.interestrate0" bundle="${provieMsg}" />
										</span>
									</span>
								</div>

    							<div class="money">
									<div class="left"><fmt:message key="provie.landing.calculation.premium" bundle="${provieMsg}" /><span class="pricePrefix"></span><br><span class="monthlyFee"></span></div><!--
									--><div class="right"><fmt:message key="provie.landing.calculation.totalpremium" bundle="${provieMsg}" /><span class="pricePrefix"></span><br><span class="totalPaid"></span></div>
								</div>

								<div class="accValue">
									<img src="<%=request.getContextPath()%>/resources/images/provie/provie_landing_s2_icon.png" alt='<fmt:message key="provie.landing.calculation.accountvalue" bundle="${provieMsg}" />' class="img-responsive">
									<div class="txt"><fmt:message key="provie.landing.calculation.accountvalue" bundle="${provieMsg}" /><span class="pricePrefix"></span><br><span class="amount"></span></div>
									<div><fmt:message key="provie.landing.calculation.year.acctvalue1" bundle="${provieMsg}" /><span class="year"></span><fmt:message key="provie.landing.calculation.year.acctvalue2" bundle="${provieMsg}" /></div>
								</div>

								<div class="extra">
									<h3 class="pv_title_extra">
											<img src="<%=request.getContextPath()%>/resources/images/provie/provie_landing_slider_plus.png" alt="+" class="img-responsive imgPlus"><fmt:message key="provie.landing.calculation.3riders.title" bundle="${provieMsg}" />
									</h3>
									<div class="pv_content_extra"><fmt:message key="provie.landing.calculation.3riders.content" bundle="${provieMsg}" /></div>
									<img src="<%=request.getContextPath()%>/resources/images/provie/provie_landing_slider_line_b.png" alt="line" class="img-responsive center line">
									<div class="cardWrap">
										<div class="card card1">
											<h3 class="name"><fmt:message key="provie.landing.calculation.rider1.title" bundle="${provieMsg}" /></h3>
											<img src="<%=request.getContextPath()%>/resources/images/provie/provie_landing_s2_rider_a_s.png" alt="" class="img-responsive center">
											<p class="price"></p>
										</div>
										<div class="card card2">
											<h3 class="name"><fmt:message key="provie.landing.calculation.rider2.title" bundle="${provieMsg}" /></h3>
											<img src="<%=request.getContextPath()%>/resources/images/provie/provie_landing_s2_rider_b_s.png" alt="" class="img-responsive center">
											<p class="price"></p>
										</div>
										<div class="card card3">
											<h3 class="name"><fmt:message key="provie.landing.calculation.rider3.title" bundle="${provieMsg}" /></h3>
											<img src="<%=request.getContextPath()%>/resources/images/provie/provie_landing_s2_rider_c_s.png" alt="" class="img-responsive center">
											<p class="price"></p>
										</div>
									</div>
								</div>

								<div>
									<p class="remark">
										<fmt:message key="provie.landing.calculation.rider.remarks" bundle="${provieMsg}" />
										<br>
										<br>
										<fmt:message key="provie.landing.calculation.remarks.title" bundle="${provieMsg}" />
										<br>
										<fmt:message key="provie.landing.calculation.remarks.text" bundle="${provieMsg}" />
									</p>
								</div>
							</div>
            			</div>
					</div>
				</div>
			</div>

            <div id="pv_sec_features" class="pv_sec_features">
            	<div class="container">
            		<div class="row">
            			<div class="col-xs-12">
            				<h2 class="pv_title"><fmt:message key="provie.landing.features.title" bundle="${provieMsg}" /></h2>
            			</div>
						<div class="pv_feature_wrap">

							<div class="col-xs-6 col-lg-4 pv_feature_box text-center">
								<img src="<%=request.getContextPath()%>/resources/images/provie/provie_landing_s3_icon_01.png" alt='<fmt:message key="provie.landing.features.1.title" bundle="${provieMsg}" />' class="img_responsive">
								<h3 class="pv_feature_title"><fmt:message key="provie.landing.features.1.title" bundle="${provieMsg}" /></h3>
								<p class="pv_feature_desc hidden-xs"><fmt:message key="provie.landing.features.1.text1" bundle="${provieMsg}" /><span class="pv_remark"><fmt:message key="provie.landing.features.1.remarks" bundle="${provieMsg}" /></span></p>
							</div>

							<div class="col-xs-6 col-lg-4 pv_feature_box text-center">
								<img src="<%=request.getContextPath()%>/resources/images/provie/provie_landing_s3_icon_02.png" alt='<fmt:message key="provie.landing.features.2.title" bundle="${provieMsg}" />' class="img_responsive">
								<h3 class="pv_feature_title"><fmt:message key="provie.landing.features.2.title" bundle="${provieMsg}" /></h3>
								<div class="visible-xs">
									<a class="pop-youtube" href="#vModal" data-toggle="modal" data-youtube-link="<fmt:message key="provie.landing.features.2.youtube" bundle="${provieMsg}" />">
										<fmt:message key="provie.landing.features.playvideo" bundle="${provieMsg}" />
									</a>
								</div>
								<div class="pv_feature_desc hidden-xs">
									<fmt:message key="provie.landing.features.2.text" bundle="${provieMsg}" />
									<div>
										<a class="pop-youtube" href="#vModal" data-toggle="modal" data-youtube-link="<fmt:message key="provie.landing.features.2.youtube" bundle="${provieMsg}" />">
											<fmt:message key="provie.landing.features.playvideo" bundle="${provieMsg}" />
										</a>
									</div>
									<fmt:message key="provie.landing.features.2.remarks" bundle="${provieMsg}" />
								</div>
							</div>

							<div class="clearfix hidden-lg"></div>

							<div class="col-xs-6 col-lg-4 pv_feature_box text-center">
								<img src="<%=request.getContextPath()%>/resources/images/provie/provie_landing_s3_icon_03.png" alt='<fmt:message key="provie.landing.features.3.title" bundle="${provieMsg}" />' class="img_responsive">
								<h3 class="pv_feature_title"><fmt:message key="provie.landing.features.3.title" bundle="${provieMsg}" /></h3>
								<div class="visible-xs">
									<a class="pop-youtube" href="#vModal" data-toggle="modal" data-youtube-link="<fmt:message key="provie.landing.features.3.youtube" bundle="${provieMsg}" />">
										<fmt:message key="provie.landing.features.playvideo" bundle="${provieMsg}" />
									</a>
								</div>
								<div class="pv_feature_desc hidden-xs">
									<fmt:message key="provie.landing.features.3.text" bundle="${provieMsg}" />
									<div>
										<a class="pop-youtube" href="#vModal" data-toggle="modal" data-youtube-link="<fmt:message key="provie.landing.features.3.youtube" bundle="${provieMsg}" />">
											<fmt:message key="provie.landing.features.playvideo" bundle="${provieMsg}" />
										</a>
									</div>
									<span class="pv_remark"><fmt:message key="provie.landing.features.3.remarks" bundle="${provieMsg}" /></span>
								</div>
							</div>

							<div class="clearfix visible-lg"></div>

							<div class="col-xs-6 col-lg-4 pv_feature_box text-center">
								<img src="<%=request.getContextPath()%>/resources/images/provie/provie_landing_s3_icon_04.png" alt='<fmt:message key="provie.landing.features.4.title" bundle="${provieMsg}" />' class="img_responsive">
								<h3 class="pv_feature_title"><fmt:message key="provie.landing.features.4.title" bundle="${provieMsg}" /></h3>
								<p class="pv_feature_desc hidden-xs"><fmt:message key="provie.landing.features.4.text" bundle="${provieMsg}" /></p>
							</div>

							<div class="clearfix hidden-lg"></div>

							<div class="col-xs-6 col-lg-4 pv_feature_box text-center">
								<img src="<%=request.getContextPath()%>/resources/images/provie/provie_landing_s3_icon_05.png" alt='<fmt:message key="provie.landing.features.5.title" bundle="${provieMsg}" />' class="img_responsive">
								<h3 class="pv_feature_title"><fmt:message key="provie.landing.features.5.title" bundle="${provieMsg}" /></h3>
								<p class="pv_feature_desc hidden-xs"><fmt:message key="provie.landing.features.5.text" bundle="${provieMsg}" /></p>
							</div>

							<div class="col-xs-6 col-lg-4 pv_feature_box text-center">
								<img src="<%=request.getContextPath()%>/resources/images/provie/provie_landing_s3_icon_06.png" alt='<fmt:message key="provie.landing.features.6.title" bundle="${provieMsg}" />' class="img_responsive">
								<h3 class="pv_feature_title"><fmt:message key="provie.landing.features.6.title" bundle="${provieMsg}" /></h3>
								<p class="pv_feature_desc hidden-xs"><fmt:message key="provie.landing.features.6.text" bundle="${provieMsg}" /></p>
							</div>
						</div>
            		</div>
            	</div>
            </div>

            <div class="pv_sec_extra text-center">
            	<div class="container">
            		<div class="row">
            			<div class="col-xs-12">
            				<h2 class="pv_title header"><fmt:message key="provie.landing.riders.title" bundle="${provieMsg}" /></h2>
			            </div>

						<div class="pv_extra_wrap">
							<div class="pv_extra_box">
								<div class="col-xs-12 visible-lg">
									<div class="col-xs-12 col-md-4 ">
	                                	<div class="flip-container pv_extra_card_holder">
											<div class="flipper pv_extra_card card1">
												<div class="front">
													<h5 class="text-center pv_title"><fmt:message key="provie.landing.riders.1.title" bundle="${provieMsg}" /></h5>
			                                        <img src="<%=request.getContextPath()%>/resources/images/provie/provie_landing_s2_rider_a.png" class="img-responsive pv_extra_icon" alt='<fmt:message key="provie.landing.riders.1.title" bundle="${provieMsg}" />'>
												</div>
												<div class="back">
													<p class="pv_extra_desc"><fmt:message key="provie.landing.riders.1.text" bundle="${provieMsg}" /></p>
													<p class="price"></p>
													<a class="pv_link" href='<%=request.getContextPath()%>/resources/pdf/provie/<fmt:message key="provie.landing.riders.1.pdf.link" bundle="${provieMsg}" />' target="_blank"><fmt:message key="provie.landing.riders.1.pdf.text" bundle="${provieMsg}" /></a>
												</div>
											</div>
										</div>
	                                </div>

	                                <div class="col-xs-12 col-md-4 ">
	                                	<div class="flip-container pv_extra_card_holder">
											<div class="flipper pv_extra_card card2">
												<div class="front">
		                                        <h5 class="text-center pv_title"><fmt:message key="provie.landing.riders.2.title" bundle="${provieMsg}" /></h5>
		                                        <img src="<%=request.getContextPath()%>/resources/images/provie/provie_landing_s2_rider_b.png" class="img-responsive pv_extra_icon" alt='<fmt:message key="provie.landing.riders.2.title" bundle="${provieMsg}" />'>
		                                    </div>
		                                    <div class="back">
		                                        <p class="pv_extra_desc"><fmt:message key="provie.landing.riders.2.text" bundle="${provieMsg}" /></p>
												<p class="price"></p>
												<a class="pv_link" href='<%=request.getContextPath()%>/resources/pdf/provie/<fmt:message key="provie.landing.riders.2.pdf.link" bundle="${provieMsg}" />' target="_blank"><fmt:message key="provie.landing.riders.2.pdf.text" bundle="${provieMsg}" /></a>
		                                    </div>
											</div>
										</div>
	                                </div>

	                                <div class="col-xs-12 col-md-4 ">
	                                	<div class="flip-container pv_extra_card_holder">
											<div class="flipper pv_extra_card card3">
												<div class="front">
			                                        <h5 class="text-center pv_title"><fmt:message key="provie.landing.riders.3.title" bundle="${provieMsg}" /></h5>
			                                        <img src="<%=request.getContextPath()%>/resources/images/provie/provie_landing_s2_rider_c.png" class="img-responsive pv_extra_icon" alt='<fmt:message key="provie.landing.riders.3.title" bundle="${provieMsg}" />'>
			                                    </div>
			                                    <div class="back">
			                                        <p class="pv_extra_desc"><fmt:message key="provie.landing.riders.3.text" bundle="${provieMsg}" /></p>
			                                        <p class="price"></p>
													<a class="pv_link" href='<%=request.getContextPath()%>/resources/pdf/provie/<fmt:message key="provie.landing.riders.3.pdf.link" bundle="${provieMsg}" />' target="_blank"><fmt:message key="provie.landing.riders.3.pdf.text" bundle="${provieMsg}" /></a>
			                                    </div>
											</div>
										</div>
	                                </div>


								</div>

								<div class="col-xs-12 pv_extra_mobile hidden-lg nopadding">
									<div class="col-xs-12 pv_extra_point">
										<div class="col-xs-3 nopadding pv_extra_point_icon">
											<img src="<%=request.getContextPath()%>/resources/images/provie/provie_landing_s2_rider_a.png" class="img-responsive pv_extra_icon center" alt='<fmt:message key="provie.landing.riders.1.title" bundle="${provieMsg}" />'>
										</div>
										<div class="col-xs-9 pv_extra_point_desc">
											<h5 class="text-center pv_title text-left"><fmt:message key="provie.landing.riders.1.title" bundle="${provieMsg}" /></h5>
											<p class="pv_extra_desc text-left"><fmt:message key="provie.landing.riders.1.text" bundle="${provieMsg}" /></p>
											<a class="pv_link" href='<%=request.getContextPath()%>/resources/pdf/provie/<fmt:message key="provie.landing.riders.1.pdf.link" bundle="${provieMsg}" />' target="_blank"><fmt:message key="provie.landing.riders.1.pdf.text" bundle="${provieMsg}" /></a>
										</div>
									</div>

									<div class="col-xs-12 pv_extra_point">
										<div class="col-xs-3 nopadding pv_extra_point_icon">
											<img src="<%=request.getContextPath()%>/resources/images/provie/provie_landing_s2_rider_b.png" class="img-responsive pv_extra_icon center" alt='<fmt:message key="provie.landing.riders.2.title" bundle="${provieMsg}" />'>
										</div>
										<div class="col-xs-9 pv_extra_point_desc">
											<h5 class="text-center pv_title text-left"><fmt:message key="provie.landing.riders.2.title" bundle="${provieMsg}" /></h5>
											<p class="pv_extra_desc text-left"><fmt:message key="provie.landing.riders.2.text" bundle="${provieMsg}" /></p>
											<a class="pv_link" href='<%=request.getContextPath()%>/resources/pdf/provie/<fmt:message key="provie.landing.riders.2.pdf.link" bundle="${provieMsg}" />' target="_blank"><fmt:message key="provie.landing.riders.2.pdf.text" bundle="${provieMsg}" /></a>
										</div>
									</div>

									<div class="col-xs-12 pv_extra_point">
										<div class="col-xs-3 nopadding pv_extra_point_icon">
											<img src="<%=request.getContextPath()%>/resources/images/provie/provie_landing_s2_rider_c.png" class="img-responsive pv_extra_icon center" alt='<fmt:message key="provie.landing.riders.3.title" bundle="${provieMsg}" />'>
										</div>
										<div class="col-xs-9 pv_extra_point_desc">
											<h5 class="text-center pv_title text-left"><fmt:message key="provie.landing.riders.3.title" bundle="${provieMsg}" /></h5>
											<p class="pv_extra_desc text-left"><fmt:message key="provie.landing.riders.3.text" bundle="${provieMsg}" /></p>
											<a class="pv_link" href='<%=request.getContextPath()%>/resources/pdf/provie/<fmt:message key="provie.landing.riders.3.pdf.link" bundle="${provieMsg}" />' target="_blank"><fmt:message key="provie.landing.riders.3.pdf.text" bundle="${provieMsg}" /></a>
										</div>
									</div>
								</div>

							</div>
							<div class="col-xs-12 pv_extra_remark">
								<ul>
									<li class="pv_remark"><sup>1</sup><fmt:message key="provie.landing.riders.remarks1" bundle="${provieMsg}" /></li>
									<li class="pv_remark"><sup>2</sup><fmt:message key="provie.landing.riders.remarks2" bundle="${provieMsg}" /></li>
									<li class="pv_remark"><sup>3</sup><fmt:message key="provie.landing.riders.remarks3" bundle="${provieMsg}" /></li>
									<li class="pv_remark"><sup>4</sup><fmt:message key="provie.landing.riders.remarks4" bundle="${provieMsg}" /></li>
									<li class="pv_remark"><sup>5</sup><fmt:message key="provie.landing.riders.remarks5" bundle="${provieMsg}" /></li>
								</ul>
							</div>
						</div>
            		</div>
            	</div>
            </div>

			<div class="pv_sec_action">
				<div class="container">
					<div class="row">
						<div class="col-xs-12 text-center">
							<h2 class="pv_title">
								<fmt:message key="provie.landing.banner.saving.title" bundle="${provieMsg}" />
							</h2>

							<a href="${pageContext.request.contextPath}/${language}/savings-insurance/${nextPageFlow}" class="pv_btn"><fmt:message key="provie.landing.banner.saving.btn" bundle="${provieMsg}" /></a>
						</div>

					</div>
				</div>
			</div>

			<div class="pv_compareTable">
				<div class="container">
					<div class="row">
						<div class="col-xs-12 visible-md visible-lg">
							<table>
								<tr>
									<th colspan="2"><span class="inner">&nbsp;</span></th>
									<th colspan="2"><span class="inner highlight"><fmt:message key="provie.landing.table.title.provie" bundle="${provieMsg}" /></span></th>
									<th colspan="2"><span class="inner"><fmt:message key="provie.landing.table.title.savie" bundle="${provieMsg}" /></span></th>
								</tr>
								<tr>
									<td colspan="2"><span class="inner"><fmt:message key="provie.landing.table.title.age" bundle="${provieMsg}" /></span></td>
									<td colspan="2" class="highlight"><span class="inner"><fmt:message key="provie.landing.table.age.provie" bundle="${provieMsg}" /></span></td>
									<td colspan="2"><span class="inner"><fmt:message key="provie.landing.table.age.savie" bundle="${provieMsg}" /></span></td>
								</tr>
								<tr>
									<td colspan="2"><span class="inner"><fmt:message key="provie.landing.table.title.benefitterm" bundle="${provieMsg}" /></span></td>
									<td colspan="2" class="highlight"><span class="inner"><fmt:message key="provie.landing.table.benefitterm.provie" bundle="${provieMsg}" /></span></td>
									<td colspan="2"><span class="inner"><fmt:message key="provie.landing.table.benefitterm.savie" bundle="${provieMsg}" /></span></td>
								</tr>
								<tr>
									<td colspan="2"><span class="inner"><fmt:message key="provie.landing.table.title.currency" bundle="${provieMsg}" /></span></td>
									<td colspan="2" class="highlight"><span class="inner"><fmt:message key="provie.landing.table.currency.provie" bundle="${provieMsg}" /></span></td>
									<td colspan="2"><span class="inner"><fmt:message key="provie.landing.table.currency.savie" bundle="${provieMsg}" /></span></td>
								</tr>
								<tr>
									<td colspan="2"><span class="inner"><fmt:message key="provie.landing.table.title.interestrate" bundle="${provieMsg}" /></span></td>
									<td colspan="2" class="highlight"><span class="inner"><span class="pv_sub_heading"><fmt:message key="provie.landing.table.interestrate.remarks" bundle="${provieMsg}" /></span><br>
										<fmt:message key="provie.landing.table.interestrate.provie1" bundle="${provieMsg}" /><br><fmt:message key="provie.landing.table.interestrate.provie2" bundle="${provieMsg}" /><br>
										<fmt:message key="provie.landing.table.interestrate.provie3" bundle="${provieMsg}" /><br><br>
										<span class="pv_sub_heading"><fmt:message key="provie.landing.table.interestrate.provie.usd" bundle="${provieMsg}" /></span><br>
										<fmt:message key="provie.landing.table.interestrate.provie1.usd" bundle="${provieMsg}" /><br><fmt:message key="provie.landing.table.interestrate.provie2.usd" bundle="${provieMsg}" /></span>
									</td>
									<td colspan="2"><span class="inner"><fmt:message key="provie.landing.table.interestrate.savie" bundle="${provieMsg}" /></span></td>
								</tr>
								<tr>
									<td colspan="2"><span class="inner"><fmt:message key="provie.landing.table.title.deathbenefit" bundle="${provieMsg}" /></span></td>
									<td colspan="2" class="highlight"><span class="inner"><fmt:message key="provie.landing.table.deathbenefit.provie" bundle="${provieMsg}" /></span></td>
									<td colspan="2"><span class="inner"><fmt:message key="provie.landing.table.deathbenefit.savie" bundle="${provieMsg}" /></span></td>
								</tr>
								<tr>
									<td colspan="2"></td>
									<td colspan="2" class="sep highlight"><span class="inner"><fmt:message key="provie.landing.table.title2.rider" bundle="${provieMsg}" /></span></td>
									<td colspan="2"></td>
								</tr>
								<tr>
									<td colspan="2"><span class="inner"><fmt:message key="provie.landing.table.title.riders" bundle="${provieMsg}" /></span></td>
									<td colspan="2" class="highlight">
										<span class="inner">
											<span class="sub_title">
												<fmt:message key="provie.landing.table.title.rider1" bundle="${provieMsg}" />
											</span>
											<fmt:message key="provie.landing.table.rider1.text" bundle="${provieMsg}" />
											<span class="remark"><fmt:message key="provie.landing.table.rider1.remarks" bundle="${provieMsg}" /></span>
											<span class="sub_title">
												<fmt:message key="provie.landing.table.title.rider2" bundle="${provieMsg}" />
											</span>
											<fmt:message key="provie.landing.table.rider2.text" bundle="${provieMsg}" />
											<span class="remark"><fmt:message key="provie.landing.table.rider2.remarks" bundle="${provieMsg}" /></span>
											<span class="sub_title">
												<fmt:message key="provie.landing.table.title.rider3" bundle="${provieMsg}" />
											</span>
											<fmt:message key="provie.landing.table.rider3.text" bundle="${provieMsg}" />
											<span class="remark"><fmt:message key="provie.landing.table.rider3.remarks" bundle="${provieMsg}" /></span>
										</span>
									</td>
									<td colspan="2">
										<span class="inner">
											<span class="sub_title">
												<fmt:message key="provie.landing.table.rider1.savie.title" bundle="${provieMsg}" />
											</span>
											<fmt:message key="provie.landing.table.rider1.savie.text1" bundle="${provieMsg}" />
											<span class="remark"><fmt:message key="provie.landing.table.rider1.savie.text2" bundle="${provieMsg}" /></span>
										</span>
									</td>
								</tr>
								<tr>
									<td colspan="2"><span class="inner"><fmt:message key="provie.landing.table.withdrawal.title" bundle="${provieMsg}" /></span></td>
									<td colspan="2" class="highlight"><span class="inner"><fmt:message key="provie.landing.table.withdrawal.provie.title" bundle="${provieMsg}" /></span></td>
									<td colspan="2"><span class="inner"><fmt:message key="provie.landing.table.withdrawal.savie.title" bundle="${provieMsg}" /></span></td>
								</tr>
								<tr>
									<td colspan="2"><span class="inner"><fmt:message key="provie.landing.table.withdrawal.min.title" bundle="${provieMsg}" /></span></td>
									<td colspan="2" class="highlight"><span class="inner"><fmt:message key="provie.landing.table.withdrawal.min.provie" bundle="${provieMsg}" /></span></td>
									<td colspan="2"><span class="inner"><fmt:message key="provie.landing.table.withdrawal.min.savie" bundle="${provieMsg}" /></span></td>
								</tr>
								<tr>
									<td colspan="2"><span class="inner"><fmt:message key="provie.landing.table.withdrawal.max.title" bundle="${provieMsg}" /></span></td>
									<td colspan="2" class="highlight"><span class="inner"><fmt:message key="provie.landing.table.withdrawal.max.provie" bundle="${provieMsg}" /></span></td>
									<td colspan="2"><span class="inner"><fmt:message key="provie.landing.table.withdrawal.max.savie" bundle="${provieMsg}" /></span></td>
								</tr>
								<tr>
									<td colspan="2"></td>
									<td class="sep"><span class="inner"><fmt:message key="provie.landing.table.monthly.provie" bundle="${provieMsg}" /></span></td>
									<td class="sep hideborderLeft"><span class="inner"><fmt:message key="provie.landing.table.oneoff.provie" bundle="${provieMsg}" /></span></td>
									<td class="sep"><span class="inner"><fmt:message key="provie.landing.table.monthly.provie" bundle="${provieMsg}" /></span></td>
									<td class="sep hideborderLeft"><span class="inner"><fmt:message key="provie.landing.table.oneoff.provie" bundle="${provieMsg}" /></span></td>
								</tr>
								<tr>
									<td colspan="2"><span class="inner"><fmt:message key="provie.landing.table.title.maxamount" bundle="${provieMsg}" /></span></td>
									<td class="highlight"><span class="inner"><fmt:message key="provie.landing.table.maxamount.provie.monthly" bundle="${provieMsg}" /></span></td>
									<td class="hideborderLeft highlight"><span class="inner"><fmt:message key="provie.landing.table.maxamount.provie.oneoff" bundle="${provieMsg}" /></span></td>
									<td><span class="inner"><fmt:message key="provie.landing.table.maxamount.savie.monthly" bundle="${provieMsg}" /></span></td>
									<td class="hideborderLeft"><span class="inner"><fmt:message key="provie.landing.table.maxamount.savie.oneoff" bundle="${provieMsg}" /></span></td>
								</tr>
								<tr>
									<td colspan="2"><span class="inner"><fmt:message key="provie.landing.table.title.minamount" bundle="${provieMsg}" /></span></td>
									<td class="highlight"><span class="inner"><fmt:message key="provie.landing.table.minamount.provie.monthly" bundle="${provieMsg}" /></span></td>
									<td class="hideborderLeft highlight"><span class="inner"><fmt:message key="provie.landing.table.minamount.provie.oneoff" bundle="${provieMsg}" /></span></td>
									<td><span class="inner"><fmt:message key="provie.landing.table.minamount.savie.monthly" bundle="${provieMsg}" /></span></td>
									<td class="hideborderLeft"><span class="inner"><fmt:message key="provie.landing.table.minamount.savie.oneoff" bundle="${provieMsg}" /></span></td>
								</tr>
								<tr>
									<td colspan="2"><span class="inner"><fmt:message key="provie.landing.table.title.minacctvalue" bundle="${provieMsg}" /></span></td>
									<td colspan="2" class="highlight"><span class="inner"><fmt:message key="provie.landing.table.minacctvalue.provie" bundle="${provieMsg}" /></span></td>
									<td colspan="2"><span class="inner"><fmt:message key="provie.landing.table.minacctvalue.savie" bundle="${provieMsg}" /></span></td>
								</tr>
								<tr>
									<td colspan="6">
										<span class="inner pv_remark">
											<sup>*</sup><fmt:message key="provie.landing.table.acctvalue.remarks1" bundle="${provieMsg}" />
											<br>
											<sup>**</sup><fmt:message key="provie.landing.table.acctvalue.remarks2" bundle="${provieMsg}" />
										</span>
									</td>
								</tr>
								<tr>
									<td colspan="6">
										<span class="inner pv_remark">
											<fmt:message key="provie.landing.table.remarks1.text1" bundle="${provieMsg}" />
										</span>
									</td>
								</tr>
								<tr>
									<td colspan="6">
										<span class="inner pv_remark">
											<fmt:message key="provie.landing.table.remarks2.text1" bundle="${provieMsg}" />
											<br>
											<fmt:message key="provie.landing.table.remarks3.text1" bundle="${provieMsg}" />
										</span>
									</td>
								</tr>
							</table>
						</div>


						<div class="col-xs-12 hidden-md hidden-lg">
							<div id="tableCarousel" class="carousel slide" data-ride="carousel" data-interval="false">
								<div class="mobile">
									<a class="left carousel-control" href="#tableCarousel" role="button" data-slide="prev">
										<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
								    	<span class="sr-only">Previous</span>
									</a>
									<a class="right carousel-control" href="#tableCarousel" role="button" data-slide="next">
										<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
										<span class="sr-only">Next</span>
									</a>
									<!-- Wrapper for slides -->
									<div class="carousel-inner" role="listbox">
										<div class="item inner active">
											<div>
												<table>
													<tr>
														<th colspan="4"><span class="inner"><fmt:message key="provie.landing.table.title.provie" bundle="${provieMsg}" /></span></th>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="provie.landing.table.title.age" bundle="${provieMsg}" /></span></td>
														<td colspan="2" class="highlight"><span class="inner"><fmt:message key="provie.landing.table.age.provie" bundle="${provieMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="provie.landing.table.title.benefitterm" bundle="${provieMsg}" /></span></td>
														<td colspan="2" class="highlight"><span class="inner"><fmt:message key="provie.landing.table.benefitterm.provie" bundle="${provieMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="provie.landing.table.title.currency" bundle="${provieMsg}" /></span></td>
														<td colspan="2" class="highlight"><span class="inner"><fmt:message key="provie.landing.table.currency.provie" bundle="${provieMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="provie.landing.table.title.interestrate" bundle="${provieMsg}" /></span></td>
														<td colspan="2" class="highlight"><span class="inner"><span class="pv_sub_heading"><fmt:message key="provie.landing.table.interestrate.remarks" bundle="${provieMsg}" /></span><br>
															<fmt:message key="provie.landing.table.interestrate.provie1" bundle="${provieMsg}" /><br><fmt:message key="provie.landing.table.interestrate.provie2" bundle="${provieMsg}" /><br>
															<fmt:message key="provie.landing.table.interestrate.provie3" bundle="${provieMsg}" /><br>
															<span class="pv_sub_heading"><fmt:message key="provie.landing.table.interestrate.provie.usd" bundle="${provieMsg}" /></span><br>
															<fmt:message key="provie.landing.table.interestrate.provie1.usd" bundle="${provieMsg}" /><br><fmt:message key="provie.landing.table.interestrate.provie2.usd" bundle="${provieMsg}" /></span>
														</td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="provie.landing.table.title.deathbenefit" bundle="${provieMsg}" /></span></td>
														<td colspan="2" class="highlight"><span class="inner"><fmt:message key="provie.landing.table.deathbenefit.provie" bundle="${provieMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"></td>
														<td colspan="2" class="sep highlight"><span class="inner"><fmt:message key="provie.landing.table.title2.rider" bundle="${provieMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="provie.landing.table.title.riders" bundle="${provieMsg}" /></span></td>
														<td colspan="2" class="highlight">
															<span class="inner">
																<span class="sub_title">
																	<fmt:message key="provie.landing.table.title.rider1" bundle="${provieMsg}" />
																</span>
																<fmt:message key="provie.landing.table.rider1.text" bundle="${provieMsg}" />
																<span class="remark"><fmt:message key="provie.landing.table.rider1.remarks" bundle="${provieMsg}" /></span>
																<span class="sub_title">
																	<fmt:message key="provie.landing.table.title.rider2" bundle="${provieMsg}" />
																</span>
																<fmt:message key="provie.landing.table.rider2.text" bundle="${provieMsg}" />
																<span class="remark"><fmt:message key="provie.landing.table.rider2.remarks" bundle="${provieMsg}" /></span>
																<span class="sub_title">
																	<fmt:message key="provie.landing.table.title.rider3" bundle="${provieMsg}" />
																</span>
																<fmt:message key="provie.landing.table.rider3.text" bundle="${provieMsg}" />
																<span class="remark"><fmt:message key="provie.landing.table.rider3.remarks" bundle="${provieMsg}" /></span>
															</span>
														</td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="provie.landing.table.withdrawal.title" bundle="${provieMsg}" /></span></td>
														<td colspan="2"><span class="inner"><fmt:message key="provie.landing.table.withdrawal.provie.title" bundle="${provieMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="provie.landing.table.withdrawal.min.title" bundle="${provieMsg}" /></span></td>
														<td colspan="2"><span class="inner"><fmt:message key="provie.landing.table.withdrawal.min.provie" bundle="${provieMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="provie.landing.table.withdrawal.max.title" bundle="${provieMsg}" /></span></td>
														<td colspan="2"><span class="inner"><fmt:message key="provie.landing.table.withdrawal.max.provie" bundle="${provieMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"></td>
														<td class="sep"><span class="inner"><fmt:message key="provie.landing.table.monthly.provie" bundle="${provieMsg}" /></span></td>
														<td class="sep hideborderLeft"><span class="inner"><fmt:message key="provie.landing.table.oneoff.provie" bundle="${provieMsg}" /></span></td>
													</tr>

													 <tr>
														<td colspan="2">
															<span class="inner"><fmt:message key="provie.landing.table.title.maxamount" bundle="${provieMsg}" /></span>
														</td>
														<td class="highlight">
															<span class="inner"><fmt:message key="provie.landing.table.maxamount.provie.monthly" bundle="${provieMsg}" /></span>
														</td>
														<td class="hideborderLeft highlight">
															<span class="inner"><fmt:message key="provie.landing.table.maxamount.provie.oneoff" bundle="${provieMsg}" /></span>
														</td>
														<!-- <td class="hideborderLeft highlight">
															<span class="inner"><fmt:message key="provie.landing.table.maxamount.provie.oneoff" bundle="${provieMsg}" /></span>
														</td> -->
													</tr>



													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="provie.landing.table.title.minamount" bundle="${provieMsg}" /></span></td>
														<td class="highlight"><span class="inner"><fmt:message key="provie.landing.table.minamount.provie.monthly" bundle="${provieMsg}" /></span></td>
														<td class="hideborderLeft highlight"><span class="inner"><fmt:message key="provie.landing.table.minamount.provie.oneoff" bundle="${provieMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="provie.landing.table.title.minacctvalue" bundle="${provieMsg}" /></span></td>
														<td colspan="2" class="highlight"><span class="inner"><fmt:message key="provie.landing.table.minacctvalue.provie" bundle="${provieMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="6">
															<span class="inner pv_remark">
																<sup>*</sup><fmt:message key="provie.landing.table.acctvalue.remarks1" bundle="${provieMsg}" /><br>
																<sup>**</sup><fmt:message key="provie.landing.table.acctvalue.remarks2" bundle="${provieMsg}" />
															</span>
														</td>
													</tr>
													<tr>
														<td colspan="6">
															<span class="inner pv_remark">
																<fmt:message key="provie.landing.table.remarks1.text1" bundle="${provieMsg}" />
															</span>
														</td>
													</tr>
													<tr>
														<td colspan="6">
															<span class="inner pv_remark">
																<fmt:message key="provie.landing.table.remarks2.text1" bundle="${provieMsg}" />
																<br>
																<fmt:message key="provie.landing.table.remarks3.text1" bundle="${provieMsg}" />
															</span>
														</td>
													</tr>
												</table>
											</div>
										</div>
										<div class="item inner">
											<div>
												<table>
													<tr>
														<th colspan="4"><span class="inner"><fmt:message key="provie.landing.table.title.savie" bundle="${provieMsg}" /></span></th>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="provie.landing.table.title.age" bundle="${provieMsg}" /></span></td>
														<td colspan="2"><span class="inner"><fmt:message key="provie.landing.table.age.savie" bundle="${provieMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="provie.landing.table.title.benefitterm" bundle="${provieMsg}" /></span></td>
														<td colspan="2"><span class="inner"><fmt:message key="provie.landing.table.benefitterm.savie" bundle="${provieMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="provie.landing.table.title.currency" bundle="${provieMsg}" /></span></td>
														<td colspan="2"><span class="inner"><fmt:message key="provie.landing.table.currency.savie" bundle="${provieMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="provie.landing.table.title.interestrate" bundle="${provieMsg}" /></span></td>
														<td colspan="2"><span class="inner"><fmt:message key="provie.landing.table.interestrate.savie" bundle="${provieMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="provie.landing.table.title.deathbenefit" bundle="${provieMsg}" /></span></td>
														<td colspan="2"><span class="inner"><fmt:message key="provie.landing.table.deathbenefit.savie" bundle="${provieMsg}" /></td>
													</tr>
													<tr>
														<td colspan="2"></td>
														<td colspan="2"></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="provie.landing.table.rider1.savie.title" bundle="${provieMsg}" /></span></td>
														<td colspan="2">
															<span class="inner">
																<span class="sub_title">
																	<fmt:message key="provie.landing.table.rider1.savie.title" bundle="${provieMsg}" />
																</span>
																<fmt:message key="provie.landing.table.rider1.savie.text1" bundle="${provieMsg}" />
																<span class="remark"><fmt:message key="provie.landing.table.rider1.savie.text2" bundle="${provieMsg}" /></span>
															</span>
														</td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="provie.landing.table.withdrawal.title" bundle="${provieMsg}" /></span></td>
														<td colspan="2"><span class="inner"><fmt:message key="provie.landing.table.withdrawal.savie.title" bundle="${provieMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="provie.landing.table.withdrawal.min.title" bundle="${provieMsg}" /></span></td>
														<td colspan="2"><span class="inner"><fmt:message key="provie.landing.table.withdrawal.min.savie" bundle="${provieMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="provie.landing.table.withdrawal.max.title" bundle="${provieMsg}" /></span></td>
														<td colspan="2"><span class="inner"><fmt:message key="provie.landing.table.withdrawal.max.savie" bundle="${provieMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"></td>
														<td class="sep"><span class="inner"><fmt:message key="provie.landing.table.monthly.savie" bundle="${provieMsg}" /></span></td>
														<td class="sep hideborderLeft"><span class="inner"><fmt:message key="provie.landing.table.oneoff.savie" bundle="${provieMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="provie.landing.table.title.maxamount" bundle="${provieMsg}" /></span></td>
														<td><span class="inner"><fmt:message key="provie.landing.table.maxamount.savie.monthly" bundle="${provieMsg}" /></span></td>
														<td class="hideborderLeft"><span class="inner"><fmt:message key="provie.landing.table.maxamount.savie.oneoff" bundle="${provieMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="provie.landing.table.title.minamount" bundle="${provieMsg}" /></span></td>
														<td><span class="inner"><fmt:message key="provie.landing.table.minamount.savie.monthly" bundle="${provieMsg}" /></span></td>
														<td class="hideborderLeft"><span class="inner"><fmt:message key="provie.landing.table.minamount.savie.oneoff" bundle="${provieMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="provie.landing.table.title.minacctvalue" bundle="${provieMsg}" /></span></td>
														<td colspan="2"><span class="inner"><fmt:message key="provie.landing.table.minacctvalue.savie" bundle="${provieMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="6">
															<span class="inner pv_remark">
																<sup>*</sup><fmt:message key="provie.landing.table.acctvalue.remarks1" bundle="${provieMsg}" />
																<br>
																<sup>**</sup><fmt:message key="provie.landing.table.acctvalue.remarks2" bundle="${provieMsg}" />
															</span>
														</td>
													</tr>
													<tr>
														<td colspan="6">
															<span class="inner pv_remark">
																<fmt:message key="provie.landing.table.remarks1.text1" bundle="${provieMsg}" />
															</span>
														</td>
													</tr>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<%--
			<div class="pv_experience">
				<div class="container">
					<div class="row">
						<div class="col-xs-12 text_center">
							<img src="<%=request.getContextPath()%>/resources/images/provie/provie_landing_s6_star.png" alt="顧客親身體驗" class="img_responsive center">
						</div>
						<div class="col-xs-12">
							<h2 class="pv_title">顧客親身體驗</h2>
						</div>
						<div class="col-xs-12 visible-md visible-lg pv_experience_wrap">
							<div class="col-md-4 pv_experience_card">
								<div class="row inner">
									<div class="col-xs-12">
										<img src="<%=request.getContextPath()%>/resources/images/provie/provie_landing_s6_score_01.png" alt="5.0" class="img_responsive center">
									</div>
									<div class="col-xs-12">
										<p class="name">陳小姐</p>
										<p class="title">高級文員</p>
									</div>
									<div class="col-xs-12">
										<p class="comment">一直希望能有基本的儲蓄習慣，自選保供款靈活，提取戶口價值又不需要繳付任何費用，更可根據自身需要選擇保障計劃，真正由我話事！</p>
									</div>
								</div>
							</div>
							<div class="col-md-4 pv_experience_card">
								<div class="row inner">
									<div class="col-xs-12">
										<img src="<%=request.getContextPath()%>/resources/images/provie/provie_landing_s6_score_02.png" alt="5.0" class="img_responsive center">
									</div>
									<div class="col-xs-12">
										<p class="name">陳小姐</p>
										<p class="title">高級文員</p>
									</div>
									<div class="col-xs-12">
										<p class="comment">一直希望能有基本的儲蓄習慣，自選保供款靈活，提取戶口價值又不需要繳付任何費用，更可根據自身需要選擇保障計劃，真正由我話事！</p>
									</div>
								</div>
							</div>
							<div class="col-md-4 pv_experience_card">
								<div class="row inner">
									<div class="col-xs-12">
										<img src="<%=request.getContextPath()%>/resources/images/provie/provie_landing_s6_score_03.png" alt="5.0" class="img_responsive center">
									</div>
									<div class="col-xs-12">
										<p class="name">陳小姐</p>
										<p class="title">高級文員</p>
									</div>
									<div class="col-xs-12">
										<p class="comment">一直希望能有基本的儲蓄習慣，自選保供款靈活，提取戶口價值又不需要繳付任何費用，更可根據自身需要選擇保障計劃，真正由我話事！</p>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xs-12 pv_experience_wrap hidden-md hidden-lg">
							<!--  -->
							<div id="expCarousel" class="carousel slide" data-ride="carousel" data-interval="false">
								<!-- Indicators -->
								<ol class="carousel-indicators">
									<li data-target="#expCarousel" data-slide-to="0" class="active"></li>
									<li data-target="#expCarousel" data-slide-to="1"></li>
									<li data-target="#expCarousel" data-slide-to="2"></li>
								</ol>
								<div class="pv_experience_card">
									<!-- Wrapper for slides -->
									<div class="carousel-inner" role="listbox">
										<div class="item active inner">
											<div>
												<img src="<%=request.getContextPath()%>/resources/images/provie/provie_landing_s6_score_01.png" alt="5.0" class="img_responsive center">
											</div>
											<div>
												<p class="name">陳小姐</p>
												<p class="title">高級文員</p>
											</div>
											<div>
												<p class="comment">一直希望能有基本的儲蓄習慣，自選保供款靈活，提取戶口價值又不需要繳付任何費用，更可根據自身需要選擇保障計劃，真正由我話事！</p>
											</div>
										</div>
										<div class="item inner">
											<div>
												<img src="<%=request.getContextPath()%>/resources/images/provie/provie_landing_s6_score_02.png" alt="5.0" class="img_responsive center">
											</div>
											<div>
												<p class="name">陳小姐</p>
												<p class="title">高級文員</p>
											</div>
											<div>
												<p class="comment">一直希望能有基本的儲蓄習慣，自選保供款靈活，提取戶口價值又不需要繳付任何費用，更可根據自身需要選擇保障計劃，真正由我話事！</p>
											</div>
										</div>
										<div class="item inner">
											<div>
												<img src="<%=request.getContextPath()%>/resources/images/provie/provie_landing_s6_score_03.png" alt="5.0" class="img_responsive center">
											</div>
											<div>
												<p class="name">陳小姐</p>
												<p class="title">高級文員</p>
											</div>
											<div>
												<p class="comment">一直希望能有基本的儲蓄習慣，自選保供款靈活，提取戶口價值又不需要繳付任何費用，更可根據自身需要選擇保障計劃，真正由我話事！</p>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<a href="#" class="pv_btn">開始儲蓄</a>
					</div>
				</div>
			</div>
			--%>
			<div class="pv_fna">
				<div class="container">
					<div class="row">
						<div class="col-xs-12">
							<h2 class="pv_title"><fmt:message key="provie.landing.fna.title" bundle="${provieMsg}" /></h2>
							<p class="pv_desc"><fmt:message key="provie.landing.fna.text1" bundle="${provieMsg}" /></p>
						</div>
						<div class="pv_fna_loginPanel">
							<div class="col-xs-12">
								<div class="col-md-4 col-md-offset-2 pv_fna_input">

									<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
										<input tabindex="1" type="text" name="userName" class="form-control gray-textbox check-emp login-input mdl-textfield__input" tabindex="1" id="fnaUser">
										<label class="mdl-textfield__label" for="fnaUser"><fmt:message key="provie.landing.fna.username" bundle="${provieMsg}" /></label>

									</div>

									<!-- <input tabindex="1" type="text" class="form-control" id="fnaUser" placeholder='<fmt:message key="provie.landing.fna.username" bundle="${provieMsg}" />'> -->
									<div class="col-xs-12 text-right link"><a href="javascript:void(0);" class="btnForgotUser"><fmt:message key="provie.landing.fna.forgetusr" bundle="${provieMsg}" /></a></div>
								</div>
								<div class="col-md-4 pv_fna_input">

									<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
										<input tabindex="2" type="password" name="userName" class="form-control gray-textbox check-emp login-input mdl-textfield__input" id="fnaPwd">
										<label class="mdl-textfield__label" for="fnaPwd"><fmt:message key="provie.landing.fna.pw" bundle="${provieMsg}" /></label>

									</div>
									<!-- <input tabindex="2" type="password" class="form-control" id="fnaPwd" placeholder='<fmt:message key="provie.landing.fna.pw" bundle="${provieMsg}" />'> -->
									<div class="col-xs-12 text-right link"><a href="javascript:void(0);" class="btnForgotPwd"><fmt:message key="provie.landing.fna.forgetpw" bundle="${provieMsg}" /></a></div>
								</div>
							</div>
							<div class="col-xs-12 center errorMsg">

							</div>
							<div class="col-xs-12">
								<p class="pv_desc">
									<fmt:message key="provie.landing.fna.disclaimer" bundle="${provieMsg}" />
								</p>
							</div>
							<div class="col-xs-12 pv_fna_reg">
								<p class="pv_desc"><b><fmt:message key="provie.landing.fna.newmb" bundle="${provieMsg}" /></b><a href="${pageContext.request.contextPath}/${language}/joinus" class="link"><fmt:message key="provie.landing.fna.register" bundle="${provieMsg}" /></a></p>
							</div>
						</div>
						<a href="javascript:void(0);" class="pv_btn btnStart"><fmt:message key="provie.landing.fna.cta.start" bundle="${provieMsg}" /></a>
					</div>
				</div>
			</div>

			<div class="blog">
		        <div class="hidden-md hidden-lg">
		            <div class="mini-banner-holder"><img src="http://blog.fwd.com.hk/wp-content/uploads/2016/07/shutterstock_65480164.jpg" class="img-responsive">
		                <div class="black-overlay"></div>
		                <h5 class="text-center"><fmt:message key="provie.landing.blog.title" bundle="${provieMsg}" /></h5> </div>
		            <div class="btn-holder">
		                <button id="btn-blog-link" class="savie-regular-btn"><fmt:message key="provie.landing.blog.readmore" bundle="${provieMsg}" /></button>
		            </div>
		        </div>
		        <div class="hidden-xs hidden-sm">
		            <h3 class="text-center"><fmt:message key="provie.landing.blog.readmore" bundle="${provieMsg}" /></h3>
		            <div class="gray-divide"></div>
		            <p class="definition text-center"><fmt:message key="provie.landing.blog.title" bundle="${provieMsg}" /></p>
		            <div class="blogs-holder clearfix fwd-container-limit">
		                <div class="blogs first"> <img src="http://blog.fwd.com.hk/wp-content/uploads/2016/07/shutterstock_65480164.jpg" class="img-responsive">
		                    <div class="orange-overlay text-center">
		                        <p class="title"><fmt:message key="provie.landing.blog.1.topic" bundle="${provieMsg}" /></p>
		                        <p class="definition"></p> <a class="btn-read-now" href='<fmt:message key="provie.landing.blog.1.url" bundle="${provieMsg}" />' target="_blank"><fmt:message key="provie.landing.blog.readmore" bundle="${provieMsg}" /></a> </div>
		                </div>
		                <div class="blogs"> <img src="http://blog.fwd.com.hk/wp-content/uploads/2016/06/shutterstock_344288030.jpg" class="img-responsive">
		                    <div class="orange-overlay text-center">
		                        <p class="title"><fmt:message key="provie.landing.blog.2.topic" bundle="${provieMsg}" /></p>
		                        <p class="definition"></p> <a class="btn-read-now" href='<fmt:message key="provie.landing.blog.2.url" bundle="${provieMsg}" />' target="_blank"><fmt:message key="provie.landing.blog.readmore" bundle="${provieMsg}" /></a> </div>
		                </div>
		                <div class="blogs"> <img src="http://blog.fwd.com.hk/wp-content/uploads/2016/07/Pocket-Wifi安部數碼2035.jpg" class="img-responsive">
		                    <div class="orange-overlay text-center">
		                        <p class="title"><fmt:message key="provie.landing.blog.3.topic" bundle="${provieMsg}" /></p>
		                        <p class="definition"></p> <a class="btn-read-now" href='<fmt:message key="provie.landing.blog.3.url" bundle="${provieMsg}" />' target="_blank"><fmt:message key="provie.landing.blog.readmore" bundle="${provieMsg}" /></a> </div>
		                </div>
		                <div class="blogs last"> <img src="http://blog.fwd.com.hk/wp-content/uploads/2015/08/3-saving-tips-smart-parents.jpg" class="img-responsive">
		                    <div class="orange-overlay text-center">
		                        <p class="title"><fmt:message key="provie.landing.blog.4.topic" bundle="${provieMsg}" /></p>
		                        <p class="definition"></p> <a class="btn-read-now" href='<fmt:message key="provie.landing.blog.4.url" bundle="${provieMsg}" />' target="_blank"><fmt:message key="provie.landing.blog.readmore" bundle="${provieMsg}" /></a> </div>
		                </div>
		            </div>
		            <div class="fwd-container-limit">
		                <p class="blog-notice"><fmt:message key="provie.landing.blog.notice" bundle="${provieMsg}" /></p>
		            </div>
		        </div>
    		</div>

    		<div class="pv_share">
    			<div class="container">
    				<div class="row">
    					<div class="col-xs-12">
    						<h2 class="pv_title"><fmt:message key="provie.landing.share.title" bundle="${provieMsg}" /></h2>
    						<p class="pv_desc"><fmt:message key="provie.landing.share.text1" bundle="${provieMsg}" /></p>
    					</div>
    					<div class="col-xs-12 text-center">
							<a href="javascript:void(0);" class="btn-spd-share"><img src="<%=request.getContextPath()%>/resources/images/provie/provie_landing_s8_fb.png" alt="Facebook"></a>
    					</div>
    				</div>
    			</div>
    		</div>

		</div>
	<!-- FOOTER -->
		<!--Modal in Customer Service Centre-->


		<!--Modal in Customer Service Centre-->


		<!--Modal in Customer Service Centre (access code had been used)-->


		<!--Modal in Customer Service Centre-->

		<!--Modal in Customer Service Centre (Reservation Invalid)-->


		<!--Modal in Customer Service Centre (More than 2 tries)-->

		
		<!-- video Modal -->
		<div id="vModal" class="vModal modal fade">
			<div class="modal-dialog">
				<a href="#close-video" class="close-btn" data-dismiss="modal" aria-hidden="true">
						<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="Layer_1" x="0px" y="0px" width="44px" height="44px" viewBox="-1 3 44 44" enable-background="new -1 3 44 44" xml:space="preserve">
							<g>
								<line fill="none" stroke="#FFFFFF" stroke-width="2" stroke-linecap="square" stroke-miterlimit="10" x1="11" y1="15" x2="31" y2="35"></line>
								<line fill="none" stroke="#FFFFFF" stroke-width="2" stroke-linecap="square" stroke-miterlimit="10" x1="31" y1="15" x2="11" y2="35"></line>
							</g>
						</svg>
				</a>
				<div class="embed-container">
					<iframe id="ifwdVideo" src="" frameborder="0" allowfullscreen=""></iframe>
				</div>
			</div>
		</div>

</div>

<script src="<%=request.getContextPath()%>/resources/js/vendor/nouislider.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/provie/provie-landing-uifn.js"></script>
<script>
	var pvSetting = {
		errMsg: {
			genderEmpty    : '<fmt:message key="provie.landing.setting.text1" bundle="${provieMsg}" />',
			ageEmpty       : '<fmt:message key="provie.landing.setting.text2" bundle="${provieMsg}" />',
			ageLess        : '<fmt:message key="provie.landing.setting.text3" bundle="${provieMsg}" />',
			ageMore        : '<fmt:message key="provie.landing.setting.text4" bundle="${provieMsg}" />',
			methodEmpty    : '<fmt:message key="provie.landing.setting.text5" bundle="${provieMsg}" />',
			amountEmpty    : '<fmt:message key="provie.landing.setting.text6" bundle="${provieMsg}" />',
			'amountPROVIE-RPHKDLess': '<fmt:message key="provie.landing.setting.text7" bundle="${provieMsg}" />',
			'amountPROVIE-RPHKDMore': '<fmt:message key="provie.landing.setting.text8" bundle="${provieMsg}" />',
			'amountPROVIE-SPHKDLess': '<fmt:message key="provie.landing.setting.text9" bundle="${provieMsg}" />',
			'amountPROVIE-SPHKDMore': '<fmt:message key="provie.landing.setting.text10" bundle="${provieMsg}" />',
			'amountPROVIE-RPUSDLess': '<fmt:message key="provie.landing.setting.text11" bundle="${provieMsg}" />',
			'amountPROVIE-RPUSDMore': '<fmt:message key="provie.landing.setting.text12" bundle="${provieMsg}" />',
			'amountPROVIE-SPUSDLess': '<fmt:message key="provie.landing.setting.text13" bundle="${provieMsg}" />',
			'amountPROVIE-SPUSDMore': '<fmt:message key="provie.landing.setting.text14" bundle="${provieMsg}" />',
			currencyEmpty  : '<fmt:message key="provie.landing.setting.text15" bundle="${provieMsg}" />',
			yearEmpty      : '<fmt:message key="provie.landing.setting.text16" bundle="${provieMsg}" />',
			loginFail      : '<fmt:message key="provie.landing.setting.text17" bundle="${provieMsg}" />',
			yearEmpty	   : '<fmt:message key="provie.landing.setting.text18" bundle="${provieMsg}" />',
			fnaLoginEmpty  : '<fmt:message key="provie.landing.setting.text19" bundle="${provieMsg}" />'
		},
		currencyData: {
			HKD: {
				fixRate: [1.5, 1.5, 2, 2, 3, 2, 2],
				prefix: '<fmt:message key="provie.landing.calculation.priceHKDPrefix" bundle="${provieMsg}" />'
			},
			USD: {
				fixRate: [2, 2, 2, 2, 3, 2, 2],
				prefix: '<fmt:message key="provie.landing.calculation.priceUSDPrefix" bundle="${provieMsg}" />'
			}
		}
	};
	
$(document).ready(function(){
	var url = '';
	// var url = $("#ifwdVideo").attr('src');
	// stop playing youtube because autoplay just start when press play button
	// $("#ifwdVideo").attr('src', '');
	$("#vModal").on('hide.bs.modal', function(){
		$("#ifwdVideo").attr('src', '');
	});
	$("#vModal").on('show.bs.modal', function(){
		$("#ifwdVideo").attr('src', url);
	});
	$('.pop-youtube').on('click touchend', function(){
		url = $(this).data('youtube-link');
	});
});
</script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/provie/provie-payment-discount.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/provie/provie-landing-style.css">
