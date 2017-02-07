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
var documentUploadNextPageFlow = "${nextPageFlow}";
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
		<div class="fwd-savie-wrapper savie-online-container with-breadcrumbs-steps headerStick" id="upload-document-page">	   <!-- HEADER -->
		
			<!-- Breadcrumb Component Start-->
    		<div class="container container-fluid container--breadcrumb">

			    <c:set var="breadcrumbItems" value="breadcrumb.item.home" /> 
				<c:set var="breadcrumbActive" value="0" />

			    <c:if test="${planIndex == 'medical-insurance'}">
			    	<c:set var="breadcrumbItems">
			    		breadcrumb.item.home,breadcrumb.item.protect,breadcrumb.item.health,breadcrumb.item.easyhealth,breadcrumb.item.application
					</c:set>
			    	<c:set var="breadcrumbActive">4</c:set>
			    </c:if>
			    <c:if test="${planIndex == 'savings-insurance'}">
			    	<c:set var="breadcrumbItems">
			    		breadcrumb.item.home,breadcrumb.item.save,breadcrumb.item.savie,breadcrumb.item.application
			    	</c:set>
			    	<c:set var="breadcrumbActive">3</c:set>
			    </c:if>

			    <jsp:include page="/WEB-INF/jsp/merged/comp/breadcrumb.jsp">
			    	<jsp:param name="breadcrumbItems" value="${breadcrumbItems}"/>
			    	<jsp:param name="breadcrumbActive" value="${breadcrumbActive}"/>
				</jsp:include>
			</div>
			<!-- Breadcrumb Component End-->

			<!-- StepIndicator Component Start-->

		     	<c:set var="stepItems" value="stepindicator.selectplan" /> 
				<c:set var="stepActive" value="0" />
                
				<c:if test="${planIndex == 'medical-insurance'}">
			    	<c:set var="stepItems">
			    		stepindicator.selectplan,stepindicator.application.summary.declaration,stepindicator.sign,stepindicator.payment,stepindicator.upload.document,stepindicator.confirmation
					</c:set>
			    	<c:set var="stepActive">4</c:set>
			    </c:if>
			    <c:if test="${plan == 'medical-insurance/cansurance'}">
			    	<c:set var="stepItems">
			    		stepindicator.selectplan,stepindicator.application.summary.declaration,stepindicator.sign,stepindicator.payment,stepindicator.upload.document,stepindicator.confirmation
					</c:set>
			    	<c:set var="stepActive">4</c:set>
			    </c:if>
			    <c:if test="${planIndex == 'savings-insurance'}">
			    	<c:set var="stepItems">
			    		stepindicator.selectplan,stepindicator.application,stepindicator.summary.declaration,stepindicator.sign,stepindicator.upload.document,stepindicator.confirmation
			    	</c:set>
			    	<c:set var="stepActive">4</c:set>
			    </c:if>

			     <!--<div class="container-fluid fwd-full-container browse-holder">-->
			        <jsp:include page="/WEB-INF/jsp/merged/comp/step-indicator.jsp">
			        	<jsp:param name="stepItems" value="${stepItems}"/>
		    			<jsp:param name="stepActive" value="${stepActive}"/>
			    	</jsp:include>
			     <!--</div>-->

			<!-- StepIndicator Component End-->

			<!-- UPLOAD DOCUMENT BLOCK -->
			<div id="so-upload-document-section">
				<div class="container-fluid fwd-container up-doc-page">
					<div class="fwd-container-limit clearfix sidebar personal-info-widget page-application et-application-page document-upload">
						<h4 class="so-h4"><fmt:message key="label.select.document.title" bundle="${msg}" /></h4>
						<div class="radio-group clearfix">
							<div class="row">
								<div class="col-md-6" id="nowUpload" style="display: none;">
									<div class="row">
										<div class="col-xs-1">
											<div class="pull-left radio-holder" >
												<input type="radio" id="upload-now-radio" name="upload" value="true" checked=""> <label for="upload-now-radio"></label>
											</div>
										</div>
										<div class="col-xs-11">
											<div class="text-bold pull-left desc">
												<fmt:message key="option.upload.now" bundle="${msg}" />
												<span>
													<c:if test="${planIndex == 'savings-insurance'}">
					        							<fmt:message key="msg.upload.savie.copy1" bundle="${msg}" />
					        						</c:if>
						        					<c:if test="${planIndex == 'medical-insurance'}">
					        							<fmt:message key="msg.upload.easyhealth.copy1" bundle="${msg}" />
					        						</c:if>
												</span>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-6" id="latterUpload" style="display:none;">
									<div class="row">
										<div class="col-xs-1">
											<div class="pull-left radio-holder" >
												<input type="radio" id="upload-later-radio" name="upload" value="false"> <label for="upload-later-radio"></label>
											</div>
										</div>
										<div class="col-xs-11">
											<div class="text-bold pull-left desc">
												<fmt:message key="option.upload.later" bundle="${msg}" />
												<span class="uplater-span">
													<c:if test="${planIndex == 'savings-insurance'}">
					        							<fmt:message key="msg.upload.savie.copy2" bundle="${msg}" />
					        						</c:if>
						        					<c:if test="${planIndex == 'medical-insurance'}">
					        							<fmt:message key="msg.upload.easyhealth.copy2" bundle="${msg}" />
					        						</c:if>
												</span>
											</div>
										</div>
									</div>
								</div>
							</div>
						
						  <!--div class="radio-button-group">
							 <div class="clearfix desktop-align left">
								<div class="pull-left radio-holder">
								   <input type="radio" id="upload-now-radio" name="upload" value="true" checked /> <label for="upload-now-radio"></label>
								</div>
								<div class="text-bold pull-left desc">
								   <fmt:message key="option.upload.now" bundle="${msg}" />
								   <span>
									   <c:if test="${planIndex == 'savings-insurance'}">
		        							<fmt:message key="msg.upload.savie.copy1" bundle="${msg}" />
		        						</c:if>
			        					<c:if test="${planIndex == 'medical-insurance'}">
		        							<fmt:message key="msg.upload.easyhealth.copy1" bundle="${msg}" />
		        						</c:if>
								   </span>
								</div>
							 </div>
							 <div class="clearfix below desktop-align">
								<div class="pull-left radio-holder">
								   <input type="radio" id="upload-later-radio" name="upload" value="false" /> <label for="upload-later-radio"></label>
								</div>
								<div class="text-bold pull-left desc">
								   <fmt:message key="option.upload.later" bundle="${msg}" />
								   <span class="uplater-span">
								   		<c:if test="${planIndex == 'savings-insurance'}">
		        							<fmt:message key="msg.upload.savie.copy2" bundle="${msg}" />
		        						</c:if>
			        					<c:if test="${planIndex == 'medical-insurance'}">
		        							<fmt:message key="msg.upload.easyhealth.copy2" bundle="${msg}" />
		        						</c:if>
								   </span>
								</div>
							 </div>
						  </div-->
					   </div>
						<div class="upload-later-section hidden" id="upload-later-section">
							<div class="description">
								<p class="first-desc"><fmt:message key="msg.upload.savie.copy4" bundle="${msg}" /></p>
								<ol>
									<c:if test="${planIndex == 'savings-insurance'}">
	        							<li><fmt:message key="msg.upload.savie.copy5" bundle="${msg}" /></li>
										<li><fmt:message key="msg.upload.savie.copy6" bundle="${msg}" /></li>
	        						</c:if>
		        					<c:if test="${planIndex == 'medical-insurance'}">
	        							<li><fmt:message key="msg.upload.easyhealth.copy5" bundle="${msg}" /></li>
										<li><fmt:message key="msg.upload.easyhealth.copy6" bundle="${msg}" /></li>
	        						</c:if>
								</ol>
							</div>
						</div>
						<div class="upload-now-section" id="upload-now-section">
							<div class="clearfix">
								<div class="left-desktop check-box">
								   <div class="checkbox-section">
									  <div class="clearfix">
										 <div class="pull-left left-checkbox">
											<input type="checkbox" value="None" id="hkPermanentRes" name="hkPermanentRes" />
											<label for="hkPermanentRes"></label>
										 </div>
										 <div class="pull-left right-checkbox">
											<span class="text-bold checkbox-text"><fmt:message key="label.hk.permanent.resident" bundle="${msg}" /></span>
										 </div>
									  </div>
								   </div>
								</div>
							</div>
							<div class="row upload-now-row" id="hidden-ie9">
								<div class="col-xs-12 col-md-4 so-upload upload-hkid">
									<h5 class="so-h5"><fmt:message key="label.hkid" bundle="${msg}" /></h5>
									<h6 class="so-h6 upload-bottom"><fmt:message key="label.upload.your.hkid" bundle="${msg}" /></h6>
									<form action="upload-documents" id="hkid-upload-form" class="upload-form">
										<div class="finish-upload hidden" id="finish-upload-hkid">
											<div class="center-align">
												<span class="finish-upload-check"></span>
											</div>
										</div>
										<input type="file" id="fileToUpload-hkid-dragAndDrop" class="hidden" accept="application/pdf,image/gif,image/jpeg,image/jpg,image/png" />
										<div class="select-file-hkid select-zone" id="hkid-drop-zone" for="fileToUpload-hkid-dragAndDrop">
											<div class="finish-upload hidden" id="finish-upload-hkid">
												<div class="center-align">
													<span class="finish-upload-check"></span>
												</div>
											</div>
											<div class="select-file-section" id="select-file-section">
												<div class="mob hidden-md hidden-lg">
													<label for="hkidFileToUploadCam" class="mobile-camera-pic-file">
														<span class="drag-cam">
															<i class="fa fa-camera"></i>
														</span>
													</label>
												</div>
												<div class="desk hidden-xs hidden-sm">
													<fmt:message key="label.upload.box.copy" bundle="${msg}" />
												</div>
												<!--  <![endif]-->
												<div class="mob-desk or">
													<span class="OR"><fmt:message key="label.icon.or" bundle="${msg}" /></span>
												</div>
												<div class="mob-desk">
													<label for="hkidFileToUpload" class="orange-select-file">
														<input type="file" id="hkidFileToUpload" accept="application/pdf,image/gif,image/jpeg,image/jpg,image/png" onchange="fileSelected('hkid-copy-progress','hkidFileToUpload','hkid-docu-filename','hkid-docu-fileSize','finish-upload-hkid','hkid-upload-percent-text','hkid-upload-progress-bar','', '#so-hkid-file-message');" />
														<span class="input-file-text"><fmt:message key="button.select.files" bundle="${msg}" /></span>
													</label>
												</div>
											</div>
										</div>
										<input type="reset" class="sr-only" />
									</form>
									<span class="err-msg" id="so-hkid-file-message"></span>
									<div class="document-upload-progress hidden" id="hkid-copy-progress">
										<div class="clearfix">
											<div class="pull-left">
												<span id="hkid-docu-filename">Yourfiles.pdf </span><span id="hkid-docu-fileSize">(319.50 mb)</span>
											</div>
											<div class="pull-right">
												<button type="button" class="upload-cancel-btn" id="cancel-upload-btn" onclick="cancelUpload('hkid-copy-progress','finish-upload-hkid','hkid-upload-progress-bar','hkid-upload-percent-text')">
													<span class="upload-cancel"></span>
												</button>
											</div>
										</div>
										<div class="progress">
											<div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width:0%" id="hkid-upload-progress-bar">
											</div>
										</div>
										<p class="upload-text">Uploading: <span id="hkid-upload-percent-text">0%</span></p>
									</div>
								</div>
								<div class="col-xs-12 col-md-4 so-upload" id="passport-section" style="">
									<h5 class="so-h5"><fmt:message key="label.passport.copy" bundle="${msg}" /></h5>
									<h6 class="so-h6 upload-bottom"><fmt:message key="label.passport.copy.des" bundle="${msg}" /></h6>
									<form action="upload-documents" id="passport-upload-form" method="POST" class="upload-form">
										<div class="finish-upload hidden" id="finish-upload-passport">
											<div class="center-align">
												<span class="finish-upload-check"></span>
											</div>
										</div>
										<input type="file" id="fileToUpload-passport-dragAndDrop" class="hidden" accept="application/pdf,image/gif,image/jpeg,image/jpg,image/png" />
										<div class="select-file-passport select-zone" id="passport-drop-zone" for="fileToUpload-passport-dragAndDrop">
											<div class="finish-upload hidden" id="finish-upload-passport">
												<div class="center-align">
													<span class="finish-upload-check"></span>
												</div>
											</div>
											<div class="select-file-section" id="select-file-section">
												<div class="mob hidden-md hidden-lg">
													<label for="passportFileToUpload" class="mobile-camera-pic-file">
														<span class="drag-cam">
															<i class="fa fa-camera"></i>
														</span>
													</label>
												</div>
												<div class="desk hidden-xs hidden-sm">
													<fmt:message key="label.upload.box.copy" bundle="${msg}" />
												</div>
												<![endif]-->
												<div class="mob-desk or">
													<span class="OR"><fmt:message key="label.icon.or" bundle="${msg}" /></span>
												</div>
												<div class="mob-desk">
													<label for="passportFileToUpload" class="orange-select-file">
														<input type="file" id="passportFileToUpload" accept="application/pdf,image/gif,image/jpeg,image/jpg,image/png" onchange="fileSelected('passport-copy-progress','passportFileToUpload','passport-docu-filename','passport-docu-fileSize','finish-upload-passport','passport-upload-percent-text','passport-upload-progress-bar','', '#so-passport-file-message');" />
														<span class="input-file-text"><fmt:message key="button.select.files" bundle="${msg}" /></span>
													</label>
												</div>
											</div>
										</div>
										<input type="reset" class="sr-only"/>
									</form>
									<span class="err-msg" id="so-passport-file-message"></span>
									<div class="document-upload-progress hidden" id="passport-copy-progress">
										<div class="clearfix">
											<div class="pull-left">
												<span id="passport-docu-filename">Yourfiles.pdf </span><span id="passport-docu-fileSize">(319.50 mb)</span>
											</div>
											<div class="pull-right">
												<button type="button" class="upload-cancel-btn" id="cancel-upload-btn" onclick="cancelUpload('passport-copy-progress','finish-upload-passport','passport-upload-progress-bar','passport-upload-percent-text')">
													<span class="upload-cancel"></span>
												</button>
											</div>
										</div>
										<div class="progress">
											<div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width:0%" id="passport-upload-progress-bar">
											</div>
										</div>
										<p class="upload-text">Uploading: <span id="passport-upload-percent-text">0%</span></p>
									</div>
								</div>
								<div class="col-xs-12 col-md-4 so-upload" id="proof-address-holder">
									<h5 class="so-h5"><fmt:message key="label.proof.of.address" bundle="${msg}" /></h5>
									<h6 class="so-h6"><fmt:message key="label.upload.address.proof.copy1" bundle="${msg}" />
										<span class="text-bold upload-h6"><a href="#" class="text-bold upload-link" data-toggle="modal" data-target=".modal-address-prof"><fmt:message key="label.upload.address.proof.copy2" bundle="${msg}" /></a> <fmt:message key="label.upload.address.proof.copy3" bundle="${msg}" /></span>
									</h6>
									<form action="" id="js-upload-form" method="POST" class="upload-form">
										<div class="finish-upload hidden" id="finish-upload-addr">
											<div class="center-align">
												<span class="finish-upload-check"></span>
											</div>
										</div>
										<input type="file" id="fileToUpload-addr-dragAndDrop" class="hidden" accept="application/pdf,image/gif,image/jpeg,image/jpg,image/png" />
										<div class="select-file select-zone" id="drop-zone" for="fileToUpload-addr-dragAndDrop">
											<div class="select-file-section" id="select-file-section-address">
												<div class="mob hidden-md hidden-lg">
													<label for="fileToUploadProofAdd" class="mobile-camera-pic-file">
														<span class="drag-cam">
															<i class="fa fa-camera"></i>
														</span>
													</label>
												</div>
												<div class="text-bold desk hidden-xs hidden-sm">
													<fmt:message key="label.upload.box.copy" bundle="${msg}" />
												</div>
												<!--  <![endif]-->
												<div class="mob-desk or">
													<span class="OR"><fmt:message key="label.icon.or" bundle="${msg}" /></span>
												</div>
												<div class="mob-desk">
													<label for="fileToUploadProofAdd" class="orange-select-file">
														<input type="file" id="fileToUploadProofAdd" accept="application/pdf,image/gif,image/jpeg,image/jpg,image/png" onchange="fileSelected('proof-of-address-progress','fileToUploadProofAdd','address-docu-filename','address-docu-fileSize','finish-upload-addr','docu-upload-percent-text','document-upload-progress-bar','', '#so-address-file-message');" />
														<span class="input-file-text"><fmt:message key="button.select.files" bundle="${msg}" /></span>
													</label>
												</div>
											</div>
										</div>
										<input type="reset" class="sr-only" />
									</form>
									<span class="err-msg" id="so-address-file-message"></span>
									<div class="document-upload-progress hidden" id="proof-of-address-progress">
										<div class="clearfix">
											<div class="pull-left">
												<span id="address-docu-filename">Yourfiles.pdf </span><span id="address-docu-fileSize">(319.50 mb)</span>
											</div>
											<div class="pull-right">
												<button type="button" class="upload-cancel-btn" id="cancel-upload-btn" onclick="cancelUpload('proof-of-address-progress','finish-upload-addr','document-upload-progress-bar','docu-upload-percent-text')">
													<span class="upload-cancel"></span>
												</button>
											</div>
										</div>
										<div class="progress">
											<div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width:0%" id="document-upload-progress-bar">
											</div>
										</div>
										<p class="upload-text">Uploading: <span id="docu-upload-percent-text">0%</span></p>
									</div>
								</div>
							</div>
							<div class="iframe-holder hidden">
								<iframe id="iframe-one" src="<%=request.getContextPath()%>/${language}/term-life-insurance/document-upload-hkid" onLoad="isUploaded(this.id);" class="upload-ie-iframe"></iframe>
								<iframe id="iframe-two" src="<%=request.getContextPath()%>/${language}/term-life-insurance/document-upload-passport" onLoad="isUploaded(this.id);" class="upload-ie-iframe-second"></iframe>
								<iframe id="iframe-three" src="<%=request.getContextPath()%>/${language}/term-life-insurance/document-upload-address" onLoad="isUploaded(this.id);" class="upload-ie-iframe-third"></iframe>
							</div>
							<div class="upload-note">
								<p class="upload-p"><span class="orange">*</span>
									<c:if test="${planIndex == 'savings-insurance'}">
	        							<fmt:message key="msg.upload.savie.copy3" bundle="${msg}" />
	        						</c:if>
		        					<c:if test="${planIndex == 'medical-insurance'}">
	        							<fmt:message key="msg.upload.easyhealth.copy3" bundle="${msg}" />
	        						</c:if>
								</p>
							</div>
						</div>
						<div class="next-btn">
						  <button id="updoc-complete-btn" class="btn savie-common-btn upload-btn"><fmt:message key="button.complete" bundle="${msg}" /></button>
						</div>
					</div>
				</div>
			</div>
			<div class="modal fade modal-address-prof" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
				<div class="modal-dialog" id="dialog-address-prof">
					<div class="modal-content common-welcome-modal" id="modal-content-addressprof">	
						<div class="modal-header">
							<button type="button" class="close" id="close-address-prof" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							<p><fmt:message key="label.address.proof.title" bundle="${msg}" /></p>
						</div>
						<div class="modal-body" id="modal-body-addressprof">
							<ol>
								<fmt:message key="information.address.proof.copy" bundle="${msg}" />
							</ol>
						</div>
					</div>
				</div>
			</div>
			<!-- FOOTER -->
		</div>
		
		<!-- Error to Home Modal -->
		<div id="error-to-home-modal" class="modal fade fwd-generic-modal back-to-home" role="dialog" data-keyboard="false" data-backdrop="static">
		  <div class="modal-dialog">
		      <div class="modal-content" align="center">
		        <div class="modal-body form-container" style="color:#fc6d08">
		           <div class="row">
		              <h2 id="error-to-home-modal-errorMessage">Unexpected Error</h2>  
		           </div>
		           <div class="row">
		              <div class="col-lg-6 col-md-6 col-lg-offset-3 col-md-offset-3 fwd-orange-btn-center-wrapper">		                 
	                 	<button type="button" class="btn next bdr-curve btn btn-primary btn-lg wd5 button--full" id="error-to-home-btn" data-dismiss="modal">
	                 		<fmt:message key="eliteTerms.selectPlan.Back.to.homepage" bundle="${msg}" />
	                 	</button>
	                 	<script>
	                 		$('#error-to-home-btn').on('click', function(e) {
							  window.onbeforeunload=null;
							  window.location.href= '<%=request.getContextPath()%>/${language}/savings-insurance';
							});
	                 	</script>
		              </div>
		           </div>
		        </div>
		     </div>
		  </div>
		</div>
		<!-- Modal for IE9 ERROR  -->
		<div class="modal fade common-welcome-modal modal-ie-error" id="review-fna-modal" tabindex="-1" role="dialog" data-keyboard="false" data-backdrop="static">
		  <div class="modal-dialog">
		    <div class="modal-content">
		     	<h4 class="text-center welcome-msg"><fmt:message key="modal.ie.error.title" bundle="${msg}" /></h4>
		     	<p class="text-center description-msg"><fmt:message key="modal.ie.error.msg" bundle="${msg}" /></p>		     
		    </div>
		  </div>
		</div>
		
		<!-- JS INCLUDES -->
		<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/savie-online/savie-online.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/savie-2016/so-fwd-dropzone.js"></script>
		<script type="text/javascript">
			$(document).ready(function() { 
				if( typeof ga !== 'undefined' ){
					if('${plan }' == 'savings-insurance'){
						ga('create', 'UA-60032236-1', 'auto');
			            ga('require', 'ecommerce');
			            ga('ecommerce:addTransaction', {
			             'id': '${lifePolicy.transactionNumber }', // Transaction ID. Required.
			             'revenue': '${saviePlanDetails.insuredAmount }', // Grand Total of single premium 
			             'affiliation': 'Save', // Insurance type, e.g. Life
			              'currency': 'HKD'
			             });
			            ga('ecommerce:addItem', {
			                 'id': '${lifePolicy.transactionNumber }', // Transaction ID. Required
			                 'name': 'Savie SP online', // Product name. Required
			                 'category': 'Savings', // Category or variation
			                 'price': '${saviePlanDetails.insuredAmount }', // Unit price (this is the one off premium for SP)
			                 'quantity': '1',
			                 'currency': 'HKD'
			               });
			            ga('ecommerce:send');
					}
					else if('${plan }' == 'medical-insurance'){
						ga('create', 'UA-60032236-1', 'auto');
			            ga('require', 'ecommerce');
			            ga('ecommerce:addTransaction', {
			             'id': '${lifePolicy.transactionNumber }', // Transaction ID. Required.
			             'revenue': '${selectPlan.monthlyPremium*2 }', // Grand Total of single premium 
			             'affiliation': 'Protect', // Insurance type, e.g. Life
			              'currency': 'HKD'
			             });
			            ga('ecommerce:addItem', {
			                 'id': '${lifePolicy.transactionNumber }', // Transaction ID. Required
			                 'name': 'Easy Health', // Product name. Required
			                 'category': 'Health', // Category or variation
			                 'price': '${selectPlan.monthlyPremium }', // Unit price (this is the one off premium for SP)
			                 'quantity': '2',
			                 'currency': 'HKD'
			               });
			            ga('ecommerce:send');
					}
				}
				var language = "en";
				if(msieversion()>0 && msieversion()<10) {
					$('.modal-ie-error').modal('show');
					$.ajax({     
		    		    url:'${pageContext.request.contextPath}/ajax/savings-insurance/sendEmailForDocumentUploadLater',     
		    		    type:'get',
					    cache:false, 
					    async:false,     
		    		    error:function(){    
		    		    	console.log('error');
		    		    },     
		    		    success:function(data){
		    		    	console.log('success');
		    		    	console.log(data);
		    		    }
		    		});
				}
				var errorMessageType = "${errorMessageType}";
				var userName = "${username}";
                var policyUserName = "${policyUserName}";
                var authenticate = "${authenticate}";
                
                if('${plan }' != 'medical-insurance/cansurance'){
                	$('#latterUpload').removeAttribute("style");
                 	$('#nowUpload').removeAttribute("style");
                	
                }
                
                if('${plan }' != 'medical-insurance/cansurance'){
                 if(!("${authenticate}" == "true" && "${authenticate}" != "*DIRECTGI") ){
                	errorMessageType = 'NOT_AUTHENTICATED';
                } else if(policyUserName != "" && policyUserName.toUpperCase() != userName.toUpperCase() ){
                	errorMessageType = 'UNMATCHED_USERNAME';
                }

            	if(errorMessageType != null && errorMessageType != '' && errorMessageType != 'null' ){

            		if(errorMessageType == 'NOT_AUTHENTICATED'){
            			//force login
	            		$('#loginpopup').modal({backdrop: 'static', keyboard: false});
	            		$('#loginpopup').find(".close").hide(); 
	           			$('#loginpopup').find(".text-left").hide(); 
            			$('#loginpopup').modal('show');

            		} else {
            			if(errorMessageType == 'UNMATCHED_USERNAME'){
	            			$("#error-to-home-modal-errorMessage").html(getBundle(getBundleLanguage,'et.document.upload.not.valid.user'));
	            		}else if(errorMessageType == 'alreadyUploaded'){
	            			$("#error-to-home-modal-errorMessage").html(getBundle(getBundleLanguage,'et.document.upload.alreadyUploaded'));
	            		}else if(errorMessageType == 'UrlExpired' ){
	            			$("#error-to-home-modal-errorMessage").html(getBundle(getBundleLanguage,'et.document.upload.UrlExpired'));
	            		}else{
	            			$("#error-to-home-modal-errorMessage").html(getBundle(getBundleLanguage,errorMessageType));
	            		}
	                	$('#error-to-home-modal').modal('show');
	                }
            	} 
                }
				 
				// Toggle passport
				$('#hkPermanentRes').click(function() {
					$('#passport-section').toggle();
				});
				
				$('.checkbox-text').on('click', function() {
					$('#hkPermanentRes').click();
				});
				
				// Uploading file validation
				var up = true;
				$('#updoc-complete-btn').on('click', function(e) {
					if($("input[name='upload']:checked").val()=="true"){
						var $self = $(this);
						var isValid = isHkidValidity($self);
							isValid = isPassportValidity($self);
							isValid = isProfAddValidity($self);
						
						if (isValid && up) {
							console.log('Proceed');
							$self.attr('disabled', 'disabled');
							documentUpload('${plan }');
							up = false;
						} 
						else {
							$self.removeAttr('disabled');
						}
					}
					else{
						window.location = '<%=request.getContextPath()%>/${language}/${nextPageFlow2}';
					}
				});
				
				$('#hkidFileToUpload').on('click', function(e) {
					$('#updoc-complete-btn').removeAttr('disabled');
				});
				$('#passportFileToUpload').on('click', function(e) {
					$('#updoc-complete-btn').removeAttr('disabled');
				});
				$('#fileToUploadProofAdd').on('click', function(e) {
					$('#updoc-complete-btn').removeAttr('disabled');
				});
				
				
				// Check if hkid is valid
				function isHkidValidity() {
					/* For IE9, check the src result */
					if(msieversion()>0 && msieversion()<10) {
						return $('#iframe-one').attr('src').indexOf('uploadResult=true') > -1; 
					}
					
					var isValid = true;
					var $hkidFileDnD = $('#fileToUpload-hkid-dragAndDrop');
					var $hkidFile = $('#hkidFileToUpload');
					
					// Check HKID file
					if ($hkidFileDnD.get(0).files.length || $hkidFile.get(0).files.length) {
						removeFormFieldError('#so-hkid-file-message', '', true);
					} else { // Process hkid file here
						removeFormFieldError('#so-hkid-file-message', 'required-hkid');
						addFormFieldError('#so-hkid-file-message', getBundle(getBundleLanguage,'error.hkid.document.empty'), 'required-hkid');
						isValid = false;
					}

					// Check if upload is completed.
					if( $('#hkid-upload-percent-text').html() != '100%' ){
						isValid = false;
					}

					return isValid;
				}
				
				// Check if passport is valid
				function isPassportValidity() {
					if ($('#hkPermanentRes').prop('checked')) {
						return true;
					}
					/* For IE9, check the src result */
					if(msieversion()>0 && msieversion()<10) {
						return $('#iframe-two').attr('src').indexOf('uploadResult=true') > -1; 
					}
					
					var isValid = true;
					var $passportFileDnD = $('#fileToUpload-passport-dragAndDrop');
					var $passportFile = $('#passportFileToUpload');
						
					// Check HKID file
					if ($passportFileDnD.get(0).files.length || $passportFile.get(0).files.length) {
						removeFormFieldError('#so-passport-file-message', '', true);
					} else { // Process passport file here
						removeFormFieldError('#so-passport-file-message', 'required-hkid');
						addFormFieldError('#so-passport-file-message', getBundle(getBundleLanguage,'error.passport.document.empty'), 'required-hkid');
						isValid = false;
					}

					// Check if upload is completed.
					if( $('#passport-upload-percent-text').html() != '100%' ){
						isValid = false;
					}

					return isValid;
				}
				
				// Check if proof of address is valid
				function isProfAddValidity() {
					/* For IE9, check the src result */
					if(msieversion()>0 && msieversion()<10) {
						return $('#iframe-three').attr('src').indexOf('uploadResult=true') > -1; 
					}
					
					var isValid = true;
					var $profAddFileDnD = $('#fileToUpload-addr-dragAndDrop');
					var $profAddFile = $('#fileToUploadProofAdd');
					
					// Check HKID file
					if ($profAddFileDnD.get(0).files.length || $profAddFile.get(0).files.length) {
						removeFormFieldError('#so-address-file-message', '', true);
					} else { // Process proof of address file here
						removeFormFieldError('#so-address-file-message', 'required-hkid');
						addFormFieldError('#so-address-file-message', getBundle(getBundleLanguage,'error.address.proof.empty'), 'required-hkid');
						isValid = false;
					}

					// Check if upload is completed.
					if( $('#docu-upload-percent-text').html() != '100%' ){
						isValid = false;
					}

					return isValid;
				}
			});
			
			function checkLogin() {
            	if("${authenticate}" == "true" && "${authenticate}" != "*DIRECTGI"){
					return true;
				}else{
					$('#loginpopup').modal('show');
					return false;
				}
			}
			
			//iframe
			if(msieversion()>0 && msieversion()<10) {
				$('#hidden-ie9').addClass('hide-element');
				/* $('.upload-note').addClass('hidden'); */
				uploadIe();
				$('#hkPermanentRes').click(function(){
					$('#passport-section').toggle();
					if(msieversion() > 0) {
               	if( $('#iframe-two').hasClass('hide-element') ) {
                  $('#iframe-three').css('left', '68%');
                  $('#iframe-two').removeClass('hide-element');
               	} else {
                  $('#iframe-three').css('left', '34%');
                  $('#iframe-two').addClass('hide-element');
               	}
					}
				});
			} else {
				$('#hidden-ie9').removeClass('hide-element');
				/* $('.upload-note').removeClass('hidden'); */
			}
			//upload IE
			function isUploaded(id) {
				var status = document.getElementById(id).contentWindow.document.body.innerHTML;
				var targetURL = document.getElementById(id).src.split(/[?#]/)[0]; //get raw url
				var responseURL = document.getElementById(id).contentWindow.location.href;
				// skip handling if iframe document <> server response
				var bSkip = responseURL.indexOf(targetURL) > -1;
				
				if ( bSkip ) {
					return false;
				}
				if(status == 'true') {
					document.getElementById(id).src = targetURL+'?uploadResult=true';
					//enable submit button
					if( document.getElementById('iframe-et-upload-doc-submit-btn') ) {
						document.getElementById('iframe-et-upload-doc-submit-btn') .removeAttribute('disabled');
					}
				} else {
					document.getElementById(id).src = targetURL+'?uploadResult=false';
					var lang = '${language}';
					if(lang=='en') {
						setTimeout(function() {
							var el_err = document.getElementById(id).contentWindow.document.querySelectorAll('#upload-system-error span.en')[0];

							if( el_err ){
								el_err.className = el_err.className.replace('hidden', '');
							}

						}, 1000);
					} else {
						setTimeout(function(){
							var el_err = document.getElementById(id).contentWindow.document.querySelectorAll('#upload-system-error span.ch')[0];

							if( el_err ) {
								el_err.className = el_err.className.replace('hidden', '');
							}
						}, 1000);
					}
				} //set 
			}
			function uploadIe() {
				if(msieversion()>0 && msieversion()<10) {
					$('.upload-buttons').addClass('hidden');
					$('.iframe-holder').removeClass('hidden');
					$('#et-upload-doc-submit-btn').addClass('hide-element');
					$('#iframe-et-upload-doc-submit-btn').removeClass('hide-element');
					if(getWidth() < 992) {
						$('.upload-ie-iframe').removeAttr('style');
						$('.upload-ie-iframe').css({'width': '103%', 'border': 'none', 'height': '1450px', 'margin-left': '-15px'});
					} else {
						$('.upload-ie-iframe').css({'width': '140%', 'border': 'none', 'height': '550px'});
						$('.upload-ie-iframe-second').css({'width': '140%', 'border': 'none', 'height': '550px','position':'absolute','top':'0','left':'34%'});
						$('.upload-ie-iframe-third').css({'width': '140%', 'border': 'none', 'height': '550px','position':'absolute','top':'0','left':'68%'});
					}
				}
			}
		</script>
	</body>
</html>