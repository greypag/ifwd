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
<fmt:setBundle basename="wealthree" var="wealthreeMsg" />
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
    "lowPrice":"94100",
    "highPrice":"9400600",
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
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/titatoggle-dist-min.css">



<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/vendor/nouislider.min.css">
<link href="<%=request.getContextPath()%>/resources/css/pnotify.custom.min.css" media="all" rel="stylesheet" type="text/css" />

<div class="fwd-savie-wrapper savie-online-container with-breadcrumbs-steps provie-plan-appointment" id="make-an-appointment-page">

	    <!-- Breadcrumb Component Start-->
	    <div class="container container-fluid container--breadcrumb">
	        <c:set var="breadcrumbItems">
	            breadcrumb.item.home,breadcrumb.item.save,breadcrumb.item.wealthree
	        </c:set>
	        <c:set var="breadcrumbActive">2</c:set>
	        <c:set var="breadcrumbBold">true</c:set>
	        
	        <jsp:include page="/WEB-INF/jsp/merged/comp/breadcrumb.jsp">
	            <jsp:param name="breadcrumbItems" value="${breadcrumbItems}"/>
	            <jsp:param name="breadcrumbActive" value="${breadcrumbActive}"/>
	            <jsp:param name="breadcrumbBold" value="${breadcrumbBold}"/>
	        </jsp:include>
	    </div>
	    <!-- Breadcrumb Component End-->
		
		<!-- Kitchen Begin -->
		<div class="savie-regular-container savie-regular-landing rp-only">
		     <div class="whole-banner">
                <div class="page-banner">
                	<img src="<%=request.getContextPath()%>/<fmt:message key="wealthree.online.hero.image.mobile" bundle="${msg}" />" class="img-responsive hidden-sm hidden-md hidden-lg">
					<img src="<%=request.getContextPath()%>/<fmt:message key="wealthree.online.hero.image" bundle="${msg}" />" class="img-responsive hidden-xs">
                	<div class="pv_overlay_text_wrap">
            			<h2 class="pv_title">&nbsp;<%-- <fmt:message key="wealthree.landing.breadcrumb" bundle="${wealthreeMsg}" /> --%></h2>
            			<p class="pv_desc">&nbsp;<%-- <fmt:message key="wealthree.landing.title1" bundle="${wealthreeMsg}" /> --%></p>
                	</div>

                    <div class="fwd-container-limit hidden-sm hidden-xs">

                            <div class="img-banner-text savie-landing">
										<div class="banner">
											<p class="banner_title"><fmt:message key="wealthree.landing.banner.title1" bundle="${wealthreeMsg}" /><br><fmt:message key="wealthree.landing.banner.title2" bundle="${wealthreeMsg}" /></p>
											<p class="banner_desc"><fmt:message key="wealthree.landing.banner.desc1" bundle="${wealthreeMsg}" /><br><fmt:message key="wealthree.landing.banner.desc2" bundle="${wealthreeMsg}" /></p>
										</div>
                                <div id="clearfix-height-rp">
                                    <button id="op-buy-now-O2O-mobile" class="savie-regular-btn start-btn" data-category="CTA" data-action="Go To Calculator" data-label="<fmt:message key="wealthree.landing.cta.start" bundle="${wealthreeMsg}" />" ><fmt:message key="wealthree.landing.cta.start" bundle="${wealthreeMsg}" /></button>
                                </div>
                            </div>

                    </div>
                </div>
            </div>
			<div class="pv_mobile_middle_buttons hidden-lg hidden-md">
				<div class="fwd-container-limit">

						<div class="img-banner-text savie-landing">
							<div class="banner">
								<p class="banner_title"><fmt:message key="wealthree.landing.banner.title1" bundle="${wealthreeMsg}" /><br><fmt:message key="wealthree.landing.banner.title2" bundle="${wealthreeMsg}" /></p>
								<p class="banner_desc"><fmt:message key="wealthree.landing.banner.desc1" bundle="${wealthreeMsg}" /><br><fmt:message key="wealthree.landing.banner.desc2" bundle="${wealthreeMsg}" /></p>
							</div>
							<div id="clearfix-height-rp">
								<button id="op-buy-now-O2O-mobile" class="savie-regular-btn start-btn" data-category="CTA" data-action="<%=request.getContextPath()%>/${language}/savings-insurance/wealthree-customer-service-centre/" data-label="<fmt:message key="wealthree.landing.cta.start" bundle="${wealthreeMsg}" />" ><fmt:message key="wealthree.landing.cta.start" bundle="${wealthreeMsg}" /></button>
							</div>
							<!-- <div class="savie-product text-bold hidden-xs">
								<fmt:message key="wealthree.landing.link.productbrochure" bundle="${wealthreeMsg}" />
								<fmt:message key="wealthree.landing.link.productbrochure.text1" bundle="${wealthreeMsg}" />
								<a target="_blank" href='<%=request.getContextPath()%>/resources/pdf/provie/<fmt:message key="wealthree.landing.link.productbrochure.link.oneoff" bundle="${wealthreeMsg}" />'>
									<fmt:message key="wealthree.landing.link.productbrochure.text2" bundle="${wealthreeMsg}" />
								</a>
								<fmt:message key="wealthree.landing.link.productbrochure.text3" bundle="${wealthreeMsg}" />
								<a target="_blank" href='<%=request.getContextPath()%>/resources/pdf/provie/<fmt:message key="wealthree.landing.link.productbrochure.link.monthly" bundle="${wealthreeMsg}" />'>
									<fmt:message key="wealthree.landing.link.productbrochure.text4" bundle="${wealthreeMsg}" />
								</a>
								<fmt:message key="wealthree.landing.link.productbrochure.text5" bundle="${wealthreeMsg}" />
							</div>

							<div class="savie-product text-bold">
								<fmt:message key="wealthree.landing.link.policyprovision" bundle="${wealthreeMsg}" />
								<fmt:message key="wealthree.landing.link.policyprovision.text1" bundle="${wealthreeMsg}" />
								<a target="_blank" href='<%=request.getContextPath()%>/resources/pdf/provie/<fmt:message key="wealthree.landing.link.policyprovision.link.hkd" bundle="${wealthreeMsg}" />'>
									<fmt:message key="wealthree.landing.link.policyprovision.text2" bundle="${wealthreeMsg}" />
								</a>
								<fmt:message key="wealthree.landing.link.policyprovision.text3" bundle="${wealthreeMsg}" />
								<a target="_blank" href='<%=request.getContextPath()%>/resources/pdf/provie/<fmt:message key="wealthree.landing.link.policyprovision.link.usd" bundle="${wealthreeMsg}" />'>
									<fmt:message key="wealthree.landing.link.policyprovision.text4" bundle="${wealthreeMsg}" />
								</a>
								<fmt:message key="wealthree.landing.link.policyprovision.text5" bundle="${wealthreeMsg}" />
							</div> -->

						</div>

				</div>
			</div>
			<div class="wh_productInfo">
				<div class="container">
            		<div class="row">
            			<div class="col-xs-12">
	            			<p class="wh_p_desc">
	            				<fmt:message key="wealthree.landing.fixrate.table.text0" bundle="${wealthreeMsg}" />
	            			</p>
	            			<div class="wh_p_btns-gp text-center">
	            				<a id="dlProductFacesheet" class="dlProductBrochure" href="<fmt:message key="wealthree.landing.fixrate.table.pdf.factsheet" bundle="${wealthreeMsg}" />" target="_blank" data-category="PDF Dowload" data-action="<fmt:message key="wealthree.landing.fixrate.table.pdf.factsheet" bundle="${wealthreeMsg}" />" data-label="<fmt:message key="wealthree.landing.link.productbrochure" bundle="${wealthreeMsg}" />" ><i class="fa fa-download" aria-hidden="true"></i>&nbsp;<fmt:message key="wealthree.landing.link.productbrochure" bundle="${wealthreeMsg}" /></a>
	            				<a id="dlProductProvisions" class="dlProductBrochure" href="<%=request.getContextPath()%>/resources/pdf/wealthree/<fmt:message key="wealthree.landing.fixrate.table.pdf.provision" bundle="${wealthreeMsg}" />" target="_blank" data-category="PDF Dowload" data-action="<%=request.getContextPath()%>/resources/pdf/wealthree/<fmt:message key="wealthree.landing.fixrate.table.pdf.provision" bundle="${wealthreeMsg}" />" data-label="<fmt:message key="wealthree.landing.link.policyprovision" bundle="${wealthreeMsg}" />" ><i class="fa fa-download" aria-hidden="true"></i>&nbsp;<fmt:message key="wealthree.landing.link.policyprovision" bundle="${wealthreeMsg}" /></a>
	            			</div>
	            		</div>
	            	</div>
	            </div>
			</div>
			<div class="wh_productChart">
				<div class="container">
					<div class="row">
						<div class="col-xs-12">
							<div class="chart-wrapper">
								<div class="checkbox checkbox-slider--b checkbox-slider-md">
									<label class="off">
										<i><fmt:message key="wealthree.landing.currency.hkd" bundle="${wealthreeMsg}" /></i><input type="checkbox" name="cb1" data-txton="港元" data-txtoff="人民幣"><span></span> <i><fmt:message key="wealthree.landing.currency.rmb" bundle="${wealthreeMsg}" /></i>
									</label>
								</div>
								<div class="chart-hkd show">
									<img src="<%=request.getContextPath()%>/resources/images/wealthree/${language}/s1_chart_hkd.jpg" alt="" class="img-responsive hidden-xs">

									<img src="<%=request.getContextPath()%>/resources/images/wealthree/${language}/m_s1_chart_hkd.jpg" alt="" class="img-responsive visible-xs">
									
								</div>
								<div class="chart-rmb hide">
									<img src="<%=request.getContextPath()%>/resources/images/wealthree/${language}/s1_chart_rmb.jpg" alt="" class="img-responsive hidden-xs">

									<img src="<%=request.getContextPath()%>/resources/images/wealthree/${language}/m_s1_chart_rmb.jpg" alt="" class="img-responsive visible-xs">
								</div>
								<span class="pv_remark"><fmt:message key="wealthree.landing.currency.hkd.remark" bundle="${wealthreeMsg}" /><br><fmt:message key="wealthree.landing.currency.rmb.remark" bundle="${wealthreeMsg}" /></span>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="pv_offers">
				<div class="container">
					<div class="row">
						<div class="col-xs-12">
							<h2 class="pv_offer_title">
								<fmt:message key="wealthree.landing.discount.title" bundle="${wealthreeMsg}" />
							</h2>
							<p>
								<fmt:message key="wealthree.landing.discount.desc" bundle="${wealthreeMsg}" />
							</p>
						</div>
					</div>
					<div id="pv_offer_cat_1" class="row pv_offer_cat">
						<div class="col-xs-12 col-md-4 pv_offer">
							<div class="inner">
								<div class="pv_offer_tag">
									<fmt:message key="wealthree.landing.discount.btn.text1" bundle="${wealthreeMsg}" />
								</div>
								<p class="pv_offer_req">
									<span class="pv_req_type">
										<fmt:message key="wealthree.landing.discount.paymentmode.text1" bundle="${wealthreeMsg}" />
									</span>
									<span class="pv_req_amount">
										<span class="value">
											<fmt:message key="wealthree.landing.discount.hkd1.value.text1" bundle="${wealthreeMsg}" />
										</span>
									</span>
								</p>
								<div class="pv_offer_rslt">
									<p>
										<span class="pv_rslt_type">
											<fmt:message key="wealthree.landing.discount.paymentmode.text2" bundle="${wealthreeMsg}" />
										</span>
										<span class="pv_rslt_amount wp_rslt_amount">
											<span class="value">
												<fmt:message key="wealthree.landing.discount.hkd1.value.text2" bundle="${wealthreeMsg}" />
											</span>
										</span>
									</p>
								</div>
							</div>
							<div class="outer">
								<p><fmt:message key="wealthree.landing.discount.hkd1.value.text3" bundle="${wealthreeMsg}" /></p>
							</div>
						</div>
						<div class="col-xs-12 col-md-4 pv_offer">
							<div class="inner">
								<div class="pv_offer_tag">
									<fmt:message key="wealthree.landing.discount.btn.text1" bundle="${wealthreeMsg}" />
								</div>
								<p class="pv_offer_req">
									<span class="pv_req_type">
										<fmt:message key="wealthree.landing.discount.paymentmode.text1" bundle="${wealthreeMsg}" />
									</span>
									<span class="pv_req_amount">
										<span class="value">
											<fmt:message key="wealthree.landing.discount.hkd2.value.text1" bundle="${wealthreeMsg}" />
										</span>
									</span>
								</p>
								<div class="pv_offer_rslt">
									<p>
										<span class="pv_rslt_type">
											<fmt:message key="wealthree.landing.discount.paymentmode.text2" bundle="${wealthreeMsg}" />
										</span>
										<span class="pv_rslt_amount wp_rslt_amount">
											<span class="value">
												<fmt:message key="wealthree.landing.discount.hkd2.value.text2" bundle="${wealthreeMsg}" />
											</span>
										</span>
									</p>
								</div>
							</div>
							<div class="outer">
								<p><fmt:message key="wealthree.landing.discount.hkd2.value.text3" bundle="${wealthreeMsg}" /></p>
							</div>
						</div>
						<div class="col-xs-12 col-md-4 pv_offer">
							<div class="inner">
								<div class="pv_offer_tag">
									<fmt:message key="wealthree.landing.discount.btn.text1" bundle="${wealthreeMsg}" />
								</div>
								<p class="pv_offer_req">
									<span class="pv_req_type">
										<fmt:message key="wealthree.landing.discount.paymentmode.text1" bundle="${wealthreeMsg}" />
									</span>
									<span class="pv_req_amount">
										<span class="value">
											<fmt:message key="wealthree.landing.discount.hkd3.value.text1" bundle="${wealthreeMsg}" />
										</span>
									</span>
								</p>
								<div class="pv_offer_rslt">
									<p>
										<span class="pv_rslt_type">
											<fmt:message key="wealthree.landing.discount.paymentmode.text2" bundle="${wealthreeMsg}" />
										</span>
										<span class="pv_rslt_amount wp_rslt_amount">
											<span class="value">
												<fmt:message key="wealthree.landing.discount.hkd3.value.text2" bundle="${wealthreeMsg}" />
											</span>
										</span>
									</p>
								</div>
							</div>
							<div class="outer">
								<p><fmt:message key="wealthree.landing.discount.hkd3.value.text3" bundle="${wealthreeMsg}" /></p>
							</div>
						</div>
					</div>
					
					<div class="col-xs-12">
						<h4><fmt:message key="wealthree.landing.discount.example.title" bundle="${wealthreeMsg}" /></h4>
						<div class="tbl-discount" aria-expanded="false">
							<div class="tbl-wrapper clearfix">
								<div class="col-year">
									<div class="col-year-inner">
										<table>
											<tr><th></th></tr>
											<tr><td class="r1"><fmt:message key="wealthree.landing.discount.example.t01" bundle="${wealthreeMsg}" /></td></tr>
											<tr><td class="r2"><fmt:message key="wealthree.landing.discount.example.t02" bundle="${wealthreeMsg}" /></td></tr>
											<tr><td class="r3"><fmt:message key="wealthree.landing.discount.example.t03" bundle="${wealthreeMsg}" /></td></tr>
											<tr><td class="r4"><fmt:message key="wealthree.landing.discount.example.t04" bundle="${wealthreeMsg}" /></td></tr>
										</table>
									</div>
								</div>
								<div class="discount-col-data">
									<div class="col-data-scroller">
										<table>
											<tr>
												<th><fmt:message key="wealthree.landing.discount.example.t10" bundle="${wealthreeMsg}" /></th>
												<th><fmt:message key="wealthree.landing.discount.example.t20" bundle="${wealthreeMsg}" /></th>
											</tr>
											<tr>
												<td class="r1"><fmt:message key="wealthree.landing.discount.example.t11" bundle="${wealthreeMsg}" /></td>
												<td class="r1"><fmt:message key="wealthree.landing.discount.example.t21" bundle="${wealthreeMsg}" /><br><span class="small"><fmt:message key="wealthree.landing.discount.example.t21.desc" bundle="${wealthreeMsg}" /></span></td>
											</tr>
											<tr>
												<td class="r2"><fmt:message key="wealthree.landing.discount.example.t12" bundle="${wealthreeMsg}" /></td>
												<td class="r2"><fmt:message key="wealthree.landing.discount.example.t22" bundle="${wealthreeMsg}" /></td>
											</tr>
											<tr>
												<td class="r3"><fmt:message key="wealthree.landing.discount.example.t13" bundle="${wealthreeMsg}" /></td>
												<td class="r3"><fmt:message key="wealthree.landing.discount.example.t23" bundle="${wealthreeMsg}" /></td>
											</tr>
											<tr>
												<td class="r4"><fmt:message key="wealthree.landing.discount.example.t14" bundle="${wealthreeMsg}" /></td>
												<td class="r4 discount-percent"><fmt:message key="wealthree.landing.discount.example.t24" bundle="${wealthreeMsg}" /></td>
											</tr>
										</table>
									</div>
								</div>
								<div class="col-data-control-wrapper">
									<a class="left discount-col-data-control" href="javascript:void(0);">
										<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
										<span class="sr-only">Previous</span>
									</a>
									<a class="right discount-col-data-control" href="javascript:void(0);">
										<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
										<span class="sr-only">Next</span>
									</a>
								</div>
							</div>
						</div>
					</div>
					
					<div class="row">
						<a href="<%=request.getContextPath()%>/resources/policy-provisions-pdf/Wealthree_Premium_Discount_TnC.pdf" class="pv_offer_link" target="_blank"><fmt:message key="wealthree.landing.discount.tnc" bundle="${wealthreeMsg}" /></a>
					</div>
					
					<div class="col-xs-12">
						<div class="text-center btm-btn">
							<br>
							<button class="btn-savenow" data-category="CTA" data-action="<%=request.getContextPath()%>/${language}/savings-insurance/wealthree-customer-service-centre/" data-label="<fmt:message key="wealthree.landing.calculation.save.now" bundle="${wealthreeMsg}" />" ><fmt:message key="wealthree.landing.calculation.save.now" bundle="${wealthreeMsg}" /></button>
						</div>
					</div>
				</div>
			</div>

			<div class="wp_productCalculator">
				<div class="container">
					<div class="row">
						<div class="col-xs-12">
							<h3><fmt:message key="wealthree.landing.calculation.title1" bundle="${wealthreeMsg}" /></h3>
							<p><fmt:message key="wealthree.landing.calculation.title2" bundle="${wealthreeMsg}" /></p>

							<div class="row">
								<div class="col-xs-12 col-sm-6">
									<div class="box-input">
										<img src="<%=request.getContextPath()%>/resources/images/wealthree/s2_icon_01.png" alt="">
										<span><fmt:message key="wealthree.landing.calculation.premiums.paid" bundle="${wealthreeMsg}" /></span>

										<div class="text-center form-wrapper">
											<div class="txt-amount-wrapper">
												<input type="text" id="txt_amount" name="txt_amount" placeholder="$100,000" maxlength="9">
											</div>
											<div class="sel-currency-wrapper">
												<select id="sel_currency">
													<option value="hkd"><fmt:message key="wealthree.landing.currency.hkd1" bundle="${wealthreeMsg}" /></option>
													<option value="rmb"><fmt:message key="wealthree.landing.currency.rmb1" bundle="${wealthreeMsg}" /></option>
												</select>
												<i class="fa fa-sort-desc" aria-hidden="true"></i>
											</div>
										</div>
										<div id="box-input-msg"></div>
										<div class="text-center">
											<a href="javascript:void(0);" class="btn-calculate" data-category="CTA" data-action="<fmt:message key="wealthree.landing.calculation.cta.calculate" bundle="${wealthreeMsg}" /> Wealthree" data-label="<fmt:message key="wealthree.landing.calculation.cta.calculate" bundle="${wealthreeMsg}" />" ><fmt:message key="wealthree.landing.calculation.cta.calculate" bundle="${wealthreeMsg}" /></a>
										</div>
									</div>
								</div>
								<div class="col-xs-12 col-sm-6">
									<div class="box-result">
										<img src="<%=request.getContextPath()%>/resources/images/wealthree/s2_icon_02.png" alt="">
										<span><fmt:message key="wealthree.landing.calculation.total.paid" bundle="${wealthreeMsg}" /></span>
										<span class="ttl_pay_amount">
											
										</span>
										<img src="<%=request.getContextPath()%>/resources/images/wealthree/s2_arrow_down.png" alt="">
										<span><fmt:message key="wealthree.landing.calculation.full" bundle="${wealthreeMsg}" /></span>

										<span class="yrs3_return">
											
										</span>

										<img src="<%=request.getContextPath()%>/resources/images/wealthree/${language}/m_s2_ball_hkd.png" class="hkd over-bubble hidden-xs">
										<img src="<%=request.getContextPath()%>/resources/images/wealthree/${language}/m_s2_ball_rmb.png" class="rmb over-bubble hidden-xs hide">

									</div>
								</div>

								<div class="clearfix"></div>

								<div class="col-xs-12">
									<div class="tbl-result-wrapper collapse" aria-expanded="false">
										<%-- <h4 class="text-center"><fmt:message key="wealthree.landing.calculation.120" bundle="${wealthreeMsg}" /></h4> --%>
										<div class="tbl-wrapper clearfix">
											<div class="col-year">
												<div class="col-year-inner">
													<table>
														<tr>
															<th><fmt:message key="wealthree.landing.calculation.table.amount.year" bundle="${wealthreeMsg}" /></th>
														</tr>
														<tr>
															<td>1</td>
														</tr>
														<tr>
															<td>2</td>
														</tr>
														<tr>
															<td>3</td>
														</tr>
													</table>
												</div>
											</div>
											<div class="col-data">
												<div class="col-data-scroller">
													<table>
									
														<tr class="calTableTitleHKD">
															<th><fmt:message key="wealthree.landing.calculation.table.total.paid" bundle="${wealthreeMsg}" /></th>
															<th><fmt:message key="wealthree.landing.calculation.table.benefit" bundle="${wealthreeMsg}" /></th>
															<th><fmt:message key="wealthree.landing.calculation.table.value" bundle="${wealthreeMsg}" /></th>
														</tr>
														<tr class="calTableTitleRMB">
															
															<th><fmt:message key="wealthree.landing.calculation.table.total.paid.rmb" bundle="${wealthreeMsg}" /></th>
															<th><fmt:message key="wealthree.landing.calculation.table.benefit.rmb" bundle="${wealthreeMsg}" /></th>
															<th><fmt:message key="wealthree.landing.calculation.table.value.rmb" bundle="${wealthreeMsg}" /></th>
														</tr>
														<tr>
															<td class="y1-c1">1</td>
															<td class="y1-c2">1</td>
															<td class="y1-c3">1</td>
														</tr>
														<tr>
															<td class="y2-c1">2</td>
															<td class="y2-c2">2</td>
															<td class="y2-c3">2</td>
														</tr>
														<tr>
															<td class="y3-c1">3</td>
															<td class="y3-c2">3</td>
															<td class="y3-c3">3</td>
														</tr>
													</table>
												</div>
											</div>
											<div class="col-data-control-wrapper">
												<a class="left col-data-control" href="javascript:void(0);">
													<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
											    	<span class="sr-only">Previous</span>
												</a>
												<a class="right col-data-control" href="javascript:void(0);">
													<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
													<span class="sr-only">Next</span>
												</a>
											</div>
										</div>
										
										<p><span class="pv_remark"><fmt:message key="wealthree.landing.calculation.table.remark" bundle="${wealthreeMsg}" /></span></p>
									</div>
								</div>


							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="pv_plan">
				<div class="container">
					<div class="row">
						<div class="col-xs-12">
							<h2 class="pv_title"><fmt:message key="wealthree.landing.calculation.title3" bundle="${wealthreeMsg}" /></h2>
        					<p class="pv_sub_heading"><fmt:message key="wealthree.landing.calculation.text11" bundle="${wealthreeMsg}" /></p>
						</div>
						<div class="col-xs-12">
							<div class="pv_plan_wrap">
								<div class="col-xs-12 visible-md visible-lg">
									<span class="pv_hint hint1"><fmt:message key="wealthree.landing.calculation.bubble.text1" bundle="${wealthreeMsg}" /></span>
									<span class="pv_hint hint2"><fmt:message key="wealthree.landing.calculation.year" bundle="${wealthreeMsg}" /></span>
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
										<fmt:message key="wealthree.landing.calculation.interestrate" bundle="${wealthreeMsg}" />
										<span class="txtNoWrap">
											<fmt:message key="wealthree.landing.calculation.interestrate0" bundle="${wealthreeMsg}" />
										</span>
									</span>
								</div>

    							<div class="money">
									<div class="left"><fmt:message key="wealthree.landing.calculation.premium" bundle="${wealthreeMsg}" /><span class="pricePrefix"></span><br><span class="monthlyFee"></span></div><!--
									--><div class="right"><fmt:message key="wealthree.landing.calculation.totalpremium" bundle="${wealthreeMsg}" /><span class="pricePrefix"></span><br><span class="totalPaid"></span></div>
								</div>

								<div class="accValue">
									<img src="<%=request.getContextPath()%>/resources/images/provie/provie_landing_s2_icon.png" alt='<fmt:message key="wealthree.landing.calculation.accountvalue" bundle="${wealthreeMsg}" />' class="img-responsive">
									<div class="txt"><fmt:message key="wealthree.landing.calculation.accountvalue" bundle="${wealthreeMsg}" /><span class="pricePrefix"></span><br><span class="amount"></span></div>
									<div><fmt:message key="wealthree.landing.calculation.year.acctvalue1" bundle="${wealthreeMsg}" /><span class="year"></span><fmt:message key="wealthree.landing.calculation.year.acctvalue2" bundle="${wealthreeMsg}" /></div>
								</div>

								<div class="extra">
									<h3 class="pv_title_extra">
											<img src="<%=request.getContextPath()%>/resources/images/provie/provie_landing_slider_plus.png" alt="+" class="img-responsive imgPlus"><fmt:message key="wealthree.landing.calculation.3riders.title" bundle="${wealthreeMsg}" />
									</h3>
									<div class="pv_content_extra"><fmt:message key="wealthree.landing.calculation.3riders.content" bundle="${wealthreeMsg}" /></div>
									<img src="<%=request.getContextPath()%>/resources/images/provie/provie_landing_slider_line_b.png" alt="line" class="img-responsive center line">
									<div class="cardWrap">
										<div class="card card1">
											<h3 class="name"><fmt:message key="wealthree.landing.calculation.rider1.title" bundle="${wealthreeMsg}" /></h3>
											<img src="<%=request.getContextPath()%>/resources/images/provie/provie_landing_s2_rider_a_s.png" alt="" class="img-responsive center">
											<p class="price"></p>
										</div>
										<div class="card card2">
											<h3 class="name"><fmt:message key="wealthree.landing.calculation.rider2.title" bundle="${wealthreeMsg}" /></h3>
											<img src="<%=request.getContextPath()%>/resources/images/provie/provie_landing_s2_rider_b_s.png" alt="" class="img-responsive center">
											<p class="price"></p>
										</div>
										<div class="card card3">
											<h3 class="name"><fmt:message key="wealthree.landing.calculation.rider3.title" bundle="${wealthreeMsg}" /></h3>
											<img src="<%=request.getContextPath()%>/resources/images/provie/provie_landing_s2_rider_c_s.png" alt="" class="img-responsive center">
											<p class="price"></p>
										</div>
									</div>
								</div>

								<div>
									<p class="remark">
										<fmt:message key="wealthree.landing.calculation.rider.remarks" bundle="${wealthreeMsg}" />
										<br>
										<br>
										<fmt:message key="wealthree.landing.calculation.remarks.title" bundle="${wealthreeMsg}" />
										<br>
										<fmt:message key="wealthree.landing.calculation.remarks.text" bundle="${wealthreeMsg}" />
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
            				<h2 class="pv_title"><fmt:message key="wealthree.landing.features.title" bundle="${wealthreeMsg}" /></h2>
            			</div>
						<div class="pv_feature_wrap">

							<div class="col-xs-12 col-sm-4 pv_feature_box">
								<div class="row">
									<div class="col-xs-4 col-sm-12">
										<img src="<%=request.getContextPath()%>/resources/images/wealthree/s3_icon_01.png" alt='<fmt:message key="wealthree.landing.features.1.title" bundle="${wealthreeMsg}" />' class="img-responsive">
									</div>
									<div class="col-xs-8 col-sm-12">
										<h3 class="pv_feature_title"><fmt:message key="wealthree.landing.features.1.title" bundle="${wealthreeMsg}" /></h3>
										<p class="pv_feature_desc"><fmt:message key="wealthree.landing.features.1.text1" bundle="${wealthreeMsg}" /></p>
									</div>
								</div>
							</div>

							<div class="col-xs-12 col-sm-4 pv_feature_box">
								<div class="row">
									<div class="col-xs-4 col-sm-12">
										<img src="<%=request.getContextPath()%>/resources/images/wealthree/s3_icon_02.png" alt='<fmt:message key="wealthree.landing.features.2.title" bundle="${wealthreeMsg}" />' class="img-responsive">
									</div>
									<div class="col-xs-8 col-sm-12">
										<h3 class="pv_feature_title"><fmt:message key="wealthree.landing.features.2.title" bundle="${wealthreeMsg}" /></h3>
										<p class="pv_feature_desc"><fmt:message key="wealthree.landing.features.2.text" bundle="${wealthreeMsg}" /></p>
									</div>
								</div>								
							</div>
							<div class="col-xs-12 col-sm-4 pv_feature_box">
								<div class="row">
									<div class="col-xs-4 col-sm-12">
										<img src="<%=request.getContextPath()%>/resources/images/wealthree/s3_icon_03.png" alt='<fmt:message key="wealthree.landing.features.3.title" bundle="${wealthreeMsg}" />' class="img-responsive">
									</div>
									<div class="col-xs-8 col-sm-12">
										<h3 class="pv_feature_title"><fmt:message key="wealthree.landing.features.3.title" bundle="${wealthreeMsg}" /></h3>
										<p class="pv_feature_desc"><fmt:message key="wealthree.landing.features.3.text" bundle="${wealthreeMsg}" /></p>
									</div>
								</div>
							</div>
							
							<div class="col-xs-12 col-sm-12 pv_feature_box">
								<div class="row">
									<div class="col-xs-12 col-sm-12">
										<span class="pv_remark">
										<fmt:message key="wealthree.landing.calculation.save.now.remark" bundle="${wealthreeMsg}" /><br><br>
										<fmt:message key="wealthree.landing.features.1.remarks" bundle="${wealthreeMsg}" /><br>
										<fmt:message key="wealthree.landing.features.3.remarks" bundle="${wealthreeMsg}" /><br>
										<fmt:message key="wealthree.landing.features.4.remarks" bundle="${wealthreeMsg}" />
										</span>
									</div>
								</div>
							</div>	
							<div class="col-xs-12">
								<div class="text-center btm-btn">
									<button class="btn-savenow" data-category="CTA" data-action="<%=request.getContextPath()%>/${language}/savings-insurance/wealthree-customer-service-centre/" data-label="<fmt:message key="wealthree.landing.calculation.save.now" bundle="${wealthreeMsg}" />" ><fmt:message key="wealthree.landing.calculation.save.now" bundle="${wealthreeMsg}" /></button><br><br>
								</div>
							</div>	
							<div class="col-xs-12">
							<div id="pd-sf-tab-content-container" class="container-fluid content-container-fluid">
			<div class="tab-content">
				<div role="tabpanel" class="tab-pane active" id="pd-sf-sale-illustration-sample-pane">
					<div class="panel-group" id="pd-sf-sale-illustration-sample-group" role="tablist" aria-multiselectable="true">
						<div class="panel panel-default pd-sf-sale-illustration-sample-panel">
						   <div class="panel-heading" role="tab" id="pd-sf-product-related">
							  <h4 class="panel-title">
								 <a class="collapsed" role="button" data-toggle="collapse" data-parent="#pd-sf-sale-illustration-sample-group" href="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
									<fmt:message key="provie.plandetails.productrisks.title" bundle="${wealthreeMsg}" />
									<span class="pull-right">
									   <img src="<%=request.getContextPath()%>/resources/images/savie-2016/arrow-down1.png" />
									</span>
								 </a>
							  </h4>
						   </div>
						   <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="pd-sf-product-related">
							  <div class="panel-body">
								<div>
									<p><fmt:message key="provie.plandetails.risk1.title" bundle="${wealthreeMsg}" /></p>
									<p><fmt:message key="provie.plandetails.risk1.text" bundle="${wealthreeMsg}" /></p><br/>
									<p><fmt:message key="provie.plandetails.risk2.title" bundle="${wealthreeMsg}" /></p>
									<p><fmt:message key="provie.plandetails.risk2.text" bundle="${wealthreeMsg}" /></p><br/>
									<p><fmt:message key="provie.plandetails.risk3.title" bundle="${wealthreeMsg}" /></p>
									<p><fmt:message key="provie.plandetails.risk3.text" bundle="${wealthreeMsg}" /></p><br/>
									<p><fmt:message key="provie.plandetails.risk4.title" bundle="${wealthreeMsg}" /></p>
									<p><fmt:message key="provie.plandetails.risk4.text" bundle="${wealthreeMsg}" /></p><br/>
									<p><fmt:message key="provie.plandetails.risk5.title" bundle="${wealthreeMsg}" /></p>
									<p><fmt:message key="provie.plandetails.risk5.text" bundle="${wealthreeMsg}" /></p><br/>
									<p><fmt:message key="provie.plandetails.term.title" bundle="${wealthreeMsg}" /></p>
									<p><fmt:message key="provie.plandetails.term.text" bundle="${wealthreeMsg}" /></p>
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
            		</div>
            	</div>
            </div>
                        
            <div class="hide" id="tableData">
            	<div class="provie">
            		<span class="type">
            			<fmt:message key="wealthree.landing.table.type.provie" bundle="${wealthreeMsg}" />
            		</span>
            		<span class="age">
            			<fmt:message key="wealthree.landing.table.age.provie" bundle="${wealthreeMsg}" />
            		</span>
            		<span class="paymentterm">
            			<fmt:message key="wealthree.landing.table.premium.payment.term.provie" bundle="${wealthreeMsg}" />
            		</span>
            		<span class="benefitterm">
            			<fmt:message key="wealthree.landing.table.benefit.term.provie" bundle="${wealthreeMsg}" />
            		</span>
            		<span class="currency">
            			<fmt:message key="wealthree.landing.table.policy.currency.provie" bundle="${wealthreeMsg}" />
            		</span>
            		<span class="interestrate">
            			<fmt:message key="wealthree.landing.table.rate.of.return.provie.hkd" bundle="${wealthreeMsg}" /><br><br>
            			<fmt:message key="wealthree.landing.table.rate.of.return.provie.usd" bundle="${wealthreeMsg}" /><br>
            			<fmt:message key="wealthree.landing.table.rate.of.return.provie.remark" bundle="${wealthreeMsg}" />
            		</span>
            		<span class="deathbenefit">
            			<fmt:message key="wealthree.landing.table.death.benefit.provie" bundle="${wealthreeMsg}" />
            		</span>
            		<span class="monthly">
            			<fmt:message key="wealthree.landing.table.monthly.provie" bundle="${wealthreeMsg}" />
            		</span>
            		<span class="rider-detail">
            			<span class="inner sw-monthly sep"><fmt:message key="wealthree.landing.table.monthly.provie" bundle="${wealthreeMsg}" /></span>
						<span class="sub_title">
							<fmt:message key="wealthree.landing.table.other.benefit.provie1.heading" bundle="${wealthreeMsg}" />
						</span>
						<fmt:message key="wealthree.landing.table.other.benefit.provie1" bundle="${wealthreeMsg}" />
						<br><br>
						<span class="sub_title">
							<fmt:message key="wealthree.landing.table.other.benefit.provie2.heading" bundle="${wealthreeMsg}" />
						</span>
						<fmt:message key="wealthree.landing.table.other.benefit.provie2" bundle="${wealthreeMsg}" />
						<br><br>
						<span class="sub_title">
							<fmt:message key="wealthree.landing.table.other.benefit.provie3.heading" bundle="${wealthreeMsg}" />
						</span>
						<fmt:message key="wealthree.landing.table.other.benefit.provie3" bundle="${wealthreeMsg}" />
	       			</span>
					<span class="maturity">
						<fmt:message key="wealthree.landing.table.maturity.benefit.provie" bundle="${wealthreeMsg}" />
					</span>
					<span class="surrender">
						<fmt:message key="wealthree.landing.table.surrender.benefit.provie" bundle="${wealthreeMsg}" />
					</span>
					<span class="psurrender">
						<fmt:message key="wealthree.landing.table.partial.surrender.benefit.provie" bundle="${wealthreeMsg}" />
					</span>
					<span class="withdrawal">
						<fmt:message key="wealthree.landing.table.no.of.withdrawal.provie" bundle="${wealthreeMsg}" />
					</span>
					<span class="minpsurrender">
						<fmt:message key="wealthree.landing.table.min.partial.surrender.provie" bundle="${wealthreeMsg}" />
					</span>
					<span class="maxpsurrender">
						<fmt:message key="wealthree.landing.table.max.partial.surrender.provie" bundle="${wealthreeMsg}" />
					</span>
					<span class="minacc">
						<fmt:message key="wealthree.landing.table.min.acc.value.provie" bundle="${wealthreeMsg}" />
					</span>
					<span class="detail">
						<a href="<%=request.getContextPath()%>/${language}/savings-insurance/provie"><fmt:message key="wealthree.landing.table.detail.title" bundle="${wealthreeMsg}" /></a>
					</span>
            	</div>
            	<div class="savie">
            		<span class="type">
            			<fmt:message key="wealthree.landing.table.type.savie" bundle="${wealthreeMsg}" />
            		</span>
            		<span class="age">
            			<fmt:message key="wealthree.landing.table.age.savie" bundle="${wealthreeMsg}" />
            		</span>
            		<span class="paymentterm">
            			<fmt:message key="wealthree.landing.table.premium.payment.term.savie" bundle="${wealthreeMsg}" />
            		</span>
            		<span class="benefitterm">
            			<fmt:message key="wealthree.landing.table.benefit.term.savie" bundle="${wealthreeMsg}" />
            		</span>
            		<span class="currency">
            			<fmt:message key="wealthree.landing.table.policy.currency.savie" bundle="${wealthreeMsg}" />
            		</span>
            		<span class="interestrate">
            			<fmt:message key="wealthree.landing.table.rate.of.return.savie.hkd" bundle="${wealthreeMsg}" /><br>
            			<fmt:message key="wealthree.landing.table.rate.of.return.savie.remark" bundle="${wealthreeMsg}" />
            		</span>
            		<span class="deathbenefit">
            			<fmt:message key="wealthree.landing.table.death.benefit.savie" bundle="${wealthreeMsg}" />
            		</span>
            		<span class="monthly">
            			
            		</span>
            		<span class="rider-detail">
						<span class="sub_title">
							<fmt:message key="wealthree.landing.table.other.benefit.savie1.heading" bundle="${wealthreeMsg}" />
						</span>
						<fmt:message key="wealthree.landing.table.other.benefit.savie1" bundle="${wealthreeMsg}" />
	       			</span>
					<span class="maturity">
						<fmt:message key="wealthree.landing.table.maturity.benefit.savie" bundle="${wealthreeMsg}" />
					</span>
					<span class="surrender">
						<fmt:message key="wealthree.landing.table.surrender.benefit.savie" bundle="${wealthreeMsg}" />
					</span>
					<span class="psurrender">
						<fmt:message key="wealthree.landing.table.partial.surrender.benefit.savie" bundle="${wealthreeMsg}" />
					</span>
					<span class="withdrawal">
						<fmt:message key="wealthree.landing.table.no.of.withdrawal.savie" bundle="${wealthreeMsg}" />
					</span>
					<span class="minpsurrender">
						<fmt:message key="wealthree.landing.table.min.partial.surrender.savie" bundle="${wealthreeMsg}" />
					</span>
					<span class="maxpsurrender">
						<fmt:message key="wealthree.landing.table.max.partial.surrender.savie" bundle="${wealthreeMsg}" />
					</span>
					<span class="minacc">
						<fmt:message key="wealthree.landing.table.min.acc.value.savie" bundle="${wealthreeMsg}" />
					</span>
					<span class="detail">
						<a href="<%=request.getContextPath()%>/${language}/savings-insurance"><fmt:message key="wealthree.landing.table.detail.title" bundle="${wealthreeMsg}" /></a>
					</span>
            	</div>
            	
            </div>            
			<div class="pv_compareTable">
				<div class="container">
					<div class="row">
						<div class="col-xs-12 visible-md visible-lg">
							<table>
								<tr>
									<th colspan="2"><span class="inner">&nbsp;</span></th>
									<th colspan="2"><span class="inner highlight"><fmt:message key="wealthree.landing.table.title.wealthree" bundle="${wealthreeMsg}" /></span></th>
									<th colspan="2"><!-- <span class="inner">
										<fmt:message key="wealthree.landing.table.title.savie" bundle="${wealthreeMsg}" /></span> -->
										<div class="inner">
											<div class="sel_wrapper">
												<i class="fa fa-sort-desc" aria-hidden="true"></i>
												<select id="sel_savie_provie">
												<option value="provie" selected><fmt:message key="wealthree.landing.table.title.provie" bundle="${wealthreeMsg}" /></option>
												<option value="savie"><fmt:message key="wealthree.landing.table.title.savie" bundle="${wealthreeMsg}" /></option>
												</select>
											</div>
										</div>
									</th>
								</tr>
								<tr>
									<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.type" bundle="${wealthreeMsg}" /></span></td>
									<td colspan="2" class="highlight"><span class="inner"><fmt:message key="wealthree.landing.table.type.wealthree" bundle="${wealthreeMsg}" /></span></td>
									<td colspan="2"><span class="inner sw-type"><fmt:message key="wealthree.landing.table.type.provie" bundle="${wealthreeMsg}" /></span></td>
								</tr>
								<tr>
									<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.age" bundle="${wealthreeMsg}" /></span></td>
									<td colspan="2" class="highlight"><span class="inner"><fmt:message key="wealthree.landing.table.age.wealthree" bundle="${wealthreeMsg}" /></span></td>
									<td colspan="2"><span class="inner sw-age"><fmt:message key="wealthree.landing.table.age.provie" bundle="${wealthreeMsg}" /></span></td>
								</tr>
								<tr>
									<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.premium.payment.term" bundle="${wealthreeMsg}" /></span></td>
									<td colspan="2" class="highlight"><span class="inner"><fmt:message key="wealthree.landing.table.premium.payment.term.wealthree" bundle="${wealthreeMsg}" /></span></td>
									<td colspan="2"><span class="inner sw-paymentterm"><fmt:message key="wealthree.landing.table.premium.payment.term.provie" bundle="${wealthreeMsg}" /></span></td>
								</tr>
								<tr>
									<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.benefit.term" bundle="${wealthreeMsg}" /></span></td>
									<td colspan="2" class="highlight"><span class="inner"><fmt:message key="wealthree.landing.table.benefit.term.wealthree" bundle="${wealthreeMsg}" /></span></td>
									<td colspan="2"><span class="inner sw-benefitterm"><fmt:message key="wealthree.landing.table.benefit.term.provie" bundle="${wealthreeMsg}" /></span></td>
								</tr>
								<tr>
									<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.policy.currency" bundle="${wealthreeMsg}" /></span></td>
									<td colspan="2" class="highlight"><span class="inner"><fmt:message key="wealthree.landing.table.policy.currency.wealthree" bundle="${wealthreeMsg}" /></span></td>
									<td colspan="2"><span class="inner sw-currency"><fmt:message key="wealthree.landing.table.policy.currency.provie" bundle="${wealthreeMsg}" /></span></td>
								</tr>
								<tr>
									<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.rate.of.return" bundle="${wealthreeMsg}" /></span></td>
									<td colspan="2" class="highlight"><span class="inner">
										<span class="pv_sub_heading"><fmt:message key="wealthree.landing.table.rate.of.return.wealthree.hkd1" bundle="${wealthreeMsg}" /></span><br>
										<fmt:message key="wealthree.landing.table.rate.of.return.wealthree.hkd2" bundle="${wealthreeMsg}" /><br>										<fmt:message key="wealthree.landing.table.rate.of.return.wealthree.hkd3" bundle="${wealthreeMsg}" /><br><br>
										<span class="pv_sub_heading"><fmt:message key="wealthree.landing.table.rate.of.return.wealthree.rmb1" bundle="${wealthreeMsg}" /></span><br>
										<fmt:message key="wealthree.landing.table.rate.of.return.wealthree.rmb2" bundle="${wealthreeMsg}" /><br><fmt:message key="wealthree.landing.table.rate.of.return.wealthree.rmb3" bundle="${wealthreeMsg}" />
										</span>
									</td>
									<td colspan="2"><span class="inner sw-interestrate"><fmt:message key="wealthree.landing.table.rate.of.return.provie.hkd" bundle="${wealthreeMsg}" /><br><br><fmt:message key="wealthree.landing.table.rate.of.return.provie.usd" bundle="${wealthreeMsg}" /><br><fmt:message key="wealthree.landing.table.rate.of.return.provie.remark" bundle="${wealthreeMsg}" /></span></td>
								</tr>
								<tr>
									<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.death.benefit" bundle="${wealthreeMsg}" /></span></td>
									<td colspan="2" class="highlight"><span class="inner"><fmt:message key="wealthree.landing.table.death.benefit.wealthree" bundle="${wealthreeMsg}" /></span></td>
									<td colspan="2"><span class="inner sw-deathbenefit"><fmt:message key="wealthree.landing.table.death.benefit.provie" bundle="${wealthreeMsg}" /></span></td>
								</tr>
								<%-- <tr class="tbl_row_sep"> <!-- other benefit -->
									<td colspan="2"></td>
									<td colspan="2"><span class="inner"></span></td>
									<td colspan="2"><span class="inner sw-monthly"><fmt:message key="wealthree.landing.table.monthly.provie" bundle="${wealthreeMsg}" /></span></td>
								</tr> --%>
								<tr><!-- other benefit -->
									<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.other.benefit" bundle="${wealthreeMsg}" /></span></td>
									<td colspan="2" class="highlight">
										<span class="inner">
											<fmt:message key="wealthree.landing.table.other.benefit.wealthree" bundle="${wealthreeMsg}" />
										</span>
									</td>
									<td colspan="2">
										<span class="inner sw-rider-detail">
											<span class="inner sw-monthly sep"><fmt:message key="wealthree.landing.table.monthly.provie" bundle="${wealthreeMsg}" /></span>
											<span class="sub_title">
												<fmt:message key="wealthree.landing.table.other.benefit.provie1.heading" bundle="${wealthreeMsg}" />
											</span>
											<fmt:message key="wealthree.landing.table.other.benefit.provie1" bundle="${wealthreeMsg}" />
											<br><br>
											<span class="sub_title">
												<fmt:message key="wealthree.landing.table.other.benefit.provie2.heading" bundle="${wealthreeMsg}" />
											</span>
											<fmt:message key="wealthree.landing.table.other.benefit.provie2" bundle="${wealthreeMsg}" />
											<br><br>
											<span class="sub_title">
												<fmt:message key="wealthree.landing.table.other.benefit.provie3.heading" bundle="${wealthreeMsg}" />
											</span>
											<fmt:message key="wealthree.landing.table.other.benefit.provie3" bundle="${wealthreeMsg}" />

										</span>
									</td>
								</tr>
								<tr>
									<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.maturity.benefit" bundle="${wealthreeMsg}" /></span></td>
									<td colspan="2" class="highlight"><span class="inner"><fmt:message key="wealthree.landing.table.maturity.benefit.wealthree" bundle="${wealthreeMsg}" /></span></td>
									<td colspan="2"><span class="inner sw-maturity"><fmt:message key="wealthree.landing.table.maturity.benefit.provie" bundle="${wealthreeMsg}" /></span></td>
								</tr>
								<tr>
									<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.surrender.benefit" bundle="${wealthreeMsg}" /></span></td>
									<td colspan="2" class="highlight"><span class="inner"><fmt:message key="wealthree.landing.table.surrender.benefit.wealthree" bundle="${wealthreeMsg}" /></span></td>
									<td colspan="2"><span class="inner sw-surrender"><fmt:message key="wealthree.landing.table.surrender.benefit.provie" bundle="${wealthreeMsg}" /></span></td>
								</tr>
								<tr>
									<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.partial.surrender.benefit" bundle="${wealthreeMsg}" /></span></td>
									<td colspan="2" class="highlight"><span class="inner"><fmt:message key="wealthree.landing.table.partial.surrender.benefit.wealthree" bundle="${wealthreeMsg}" /></span></td>
									<td colspan="2"><span class="inner sw-psurrender"><fmt:message key="wealthree.landing.table.partial.surrender.benefit.provie" bundle="${wealthreeMsg}" /></span></td>
								</tr>
								<tr>
									<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.no.of.withdrawal" bundle="${wealthreeMsg}" /></span></td>
									<td colspan="2" class="highlight"><span class="inner"><fmt:message key="wealthree.landing.table.no.of.withdrawal.wealthree" bundle="${wealthreeMsg}" /></span></td>
									<td colspan="2"><span class="inner sw-withdrawal"><fmt:message key="wealthree.landing.table.no.of.withdrawal.provie" bundle="${wealthreeMsg}" /></span></td>
								</tr>
								<tr>
									<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.min.partial.surrender" bundle="${wealthreeMsg}" /></span></td>
									<td colspan="2" class="highlight"><span class="inner"><fmt:message key="wealthree.landing.table.min.partial.surrender.wealthree" bundle="${wealthreeMsg}" /></span></td>
									<td colspan="2"><span class="inner sw-minpsurrender"><fmt:message key="wealthree.landing.table.min.partial.surrender.provie" bundle="${wealthreeMsg}" /></span></td>
								</tr>
								<tr>
									<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.max.partial.surrender" bundle="${wealthreeMsg}" /></span></td>
									<td colspan="2" class="highlight"><span class="inner"><fmt:message key="wealthree.landing.table.max.partial.surrender.wealthree" bundle="${wealthreeMsg}" /></span></td>
									<td colspan="2"><span class="inner sw-maxpsurrender"><fmt:message key="wealthree.landing.table.max.partial.surrender.provie" bundle="${wealthreeMsg}" /></span></td>
								</tr>
								<tr>
									<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.min.acc.value" bundle="${wealthreeMsg}" /></span></td>
									<td colspan="2" class="highlight"><span class="inner"><fmt:message key="wealthree.landing.table.min.acc.value.wealthree" bundle="${wealthreeMsg}" /></span></td>
									<td colspan="2"><span class="inner sw-minacc"><fmt:message key="wealthree.landing.table.min.acc.value.provie" bundle="${wealthreeMsg}" /></span></td>
								</tr>
								<tr>
									<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.detail.title" bundle="${wealthreeMsg}" /></span></td>
									<td colspan="2" class="highlight"><span class="inner">&nbsp;</span></td>
									<td colspan="2"><span class="inner sw-detail">
										<a href="<%=request.getContextPath()%>/${language}/savings-insurance/provie"><fmt:message key="wealthree.landing.table.detail.title" bundle="${wealthreeMsg}" /></a>
									</span></td>
								</tr>
								
								<tr>
									<td colspan="6">
										<span class="inner pv_remark">
											<sup>*</sup><fmt:message key="wealthree.landing.table.remark1" bundle="${wealthreeMsg}" /><br><br>
											<sup>**</sup><fmt:message key="wealthree.landing.table.remark2" bundle="${wealthreeMsg}" /><br><br>
											<sup>***</sup><fmt:message key="wealthree.landing.table.remark3" bundle="${wealthreeMsg}" /><br><br>
											<sup>+</sup><fmt:message key="wealthree.landing.table.remark4" bundle="${wealthreeMsg}" /><br><br>
											<sup>^</sup><fmt:message key="wealthree.landing.table.remark5" bundle="${wealthreeMsg}" /><br><br>
											<sup>#</sup><fmt:message key="wealthree.landing.table.remark6" bundle="${wealthreeMsg}" /><br>
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
														<th colspan="4"><span class="inner"><fmt:message key="wealthree.landing.table.title.wealthree" bundle="${wealthreeMsg}" /></span></th>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.type" bundle="${wealthreeMsg}" /></span></td>
														<td colspan="2" ><span class="inner"><fmt:message key="wealthree.landing.table.type.wealthree" bundle="${wealthreeMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.age" bundle="${wealthreeMsg}" /></span></td>
														<td colspan="2" ><span class="inner"><fmt:message key="wealthree.landing.table.age.wealthree" bundle="${wealthreeMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.premium.payment.term" bundle="${wealthreeMsg}" /></span></td>
														<td colspan="2" ><span class="inner"><fmt:message key="wealthree.landing.table.premium.payment.term.wealthree" bundle="${wealthreeMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.benefit.term" bundle="${wealthreeMsg}" /></span></td>
														<td colspan="2" ><span class="inner"><fmt:message key="wealthree.landing.table.benefit.term.wealthree" bundle="${wealthreeMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.policy.currency" bundle="${wealthreeMsg}" /></span></td>
														<td colspan="2" ><span class="inner"><fmt:message key="wealthree.landing.table.policy.currency.wealthree" bundle="${wealthreeMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.rate.of.return" bundle="${wealthreeMsg}" /></span></td>
														<td colspan="2" ><span class="inner"><span class="pv_sub_heading">
															<fmt:message key="wealthree.landing.table.rate.of.return.wealthree.hkd1" bundle="${wealthreeMsg}" /></span><br>
															<fmt:message key="wealthree.landing.table.rate.of.return.wealthree.hkd2" bundle="${wealthreeMsg}" /><br>
															<fmt:message key="wealthree.landing.table.rate.of.return.wealthree.hkd3" bundle="${wealthreeMsg}" /><br>
															<br>
															<span class="pv_sub_heading">
															<fmt:message key="wealthree.landing.table.rate.of.return.wealthree.rmb1" bundle="${wealthreeMsg}" /></span><br>
															<fmt:message key="wealthree.landing.table.rate.of.return.wealthree.rmb2" bundle="${wealthreeMsg}" /><br>
															<fmt:message key="wealthree.landing.table.rate.of.return.wealthree.rmb3" bundle="${wealthreeMsg}" />
															</span>
														</td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.death.benefit" bundle="${wealthreeMsg}" /></span></td>
														<td colspan="2" ><span class="inner"><fmt:message key="wealthree.landing.table.death.benefit.wealthree" bundle="${wealthreeMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.other.benefit" bundle="${wealthreeMsg}" /></span></td>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.other.benefit.wealthree" bundle="${wealthreeMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.maturity.benefit" bundle="${wealthreeMsg}" /></span></td>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.maturity.benefit.wealthree" bundle="${wealthreeMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.surrender.benefit" bundle="${wealthreeMsg}" /></span></td>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.surrender.benefit.wealthree" bundle="${wealthreeMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.partial.surrender.benefit" bundle="${wealthreeMsg}" /></span></td>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.partial.surrender.benefit.wealthree" bundle="${wealthreeMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.no.of.withdrawal" bundle="${wealthreeMsg}" /></span></td>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.no.of.withdrawal.wealthree" bundle="${wealthreeMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.min.partial.surrender" bundle="${wealthreeMsg}" /></span></td>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.min.partial.surrender.wealthree" bundle="${wealthreeMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.max.partial.surrender" bundle="${wealthreeMsg}" /></span></td>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.max.partial.surrender.wealthree" bundle="${wealthreeMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.min.acc.value" bundle="${wealthreeMsg}" /></span></td>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.min.acc.value.wealthree" bundle="${wealthreeMsg}" /></span></td>
													</tr>

													
													<tr>
														<td colspan="6">
															<span class="inner pv_remark">
																<sup>*</sup><fmt:message key="wealthree.landing.table.remark1" bundle="${wealthreeMsg}" /><br><br>
																<sup>**</sup><fmt:message key="wealthree.landing.table.remark2" bundle="${wealthreeMsg}" /><br><br>
																<sup>***</sup><fmt:message key="wealthree.landing.table.remark3" bundle="${wealthreeMsg}" /><br><br>
																<sup>+</sup><fmt:message key="wealthree.landing.table.remark4" bundle="${wealthreeMsg}" /><br><br>
																<sup>^</sup><fmt:message key="wealthree.landing.table.remark5" bundle="${wealthreeMsg}" /><br><br>
																<sup>#</sup><fmt:message key="wealthree.landing.table.remark6" bundle="${wealthreeMsg}" /><br>
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
														<th colspan="4"><span class="inner"><fmt:message key="wealthree.landing.table.title.provie" bundle="${wealthreeMsg}" /></span></th>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.type" bundle="${wealthreeMsg}" /></span></td>
														<td colspan="2" ><span class="inner"><fmt:message key="wealthree.landing.table.type.provie" bundle="${wealthreeMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.age" bundle="${wealthreeMsg}" /></span></td>
														<td colspan="2" ><span class="inner"><fmt:message key="wealthree.landing.table.age.provie" bundle="${wealthreeMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.premium.payment.term" bundle="${wealthreeMsg}" /></span></td>
														<td colspan="2" ><span class="inner"><fmt:message key="wealthree.landing.table.premium.payment.term.provie" bundle="${wealthreeMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.benefit.term" bundle="${wealthreeMsg}" /></span></td>
														<td colspan="2" ><span class="inner"><fmt:message key="wealthree.landing.table.benefit.term.provie" bundle="${wealthreeMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.policy.currency" bundle="${wealthreeMsg}" /></span></td>
														<td colspan="2" ><span class="inner"><fmt:message key="wealthree.landing.table.policy.currency.provie" bundle="${wealthreeMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.rate.of.return" bundle="${wealthreeMsg}" /></span></td>
														<td colspan="2" ><span class="inner"><span class="pv_sub_heading">
															<fmt:message key="wealthree.landing.table.rate.of.return.provie.hkd" bundle="${wealthreeMsg}" /><br><br>
															<fmt:message key="wealthree.landing.table.rate.of.return.provie.usd" bundle="${wealthreeMsg}" /></span><br><br>
															<span class="inner pv_remark">
															<fmt:message key="wealthree.landing.table.rate.of.return.provie.remark" bundle="${wealthreeMsg}" /></span>
															</span>
														</td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.death.benefit" bundle="${wealthreeMsg}" /></span></td>
														<td colspan="2" ><span class="inner"><fmt:message key="wealthree.landing.table.death.benefit.provie" bundle="${wealthreeMsg}" /></span></td>
													</tr>
													<%-- <tr>
														<td colspan="2"></td>
														<td colspan="2" class="sep"><span class="inner"><fmt:message key="wealthree.landing.table.monthly.provie" bundle="${wealthreeMsg}" /></span></td>
													</tr> --%>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.other.benefit" bundle="${wealthreeMsg}" /></span></td>
														<td colspan="2"><span class="inner">
														<span class="inner sep"><fmt:message key="wealthree.landing.table.monthly.provie" bundle="${wealthreeMsg}" /></span>
														<span class="pv_sub_heading"><fmt:message key="wealthree.landing.table.other.benefit.provie1.heading" bundle="${wealthreeMsg}" /></span>
														<fmt:message key="wealthree.landing.table.other.benefit.provie1" bundle="${wealthreeMsg}" /><br><br>
														<span class="pv_sub_heading"><fmt:message key="wealthree.landing.table.other.benefit.provie2.heading" bundle="${wealthreeMsg}" /></span>
														<fmt:message key="wealthree.landing.table.other.benefit.provie2" bundle="${wealthreeMsg}" /><br><br>
														<span class="pv_sub_heading"><fmt:message key="wealthree.landing.table.other.benefit.provie3.heading" bundle="${wealthreeMsg}" /></span>
														<fmt:message key="wealthree.landing.table.other.benefit.provie3" bundle="${wealthreeMsg}" />
															</span>
														</td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.maturity.benefit" bundle="${wealthreeMsg}" /></span></td>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.maturity.benefit.provie" bundle="${wealthreeMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.surrender.benefit" bundle="${wealthreeMsg}" /></span></td>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.surrender.benefit.provie" bundle="${wealthreeMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.partial.surrender.benefit" bundle="${wealthreeMsg}" /></span></td>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.partial.surrender.benefit.provie" bundle="${wealthreeMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.no.of.withdrawal" bundle="${wealthreeMsg}" /></span></td>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.no.of.withdrawal.provie" bundle="${wealthreeMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.min.partial.surrender" bundle="${wealthreeMsg}" /></span></td>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.min.partial.surrender.provie" bundle="${wealthreeMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.max.partial.surrender" bundle="${wealthreeMsg}" /></span></td>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.max.partial.surrender.provie" bundle="${wealthreeMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.min.acc.value" bundle="${wealthreeMsg}" /></span></td>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.min.acc.value.provie" bundle="${wealthreeMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.detail.title" bundle="${wealthreeMsg}" /></span></td>
														<td colspan="2"><span class="inner"><a href="<%=request.getContextPath()%>/${language}/savings-insurance/provie"><fmt:message key="wealthree.landing.table.detail.title" bundle="${wealthreeMsg}" /></a></span></td>
													</tr>

													
													<tr>
														<td colspan="6">
															<span class="inner pv_remark">
																<sup>*</sup><fmt:message key="wealthree.landing.table.remark1" bundle="${wealthreeMsg}" /><br><br>
																<sup>**</sup><fmt:message key="wealthree.landing.table.remark2" bundle="${wealthreeMsg}" /><br><br>
																<sup>***</sup><fmt:message key="wealthree.landing.table.remark3" bundle="${wealthreeMsg}" /><br><br>
																<sup>+</sup><fmt:message key="wealthree.landing.table.remark4" bundle="${wealthreeMsg}" /><br><br>
																<sup>^</sup><fmt:message key="wealthree.landing.table.remark5" bundle="${wealthreeMsg}" /><br><br>
																<sup>#</sup><fmt:message key="wealthree.landing.table.remark6" bundle="${wealthreeMsg}" /><br>
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
														<th colspan="4"><span class="inner"><fmt:message key="wealthree.landing.table.title.savie" bundle="${wealthreeMsg}" /></span></th>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.type" bundle="${wealthreeMsg}" /></span></td>
														<td colspan="2" ><span class="inner"><fmt:message key="wealthree.landing.table.type.savie" bundle="${wealthreeMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.age" bundle="${wealthreeMsg}" /></span></td>
														<td colspan="2" ><span class="inner"><fmt:message key="wealthree.landing.table.age.savie" bundle="${wealthreeMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.premium.payment.term" bundle="${wealthreeMsg}" /></span></td>
														<td colspan="2" ><span class="inner"><fmt:message key="wealthree.landing.table.premium.payment.term.savie" bundle="${wealthreeMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.benefit.term" bundle="${wealthreeMsg}" /></span></td>
														<td colspan="2" ><span class="inner"><fmt:message key="wealthree.landing.table.benefit.term.savie" bundle="${wealthreeMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.policy.currency" bundle="${wealthreeMsg}" /></span></td>
														<td colspan="2" ><span class="inner"><fmt:message key="wealthree.landing.table.policy.currency.savie" bundle="${wealthreeMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.rate.of.return" bundle="${wealthreeMsg}" /></span></td>
														<td colspan="2" ><span class="inner"><span class="pv_sub_heading">
															<fmt:message key="wealthree.landing.table.rate.of.return.savie.hkd" bundle="${wealthreeMsg}" /></span><br><br>
															<span class="inner pv_remark"><fmt:message key="wealthree.landing.table.rate.of.return.savie.remark" bundle="${wealthreeMsg}" /><br></span>
														
														</span>
														</td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.death.benefit" bundle="${wealthreeMsg}" /></span></td>
														<td colspan="2" ><span class="inner"><fmt:message key="wealthree.landing.table.death.benefit.savie" bundle="${wealthreeMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.other.benefit" bundle="${wealthreeMsg}" /></span></td>
														<td colspan="2"><span class="inner">
														<span class="pv_sub_heading"><fmt:message key="wealthree.landing.table.other.benefit.savie1.heading" bundle="${wealthreeMsg}" /></span><br>
														<fmt:message key="wealthree.landing.table.other.benefit.savie1" bundle="${wealthreeMsg}" />
														
														</span>
														</td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.maturity.benefit" bundle="${wealthreeMsg}" /></span></td>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.maturity.benefit.savie" bundle="${wealthreeMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.surrender.benefit" bundle="${wealthreeMsg}" /></span></td>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.surrender.benefit.savie" bundle="${wealthreeMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.partial.surrender.benefit" bundle="${wealthreeMsg}" /></span></td>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.partial.surrender.benefit.savie" bundle="${wealthreeMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.no.of.withdrawal" bundle="${wealthreeMsg}" /></span></td>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.no.of.withdrawal.savie" bundle="${wealthreeMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.min.partial.surrender" bundle="${wealthreeMsg}" /></span></td>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.min.partial.surrender.savie" bundle="${wealthreeMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.max.partial.surrender" bundle="${wealthreeMsg}" /></span></td>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.max.partial.surrender.savie" bundle="${wealthreeMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.min.acc.value" bundle="${wealthreeMsg}" /></span></td>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.min.acc.value.savie" bundle="${wealthreeMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.detail.title" bundle="${wealthreeMsg}" /></span></td>
														<td colspan="2"><span class="inner"><a href="<%=request.getContextPath()%>/${language}/savings-insurance"><fmt:message key="wealthree.landing.table.detail.title" bundle="${wealthreeMsg}" /></a></span></td>
													</tr>

													
													<tr>
														<td colspan="6">
															<span class="inner pv_remark">
																<sup>*</sup><fmt:message key="wealthree.landing.table.remark1" bundle="${wealthreeMsg}" /><br><br>
																<sup>**</sup><fmt:message key="wealthree.landing.table.remark2" bundle="${wealthreeMsg}" /><br><br>
																<sup>***</sup><fmt:message key="wealthree.landing.table.remark3" bundle="${wealthreeMsg}" /><br><br>
																<sup>+</sup><fmt:message key="wealthree.landing.table.remark4" bundle="${wealthreeMsg}" /><br><br>
																<sup>^</sup><fmt:message key="wealthree.landing.table.remark5" bundle="${wealthreeMsg}" /><br><br>
																<sup>#</sup><fmt:message key="wealthree.landing.table.remark6" bundle="${wealthreeMsg}" /><br>
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

						<div class="col-xs-12">
							<div class="text-center btm-btn">
								<br>
								<button class="btn-savenow" data-category="CTA" data-action="<%=request.getContextPath()%>/${language}/savings-insurance/wealthree-customer-service-centre/" data-label="<fmt:message key="wealthree.landing.table.save.now" bundle="${wealthreeMsg}" />"><fmt:message key="wealthree.landing.table.save.now" bundle="${wealthreeMsg}" /></button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="blog">
		        <div class="hidden-md hidden-lg">
		            <div class="mini-banner-holder"><img src="http://blog.fwd.com.hk/wp-content/uploads/2016/07/shutterstock_65480164.jpg" class="img-responsive">
		                <div class="black-overlay"></div>
		                <h5 class="text-center"><fmt:message key="wealthree.landing.blog.title" bundle="${wealthreeMsg}" /></h5> </div>
		            <div class="btn-holder">
		                <button id="btn-blog-link" class="savie-regular-btn"><fmt:message key="wealthree.landing.blog.readmore" bundle="${wealthreeMsg}" /></button>
		            </div>
		        </div>
		        <div class="hidden-xs hidden-sm">
		            <h3 class="text-center"><fmt:message key="wealthree.landing.blog.readmore" bundle="${wealthreeMsg}" /></h3>
		            <div class="gray-divide"></div>
		            <p class="definition text-center"><fmt:message key="wealthree.landing.blog.title" bundle="${wealthreeMsg}" /></p>
		            <div class="blogs-holder clearfix fwd-container-limit">
		                <div class="blogs first"> <img src="http://blog.fwd.com.hk/wp-content/uploads/2016/07/shutterstock_65480164.jpg" class="img-responsive">
		                    <div class="orange-overlay text-center">
		                        <p class="title"><fmt:message key="wealthree.landing.blog.1.topic" bundle="${wealthreeMsg}" /></p>
		                        <p class="definition"></p> <a class="btn-read-now" href='<fmt:message key="wealthree.landing.blog.1.url" bundle="${wealthreeMsg}" />' target="_blank"><fmt:message key="wealthree.landing.blog.readmore" bundle="${wealthreeMsg}" /></a> </div>
		                </div>
		                <div class="blogs"> <img src="http://blog.fwd.com.hk/wp-content/uploads/2016/06/shutterstock_344288030.jpg" class="img-responsive">
		                    <div class="orange-overlay text-center">
		                        <p class="title"><fmt:message key="wealthree.landing.blog.2.topic" bundle="${wealthreeMsg}" /></p>
		                        <p class="definition"></p> <a class="btn-read-now" href='<fmt:message key="wealthree.landing.blog.2.url" bundle="${wealthreeMsg}" />' target="_blank"><fmt:message key="wealthree.landing.blog.readmore" bundle="${wealthreeMsg}" /></a> </div>
		                </div>
		                <div class="blogs"> <img src="http://blog.fwd.com.hk/wp-content/uploads/2016/07/Pocket-Wifi安部數碼2035.jpg" class="img-responsive">
		                    <div class="orange-overlay text-center">
		                        <p class="title"><fmt:message key="wealthree.landing.blog.3.topic" bundle="${wealthreeMsg}" /></p>
		                        <p class="definition"></p> <a class="btn-read-now" href='<fmt:message key="wealthree.landing.blog.3.url" bundle="${wealthreeMsg}" />' target="_blank"><fmt:message key="wealthree.landing.blog.readmore" bundle="${wealthreeMsg}" /></a> </div>
		                </div>
		                <div class="blogs last"> <img src="http://blog.fwd.com.hk/wp-content/uploads/2015/08/3-saving-tips-smart-parents.jpg" class="img-responsive">
		                    <div class="orange-overlay text-center">
		                        <p class="title"><fmt:message key="wealthree.landing.blog.4.topic" bundle="${wealthreeMsg}" /></p>
		                        <p class="definition"></p> <a class="btn-read-now" href='<fmt:message key="wealthree.landing.blog.4.url" bundle="${wealthreeMsg}" />' target="_blank"><fmt:message key="wealthree.landing.blog.readmore" bundle="${wealthreeMsg}" /></a> </div>
		                </div>
		            </div>
		            <div class="fwd-container-limit">
		                <p class="blog-notice"><fmt:message key="wealthree.landing.blog.notice" bundle="${wealthreeMsg}" /></p>
		            </div>
		        </div>
    		</div>

    		<div class="pv_share">
    			<div class="container">
    				<div class="row">
    					<div class="col-xs-12">
    						<h2 class="pv_title"><fmt:message key="wealthree.landing.share.title" bundle="${wealthreeMsg}" /></h2>
    						<p class="pv_desc"><fmt:message key="wealthree.landing.share.text1" bundle="${wealthreeMsg}" /></p>
    					</div>
    					<div class="col-xs-12 text-center">
							<a href="javascript:void(0);" class="btn-spd-share" data-category="Social Share Btn" data-action="Share Wealthree to Facebook" data-label="Facebook icon" ><img src="<%=request.getContextPath()%>/resources/images/provie/provie_landing_s8_fb.png" alt="Facebook"></a>
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

</div>

<script src="<%=request.getContextPath()%>/resources/js/vendor/nouislider.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/savie/jquery.touchSwipe.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/provie/provie-landing-uifn.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/wealthree/wealthree-landing-uifn.js"></script>
<script>
	var pvSetting = {
		errMsg: {
			genderEmpty    : '<fmt:message key="wealthree.landing.setting.text1" bundle="${wealthreeMsg}" />',
			ageEmpty       : '<fmt:message key="wealthree.landing.setting.text2" bundle="${wealthreeMsg}" />',
			ageLess        : '<fmt:message key="wealthree.landing.setting.text3" bundle="${wealthreeMsg}" />',
			ageMore        : '<fmt:message key="wealthree.landing.setting.text4" bundle="${wealthreeMsg}" />',
			methodEmpty    : '<fmt:message key="wealthree.landing.setting.text5" bundle="${wealthreeMsg}" />',
			amountEmpty    : '<fmt:message key="wealthree.landing.setting.text6" bundle="${wealthreeMsg}" />',
			'amountPROVIE-RPHKDLess': '<fmt:message key="wealthree.landing.setting.text7" bundle="${wealthreeMsg}" />',
			'amountPROVIE-RPHKDMore': '<fmt:message key="wealthree.landing.setting.text8" bundle="${wealthreeMsg}" />',
			'amountPROVIE-SPHKDLess': '<fmt:message key="wealthree.landing.setting.text9" bundle="${wealthreeMsg}" />',
			'amountPROVIE-SPHKDMore': '<fmt:message key="wealthree.landing.setting.text10" bundle="${wealthreeMsg}" />',
			'amountPROVIE-RPUSDLess': '<fmt:message key="wealthree.landing.setting.text11" bundle="${wealthreeMsg}" />',
			'amountPROVIE-RPUSDMore': '<fmt:message key="wealthree.landing.setting.text12" bundle="${wealthreeMsg}" />',
			'amountPROVIE-SPUSDLess': '<fmt:message key="wealthree.landing.setting.text13" bundle="${wealthreeMsg}" />',
			'amountPROVIE-SPUSDMore': '<fmt:message key="wealthree.landing.setting.text14" bundle="${wealthreeMsg}" />',
			currencyEmpty  : '<fmt:message key="wealthree.landing.setting.text15" bundle="${wealthreeMsg}" />',
			yearEmpty      : '<fmt:message key="wealthree.landing.setting.text16" bundle="${wealthreeMsg}" />',
			loginFail      : '<fmt:message key="wealthree.landing.setting.text17" bundle="${wealthreeMsg}" />',
			yearEmpty	   : '<fmt:message key="wealthree.landing.setting.text18" bundle="${wealthreeMsg}" />',
			fnaLoginEmpty  : '<fmt:message key="wealthree.landing.setting.text19" bundle="${wealthreeMsg}" />'
		},
		currencyData: {
			HKD: {
				fixRate: [1.5, 1.5, 2, 2, 3, 2, 2],
				prefix: '<fmt:message key="wealthree.landing.calculation.priceHKDPrefix" bundle="${wealthreeMsg}" />'
			},
			USD: {
				fixRate: [2, 2, 2, 2, 3, 2, 2],
				prefix: '<fmt:message key="wealthree.landing.calculation.priceUSDPrefix" bundle="${wealthreeMsg}" />'
			}
		}
	};

 	$(document).ready(function(){
		$(".btn-savenow, start-btn").on('click', function(){
			window.location = '<%=request.getContextPath()%>/${language}/savings-insurance/wealthree-customer-service-centre'
		});
	}); 
</script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/provie/provie-payment-discount.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/provie/provie-landing-style.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/wealthree/wealthree-landing-style.css">
