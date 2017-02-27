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
    <div class="container hide">
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
                <img src="<%=request.getContextPath()%>/resources/images/medicalguardian/medical_guardian_banner_mobile.jpg" class="img-responsive hidden-md hidden-lg" alt="<fmt:message key="jumbo.easyhealth" bundle="${msg}" />">
                <img src="<%=request.getContextPath()%>/resources/images/medicalguardian/medical_guardian_banner_desktop.jpg" class="img-responsive hidden-xs hidden-sm" alt="<fmt:message key="jumbo.easyhealth" bundle="${msg}" />">
                <div class="fwd-container-limit">

                <%-- <form id="o2o-landing-form" action="<%=request.getContextPath()%>/${language}/${nextPageFlow}" method="post">
                    <div class="img-banner-text savie-landing">
                        <div id="clearfix-height-rp">
                            <button id="op-buy-now-O2O-mobile" class="savie-regular-btn start-btn"><fmt:message key="button.quote.easyhealth" bundle="${msg}" /></button>
                        </div>
                    <div class="savie-product text-bold">
                        <a href="<%=request.getContextPath()%>/<fmt:message key="link.brochure.easyhealth" bundle="${msg}" />" target="_blank"><fmt:message key="label.brochure" bundle="${msg}" /></a> | <a href="<%=request.getContextPath()%>/<fmt:message key="link.provisions.easyhealth" bundle="${msg}" />" target="_blank"><fmt:message key="label.provisions" bundle="${msg}" /></a>
                    </div>
                    </div>
                </form> --%>
                </div>
            </div>
        </div>
        
	    	
	    	
	    	<div id="pv_calculator" class="">
	    	<%-- <a href="" data-toggle="modal" data-target="#contactUsModal" >
	    	TEST contactUsModal
								<span class="glyphicon glyphicon-pencil" aria-hidden="true" id="edit"></span>
			</a> --%>
	    	<div id="loadingDiv" class="waitingDiv" style="display: none; margin-left:auto; margin-right:auto;">
				<img style="width: 300px; height: 300px;"
					src="<%=request.getContextPath()%>/resources/images/loading.gif">
			</div>
	    		<div class="container">
		    		<div class="row hidden-xs hidden-sm">
			    		<div class="col-xs-12 text-center div-container">
			    			<h2 class="pv_title content-wrapper">
			    				<span><fmt:message key="medicalguardian.cal.title" bundle="${medicalguardianMsg}" /></span>
			    				<span class="pv_highlight"><fmt:message key="medicalguardian.cal.title.1" bundle="${medicalguardianMsg}" /></span>
			    				<br>
			    				<span><fmt:message key="medicalguardian.cal.title.2" bundle="${medicalguardianMsg}" /></span>
			    			</h2>
			    		</div>
			    		<div class="div-container">
				    		<div class="col-xs-2 col-xs-offset-1 div-box selectDiv centreDiv noPadding">
								<label class="" for="Gender"><fmt:message key="medicalguardian.cal.form.gender" bundle="${medicalguardianMsg}" /></label>
								<%-- <img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class=""> --%>
								
								<span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>
								<select name="Gender" id="type-of-gender" class="type-of-gender" data-bv-field="Gender" >
									<option value="0" data-val="Male"><fmt:message key="medicalguardian.cal.form.gender.male" bundle="${medicalguardianMsg}" /></option>
									<option value="1" data-val="Female"><fmt:message key="medicalguardian.cal.form.gender.female" bundle="${medicalguardianMsg}" /></option>
									<option value="2" data-val="Empty" selected disabled class="hide" hidden></option>
								</select>
				    		</div>
				    		<div class="col-xs-2 div-box selectDiv centreDiv noPadding">
								<label class="" for="dob"><fmt:message key="medicalguardian.cal.form.birthday" bundle="${medicalguardianMsg}" /></label>
								<%-- <img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class=""> --%>
								<span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>
								<%-- <select name="dob" id="day-of-birth" class="" data-bv-field="dob" >
									<option value="" data-val="">1</option>
									<option value="" data-val="">2</option>
									<option value="" data-val="" selected>3</option>
									<option value=""  data-val="">4</option>
								</select> --%>
								<input name="plan-dob" id="plan-dob-datepicker" value="" class="mobiscroll-datepicker" /> 
				    		</div>
				    		<div class="col-xs-2 div-box selectDiv centreDiv noPadding">
								<label class="" for="Habit"><fmt:message key="medicalguardian.cal.form.habit" bundle="${medicalguardianMsg}" /></label>
								<%-- <img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class=""> --%>
								<span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>
								<select name="Habit" id="type-of-habit" class="type-of-habit" data-bv-field="Habit" >
									<option value="1" data-val=""><fmt:message key="medicalguardian.cal.form.habit.positive" bundle="${medicalguardianMsg}" /></option>
									<option value="0" data-val=""><fmt:message key="medicalguardian.cal.form.habit.negative" bundle="${medicalguardianMsg}" /></option>
									<option value="2" data-val="" selected disabled class="hide" hidden></option>
								</select>
				    		</div>
				    		<div class="col-xs-2 div-box selectDiv centreDiv noPadding">
								<label class="promotion_code_label" for="Code"><fmt:message key="medicalguardian.cal.form.promotion.code" bundle="${medicalguardianMsg}" /></label>
								<input class="promotion_code_input" type="text" name="Code" maxlength="10" placeholder="e.g.: FWD678">
				    			<a id="btn_input_code" class="btn btn-primary text-uppercase livechat_button btn_input_code">></a>
				    		</div>
				    		<div id="FirstYear" class="col-xs-2 div-box selectDiv centreDiv relative noPadding">
								<label class="" for="Code"><fmt:message key="medicalguardian.cal.form.first.year" bundle="${medicalguardianMsg}" /></label><br>
								<label class="bold premium_price" for="Code">HK$1000</label>
								<label><fmt:message key="medicalguardian.cal.form.per.month" bundle="${medicalguardianMsg}" /></label>
				    		</div>
				    		<div class="col-xs-12 text-center content-wrapper">
				    			<span class="pv_remark"><fmt:message key="medicalguardian.cal.remark" bundle="${medicalguardianMsg}" /></span>
				    		</div>
				    		<div class="col-xs-12 content-wrapper text-center">
				    			<a class="btn btn-primary text-uppercase livechat_button" href="<%=request.getContextPath()%>/${language}/${nextPageFlow}"><fmt:message key="medicalguardian.cal.apply.now" bundle="${medicalguardianMsg}" /></a>
				    		</div>
				    		<div class="col-xs-12 wh_p_btns-gp text-center content-wrapper">
	            				<a id="dlProductFacesheet" class="dlProductBrochure" href=""  target="_blank" data-category="PDF Dowload" data-action="" data-label="" ><i class="fa fa-download" aria-hidden="true"></i><fmt:message key="medicalguardian.schedule.product.factsheet" bundle="${medicalguardianMsg}" /></a>
	            				<a id="dlProductProvisions" class="dlProductBrochure" href=""  target="_blank" data-category="PDF Dowload" data-action="" data-label="" ><i class="fa fa-download" aria-hidden="true"></i><fmt:message key="medicalguardian.schedule.policy.provisions" bundle="${medicalguardianMsg}" /></a>
		            		</div>
			    		</div>
		    		</div>
		    		<div id="mobile-form" class="visible-xs visible-sm">
		    			<div class="col-xs-12 text-center div-container">
			    			<h2 class="pv_title content-wrapper">
			    				<span><fmt:message key="medicalguardian.cal.title" bundle="${medicalguardianMsg}" /></span>
			    				<span class="pv_highlight"><fmt:message key="medicalguardian.cal.title.1" bundle="${medicalguardianMsg}" /></span>
			    				<br>
			    				<span><fmt:message key="medicalguardian.cal.title.2" bundle="${medicalguardianMsg}" /></span>
			    			</h2>
			    		</div>
			    		<div class="col-xs-2 div-box selectDiv">
							<label class="" for="Gender"><fmt:message key="medicalguardian.cal.form.gender" bundle="${medicalguardianMsg}" /></label>
							<img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="hidden-xs hidden-sm">
							<select name="Gender" id="type-of-gender" class="type-of-gender" data-bv-field="Gender" disabled>
								<option value="0" data-val="Male"><fmt:message key="medicalguardian.cal.form.gender.male" bundle="${medicalguardianMsg}" /></option>
								<option value="1" data-val="Female"><fmt:message key="medicalguardian.cal.form.gender.female" bundle="${medicalguardianMsg}" /></option>
								<option value="2" data-val="Empty" selected disabled class="hide" hidden></option>
							</select>
			    		</div>
			    		<div class="col-xs-4 div-box selectDiv">
							<label class="" for="dob"><fmt:message key="medicalguardian.cal.form.birthday" bundle="${medicalguardianMsg}" /></label>
							<img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="hidden-xs hidden-sm">
							<%-- <select name="dob" id="day-of-birth" class="mobiscroll-datepicker" data-bv-field="dob" disabled>
								<option value="" data-val="">1</option>
								<option value="" data-val="">2</option>
								<option value="" data-val="" selected>3</option>
								<option value=""  data-val="">4</option>
							</select> --%>
							<span  id="plan-dob-datepicker" class="mobiscroll-datepicker" /></span>

			    		</div>
			    		<div class="col-xs-4 div-box selectDiv">
							<label class="" for="Habit"><fmt:message key="medicalguardian.cal.form.habit" bundle="${medicalguardianMsg}" /></label>
							<img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="hidden-xs hidden-sm">
							<select name="Habit" id="type-of-habit" class="type-of-habit" data-bv-field="Habit" disabled>
								<option value="1" data-val=""><fmt:message key="medicalguardian.cal.form.habit.positive" bundle="${medicalguardianMsg}" /></option>
								<option value="0" data-val=""><fmt:message key="medicalguardian.cal.form.habit.negative" bundle="${medicalguardianMsg}" /></option>
								<option value="2" data-val="" selected disabled class="hide" hidden></option>
							</select>
			    		</div>
			    		<div class="col-xs-2 div-box selectDiv">
			    			<a href="" data-toggle="modal" data-target="#quoteModal" >
								<span class="glyphicon glyphicon-pencil" aria-hidden="true" id="edit"></span>
							</a>
			    		</div>
			    		
			    		<div id="div_mobile_promotion_code" class="col-xs-12 div-box selectDiv centreDiv">
								<label class="promotion_code_label" for="Code"><fmt:message key="medicalguardian.cal.form.promotion.code" bundle="${medicalguardianMsg}" /></label>
								<input class="promotion_code_input" type="text" name="Code" maxlength="10" placeholder="e.g.: FWD678">
				    			<a id="btn_input_code" class="btn btn-primary text-uppercase livechat_button btn_input_code">></a>
				    	</div>
				    	
				    	<div id="FirstYear" class="col-xs-8 bold">
								<label class="" for="Code"><fmt:message key="medicalguardian.cal.form.first.year" bundle="${medicalguardianMsg}" /></label>
								<br>
								<label id="price" class="premium_price" for="Code">HK$1000</label>
								<span><fmt:message key="medicalguardian.cal.form.per.month" bundle="${medicalguardianMsg}" /></span>
				    	</div>
			    		<div class="col-xs-4 content-wrapper text-center" id="btn_cal_apply_mobile">
				    			<a class="btn btn-primary text-uppercase livechat_button" href="<%=request.getContextPath()%>/${language}/${nextPageFlow}"><fmt:message key="medicalguardian.cal.apply.now" bundle="${medicalguardianMsg}" /></a>
				    	</div>
			    		
			    		
			    		<div class="col-xs-12 wh_p_btns-gp text-center content-wrapper">
	            			<a id="dlProductFacesheet" class="dlProductBrochure" href=""  target="_blank" data-category="PDF Dowload" data-action="" data-label="" ><i class="fa fa-download" aria-hidden="true"></i><fmt:message key="medicalguardian.schedule.product.factsheet" bundle="${medicalguardianMsg}" /></a>
	            			<a id="dlProductProvisions" class="dlProductBrochure" href=""  target="_blank" data-category="PDF Dowload" data-action="" data-label="" ><i class="fa fa-download" aria-hidden="true"></i><fmt:message key="medicalguardian.schedule.policy.provisions" bundle="${medicalguardianMsg}" /></a>
		            	</div>
		    		</div>
	    		</div>
	    	</div>
	    	
	    	<div id="sticky-control">
		    	<div id="div-sticky" class="sticky visible-xs visible-sm">
		    		<div class="sticky-container">
		    			<div id="prompt" class="col-xs-10 text-center">
		    				<span class="pv_title bold" id="quoteModalLabel"><fmt:message key="medicalguardian.how.much.would.this.cost" bundle="${medicalguardianMsg}" /></span>
		    			</div>
		    			<div class="col-xs-2 text-center">
					    	<button class="btn btn-primary " data-toggle="modal" data-target="#quoteModal">
							  	<%-- <fmt:message key="medicalguardian.sticky.quote.now" bundle="${medicalguardianMsg}" /> --%>
							  	>
							</button>
						</div>
					</div>
				</div>
				
				<div id="desktop-div-sticky" class="sticky visible-md visible-lg">
					<div id="deskstoploadingDiv" class="waitingDiv" style="display: none; margin-left:auto; margin-right:auto;">
						 <img style="width: 50px; height: 50px; padding-top: 10px;"
							src="<%=request.getContextPath()%>/resources/images/medicalguardian/desktop-loading.gif"> 
					</div>
		    		<div class="sticky-container">
		    			<div class="col-xs-2 div-box selectDiv centreDiv">
							<label class="" for="Gender"><fmt:message key="medicalguardian.cal.form.gender" bundle="${medicalguardianMsg}" /></label>
							<%-- <img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class=""> --%>
							<span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>
							<select name="Gender" id="type-of-gender" class="type-of-gender" data-bv-field="Gender" >
								<option value="0" data-val="Male"><fmt:message key="medicalguardian.cal.form.gender.male" bundle="${medicalguardianMsg}" /></option>
								<option value="1" data-val="Female"><fmt:message key="medicalguardian.cal.form.gender.female" bundle="${medicalguardianMsg}" /></option>
								<option value="2" data-val="Empty" selected disabled class="hide" hidden></option>
							</select>
			    		</div>
		    			<div class="col-xs-2 div-box selectDiv centreDiv">
							<label class="" for="dob"><fmt:message key="medicalguardian.cal.form.birthday" bundle="${medicalguardianMsg}" /></label>
							<%-- <img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class=""> --%>
							<span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>
							<%-- <select name="dob" id="day-of-birth" class="" data-bv-field="dob" >
								<option value="" data-val="">1</option>
								<option value="" data-val="">2</option>
								<option value="" data-val="" selected>3</option>
								<option value=""  data-val="">4</option>
							</select> --%>
							<input name="plan-dob" id="plan-dob-datepicker" value="" class="mobiscroll-datepicker" /> 
			    		</div>
			    		<div class="col-xs-2 div-box selectDiv centreDiv">
							<label class="" for="Habit"><fmt:message key="medicalguardian.cal.form.habit" bundle="${medicalguardianMsg}" /></label>
							<%-- <img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class=""> --%>
							<span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>
							<select name="Habit" id="type-of-habit" class="type-of-habit" data-bv-field="Habit" >
								<option value="1" data-val=""><fmt:message key="medicalguardian.cal.form.habit.positive" bundle="${medicalguardianMsg}" /></option>
								<option value="0" data-val=""><fmt:message key="medicalguardian.cal.form.habit.negative" bundle="${medicalguardianMsg}" /></option>
								<option value="2" data-val="" selected disabled class="hide" hidden></option>
							</select>
			    		</div>
			    		<div class="col-xs-2 div-box selectDiv centreDiv">
							<label class="promotion_code_label" for="Code"><fmt:message key="medicalguardian.cal.form.promotion.code" bundle="${medicalguardianMsg}" /></label>
							<input class="promotion_code_input" type="text" name="Code" maxlength="10" placeholder="e.g.: FWD678">
			    			<a id="btn_input_code" class="btn btn-primary text-uppercase livechat_button btn_input_code">></a>
			    		</div>
			    		<div id="FirstYear" class="col-xs-2 div-box selectDiv centreDiv relative">
							<label class="" for="Code"><fmt:message key="medicalguardian.cal.form.first.year" bundle="${medicalguardianMsg}" /></label><br>
							<label class="bold premium_price" for="Code">HK$1000</label>
							<label><fmt:message key="medicalguardian.cal.form.per.month" bundle="${medicalguardianMsg}" /></label>
			    		</div>
			    		<div class="col-xs-2 content-wrapper text-center">
			    			<a class="btn btn-primary text-uppercase livechat_button" href="<%=request.getContextPath()%>/${language}/${nextPageFlow}"><fmt:message key="medicalguardian.cal.apply.now" bundle="${medicalguardianMsg}" /></a>
			    		</div>
					</div>
				</div>
			</div>
			
			
	    	<!-- Quote Modal -->
			<div class="modal fade" id="quoteModal" tabindex="-1" role="dialog" aria-labelledby="quoteModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			    	<div id="quoteloadingDiv" class="waitingDiv" style="display: none; margin-left:auto; margin-right:auto;">
						<img style="width: 300px; height: 300px;"
							src="<%=request.getContextPath()%>/resources/images/loading.gif">
					</div>
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			        <h2 class="pv_title" id="quoteModalLabel"><fmt:message key="medicalguardian.how.much.would.this.cost" bundle="${medicalguardianMsg}" /></h2>
			      </div>
			      <div class="modal-body row-fluid">
				        <div class="col-xs-6 div-box selectDiv">
				        	<div class="item-wrapper">
								<label class="" for="Gender"><fmt:message key="medicalguardian.cal.form.gender" bundle="${medicalguardianMsg}" /></label>
								<img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="">
								<select name="Gender" id="type-of-gender" class="type-of-gender" data-bv-field="Gender" >
									<option value="0" data-val="Male"><fmt:message key="medicalguardian.cal.form.gender.male" bundle="${medicalguardianMsg}" /></option>
									<option value="1" data-val="Female"><fmt:message key="medicalguardian.cal.form.gender.female" bundle="${medicalguardianMsg}" /></option>
									<option value="2" data-val="Empty" selected disabled class="hide" hidden></option>
								</select>
							</div>
			    		</div>
			    		<div class="col-xs-6  div-box selectDiv">
			    			<div class="item-wrapper">
								<label class="" for="Habit"><fmt:message key="medicalguardian.cal.form.habit" bundle="${medicalguardianMsg}" /></label>
								<img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="">
								<select name="Habit" id="type-of-habit" class="type-of-habit" data-bv-field="Habit" >
									<option value="1" data-val=""><fmt:message key="medicalguardian.cal.form.habit.positive" bundle="${medicalguardianMsg}" /></option>
									<option value="0" data-val=""><fmt:message key="medicalguardian.cal.form.habit.negative" bundle="${medicalguardianMsg}" /></option>
									<option value="2" data-val="" selected disabled class="hide" hidden></option>
								</select>
							</div>
			    		</div>
			    		<div class="col-xs-12 div-box selectDiv">
			    			<div class="item-wrapper">
								<label class="" for="dob"><fmt:message key="medicalguardian.cal.form.birthday" bundle="${medicalguardianMsg}" /></label>
								<img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="">
								<input name="plan-dob" id="plan-dob-datepicker" value="" class="mobiscroll-datepicker" />
							</div>
			    		</div>
			    		
			    		<div id="div_mobile_promotion_code" class="col-xs-12 div-box selectDiv centreDiv div-box">
			    			<div class="item-wrapper">
								<label class="promotion_code_label" for="Code"><fmt:message key="medicalguardian.cal.form.promotion.code" bundle="${medicalguardianMsg}" /></label>
								<input class="promotion_code_input" type="text" name="Code" maxlength="10" placeholder="e.g.: FWD678">
				    			<a id="btn_input_code" class="btn btn-primary text-uppercase livechat_button btn_input_code">></a>
				    		</div>
				    	</div>
				    	
				    	<div id="FirstYear" class="col-xs-12 bold div-box">
				    		<div class="item-wrapper">
				    			<div>
									<label class="" for="Code"><fmt:message key="medicalguardian.cal.form.first.year" bundle="${medicalguardianMsg}" /></label>
								</div>
								<div>
								<label id="price" class="premium_price" for="Code">HK$1000</label>
								<label id="price" class="" for="Code"><fmt:message key="medicalguardian.cal.form.per.month" bundle="${medicalguardianMsg}" /></label>
				    			</div>
				    		</div>
				    	</div>
			    		<div id="btn_quote" class="col-xs-12 content-wrapper text-center">
				    			<a class="btn btn-primary text-uppercase livechat_button" href="<%=request.getContextPath()%>/${language}/${nextPageFlow}"><fmt:message key="medicalguardian.quote.now" bundle="${medicalguardianMsg}" /></a>
				    	</div>
				    
			      </div>
			      <div class="modal-footer">
			       <!--  <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			        <button type="button" class="btn btn-primary">Save changes</button> -->
			      </div>
			    </div>
			  </div>
			</div>
				    	
			
			<!-- Contact Us Modal -->
			<div class="modal fade" id="contactUsModal" tabindex="-1" role="dialog" aria-labelledby="contactUsModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			        <h2 class="pv_title" id="contactUsModalLabel"><fmt:message key="medicalguardian.contactus.title" bundle="${medicalguardianMsg}" /></h2>
			      </div>
			      <div class="modal-body row-fluid">
					        <p class="pv_desc bold"><fmt:message key="medicalguardian.contactus.desc" bundle="${medicalguardianMsg}" /></p>
					        <p class="pv_desc">
					       		<fmt:message key="medicalguardian.contactus.desc1" bundle="${medicalguardianMsg}" />
					      	</p> 
					          <hr>
					          
					          
					          <form name="form-appointment-register" id="form-appointment-register" method="post">
									<div class="form-group">
										<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
											<input type="text" name="fullName" class="form-control gray-textbox check-emp login-input mdl-textfield__input" id="appointmentRegisterFullName" data-keyblock-alphabet-space="true" autocomplete="off" maxlength="100">
											<label class="mdl-textfield__label" for="appointmentRegisterFullName"><fmt:message key="medicalguardian.contactus.fullname" bundle="${medicalguardianMsg}" /></label>
										</div>
										<span class="error-msg FullNameErrMsg"></span>
									</div>
									<div class="form-group" data-toggle="popover" data-placement="top" data-trigger="focus" data-content="Insurance certificate will be sent to this email address">
										<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
											<input type="text" name="EmailAddress" class="form-control gray-textbox check-emp login-input mdl-textfield__input" id="appointmentRegisterEmailAddress">
											<label class="mdl-textfield__label" for="appointmentRegisterEmailAddress"><fmt:message key="medicalguardian.contactus.email" bundle="${medicalguardianMsg}" /></label>
										</div>
										<span class="error-msg EmailAddressErrMsg"></span>
									</div>
									<div class="form-group">
										<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
											<input type="tel" name="mobileNo" class="form-control gray-textbox check-emp login-input mdl-textfield__input" id="appointmentRegisterMobileNo" data-keyblock-num="true">
											<label class="mdl-textfield__label" for="appointmentRegisterMobileNo"><fmt:message key="medicalguardian.contactus.contactnumber" bundle="${medicalguardianMsg}" /></label>
										</div>
										<span class="error-msg mobileNoErrMsg"></span>
									</div> 
									<div class="form-group">
										<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-upgraded is-dirty">
											<input id="hiddenInputBox" value="1" type="tel" name="contactTime" class="form-control gray-textbox check-emp login-input mdl-textfield__input" id="appointmentRegisterMobileNo" data-keyblock-num="true" style="visibility:hidden">
											<select name="contactTime" id="contact-time" class="" data-bv-field="contact-time" >
												<option value="" data-val=""><fmt:message key="medicalguardian.contactus.morning" bundle="${medicalguardianMsg}" /></option>
												<option value="" data-val="" selected><fmt:message key="medicalguardian.contactus.afternoon" bundle="${medicalguardianMsg}" /></option>
												<option value="" data-val=""><fmt:message key="medicalguardian.contactus.evening" bundle="${medicalguardianMsg}" /></option>
											</select>
											<span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>
											<%-- <img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg"> --%>
											<label class="mdl-textfield__label" id="preferedtimeLabel" for="appointmentRegisterMobileNo"><fmt:message key="medicalguardian.contactus.preferedtime" bundle="${medicalguardianMsg}" /></label>
										</div>
										<span class="error-msg mobileNoErrMsg"></span>
									</div>
									
									<div class="declaration">
										<div class="form-group">
											<div class="checkbox">
												<input id="checkbox1" name="checkbox1" type="checkbox" class="">
												<label for="checkbox1" id="checkboxLabel">
													<fmt:message key="medicalguardian.contactus.checkbox" bundle="${medicalguardianMsg}" />
												</label>
											</div>							
											<span class="error-msg checkbox1ErrMsg"></span>
										</div>
										<hr>
									</div>
									<%-- <div class="login-button-group text-center">
										<button type="button" class="btn-primary js-btn-submit" id="btn-appointment-register">register.cta.activate</button>
										<span class="error-msg regPanErrMsg"></span>
									</div> --%>
									<div id="btn_quote" class="col-xs-12 content-wrapper text-center">
							    		<a class="btn btn-primary text-uppercase livechat_button">Submit</a>
							    	</div>
						    </form>
				    
			      </div>
			      <div class="modal-footer">
			       <!--  <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			        <button type="button" class="btn btn-primary">Save changes</button> -->
			      </div>
			    </div>
			  </div>
			</div>
			
			
	    	
        <!-- Feature -->
	        <div id="pv_feature">
	        	<div class="container">
	        		<div class="row">
		        		<div class="col-xs-12 text-center">
		       				<h2 class="pv_title content-wrapper"><fmt:message key="medicalguardian.feature.title" bundle="${medicalguardianMsg}" /></h2>
	       					<p>
	       					<fmt:message key="medicalguardian.feature.title.desc" bundle="${medicalguardianMsg}" />
	       					</p>
		        		</div>
	        		</div>
	        	</div>
	        	<div class="container">
	        	<!-- <h2 class="pv_title text-center">Flexible and affordable, giving you smart and seamless coverage.<br/>Plan early and you too can go full steam ahead with no worries!</h2> -->
	        	<!-- Full Online Application -->
	        		 <div role="tabpanel" class="tab-pane active" id="">
						<div class="panel-group" id="" role="tablist" aria-multiselectable="true">
							<div class="panel panel-default pd-sf-sale-illustration-sample-panel">
							   <div class="panel-heading" role="tab" id="pd-sf-product-related" data-toggle="collapse" data-target="#collapseCover">
								  <h4 class="panel-title hidden-sm hidden-md hidden-lg">
									 <a class="collapsed" role="button" data-toggle="collapse" data-parent="" href="#collapseCover" aria-expanded="true" aria-controls="collapseCover">
									 	<img src="<%=request.getContextPath()%>/resources/images/medicalguardian/s1_icon_01.png" alt=""> 
									 	<fmt:message key="medicalguardian.feature.1.title" bundle="${medicalguardianMsg}" />
										<span class="pull-right  hidden-md hidden-lg">
											<span class="glyphicon glyphicon-chevron-up" aria-hidden="true"></span>
										</span>
									 </a>
								  </h4>
							   </div>
							   <div id="collapseCover" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="pd-sf-product-related">
								  	<div class="panel-body">
								  		<div class="row">
									  		<div class="col-xs-3 col-sm-2 hidden-xs displayTableCell">
									  		<img src="<%=request.getContextPath()%>/resources/images/medicalguardian/s1_icon_01.png" alt=""> 
									  		</div>
									  		<div class="col-sm-4 hidden-xs displayTableCell">
									  		<span class="pv_title"><fmt:message key="medicalguardian.feature.1.title" bundle="${medicalguardianMsg}" /></span>
									  		</div>
									  		<div class="col-xs-12 col-sm-6 displayTableCell">
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
							   <div class="panel-heading" role="tab" id="pd-sf-product-related" data-toggle="collapse" data-target="#collapseAddon">
								  <h4 class="panel-title hidden-sm hidden-md hidden-lg">
									 <a class="collapsed" role="button" data-toggle="collapse" data-parent="" href="#collapseAddon" aria-expanded="true" aria-controls="collapseAddon">
										<img src="<%=request.getContextPath()%>/resources/images/medicalguardian/s1_icon_02.png" alt=""> 
										<fmt:message key="medicalguardian.feature.2.title" bundle="${medicalguardianMsg}" />
										<span class="pull-right  hidden-md hidden-lg">
										   <span class="glyphicon glyphicon-chevron-up" aria-hidden="true"></span>
										</span>
									 </a>
								  </h4>
							   </div>
							   <div id="collapseAddon" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="pd-sf-product-related">
								  	<div class="panel-body">
								  		<div class="row">
									  		<div class="col-xs-3 col-sm-2 hidden-xs displayTableCell">
									  		<img src="<%=request.getContextPath()%>/resources/images/medicalguardian/s1_icon_02.png" alt="">
									  		</div>
									  		<div class="col-sm-4 hidden-xs displayTableCell">
									  		<span class="pv_title"><fmt:message key="medicalguardian.feature.2.title" bundle="${medicalguardianMsg}" /></span>
									  		</div>
									  		<div class="col-xs-12 col-sm-6 displayTableCell">
									  			<ul>
									  				<li><fmt:message key="medicalguardian.feature.2.1" bundle="${medicalguardianMsg}" /></li>
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
							   <div class="panel-heading" role="tab" id="pd-sf-product-related" data-toggle="collapse" data-target="#collapseCoverPeriods">
								  <h4 class="panel-title hidden-sm hidden-md hidden-lg">
									 <a class="collapsed" role="button" data-toggle="collapse" data-parent="" href="#collapseCoverPeriods" aria-expanded="true" aria-controls="collapseCoverPeriods">
										<img src="<%=request.getContextPath()%>/resources/images/medicalguardian/s1_icon_03.png" alt=""> 
										<fmt:message key="medicalguardian.feature.3.title" bundle="${medicalguardianMsg}" />
										<span class="pull-right  hidden-md hidden-lg">
										   <span class="glyphicon glyphicon-chevron-up" aria-hidden="true"></span>
										</span>
									 </a>
								  </h4>
							   </div>
							   <div id="collapseCoverPeriods" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="pd-sf-product-related">
								  	<div class="panel-body">
								  		<div class="row">
									  		<div class="col-xs-3 col-sm-2 hidden-xs displayTableCell">
									  		<img src="<%=request.getContextPath()%>/resources/images/medicalguardian/s1_icon_03.png" alt="">
									  		</div>
									  		<div class="col-sm-4 hidden-xs displayTableCell">
									  		<span class="pv_title"><fmt:message key="medicalguardian.feature.3.title" bundle="${medicalguardianMsg}" /></span>
									  		</div>
									  		<div class="col-xs-12 col-sm-6 displayTableCell">
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
							   <div class="panel-heading" role="tab" id="pd-sf-product-related" data-toggle="collapse" data-target="#collapseExtraSup">
								  <h4 class="panel-title hidden-sm hidden-md hidden-lg">
									 <a class="collapsed" role="button" data-toggle="collapse" data-parent="" href="#collapseExtraSup" aria-expanded="true" aria-controls="collapseExtraSup">
										<img src="<%=request.getContextPath()%>/resources/images/medicalguardian/s1_icon_04.png" alt=""> 
										<fmt:message key="medicalguardian.feature.4.title" bundle="${medicalguardianMsg}" />
										<span class="pull-right  hidden-md hidden-lg">
										   <span class="glyphicon glyphicon-chevron-up" aria-hidden="true"></span>
										</span>
									 </a>
								  </h4>
							   </div>
							   <div id="collapseExtraSup" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="pd-sf-product-related">
								  	<div class="panel-body">
								  		<div class="row">
									  		<div class="col-xs-3 col-sm-2 hidden-xs displayTableCell">
									  		<img src="<%=request.getContextPath()%>/resources/images/medicalguardian/s1_icon_04.png" alt="">
									  		</div>
									  		<div class="col-sm-4 hidden-xs displayTableCell">
									  		<span class="pv_title"><fmt:message key="medicalguardian.feature.4.title" bundle="${medicalguardianMsg}" /></span>
									  		</div>
									  		<div class="col-xs-12 col-sm-6 displayTableCell">
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
							   <div class="panel-heading" role="tab" id="pd-sf-product-related" data-toggle="collapse" data-target="#collapseOneStop">
								  <h4 class="panel-title hidden-sm hidden-md hidden-lg">
									 <a class="collapsed" role="button" data-toggle="collapse" data-parent="" href="#collapseOneStop" aria-expanded="true" aria-controls="collapseOneStop">
										<img src="<%=request.getContextPath()%>/resources/images/medicalguardian/s1_icon_05.png" alt=""> 
										<fmt:message key="medicalguardian.feature.5.title" bundle="${medicalguardianMsg}" />
										<span class="pull-right  hidden-md hidden-lg">
										   <span class="glyphicon glyphicon-chevron-up" aria-hidden="true"></span>
										</span>
									 </a>
								  </h4>
							   </div>
							   <div id="collapseOneStop" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="pd-sf-product-related">
								  	<div class="panel-body">
								  		<div class="row">
									  		<div class="col-xs-3 col-sm-2 hidden-xs displayTableCell">
									  		<img src="<%=request.getContextPath()%>/resources/images/medicalguardian/s1_icon_05.png" alt="">
									  		</div>
									  		<div class="col-sm-4 hidden-xs displayTableCell">
									  		<span class="pv_title"><fmt:message key="medicalguardian.feature.5.title" bundle="${medicalguardianMsg}" /></span>
									  		</div>
									  		<div class="col-xs-12 col-sm-6 displayTableCell">
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
							   <div class="panel-heading" role="tab" id="pd-sf-product-related" data-toggle="collapse" data-target="#collapseTil100">
								  <h4 class="panel-title hidden-sm hidden-md hidden-lg">
									 <a class="collapsed" role="button" data-toggle="collapse" data-parent="" href="#collapseTil100" aria-expanded="true" aria-controls="collapseTil100">
										<img src="<%=request.getContextPath()%>/resources/images/medicalguardian/s1_icon_06.png" alt=""> 
										<fmt:message key="medicalguardian.feature.6.title" bundle="${medicalguardianMsg}" />
										<span class="pull-right  hidden-md hidden-lg">
										   <span class="glyphicon glyphicon-chevron-up" aria-hidden="true"></span>
										</span>
									 </a>
								  </h4>
							   </div>
							   <div id="collapseTil100" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="pd-sf-product-related">
								  	<div class="panel-body">
								  		<div class="row">
									  		<div class="col-xs-3 col-sm-2 hidden-xs displayTableCell">
									  		<img src="<%=request.getContextPath()%>/resources/images/medicalguardian/s1_icon_06.png" alt="">
									  		</div>
									  		<div class="col-sm-4 hidden-xs displayTableCell">
									  		<span class="pv_title"><fmt:message key="medicalguardian.feature.6.title" bundle="${medicalguardianMsg}" /></span>
									  		</div>
									  		<div class="col-xs-12 col-sm-6 displayTableCell">
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
				<h2 class="pv_title text-center"><fmt:message key="medicalguardian.schedule.subtitle" bundle="${medicalguardianMsg}" /></h2>
				<div role="tabpanel" class="tab-pane active" id="pd-sf-sale-illustration-sample-pane">
					<div class="panel-group" id="pd-sf-sale-illustration-sample-group" role="tablist" aria-multiselectable="true">
						<div class="panel panel-default pd-sf-sale-illustration-sample-panel">
						   
						   <div id="collapseSchedule" class="panel-collapse collapse" role="tabpanel" aria-labelledby="pd-sf-product-related">
							  <div class="panel-body">
								<div class="row">
								 
						<!-- Schedule Table Start -->
						<!-- left col -->
							<div class="col-xs-12 col-sm-6">
							<!-- Plan Level -->
							<div class="col-xs-12">
									<div class="col-xs-12">
										<span class="pv_title"><fmt:message key="medicalguardian.schedule.plan.level" bundle="${medicalguardianMsg}" /></span>
									</div>
									<div class="col-xs-12 gray-divide"></div>
									<div class="col-xs-12">
										<span class="pv_item"><fmt:message key="medicalguardian.schedule.plan.level.text" bundle="${medicalguardianMsg}" /></span>
									</div>
								</div>
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
										<span class="pv_title"><fmt:message key="medicalguardian.schedule.additional.cancer.benefit.title" bundle="${medicalguardianMsg}" /></span>
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
									<div class="col-xs-9">
										<span class="pv_item"><fmt:message key="medicalguardian.schedule.additional.benefit.text" bundle="${medicalguardianMsg}" /></span>
									</div>
									<div class="col-xs-3">
										<span class="pv_price"><fmt:message key="medicalguardian.schedule.once.per.policy" bundle="${medicalguardianMsg}" /></span>
									</div>
									<div class="col-xs-9">
										<span class="pv_item"><fmt:message key="medicalguardian.schedule.additional.benefit.text1" bundle="${medicalguardianMsg}" /></span>
									</div>
									<div class="col-xs-3">
										<span class="pv_price"><fmt:message key="medicalguardian.schedule.3.per.policy" bundle="${medicalguardianMsg}" /></span>
									</div>
									<div class="col-xs-9">
										<span class="pv_item"><fmt:message key="medicalguardian.schedule.additional.benefit.text2" bundle="${medicalguardianMsg}" /></span>
									</div>
									<div class="col-xs-3">
										<span class="pv_price"><fmt:message key="medicalguardian.schedule.once.per.policy" bundle="${medicalguardianMsg}" /></span>
									</div>
									<div class="col-xs-9">
										<span class="pv_item"><fmt:message key="medicalguardian.schedule.additional.benefit.text3" bundle="${medicalguardianMsg}" /></span>
									</div>
									<div class="col-xs-3">
										<span class="pv_price"><fmt:message key="medicalguardian.schedule.once.per.policy" bundle="${medicalguardianMsg}" /></span>
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
									<p class="pv_remark"><fmt:message key="medicalguardian.schedule.remark" bundle="${medicalguardianMsg}" /></p>
												<ol>
													<li><p class="pv_remark"><fmt:message key="medicalguardian.schedule.remark1" bundle="${medicalguardianMsg}" /></p></li>
													<li><p class="pv_remark"><fmt:message key="medicalguardian.schedule.remark2" bundle="${medicalguardianMsg}" /></p></li>
													<li><p class="pv_remark"><fmt:message key="medicalguardian.schedule.remark3" bundle="${medicalguardianMsg}" /></p></li>
													<li><fmt:message key="medicalguardian.schedule.remark4" bundle="${medicalguardianMsg}" />
													<ol class="no_order">
														<li><fmt:message key="medicalguardian.schedule.remark4.1" bundle="${medicalguardianMsg}" /></li>
														<li><fmt:message key="medicalguardian.schedule.remark4.2" bundle="${medicalguardianMsg}" /></li>
													</ol>
													<fmt:message key="medicalguardian.schedule.remark4.3" bundle="${medicalguardianMsg}" />
													</li>
													<li><fmt:message key="medicalguardian.schedule.remark5" bundle="${medicalguardianMsg}" />
													<ol class="no_order">
														<li><fmt:message key="medicalguardian.schedule.remark5.1" bundle="${medicalguardianMsg}" /></li>
														<li><fmt:message key="medicalguardian.schedule.remark5.2" bundle="${medicalguardianMsg}" /></li>
													</ol>
													<fmt:message key="medicalguardian.schedule.remark5.3" bundle="${medicalguardianMsg}" />
													</li>
													<li><fmt:message key="medicalguardian.schedule.remark6" bundle="${medicalguardianMsg}" />
													<ol class="no_order">
														<li><fmt:message key="medicalguardian.schedule.remark6.1" bundle="${medicalguardianMsg}" /></li>
														<li><fmt:message key="medicalguardian.schedule.remark6.2" bundle="${medicalguardianMsg}" /></li>
													</ol>
													<fmt:message key="medicalguardian.schedule.remark6.3" bundle="${medicalguardianMsg}" />
													</li>
													<li><p class="pv_remark"><fmt:message key="medicalguardian.schedule.remark7" bundle="${medicalguardianMsg}" /></p></li>
													<li><p class="pv_remark"><fmt:message key="medicalguardian.schedule.remark8" bundle="${medicalguardianMsg}" /></p></li>
													<li><p class="pv_remark"><fmt:message key="medicalguardian.schedule.remark9" bundle="${medicalguardianMsg}" /></p></li>
													<li><p class="pv_remark"><fmt:message key="medicalguardian.schedule.remark10" bundle="${medicalguardianMsg}" /></p></li>
													<li><p class="pv_remark"><fmt:message key="medicalguardian.schedule.remark11" bundle="${medicalguardianMsg}" /></p></li>
													<li><p class="pv_remark"><fmt:message key="medicalguardian.schedule.remark12" bundle="${medicalguardianMsg}" /></p></li>
													<li><p class="pv_remark"><fmt:message key="medicalguardian.schedule.remark13" bundle="${medicalguardianMsg}" /></p></li>
												</ol>
									   		</div>
										</div>
									</div>
									<div class="panel-heading" role="tab" id="pd-sf-product-related">
									  <h4 class="panel-title">
										 <a id="collapsedExpandSpan" class="collapsed" role="button" data-toggle="collapse" data-parent="#pd-sf-sale-illustration-sample-group" href="#collapseSchedule" aria-expanded="false" aria-controls="collapseSchedule">
										 	<span class="pv_title"> 
										 	+ <br><br>
											<fmt:message key="medicalguardian.schedule.expand" bundle="${medicalguardianMsg}" />
											</span>
											<span class="pull-right hidden-xs hidden-sm hidden-md hidden-lg">
											   <span class="glyphicon glyphicon-chevron-up" aria-hidden="true"></span>
											</span>
										 </a>
									  </h4>
								   </div>
								</div>
							</div>				
						</div>
				</div> <!-- Container End -->
			</div>
            
			<div id="plan-details-sample-and-faq" class="container">
				<%-- <div id="pd-sf-tabs-container" class="container-fluid content-container-fluid">
				   <ul id="pd-sf-nav-tabs" class="nav nav-tabs" role="tablist">
						<li class="pd-sf-tab text-center active" role="presentation">
							<a href="#pd-sf-sale-illustration-sample-pane" class="bold" aria-controls="pd-sf-sale-illustration-sample-pane" role="tab" data-toggle="tab"><fmt:message key="medicalguardian.tab.risks" bundle="${medicalguardianMsg}" /></a>
						</li>
						<!-- <li class="pd-sf-tab pd-sf-tab-right text-center" role="presentation">
							<a href="#pd-sf-glossary-pane" class="bold" aria-controls="pd-sf-faq-and-glossary-pane" role="tab" data-toggle="tab">Glossary</a>
						</li> -->
				   </ul>
				</div> --%>
				<!-- <div class="pd-sf-divider"></div> -->
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
											   <span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>
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
											   <span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>
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
									  	
									  </div>
								   </div>
								</div>
								<div class="panel panel-default pd-sf-sale-illustration-sample-panel">
								   <div class="panel-heading" role="tab" id="pd-sf-claim-related">
									  <h4 class="panel-title">
										 <a class="collapsed" role="button" data-toggle="collapse" data-parent="#pd-sf-faq-and-glossary-group" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
											<fmt:message key="medicalguardian.adjustment" bundle="${medicalguardianMsg}" />
											<span class="pull-right">
											   <span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>
											</span>
										 </a>
									  </h4>
								   </div>
								   <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="pd-sf-claim-related">
									  <div class="panel-body">
									  	<div>
									  		<p><span class="pv_title"><fmt:message key="medicalguardian.adjustment" bundle="${medicalguardianMsg}" /></span></p>
											<p><span class=""><fmt:message key="medicalguardian.adjustment.1" bundle="${medicalguardianMsg}" /></span></p>
									  	</div>
									  	<br/>
									  </div>
								   </div>
								</div>
								<div class="panel panel-default pd-sf-sale-illustration-sample-panel">
								   <div class="panel-heading" role="tab" id="pd-sf-claim-related">
									  <h4 class="panel-title">
										 <a class="collapsed" role="button" data-toggle="collapse" data-parent="#pd-sf-faq-and-glossary-group" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
											<fmt:message key="medicalguardian.term" bundle="${medicalguardianMsg}" />
											<span class="pull-right">
											   <span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>
											</span>
										 </a>
									  </h4>
								   </div>
								   <div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="pd-sf-claim-related">
									  <div class="panel-body">
									  	<div>
									  		<p><span class="pv_title"><fmt:message key="medicalguardian.term" bundle="${medicalguardianMsg}" /></span></p>
											<p><span class=""><fmt:message key="medicalguardian.term.1" bundle="${medicalguardianMsg}" /></span></p>
											<p><span class=""><fmt:message key="medicalguardian.term.2" bundle="${medicalguardianMsg}" /></span></p>
									  	</div>
									  	<br/>
									  </div>
								   </div>
								</div>
								<div class="panel panel-default pd-sf-sale-illustration-sample-panel">
								   <div class="panel-heading" role="tab" id="pd-sf-claim-related">
									  <h4 class="panel-title">
										 <a class="collapsed" role="button" data-toggle="collapse" data-parent="#pd-sf-faq-and-glossary-group" href="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
											<fmt:message key="medicalguardian.condition" bundle="${medicalguardianMsg}" />
											<span class="pull-right">
											   <span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>
											</span>
										 </a>
									  </h4>
								   </div>
								   <div id="collapseFive" class="panel-collapse collapse" role="tabpanel" aria-labelledby="pd-sf-claim-related">
									  <div class="panel-body">
									  	<div>
									  		<p><span class="pv_title"><fmt:message key="medicalguardian.condition" bundle="${medicalguardianMsg}" /></span></p>
											<p><span class=""><fmt:message key="medicalguardian.condition1" bundle="${medicalguardianMsg}" /></span></p>
											<ol class="no_order">
												<li><span class=""><fmt:message key="medicalguardian.condition1.1" bundle="${medicalguardianMsg}" /></span></li>
												<li><span class=""><fmt:message key="medicalguardian.condition1.2" bundle="${medicalguardianMsg}" /></span></li>
												<li><span class=""><fmt:message key="medicalguardian.condition1.3" bundle="${medicalguardianMsg}" /></span></li>
												<li><span class=""><fmt:message key="medicalguardian.condition1.4" bundle="${medicalguardianMsg}" /></span></li>
												<li><span class=""><fmt:message key="medicalguardian.condition1.5" bundle="${medicalguardianMsg}" /></span></li>
												<li><span class=""><fmt:message key="medicalguardian.condition1.6" bundle="${medicalguardianMsg}" /></span></li>
												<li><span class=""><fmt:message key="medicalguardian.condition1.7" bundle="${medicalguardianMsg}" /></span></li>
												<li><span class=""><fmt:message key="medicalguardian.condition1.8" bundle="${medicalguardianMsg}" /></span></li>
												<li><span class=""><fmt:message key="medicalguardian.condition1.9" bundle="${medicalguardianMsg}" /></span></li>
												<li><span class=""><fmt:message key="medicalguardian.condition1.10" bundle="${medicalguardianMsg}" /></span></li>
											</ol>
									  	</div>
									  	<br/>
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
						<div class="text-center">
			                <h2 class="pv_title"><fmt:message key="medicalguardian.claims" bundle="${medicalguardianMsg}" /></h2>
			            </div>
						<ul id="payment-filter" class="payment-filter hidden-xs nav nav-tabs l_tinynav1" role="tablist">
			                <li role="presentation" class="col-sm-2 col-sm-offset-1 text-center">
			                    <div class="thumbnail" data-toggle="tab" data-target=".call">
			                        <div class="caption">
			                            <div class="table">
			                                <a class="table-cell text-center hvr-icon-rotate" href="#" role="tab">
			                                    <img src="<%=request.getContextPath()%>/resources/images/medicalguardian/claim_icon_01.png" alt="" width="201" height="201">
			                                    <span class="pv_title line-height-normal"><fmt:message key="medicalguardian.claims1" bundle="${medicalguardianMsg}" /></span></a>
			                            </div>
			                        </div>
			                        <div class="pointer"></div>
			                    </div>
			                </li>
			                <li role="presentation" class="col-sm-2 text-center aligntop">
			                    <div class="thumbnail" data-toggle="tab" data-target=".live_chat">
			                        <div class="caption">
			                            <div class="table">
			                                <a class="table-cell text-center hvr-icon-rotate" href="#" role="tab">
			                                    <img src="<%=request.getContextPath()%>/resources/images/medicalguardian/claim_icon_02.png" alt="" width="201" height="201">
			                                    <span class="pv_title"><fmt:message key="medicalguardian.claims2" bundle="${medicalguardianMsg}" /></span></a>
			                            </div>
			                        </div>
			                        <div class="pointer"></div>
			                    </div>
			                </li>
			                <li role="presentation" class="col-sm-2 text-center aligntop active">
			                    <div class="thumbnail" data-toggle="tab" data-target=".email">
			                        <div class="caption">
			                            <div class="table">
			                                <a class="table-cell text-center hvr-icon-rotate" href="#" role="tab">
			                                    <img src="<%=request.getContextPath()%>/resources/images/medicalguardian/claim_icon_03.png" alt="" width="201" height="201"> 
			                                    <span class="pv_title"><fmt:message key="medicalguardian.claims3" bundle="${medicalguardianMsg}" /></span></a>
			                            </div>
			                        </div>
			                        <div class="pointer"></div>
			                    </div>
			                </li>
			                <li role="presentation" class="col-sm-2 text-center aligntop">
			                    <div class="thumbnail" data-toggle="tab" data-target=".in_person">
			                        <div class="caption">
			                            <div class="table">
			                                <a class="table-cell text-center hvr-icon-rotate" href="#" role="tab">
			                                    <img src="<%=request.getContextPath()%>/resources/images/medicalguardian/claim_icon_04.png" alt="" width="201" height="201"> 
			                                    <span class="pv_title"><fmt:message key="medicalguardian.claims4" bundle="${medicalguardianMsg}" /></span></a>
			                            </div>
			                        </div>
			                        <div class="pointer"></div>
			                    </div>
			                </li>
			                <li role="presentation" class="col-sm-2 text-center aligntop">
			                    <div class="thumbnail" data-toggle="tab" data-target=".claims">
			                        <div class="caption">
			                            <div class="table">
			                                <a class="table-cell text-center hvr-icon-rotate" href="#" role="tab" >
			                                    <img src="<%=request.getContextPath()%>/resources/images/medicalguardian/claim_icon_05.png" alt="" width="201" height="201"> 
			                                    <span class="pv_title"><fmt:message key="medicalguardian.claims5" bundle="${medicalguardianMsg}" /></span></a>
			                            </div>
			                        </div>
			                        <div class="pointer"></div>
			                    </div>
			                </li>
			            </ul>
				            <div class="btn-group visible-xs">
							  <a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
							   <span id="claimsAction"><fmt:message key="medicalguardian.claims3" bundle="${medicalguardianMsg}" /></span>
							    <span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>
							  </a>
							  <ul class="dropdown-menu">
							    <!-- dropdown menu links -->
							    <li><a href="#" data-target=".call" role="tab" data-toggle="tab"><fmt:message key="medicalguardian.claims1" bundle="${medicalguardianMsg}" /></a></li>
							    <li><a href="#" data-target=".live_chat" role="tab" data-toggle="tab"><fmt:message key="medicalguardian.claims2" bundle="${medicalguardianMsg}" /></a></li>
							    <li><a href="#" data-target=".email" role="tab" data-toggle="tab"><fmt:message key="medicalguardian.claims3" bundle="${medicalguardianMsg}" /></a></li>
							    <li><a href="#" data-target=".in_person" role="tab" data-toggle="tab"><fmt:message key="medicalguardian.claims4" bundle="${medicalguardianMsg}" /></a></li>
							    <li><a href="#" data-target=".claims" role="tab" data-toggle="tab"><fmt:message key="medicalguardian.claims5" bundle="${medicalguardianMsg}" /></a></li>
							  </ul>
							</div>

			            
            		</div>
            	</div>
            </div>
            
            <div id="actionTab" class="tab-content payment-tab text-center">
               <div role="tabpanel" class="tab-pane call">
                   <div class="row">
                       <div class="col-sm-10 col-sm-offset-1">
                           <div class="content text-center">
                           	<img class="visible-xs" src="<%=request.getContextPath()%>/resources/images/medicalguardian/claim_icon_01.png" alt="">
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
                           <img class="visible-xs" src="<%=request.getContextPath()%>/resources/images/medicalguardian/claim_icon_02.png" alt="">
                               <h2><fmt:message key="medicalguardian.claims2" bundle="${medicalguardianMsg}" /></h2>
                               <p><fmt:message key="medicalguardian.claims2.1" bundle="${medicalguardianMsg}" /></p>
                               <!-- <a class="btn btn-primary text-uppercase full-width livechat_button">Chat Now</a> -->
                           </div>
                       </div>
                   </div>
               </div>
               <div role="tabpanel" class="tab-pane email active">
                   <div class="row">
                       <div class="col-sm-10 col-sm-offset-1">
                           <div class="content text-center">
                           <img class="visible-xs" src="<%=request.getContextPath()%>/resources/images/medicalguardian/claim_icon_03.png" alt="">
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
                           <img class="visible-xs" src="<%=request.getContextPath()%>/resources/images/medicalguardian/claim_icon_04.png" alt="">
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
                              <img class="visible-xs" src="<%=request.getContextPath()%>/resources/images/medicalguardian/claim_icon_05.png" alt="">
                               <h2><fmt:message key="medicalguardian.claims5" bundle="${medicalguardianMsg}" /></h2>
                               <p><fmt:message key="medicalguardian.claims5.1" bundle="${medicalguardianMsg}" /></p>
                               <!-- <a href="/en/support-claims/eservices-app" class="btn btn-primary text-uppercase full-width">Learn More</a>    -->                         </div>
                       </div>
                   </div>
               </div>
           </div>
            
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
	$('#pv_claims .dropdown-menu li a').click(function(){
		$('#claimsAction').text($(this).text());
	});
	$('#collapsedExpandSpan').click(function () {
		var that = this;
		setTimeout(function (){
			if($(that).hasClass('collapsed'))
			{
			    $(that).html("+<br><br><fmt:message key='medicalguardian.schedule.expand' bundle='${medicalguardianMsg}' />"); 
			}
			else
			{      
			    $(that).html("-<br><br><fmt:message key='medicalguardian.schedule.collapse' bundle='${medicalguardianMsg}' />"); 
			}
			},500); 
	});
});
</script>

<script src="<%=request.getContextPath()%>/resources/js/mobiscroll.custom-2.17.2.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/js/mobiscroll.i18n.en_fwd.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/js/mobiscroll.i18n.zh_fwd.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/js/medical-guardian/uifn-landing.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/medical-guardian/jquery.inview.min.js"></script>

