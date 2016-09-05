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
<%
	boolean isSaleActiveClass = false;
	boolean isEservicesActiveClass = false;
%>


<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/savie-regular-styles.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/provie/provie-styles.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/provie/dropdowns-enhancement.css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/provie/provie-landing-style.css">



<link rel="stylesheet" type="text/css" href="http://refreshless.com/noUiSlider/distribute/nouislider.min.css">
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
                	<img src="<%=request.getContextPath()%>/resources/images/provie/landing-bg-mobile.jpg" class="img-responsive hidden-sm hidden-md hidden-lg"> <img src="<%=request.getContextPath()%>/resources/images/provie/landing-bg-desktop.jpg" class="img-responsive hidden-xs">
                	<div class="pv_overlay_text_wrap">
            			<h2 class="pv_title">隨時拎 , 零收費 , 升級保障</h2>
            			<p class="pv_desc">讓 您 自 主 升 級 理 財 大 計</p>	
                	</div>
                	
                    <div class="fwd-container-limit">
                        <form id="o2o-landing-form" action="${pageContext.request.contextPath}/${language}/savings-insurance/provie/${nextPageFlow}"  method="post">                       
                            <div class="img-banner-text savie-landing">
                                <div id="clearfix-height-rp">
                                    <button id="op-buy-now-O2O-mobile" class="savie-regular-btn start-btn">Apply Now</button>
                                </div>
                                <div class="savie-product text-bold"> <a href="/resources/brochure-pdf/savie_brochure_rp.pdf" target="_blank">Product brochure</a> | <a href="/resources/policy-provisions-pdf/Savie_En_Provisions.pdf" target="_blank">Product provisions</a> </div>
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
									<td class="pv_table_head">保証派息率</td>
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
            				<h2 class="pv_title">您好，我們知道您想展開儲蓄大計！</h2>
			            	<p class="pv_sub_heading">請告訴我們您的想法及希望如何達成目標。</p>
							<div class="pv_statement">
								我是
								<div class="btn-group">
								  <button data-toggle="dropdown" class="dropdown-toggle">性別</button>
								    <ul class="dropdown-menu">
								      <li><input type="radio" id="genderM" name="gender" value="0"><label for="genderM">男性</label></li>
								      <li><input type="radio" id="genderF" name="gender" value="1"><label for="genderF">女性</label></li>
								    </ul>
								</div>
								，現時
								<div class="btn-group">
								  <button data-toggle="dropdown" class="dropdown-toggle">年齡</button>
								    <ul class="dropdown-menu">
								      <li><input type="radio" id="age26" name="age" value="0"><label for="age26">26</label></li>
								      <li><input type="radio" id="age30" name="age" value="1"><label for="age30">30</label></li>
								    </ul>
								</div>
								歲，
								
								正打算以
								<div class="btn-group">
								  <button data-toggle="dropdown" class="dropdown-toggle">供款方式</button>
								    <ul class="dropdown-menu">
								      <li><input type="radio" id="type1" name="type" value="0"><label for="type1">每月供款</label></li>
								      <li><input type="radio" id="type2" name="type" value="1"><label for="type2">一次性供款</label></li>
								    </ul>
								</div> 
								
								<div class="btn-group">
								  <button data-toggle="dropdown" class="dropdown-toggle">金額</button>
								    <ul class="dropdown-menu">
								      <li><input type="radio" id="amount1" name="amount" value="0"><label for="amount1">1500</label></li>
								      <li><input type="radio" id="amount2" name="amount" value="1"><label for="amount2">3000</label></li>
								    </ul>
								</div> 

								<div class="btn-group">
								  <button data-toggle="dropdown" class="dropdown-toggle">貨幣</button>
								    <ul class="dropdown-menu">
								      <li><input type="radio" id="currency1" name="currency" value="0"><label for="currency1">港元</label></li>
								      <li><input type="radio" id="currency" name="currency" value="1"><label for="currency2">美金</label></li>
								    </ul>
								</div> 

								為期
								<div class="btn-group">
								  <button data-toggle="dropdown" class="dropdown-toggle">年期</button>
								    <ul class="dropdown-menu">
								      <li><input type="radio" id="period1" name="currency" value="0"><label for="period1">1年</label></li>
								      <li><input type="radio" id="period2" name="currency" value="1"><label for="period2">3年</label></li>
								    </ul>
								</div> 
								年，為未來做好準備！
							</div>
							
							<a href="#" class="pv_btn">計算</a>	
            			</div>
            			
            		</div>
            	</div>
            </div>

			<div class="pv_plan">
				<div class="container">
					<div class="row">
						<div class="col-xs-12">
							<h2 class="pv_title">您的Provie真息揀計劃</h2>
        					<p class="pv_sub_heading">於首 5個保單年度，可享有年度保證派息率，讓您的儲蓄金額延續生息，輕鬆增值。</p>		
						</div>
						<div class="col-xs-12">
							<div class="pv_plan_wrap">
								<div class="col-xs-12 visible-md visible-lg">
									<span class="pv_hint hint1">移動按鈕以查看各年度的戶口總值</span>
									<span class="pv_hint hint2">保單年期</span>
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
    								<span class="floatNum num1">1.5%</span>
    								<span class="floatNum num2">1.5%</span>
    								<span class="floatNum num3">2%</span>
    								<span class="floatNum num4">2%</span>
    								<span class="floatNum num5">3%</span>
    							</div>

								<div class="yearWarp">
									<span class="year center">保證派息年度</span>
								</div>

    							<div class="money">
									<div class="left">每月供款<br>$3,600</div><!--
									--><div class="right">已繳保費總額<br>$108,000</div>
								</div>

								<div class="accValue">
									<img src="<%=request.getContextPath()%>/resources/images/provie/provie_landing_s2_icon.png" alt="戶口價值" class="img-responsive">
									<div class="txt">戶口價值<br><span class="amount">$116,388</span></div>
									<div>更提供相等於105%戶口價值的身故權益</div>
								</div>

								<div class="extra">
									<h3 class="pv_title_extra">
											<img src="<%=request.getContextPath()%>/resources/images/provie/provie_landing_slider_plus.png" alt="+" class="img-responsive imgPlus">三選一免費額外保障
									</h3>
									<img src="<%=request.getContextPath()%>/resources/images/provie/provie_landing_slider_line_b.png" alt="line" class="img-responsive center line">
										
									<div class="card card1">
										<h3 class="name">100%人壽保障</h3>
										<img src="<%=request.getContextPath()%>/resources/images/provie/provie_landing_s2_rider_a.png" alt="" class="img-responsive center">
										<p class="price">$116,388</p>
									</div>
									<div class="card card2">
										<h3 class="name">100%人壽保障</h3>
										<img src="<%=request.getContextPath()%>/resources/images/provie/provie_landing_s2_rider_b.png" alt="" class="img-responsive center">
										<p class="price">$116,388</p>
									</div>
									<div class="card card3">
										<h3 class="name">100%人壽保障</h3>
										<img src="<%=request.getContextPath()%>/resources/images/provie/provie_landing_s2_rider_c.png" alt="" class="img-responsive center">
										<p class="price">$116,388</p>
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
            				<h2 class="pv_title">儲錢無難度	隨時隨心隨你揀</h2>
            			</div>
						<div class="pv_feature_wrap">
			
							<div class="col-xs-6 col-lg-4 pv_feature_box text-center">
								<img src="<%=request.getContextPath()%>/resources/images/provie/provie_landing_s3_icon_01.png" alt="5年保證派息" class="img_responsive">
								<h3 class="pv_feature_title">5年保證派息</h3>	
								<p class="pv_feature_desc hidden-xs">於首5個保單年度內，可享有年度保證派息率*，讓您的儲蓄日日生息，持續增值。<span class="pv_remark"><sup>*</sup>於首5個保單年度後，您可選擇繼續維持保單並賺取富衛決定之派息率。</span></p>
							</div>
							
							<div class="col-xs-6 col-lg-4 pv_feature_box text-center">
								<img src="<%=request.getContextPath()%>/resources/images/provie/provie_landing_s3_icon_02.png" alt="三選一免費額外保障" class="img_responsive">
								<h3 class="pv_feature_title">三選一免費額外保障</h3>	
								<p class="pv_feature_desc hidden-xs">讓您於三項自選升級保障中任選其一，配合自身需要，靈活配搭。儲蓄之外，更添安心。</p>
							</div>

							<div class="clearfix hidden-lg"></div>
							
							<div class="col-xs-6 col-lg-4 pv_feature_box text-center">
								<img src="<%=request.getContextPath()%>/resources/images/provie/provie_landing_s3_icon_03.png" alt="隨時供、隨時停、$0 收費" class="img_responsive">
								<h3 class="pv_feature_title">隨時供、隨時停、$0 收費</h3>	
								<p class="pv_feature_desc hidden-xs">您可於保單期內隨時暫時或恢復繳交月繳保費，讓您靈活調動資金。您也可於任何時間（包括保證派息率年度期內）從保單提取您的戶口價值而無須繳付任何費用*，絕無任何收費。<span class="pv_remark"><sup>*</sup>提款須受制於富衛規定之最低戶口結餘。</span></p>
							</div>

							<div class="col-xs-6 col-lg-4 pv_feature_box text-center">
								<img src="<%=request.getContextPath()%>/resources/images/provie/provie_landing_s3_icon_04.png" alt="美元港元同時支援" class="img_responsive">
								<h3 class="pv_feature_title">美元港元同時支援</h3>	
								<p class="pv_feature_desc hidden-xs">您可自由選擇以美元或港元繳付供款，靈活兼具彈性。</p>
							</div>
							
							<div class="clearfix hidden-lg"></div>
							
							<div class="col-xs-6 col-lg-4 pv_feature_box text-center">
								<img src="<%=request.getContextPath()%>/resources/images/provie/provie_landing_s3_icon_05.png" alt="供款‧由您話事" class="img_responsive">
								<h3 class="pv_feature_title">供款‧由您話事</h3>	
								<p class="pv_feature_desc hidden-xs">Provie真息揀就您的儲蓄習慣設有一筆過及月繳保費計劃以供選擇。我們接受支票、銀行直接付款或交通銀行的FWD信用卡付款方法。</p>
							</div>

							<div class="col-xs-6 col-lg-4 pv_feature_box text-center">
								<img src="<%=request.getContextPath()%>/resources/images/provie/provie_landing_s3_icon_06.png" alt="身故權益" class="img_responsive">
								<h3 class="pv_feature_title">身故權益</h3>	
								<p class="pv_feature_desc hidden-xs">如受保人不幸辭世，本計劃提供投保金額 105%*作為身故權益，保障直至100歲。<span class="pv_remark"><sup>*</sup>*所有已繳保費及利息的累積金額，減去部份提款（如有）。</span></p>
							</div>
						</div>
            		</div>
            	</div>
            </div>

            <div class="pv_sec_extra text-center">
            	<div class="container">
            		<div class="row">
            			<div class="col-xs-12">
            				<h2 class="pv_title">三選一免費額外保障<sup>1,2</sup></h2>
			            	<p class="pv_sub_heading">Provie 自選保讓您於三項自選升級保障中任選其一，配合自身需要，靈活配搭。儲蓄之外，更添安心。</p>
			            </div>
						
						<div class="pv_extra_wrap">
							<div class="pv_extra_box">
								<div class="col-xs-12 visible-lg visible-md">

									<div class="col-xs-12 col-md-4 pv_extra_card card1">
	                                    <div class="front">
	                                        <h5 class="text-center pv_title">額外100%人壽保障</h5>
	                                        <img src="<%=request.getContextPath()%>/resources/images/provie/provie_landing_s2_rider_a.png" class="img-responsive pv_extra_icon" alt="額外100%人壽保障">
	                                    </div>
	                                    <div class="back">
	                                        <p class="pv_extra_desc">若受保人不幸身故，可額外獲賠償戶口價值3之100%作為額外人壽保障， 為其家人提供財政保障或其生意提供援手，協助周轉。</p>
	                                    </div>
	                                </div>

	                                <div class="col-xs-12 col-md-4 pv_extra_card card2">
	                                    <div class="front">
	                                        <h5 class="text-center pv_title">500%意外身故保障</h5>
	                                        <img src="<%=request.getContextPath()%>/resources/images/provie/provie_landing_s2_rider_b.png" class="img-responsive pv_extra_icon" alt="500%意外身故保障">
	                                    </div>
	                                    <div class="back">
	                                        <p class="pv_extra_desc">若受保人不幸意外身故，可額外獲賠償戶口價值3之500%，即使天有不測，您及摯愛可得到經濟支援，以解燃眉之急。 </p>
	                                    </div>
	                                </div>

	                                <div class="col-xs-12 col-md-4 pv_extra_card card3">
	                                    <div class="front">
	                                        <h5 class="text-center pv_title">50% 癌症保障</h5>
	                                        <img src="<%=request.getContextPath()%>/resources/images/provie/provie_landing_s2_rider_c.png" class="img-responsive pv_extra_icon" alt="50% 癌症保障">
	                                    </div>
	                                    <div class="back">
	                                        <p class="pv_extra_desc">萬一受保人確診首次患上癌症，可獲賠償戶口價值3之50%，助您儘早進行治療，面對癌症也可以迎難而上。</p>
	                                    </div>
	                                </div>

								</div>

								<div class="col-xs-12 pv_extra_mobile hidden-lg hidden-md nopadding">
									<div class="col-xs-12 pv_extra_point">
										<div class="col-xs-3 nopadding">
											<img src="<%=request.getContextPath()%>/resources/images/provie/provie_landing_s2_rider_a.png" class="img-responsive pv_extra_icon center" alt="額外100%人壽保障">
										</div>
										<div class="col-xs-9">
											<h5 class="text-center pv_title text-left">額外100%人壽保障</h5>
											<p class="pv_extra_desc text-left">若受保人不幸身故，可額外獲賠償戶口價值3之100%作為額外人壽保障， 為其家人提供財政保障或其生意提供援手，協助周轉。</p>
										</div>
									</div>

									<div class="col-xs-12 pv_extra_point">
										<div class="col-xs-3 nopadding">
											<img src="<%=request.getContextPath()%>/resources/images/provie/provie_landing_s2_rider_b.png" class="img-responsive pv_extra_icon center" alt="500%意外身故保障">
										</div>
										<div class="col-xs-9">
											<h5 class="text-center pv_title text-left">500%意外身故保障</h5>
											<p class="pv_extra_desc text-left">若受保人不幸意外身故，可額外獲賠償戶口價值3之500%，即使天有不測，您及摯愛可得到經濟支援，以解燃眉之急。</p>
										</div>
									</div>

									<div class="col-xs-12 pv_extra_point">
										<div class="col-xs-3 nopadding">
											<img src="<%=request.getContextPath()%>/resources/images/provie/provie_landing_s2_rider_c.png" class="img-responsive pv_extra_icon center" alt="50% 癌症保障">
										</div>
										<div class="col-xs-9">
											<h5 class="text-center pv_title text-left">50% 癌症保障</h5>
											<p class="pv_extra_desc text-left">萬一受保人確診首次患上癌症，可獲賠償戶口價值3之50%，助您儘早進行治療，面對癌症也可以迎難而上。</p>
										</div>
									</div>
								</div>
								
							</div>
							<div class="col-xs-12 pv_extra_remark">
								<ul>
									<li class="pv_remark"><sup>1</sup>免費保障的保障年期為被保人的六十六歲生日之前的保單週年日。</li>
									<li class="pv_remark"><sup>2</sup>在申請本產品時，保單權益人必須選擇其中一個額外保障。在保單生效期間，保單權益人不得更改保障附約。如富衛不接納/拒絕所選擇的保障附約，保單權益人只可投保基本計劃而沒有任何保障附約。</li>
									<li class="pv_remark"><sup>3</sup>戶口價值指已繳保費，加上派息（如有），減去部份退保（如有）和所有附約下之保費（如有）。</li>
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
									<th colspan="2"><span class="inner highlight">Provie 真息揀</span></th>
									<th colspan="2"><span class="inner">Savie 自助息</span></th>
								</tr>
								<tr>
									<td colspan="2"><span class="inner">投保年齡<br>(下次生日年齡)</span></td>
									<td colspan="2" class="highlight"><span class="inner">19 至 60 歲</span></td>
									<td colspan="2"><span class="inner">19至70歲</span></td>
								</tr>
								<tr>
									<td colspan="2"><span class="inner">保單年期</span></td>
									<td colspan="2" class="highlight"><span class="inner">至100歲</span></td>
									<td colspan="2"><span class="inner">至100歲</span></td>
								</tr>
								<tr>
									<td colspan="2"><span class="inner">保單貨幣</span></td>
									<td colspan="2" class="highlight"><span class="inner">港元 / 美元</span></td>
									<td colspan="2"><span class="inner">港元</span></td>
								</tr>
								<tr>
									<td colspan="2"><span class="inner">保證派息率</span></td>
									<td colspan="2" class="highlight"><span class="inner"><span class="pv_sub_heading">以港元計算保單：</span><br>
										1.5% （首個及第二個保單年度）<br>2% （第三及第四個保單年度）<br>
										3% （第五個保單年度）<br>
										<span class="pv_sub_heading">以美元計算保單：</span><br>
										2% (首四個保單年度)<br>3%(第五個保單年度)</span>
									</td>
									<td colspan="2"><span class="inner">2% (首三保單年度)</span></td>
								</tr>
								<tr>
									<td colspan="2"><span class="inner">身故權益</span></td>
									<td colspan="2" class="highlight"><span class="inner">戶口價值<sup>3</sup>之105%</span></td>
									<td colspan="2"><span class="inner">戶口價值<sup>3</sup>之105%</span></td>
								</tr>
								<tr>
									<td colspan="2"></td>
									<td colspan="2" class="sep highlight"><span class="inner">三選一</span></td>
									<td colspan="2"></td>
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
									<td class="sep"><span class="inner">月繳計劃</span></td>
									<td class="sep hideborderLeft"><span class="inner">一筆過計劃</span></td>
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
							<h2 class="pv_title">財務需要分析</h2>
            				<p class="pv_desc">開始儲蓄前，不如以互動的形式進行財務需要分析，以確保Provie真息揀符合您的需要。</p>	
						</div>
						<div class="col-xs-12">
							<div class="col-md-4 col-md-offset-2 pv_fna_input">
								<input type="text" class="form-control" id="fnaUser" placeholder="用戶名稱">
								<div class="col-xs-12 text-right link"><a href="javascript:void(0);" class="btnForgotUser">忘記用戶名稱?</a></div>
							</div>
							<div class="col-md-4 pv_fna_input">
								<input type="password" class="form-control" id="fnaPwd" placeholder="個人密碼">
								<div class="col-xs-12 text-right link"><a href="javascript:void(0);" class="btnForgotPwd">忘記密碼?</a></div>
							</div>
						</div>
						<div class="col-xs-12">
							<p class="pv_desc">
								我在此同意通過本網站購買指定保險計劃（以下簡稱「計劃」），並將我的個人資料從富衛電子服務轉移到計劃的承保公司。<br>
								Provie 自助息理財壽險計劃不支援網上申請，顧客須親臨客戶服務中心，完成財務分析（FNA）後方可購買。
							</p>
						</div>
						<div class="col-xs-12 pv_fna_reg">
							<p class="pv_desc"><b>新會員？ </b><a href="#" class="link">請註冊</a></p>
						</div>

						<a href="#" class="pv_btn btnStart">開始</a>
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

<script src="<%=request.getContextPath()%>/resources/js/provie/dropdowns-enhancement.js"></script>


