<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeQuoteBean"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
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
		<div class="fwd-savie-wrapper savie-online-container with-breadcrumbs-steps" id="fatca-page">
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
							<li class="step-number" id="first-step"><button type="button" class="et-header-info-btn completed-step"><i class="fa fa-check"></i><fmt:message key="stepindicator.savie.selectplan" bundle="${msg}" /></button></li>
							<li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
							<li class="step-number"><button type="button" class="et-header-info-btn active"><span class="status">2</span><fmt:message key="stepindicator.savie.application" bundle="${msg}" /></button></li>
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
							<h3 id=""><fmt:message key="stepindicator.savie.application" bundle="${msg}" /></h3>
						 </div>
						 <p id="step-of">2 of 6</p>
					  </div>
				   </div>
				</div>
			</div>
	        <div class="container-fluid fwd-full-container mobile-step-indicator visible-xs visible-sm">
	        	<div class="step-indicator-container clearfix">
	               	<ul class="common-step-indicator six-steps nav nav-pills">
                     	<li id="first-step"><a href="#" class="completed"><i class="fa fa-check"></i></a></li>
                     	<li><a href="#" class="active"><span class="step-no">2</span></a></li>
                     	<li><a href="#"><span class="step-no">3</span></a></li>
                     	<li><a href="#"><span class="step-no">4</span></a></li>
                     	<li><a href="#"><span class="step-no">5</span></a></li>
                     	<li id="last-step"><a href="#"><span class="step-no">6</span></a></li>
                    </ul>
                    <div class="step-line"></div>
	            </div>
	        </div>
	        <div class="container-fluid fwd-full-container headerStick" id="fatca-page-body">
	        	<div class="fwd-container-limit clearfix sidebar">
	  				<div id="fatca-content" class="text-center">
	  					<h3><fmt:message key="info.fatca.copy1" bundle="${msg}" /></h3>
	  					<p id="agreement"><fmt:message key="decleration.fatca.copy1" bundle="${msg}" /></p>
	  					<div id="buttons-holder" class="text-center clearfix">
	  						<button type="button" class="btn savie-common-btn" id="yes-btn"><fmt:message key="button.yes" bundle="${msg}" /></button>
	  						<button type="button" class="btn savie-common-btn" id="no-btn"><fmt:message key="button.no" bundle="${msg}" /></button>
	  					</div>
	  					<div id="condition-holder" class="clearfix pull-right">
	  						<p><fmt:message key="info.fatca.call.hotline" bundle="${msg}" /></p>
	  					</div>
	  				</div>
		        </div>	
	        </div>
	        <div class="modal fade modal-fatca-declaration" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
			  <div class="modal-dialog" id="dialog-fatca-declaration">
				<div class="modal-content common-welcome-modal" id="modal-content-fatca">	
					 <div class="modal-header">
					 <button type="button" class="close" id="close-fatca" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							<p><fmt:message key="label.fatca" bundle="${msg}" /></p>
					 </div>
					 <div class="modal-body" id="modal-body-fatca">
						<ol>
							<li><fmt:message key="declaration.fatca.copy1" bundle="${msg}" /></li>
							<li><fmt:message key="declaration.fatca.copy3" bundle="${msg}" /></li>
							<li><fmt:message key="declaration.fatca.copy4" bundle="${msg}" /></li>
							<li id="fourth-li"><fmt:message key="declaration.fatca.copy5" bundle="${msg}" /></li>
							</ol>
					 </div>
				 </div>
			  </div>
			</div>
			<div class="modal fade modal-us-person" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
			  <div class="modal-dialog" id="dialog-us-person">
				<div class="modal-content common-welcome-modal" id="modal-content-usperson">	
					 <div class="modal-header">
					 <button type="button" class="close" id="close-usopen" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							
					 </div>
					 <div class="modal-body" id="modal-body-usperson">
					 	<fmt:message key="declaration.fatca.copy2" bundle="${msg}" />
					 </div>
				 </div>
			  </div>
			</div>
			<!-- FOOTER -->
		</div>
		<!-- JS INCLUDES -->
		<script type="text/javascript">
			$("#yes-btn").click(function(){
					window.location = '<%=request.getContextPath()%>/${language}/savings-insurance/${nextPageFlow}';
			});
		</script>
	</body>
</html>	
