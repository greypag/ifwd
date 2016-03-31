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
		
			<!-- BREADCRUMBS -->
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
							<li class="step-number"><button type="button" class="et-header-info-btn completed-step"><i class="fa fa-check"></i><fmt:message key="stepindicator.savie.application" bundle="${msg}" /></button></li>
							<li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
							<li class="step-number"><button type="button" class="et-header-info-btn completed-step"><i class="fa fa-check"></i><fmt:message key="stepindicator.savie.summary.declaration" bundle="${msg}" /></button></li>
							<li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
							<li class="step-number"><button type="button" class="et-header-info-btn completed-step"><i class="fa fa-check"></i><fmt:message key="stepindicator.savie.sign" bundle="${msg}" /></button></li>
							<li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
							<li class="step-number"><button type="button" class="et-header-info-btn active"><span class="status">5</span><fmt:message key="stepindicator.savie.upload.document" bundle="${msg}" /></button></li>
							<li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
							<li class="step-number"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">6</span><fmt:message key="stepindicator.savie.confirmation" bundle="${msg}" /></button></li>
						 </ul>
					 </div>
				   </div> 
				   <div class="et-mobile-header-info hidden-md hidden-lg">
					  <div class="clearfix">
						 <div class="pull-left">
							<div class="et-back-arrow">
							   <a href="#" class="back-arrow-link">
								  <span class="icon-arrow-left2 arrow-left"></span>
							   </a>
							</div>
							<div class="et-header-tex">
							   <h3><fmt:message key="stepindicator.savie.upload.document" bundle="${msg}" /></h3>
							</div>
						 </div>
						 <span id="step-of">5 out of 6</span>
					  </div>
				   </div>
				</div>
			 </div>
			 <div class="container-fluid fwd-full-container mobile-step-indicator visible-xs visible-sm">
				<div class="step-indicator-container clearfix">
					<ul class="common-step-indicator six-steps nav nav-pills">
						 <li id="first-step"><a href="#" class="completed"><i class="fa fa-check"></i></a></li>
						 <li><a href="#" class="completed"><i class="fa fa-check"></i></a></li>
						 <li><a href="#" class="completed"><i class="fa fa-check"></i></a></li>
						 <li><a href="#" class="completed"><i class="fa fa-check"></i></a></li>
						 <li><a href="#" class="active"><span class="step-no">5</span></a></li>
						 <li id="last-step"><a href="#"><span class="step-no">6</span></a></li>
					</ul>
					<div class="step-line"></div>
				</div>
			</div>
			<!-- UPLOAD DOCUMENT BLOCK -->
			<div id="so-upload-document-section">
				<div class="container-fluid fwd-container up-doc-page">
					<div class="fwd-container-limit clearfix sidebar personal-info-widget page-application et-application-page document-upload">
						<h4 class="so-h4"><fmt:message key="label.select.document.title" bundle="${msg}" /></h4>
						<div class="radio-group clearfix">
						  <div class="radio-button-group">
							 <div class="clearfix desktop-align left">
								<div class="pull-left radio-holder">
								   <input type="radio" id="upload-now-radio" name="upload" value="true" checked /> <label for="upload-now-radio"></label>
								</div>
								<div class="text-bold pull-left desc">
								   <fmt:message key="option.upload.now" bundle="${msg}" />
								   <span><fmt:message key="option.upload.now.copy1" bundle="${msg}" /></span>
								</div>
							 </div>
							 <div class="clearfix below desktop-align">
								<div class="pull-left radio-holder">
								   <input type="radio" id="upload-later-radio" name="upload" value="false" /> <label for="upload-later-radio"></label>
								</div>
								<div class="text-bold pull-left desc">
								   <fmt:message key="option.upload.later" bundle="${msg}" />
								   <span class="uplater-span"><fmt:message key="option.upload.later.copy1" bundle="${msg}" /></span>
								</div>
							 </div>
						  </div>
					   </div>
						<div class="upload-later-section hidden" id="upload-later-section">
							<div class="description">
								<p class="first-desc"><fmt:message key="label.upload.doc.when.ready.title" bundle="${msg}" /></p>
								<fmt:message key="label.upload.doc.when.ready.copy1" bundle="${msg}" />
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
													<span class="OR">or</span>
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
												<button type="button" class="upload-cancel-btn" id="cancel-upload-btn" onclick="cancelUpload('hkid-copy-progress','finish-upload-hkid','hkid-upload-progress-bar')">
													<span class="upload-cancel"></span>
												</button>
											</div>
										</div>
										<div class="progress">
											<div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width:0%" id="hkid-upload-progress-bar">
											</div>
										</div>
										<p class="upload-text">Uploading: <span id="hkid-upload-percent-text">100%</span></p>
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
												<button type="button" class="upload-cancel-btn" id="cancel-upload-btn" onclick="cancelUpload('passport-copy-progress','finish-upload-passport','passport-upload-progress-bar')">
													<span class="upload-cancel"></span>
												</button>
											</div>
										</div>
										<div class="progress">
											<div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width:0%" id="passport-upload-progress-bar">
											</div>
										</div>
										<p class="upload-text">Uploading: <span id="passport-upload-percent-text">100%</span></p>
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
													<span class="OR">or</span>
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
												<button type="button" class="upload-cancel-btn" id="cancel-upload-btn" onclick="cancelUpload('proof-of-address-progress','finish-upload-addr','document-upload-progress-bar')">
													<span class="upload-cancel"></span>
												</button>
											</div>
										</div>
										<div class="progress">
											<div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width:0%" id="document-upload-progress-bar">
											</div>
										</div>
										<p class="upload-text">Uploading: <span id="docu-upload-percent-text">100%</span></p>
									</div>
								</div>
							</div>
							<div class="iframe-holder hidden">
								<iframe id="iframe-one" src="<%=request.getContextPath()%>/${language}/term-life-insurance/document-upload-hkid" onLoad="isUploaded(this.id);" class="upload-ie-iframe"></iframe>
								<iframe id="iframe-two" src="<%=request.getContextPath()%>/${language}/term-life-insurance/document-upload-passport" onLoad="isUploaded(this.id);" class="upload-ie-iframe-second"></iframe>
								<iframe id="iframe-three" src="<%=request.getContextPath()%>/${language}/term-life-insurance/document-upload-address" onLoad="isUploaded(this.id);" class="upload-ie-iframe-third"></iframe>
							</div>
							<div class="upload-note">
								<p class="upload-p"><span class="orange">*</span> <fmt:message key="label.savie.upload.remark" bundle="${msg}" /></p>
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
		              <div class="col-lg-6 col-md-6 fwd-orange-btn-center-wrapper">		                 
	                 	<button type="button" class="btn next bdr-curve btn btn-primary btn-lg wd5" id="error-to-home-btn" data-dismiss="modal">
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
				var language = "en";
				if(msieversion()>0 && msieversion()<10) {
					$('.modal-ie-error').modal('show');
				}
				var errorMessageType = "${errorMessageType}";
            	if(errorMessageType != null && errorMessageType != '' && errorMessageType != 'null' ){
            		if(errorMessageType == 'alreadyUploaded'){
            			$("#error-to-home-modal-errorMessage").html(getBundle(getBundleLanguage,'et.document.upload.alreadyUploaded'));
            		}else if(errorMessageType == 'UrlExpired' ){
            			$("#error-to-home-modal-errorMessage").html(getBundle(getBundleLanguage,'et.document.upload.UrlExpired'));
            		}else{
            			$("#error-to-home-modal-errorMessage").html(getBundle(getBundleLanguage,errorMessageType));
            		}
                	$('#error-to-home-modal').modal('show');
            	}else{
            		var userName = "${username}";
                	var policyUserName = "${policyUserName}";
                	if(policyUserName != null && policyUserName != ''){
        				$('#et-upload-now').hide();
        				$('#et-upload-later').hide();
        				if(!("${authenticate}" == "true" && "${authenticate}" != "*DIRECTGI")){
            				$('#loginpopup').modal({backdrop: 'static', keyboard: false});
            				$('#loginpopup').find(".close").hide(); 
            				$('#loginpopup').find(".text-left").hide(); 
        				}
    				}
    				if(!("${authenticate}" == "true" && "${authenticate}" != "*DIRECTGI")){
    					$('#loginpopup').modal('show');
    				}else{
    					if(policyUserName != null && policyUserName != '' && policyUserName != userName){
    						 $("#error-to-home-modal-errorMessage").html(getBundle(getBundleLanguage,'et.document.upload.not.valid.user'));
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
				$('#updoc-complete-btn').on('click', function(e) {
					if($("input[name='upload']:checked").val()=="true"){
						var $self = $(this);
						var isValid = isHkidValidity($self);
							isValid = isPassportValidity($self);
							isValid = isProfAddValidity($self);
						
						if (isValid) {
							console.log('Proceed');
							$self.removeAttr('disabled');
							documentUpload();
						} else {
							$self.attr('disabled', 'disabled');
						}
					}
					else{
						window.location = '<%=request.getContextPath()%>/${language}/savings-insurance/${nextPageFlow2}';
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
					return isValid;
				}
				
				// Check if passport is valid
				function isPassportValidity() {
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
					return isValid;
				}
				
				// Check if proof of address is valid
				function isProfAddValidity() {
					if ($('#hkPermanentRes').prop('checked')) {
						return true;
					}
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