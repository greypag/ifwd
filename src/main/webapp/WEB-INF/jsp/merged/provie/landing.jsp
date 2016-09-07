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

<%
	boolean isSaleActiveClass = false;
	boolean isEservicesActiveClass = false;
%>

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/savie-regular-styles.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/provie/provie-styles.css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/provie/dropdowns-enhancement.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/provie/provie-landing-style.css">

<link rel="stylesheet" type="text/css" href="http://refreshless.com/noUiSlider/distribute/nouislider.min.css">
<link href="<%=request.getContextPath()%>/resources/css/pnotify.custom.min.css" media="all" rel="stylesheet" type="text/css" />

<div class="fwd-savie-wrapper savie-online-container with-breadcrumbs-steps provie-plan-landing" id="provie-plan-landing">			
       
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
                	<img src="<%=request.getContextPath()%>/resources/images/provie/landing-bg-mobile.jpg" class="img-responsive hidden-sm hidden-md hidden-lg"> <img src="<%=request.getContextPath()%>/resources/images/provie/landing-bg-desktop.jpg" class="img-responsive hidden-xs">
                	<div class="pv_overlay_text_wrap">
            			<h2 class="pv_title"><fmt:message key="provie.landing.breadcrumb" bundle="${provieMsg}" /></h2>
            			<p class="pv_desc"><fmt:message key="provie.landing.title1" bundle="${provieMsg}" /></p>	
                	</div>
                	
                    <div class="fwd-container-limit">
                        <form id="o2o-landing-form" action="${pageContext.request.contextPath}/${language}/savings-insurance/provie/${nextPageFlow}"  method="post">                       
                            <div class="img-banner-text savie-landing">
                                <div id="clearfix-height-rp">
                                    <button id="op-buy-now-O2O-mobile" class="savie-regular-btn start-btn"><fmt:message key="provie.landing.cta.start" bundle="${provieMsg}" /></button>
                                </div>
                                <div class="savie-product text-bold"> <a href="/resources/brochure-pdf/savie_brochure_rp.pdf" target="_blank"><fmt:message key="provie.landing.link.productbrochure" bundle="${provieMsg}" /></a> | <a href="/resources/policy-provisions-pdf/Savie_En_Provisions.pdf" target="_blank"><fmt:message key="provie.landing.link.policyprovision" bundle="${provieMsg}" /></a> </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
           
            <div class="pv_productInfo">
            	<div class="container">
            		<div class="row">
            			<div class="col-xs-12">
	            			<div class="pv_desc">
	            				主動出擊，實現儲蓄大計！<fmt:message key="provie.title" bundle="${provieMsg}" /> 真息揀理財壽險計劃於<span class="pv_highlight">首 5 年享有年度保證派息率</span>，確保戶口持續增值；更可零收費隨時提取戶口金額，另設三選一額外保障，靈活儲蓄，就由今天開始！
	            			</div>
            			</div>
            			<div class="col-xs-12 text-center">
            				<a href="#pv_sec_features" class="pv_link">產品特色</a>
            			</div>
            			<div class="col-xs-12">
							<table class="pv_product_table">
								<tr>
									<td class="pv_table_head">保單年度</td>
									<td>1</td>
									<td>2</td>
									<td>3</td>
									<td>4</td>
									<td>5</td>
								</tr>
								<tr>
									<td class="pv_table_head">保証派息率()</td>
									<td>1.5%</td>
									<td>1.5%</td>
									<td>2%</td>
									<td>2%</td>
									<td>3%</td>
								</tr>
								<tr>
									<td class="pv_table_head">保証派息率()</td>
									<td>1.5%</td>
									<td>1.5%</td>
									<td>2%</td>
									<td>2%</td>
									<td>3%</td>
								</tr>
							</table>
            			</div>
            		</div>
            	</div>
            </div>

            <div class="pv_sec_calculator">
            	<div class="container">
            		<div class="row">
            			<div class="col-xs-12">
            				<h2 class="pv_title"><fmt:message key="provie.landing.calculation.title1" bundle="${provieMsg}" /></h2>
			            	<p class="pv_sub_heading"><fmt:message key="provie.landing.calculation.title2" bundle="${provieMsg}" /></p>
							<div class="pv_statement">
								<fmt:message key="provie.landing.calculation.text1" bundle="${provieMsg}" />
								<div class="btn-group">
								  <button data-toggle="dropdown" class="dropdown-toggle"><fmt:message key="provie.landing.calculation.dropdown.sex" bundle="${provieMsg}" /></button>
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
								  <button data-toggle="dropdown" class="dropdown-toggle"><fmt:message key="provie.landing.calculation.dropdown.method" bundle="${provieMsg}" /></button>
								    <ul class="dropdown-menu">
								      <li><input type="radio" id="method1" name="method" value="SP"><label for="method1">每月供款</label></li>
								      <li><input type="radio" id="method2" name="method" value="RP"><label for="method2">一次性供款</label></li>
								    </ul>
								</div> 
								
								<div class="btn-group">
								  <input type="text" name="amount" class="input_amount" placeholder='<fmt:message key="provie.landing.calculation.dropdown.amount" bundle="${provieMsg}" />'>
								</div> 

								<div class="btn-group">
								  <button data-toggle="dropdown" class="dropdown-toggle"><fmt:message key="provie.landing.calculation.dropdown.currency" bundle="${provieMsg}" /></button>
								    <ul class="dropdown-menu">
								      <li><input type="radio" id="currency1" name="currency" value="HKD"><label for="currency1">港元</label></li>
								      <li><input type="radio" id="currency2" name="currency" value="USD"><label for="currency2">美金</label></li>
								    </ul>
								</div> 

								為期
								<div class="btn-group">
								  <button data-toggle="dropdown" class="dropdown-toggle">年期</button>
								    <ul class="dropdown-menu yearList">
								      <li><input type="radio" id="year1" name="year" value="0"><label for="year1">1</label></li>
								      <li><input type="radio" id="year2" name="year" value="1"><label for="year2">3</label></li>
								    </ul>
								</div> 
								<fmt:message key="provie.landing.calculation.text10" bundle="${provieMsg}" />
							</div>
							
							<ul class="error_list"></ul>
							
							<a href="#" class="pv_btn"><fmt:message key="provie.landing.calculation.cta.calculate" bundle="${provieMsg}" /></a>	
            			</div>
            			
            		</div>
            	</div>
            </div>

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
									<span class="pv_hint hint1">移動按鈕以查看各年度的戶口總值</span>
									<span class="pv_hint hint2"><fmt:message key="provie.landing.calculation.year" bundle="${provieMsg}" /></span>
								</div>
    							<div class="scale">
    								<span class="floatNum num1">1</span>
    								<span class="floatNum num2">2</span>
    								<span class="floatNum num3">3</span>
    								<span class="floatNum num4">4</span>
    								<span class="floatNum num5">5</span>
    								<span class="floatNum num6">15</span>
    								<span class="floatNum num7">65</span>
    							</div>
								<div id="slider"></div>
								
								<div class="scale scaleBottom">
    								<span class="floatNum num1"></span>
    								<span class="floatNum num2"></span>
    								<span class="floatNum num3"></span>
    								<span class="floatNum num4"></span>
    								<span class="floatNum num5"></span>
    							</div>

								<div class="yearWarp">
									<span class="year center"><fmt:message key="provie.landing.calculation.interestrate" bundle="${provieMsg}" /></span>
								</div>

    							<div class="money">
									<div class="left"><fmt:message key="provie.landing.calculation.premium" bundle="${provieMsg}" /><br><span class="monthlyFee"></span></div><!--
									--><div class="right"><fmt:message key="provie.landing.calculation.totalpremium" bundle="${provieMsg}" /><br><span class="totalPaid"></span></div>
								</div>

								<div class="accValue">
									<img src="<%=request.getContextPath()%>/resources/images/provie/provie_landing_s2_icon.png" alt='<fmt:message key="provie.landing.calculation.accountvalue" bundle="${provieMsg}" />' class="img-responsive">
									<div class="txt"><fmt:message key="provie.landing.calculation.accountvalue" bundle="${provieMsg}" /><br><span class="amount">$116,388</span></div>
									<div><fmt:message key="provie.landing.calculation.year.acctvalue" bundle="${provieMsg}" /></div>
								</div>

								<div class="extra">
									<h3 class="pv_title_extra">
											<img src="<%=request.getContextPath()%>/resources/images/provie/provie_landing_slider_plus.png" alt="+" class="img-responsive imgPlus"><fmt:message key="provie.landing.calculation.3riders.title" bundle="${provieMsg}" />
									</h3>
									<img src="<%=request.getContextPath()%>/resources/images/provie/provie_landing_slider_line_b.png" alt="line" class="img-responsive center line">
										
									<div class="card card1">
										<h3 class="name"><fmt:message key="provie.landing.calculation.rider1.title" bundle="${provieMsg}" /></h3>
										<img src="<%=request.getContextPath()%>/resources/images/provie/provie_landing_s2_rider_a.png" alt="" class="img-responsive center">
										<p class="price"></p>
									</div>
									<div class="card card2">
										<h3 class="name"><fmt:message key="provie.landing.calculation.rider2.title" bundle="${provieMsg}" /></h3>
										<img src="<%=request.getContextPath()%>/resources/images/provie/provie_landing_s2_rider_b.png" alt="" class="img-responsive center">
										<p class="price"></p>
									</div>
									<div class="card card3">
										<h3 class="name"><fmt:message key="provie.landing.calculation.rider3.title" bundle="${provieMsg}" /></h3>
										<img src="<%=request.getContextPath()%>/resources/images/provie/provie_landing_s2_rider_c.png" alt="" class="img-responsive center">
										<p class="price"></p>
									</div>
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
								<p class="pv_feature_desc hidden-xs"><fmt:message key="provie.landing.features.1.text1" bundle="${provieMsg}" /><span class="pv_remark"><sup>*</sup><fmt:message key="provie.landing.features.1.text2" bundle="${provieMsg}" /></span></p>
							</div>
							
							<div class="col-xs-6 col-lg-4 pv_feature_box text-center">
								<img src="<%=request.getContextPath()%>/resources/images/provie/provie_landing_s3_icon_02.png" alt='<fmt:message key="provie.landing.features.2.title" bundle="${provieMsg}" />' class="img_responsive">
								<h3 class="pv_feature_title"><fmt:message key="provie.landing.features.2.title" bundle="${provieMsg}" /></h3>	
								<p class="pv_feature_desc hidden-xs"><fmt:message key="provie.landing.features.2.text" bundle="${provieMsg}" /></p>
							</div>

							<div class="clearfix hidden-lg"></div>
							
							<div class="col-xs-6 col-lg-4 pv_feature_box text-center">
								<img src="<%=request.getContextPath()%>/resources/images/provie/provie_landing_s3_icon_03.png" alt='<fmt:message key="provie.landing.features.3.title" bundle="${provieMsg}" />' class="img_responsive">
								<h3 class="pv_feature_title"><fmt:message key="provie.landing.features.3.title" bundle="${provieMsg}" /></h3>	
								<p class="pv_feature_desc hidden-xs"><fmt:message key="provie.landing.features.3.text" bundle="${provieMsg}" /><span class="pv_remark"><sup>*</sup><fmt:message key="provie.landing.features.3.remarks" bundle="${provieMsg}" /></span></p>
							</div>

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
								<p class="pv_feature_desc hidden-xs"><fmt:message key="provie.landing.features.6.text" bundle="${provieMsg}" /><span class="pv_remark"><sup>*</sup><fmt:message key="provie.landing.features.6.remarks" bundle="${provieMsg}" /></span></p>
							</div>
						</div>
            		</div>
            	</div>
            </div>

            <div class="pv_sec_extra text-center">
            	<div class="container">
            		<div class="row">
            			<div class="col-xs-12">
            				<h2 class="pv_title"><fmt:message key="provie.landing.riders.title" bundle="${provieMsg}" /><sup>1,2</sup></h2>
			            	<p class="pv_sub_heading">Provie 自選保讓您於三項自選升級保障中任選其一，配合自身需要，靈活配搭。儲蓄之外，更添安心。</p>
			            </div>
						
						<div class="pv_extra_wrap">
							<div class="pv_extra_box">
								<div class="col-xs-12 visible-lg visible-md">

									<div class="col-xs-12 col-md-4 pv_extra_card card1">
	                                    <div class="front">
	                                        <h5 class="text-center pv_title"><fmt:message key="provie.landing.riders.1.title" bundle="${provieMsg}" /></h5>
	                                        <img src="<%=request.getContextPath()%>/resources/images/provie/provie_landing_s2_rider_a.png" class="img-responsive pv_extra_icon" alt='<fmt:message key="provie.landing.riders.1.title" bundle="${provieMsg}" />'>
	                                    </div>
	                                    <div class="back">
	                                        <p class="pv_extra_desc"><fmt:message key="provie.landing.riders.1.text" bundle="${provieMsg}" /></p>
	                                    </div>
	                                </div>

	                                <div class="col-xs-12 col-md-4 pv_extra_card card2">
	                                    <div class="front">
	                                        <h5 class="text-center pv_title"><fmt:message key="provie.landing.riders.2.title" bundle="${provieMsg}" /></h5>
	                                        <img src="<%=request.getContextPath()%>/resources/images/provie/provie_landing_s2_rider_b.png" class="img-responsive pv_extra_icon" alt='<fmt:message key="provie.landing.riders.2.title" bundle="${provieMsg}" />'>
	                                    </div>
	                                    <div class="back">
	                                        <p class="pv_extra_desc"><fmt:message key="provie.landing.riders.2.text" bundle="${provieMsg}" /></p>
	                                    </div>
	                                </div>

	                                <div class="col-xs-12 col-md-4 pv_extra_card card3">
	                                    <div class="front">
	                                        <h5 class="text-center pv_title"><fmt:message key="provie.landing.riders.3.title" bundle="${provieMsg}" /></h5>
	                                        <img src="<%=request.getContextPath()%>/resources/images/provie/provie_landing_s2_rider_c.png" class="img-responsive pv_extra_icon" alt='<fmt:message key="provie.landing.riders.3.title" bundle="${provieMsg}" />'>
	                                    </div>
	                                    <div class="back">
	                                        <p class="pv_extra_desc"><fmt:message key="provie.landing.riders.3.text" bundle="${provieMsg}" /></p>
	                                    </div>
	                                </div>

								</div>

								<div class="col-xs-12 pv_extra_mobile hidden-lg hidden-md nopadding">
									<div class="col-xs-12 pv_extra_point">
										<div class="col-xs-3 nopadding">
											<img src="<%=request.getContextPath()%>/resources/images/provie/provie_landing_s2_rider_a.png" class="img-responsive pv_extra_icon center" alt='<fmt:message key="provie.landing.riders.1.title" bundle="${provieMsg}" />'>
										</div>
										<div class="col-xs-9">
											<h5 class="text-center pv_title text-left"><fmt:message key="provie.landing.riders.1.title" bundle="${provieMsg}" /></h5>
											<p class="pv_extra_desc text-left"><fmt:message key="provie.landing.riders.1.text" bundle="${provieMsg}" /></p>
										</div>
									</div>

									<div class="col-xs-12 pv_extra_point">
										<div class="col-xs-3 nopadding">
											<img src="<%=request.getContextPath()%>/resources/images/provie/provie_landing_s2_rider_b.png" class="img-responsive pv_extra_icon center" alt='<fmt:message key="provie.landing.riders.2.title" bundle="${provieMsg}" />'>
										</div>
										<div class="col-xs-9">
											<h5 class="text-center pv_title text-left"><fmt:message key="provie.landing.riders.2.title" bundle="${provieMsg}" /></h5>
											<p class="pv_extra_desc text-left"><fmt:message key="provie.landing.riders.2.text" bundle="${provieMsg}" /></p>
										</div>
									</div>

									<div class="col-xs-12 pv_extra_point">
										<div class="col-xs-3 nopadding">
											<img src="<%=request.getContextPath()%>/resources/images/provie/provie_landing_s2_rider_c.png" class="img-responsive pv_extra_icon center" alt='<fmt:message key="provie.landing.riders.3.title" bundle="${provieMsg}" />'>
										</div>
										<div class="col-xs-9">
											<h5 class="text-center pv_title text-left"><fmt:message key="provie.landing.riders.3.title" bundle="${provieMsg}" /></h5>
											<p class="pv_extra_desc text-left"><fmt:message key="provie.landing.riders.3.text" bundle="${provieMsg}" /></p>
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
								為未來做足準備<br>今天開始精明儲蓄，建立無憂精彩人生
							</h2>

							<a href="#" class="pv_btn">開始儲蓄</a>		
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
										<fmt:message key="provie.landing.table.interestrate.provie3" bundle="${provieMsg}" /><br>
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
									<td colspan="2"></td>
									<td class="sep"><span class="inner"><fmt:message key="provie.landing.table.monthly.provie" bundle="${provieMsg}" /></span></td>
									<td class="sep hideborderLeft"><span class="inner"><fmt:message key="provie.landing.table.oneoff.provie" bundle="${provieMsg}" /></span></td>
									<td class="sep"><span class="inner"><fmt:message key="provie.landing.table.monthly.provie" bundle="${provieMsg}" /></span></td>
									<td class="sep hideborderLeft"><span class="inner"><fmt:message key="provie.landing.table.oneoff.provie" bundle="${provieMsg}" /></span></td>
								</tr>
								<tr>
									<td colspan="2">最高供款金額</td>
									<td class="highlight"><span class="inner">20,000港元/<br>2,500美元</span></td>
									<td class="hideborderLeft highlight"><span class="inner">1,000,000港元/<br>125,000美元</span></td>
									<td><span class="inner">20,000港元</span></td>
									<td class="hideborderLeft"><span class="inner">400,000港元 </span></td>
								</tr>
								<tr>
									<td colspan="2">最低供款金額</td>
									<td class="highlight"><span class="inner">1,000港元/<br>125美元</span></td>
									<td class="hideborderLeft highlight"><span class="inner">30,000港元/<br> 3,750美元</span></td>
									<td><span class="inner">1,000港元</span></td>
									<td class="hideborderLeft"><span class="inner">30,000港元 </span></td>
								</tr>
								<tr>
									<td colspan="2">最低戶口價值*</td>
									<td colspan="2" class="highlight"><span class="inner">3,000港元/375美元</span></td>
									<td colspan="2"><span class="inner">3,000港元/375美元</span></td>
								</tr>
								<tr>
									<td colspan="6"><span class="inner"><sup>*</sup>戶口價值是所有已繳保費及利息的累積金額，減去部份提款（如有）。</span></td>
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
										<div class="item active inner">
											<div>
												<table>
													<tr>
														<th colspan="4"><span class="inner">Provie 真息揀</span></th>
													</tr>
													<tr>
														<td colspan="2"><span class="inner">投保年齡<br>(下次生日年齡)</span></td>
														<td colspan="2" class="highlight"><span class="inner">19 至 60 歲</span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner">保單年期</span></td>
														<td colspan="2" class="highlight"><span class="inner">至100歲</span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner">保單貨幣</span></td>
														<td colspan="2" class="highlight"><span class="inner">港元 / 美元</span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner">保證派息率</span></td>
														<td colspan="2" class="highlight"><span class="inner"><span class="pv_sub_heading">以港元計算保單：</span><br>
															1.5% （首個及第二個保單年度）<br>2% （第三及第四個保單年度）<br>
															3% （第五個保單年度）<br>
															<span class="pv_sub_heading">以美元計算保單：</span><br>
															2% (首四個保單年度)<br>3%(第五個保單年度)</span>
														</td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner">身故權益</span></td>
														<td colspan="2" class="highlight"><span class="inner">戶口價值<sup>3</sup>之105%</span></td>
													</tr>
													<tr>
														<td colspan="2"></td>
														<td colspan="2" class="sep highlight"><span class="inner">三選一</span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner">額外保障</span></td>
														<td colspan="2" class="highlight">
															<span class="inner">
																<span class="sub_title">
																	意外身故保障 
																</span>
																戶口價值*之500% 保障直至65歲
																<span class="remark">（每名受保人可得意外身故權益上限為<br>12,000,000港元/1,500,000美元）</span>
																<span class="sub_title">
																	人壽保障 
																</span>
																戶口價值*之100% 保障直至65歲
																<span class="remark">（每名被保人可得人壽保障權益上限為<br>4,000,000港元/500,000美元）</span>
																<span class="sub_title">
																	癌症保障 
																</span>
																戶口價值*之50% 保障直至65歲
																<span class="remark">（每名受保人可得癌症保障權益上限為<br>2,000,000港元/250,000美元）</span>
															</span>
														</td>
													</tr>
													<tr>
														<td colspan="2"></td>
														<td class="sep"><span class="inner">月繳計劃</span></td>
														<td class="sep hideborderLeft"><span class="inner">一筆過計劃</span></td>
													</tr>
													<tr>
														<td colspan="2">最高供款金額</td>
														<td class="highlight"><span class="inner">20,000港元/<br>2,500美元</span></td>
														<td class="hideborderLeft highlight"><span class="inner">1,000,000港元/<br>125,000美元</span></td>
													</tr>
													<tr>
														<td colspan="2">最低供款金額</td>
														<td class="highlight"><span class="inner">1,000港元/<br>125美元</span></td>
														<td class="hideborderLeft highlight"><span class="inner">30,000港元/<br> 3,750美元</span></td>
													</tr>
													<tr>
														<td colspan="2">最低戶口價值*</td>
														<td colspan="2" class="highlight"><span class="inner">3,000港元/375美元</span></td>
													</tr>
													<tr>
														<td colspan="6"><span class="inner"><sup>*</sup>戶口價值是所有已繳保費及利息的累積金額，減去部份提款（如有）。</span></td>
													</tr>
												</table>
											</div>
										</div>
										<div class="item inner">
											<div>
												<table>
													<tr>
														<th colspan="4"><span class="inner">Savie 自助息</span></th>
													</tr>
													<tr>
														<td colspan="2"><span class="inner">投保年齡<br>(下次生日年齡)</span></td>
														<td colspan="2"><span class="inner">19至70歲</span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner">保單年期</span></td>
														<td colspan="2"><span class="inner">至100歲</span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner">保單貨幣</span></td>
														<td colspan="2"><span class="inner">港元</span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner">保證派息率</span></td>
														<td colspan="2"><span class="inner">2% (首三保單年度)</span></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner">身故權益</span></td>
														<td colspan="2"><span class="inner">戶口價值<sup>3</sup>之105%</span></td>
													</tr>
													<tr>
														<td colspan="2"></td>
														<td colspan="2"></td>
													</tr>
													<tr>
														<td colspan="2"><span class="inner">額外保障</span></td>
														<td colspan="2">
															<span class="inner">
																<span class="sub_title">
																	意外身故保障 
																</span>
																戶口價值*之500% 保障直至65歲
																<span class="remark">（每名受保人可得意外身故權益上限為<br>12,000,000港元/1,500,000美元）</span>
															</span>
														</td>
													</tr>
													<tr>
														<td colspan="2"></td>
														<td class="sep"><span class="inner">月繳計劃</span></td>
														<td class="sep hideborderLeft"><span class="inner">一筆過計劃</span></td>
													</tr>
													<tr>
														<td colspan="2">最高供款金額</td>
														<td><span class="inner">20,000港元</span></td>
														<td class="hideborderLeft"><span class="inner">400,000港元 </span></td>
													</tr>
													<tr>
														<td colspan="2">最低供款金額</td>
														<td><span class="inner">1,000港元</span></td>
														<td class="hideborderLeft"><span class="inner">30,000港元 </span></td>
													</tr>
													<tr>
														<td colspan="2">最低戶口價值*</td>
														<td colspan="2"><span class="inner">3,000港元/375美元</span></td>
													</tr>
													<tr>
														<td colspan="6"><span class="inner"><sup>*</sup>戶口價值是所有已繳保費及利息的累積金額，減去部份提款（如有）。</span></td>
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

			<div class="pv_fna">
				<div class="container">
					<div class="row">
						<div class="col-xs-12">
							<h2 class="pv_title"><fmt:message key="provie.landing.fna.title" bundle="${provieMsg}" /></h2>
            				<p class="pv_desc"><fmt:message key="provie.landing.fna.text1" bundle="${provieMsg}" /></p>	
						</div>
						<div class="col-xs-12">
							<div class="col-md-4 col-md-offset-2 pv_fna_input">
								<input type="text" class="form-control" id="fnaUser" placeholder='<fmt:message key="provie.landing.fna.username" bundle="${provieMsg}" />'>
								<div class="col-xs-12 text-right link"><a href="javascript:void(0);" class="btnForgotUser">忘記用戶名稱?</a></div>
							</div>
							<div class="col-md-4 pv_fna_input">
								<input type="password" class="form-control" id="fnaPwd" placeholder='<fmt:message key="provie.landing.fna.pw" bundle="${provieMsg}" />'>
								<div class="col-xs-12 text-right link"><a href="javascript:void(0);" class="btnForgotPwd"><fmt:message key="provie.landing.fna.forgetpw" bundle="${provieMsg}" /></a></div>
							</div>
						</div>
						<div class="col-xs-12">
							<p class="pv_desc">
								<fmt:message key="provie.landing.fna.disclaimer" bundle="${provieMsg}" />
							</p>
						</div>
						<div class="col-xs-12 pv_fna_reg">
							<p class="pv_desc"><b><fmt:message key="provie.landing.fna.newmb" bundle="${provieMsg}" /></b><a href="#" class="link"><fmt:message key="provie.landing.fna.register" bundle="${provieMsg}" /></a></p>
						</div>

						<a href="#" class="pv_btn btnStart"><fmt:message key="provie.landing.fna.cta.start" bundle="${provieMsg}" /></a>
					</div>
				</div>
			</div>

			<div class="blog">
		        <div class="hidden-md hidden-lg">
		            <div class="mini-banner-holder"><img src="http://i.fwd.com.hk/resources/images/easy-home/blog/homecare-blog1.jpg" class="img-responsive">
		                <div class="black-overlay"></div>
		                <h5 class="text-center">不如看看我們的佈置家居貼士?</h5> </div>
		            <div class="btn-holder">
		                <button id="btn-blog-link" class="savie-regular-btn">閱讀更多</button>
		            </div>
		        </div>
		        <div class="hidden-xs hidden-sm">
		            <h3 class="text-center">閱讀更多</h3>
		            <div class="gray-divide"></div>
		            <p class="definition text-center">不如看看我們的佈置家居貼士?</p>
		            <div class="blogs-holder clearfix fwd-container-limit">
		                <div class="blogs first"> <img src="http://i.fwd.com.hk/resources/images/easy-home/blog/homecare-blog1.jpg" class="img-responsive">
		                    <div class="orange-overlay text-center">
		                        <p class="title">改造涼快家居迎夏日</p>
		                        <p class="definition"></p> <a class="btn-read-now" href="http://blog.fwd.com.hk/zh/2016/06/23/welcome-summer/" target="_blank">閱讀更多</a> </div>
		                </div>
		                <div class="blogs"> <img src="http://i.fwd.com.hk/resources/images/easy-home/blog/homecare-blog2.jpg" class="img-responsive">
		                    <div class="orange-overlay text-center">
		                        <p class="title">5個選購傢俬小貼士</p>
		                        <p class="definition"></p> <a class="btn-read-now" href="http://blog.fwd.com.hk/zh/2015/12/22/essential-decorate-home-boconcept/" target="_blank">閱讀更多</a> </div>
		                </div>
		                <div class="blogs"> <img src="http://i.fwd.com.hk/resources/images/easy-home/blog/homecare-blog3.png" class="img-responsive">
		                    <div class="orange-overlay text-center">
		                        <p class="title">重塑70 年代前衛家居</p>
		                        <p class="definition"></p> <a class="btn-read-now" href="http://blog.fwd.com.hk/zh/2015/12/04/classic-70s-decor/" target="_blank">閱讀更多</a> </div>
		                </div>
		                <div class="blogs last"> <img src="http://i.fwd.com.hk/resources/images/easy-home/blog/homecare-blog4.jpg" class="img-responsive">
		                    <div class="orange-overlay text-center">
		                        <p class="title">型格擺設DIY</p>
		                        <p class="definition"></p> <a class="btn-read-now" href="http://blog.fwd.com.hk/zh/2015/08/25/stylish-diy-decor/" target="_blank">閱讀更多</a> </div>
		                </div>
		            </div>
		            <div class="fwd-container-limit">
		                <p class="blog-notice">博客資料謹供參考，富衛人壽保險(百慕達)有限公司及其聯繫公司 (「富衛」)雖然已盡力確保所載的資料正確無誤，但富衛並不就資料的準確性或完整性作出任何保證或陳述。富衛將不會因無法或不能使用任何資料或任何此博客所載之資料的錯誤或遺漏而負上任何直接、附帶、後果性、間接或懲罰性的損失的責任，使用者應自行小心評估資料。</p>
		            </div>
		        </div>
    		</div>

    		<div class="pv_share">
    			<div class="container">
    				<div class="row">
    					<div class="col-xs-12">
    						<h2 class="pv_title">財務需要分析</h2>
    						<p class="pv_desc">您的朋友的第一份富衛保單可享 5% 折扣優惠，同您亦可獲得減 $200 的保費折扣。</p>	
    					</div>
    					<div class="col-xs-12 text-center">
							<a href="#"><img src="<%=request.getContextPath()%>/resources/images/provie/provie_landing_s8_fb.png" alt="Facebook"></a>
							<a href="#"><img src="<%=request.getContextPath()%>/resources/images/provie/provie_landing_s8_twitter.png" alt="Twitter"></a>
							<a href="#"><img src="<%=request.getContextPath()%>/resources/images/provie/provie_landing_s8_mail.png" alt="Mail"></a>
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

<script src="http://refreshless.com/noUiSlider/distribute/nouislider.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/provie/provie-landing-uifn.js"></script>
