<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeQuoteBean"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/styles.css">
<script type="text/javascript">
var context = "${pageContext.request.contextPath}";
var documentUploadNextPageFlow = "${nextPageFlow}";
var language = "${language}";
</script>
		<%!
			boolean isSaleActiveClass = false;
			boolean isEservicesActiveClass = false;
		%>
		<div class="fwd-savie-wrapper">
      
         	
         	<div class="fwd-container container-fluid breadcrumbs hidden-xs hidden-sm">
               <ol class="breadcrumb breadcrumbs-product-details et-breadcrumbs">
                  <li><a href="#"><fmt:message key="eliteTerms.documentUpload.Home" bundle="${msg}" /></a></li>
                  <li class="divider"><i class="fa fa-play"></i></li>
                  <li><a href="#"><fmt:message key="eliteTerms.documentUpload.Protection" bundle="${msg}" /> </a></li>
                  <li class="divider"><i class="fa fa-play"></i></li>
                  <li><a href="#"><fmt:message key="eliteTerms.documentUpload.Elite.term" bundle="${msg}" /> </a></li>
                  <li class="divider last"><i class="fa fa-play"></i></li>
                  <li class="active-bc" id="et-active-bc-menu"><fmt:message key="eliteTerms.documentUpload.Upload.document" bundle="${msg}" /></li>
               </ol>
            </div>

			<!--Elite Terms Header Info Widget-->
         
			<div class="container-fluid fwd-full-container">
				<div class="application-page-header et-header-browse">
					<div class="reset-margin hidden-xs hidden-sm clearfix">
						<div class="reset-padding">
							<button type="button" class="et-header-info-btn et-bind-btn-header no-hover" id="select-plan" data-et-section-target="et-select-plan-section"><fmt:message key="eliteTerms.documentUpload.Select.plan" bundle="${msg}" /></button>
						</div>
						<div class="reset-padding">
							<button type="button" class="et-header-info-btn et-bind-btn-header no-hover" id="application" data-et-section-target="et-application-section" ><fmt:message key="eliteTerms.documentUpload.Application" bundle="${msg}" /></button>
						</div>
						<div class="reset-padding">
							<button type="button" class="et-header-info-btn et-bind-btn-header no-hover" id="payment" data-et-section-target="et-dec-sign-section"><fmt:message key="eliteTerms.documentUpload.Payment" bundle="${msg}" /></button>
						</div>
						<div class="reset-padding">
							<button type="button" class="et-header-info-btn active no-hover" id="summary" data-toggle="modal" data-target="#summary-modal"><fmt:message key="eliteTerms.documentUpload.Upload.document" bundle="${msg}" /></button>
						</div>
						<div class="reset-padding">
							<button type="button" class="et-header-info-btn et-bind-btn-header no-hover" id="confirmation" data-et-section-target="et-confirmation-section"><fmt:message key="eliteTerms.documentUpload.Confirmation" bundle="${msg}" /></button>
						</div>
					</div>
					<div class="et-mobile-header-info hidden-md hidden-lg">
						<div class="clearfix">
							<!--<div class="et-back-arrow">
								<a href="#" class="et-back-arrow-link">
									<span class="icon-arrow-left2 arrow-left"></span>
								</a>
							</div>-->
							<div class="et-header-tex">
								<h3 id="et-active-section-label"><fmt:message key="eliteTerms.documentUpload.Upload.document" bundle="${msg}" /></h3>
							</div>
						</div>
						
					</div>
				</div>
			</div>
         
			<div class="application-flux">                  
				<div class="container-fluid fwd-container">
            
					<div class="document-upload page-application et-document-upload">
                  	<p class="et-ud-payment-note-head"><fmt:message key="eliteTerms.documentUpload.Your.payment.has" bundle="${msg}" /></p>
                  	<p class="et-ud-payment-note-desc"><fmt:message key="eliteTerms.documentUpload.Please.upload.the" bundle="${msg}" /></p>

                  	<div class="page-content clearfix">
						<h2><fmt:message key="eliteTerms.documentUpload.Upload.document" bundle="${msg}" /></h2>
						<div class="clearfix document-upload-rd-btn">
							<div class="pull-left upload-now" id="et-upload-now">
								<label class="upload-now-radio" for="upload-now">
									<input type="radio" id="upload-now" name="upload-doc" value="upload-now" checked>
									<span class="upload-now-text">
										<span class="text"><fmt:message key="eliteTerms.documentUpload.Upload.Now" bundle="${msg}" /></span>
									</span>
								</label>
								<div class="descriptions">
									<span class="desktop-text"><fmt:message key="eliteTerms.documentUpload.Upload.Now" bundle="${msg}" /></span>
									<p><fmt:message key="eliteTerms.documentUpload.The.policy.will" bundle="${msg}" /></p>
								</div>
							</div>
							<div class="pull-left upload-later" id="et-upload-later">
								<label class="upload-later-radio" for="upload-later">
									<input type="radio" id="upload-later" name="upload-doc" value="upload-later" >
									<span class="upload-later-text">
										<span class="text"><fmt:message key="eliteTerms.documentUpload.Upload.Later" bundle="${msg}" /></span>
									</span>
								</label>
								<div class="descriptions">
									<span class="desktop-text"><fmt:message key="eliteTerms.documentUpload.Upload.Later" bundle="${msg}" /></span>
									<p><fmt:message key="eliteTerms.documentUpload.You.may.upload" bundle="${msg}" /></p>
								</div>
							
							</div>
						</div>
						<div class="clearfix"></div>
						<div class="upload-later-section hidden" id="upload-later-section">
							<div class="description">
								<p class="first-desc"><fmt:message key="eliteTerms.documentUpload.A.FWD.account" bundle="${msg}" /></p>
								<p class="second-desc"><fmt:message key="eliteTerms.documentUpload.You.will.receive" bundle="${msg}" /></p>
							</div>
							
						</div>
						
						<div class="upload-now-section " id="upload-now-section">
							<div class="clearfix">
								<div class="pull-left ">
								</div>
								<div class="pull-left ">
								</div>
							</div>
							<div class="clearfix">
								<div class="pull-left residence-check">
									<input type="checkbox" value="residence" id="residence-check" name="isResidence" />
									<label for="residence-check"></label>
								</div>
								<div class="pull-left residence-text">
									<fmt:message key="eliteTerms.documentUpload.I'm.Hong" bundle="${msg}" />
								</div>
							</div>
							
							<div class="row upload-now-row">
                     
								<div class="upload-buttons clearfix">
									<div class="col-xs-12 col-md-4 hk-id-holder">
										<h4><fmt:message key="eliteTerms.documentUpload.Your.HK.ID" bundle="${msg}" /></h4><button class="info hkid orange-tooltip hidden-xs hidden-sm" type="button" data-toggle="tooltip" data-placement="right" title="Lorem Ipsum"></button>
										<h5><fmt:message key="eliteTerms.documentUpload.Upload.your.HKID" bundle="${msg}" /></h5>
										<form action="upload-documents" id="hkid-upload-form" class="upload-form">
											<div class="finish-upload hidden" id="finish-upload-hkid">
												<div class="center-align">
													<span class="finish-upload-check"></span>
												</div>
											</div>
											<input type="file" id="fileToUpload-hkid-dragAndDrop" class="hidden" >
											<div class="select-file-hkid" id="hkid-drop-zone" for="fileToUpload-hkid-dragAndDrop">
												<div class="finish-upload hidden" id="finish-upload-hkid">
													<div class="center-align">
														<span class="finish-upload-check"></span>
													</div>
												</div>
												<div class="select-file-section" id="select-file-section">
													<div class="mob hidden-md hidden-lg">
														<label for="hkidFileToUploadCam" class="mobile-camera-pic-file">
															<input type="file" id="hkidFileToUploadCam" onchange="fileSelected('hkid-copy-progress','hkidFileToUploadCam','hkid-docu-filename','hkid-docu-fileSize','finish-upload-hkid','hkid-upload-percent-text','hkid-upload-progress-bar','');">
															<span class="mobile-camera"></span>
														</label>
													</div>
													<div class="desk hidden-xs hidden-sm">
														<fmt:message key="eliteTerms.documentUpload.Drag.and.drop" bundle="${msg}" />
													</div>
													<div class="mob-desk">
														<span class="OR"><fmt:message key="eliteTerms.documentUpload.or" bundle="${msg}" /></span>
													</div>
													<div class="mob-desk">
														<label for="hkidFileToUpload" class="orange-select-file">
															<input type="file" id="hkidFileToUpload" onchange="fileSelected('hkid-copy-progress','hkidFileToUpload','hkid-docu-filename','hkid-docu-fileSize','finish-upload-hkid','hkid-upload-percent-text','hkid-upload-progress-bar','');">
															<span class="input-file-text"><fmt:message key="eliteTerms.documentUpload.Select.files" bundle="${msg}" /></span>
														</label>
													</div>
												</div>
											</div>
										</form>
										<div class="document-upload-progress hidden" id="hkid-copy-progress">
											<div class="clearfix">
												<div class="pull-left">
													<span id="hkid-docu-filename"><fmt:message key="eliteTerms.documentUpload.Yourfiles.pdf" bundle="${msg}" /> </span><span id="hkid-docu-fileSize">(319.50 mb)</span>
												</div>
												<div class="pull-right">
													<button type="button" class="upload-cancel-btn" id="cancel-upload-btn" onclick="cancelUpload('hkid-copy-progress','finish-upload-hkid','hkid-upload-progress-bar')">
														<span class="upload-cancel"></span>
													</button>
												</div>
											</div>
											<div class="progress">
												<div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width:0%" id="hkid-upload-progress-bar">
												<span class="sr-only"><fmt:message key="eliteTerms.documentUpload.70%.Complete" bundle="${msg}" /></span>
												</div>
											</div>
											<p class="upload-text"><fmt:message key="eliteTerms.documentUpload.Uploading" bundle="${msg}" /><span id="hkid-upload-percent-text">0%</span></p>
										</div>
									</div>

									<div class="col-xs-12 col-md-4 passport-holder">
										<h4><fmt:message key="eliteTerms.documentUpload.Your.passport.copy" bundle="${msg}" /></h4><button class="info passport orange-tooltip hidden-xs hidden-sm" type="button" data-toggle="tooltip" data-placement="right" title="Lorem Ipsum"></button>
										<h5><fmt:message key="eliteTerms.documentUpload.If.you.are" bundle="${msg}" /></h5>
										<form action="upload-documents" id="passport-upload-form" class="upload-form">
											<div class="finish-upload hidden" id="finish-upload-passport">
												<div class="center-align">
													<span class="finish-upload-check"></span>
												</div>
											</div>
											<input type="file" id="fileToUpload-passport-dragAndDrop" class="hidden" >
											<div class="select-file-passport" id="passport-drop-zone" for="fileToUpload-passport-dragAndDrop">
												<div class="finish-upload hidden" id="finish-upload-passport">
													<div class="center-align">
														<span class="finish-upload-check"></span>
													</div>
												</div>
												<div class="select-file-section" id="select-file-section">
													<div class="mob hidden-md hidden-lg">
														<label for="passportFileToUploadCam" class="mobile-camera-pic-file">
															<input type="file" id="passportFileToUploadCam" onchange="fileSelected('passport-copy-progress','passportFileToUploadCam','passport-docu-filename','passport-docu-fileSize','finish-upload-passport','passport-upload-percent-text','passport-upload-progress-bar','');">
															<span class="mobile-camera"></span>
														</label>
													</div>
													<div class="desk hidden-xs hidden-sm">
														<fmt:message key="eliteTerms.documentUpload.Drag.and.drop" bundle="${msg}" />
													</div>
													<div class="mob-desk">
														<span class="OR"><fmt:message key="eliteTerms.documentUpload.or" bundle="${msg}" /></span>
													</div>
													<div class="mob-desk">
														<label for="passportFileToUpload" class="orange-select-file">
															<input type="file" id="passportFileToUpload" onchange="fileSelected('passport-copy-progress','passportFileToUpload','passport-docu-filename','passport-docu-fileSize','finish-upload-passport','passport-upload-percent-text','passport-upload-progress-bar','');">
															<span class="input-file-text"><fmt:message key="eliteTerms.documentUpload.Select.files" bundle="${msg}" /></span>
														</label>
													</div>
												</div>
											</div>
										</form>
										<div class="document-upload-progress hidden" id="passport-copy-progress">
											<div class="clearfix">
												<div class="pull-left">
													<span id="passport-docu-filename"><fmt:message key="eliteTerms.documentUpload.Yourfiles.pdf" bundle="${msg}" /> </span><span id="passport-docu-fileSize">(319.50 mb)</span>
												</div>
												<div class="pull-right">
													<button type="button" class="upload-cancel-btn" id="cancel-upload-btn" onclick="cancelUpload('passport-copy-progress','finish-upload-passport','passport-upload-progress-bar')">
														<span class="upload-cancel"></span>
													</button>
												</div>
											</div>
											<div class="progress">
												<div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width:0%" id="passport-upload-progress-bar">
												<span class="sr-only"><fmt:message key="eliteTerms.documentUpload.70%.Complete" bundle="${msg}" /></span>
												</div>
											</div>
											<p class="upload-text"><fmt:message key="eliteTerms.documentUpload.Uploading" bundle="${msg}" /><span id="passport-upload-percent-text">0%</span></p>
										</div>
									</div>
									
									<div class="col-xs-12 col-md-4 proof-address-holder">
										<h4><fmt:message key="eliteTerms.documentUpload.Proof.of.address" bundle="${msg}" /></h4><button class="info addr orange-tooltip hidden-xs hidden-sm" type="button" data-toggle="tooltip" data-placement="right" title="Lorem Ipsum"></button>
										<h5><fmt:message key="eliteTerms.documentUpload.Your.current.residential" bundle="${msg}" /></h5>
										<form action="http://murielle.php-staging.smartdrop.com.hk/pms/product/uploadfile" id="js-upload-form" method="POST" class="upload-form">
											<div class="finish-upload hidden" id="finish-upload-addr">
												<div class="center-align">
													<span class="finish-upload-check"></span>
												</div>
											</div>
											<input type="file" id="fileToUpload-addr-dragAndDrop" class="hidden">
											<div class="select-file" id="drop-zone" for="fileToUpload-addr-dragAndDrop">	
												<div class="select-file-section" id="select-file-section-address">
													<div class="mob hidden-md hidden-lg">
														<label for="fileToUpload-addr-cam" class="mobile-camera-pic-file">
															<input type="file" id="fileToUpload-addr-cam" onchange="fileSelected('proof-of-address-progress','fileToUpload-addr-cam','address-docu-filename','address-docu-fileSize','finish-upload-addr','docu-upload-percent-text','document-upload-progress-bar','');">
															<span class="mobile-camera"></span>
														</label>
													</div>
													<div class="desk hidden-xs hidden-sm">
														<fmt:message key="eliteTerms.documentUpload.Drag.and.drop" bundle="${msg}" />
													</div>
													<div class="mob-desk">
														<span class="OR"><fmt:message key="eliteTerms.documentUpload.or" bundle="${msg}" /></span>
													</div>
													<div class="mob-desk">
														<label for="fileToUpload" class="orange-select-file">
															<input type="file" id="fileToUpload" onchange="fileSelected('proof-of-address-progress','fileToUpload','address-docu-filename','address-docu-fileSize','finish-upload-addr','docu-upload-percent-text','document-upload-progress-bar','');">
															<span class="input-file-text"><fmt:message key="eliteTerms.documentUpload.Select.files" bundle="${msg}" /></span>
														</label>
													</div>
												</div>
											</div>
										</form>
										<div class="document-upload-progress hidden" id="proof-of-address-progress">
											<div class="clearfix">
												<div class="pull-left">
													<span id="address-docu-filename"><fmt:message key="eliteTerms.documentUpload.Yourfiles.pdf" bundle="${msg}" /> </span><span id="address-docu-fileSize">(319.50 mb)</span>
												</div>
												<div class="pull-right">
													<button type="button" class="upload-cancel-btn" id="cancel-upload-btn" onclick="cancelUpload('proof-of-address-progress','finish-upload-addr','document-upload-progress-bar')">
														<span class="upload-cancel"></span>
													</button>
												</div>
											</div>
											<div class="progress">
												<div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width:0%" id="document-upload-progress-bar">
												<span class="sr-only"><fmt:message key="eliteTerms.documentUpload.70%.Complete" bundle="${msg}" /></span>
												</div>
											</div>
											<p class="upload-text"><fmt:message key="eliteTerms.documentUpload.Uploading" bundle="${msg}" /> <span id="docu-upload-percent-text">0%</span></p>
										</div>
									</div>
								</div>
                        
								<div class="col-xs-12 col-md-12">
									<p class="notice"><span class="asterisk">* </span><fmt:message key="eliteTerms.documentUpload.Policy.will.be" bundle="${msg}" /></p>
								</div>
							</div>					
						</div>
                  	</div> <!-- PAGE CONTENT -->
					<div class="submit-btn" id="submit-btn">
						<button id="et-upload-doc-submit-btn" type="button" class="btn next"><fmt:message key="eliteTerms.documentUpload.Next" bundle="${msg}" /></button>
					</div>
					<div class="link-button hidden" id="upload-link-btn">
						<button type="button" class="btn next"><fmt:message key="eliteTerms.documentUpload.Send.me.the.link" bundle="${msg}" /></button>
					</div>
					
				</div>
               
			</div>
            
		</div>
			
			<!-- FOOTER -->
			
		</div>
		<!-- JS INCLUDES -->
		<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/elite-term/elite-term.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/elite-term/fwd-dropzone.js"></script>
		<script language="javascript">
			$('#residence-check').click(function(){
				$('.passport-holder').toggle();
			})
         
         /*$(document).on('click', '.et-header-info-btn', function(e) {
            e.preventDefault();
            
            var url = 'elite-terms-select-plan.jsp';
            var $self = $(this);
            
            if ($self.attr('id') === 'select-plan') {
               url += '#select-plan';
               window.location.href = url;
            } else if ($self.attr('id') === 'application') {
               url += '#application';
               window.location.href = url;
            }
         });*/
		</script>
