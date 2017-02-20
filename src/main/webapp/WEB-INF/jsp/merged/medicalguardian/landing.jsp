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
<fmt:setBundle basename="medicalguardian" var="medicalguardianMsg" />
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
	    	referral Code:<input type="text" name="referralCode" id="temp_referralCode" value="H1"><br>
	    	
	    	
	    	<input type="button" value="Apply Now" id="btn-applyNow">
	    	
	    	<div class="resultPan hide">
	    	<br><br><br>
	    		<p class="result_txt"></p>
	    		<form action="<%=request.getContextPath()%>/${language}/${nextPageFlow}" method="post">
	    			<input type="hidden" name="dob" value="1980-01-30" class="flow_dob">
	    			<input type="hidden" name="gender" value="0" class="flow_gender">
	    			<input type="hidden" name="smoker" value="0" class="flow_smoker">
	    			<input type="hidden" name="plancode" value="" class="flow_plancode">
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
        
        <!-- Feature -->
	        <div id="pv_feature">
	        	<div class="container">
	        	<h2 class="pv_title text-center">Flexible and affordable, giving you smart and seamless coverage.<br/>Plan early and you too can go full steam ahead with no worries!</h2>
	        	<!-- Full Online Application -->
	        		 <div role="tabpanel" class="tab-pane active" id="">
						<div class="panel-group" id="" role="tablist" aria-multiselectable="true">
							<div class="panel panel-default pd-sf-sale-illustration-sample-panel">
							   <div class="panel-heading" role="tab" id="pd-sf-product-related">
								  <h4 class="panel-title hidden-sm hidden-md hidden-lg text-center">
									 <a class="collapsed" role="button" data-toggle="collapse" data-parent="" href="#collapseCover" aria-expanded="true" aria-controls="collapseCover">
										<fmt:message key="medicalguardian.feature.1.title" bundle="${medicalguardianMsg}" />
										<span class="pull-right  hidden-md hidden-lg">
										   <img src="<%=request.getContextPath()%>/resources/images/savie-2016/arrow-down1.png" />
										</span>
									 </a>
								  </h4>
							   </div>
							   <div id="collapseCover" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="pd-sf-product-related">
								  	<div class="panel-body">
								  		<div class="row">
									  		<div class="col-xs-3 col-sm-2">
									  		<img src="<%=request.getContextPath()%>/resources/images/medicalguardian/s1_icon_01.png" alt=""> 
									  		</div>
									  		<div class="col-sm-4 hidden-xs">
									  		<span class="pv_title"><fmt:message key="medicalguardian.feature.1.title" bundle="${medicalguardianMsg}" /></span>
									  		</div>
									  		<div class="col-xs-9 col-sm-6">
									  			<ul>
									  				<li><fmt:message key="medicalguardian.feature.1.1" bundle="${medicalguardianMsg}" /></li>
									  			</ul>
									  		</div>
										</div>
									</div>
								</div>
							</div>
						</div>				
					</div> 
					<!-- Full Online Application End -->
					<!-- Add-on To Your Medical Plan -->
	        		 <div role="tabpanel" class="tab-pane active" id="">
						<div class="panel-group" id="" role="tablist" aria-multiselectable="true">
							<div class="panel panel-default pd-sf-sale-illustration-sample-panel">
							   <div class="panel-heading" role="tab" id="pd-sf-product-related">
								  <h4 class="panel-title hidden-sm hidden-md hidden-lg text-center">
									 <a class="collapsed" role="button" data-toggle="collapse" data-parent="" href="#collapseAddon" aria-expanded="true" aria-controls="collapseAddon">
										<fmt:message key="medicalguardian.feature.2.title" bundle="${medicalguardianMsg}" />
										<span class="pull-right  hidden-md hidden-lg">
										   <img src="<%=request.getContextPath()%>/resources/images/savie-2016/arrow-down1.png" />
										</span>
									 </a>
								  </h4>
							   </div>
							   <div id="collapseAddon" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="pd-sf-product-related">
								  	<div class="panel-body">
								  		<div class="row">
									  		<div class="col-xs-3 col-sm-2">
									  		<img src="<%=request.getContextPath()%>/resources/images/medicalguardian/s1_icon_02.png" alt="">
									  		</div>
									  		<div class="col-sm-4 hidden-xs">
									  		<span class="pv_title"><fmt:message key="medicalguardian.feature.2.title" bundle="${medicalguardianMsg}" /></span>
									  		</div>
									  		<div class="col-xs-9 col-sm-6">
									  			<ul>
									  				<li><fmt:message key="medicalguardian.feature.2.1" bundle="${medicalguardianMsg}" /></li>
									  				<li><fmt:message key="medicalguardian.feature.2.2" bundle="${medicalguardianMsg}" /></li>
									  			</ul>
									  		</div>
										</div>
									</div>
								</div>
							</div>
						</div>				
					</div> 
					<!-- Add-on To Your Medical Plan End -->
					<!-- Cover Periods of Job Transition -->
	        		 <div role="tabpanel" class="tab-pane active" id="">
						<div class="panel-group" id="" role="tablist" aria-multiselectable="true">
							<div class="panel panel-default pd-sf-sale-illustration-sample-panel">
							   <div class="panel-heading" role="tab" id="pd-sf-product-related">
								  <h4 class="panel-title hidden-sm hidden-md hidden-lg text-center">
									 <a class="collapsed" role="button" data-toggle="collapse" data-parent="" href="#collapseCoverPeriods" aria-expanded="true" aria-controls="collapseCoverPeriods">
										<fmt:message key="medicalguardian.feature.3.title" bundle="${medicalguardianMsg}" />
										<span class="pull-right  hidden-md hidden-lg">
										   <img src="<%=request.getContextPath()%>/resources/images/savie-2016/arrow-down1.png" />
										</span>
									 </a>
								  </h4>
							   </div>
							   <div id="collapseCoverPeriods" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="pd-sf-product-related">
								  	<div class="panel-body">
								  		<div class="row">
									  		<div class="col-xs-3 col-sm-2">
									  		<img src="<%=request.getContextPath()%>/resources/images/medicalguardian/s1_icon_03.png" alt="">
									  		</div>
									  		<div class="col-sm-4 hidden-xs">
									  		<span class="pv_title"><fmt:message key="medicalguardian.feature.3.title" bundle="${medicalguardianMsg}" /></span>
									  		</div>
									  		<div class="col-xs-9 col-sm-6">
									  			<ul>
									  				<li><fmt:message key="medicalguardian.feature.3.1" bundle="${medicalguardianMsg}" /></li>
									  				<li><fmt:message key="medicalguardian.feature.3.2" bundle="${medicalguardianMsg}" /></li>
									  				<li><fmt:message key="medicalguardian.feature.3.3" bundle="${medicalguardianMsg}" /></li>
									  				<li><fmt:message key="medicalguardian.feature.3.4" bundle="${medicalguardianMsg}" /></li>
									  			</ul>
									  		</div>
										</div>
									</div>
								</div>
							</div>
						</div>				
					</div> 
					<!-- Cover Periods of Job Transition End -->
					<!-- Extra Professional Support -->
	        		 <div role="tabpanel" class="tab-pane active" id="">
						<div class="panel-group" id="" role="tablist" aria-multiselectable="true">
							<div class="panel panel-default pd-sf-sale-illustration-sample-panel">
							   <div class="panel-heading" role="tab" id="pd-sf-product-related">
								  <h4 class="panel-title hidden-sm hidden-md hidden-lg text-center">
									 <a class="collapsed" role="button" data-toggle="collapse" data-parent="" href="#collapseExtraSup" aria-expanded="true" aria-controls="collapseExtraSup">
										<fmt:message key="medicalguardian.feature.4.title" bundle="${medicalguardianMsg}" />
										<span class="pull-right  hidden-md hidden-lg">
										   <img src="<%=request.getContextPath()%>/resources/images/savie-2016/arrow-down1.png" />
										</span>
									 </a>
								  </h4>
							   </div>
							   <div id="collapseExtraSup" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="pd-sf-product-related">
								  	<div class="panel-body">
								  		<div class="row">
									  		<div class="col-xs-3 col-sm-2">
									  		<img src="<%=request.getContextPath()%>/resources/images/medicalguardian/s1_icon_04.png" alt="">
									  		</div>
									  		<div class="col-sm-4 hidden-xs">
									  		<span class="pv_title"><fmt:message key="medicalguardian.feature.4.title" bundle="${medicalguardianMsg}" /></span>
									  		</div>
									  		<div class="col-xs-9 col-sm-6">
									  			<ul>
									  				<li><fmt:message key="medicalguardian.feature.4.1" bundle="${medicalguardianMsg}" /></li>
									  				<li><fmt:message key="medicalguardian.feature.4.2" bundle="${medicalguardianMsg}" /></li>
									  			</ul>
									  		</div>
										</div>
									</div>
								</div>
							</div>
						</div>				
					</div> 
					<!-- Extra Professional Support End -->
					<!-- Extra Professional Support -->
	        		 <div role="tabpanel" class="tab-pane active" id="">
						<div class="panel-group" id="" role="tablist" aria-multiselectable="true">
							<div class="panel panel-default pd-sf-sale-illustration-sample-panel">
							   <div class="panel-heading" role="tab" id="pd-sf-product-related">
								  <h4 class="panel-title hidden-sm hidden-md hidden-lg text-center">
									 <a class="collapsed" role="button" data-toggle="collapse" data-parent="" href="#collapseOneStop" aria-expanded="true" aria-controls="collapseOneStop">
										<fmt:message key="medicalguardian.feature.5.title" bundle="${medicalguardianMsg}" />
										<span class="pull-right  hidden-md hidden-lg">
										   <img src="<%=request.getContextPath()%>/resources/images/savie-2016/arrow-down1.png" />
										</span>
									 </a>
								  </h4>
							   </div>
							   <div id="collapseOneStop" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="pd-sf-product-related">
								  	<div class="panel-body">
								  		<div class="row">
									  		<div class="col-xs-3 col-sm-2">
									  		<img src="<%=request.getContextPath()%>/resources/images/medicalguardian/s1_icon_05.png" alt="">
									  		</div>
									  		<div class="col-sm-4 hidden-xs">
									  		<span class="pv_title"><fmt:message key="medicalguardian.feature.5.title" bundle="${medicalguardianMsg}" /></span>
									  		</div>
									  		<div class="col-xs-9 col-sm-6">
									  			<ul>
									  				<li><fmt:message key="medicalguardian.feature.5.1" bundle="${medicalguardianMsg}" /></li>
									  			</ul>
									  		</div>
										</div>
									</div>
								</div>
							</div>
						</div>				
					</div> 
					<!-- Extra Professional Support End -->
					<!-- Extra Professional Support -->
	        		 <div role="tabpanel" class="tab-pane active" id="">
						<div class="panel-group" id="" role="tablist" aria-multiselectable="true">
							<div class="panel panel-default pd-sf-sale-illustration-sample-panel">
							   <div class="panel-heading" role="tab" id="pd-sf-product-related">
								  <h4 class="panel-title hidden-sm hidden-md hidden-lg text-center">
									 <a class="collapsed" role="button" data-toggle="collapse" data-parent="" href="#collapseTil100" aria-expanded="true" aria-controls="collapseTil100">
										<fmt:message key="medicalguardian.feature.6.title" bundle="${medicalguardianMsg}" />
										<span class="pull-right  hidden-md hidden-lg">
										   <img src="<%=request.getContextPath()%>/resources/images/savie-2016/arrow-down1.png" />
										</span>
									 </a>
								  </h4>
							   </div>
							   <div id="collapseTil100" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="pd-sf-product-related">
								  	<div class="panel-body">
								  		<div class="row">
									  		<div class="col-xs-3 col-sm-2">
									  		<img src="<%=request.getContextPath()%>/resources/images/medicalguardian/s1_icon_06.png" alt="">
									  		</div>
									  		<div class="col-sm-4 hidden-xs">
									  		<span class="pv_title"><fmt:message key="medicalguardian.feature.6.title" bundle="${medicalguardianMsg}" /></span>
									  		</div>
									  		<div class="col-xs-9 col-sm-6">
									  			<ul>
									  				<li><fmt:message key="medicalguardian.feature.6.1" bundle="${medicalguardianMsg}" /></li>
									  			</ul>
									  		</div>
										</div>
									</div>
								</div>
							</div>
						</div>				
					</div> 
					<!-- Extra Professional Support End -->
	        	</div>
	        </div>
	        

			<div id="pv_schedule">
				<div class="container">
				<h2 class="pv_title text-center"><fmt:message key="medicalguardian.schedule.title" bundle="${medicalguardianMsg}" /><br><fmt:message key="medicalguardian.schedule.subtitle" bundle="${medicalguardianMsg}" /></h2>
				<div role="tabpanel" class="tab-pane active" id="pd-sf-sale-illustration-sample-pane">
					<div class="panel-group" id="pd-sf-sale-illustration-sample-group" role="tablist" aria-multiselectable="true">
						<div class="panel panel-default pd-sf-sale-illustration-sample-panel">
						   <div class="panel-heading" role="tab" id="pd-sf-product-related">
							  <h4 class="panel-title">
								 <a class="collapsed" role="button" data-toggle="collapse" data-parent="#pd-sf-sale-illustration-sample-group" href="#collapseSchedule" aria-expanded="false" aria-controls="collapseSchedule">
									<fmt:message key="medicalguardian.schedule.expand" bundle="${medicalguardianMsg}" />
									<span class="pull-right hidden-xs hidden-sm hidden-md hidden-lg">
									   <img src="<%=request.getContextPath()%>/resources/images/savie-2016/arrow-down1.png" />
									</span>
								 </a>
							  </h4>
						   </div>
						   <div id="collapseSchedule" class="panel-collapse collapse" role="tabpanel" aria-labelledby="pd-sf-product-related">
							  <div class="panel-body">
								<div class="row">
								 <div class="wh_p_btns-gp text-center">
		            		<a id="dlProductFacesheet" class="dlProductBrochure" href=""  target="_blank" data-category="PDF Dowload" data-action="" data-label="" ><i class="fa fa-download" aria-hidden="true"></i><fmt:message key="medicalguardian.schedule.product.factsheet" bundle="${medicalguardianMsg}" /></a>
		            		<a id="dlProductProvisions" class="dlProductBrochure" href=""  target="_blank" data-category="PDF Dowload" data-action="" data-label="" ><i class="fa fa-download" aria-hidden="true"></i><fmt:message key="medicalguardian.schedule.policy.provisions" bundle="${medicalguardianMsg}" /></a>
		            	</div>
						<!-- Schedule Table Start -->
						<!-- left col -->
							<div class="col-xs-12 col-sm-6">
							<!-- Area of Cover -->
								<div class="col-xs-12">
									<div class="col-xs-12">
										<span class="pv_title"><fmt:message key="medicalguardian.schedule.area.cover" bundle="${medicalguardianMsg}" /></span>
									</div>
									<div class="col-xs-12 gray-divide"></div>
									<div class="col-xs-12">
										<span class="pv_item"><fmt:message key="medicalguardian.schedule.area.cover.text" bundle="${medicalguardianMsg}" /></span>
									</div>
								</div>
							<!-- Room Level of Hospitalisation -->	
								<div class="col-xs-12">		
									<div class="col-xs-12">
										<span class="pv_title"><fmt:message key="medicalguardian.schedule.room.level.title" bundle="${medicalguardianMsg}" /></span>
									</div>
									<div class="col-xs-12 gray-divide"></div>
									<div class="col-xs-12">
										<span class="pv_item"><fmt:message key="medicalguardian.schedule.room.level.text" bundle="${medicalguardianMsg}" /></span>
									</div>	
								</div>
							<!-- Cancer Benefits -->		
							<div class="col-xs-12">			
									<div class="col-xs-12">
										<span class="pv_title"><fmt:message key="medicalguardian.schedule.cancer.benefit.title" bundle="${medicalguardianMsg}" /></span>
									</div>
									<div class="col-xs-12 gray-divide"></div>
									<div class="col-xs-9">
										<span class="pv_item"><fmt:message key="medicalguardian.schedule.cancer.benefit.text" bundle="${medicalguardianMsg}" /></span>
									</div>
									<div class="col-xs-3">
										<span class="pv_price"><fmt:message key="medicalguardian.schedule.price.full.cover" bundle="${medicalguardianMsg}" /></span>
									</div>
									
									<div class="col-xs-9">
										<span class="pv_item"><fmt:message key="medicalguardian.schedule.cancer.benefit.text1" bundle="${medicalguardianMsg}" /></span>
										<ul>
											<li><fmt:message key="medicalguardian.schedule.cancer.benefit.text1.1" bundle="${medicalguardianMsg}" /></li>
											<li><fmt:message key="medicalguardian.schedule.cancer.benefit.text1.2" bundle="${medicalguardianMsg}" /></li>
										</ul>
									</div>
									<div class="col-xs-3">
										<span class="pv_price"><fmt:message key="medicalguardian.schedule.price.full.cover" bundle="${medicalguardianMsg}" /></span>
									</div>
									
									<div class="col-xs-9">
										<span class="pv_item"><fmt:message key="medicalguardian.schedule.cancer.benefit.text2" bundle="${medicalguardianMsg}" /></span>
									</div>
									<div class="col-xs-3">
										<span class="pv_price"><fmt:message key="medicalguardian.schedule.price.full.cover" bundle="${medicalguardianMsg}" /></span>
									</div>
									
									<div class="col-xs-9">
										<span class="pv_item"><fmt:message key="medicalguardian.schedule.cancer.benefit.text3" bundle="${medicalguardianMsg}" /></span>
									</div>
									<div class="col-xs-3">
										<span class="pv_price"><fmt:message key="medicalguardian.schedule.price.full.cover" bundle="${medicalguardianMsg}" /></span>
									</div>
									<div class="col-xs-12 gray-divide"></div>
									<div class="col-xs-9">
										<span class="pv_item"><fmt:message key="medicalguardian.schedule.cancer.benefit.text4" bundle="${medicalguardianMsg}" /></span>
									</div>
									<div class="col-xs-3">
										<span class="pv_price"><fmt:message key="medicalguardian.schedule.price.500000" bundle="${medicalguardianMsg}" /></span>
									</div>
									
									<div class="col-xs-9">
										<span class="pv_item"><fmt:message key="medicalguardian.schedule.cancer.benefit.text5" bundle="${medicalguardianMsg}" /></span>
									</div>
									<div class="col-xs-3">
										<span class="pv_price"><fmt:message key="medicalguardian.schedule.price.1500000" bundle="${medicalguardianMsg}" /></span>
									</div>	
								</div>
							</div><!-- Left col End -->
							<!-- right col -->
							<div class="col-xs-12 col-sm-6">
							<!-- Additional Cancer Care Benefits -->
								<div class="col-xs-12">
									<div class="col-xs-12">
										<span class="pv_title pv_highlight"><fmt:message key="medicalguardian.schedule.additional.cancer.benefit.title" bundle="${medicalguardianMsg}" /></span>
										<span class="pv_title"><fmt:message key="medicalguardian.schedule.additional.cancer.benefit.title1" bundle="${medicalguardianMsg}" /></span>
									</div>
									<div class="col-xs-12 gray-divide"></div>
									<div class="col-xs-9">
										<span class="pv_item"><fmt:message key="medicalguardian.schedule.additional.cancer.benefit.text" bundle="${medicalguardianMsg}" /></span>
									</div>
									<div class="col-xs-3">
										<span class="pv_price"><fmt:message key="medicalguardian.schedule.price.500" bundle="${medicalguardianMsg}" /></span>
									</div>
									<div class="col-xs-9">
										<span class="pv_item"><fmt:message key="medicalguardian.schedule.additional.cancer.benefit.text1" bundle="${medicalguardianMsg}" /></span>
									</div>
									<div class="col-xs-3">
										<span class="pv_price"><fmt:message key="medicalguardian.schedule.price.500" bundle="${medicalguardianMsg}" /></span>
									</div>
									<div class="col-xs-9">
										<span class="pv_item"><fmt:message key="medicalguardian.schedule.additional.cancer.benefit.text2" bundle="${medicalguardianMsg}" /></span>
									</div>
									<div class="col-xs-3">
										<span class="pv_price"><fmt:message key="medicalguardian.schedule.price.500" bundle="${medicalguardianMsg}" /></span>
									</div>
									<div class="col-xs-9">
										<span class="pv_item"><fmt:message key="medicalguardian.schedule.additional.cancer.benefit.text3" bundle="${medicalguardianMsg}" /></span>
									</div>
									<div class="col-xs-3">
										<span class="pv_price"><fmt:message key="medicalguardian.schedule.price.500" bundle="${medicalguardianMsg}" /></span>
									</div>
									<div class="col-xs-9">
										<span class="pv_item"><fmt:message key="medicalguardian.schedule.additional.cancer.benefit.text4" bundle="${medicalguardianMsg}" /></span>
									</div>
									<div class="col-xs-3">
										<span class="pv_price"><fmt:message key="medicalguardian.schedule.price.1000" bundle="${medicalguardianMsg}" /></span>
									</div>
									<div class="col-xs-9">
										<span class="pv_item"><fmt:message key="medicalguardian.schedule.additional.cancer.benefit.text5" bundle="${medicalguardianMsg}" /></span>
									</div>
									<div class="col-xs-3">
										<span class="pv_price"><fmt:message key="medicalguardian.schedule.price.1000" bundle="${medicalguardianMsg}" /></span>
									</div>
									<div class="col-xs-9">
										<span class="pv_item"><fmt:message key="medicalguardian.schedule.additional.cancer.benefit.text6" bundle="${medicalguardianMsg}" /></span>
									</div>
									<div class="col-xs-3">
										<span class="pv_price"><fmt:message key="medicalguardian.schedule.price.300" bundle="${medicalguardianMsg}" /></span>
									</div>
									<div class="col-xs-9">
										<span class="pv_item"><fmt:message key="medicalguardian.schedule.additional.cancer.benefit.text7" bundle="${medicalguardianMsg}" /></span>
									</div>
									<div class="col-xs-3">
										<span class="pv_price"><fmt:message key="medicalguardian.schedule.price.5000" bundle="${medicalguardianMsg}" /></span>
									</div>
									<div class="col-xs-12">
										<p><span class="pv_remark"><fmt:message key="medicalguardian.schedule.additional.cancer.benefit.remark" bundle="${medicalguardianMsg}" /></span></p>
									</div>
								</div>
							<!-- Compassionate Death Benefit -->
								<div class="col-xs-12">
									<div class="col-xs-12">
										<span class="pv_title"><fmt:message key="medicalguardian.schedule.death.benefit.title" bundle="${medicalguardianMsg}" /></span>
									</div>
									<div class="col-xs-12 gray-divide"></div>
									<div class="col-xs-9">
										<span class="pv_item"><fmt:message key="medicalguardian.schedule.death.benefit.text" bundle="${medicalguardianMsg}" /></span>
									</div>
									<div class="col-xs-3">
										<span class="pv_price"><fmt:message key="medicalguardian.schedule.price.10000" bundle="${medicalguardianMsg}" /></span>
									</div>
								</div>
							<!-- Additional Benefits -->
								<div class="col-xs-12">
									<div class="col-xs-12">
										<span class="pv_title"><fmt:message key="medicalguardian.schedule.additional.benefit.title" bundle="${medicalguardianMsg}" /></span>
										<span><fmt:message key="medicalguardian.schedule.additional.benefit.title.desc" bundle="${medicalguardianMsg}" /></span>
									</div>
									<div class="col-xs-12 gray-divide"></div>
									<div class="col-xs-12">
										<span class="pv_item"><fmt:message key="medicalguardian.schedule.additional.benefit.text" bundle="${medicalguardianMsg}" /></span>
									</div>
									<div class="col-xs-12">
										<span class="pv_item"><fmt:message key="medicalguardian.schedule.additional.benefit.text1" bundle="${medicalguardianMsg}" /></span>
									</div>
									<div class="col-xs-12">
										<span class="pv_item"><fmt:message key="medicalguardian.schedule.additional.benefit.text2" bundle="${medicalguardianMsg}" /></span>
									</div>
									<div class="col-xs-12">
										<span class="pv_item"><fmt:message key="medicalguardian.schedule.additional.benefit.text3" bundle="${medicalguardianMsg}" /></span>
									</div>
								</div>
								<!-- Ancillary Services -->
								<div class="col-xs-12">
									<div class="col-xs-12">
										<span class="pv_title"><fmt:message key="medicalguardian.schedule.ancillary.services.title" bundle="${medicalguardianMsg}" /></span>
									</div>
									<div class="col-xs-12 gray-divide"></div>
									<div class="col-xs-12">
										<span class="pv_item"><fmt:message key="medicalguardian.schedule.ancillary.services.text" bundle="${medicalguardianMsg}" /></span>
									</div>
									<div class="col-xs-12">
										<span class="pv_item"><fmt:message key="medicalguardian.schedule.ancillary.services.text1" bundle="${medicalguardianMsg}" /></span>
									</div>
									<div class="col-xs-12">
										<span class="pv_item"><fmt:message key="medicalguardian.schedule.ancillary.services.text2" bundle="${medicalguardianMsg}" /></span>
									</div>								
								</div>
									</div> <!-- Right col End -->
								</div> <!-- Schedule Table End -->
								<div class="row">
												<ol>
													<li><p class="pv_remark"><fmt:message key="medicalguardian.schedule.remark1" bundle="${medicalguardianMsg}" /></p></li>
													<li><p class="pv_remark"><fmt:message key="medicalguardian.schedule.remark2" bundle="${medicalguardianMsg}" /></p></li>
													<li><p class="pv_remark"><fmt:message key="medicalguardian.schedule.remark3" bundle="${medicalguardianMsg}" /></p></li>
													<li><fmt:message key="medicalguardian.schedule.remark4" bundle="${medicalguardianMsg}" />
													<ol class="no_order">
														<li><fmt:message key="medicalguardian.schedule.remark4.1" bundle="${medicalguardianMsg}" /></li>
														<li><fmt:message key="medicalguardian.schedule.remark4.2" bundle="${medicalguardianMsg}" /></li>
														<li><fmt:message key="medicalguardian.schedule.remark4.3" bundle="${medicalguardianMsg}" /></li>
														<li><fmt:message key="medicalguardian.schedule.remark4.4" bundle="${medicalguardianMsg}" /></li>
													</ol>
													<fmt:message key="medicalguardian.schedule.remark4.5" bundle="${medicalguardianMsg}" />
													</li>
													<li><p class="pv_remark"><fmt:message key="medicalguardian.schedule.remark5" bundle="${medicalguardianMsg}" /></p></li>
													<li><p class="pv_remark"><fmt:message key="medicalguardian.schedule.remark6" bundle="${medicalguardianMsg}" /></p></li>
													<li><p class="pv_remark"><fmt:message key="medicalguardian.schedule.remark7" bundle="${medicalguardianMsg}" /></p></li>
													<li><p class="pv_remark"><fmt:message key="medicalguardian.schedule.remark8" bundle="${medicalguardianMsg}" /></p></li>
													<li><p class="pv_remark"><fmt:message key="medicalguardian.schedule.remark9" bundle="${medicalguardianMsg}" /></p></li>
													<li><p class="pv_remark"><fmt:message key="medicalguardian.schedule.remark10" bundle="${medicalguardianMsg}" /></p></li>
													<li><p class="pv_remark"><fmt:message key="medicalguardian.schedule.remark11" bundle="${medicalguardianMsg}" />
													<ol class="no_order">
														<li><fmt:message key="medicalguardian.schedule.remark11.1" bundle="${medicalguardianMsg}" /></li>
														<li><fmt:message key="medicalguardian.schedule.remark11.2" bundle="${medicalguardianMsg}" /></li>
													</ol>
													<fmt:message key="medicalguardian.schedule.remark11.3" bundle="${medicalguardianMsg}" />
													</li>
													<li><p class="pv_remark"><fmt:message key="medicalguardian.schedule.remark12" bundle="${medicalguardianMsg}" />
													<ol class="no_order">
														<li><fmt:message key="medicalguardian.schedule.remark12.1" bundle="${medicalguardianMsg}" /></li>
														<li><fmt:message key="medicalguardian.schedule.remark12.2" bundle="${medicalguardianMsg}" /></li>
													</ol>
													<fmt:message key="medicalguardian.schedule.remark12.3" bundle="${medicalguardianMsg}" />
													</li>
													<li><p class="pv_remark"><fmt:message key="medicalguardian.schedule.remark13" bundle="${medicalguardianMsg}" /></p></li>
													<li><p class="pv_remark"><fmt:message key="medicalguardian.schedule.remark14" bundle="${medicalguardianMsg}" /></p></li>
													<li><p class="pv_remark"><fmt:message key="medicalguardian.schedule.remark15" bundle="${medicalguardianMsg}" /></p></li>
												</ol>
									   		</div>
										</div>
									</div>
								</div>
							</div>				
						</div>
				</div> <!-- Container End -->
			</div>
            
			<div id="plan-details-sample-and-faq" class="container">
				<div id="pd-sf-tabs-container" class="container-fluid content-container-fluid">
				   <ul id="pd-sf-nav-tabs" class="nav nav-tabs" role="tablist">
						<li class="pd-sf-tab text-center active" role="presentation">
							<a href="#pd-sf-sale-illustration-sample-pane" class="bold" aria-controls="pd-sf-sale-illustration-sample-pane" role="tab" data-toggle="tab"><fmt:message key="medicalguardian.tab.risks" bundle="${medicalguardianMsg}" /></a>
						</li>
						<!-- <li class="pd-sf-tab pd-sf-tab-right text-center" role="presentation">
							<a href="#pd-sf-glossary-pane" class="bold" aria-controls="pd-sf-faq-and-glossary-pane" role="tab" data-toggle="tab">Glossary</a>
						</li> -->
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
											<fmt:message key="medicalguardian.risks.title" bundle="${medicalguardianMsg}" />
											<span class="pull-right">
											   <img src="<%=request.getContextPath()%>/resources/images/savie-2016/arrow-down1.png" />
											</span>
										 </a>
									  </h4>
								   </div>
								   <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="pd-sf-product-related">
									  <div class="panel-body">
										<div>
												<p><span class="pv_title"><fmt:message key="medicalguardian.risks.heading1" bundle="${medicalguardianMsg}" /></span></p>
												<p><fmt:message key="medicalguardian.risks.content1" bundle="${medicalguardianMsg}" /></p><br/>
												<p><span class="pv_title"><fmt:message key="medicalguardian.risks.heading2" bundle="${medicalguardianMsg}" /></span></p>
												<p><fmt:message key="medicalguardian.risks.content2" bundle="${medicalguardianMsg}" /></p><br/>
												<p><span class="pv_title"><fmt:message key="medicalguardian.risks.heading3" bundle="${medicalguardianMsg}" /></span></p>
												<p><fmt:message key="medicalguardian.risks.content3" bundle="${medicalguardianMsg}" /></p><br/>
										</div>
									  </div>
								   </div>
								</div>
								<div class="panel panel-default pd-sf-sale-illustration-sample-panel">
								   <div class="panel-heading" role="tab" id="pd-sf-claim-related">
									  <h4 class="panel-title">
										 <a class="collapsed" role="button" data-toggle="collapse" data-parent="#pd-sf-faq-and-glossary-group" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
											<fmt:message key="medicalguardian.exclusion.title" bundle="${medicalguardianMsg}" />
											<span class="pull-right">
											   <img src="<%=request.getContextPath()%>/resources/images/savie-2016/arrow-down1.png" />
											</span>
										 </a>
									  </h4>
								   </div>
								   <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="pd-sf-claim-related">
									  <div class="panel-body">
									  	<div>
											<p><span class="pv_title"><fmt:message key="medicalguardian.exclusion.heading1" bundle="${medicalguardianMsg}" /></span></p>
											<p><fmt:message key="medicalguardian.exclusion.content1" bundle="${medicalguardianMsg}" /></p><br/>
											<ol>
												<li><fmt:message key="medicalguardian.exclusion.content1.1" bundle="${medicalguardianMsg}" /></li>
												<li><fmt:message key="medicalguardian.exclusion.content1.2" bundle="${medicalguardianMsg}" /></li>
											</ol>
									  	</div>
									  	<br/>
									  	<div>
									  		<p><span class="pv_title"><fmt:message key="medicalguardian.exclusion.heading2" bundle="${medicalguardianMsg}" /></span></p>
											<p><fmt:message key="medicalguardian.exclusion.content2" bundle="${medicalguardianMsg}" /></p><br/>
											<ol>
												<li><fmt:message key="medicalguardian.exclusion.content2.1" bundle="${medicalguardianMsg}" /></li>
												<li><fmt:message key="medicalguardian.exclusion.content2.2" bundle="${medicalguardianMsg}" /></li>
												<li><fmt:message key="medicalguardian.exclusion.content2.3" bundle="${medicalguardianMsg}" /></li>
												<li><fmt:message key="medicalguardian.exclusion.content2.4" bundle="${medicalguardianMsg}" /></li>
												<li><fmt:message key="medicalguardian.exclusion.content2.5" bundle="${medicalguardianMsg}" /></li>
												<li><fmt:message key="medicalguardian.exclusion.content2.6" bundle="${medicalguardianMsg}" /></li>
											</ol>
											<p><fmt:message key="medicalguardian.exclusion.content2.7" bundle="${medicalguardianMsg}" /></p><br/>
									  	</div>
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
            			<%-- <div class="col-xs-12">
            				<h2 class="pv_title">We are here for you</h2>
            			</div>
						<div class="pv_feature_wrap">
						<div>
							<div id="claims_24h_hotline" class="col-xs-12 col-sm-4 pv_feature_box text-center">
								<img src="<%=request.getContextPath()%>/resources/images/provie/provie_landing_s3_icon_01.png" alt='1' class="img_responsive">
								<h3 class="pv_feature_title">24-hour Service Hotline</h3>
								<p class="pv_feature_desc hidden-xs"><span class="pv_remark">Our team of Customer Engagement Representatives is at your service 24/7 to address your insurance needs. Call us at 3123 3123.</span></p> 
							</div>
							
							<div id="claims_livechat" class="col-xs-12 col-sm-4 pv_feature_box text-center">
								<img src="<%=request.getContextPath()%>/resources/images/provie/provie_landing_s3_icon_01.png" alt='1' class="img_responsive">
								<h3 class="pv_feature_title">Live Chat</h3>
								<p class="pv_feature_desc hidden-xs"><span class="pv_remark">Need live support? Chat in real-time with our Customer Engagement Representatives to have your questions answered. </span></p> 
							</div>
							
							<div id="claims_email" class="col-xs-12 col-sm-4 pv_feature_box text-center">
								<img src="<%=request.getContextPath()%>/resources/images/provie/provie_landing_s3_icon_01.png" alt='1' class="img_responsive">
								<h3 class="pv_feature_title">Email</h3>
								<p class="pv_feature_desc hidden-xs"><span class="pv_remark">Have questions or comments for us? Drop us an email at cs.hk@fwd.com and one of our Customer Engagement Representatives will respond to your enquiry as soon as possible.</span></p>
							</div>
						</div>	
						
						<div>
							<div id="claims_inperson" class="col-xs-12 col-sm-4 pv_feature_box text-center">
								<img src="<%=request.getContextPath()%>/resources/images/provie/provie_landing_s3_icon_01.png" alt='1' class="img_responsive">
								<h3 class="pv_feature_title">In Person</h3>
								<p class="pv_feature_desc hidden-xs"><span class="pv_remark">Drop by the nearest FWD Customer Service Centre if you need our service in person. We’ll be happy to help.</span></p> 
							</div>

							<div id="claims_claims" class="col-xs-12 col-sm-4 pv_feature_box text-center">
								<img src="<%=request.getContextPath()%>/resources/images/provie/provie_landing_s3_icon_02.png" alt='2' class="img_responsive">
								<h3 class="pv_feature_title">Claims</h3>
								 <p class="pv_feature_desc hidden-xs">
									<span class="pv_remark">Making a claim has never been easier. We have developed a simple, quick and easy claims process for you. Click here to learn more.</span>
								</p> 
							</div>
						</div>	
						</div> --%>
						<div class="text-center">
			                <h2 class="pv_title"><fmt:message key="medicalguardian.claims" bundle="${medicalguardianMsg}" /></h2>
			            </div>
						<ul id="payment-filter" class="payment-filter hidden-xs nav nav-tabs l_tinynav1" role="tablist">
			                <li role="presentation" class="col-sm-2 col-sm-offset-1 text-center">
			                    <div class="thumbnail">
			                        <div class="caption">
			                            <div class="table">
			                                <a class="table-cell text-center hvr-icon-rotate" href=".call" role="tab" data-toggle="tab">
			                                    <img src="<%=request.getContextPath()%>/resources/images/medicalguardian/claim_icon_01.png" alt="" width="201" height="201">
			                                    <span class="pv_title"><fmt:message key="medicalguardian.claims1" bundle="${medicalguardianMsg}" /></span></a>
			                            </div>
			                        </div>
			                        <div class="pointer"></div>
			                    </div>
			                </li>
			                <li role="presentation" class="col-sm-2 text-center">
			                    <div class="thumbnail">
			                        <div class="caption">
			                            <div class="table">
			                                <a class="table-cell text-center hvr-icon-rotate" href=".live_chat" role="tab" data-toggle="tab">
			                                    <img src="<%=request.getContextPath()%>/resources/images/medicalguardian/claim_icon_02.png" alt="" width="201" height="201">
			                                    <span class="pv_title"><br><fmt:message key="medicalguardian.claims2" bundle="${medicalguardianMsg}" /></span></a>
			                            </div>
			                        </div>
			                        <div class="pointer"></div>
			                    </div>
			                </li>
			                <li role="presentation" class="col-sm-2 text-center">
			                    <div class="thumbnail">
			                        <div class="caption">
			                            <div class="table">
			                                <a class="table-cell text-center hvr-icon-rotate" href=".email" role="tab" data-toggle="tab">
			                                    <img src="<%=request.getContextPath()%>/resources/images/medicalguardian/claim_icon_03.png" alt="" width="201" height="201"> 
			                                    <span class="pv_title"><br><fmt:message key="medicalguardian.claims3" bundle="${medicalguardianMsg}" /></span></a>
			                            </div>
			                        </div>
			                        <div class="pointer"></div>
			                    </div>
			                </li>
			                <li role="presentation" class="col-sm-2 text-center">
			                    <div class="thumbnail">
			                        <div class="caption">
			                            <div class="table">
			                                <a class="table-cell text-center hvr-icon-rotate" href=".in_person" role="tab" data-toggle="tab">
			                                    <img src="<%=request.getContextPath()%>/resources/images/medicalguardian/claim_icon_04.png" alt="" width="201" height="201"> 
			                                    <span class="pv_title"><br><fmt:message key="medicalguardian.claims4" bundle="${medicalguardianMsg}" /></span></a>
			                            </div>
			                        </div>
			                        <div class="pointer"></div>
			                    </div>
			                </li>
			                <li role="presentation" class="col-sm-2 text-center">
			                    <div class="thumbnail">
			                        <div class="caption">
			                            <div class="table">
			                                <a class="table-cell text-center hvr-icon-rotate" href=".claims" role="tab" data-toggle="tab">
			                                    <img src="<%=request.getContextPath()%>/resources/images/medicalguardian/claim_icon_05.png" alt="" width="201" height="201"> 
			                                    <span class="pv_title"><br><fmt:message key="medicalguardian.claims5" bundle="${medicalguardianMsg}" /></span></a>
			                            </div>
			                        </div>
			                        <div class="pointer"></div>
			                    </div>
			                </li>
			            </ul>
				            <div class="btn-group visible-xs">
							  <a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
							    Action
							    <span class="caret"></span>
							  </a>
							  <ul class="dropdown-menu">
							    <!-- dropdown menu links -->
							    <li><a href=".call" role="tab" data-toggle="tab"><fmt:message key="medicalguardian.claims1" bundle="${medicalguardianMsg}" /></a></li>
							    <li><a href=".live_chat" role="tab" data-toggle="tab"><fmt:message key="medicalguardian.claims2" bundle="${medicalguardianMsg}" /></a></li>
							    <li><a href=".email" role="tab" data-toggle="tab"><fmt:message key="medicalguardian.claims3" bundle="${medicalguardianMsg}" /></a></li>
							    <li><a href=".in_person" role="tab" data-toggle="tab"><fmt:message key="medicalguardian.claims4" bundle="${medicalguardianMsg}" /></a></li>
							    <li><a href=".claims" role="tab" data-toggle="tab"><fmt:message key="medicalguardian.claims5" bundle="${medicalguardianMsg}" /></a></li>
							  </ul>
							</div>

			            <div class="tab-content payment-tab">
			                <div role="tabpanel" class="tab-pane call">
			                    <div class="row">
			                        <div class="col-sm-10 col-sm-offset-1">
			                            <div class="content text-center">
			                            	<h2><fmt:message key="medicalguardian.claims1" bundle="${medicalguardianMsg}" /></h2>
			                                <p><fmt:message key="medicalguardian.claims1.1" bundle="${medicalguardianMsg}" /></p>
			                            </div>
			                        </div>
			                    </div>
			                </div>
			                <div role="tabpanel" class="tab-pane live_chat">
			                    <div class="row">
			                        <div class="col-sm-10 col-sm-offset-1">
			                            <div class="content text-center">
			                                <h2><fmt:message key="medicalguardian.claims2" bundle="${medicalguardianMsg}" /></h2>
			                                <p><fmt:message key="medicalguardian.claims2.1" bundle="${medicalguardianMsg}" /></p>
			                                <!-- <a class="btn btn-primary text-uppercase full-width livechat_button">Chat Now</a> -->
			                            </div>
			                        </div>
			                    </div>
			                </div>
			                <div role="tabpanel" class="tab-pane email">
			                    <div class="row">
			                        <div class="col-sm-10 col-sm-offset-1">
			                            <div class="content text-center">
			                                <h2><fmt:message key="medicalguardian.claims3" bundle="${medicalguardianMsg}" /></h2>
			                                <p><fmt:message key="medicalguardian.claims3.1" bundle="${medicalguardianMsg}" /></p>
			                             </div>
			                        </div>
			                    </div>
			                </div>
			                <div role="tabpanel" class="tab-pane in_person">
			                    <div class="row">
			                        <div class="col-sm-10 col-sm-offset-1">
			                            <div class="content text-center">
			                                <h2><fmt:message key="medicalguardian.claims4" bundle="${medicalguardianMsg}" /></h2>
			                                <p><fmt:message key="medicalguardian.claims4.1" bundle="${medicalguardianMsg}" /></p>
											                            
										</div>
			                        </div>
			                    </div>
			                </div>
			                <div role="tabpanel" class="tab-pane claims">
			                    <div class="row">
			                        <div class="col-sm-10 col-sm-offset-1">
			                            <div class="content text-center">
			                               
			                                <h2><fmt:message key="medicalguardian.claims5" bundle="${medicalguardianMsg}" /></h2>
			                                <p><fmt:message key="medicalguardian.claims5.1" bundle="${medicalguardianMsg}" /></p>
			                                <!-- <a href="/en/support-claims/eservices-app" class="btn btn-primary text-uppercase full-width">Learn More</a>    -->                         </div>
			                        </div>
			                    </div>
			                </div>
			
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