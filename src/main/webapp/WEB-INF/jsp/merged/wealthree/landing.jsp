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
                        <form id="o2o-landing-form" action="${pageContext.request.contextPath}/${language}/savings-insurance/wealthree-customer-service-centre"  method="post">
                            <div class="img-banner-text savie-landing">
                                <div id="clearfix-height-rp">
                                    <button id="op-buy-now-O2O-mobile" class="savie-regular-btn start-btn"><fmt:message key="wealthree.landing.cta.start" bundle="${wealthreeMsg}" /></button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
			<div class="pv_mobile_middle_buttons hidden-lg hidden-md">
				<div class="fwd-container-limit">
					<form id="o2o-landing-form" action="${pageContext.request.contextPath}/${language}/savings-insurance/wealthree-customer-service-centre"  method="post">
						<div class="img-banner-text savie-landing">
							<div id="clearfix-height-rp">
								<button id="op-buy-now-O2O-mobile" class="savie-regular-btn start-btn"><fmt:message key="wealthree.landing.cta.start" bundle="${wealthreeMsg}" /></button>
							</div>
							<div class="savie-product text-bold">
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
							</div>

						</div>
					</form>
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
	            				<a id="dlProductBrochure" class="" href="https://www.fwd.com.hk/~/media/Files/FWDHK/pdf/protect/cars-boats/Motor-Smart-Insurance-Brochure_1_041016.pdf" target="_blank"><i class="fa fa-download" aria-hidden="true"></i>&nbsp;產品小冊子</a>
	            				<a id="dlProductBrochure" class="" href="https://www.fwd.com.hk/~/media/Files/FWDHK/pdf/protect/cars-boats/Motor-Smart-Insurance-Brochure_1_041016.pdf" target="_blank"><i class="fa fa-download" aria-hidden="true"></i>&nbsp;產品小冊子</a>
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

									<img src="<%=request.getContextPath()%>/resources/images/wealthree/${language}/m_s1_chart_hkd_01.jpg" alt="" class="img-responsive visible-xs">

									<img src="<%=request.getContextPath()%>/resources/images/wealthree/${language}/m_s1_chart_hkd_02.jpg" alt="" class="img-responsive visible-xs">

									<img src="<%=request.getContextPath()%>/resources/images/wealthree/${language}/m_s1_chart_hkd_03.jpg" alt="" class="img-responsive visible-xs">
									
								</div>
								<div class="chart-rmb hide">
									<img src="<%=request.getContextPath()%>/resources/images/wealthree/${language}/s1_chart_rmb.jpg" alt="" class="img-responsive hidden-xs">

									<img src="<%=request.getContextPath()%>/resources/images/wealthree/${language}/m_s1_chart_rmb_01.jpg" alt="" class="img-responsive visible-xs">

									<img src="<%=request.getContextPath()%>/resources/images/wealthree/${language}/m_s1_chart_rmb_02.jpg" alt="" class="img-responsive visible-xs">

									<img src="<%=request.getContextPath()%>/resources/images/wealthree/${language}/m_s1_chart_rmb_03.jpg" alt="" class="img-responsive visible-xs">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="wp_productCalculator">
				<div class="container">
					<div class="row">
						<div class="col-xs-12">
							<h3>您好，我們知道您想展開儲蓄大計！</h3>
							<p>請告訴我們您的想法及希望如何達成目標。</p>

							<div class="row">
								<div class="col-xs-12 col-sm-6">
									<div class="box-input">
										<img src="<%=request.getContextPath()%>/resources/images/wealthree/s2_icon_01.png" alt="">
										<span>首年內繳付保費</span>

										<div class="text-center form-wrapper">
											<div class="txt-amount-wrapper">
												<input type="text" id="txt_amount" name="txt_amount" placeholder="$100,000">
											</div>
											<div class="sel-currency-wrapper">
												<select id="sel_currency">
													<option value="hkd"><fmt:message key="wealthree.landing.currency.hkd" bundle="${wealthreeMsg}" /></option>
													<option value="rmb"><fmt:message key="wealthree.landing.currency.rmb" bundle="${wealthreeMsg}" /></option>
												</select>
												<i class="fa fa-sort-desc" aria-hidden="true"></i>
											</div>
										</div>
										<div class="text-center">
											<a href="javascript:void(0);" class="btn-calculate">計算保費</a>
										</div>
									</div>
								</div>
								<div class="col-xs-12 col-sm-6">
									<div class="box-result">
										<img src="<%=request.getContextPath()%>/resources/images/wealthree/s2_icon_02.png" alt="">
										<span>總繳付保費</span>
										<span class="ttl_pay_amount">
											
										</span>
										<img src="<%=request.getContextPath()%>/resources/images/wealthree/s2_arrow_down.png" alt="">
										<span>第三年期滿後保證回報</span>

										<span class="yrs3_return">
											
										</span>

									</div>
								</div>

								<div class="clearfix"></div>

								<div class="col-xs-12">
									<div class="tbl-result-wrapper">
										<h4 class="text-center">更享有戶口價值之120% 作為身故權益</h4>
										<div class="tbl-wrapper clearfix">
											<div class="col-year">
												<div class="col-year-inner">
													<table>
														<tr>
															<th>保單年期</th>
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
														<tr>
															<th>繳付保費</th>
															<th>保證身故權益</th>
															<th>保單價值</th>
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
										</div>
									</div>
								</div>

								<div class="col-xs-12">
									<div class="text-center btm-btn">
										<button class="btn-savenow">開始儲蓄</button>
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

							<div class="col-xs-12 col-sm-4 pv_feature_box text-center">
								<img src="<%=request.getContextPath()%>/resources/images/wealthree/s3_icon_01.png" alt='<fmt:message key="wealthree.landing.features.1.title" bundle="${wealthreeMsg}" />' class="img_responsive">
								<h3 class="pv_feature_title"><fmt:message key="wealthree.landing.features.1.title" bundle="${wealthreeMsg}" /></h3>
								<p class="pv_feature_desc"><fmt:message key="wealthree.landing.features.1.text1" bundle="${wealthreeMsg}" /><span class="pv_remark"><sup>*</sup><fmt:message key="wealthree.landing.features.1.remarks" bundle="${wealthreeMsg}" /></span></p>
							</div>

							<div class="col-xs-12 col-sm-4 pv_feature_box text-center">
								<img src="<%=request.getContextPath()%>/resources/images/wealthree/s3_icon_02.png" alt='<fmt:message key="wealthree.landing.features.2.title" bundle="${wealthreeMsg}" />' class="img_responsive">
								<h3 class="pv_feature_title"><fmt:message key="wealthree.landing.features.2.title" bundle="${wealthreeMsg}" /></h3>
								<p class="pv_feature_desc"><fmt:message key="wealthree.landing.features.2.text" bundle="${wealthreeMsg}" /></p>
							</div>
							<div class="col-xs-12 col-sm-4 pv_feature_box text-center">
								<img src="<%=request.getContextPath()%>/resources/images/wealthree/s3_icon_03.png" alt='<fmt:message key="wealthree.landing.features.3.title" bundle="${wealthreeMsg}" />' class="img_responsive">
								<h3 class="pv_feature_title"><fmt:message key="wealthree.landing.features.3.title" bundle="${wealthreeMsg}" /></h3>
								<p class="pv_feature_desc"><fmt:message key="wealthree.landing.features.3.text" bundle="${wealthreeMsg}" /><span class="pv_remark"><sup>*</sup><fmt:message key="wealthree.landing.features.3.remarks" bundle="${wealthreeMsg}" /></span></p>
							</div>
						</div>
            		</div>
            	</div>
            </div>
            <div class="hide" id="tableData">
            	<div class="savie">
            		<span class="age">
            			<fmt:message key="wealthree.landing.table.age.savie" bundle="${wealthreeMsg}" />
            		</span>
            		<span class="benefitterm">
            			<fmt:message key="wealthree.landing.table.benefitterm.savie" bundle="${wealthreeMsg}" />
            		</span>
            		<span class="currency">
            			<fmt:message key="wealthree.landing.table.currency.savie" bundle="${wealthreeMsg}" />
            		</span>
            		<span class="interestrate">
            			<fmt:message key="wealthree.landing.table.interestrate.savie" bundle="${wealthreeMsg}" />
            		</span>
            		<span class="deathbenefit">
            			<fmt:message key="wealthree.landing.table.deathbenefit.savie" bundle="${wealthreeMsg}" />
            		</span>
            		<span class="rider"></span>
            		<span class="rider-detail">
						<span class="sub_title">
							<fmt:message key="wealthree.landing.table.rider1.savie.title" bundle="${wealthreeMsg}" />
						</span>
						<fmt:message key="wealthree.landing.table.rider1.savie.text1" bundle="${wealthreeMsg}" />
						<span class="remark"><fmt:message key="wealthree.landing.table.rider1.savie.text2" bundle="${wealthreeMsg}" /></span>
            		</span>
            		<span class="withdrawal"><fmt:message key="wealthree.landing.table.withdrawal.savie.title" bundle="${wealthreeMsg}" /></span>
            		<span class="withdrawal-min"><fmt:message key="wealthree.landing.table.withdrawal.min.savie" bundle="${wealthreeMsg}" /></span>
            		<span class="withdrawal-max"><fmt:message key="wealthree.landing.table.withdrawal.max.savie" bundle="${wealthreeMsg}" /></span>
            		<span class="maxamount-monthly">
						<fmt:message key="wealthree.landing.table.maxamount.savie.monthly" bundle="${wealthreeMsg}" />
					</span>
					<span class="maxamount-oneoff">
						<fmt:message key="wealthree.landing.table.maxamount.savie.oneoff" bundle="${wealthreeMsg}" />
					</span>
					<span class="maxamount-monthly">
						<fmt:message key="wealthree.landing.table.minamount.savie.monthly" bundle="${wealthreeMsg}" />
					</span>
					<span class="maxamount-oneoff">
						<fmt:message key="wealthree.landing.table.minamount.savie.oneoff" bundle="${wealthreeMsg}" />
					</span>
					<span class="minacctvalue">
						<fmt:message key="wealthree.landing.table.minacctvalue.savie" bundle="${wealthreeMsg}" />
					</span>
            	</div>
            	<div class="provie">
            		<span class="age">
            			<fmt:message key="wealthree.landing.table.age.wealthree" bundle="${wealthreeMsg}" />
            		</span>
            		<span class="benefitterm">
            			<fmt:message key="wealthree.landing.table.benefitterm.wealthree" bundle="${wealthreeMsg}" />
            		</span>
            		<span class="currency">
            			<fmt:message key="wealthree.landing.table.currency.wealthree" bundle="${wealthreeMsg}" />
            		</span>
            		<span class="interestrate">
            			<span class="pv_sub_heading"><fmt:message key="wealthree.landing.table.interestrate.remarks" bundle="${wealthreeMsg}" /></span><br>
										<fmt:message key="wealthree.landing.table.interestrate.wealthree1" bundle="${wealthreeMsg}" /><br><fmt:message key="wealthree.landing.table.interestrate.wealthree2" bundle="${wealthreeMsg}" /><br>
										<fmt:message key="wealthree.landing.table.interestrate.wealthree3" bundle="${wealthreeMsg}" /><br><br>
										<span class="pv_sub_heading"><fmt:message key="wealthree.landing.table.interestrate.wealthree.usd" bundle="${wealthreeMsg}" /></span><br>
										<fmt:message key="wealthree.landing.table.interestrate.wealthree1.usd" bundle="${wealthreeMsg}" /><br><fmt:message key="wealthree.landing.table.interestrate.wealthree2.usd" bundle="${wealthreeMsg}" />
            		</span>
            		<span class="deathbenefit">
            			<fmt:message key="wealthree.landing.table.deathbenefit.wealthree" bundle="${wealthreeMsg}" />
            		</span>
            		<span class="rider">
            			<fmt:message key="wealthree.landing.table.title2.rider" bundle="${wealthreeMsg}" />
            		</span>
            		<span class="rider-detail">
						<span class="sub_title">
												<fmt:message key="wealthree.landing.table.title.rider1" bundle="${wealthreeMsg}" />
											</span>
											<fmt:message key="wealthree.landing.table.rider1.text" bundle="${wealthreeMsg}" />
											<span class="remark"><fmt:message key="wealthree.landing.table.rider1.remarks" bundle="${wealthreeMsg}" /></span>
											<span class="sub_title">
												<fmt:message key="wealthree.landing.table.title.rider2" bundle="${wealthreeMsg}" />
											</span>
											<fmt:message key="wealthree.landing.table.rider2.text" bundle="${wealthreeMsg}" />
											<span class="remark"><fmt:message key="wealthree.landing.table.rider2.remarks" bundle="${wealthreeMsg}" /></span>
											<span class="sub_title">
												<fmt:message key="wealthree.landing.table.title.rider3" bundle="${wealthreeMsg}" />
											</span>
											<fmt:message key="wealthree.landing.table.rider3.text" bundle="${wealthreeMsg}" />
											<span class="remark"><fmt:message key="wealthree.landing.table.rider3.remarks" bundle="${wealthreeMsg}" /></span>
            		</span>
            		<span class="withdrawal"><fmt:message key="wealthree.landing.table.withdrawal.wealthree.title" bundle="${wealthreeMsg}" /></span>
            		<span class="withdrawal-min"><fmt:message key="wealthree.landing.table.withdrawal.min.wealthree" bundle="${wealthreeMsg}" /></span>
            		<span class="withdrawal-max"><fmt:message key="wealthree.landing.table.withdrawal.max.wealthree" bundle="${wealthreeMsg}" /></span>
            		<span class="maxamount-monthly">
						<fmt:message key="wealthree.landing.table.maxamount.wealthree.monthly" bundle="${wealthreeMsg}" />
					</span>
					<span class="maxamount-oneoff">
						<fmt:message key="wealthree.landing.table.maxamount.wealthree.oneoff" bundle="${wealthreeMsg}" />
					</span>
					<span class="minamount-monthly">
						<fmt:message key="wealthree.landing.table.minamount.wealthree.monthly" bundle="${wealthreeMsg}" />
					</span>
					<span class="minamount-oneoff">
						<fmt:message key="wealthree.landing.table.minamount.wealthree.oneoff" bundle="${wealthreeMsg}" />
					</span>
					<span class="minacctvalue">
						<fmt:message key="wealthree.landing.table.minacctvalue.wealthree" bundle="${wealthreeMsg}" />
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
													<option value="savie" selected><fmt:message key="wealthree.landing.table.title.savie" bundle="${wealthreeMsg}" /></span></option>
													<option value="provie"><fmt:message key="wealthree.landing.table.title.provie" bundle="${wealthreeMsg}" /></span></option>
												</select>
											</div>
										</div>
									</th>
								</tr>
								<tr>
									<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.age" bundle="${wealthreeMsg}" /></span></td>
									<td colspan="2" class="highlight"><span class="inner"><fmt:message key="wealthree.landing.table.age.wealthree" bundle="${wealthreeMsg}" /></span></td>
									<td colspan="2"><span class="inner sw-age"><fmt:message key="wealthree.landing.table.age.savie" bundle="${wealthreeMsg}" /></span></td>
								</tr>
								<tr>
									<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.benefitterm" bundle="${wealthreeMsg}" /></span></td>
									<td colspan="2" class="highlight"><span class="inner"><fmt:message key="wealthree.landing.table.benefitterm.wealthree" bundle="${wealthreeMsg}" /></span></td>
									<td colspan="2"><span class="inner sw-benefitterm"><fmt:message key="wealthree.landing.table.benefitterm.savie" bundle="${wealthreeMsg}" /></span></td>
								</tr>
								<tr>
									<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.currency" bundle="${wealthreeMsg}" /></span></td>
									<td colspan="2" class="highlight"><span class="inner"><fmt:message key="wealthree.landing.table.currency.wealthree" bundle="${wealthreeMsg}" /></span></td>
									<td colspan="2"><span class="inner sw-currency"><fmt:message key="wealthree.landing.table.currency.savie" bundle="${wealthreeMsg}" /></span></td>
								</tr>
								<tr>
									<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.interestrate" bundle="${wealthreeMsg}" /></span></td>
									<td colspan="2" class="highlight"><span class="inner"><span class="pv_sub_heading"><fmt:message key="wealthree.landing.table.interestrate.remarks" bundle="${wealthreeMsg}" /></span><br>
										<fmt:message key="wealthree.landing.table.interestrate.wealthree1" bundle="${wealthreeMsg}" /><br><fmt:message key="wealthree.landing.table.interestrate.wealthree2" bundle="${wealthreeMsg}" /><br>
										<fmt:message key="wealthree.landing.table.interestrate.wealthree3" bundle="${wealthreeMsg}" /><br><br>
										<span class="pv_sub_heading"><fmt:message key="wealthree.landing.table.interestrate.wealthree.usd" bundle="${wealthreeMsg}" /></span><br>
										<fmt:message key="wealthree.landing.table.interestrate.wealthree1.usd" bundle="${wealthreeMsg}" /><br><fmt:message key="wealthree.landing.table.interestrate.wealthree2.usd" bundle="${wealthreeMsg}" /></span>
									</td>
									<td colspan="2"><span class="inner sw-interestrate"><fmt:message key="wealthree.landing.table.interestrate.savie" bundle="${wealthreeMsg}" /></span></td>
								</tr>
								<tr>
									<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.deathbenefit" bundle="${wealthreeMsg}" /></span></td>
									<td colspan="2" class="highlight"><span class="inner"><fmt:message key="wealthree.landing.table.deathbenefit.wealthree" bundle="${wealthreeMsg}" /></span></td>
									<td colspan="2"><span class="inner sw-deathbenefit"><fmt:message key="wealthree.landing.table.deathbenefit.savie" bundle="${wealthreeMsg}" /></span></td>
								</tr>
								<tr>
									<td colspan="2"></td>
									<td colspan="2" class="sep highlight"><span class="inner"><fmt:message key="wealthree.landing.table.title2.rider" bundle="${wealthreeMsg}" /></span></td>
									<td colspan="2"><span class="inner sw-rider"></span></td>
								</tr>
								<tr>
									<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.riders" bundle="${wealthreeMsg}" /></span></td>
									<td colspan="2" class="highlight">
										<span class="inner">
											<span class="sub_title">
												<fmt:message key="wealthree.landing.table.title.rider1" bundle="${wealthreeMsg}" />
											</span>
											<fmt:message key="wealthree.landing.table.rider1.text" bundle="${wealthreeMsg}" />
											<span class="remark"><fmt:message key="wealthree.landing.table.rider1.remarks" bundle="${wealthreeMsg}" /></span>
											<span class="sub_title">
												<fmt:message key="wealthree.landing.table.title.rider2" bundle="${wealthreeMsg}" />
											</span>
											<fmt:message key="wealthree.landing.table.rider2.text" bundle="${wealthreeMsg}" />
											<span class="remark"><fmt:message key="wealthree.landing.table.rider2.remarks" bundle="${wealthreeMsg}" /></span>
											<span class="sub_title">
												<fmt:message key="wealthree.landing.table.title.rider3" bundle="${wealthreeMsg}" />
											</span>
											<fmt:message key="wealthree.landing.table.rider3.text" bundle="${wealthreeMsg}" />
											<span class="remark"><fmt:message key="wealthree.landing.table.rider3.remarks" bundle="${wealthreeMsg}" /></span>
										</span>
									</td>
									<td colspan="2">
										<span class="inner sw-rider-detail">
											<span class="sub_title">
												<fmt:message key="wealthree.landing.table.rider1.savie.title" bundle="${wealthreeMsg}" />
											</span>
											<fmt:message key="wealthree.landing.table.rider1.savie.text1" bundle="${wealthreeMsg}" />
											<span class="remark"><fmt:message key="wealthree.landing.table.rider1.savie.text2" bundle="${wealthreeMsg}" /></span>
										</span>
									</td>
								</tr>
								<tr>
									<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.withdrawal.title" bundle="${wealthreeMsg}" /></span></td>
									<td colspan="2" class="highlight"><span class="inner"><fmt:message key="wealthree.landing.table.withdrawal.wealthree.title" bundle="${wealthreeMsg}" /></span></td>
									<td colspan="2"><span class="inner sw-withdrawal"><fmt:message key="wealthree.landing.table.withdrawal.savie.title" bundle="${wealthreeMsg}" /></span></td>
								</tr>
								<tr>
									<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.withdrawal.min.title" bundle="${wealthreeMsg}" /></span></td>
									<td colspan="2" class="highlight"><span class="inner"><fmt:message key="wealthree.landing.table.withdrawal.min.wealthree" bundle="${wealthreeMsg}" /></span></td>
									<td colspan="2"><span class="inner sw-withdrawal-min"><fmt:message key="wealthree.landing.table.withdrawal.min.savie" bundle="${wealthreeMsg}" /></span></td>
								</tr>
								<tr>
									<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.withdrawal.max.title" bundle="${wealthreeMsg}" /></span></td>
									<td colspan="2" class="highlight"><span class="inner"><fmt:message key="wealthree.landing.table.withdrawal.max.wealthree" bundle="${wealthreeMsg}" /></span></td>
									<td colspan="2"><span class="inner sw-withdrawal-max"><fmt:message key="wealthree.landing.table.withdrawal.max.savie" bundle="${wealthreeMsg}" /></span></td>
								</tr>
								<tr>
									<td colspan="2"></td>
									<td class="sep"><span class="inner"><fmt:message key="wealthree.landing.table.monthly.wealthree" bundle="${wealthreeMsg}" /></span></td>
									<td class="sep hideborderLeft"><span class="inner"><fmt:message key="wealthree.landing.table.oneoff.wealthree" bundle="${wealthreeMsg}" /></span></td>
									<td class="sep"><span class="inner"><fmt:message key="wealthree.landing.table.monthly.wealthree" bundle="${wealthreeMsg}" /></span></td>
									<td class="sep hideborderLeft"><span class="inner"><fmt:message key="wealthree.landing.table.oneoff.wealthree" bundle="${wealthreeMsg}" /></span></td>
								</tr>
								<tr>
									<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.maxamount" bundle="${wealthreeMsg}" /></span></td>
									<td class="highlight"><span class="inner"><fmt:message key="wealthree.landing.table.maxamount.wealthree.monthly" bundle="${wealthreeMsg}" /></span></td>
									<td class="hideborderLeft highlight"><span class="inner"><fmt:message key="wealthree.landing.table.maxamount.wealthree.oneoff" bundle="${wealthreeMsg}" /></span></td>
									<td><span class="inner sw-maxamount-monthly"><fmt:message key="wealthree.landing.table.maxamount.savie.monthly" bundle="${wealthreeMsg}" /></span></td>
									<td class="hideborderLeft"><span class="inner sw-maxamount-oneoff"><fmt:message key="wealthree.landing.table.maxamount.savie.oneoff" bundle="${wealthreeMsg}" /></span></td>
								</tr>
								<tr>
									<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.minamount" bundle="${wealthreeMsg}" /></span></td>
									<td class="highlight"><span class="inner"><fmt:message key="wealthree.landing.table.minamount.wealthree.monthly" bundle="${wealthreeMsg}" /></span></td>
									<td class="hideborderLeft highlight"><span class="inner"><fmt:message key="wealthree.landing.table.minamount.wealthree.oneoff" bundle="${wealthreeMsg}" /></span></td>
									<td><span class="inner sw-minamount-monthly"><fmt:message key="wealthree.landing.table.minamount.savie.monthly" bundle="${wealthreeMsg}" /></span></td>
									<td class="hideborderLeft"><span class="inner sw-minamount-oneoff"><fmt:message key="wealthree.landing.table.minamount.savie.oneoff" bundle="${wealthreeMsg}" /></span></td>
								</tr>
								<tr>
									<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.minacctvalue" bundle="${wealthreeMsg}" /></span></td>
									<td colspan="2" class="highlight"><span class="inner"><fmt:message key="wealthree.landing.table.minacctvalue.wealthree" bundle="${wealthreeMsg}" /></span></td>
									<td colspan="2"><span class="inner sw-minacctvalue"><fmt:message key="wealthree.landing.table.minacctvalue.savie" bundle="${wealthreeMsg}" /></span></td>
								</tr>
								<tr>
									<td colspan="6">
										<span class="inner pv_remark">
											<sup>*</sup><fmt:message key="wealthree.landing.table.acctvalue.remarks1" bundle="${wealthreeMsg}" />
											<br>
											<sup>**</sup><fmt:message key="wealthree.landing.table.acctvalue.remarks2" bundle="${wealthreeMsg}" />
										</span>
									</td>
								</tr>
								<tr>
									<td colspan="6">
										<span class="inner pv_remark">
											<fmt:message key="wealthree.landing.table.remarks1.text1" bundle="${wealthreeMsg}" />
										</span>
									</td>
								</tr>
								<tr>
									<td colspan="6">
										<span class="inner pv_remark">
											<fmt:message key="wealthree.landing.table.remarks2.text1" bundle="${wealthreeMsg}" />
											<br>
											<fmt:message key="wealthree.landing.table.remarks3.text1" bundle="${wealthreeMsg}" />
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
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.age" bundle="${wealthreeMsg}" /></span></td>
														<td colspan="2" class="highlight"><span class="inner"><fmt:message key="wealthree.landing.table.age.wealthree" bundle="${wealthreeMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.benefitterm" bundle="${wealthreeMsg}" /></span></td>
														<td colspan="2" class="highlight"><span class="inner"><fmt:message key="wealthree.landing.table.benefitterm.wealthree" bundle="${wealthreeMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.currency" bundle="${wealthreeMsg}" /></span></td>
														<td colspan="2" class="highlight"><span class="inner"><fmt:message key="wealthree.landing.table.currency.wealthree" bundle="${wealthreeMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.interestrate" bundle="${wealthreeMsg}" /></span></td>
														<td colspan="2" class="highlight"><span class="inner"><span class="pv_sub_heading"><fmt:message key="wealthree.landing.table.interestrate.remarks" bundle="${wealthreeMsg}" /></span><br>
															<fmt:message key="wealthree.landing.table.interestrate.wealthree1" bundle="${wealthreeMsg}" /><br><fmt:message key="wealthree.landing.table.interestrate.wealthree2" bundle="${wealthreeMsg}" /><br>
															<fmt:message key="wealthree.landing.table.interestrate.wealthree3" bundle="${wealthreeMsg}" /><br>
															<span class="pv_sub_heading"><fmt:message key="wealthree.landing.table.interestrate.wealthree.usd" bundle="${wealthreeMsg}" /></span><br>
															<fmt:message key="wealthree.landing.table.interestrate.wealthree1.usd" bundle="${wealthreeMsg}" /><br><fmt:message key="wealthree.landing.table.interestrate.wealthree2.usd" bundle="${wealthreeMsg}" /></span>
														</td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.deathbenefit" bundle="${wealthreeMsg}" /></span></td>
														<td colspan="2" class="highlight"><span class="inner"><fmt:message key="wealthree.landing.table.deathbenefit.wealthree" bundle="${wealthreeMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"></td>
														<td colspan="2" class="sep highlight"><span class="inner"><fmt:message key="wealthree.landing.table.title2.rider" bundle="${wealthreeMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.riders" bundle="${wealthreeMsg}" /></span></td>
														<td colspan="2" class="highlight">
															<span class="inner">
																<span class="sub_title">
																	<fmt:message key="wealthree.landing.table.title.rider1" bundle="${wealthreeMsg}" />
																</span>
																<fmt:message key="wealthree.landing.table.rider1.text" bundle="${wealthreeMsg}" />
																<span class="remark"><fmt:message key="wealthree.landing.table.rider1.remarks" bundle="${wealthreeMsg}" /></span>
																<span class="sub_title">
																	<fmt:message key="wealthree.landing.table.title.rider2" bundle="${wealthreeMsg}" />
																</span>
																<fmt:message key="wealthree.landing.table.rider2.text" bundle="${wealthreeMsg}" />
																<span class="remark"><fmt:message key="wealthree.landing.table.rider2.remarks" bundle="${wealthreeMsg}" /></span>
																<span class="sub_title">
																	<fmt:message key="wealthree.landing.table.title.rider3" bundle="${wealthreeMsg}" />
																</span>
																<fmt:message key="wealthree.landing.table.rider3.text" bundle="${wealthreeMsg}" />
																<span class="remark"><fmt:message key="wealthree.landing.table.rider3.remarks" bundle="${wealthreeMsg}" /></span>
															</span>
														</td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.withdrawal.title" bundle="${wealthreeMsg}" /></span></td>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.withdrawal.wealthree.title" bundle="${wealthreeMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.withdrawal.min.title" bundle="${wealthreeMsg}" /></span></td>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.withdrawal.min.wealthree" bundle="${wealthreeMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.withdrawal.max.title" bundle="${wealthreeMsg}" /></span></td>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.withdrawal.max.wealthree" bundle="${wealthreeMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"></td>
														<td class="sep"><span class="inner"><fmt:message key="wealthree.landing.table.monthly.wealthree" bundle="${wealthreeMsg}" /></span></td>
														<td class="sep hideborderLeft"><span class="inner"><fmt:message key="wealthree.landing.table.oneoff.wealthree" bundle="${wealthreeMsg}" /></span></td>
													</tr>

													 <tr>
														<td colspan="2">
															<span class="inner"><fmt:message key="wealthree.landing.table.title.maxamount" bundle="${wealthreeMsg}" /></span>
														</td>
														<td class="highlight">
															<span class="inner"><fmt:message key="wealthree.landing.table.maxamount.wealthree.monthly" bundle="${wealthreeMsg}" /></span>
														</td>
														<td class="hideborderLeft highlight">
															<span class="inner"><fmt:message key="wealthree.landing.table.maxamount.wealthree.oneoff" bundle="${wealthreeMsg}" /></span>
														</td>
														<!-- <td class="hideborderLeft highlight">
															<span class="inner"><fmt:message key="wealthree.landing.table.maxamount.wealthree.oneoff" bundle="${wealthreeMsg}" /></span>
														</td> -->
													</tr>



													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.minamount" bundle="${wealthreeMsg}" /></span></td>
														<td class="highlight"><span class="inner"><fmt:message key="wealthree.landing.table.minamount.wealthree.monthly" bundle="${wealthreeMsg}" /></span></td>
														<td class="hideborderLeft highlight"><span class="inner"><fmt:message key="wealthree.landing.table.minamount.wealthree.oneoff" bundle="${wealthreeMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.minacctvalue" bundle="${wealthreeMsg}" /></span></td>
														<td colspan="2" class="highlight"><span class="inner"><fmt:message key="wealthree.landing.table.minacctvalue.wealthree" bundle="${wealthreeMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="6">
															<span class="inner pv_remark">
																<sup>*</sup><fmt:message key="wealthree.landing.table.acctvalue.remarks1" bundle="${wealthreeMsg}" /><br>
																<sup>**</sup><fmt:message key="wealthree.landing.table.acctvalue.remarks2" bundle="${wealthreeMsg}" />
															</span>
														</td>
													</tr>
													<tr>
														<td colspan="6">
															<span class="inner pv_remark">
																<fmt:message key="wealthree.landing.table.remarks1.text1" bundle="${wealthreeMsg}" />
															</span>
														</td>
													</tr>
													<tr>
														<td colspan="6">
															<span class="inner pv_remark">
																<fmt:message key="wealthree.landing.table.remarks2.text1" bundle="${wealthreeMsg}" />
																<br>
																<fmt:message key="wealthree.landing.table.remarks3.text1" bundle="${wealthreeMsg}" />
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
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.age" bundle="${wealthreeMsg}" /></span></td>
														<td colspan="2"><span class="inner sw-age"><fmt:message key="wealthree.landing.table.age.savie" bundle="${wealthreeMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.benefitterm" bundle="${wealthreeMsg}" /></span></td>
														<td colspan="2"><span class="inner sw-benefitterm"><fmt:message key="wealthree.landing.table.benefitterm.savie" bundle="${wealthreeMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.currency" bundle="${wealthreeMsg}" /></span></td>
														<td colspan="2"><span class="inner sw-currency"><fmt:message key="wealthree.landing.table.currency.savie" bundle="${wealthreeMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.interestrate" bundle="${wealthreeMsg}" /></span></td>
														<td colspan="2"><span class="inner sw-interestrate"><fmt:message key="wealthree.landing.table.interestrate.savie" bundle="${wealthreeMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.deathbenefit" bundle="${wealthreeMsg}" /></span></td>
														<td colspan="2"><span class="inner sw-deathbenefit"><fmt:message key="wealthree.landing.table.deathbenefit.savie" bundle="${wealthreeMsg}" /></td>
													</tr>
													<tr>
														<td colspan="2"></td>
														<td colspan="2"></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.rider1.savie.title" bundle="${wealthreeMsg}" /></span></td>
														<td colspan="2">
															<span class="inner">
																<span class="sub_title">
																	<fmt:message key="wealthree.landing.table.rider1.savie.title" bundle="${wealthreeMsg}" />
																</span>
																<fmt:message key="wealthree.landing.table.rider1.savie.text1" bundle="${wealthreeMsg}" />
																<span class="remark"><fmt:message key="wealthree.landing.table.rider1.savie.text2" bundle="${wealthreeMsg}" /></span>
															</span>
														</td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.withdrawal.title" bundle="${wealthreeMsg}" /></span></td>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.withdrawal.savie.title" bundle="${wealthreeMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.withdrawal.min.title" bundle="${wealthreeMsg}" /></span></td>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.withdrawal.min.savie" bundle="${wealthreeMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.withdrawal.max.title" bundle="${wealthreeMsg}" /></span></td>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.withdrawal.max.savie" bundle="${wealthreeMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"></td>
														<td class="sep"><span class="inner"><fmt:message key="wealthree.landing.table.monthly.savie" bundle="${wealthreeMsg}" /></span></td>
														<td class="sep hideborderLeft"><span class="inner"><fmt:message key="wealthree.landing.table.oneoff.savie" bundle="${wealthreeMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.maxamount" bundle="${wealthreeMsg}" /></span></td>
														<td><span class="inner"><fmt:message key="wealthree.landing.table.maxamount.savie.monthly" bundle="${wealthreeMsg}" /></span></td>
														<td class="hideborderLeft"><span class="inner"><fmt:message key="wealthree.landing.table.maxamount.savie.oneoff" bundle="${wealthreeMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.minamount" bundle="${wealthreeMsg}" /></span></td>
														<td><span class="inner"><fmt:message key="wealthree.landing.table.minamount.savie.monthly" bundle="${wealthreeMsg}" /></span></td>
														<td class="hideborderLeft"><span class="inner"><fmt:message key="wealthree.landing.table.minamount.savie.oneoff" bundle="${wealthreeMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.minacctvalue" bundle="${wealthreeMsg}" /></span></td>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.minacctvalue.savie" bundle="${wealthreeMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="6">
															<span class="inner pv_remark">
																<sup>*</sup><fmt:message key="wealthree.landing.table.acctvalue.remarks1" bundle="${wealthreeMsg}" />
																<br>
																<sup>**</sup><fmt:message key="wealthree.landing.table.acctvalue.remarks2" bundle="${wealthreeMsg}" />
															</span>
														</td>
													</tr>
													<tr>
														<td colspan="6">
															<span class="inner pv_remark">
																<fmt:message key="wealthree.landing.table.remarks1.text1" bundle="${wealthreeMsg}" />
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
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.age" bundle="${wealthreeMsg}" /></span></td>
														<td colspan="2" class="highlight"><span class="inner"><fmt:message key="wealthree.landing.table.age.wealthree" bundle="${wealthreeMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.benefitterm" bundle="${wealthreeMsg}" /></span></td>
														<td colspan="2" class="highlight"><span class="inner"><fmt:message key="wealthree.landing.table.benefitterm.wealthree" bundle="${wealthreeMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.currency" bundle="${wealthreeMsg}" /></span></td>
														<td colspan="2" class="highlight"><span class="inner"><fmt:message key="wealthree.landing.table.currency.wealthree" bundle="${wealthreeMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.interestrate" bundle="${wealthreeMsg}" /></span></td>
														<td colspan="2" class="highlight"><span class="inner"><span class="pv_sub_heading"><fmt:message key="wealthree.landing.table.interestrate.remarks" bundle="${wealthreeMsg}" /></span><br>
															<fmt:message key="wealthree.landing.table.interestrate.wealthree1" bundle="${wealthreeMsg}" /><br><fmt:message key="wealthree.landing.table.interestrate.wealthree2" bundle="${wealthreeMsg}" /><br>
															<fmt:message key="wealthree.landing.table.interestrate.wealthree3" bundle="${wealthreeMsg}" /><br>
															<span class="pv_sub_heading"><fmt:message key="wealthree.landing.table.interestrate.wealthree.usd" bundle="${wealthreeMsg}" /></span><br>
															<fmt:message key="wealthree.landing.table.interestrate.wealthree1.usd" bundle="${wealthreeMsg}" /><br><fmt:message key="wealthree.landing.table.interestrate.wealthree2.usd" bundle="${wealthreeMsg}" /></span>
														</td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.deathbenefit" bundle="${wealthreeMsg}" /></span></td>
														<td colspan="2" class="highlight"><span class="inner"><fmt:message key="wealthree.landing.table.deathbenefit.wealthree" bundle="${wealthreeMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"></td>
														<td colspan="2" class="sep highlight"><span class="inner"><fmt:message key="wealthree.landing.table.title2.rider" bundle="${wealthreeMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.riders" bundle="${wealthreeMsg}" /></span></td>
														<td colspan="2" class="highlight">
															<span class="inner">
																<span class="sub_title">
																	<fmt:message key="wealthree.landing.table.title.rider1" bundle="${wealthreeMsg}" />
																</span>
																<fmt:message key="wealthree.landing.table.rider1.text" bundle="${wealthreeMsg}" />
																<span class="remark"><fmt:message key="wealthree.landing.table.rider1.remarks" bundle="${wealthreeMsg}" /></span>
																<span class="sub_title">
																	<fmt:message key="wealthree.landing.table.title.rider2" bundle="${wealthreeMsg}" />
																</span>
																<fmt:message key="wealthree.landing.table.rider2.text" bundle="${wealthreeMsg}" />
																<span class="remark"><fmt:message key="wealthree.landing.table.rider2.remarks" bundle="${wealthreeMsg}" /></span>
																<span class="sub_title">
																	<fmt:message key="wealthree.landing.table.title.rider3" bundle="${wealthreeMsg}" />
																</span>
																<fmt:message key="wealthree.landing.table.rider3.text" bundle="${wealthreeMsg}" />
																<span class="remark"><fmt:message key="wealthree.landing.table.rider3.remarks" bundle="${wealthreeMsg}" /></span>
															</span>
														</td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.withdrawal.title" bundle="${wealthreeMsg}" /></span></td>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.withdrawal.wealthree.title" bundle="${wealthreeMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.withdrawal.min.title" bundle="${wealthreeMsg}" /></span></td>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.withdrawal.min.wealthree" bundle="${wealthreeMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.withdrawal.max.title" bundle="${wealthreeMsg}" /></span></td>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.withdrawal.max.wealthree" bundle="${wealthreeMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"></td>
														<td class="sep"><span class="inner"><fmt:message key="wealthree.landing.table.monthly.wealthree" bundle="${wealthreeMsg}" /></span></td>
														<td class="sep hideborderLeft"><span class="inner"><fmt:message key="wealthree.landing.table.oneoff.wealthree" bundle="${wealthreeMsg}" /></span></td>
													</tr>

													 <tr>
														<td colspan="2">
															<span class="inner"><fmt:message key="wealthree.landing.table.title.maxamount" bundle="${wealthreeMsg}" /></span>
														</td>
														<td class="highlight">
															<span class="inner"><fmt:message key="wealthree.landing.table.maxamount.wealthree.monthly" bundle="${wealthreeMsg}" /></span>
														</td>
														<td class="hideborderLeft highlight">
															<span class="inner"><fmt:message key="wealthree.landing.table.maxamount.wealthree.oneoff" bundle="${wealthreeMsg}" /></span>
														</td>
														<!-- <td class="hideborderLeft highlight">
															<span class="inner"><fmt:message key="wealthree.landing.table.maxamount.wealthree.oneoff" bundle="${wealthreeMsg}" /></span>
														</td> -->
													</tr>



													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.minamount" bundle="${wealthreeMsg}" /></span></td>
														<td class="highlight"><span class="inner"><fmt:message key="wealthree.landing.table.minamount.wealthree.monthly" bundle="${wealthreeMsg}" /></span></td>
														<td class="hideborderLeft highlight"><span class="inner"><fmt:message key="wealthree.landing.table.minamount.wealthree.oneoff" bundle="${wealthreeMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner"><fmt:message key="wealthree.landing.table.title.minacctvalue" bundle="${wealthreeMsg}" /></span></td>
														<td colspan="2" class="highlight"><span class="inner"><fmt:message key="wealthree.landing.table.minacctvalue.wealthree" bundle="${wealthreeMsg}" /></span></td>
													</tr>
													<tr>
														<td colspan="6">
															<span class="inner pv_remark">
																<sup>*</sup><fmt:message key="wealthree.landing.table.acctvalue.remarks1" bundle="${wealthreeMsg}" /><br>
																<sup>**</sup><fmt:message key="wealthree.landing.table.acctvalue.remarks2" bundle="${wealthreeMsg}" />
															</span>
														</td>
													</tr>
													<tr>
														<td colspan="6">
															<span class="inner pv_remark">
																<fmt:message key="wealthree.landing.table.remarks1.text1" bundle="${wealthreeMsg}" />
															</span>
														</td>
													</tr>
													<tr>
														<td colspan="6">
															<span class="inner pv_remark">
																<fmt:message key="wealthree.landing.table.remarks2.text1" bundle="${wealthreeMsg}" />
																<br>
																<fmt:message key="wealthree.landing.table.remarks3.text1" bundle="${wealthreeMsg}" />
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
								<button class="btn-savenow">開始儲蓄</button>
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

</div>

<script src="<%=request.getContextPath()%>/resources/js/vendor/nouislider.min.js"></script>
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
</script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/provie/provie-payment-discount.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/provie/provie-landing-style.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/wealthree/wealthree-landing-style.css">
