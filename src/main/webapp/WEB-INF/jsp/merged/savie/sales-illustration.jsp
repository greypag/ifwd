<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import="com.ifwd.fwdhk.model.HomeQuoteBean"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<c:set var="req" value="${pageContext.request}" />
<c:set var="url">${req.requestURL}</c:set>
<c:set var="uri" value="${req.requestURI}" />
<fmt:setBundle basename="messages" var="msg" />
<!DOCTYPE html>
<script type="text/javascript">
var context = "${pageContext.request.contextPath}";
var languageP = "${language}";
</script>
<html lang="en">
	<head>
		<meta name="apple-mobile-web-app-capable" content="yes" />
	</head>
	<body>
		<%!
			boolean isSaleActiveClass = false;
			boolean isEservicesActiveClass = false;
		%>
		<div class="fwd-savie-wrapper savie-online-container with-breadcrumbs-steps" id="sales-illustration-page">
			<!--BREADCRUMBS-->
			<div class="fwd-container container-fluid breadcrumbs">
	            <div class="breadcrumb-container">
	               <ol class="breadcrumb breadcrumbs-product-details et-breadcrumbs">
	                   <li><a href="#"><fmt:message key="breadcrumb.home" bundle="${msg}" /></a></li>
		               <li class="divider"><i class="fa fa-play"></i></li>
		               <li><a href="#"><fmt:message key="breadcrumb.savie.category" bundle="${msg}" /> </a></li>
		               <li class="divider"><i class="fa fa-play"></i></li>
		               <li><a href="#"><fmt:message key="breadcrumb.savie.insurance.plan" bundle="${msg}" /> </a></li>
		               <li class="divider last"><i class="fa fa-play"></i></i></li>
		               <li class="active-bc" id="et-active-bc-menu"><fmt:message key="breadcrumb.savie.selectplan" bundle="${msg}" /></li>
	               </ol>
	            </div>
	        </div>
	         <!-- STEPS -->
	        <div class="container-fluid fwd-full-container browse-holder">
	            <div class="application-page-header et-header-browse">
	               <div class="browse-container">
	                  <div class="row reset-margin hidden-xs hidden-sm">
	                     <ul class="common-steps-list six-steps nav nav-pills">
	                        <li class="step-number" id="first-step"><button type="button" class="et-header-info-btn active"><span class="status">1</span><fmt:message key="stepindicator.savie.selectplan" bundle="${msg}" /></button></li>
	                        <li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
	                        <li class="step-number"><button type="button" class="et-header-info-btn"><span class="status">2</span><fmt:message key="stepindicator.savie.application" bundle="${msg}" /></button></li>
	                        <li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
	                        <li class="step-number"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">3</span><fmt:message key="stepindicator.savie.summary.declaration" bundle="${msg}" /></button></li>
	                        <li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
	                        <li class="step-number"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">4</span><fmt:message key="stepindicator.savie.sign" bundle="${msg}" /></button></li>
	                        <li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
	                        <li class="step-number"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">5</span><fmt:message key="stepindicator.savie.upload.document" bundle="${msg}" /></button></li>
	                        <li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
	                        <li class="step-number"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">6</span><fmt:message key="stepindicator.savie.confirmation" bundle="${msg}" /></button></li>
	                     </ul>
	                 </div>
	               </div>  
	               <div class="et-mobile-header-info hidden-md hidden-lg">
	                  <div class="clearfix">
	                     <div class="et-back-arrow">
	                        <a href="#" class="back-arrow-link">
	                           <span class="icon-arrow-left2 arrow-left"></span>
	                        </a>
	                     </div>
	                     <div class="et-header-tex">
	                        <h3 id=""><fmt:message key="stepindicator.savie.selectplan" bundle="${msg}" /></h3>
	                     </div>
	                     <p id="step-of">1 of 6</p>
	                  </div>	                   
	               </div>
	            </div>	            	       
	        </div>
	        <div class="container-fluid fwd-full-container mobile-step-indicator visible-xs visible-sm">
	        	<div class="step-indicator-container clearfix">
	               	<ul class="common-step-indicator six-steps nav nav-pills">
                     	<li id="first-step"><a href="#" class="active"><span class="step-no">1</span></a></li>
                     	<li><a href="#"><span class="step-no">2</span></a></li>
                     	<li><a href="#"><span class="step-no">3</span></a></li>
                     	<li><a href="#"><span class="step-no">4</span></a></li>
                     	<li><a href="#"><span class="step-no">5</span></a></li>
                     	<li id="last-step"><a href="#"><span class="step-no">6</span></a></li>
                    </ul>
                    <div class="step-line"></div>
	            </div>
	        </div>
	        <div class="container-fluid fwd-full-container headerStick">
	        	<div class="fwd-container-limit clearfix sidebar" id="sales-illustration-content">	
  					<div class="row">
  						<h3 class="heading-title"><fmt:message key="label.selected.plan" bundle="${msg}" /><span>
  						<a href="<%=request.getContextPath()%>/${language}/savings-insurance/plan-details-sp?type=2"><fmt:message key="label.edit" bundle="${msg}" /></a>
  						</span></h3>
  						
  						<div class="col-xs-12 col-md-6 left-side-form">
  							<div class="gray-bg-data-info">
  								<label class="data-label"><fmt:message key="label.planname" bundle="${msg}" /></label>
  								<p class="data-info"><fmt:message key="savie.landing.savie" bundle="${msg}" /></p>
  							</div>
  							<div class="gray-bg-data-info">
  								<label class="data-label"><fmt:message key="label.saving.amount" bundle="${msg}" /></label>
  								<p class="data-info">HK$ ${saviePlanDetails.insuredAmount1 }</p>
  							</div>
  						</div>
  						<div class="col-xs-12 col-md-6 right-side-form">
  							<div class="gray-bg-data-info">
  								<label class="data-label"><fmt:message key="label.premium.mode" bundle="${msg}" /></label>
  								<p class="data-info">
  								   ${language=='en' ? saviePlanDetails.paymentType=='SP'?'Single premium':saviePlanDetails.paymentType:saviePlanDetails.paymentType=='SP'?'一筆過供款':'月繳供款' }
  								</p>
  							</div>
  						</div>
  					</div>
  					<div class="row" id="sales-input">
  						<h3 class="heading-title"><fmt:message key="label.input.for.sales.illustration" bundle="${msg}" /></h3>
  						<p id="info-note"><span class="asterisk">*</span><fmt:message key="label.input.for.sales.grey.text" bundle="${msg}" /></p>
  						<div class="col-xs-12 col-md-6 left-side-form">
  							<div class="gray-bg-data-info">
  								<label class="data-label"><fmt:message key="label.last.name" bundle="${msg}" /></label>
  								<p class="data-info">${userDetails.lastName }</p>
  							</div>
  							<div class="gray-bg-data-info">
  								<label class="data-label"><fmt:message key="label.given.name" bundle="${msg}" /></label>
  								<p class="data-info">${userDetails.firstName }</p>
  							</div>
  							<div class="gray-bg-data-info hidden">
  								<label class="data-label">label.chinese.name</label>
  								<p class="data-info">陳大文</p>
  								<p class="data-info"> </p>
  							</div>
  						</div>
  						<div class="col-xs-12 col-md-6 right-side-form">
  							<div class="gray-bg-data-info">
  								<label class="data-label"><fmt:message key="label.dob" bundle="${msg}" /></label>
  								<p class="data-info">${savieFna.dob }</p>
  							</div>
  							<div class="gray-bg-data-info">
  								<label class="data-label"><fmt:message key="label.gender" bundle="${msg}" /></label>
  								<p class="data-info">${language=='en' ? savieFna.gender=='0'?'Male':'Female':savieFna.gender=='0'?'男':'女' }</p>
  							</div>
  						</div>       	
		       		 </div>
			        <div class="row" id="pdf-illustration-holder">
			        	<p id="review-note"><fmt:message key="remark.sales.illustration" bundle="${msg}" /></p>
			        </div>
					<div class="modal fade common-welcome-modal" id="sales-illustration-modal" tabindex="-1" role="dialog">
					  <div class="modal-dialog">
						<div class="modal-content">
							<button type="button" class="close visible-xs visible-sm" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
							<div id="pdf-image" class="pdf-image-container">
								<div class="pdf-image-zoom zoom-in"><span class="glyphicon glyphicon-plus"></span></div>
								<div class="pdf-image-zoom zoom-out"><span class="glyphicon glyphicon-minus"></span></div>
								<div class="pdf-image-scroll">
									<img class="pdf-image" data-width="75" src="<%=request.getContextPath()%>/resources/pdf/template/SavieProposalTemplate_${language}.jpg" />
								</div>
							</div>
							<div class="text-center">
								<button class="text-bold btn savie-common-btn" data-dismiss="modal" id="close-btn"><fmt:message key="button.close" bundle="${msg}" /></button>
							</div>	
						</div>
					  </div>
					</div>					
	       		</div>
	       	</div>	 

