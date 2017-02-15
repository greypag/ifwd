<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeQuoteBean"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="enhance" uri="http://pukkaone.github.com/jsp" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
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
    "lowPrice":"364",
    "highPrice":"3398",
    "priceCurrency":"HKD"
  }
}
</script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/savie-regular-styles.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/easy-health/landing.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/medicalguardian/medicalguardian-landing-style.css">


    <div class="fwd-savie-wrapper ">
        <div class="fwd-container container-fluid breadcrumbs savie-regular-pay-breadcrumbs">
                <div class="breadcrumb-container">
                    <ol class="breadcrumb breadcrumbs-product-details et-breadcrumbs">
                      <li><a href="#"><fmt:message key="breadcrumb.home" bundle="${msg}" /></a></li>
                      <li class="divider"><i class="fa fa-angle-right"></i></li>
                      <li><a href="#"><fmt:message key="breadcrumb.item.protect" bundle="${msg}" /> </a></li>
                      <li class="divider"><i class="fa fa-angle-right"></i></li>
                      <li class="active-bc" id="et-active-bc-menu"><fmt:message key="breadcrumb.item.cansurance" bundle="${msg}" /></li>
                     </ol>
                </div>
            </div>
    </div>
    <div class="container">
	    <div class="col-xs-12">
	    	Temp Form<br>
	    	Date of Birth:<input type="text" name="dob" id="temp_dob" value="1980-01-30"><br>
	    	Gender:<input type="text" name="gender" id="temp_gender" value="0"> (0 = male, 1 = female)<br>
	    	Smoker:<input type="text" name="smoker" id="temp_smoker" value="0"> (0 = non smoker, 1 = smoker)<br>
	    	referral Code:<input type="text" name="referralCode" id="temp_referralCode" value=""><br>
	    	
	    	<input type="button" value="Apply Now" id="btn-applyNow">
	    	
	    	<div class="resultPan hide">
	    	<br><br><br>
	    		<p class="result_txt"></p>
	    		<form action="<%=request.getContextPath()%>/${language}/${nextPageFlow}" method="post">
	    			<input type="hidden" name="dob" value="1980-01-30" class="flow_dob">
	    			<input type="hidden" name="gender" value="0" class="flow_gender">
	    			<input type="hidden" name="smoker" value="0" class="flow_smoker">
	    			<input type="hidden" name="referralCode" value="" class="flow_referralCode">
	    			<input type="submit" value="Get Quote">
	    		</form>
	    		<br><br><br>
	    	</div>
    	</div>
    </div>
    <div class="savie-regular-container savie-regular-landing rp-only">
        <div class="whole-banner">
            <div class="page-banner">
                <img src="<%=request.getContextPath()%>/resources/images/easy-health/landing-bg-mobile_${language}.jpg" class="img-responsive hidden-md hidden-lg" alt="<fmt:message key="jumbo.easyhealth" bundle="${msg}" />">
                <img src="<%=request.getContextPath()%>/resources/images/easy-health/landing-bg-desktop_${language}.jpg" class="img-responsive hidden-xs hidden-sm" alt="<fmt:message key="jumbo.easyhealth" bundle="${msg}" />">
                <div class="fwd-container-limit">

                <form id="o2o-landing-form" action="<%=request.getContextPath()%>/${language}/${nextPageFlow}" method="post">
                    <div class="img-banner-text savie-landing">
                        <div id="clearfix-height-rp">
                            <button id="op-buy-now-O2O-mobile" class="savie-regular-btn start-btn"><fmt:message key="button.quote.easyhealth" bundle="${msg}" /></button>
                        </div>
                    <div class="savie-product text-bold">
                        <a href="<%=request.getContextPath()%>/<fmt:message key="link.brochure.easyhealth" bundle="${msg}" />" target="_blank"><fmt:message key="label.brochure" bundle="${msg}" /></a> | <a href="<%=request.getContextPath()%>/<fmt:message key="link.provisions.easyhealth" bundle="${msg}" />" target="_blank"><fmt:message key="label.provisions" bundle="${msg}" /></a>
                    </div>
                    </div>
                </form>
                </div>
            </div>
        </div>

        <%-- <div class="payment-mode">

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
            </div> --%>
			<div id="pv_CCPPSB">
				<div class="container">
					<div class="row">
						<div class="col-xs-12">
							<h2 class="pv_title text-center">CANsurance Cancer Protection Plan Schedule of Benefit (HK$)</h2>
						</div>
						<div class="wh_p_btns-gp text-center">
		            		<a id="dlProductFacesheet" class="dlProductBrochure" href=""  target="_blank" data-category="PDF Dowload" data-action="" data-label="" ><i class="fa fa-download" aria-hidden="true"></i>&nbsp;productbrochure</a>
		            		<a id="dlProductProvisions" class="dlProductBrochure" href=""  target="_blank" data-category="PDF Dowload" data-action="" data-label="" ><i class="fa fa-download" aria-hidden="true"></i>&nbsp;policyprovision</a>
		            	</div>
					</div>
					<div class="row">
						<div class="col-xs-12">
							<div class="col-xs-5 col-xs-offset-1">
								<div class="col-xs-12">
									<span class="pv_title">Cancer Benefits</span>
								</div>
								
								<div class="col-xs-8">
									<span class="pv_item">Diagnostic Benefit</span>
								</div>
								<div class="col-xs-4">
									<span class="pv_price">Full Cover</span>
								</div>
								
								<div class="col-xs-8">
									<span class="pv_item">Cancer Treatment Benefits</span>
									<ol>
										<li>Hospitalisation and Surgical Benefits</li>
										<li>Treatment Benefit</li>
									</ol>
								</div>
								<div class="col-xs-4">
									<span class="pv_price">Full Cover</span>
								</div>
								
								<div class="col-xs-8">
									<span class="pv_item">Reconstructive Surgery Benefit (head or breast)</span>
								</div>
								<div class="col-xs-4">
									<span class="pv_price">Full Cover</span>
								</div>
								
								<div class="col-xs-8">
									<span class="pv_item">Monitoring Benefit (up to 5 years since completion of active treatment)</span>
								</div>
								<div class="col-xs-4">
									<span class="pv_price">Full Cover</span>
								</div>
								
								<div class="col-xs-8">
									<span class="pv_item">Per Covered Cancer Limit (HKD))</span>
								</div>
								<div class="col-xs-4">
									<span class="pv_price">Full Cover</span>
								</div>
								
								<div class="col-xs-8">
									<span class="pv_item">Lifetime Cancer Limit (HKD))</span>
								</div>
								<div class="col-xs-4">
									<span class="pv_price">Full Cover</span>
								</div>
								
								<div class="col-xs-12">
									<span class="pv_title">Death Benefits</span>
								</div>
								
								<div class="col-xs-8">
									<span class="pv_item">Compassionate Death Benefit</span>
								</div>
								<div class="col-xs-4">
									<span class="pv_price">Full Cover</span>
								</div>
								
								<div class="col-xs-12">
									<span class="pv_title">Ancillary Services</span>
								</div>
								
								<div class="col-xs-8">
									<span class="pv_item">Second Medical Opinion Service<br>International SOS 24-hour Worldwide Assistance Program CANcierge</span>
								</div>
								<div class="col-xs-4">
									<span class="pv_price">Full Cover</span>
								</div>
								
							</div>
							<div class="col-xs-5 col-xs-offset-1">
								<div class="col-xs-12">
									<span class="pv_title">Additional Benefit (Per Covered Cancer)</span>
								</div>
								
								<div class="col-xs-8">
									<span class="pv_item">Daily Hospital Cash for Hospitalisation:</span>
								</div>
								<div class="col-xs-4">
									<span class="pv_price">500</span>
								</div>
								
								<div class="col-xs-8">
									<span class="pv_item">Chinese Medicine Practitioner Consultation (including acupuncture treatments or prescribed Chinese medicines)(per visit)</span>
								</div>
								<div class="col-xs-4">
									<span class="pv_price">500</span>
								</div>
								
								<div class="col-xs-8">
									<span class="pv_item">Physiotherapist Consultation (including acupuncture and chiropractic services) / Occupation Therapy / Speech Therapy (per visit)</span>
								</div>
								<div class="col-xs-4">
									<span class="pv_price">500</span>
								</div>
								
								<div class="col-xs-8">
									<span class="pv_item">Dietician Consultation (per visit))</span>
								</div>
								<div class="col-xs-4">
									<span class="pv_price">500</span>
								</div>
								
								<div class="col-xs-8">
									<span class="pv_item">Psychological Counselling (for Insured and/ or immediate family members)(per visit)</span>
								</div>
								<div class="col-xs-4">
									<span class="pv_price">1000</span>
								</div>
								
								<div class="col-xs-8">
									<span class="pv_item">Post-Hospitalisation home Nursing(per day)</span>
								</div>
								<div class="col-xs-4">
									<span class="pv_price">1000</span>
								</div>
								
								<div class="col-xs-8">
									<span class="pv_item">Transportation Fee Subsidy (per day)</span>
								</div>
								<div class="col-xs-4">
									<span class="pv_price">300</span>
								</div>
								
								<div class="col-xs-8">
									<span class="pv_item">Medical Appliances</span>
								</div>
								<div class="col-xs-4">
									<span class="pv_price">5000</span>
								</div>
								
							</div>
								
						</div>
					</div>
				</div>
			</div>
			<div id="pv_fmp">
				<div class="container">
					<div class="row">
						<div class="col-xs-12">
							<h3 class="pv_title">For more information about the Full Medical Plan, please click for more</h3>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12">
							<a href="javascript:void(0);" class="pv_btn btnStart">Full Medical Plan</a>
						</div>
					</div>
				</div>
			</div>
            
			<div id="plan-details-sample-and-faq" class="container">
				<div id="pd-sf-tabs-container" class="container-fluid content-container-fluid">
				   <ul id="pd-sf-nav-tabs" class="nav nav-tabs" role="tablist">
						<li class="pd-sf-tab text-center active" role="presentation">
							<a href="#pd-sf-sale-illustration-sample-pane" class="bold" aria-controls="pd-sf-sale-illustration-sample-pane" role="tab" data-toggle="tab">Key Product Risks & Exclusions</a>
						</li>
						<li class="pd-sf-tab pd-sf-tab-right text-center" role="presentation">
							<a href="#pd-sf-glossary-pane" class="bold" aria-controls="pd-sf-faq-and-glossary-pane" role="tab" data-toggle="tab">Glossary</a>
						</li>
						<li class="pd-sf-tab pd-sf-tab-right text-center" role="presentation">
							<a href="#pd-sf-faq-pane" class="bold" aria-controls="pd-sf-faq-and-glossary-pane" role="tab" data-toggle="tab">FAQ</a>
						</li>
				   </ul>
				</div>
				<div class="pd-sf-divider"></div>
				<div id="pd-sf-tab-content-container" class="container-fluid content-container-fluid">
					<div class="tab-content">
						<div role="tabpanel" class="tab-pane active" id="pd-sf-sale-illustration-sample-pane">
							<div class="panel-group" id="pd-sf-sale-illustration-sample-group" role="tablist" aria-multiselectable="true">
								<div class="panel panel-default pd-sf-sale-illustration-sample-panel">
								   <div class="panel-heading" role="tab" id="pd-sf-product-related">
									  <h4 class="panel-title">
										 <a class="collapsed" role="button" data-toggle="collapse" data-parent="#pd-sf-sale-illustration-sample-group" href="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
											TITLE1
											<span class="pull-right">
											   <img src="<%=request.getContextPath()%>/resources/images/savie-2016/arrow-down1.png" />
											</span>
										 </a>
									  </h4>
								   </div>
								   <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="pd-sf-product-related">
									  <div class="panel-body">
										<div>
											
											<ol>
												1
											</ol>
											
											<ol>
												2
											</ol>
											
											
										</div>
									  </div>
								   </div>
								</div>
								<div class="panel panel-default pd-sf-sale-illustration-sample-panel">
								   <div class="panel-heading" role="tab" id="pd-sf-claim-related">
									  <h4 class="panel-title">
										 <a class="collapsed" role="button" data-toggle="collapse" data-parent="#pd-sf-faq-and-glossary-group" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
											TITLE2
											<span class="pull-right">
											   <img src="<%=request.getContextPath()%>/resources/images/savie-2016/arrow-down1.png" />
											</span>
										 </a>
									  </h4>
								   </div>
								   <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="pd-sf-claim-related">
									  <div class="panel-body">
									  	<ol>
									  		3
									  	</ol>
		
									  	<ol>
									  		4
									  	</ol>
									  </div>
								   </div>
								</div>
							</div>
						</div>
						<div role="tabpanel" class="tab-pane" id="pd-sf-glossary-pane">
							<div class="panel-group" id="pd-sf-glossary-group" role="tablist" aria-multiselectable="true">
								<div class="panel panel-default pd-sf-faq-and-glossary-panel">
								   <div class="panel-heading" role="tab" id="pd-sf-product-related">
									  <h4 class="panel-title">
										 <a class="collapsed" role="button" data-toggle="collapse" data-parent="#pd-sf-glossary-group" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
											TITLE3
											<span class="pull-right">
											   <img src="<%=request.getContextPath()%>/resources/images/savie-2016/arrow-down1.png" />
											</span>
										 </a>
									  </h4>
								   </div>
								   <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="pd-sf-product-related">
									  <div class="panel-body">
									  	
									  	<ol>
								  			5
								  		</ol><br/>
									  	
									  	<ol>
									  		6
									  	</ol><br/>
									  	<ol>
									  		7
									  	</ol>
									  	
									  </div>
								   </div>
								</div>
							</div>
						</div>
						<div role="tabpanel" class="tab-pane" id="pd-sf-faq-pane">
							<div class="panel-group" id="pd-sf-faq-group" role="tablist" aria-multiselectable="true">
								<div class="panel panel-default pd-sf-faq-panel">
								   <div class="panel-heading" role="tab" id="pd-sf-product-related">
									  <h4 class="panel-title">
										 <a class="collapsed" role="button" data-toggle="collapse" data-parent="#pd-sf-faq-group" href="#collapseFour" aria-expanded="false" aria-controls="collapseThree">
											TITLE4
											<span class="pull-right">
											   <img src="<%=request.getContextPath()%>/resources/images/savie-2016/arrow-down1.png" />
											</span>
										 </a>
									  </h4>
								   </div>
								   <div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="pd-sf-product-related">
									  <div class="panel-body">
									  	
									  	<ol>
								  			8
								  		</ol><br/>
									  	
									  	<ol>
									  		9
									  	</ol><br/>
									  	<ol>
									  		10
									  	</ol>
									  	
									  </div>
								   </div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		<div id="pv_claims" class="pv_sec_features container">
            	<div class="fwd-container-limit">
            		<div class="row">
            			<div class="col-xs-12">
            				<h2 class="pv_title">CLAIMS</h2>
            			</div>
						<div class="pv_feature_wrap">

							<div id="claims_livechat" class="col-xs-4 col-lg-4 pv_feature_box text-center">
								<img src="<%=request.getContextPath()%>/resources/images/provie/provie_landing_s3_icon_01.png" alt='1' class="img_responsive">
								<h3 class="pv_feature_title">Live Chat</h3>
								<p class="pv_feature_desc hidden-xs"><span class="pv_remark"></span></p>
							</div>

							<div id="claims_claims" class="col-xs-4 col-lg-4 pv_feature_box text-center">
								<img src="<%=request.getContextPath()%>/resources/images/provie/provie_landing_s3_icon_02.png" alt='2' class="img_responsive">
								<h3 class="pv_feature_title">Claims</h3>
								<div class="visible-xs">
									<a class="pop-youtube" href="#vModal" data-toggle="modal" data-youtube-link="2">
									</a>
								</div>
								<div class="pv_feature_desc hidden-xs">
									<div>
									</div>
								</div>
							</div>
							
							<div id="claims_24h_hotline" class="col-xs-4 col-lg-4 pv_feature_box text-center">
								<img src="<%=request.getContextPath()%>/resources/images/provie/provie_landing_s3_icon_01.png" alt='1' class="img_responsive">
								<h3 class="pv_feature_title">24-hour Service Hotline</h3>
								<p class="pv_feature_desc hidden-xs"><span class="pv_remark"></span></p>
							</div>

							<div class="clearfix hidden-lg"></div>

							
						</div>
            		</div>
            	</div>
            </div>
            <%-- <div class="regular-benefit">
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
                                        <img src="<%=request.getContextPath()%>/resources/images/pillar/pillar-01.png" alt="<fmt:message key="image.alt_13" bundle="${msg}" />">
                                    </div>
                                    <h3 class="visible-md visible-lg  tab-head"><fmt:message key="pillar.support.title" bundle="${msg}" /></h3>
                                     <p><fmt:message key="pillar.support.copy1" bundle="${msg}" /> <!--<a href="#" class="eserv-link ui-link">eServices</a>--></p>
                                </div>
                            </div>
                            <div role="tabpanel" class="fna-tab-content tab-pane item" id="navtabs-2" next-target="nav-title-3">
                                <div class="so-fna-content">
                                    <div class="fna-icon-circle">
                                        <img src="<%=request.getContextPath()%>/resources/images/pillar/pillar-02.png" alt="<fmt:message key="image.alt_11" bundle="${msg}" />">
                                    </div>
                                    <h3 class="visible-md visible-lg tab-head"><fmt:message key="pillar.convenience.title" bundle="${msg}" /></h3>
                                    <p><fmt:message key="pillar.convenience.copy1" bundle="${msg}" /></p>
                                </div>
                            </div>
                            <div role="tabpanel" class="fna-tab-content tab-pane item" id="navtabs-3" next-target="nav-title-4">
                                <div class="so-fna-content">
                                    <div class="fna-icon-circle">
                                        <img src="<%=request.getContextPath()%>/resources/images/pillar/pillar-03.png" alt="<fmt:message key="image.alt_9" bundle="${msg}" />">
                                    </div>
                                    <h3 class="visible-md visible-lg tab-head"><fmt:message key="pillar.claims.easy.title" bundle="${msg}" /></h3>
                                    <p><fmt:message key="pillar.claims.easy.copy1.part1" bundle="${msg}" /> <a href="<fmt:message key="link.claims" bundle="${msg}" />" class="eserv-link ui-link" target="_blank"><fmt:message key="pillar.claims.easy.copy1.part2" bundle="${msg}" /></a> <fmt:message key="pillar.claims.easy.copy1.part3" bundle="${msg}" /></p>
                                </div>
                            </div>
                            <div role="tabpanel" class="fna-tab-content tab-pane item" id="navtabs-4" next-target="nav-title-1">
                                <div class="so-fna-content">
                                    <div class="fna-icon-circle">
                                        <img src="<%=request.getContextPath()%>/resources/images/pillar/pillar-04.png" alt="<fmt:message key="image.alt_12" bundle="${msg}" />">
                                    </div>
                                    <h3 class="visible-md visible-lg  tab-head"><fmt:message key="pillar.eService.app.title" bundle="${msg}" /></h3>
                                    <p><fmt:message key="pillar.eService.app.copy1.part1" bundle="${msg}" /> <a href="<fmt:message key="link.eservices" bundle="${msg}" />" class="eserv-link ui-link" target="_blank"><fmt:message key="pillar.eService.app.copy1.part2" bundle="${msg}" /></a> <fmt:message key="pillar.eService.app.copy1.part3" bundle="${msg}" /></p>
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
			<div class="content-disclaimer">
				<p><fmt:message key="Home.Landing.Disclaimer" bundle="${msg}" /></p>
			</div> --%>
        <!-- OUR BLOG -->
        <div class="blog">
                <div class="hidden-md hidden-lg">
                    <div class="mini-banner-holder">
                    	<img src="<%=request.getContextPath()%>/resources/images/easy-health/shutterstock.jpg" class="img-responsive">
                        <div class="black-overlay"></div>
                        <h5 class="text-center"><fmt:message key="blog.easyhealth.description" bundle="${msg}" /></h5>
                    </div>
                    <div class="btn-holder">
                        <button id="btn-blog-link" class="savie-regular-btn"><fmt:message key="blog.home.title" bundle="${msg}" /></button>
                    </div>
                </div>
                <div class="hidden-xs hidden-sm">
                        <h3 class="text-center"><fmt:message key="blog.home.title" bundle="${msg}" /></h3>
                        <div class="gray-divide"></div>
                        <p class="definition text-center"><fmt:message key="blog.easyhealth.description" bundle="${msg}" /></p>

                        <div class="blogs-holder clearfix fwd-container-limit">
                            <div class="blogs first">
                                <img src="<%=request.getContextPath()%>/resources/images/easy-health/shutterstock.jpg" class="img-responsive">
                                <div class="orange-overlay text-center">
                                    <p class="title"><fmt:message key="blog.easyhealth.post1.title" bundle="${msg}" /></p>
                                    <!-- <span>SAVE</span> -->
                                    <p class="definition"><fmt:message key="blog.easyhealth.post1.copy" bundle="${msg}" /></p>
                                    <a class="btn-read-now" href="<fmt:message key="blog.easyhealth.post1.link" bundle="${msg}" />" target="_blank"><fmt:message key="blog.home.readmore" bundle="${msg}" /></a>
                                </div>
                            </div>
                            <div class="blogs">
                                <img src="<%=request.getContextPath()%>/resources/images/easy-health/avocado-toast.jpg" class="img-responsive">
                                <div class="orange-overlay text-center">
                                    <p class="title"><fmt:message key="blog.easyhealth.post2.title" bundle="${msg}" /></p>
                                    <!-- <span>SAVE</span> -->
                                    <p class="definition"><fmt:message key="blog.easyhealth.post2.copy" bundle="${msg}" /></p>
                                    <a class="btn-read-now" href="<fmt:message key="blog.easyhealth.post2.link" bundle="${msg}" />" target="_blank"><fmt:message key="blog.home.readmore" bundle="${msg}" /></a>
                                </div>
                            </div>
                            <div class="blogs">
                                <img src="<%=request.getContextPath()%>/resources/images/easy-health/plastic-wrap-alternatives-abeego-multi-wrap-Cool-Mom-Picks.jpg" class="img-responsive">
                                <div class="orange-overlay text-center">
                                    <p class="title"><fmt:message key="blog.easyhealth.post3.title" bundle="${msg}" /></p>
                                    <!-- <span>SAVE</span> -->
                                    <p class="definition"><fmt:message key="blog.easyhealth.post3.copy" bundle="${msg}" /></p>
                                    <a class="btn-read-now" href="<fmt:message key="blog.easyhealth.post3.link" bundle="${msg}" />" target="_blank"><fmt:message key="blog.home.readmore" bundle="${msg}" /></a>
                                </div>
                            </div>
                            <div class="blogs last">
                                <img src="<%=request.getContextPath()%>/resources/images/easy-health/windowandbonsai.jpg" class="img-responsive">
                                <div class="orange-overlay text-center">
                                    <p class="title"><fmt:message key="blog.easyhealth.post4.title" bundle="${msg}" /></p>
                                    <!-- <span>SAVE</span> -->
                                    <p class="definition"><fmt:message key="blog.easyhealth.post4.copy" bundle="${msg}" /></p>
                                    <a class="btn-read-now" href="<fmt:message key="blog.easyhealth.post4.link" bundle="${msg}" />" target="_blank"><fmt:message key="blog.home.readmore" bundle="${msg}" /></a>
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

