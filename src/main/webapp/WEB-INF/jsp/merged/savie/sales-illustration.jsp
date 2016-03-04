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
<html lang="en">
	<head>
        <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/savie-2016/pdfobject.js"></script>
        
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
	                   <li><a href="#">Home</a></li>
		               <li class="divider"><i class="fa fa-play"></i></li>
		               <li><a href="#">Save </a></li>
		               <li class="divider"><i class="fa fa-play"></i></li>
		               <li><a href="#">Savie </a></li>
		               <li class="divider last"><i class="fa fa-play"></i></i></li>
		               <li class="active-bc" id="et-active-bc-menu">Application</li>
	               </ol>
	            </div>
	        </div>
	         <!-- STEPS -->
	        <div class="container-fluid fwd-full-container browse-holder">
	            <div class="application-page-header et-header-browse">
	               <div class="browse-container">
	                  <div class="row reset-margin hidden-xs hidden-sm">
	                     <ul class="common-steps-list six-steps nav nav-pills">
	                        <li class="step-number" id="first-step"><button type="button" class="et-header-info-btn active"><span class="status">1</span>Select plan</button></li>
	                        <li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
	                        <li class="step-number"><button type="button" class="et-header-info-btn"><span class="status">2</span>Application &amp; payment</button></li>
	                        <li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
	                        <li class="step-number"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">3</span>Summary &amp; declaration</button></li>
	                        <li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
	                        <li class="step-number"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">4</span>Signature</button></li>
	                        <li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
	                        <li class="step-number"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">5</span>Document upload</button></li>
	                        <li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
	                        <li class="step-number"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">6</span>Confirmation</button></li>
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
	                        <h3 id="">Select plan</h3>
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
  						<h3 class="heading-title">Your selected plan<span>
  						<a href="<%=request.getContextPath()%>/${language}/savings-insurance/plan-details?type=2">edit</a>
  						</span></h3>
  						
  						<div class="col-xs-12 col-md-6 left-side-form">
  							<div class="gray-bg-data-info">
  								<label class="data-label">Plan name</label>
  								<p class="data-info">Savie</p>
  							</div>
  							<div class="gray-bg-data-info">
  								<label class="data-label">Saving amount</label>
  								<p class="data-info">HK$ ${saviePlanDetails.insuredAmount1 }</p>
  							</div>
  						</div>
  						<div class="col-xs-12 col-md-6 right-side-form">
  							<div class="gray-bg-data-info">
  								<label class="data-label">Premium mode</label>
  								<p class="data-info">${saviePlanDetails.paymentType }</p>
  							</div>
  						</div>
  					</div>
  					<div class="row" id="sales-input">
  						<h3 class="heading-title">Input for sales illustration</h3>
  						<p id="info-note"><span class="asterisk">*</span>These information will become your policy information</p>
  						<div class="col-xs-12 col-md-6 left-side-form">
  							<div class="gray-bg-data-info">
  								<label class="data-label">Last name(same as HKID)</label>
  								<p class="data-info">${userDetails.firstName }</p>
  							</div>
  							<div class="gray-bg-data-info">
  								<label class="data-label">Given name(same as HKID)</label>
  								<p class="data-info">${userDetails.lastName }</p>
  							</div>
  							<div class="gray-bg-data-info hidden">
  								<label class="data-label">Name in Chinese(same as HKID)</label>
  								<p class="data-info">陳大文</p>
  							</div>
  						</div>
  						<div class="col-xs-12 col-md-6 right-side-form">
  							<div class="gray-bg-data-info">
  								<label class="data-label">Date of birth</label>
  								<p class="data-info">${savieFna.dob }</p>
  							</div>
  							<div class="gray-bg-data-info">
  								<label class="data-label">Gender</label>
  								<p class="data-info">${savieFna.gender=='0'?"Male":"Female" }</p>
  							</div>
  						</div>       	
		       		 </div>
			        <div class="row" id="pdf-illustration-holder">
			        	<p id="review-note">Review and accept your sales illustration in order to proceed, you may refer to the <a href="#" data-toggle="modal" data-target="#sales-illustration-modal">sales illustration sample</a> for easy reference.</p>
			        </div>
					<div class="modal fade common-welcome-modal" id="sales-illustration-modal" tabindex="-1" role="dialog">
					  <div class="modal-dialog">
						<div class="modal-content">
							<button type="button" class="close visible-xs visible-sm" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
							<div id="pdf">
								<iframe src="<%=request.getContextPath()%>/resources/pdf/SavieProposalTemplateEng20150810.pdf"  frameborder="0"></iframe>
							</div>
							<div class="text-center">
								<button class="btn savie-common-btn" data-dismiss="modal" id="close-btn">Close</button>
							</div>	
						</div>
					  </div>
					</div>					
	       		</div>
	       	</div>	 
	        <div class="container-fluid fwd-full-container">
	        	<div class="fwd-container-limit clearfix sidebar" id="pdf-holder">
	        		<div id="pdf">
	        			<iframe src="<%=request.getContextPath()%>/resources/pdf/SavieProposalTemplateEng20150810.pdf"  frameborder="0"></iframe>
	        			<!--<object id="pdf-object" data="assets/pdf/SavieProposalTemplateEng20150810.pdf" type="application/pdf" width="100%" height="100%" internalinstanceid="10" title="">
	        				<p>It appears you don't have Adobe Reader or PDF support in this web browser. <a href="assets/pdf/SavieProposalTemplateEng20150810.pdf">Click here to download the PDF</a></p>
	        				<embed id="pdf-object" data="assets/pdf/SavieProposalTemplateEng20150810.pdf" type="application/pdf" width="100%" height="100%" internalinstanceid="10" title="">
						</object>-->
	        		</div>
	        		<div class="text-center">
	        			<p id="print-docu" class="visible-md visible-lg hidden"><span id="print-icon"><img src="<%=request.getContextPath()%>/resources/images/savie-2016/print-icon.png" /></span><a href="#">Print this document</a></p>
	        			<button type="" class="btn savie-common-btn" id="accept-btn">Accept</button>
	        		</div>
	        	</div>
	        </div>
			<!-- FOOTER -->
		</div>
		<!-- JS INCLUDES -->
		<script type="text/javascript">

			window.onload = function (){
				var pdfFile = $('#pdf-object').attr('data');
				var success = new PDFObject({ url: pdfFile }).embed();
			};
			
			$("#accept-btn").click(function(){
				window.location = '<%=request.getContextPath()%>/${language}/savings-insurance/${nextPageFlow}';
			});


        </script> 
	</body>
</html>	