<!-- 	        <div class="container-fluid fwd-full-container"> -->
<!-- 	        	<div class="fwd-container-limit clearfix sidebar" id="pdf-holder"> -->
<!-- 	        		<div id="pdf"> -->
<!-- 	        			<iframe id="pdf-view" frameborder="0"></iframe> -->
		<div style="width:100%;max-width:960px;margin:40px auto;">
			<div id="pdf-image-frame" class="pdf-image-container" >
				<div class="pdf-image-zoom zoom-in" >
				<span class="glyphicon glyphicon-plus"></span>
				</div>
				<div class="pdf-image-zoom zoom-out">
				<span class="glyphicon glyphicon-minus"></span>
				</div>
				<div class="pdf-image-scroll">
					<img class="pdf-image" data-width="75" src="<%=request.getContextPath()%>/${language}/savings-insurance/imageView/${salesIllustrationJpgName}" />
				</div>
			</div>
		</div>
	        			<!--<a class="embed" id="pdf-view" href="<%=request.getScheme()%>://<%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/resources/pdf/${pdfName}" /></a>-->
<!-- 	        		</div> -->
	        		<div class="text-center">
	        			<p id="print-docu" class="visible-md visible-lg hidden"><span id="print-icon"><img src="<%=request.getContextPath()%>/resources/images/savie-2016/print-icon.png" /></span><a href="#">Print this document</a></p>
	        			<button type="" class="text-bold btn savie-common-btn" id="accept-btn"><fmt:message key="button.accept" bundle="${msg}" /></button>
	        		</div>
<!-- 	        	</div> -->
<!-- 	        </div> -->
			<!-- FOOTER -->
		</div>
		<!-- JS INCLUDES -->
		<script type="text/javascript">
			$("#accept-btn").click(function(){
				window.location = '<%=request.getContextPath()%>/${language}/savings-insurance/${nextPageFlow}';
			});
			$(document).ready(function() {
				pdfImageInit('#pdf-image');
 				pdfImageInit('#pdf-image-frame');
			});
        </script> 
	</body>
</html>	