<script>
//mobile blog read more button open blog page
$(document).ready(function() {
	if(isMobile) {
		$(".annualTravel_policy_item").click(function(){
			$('#livechat-full').hide();
			
			itemTop = $(this).offset();
			var html=$(this).children('.hidden-benefits').children().clone();
			$("#modal_policy_container").html(html);
			$("#policyCoveragePopup").modal("show");
			$("#policyCoveragePopup").on('show.bs.modal', function () {
				$('body').css("position", "inital");
				$('.hidden-benefits-info').css("font-family", "Calibri");
				$('.hidden-benefits-info').css("font-size", "14px");
				$('body').animate({scrollTop: itemTop.top - 60}, 0);

				$(window).scrollTop(0);
			});
			$("#policyCoveragePopup").on('hide.bs.modal', function () {
				//alert(itemTop.top);
				$('body').css("position", "initial");
				$('body').animate({scrollTop: itemTop.top - 60}, 0);
				//$('body').css("position", "relative");
			});
			$("#policyCoveragePopup").on('hidden.bs.modal', function () {
				$('body').attr("style", "");
				$('#livechat-full').show();
			});
		});
	}
	$('#btn-blog-link').click(function(){
		window.open('<fmt:message key="blog.easyhealth.post1.link" bundle="${msg}" />');
	});
	$("#claims_livechat").click(function(){
		window.location=""
	});
	$("#claims_claims").click(function(){
		window.location=""
	});
	$("#claims_24h_hotline").click(function(){
		window.location=""
	});
});
</script>

<script src="<%=request.getContextPath()%>/resources/js/medical-guardian/uifn-landing.js"></script>