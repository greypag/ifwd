<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeQuoteBean"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% 
   response.setHeader("Pragma","No-cache"); 
   response.setHeader("Cache-Control","No-cache"); 
   response.setDateHeader("Expires", 0); 
   response.setHeader("Cache-Control", "No-store"); 
%>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/styles.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/styles-et.css">
<script type="text/javascript">
var context = "${pageContext.request.contextPath}";
var documentUploadNextPageFlow = "${nextPageFlow}";
var languageP = "${language}";
</script>
		<%!
			boolean isSaleActiveClass = false;
			boolean isEservicesActiveClass = false;
		%>
		<div class="fwd-savie-wrapper fwd-et-wrapper">
      
         	
         	<!--<div class="fwd-container container-fluid breadcrumbs hidden-xs hidden-sm">
               <ol class="breadcrumb breadcrumbs-product-details et-breadcrumbs">
                  <li><a href="#"><fmt:message key="eliteTerms.breadcrumb.home" bundle="${msg}" /></a></li>
                  <li class="divider"><i class="fa fa-play"></i></li>
                  <li><a href="#"><fmt:message key="eliteTerms.breadcrumb.category" bundle="${msg}" /> </a></li>
                  <li class="divider"><i class="fa fa-play"></i></li>
                  <li><a href="#"><fmt:message key="eliteTerms.breadcrumb.product" bundle="${msg}" /> </a></li>
                  <li class="divider last"><i class="fa fa-play"></i></li>
                  <li class="active-bc" id="et-active-bc-menu"><fmt:message key="eliteTerms.breadcrumb.upload" bundle="${msg}" /></li>
               </ol>
            </div>-->

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
         <div class="fwd-container container-fluid breadcrumbs hidden-xs hidden-sm">
            <ol class="breadcrumb breadcrumbs-product-details et-breadcrumbs">
               <li><fmt:message key="home.breadcrumb1.item1" bundle="${msg}" /></li>
               <li class="divider"><i class="fa fa-play"></i></li>
               <li><fmt:message key="home.breadcrumb1.type1" bundle="${msg}" /> </li>
               <li class="divider"><i class="fa fa-play"></i></li>
               <li><fmt:message key="home.breadcrumb1.term" bundle="${msg}" /> </li>
               <li class="divider last"><i class="fa fa-play"></i></li>
               <li class="active-bc" id="et-active-bc-menu"><fmt:message key="home.breadcrumb2.term.item3" bundle="${msg}" /></li>
            </ol>
         </div>			                  
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
								<label for="upload-now" class="descriptions">
									<span class="desktop-text"><fmt:message key="eliteTerms.documentUpload.Upload.Now" bundle="${msg}" /></span>
									<p><fmt:message key="eliteTerms.documentUpload.The.policy.will" bundle="${msg}" /></p>
								</label>
							</div>
							<div class="pull-left upload-later" id="et-upload-later">
								<label class="upload-later-radio" for="upload-later">
									<input type="radio" id="upload-later" name="upload-doc" value="upload-later" >
									<span class="upload-later-text">
										<span class="text"><fmt:message key="eliteTerms.documentUpload.Upload.Later" bundle="${msg}" /></span>
									</span>
								</label>
								<label for="upload-later" class="descriptions">
									<span class="desktop-text"><fmt:message key="eliteTerms.documentUpload.Upload.Later" bundle="${msg}" /></span>
									<p><fmt:message key="eliteTerms.documentUpload.You.may.upload" bundle="${msg}" /></p>
								</label>
							
							</div>
						</div>
						<div class="clearfix"></div>
						<div class="upload-later-section hidden" id="upload-later-section">
							<div class="description">
								<p class="first-desc"><fmt:message key="eliteTerms.documentUpload.later" bundle="${msg}" /></p>
								<p class="second-desc"><fmt:message key="eliteTerms.documentUpload.later.desc1" bundle="${msg}" /></p>
								<p class="second-desc"><fmt:message key="eliteTerms.documentUpload.later.desc2" bundle="${msg}" /></p>
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
								<label for="residence-check" class="pull-left residence-text">
									<fmt:message key="eliteTerms.documentUpload.I'm.Hong" bundle="${msg}" />
								</label>
							</div>
							
							<div class="row upload-now-row">
                     
								<div class="upload-buttons clearfix">
									<div class="col-xs-12 col-md-4 hk-id-holder">
										<div class="upload-copy-title">
											<h4><fmt:message key="eliteTerms.documentUpload.Your.HK.ID" bundle="${msg}" /></h4>

											<!--<button type="button" class="et-minimal info hkid orange-tooltip hidden-xs hidden-sm" data-container="body" data-trigger="hover focus click" data-html="true" data-toggle="tooltip" data-placement="top" title="<fmt:message key="eliteTerms.documentUpload.Upload.your.HKID.tooltip" bundle="${msg}" />" data-template='<div class="tooltip et-sp-tooltip-wrapper" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>'><span class="et-info-tooltip "></span>
											</button>-->

											<h5><fmt:message key="eliteTerms.documentUpload.Upload.your.HKID" bundle="${msg}" /></h5>
										</div>
										<form action="upload-documents" id="hkid-upload-form" class="upload-form">
											<div class="finish-upload hidden" id="finish-upload-hkid">
												<div class="center-align">
													<span class="finish-upload-check"></span>
												</div>
											</div>
											<input type="file" id="fileToUpload-hkid-dragAndDrop" class="hidden" accept="image/jpeg,image/jpg,image/png" >
											<div class="select-file-hkid" id="hkid-drop-zone" for="fileToUpload-hkid-dragAndDrop">
												<div class="finish-upload hidden" id="finish-upload-hkid">
													<div class="center-align">
														<span class="finish-upload-check"></span>
													</div>
												</div>
												<div class="select-file-section" id="select-file-section">
													<div class="mob hidden-md hidden-lg">
														<label for="hkidFileToUpload" class="mobile-camera-pic-file">
															


															<span class="mobile-camera"></span>
														</label>
													</div>
													<div class="desk hidden-xs hidden-sm">
														<fmt:message key="eliteTerms.documentUpload.Drag.and.drop" bundle="${msg}" />
													</div>
													<![endif]-->
													<div class="mob-desk">
														<span class="OR"><fmt:message key="eliteTerms.documentUpload.or" bundle="${msg}" /></span>
													</div>
													<div class="mob-desk">
														<label for="hkidFileToUpload" class="orange-select-file">
															<input type="file" id="hkidFileToUpload" accept="image/jpeg,image/jpg,image/png" onchange="fileSelected('hkid-copy-progress','hkidFileToUpload','hkid-docu-filename','hkid-docu-fileSize','finish-upload-hkid','hkid-upload-percent-text','hkid-upload-progress-bar','', '#et-hkid-file-message');">
															<span class="input-file-text"><fmt:message key="eliteTerms.documentUpload.Select.files" bundle="${msg}" /></span>
														</label>
													</div>
												</div>
											</div>
											<input type="reset" class="sr-only" />
										</form>
										<span class="err-msg" id="et-hkid-file-message"></span>

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
										<div class="upload-copy-title">
											<h4><fmt:message key="eliteTerms.documentUpload.Your.passport.copy" bundle="${msg}" /></h4>

											<button type="button" class="et-minimal info passport orange-tooltip hidden-xs hidden-sm" data-container="body" data-trigger="hover focus click" data-html="true" data-toggle="tooltip" data-placement="top" title="<fmt:message key="eliteTerms.documentUpload.Your.passport.copy.tooltip" bundle="${msg}" />" data-template='<div class="tooltip et-sp-tooltip-wrapper" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>'><span class="et-info-tooltip "></span>
											</button>

											<h5><fmt:message key="eliteTerms.documentUpload.If.you.are" bundle="${msg}" /></h5>
										</div>
										<form action="upload-documents" id="passport-upload-form" class="upload-form">
											<div class="finish-upload hidden" id="finish-upload-passport">
												<div class="center-align">
													<span class="finish-upload-check"></span>
												</div>
											</div>
											<input type="file" id="fileToUpload-passport-dragAndDrop" class="hidden" accept="image/jpeg,image/jpg,image/png" >
											<div class="select-file-passport" id="passport-drop-zone" for="fileToUpload-passport-dragAndDrop">
												<div class="finish-upload hidden" id="finish-upload-passport">
													<div class="center-align">
														<span class="finish-upload-check"></span>
													</div>
												</div>
												<div class="select-file-section" id="select-file-section">
													<div class="mob hidden-md hidden-lg">
														<label for="passportFileToUpload" class="mobile-camera-pic-file">
															


															<span class="mobile-camera"></span>
														</label>
													</div>
													<div class="desk hidden-xs hidden-sm">
														<fmt:message key="eliteTerms.documentUpload.Drag.and.drop" bundle="${msg}" />
													</div>
													<![endif]-->
													<div class="mob-desk">
														<span class="OR"><fmt:message key="eliteTerms.documentUpload.or" bundle="${msg}" /></span>
													</div>
													<div class="mob-desk">
														<label for="passportFileToUpload" class="orange-select-file">
															<input type="file" id="passportFileToUpload" accept="image/jpeg,image/jpg,image/png" onchange="fileSelected('passport-copy-progress','passportFileToUpload','passport-docu-filename','passport-docu-fileSize','finish-upload-passport','passport-upload-percent-text','passport-upload-progress-bar','', '#et-passport-file-message');">
															<span class="input-file-text"><fmt:message key="eliteTerms.documentUpload.Select.files" bundle="${msg}" /></span>
														</label>
													</div>
												</div>
											</div>
											<input type="reset" class="sr-only"/>
										</form>
										 <span class="err-msg" id="et-passport-file-message"></span>

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
										<div class="upload-copy-title">
											<h4><fmt:message key="eliteTerms.documentUpload.Proof.of.address" bundle="${msg}" /></h4>

											<!--<button type="button" class="et-minimal info addr orange-tooltip hidden-xs hidden-sm" data-container="body" data-trigger="hover focus click" data-html="true" data-toggle="tooltip" data-placement="top" title="<fmt:message key="eliteTerms.documentUpload.Proof.of.address.tooltip" bundle="${msg}" />" data-template='<div class="tooltip et-sp-tooltip-wrapper" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>'><span class="et-info-tooltip "></span>
											</button>-->

											<h5>
												<fmt:message key="eliteTerms.documentUpload.Your.current.residential" bundle="${msg}" />
												<a href="<%=request.getContextPath()%>/<fmt:message key="link.address.proof" bundle="${msg}" />" target="_blank">
													<fmt:message key="eliteTerms.documentUpload.Your.current.residential.validProof" bundle="${msg}" />
												</a>
											</h5>
										</div>
										<form action="upload-documents" id="js-upload-form" method="POST" class="upload-form">
											<div class="finish-upload hidden" id="finish-upload-addr">
												<div class="center-align">
													<span class="finish-upload-check"></span>
												</div>
											</div>
											<input type="file" id="fileToUpload-addr-dragAndDrop" class="hidden" accept="image/jpeg,image/jpg,image/png">
											<div class="select-file" id="drop-zone" for="fileToUpload-addr-dragAndDrop">	
												<div class="select-file-section" id="select-file-section-address">
													<div class="mob hidden-md hidden-lg">
														<label for="fileToUploadProofAdd" class="mobile-camera-pic-file">
															 


															<span class="mobile-camera"></span>
														</label>
													</div>
													<div class="desk hidden-xs hidden-sm">
														<fmt:message key="eliteTerms.documentUpload.Drag.and.drop" bundle="${msg}" />
													</div>
													<![endif]-->
													<div class="mob-desk">
														<span class="OR"><fmt:message key="eliteTerms.documentUpload.or" bundle="${msg}" /></span>
													</div>
													<div class="mob-desk">
														<label for="fileToUploadProofAdd" class="orange-select-file">
															<input type="file" id="fileToUploadProofAdd" accept="image/jpeg,image/jpg,image/png" onchange="fileSelected('proof-of-address-progress','fileToUploadProofAdd','address-docu-filename','address-docu-fileSize','finish-upload-addr','docu-upload-percent-text','document-upload-progress-bar','', '#et-address-file-message');">
															<span class="input-file-text"><fmt:message key="eliteTerms.documentUpload.Select.files" bundle="${msg}" /></span>
														</label>
													</div>
												</div>
											</div>
											<input type="reset" class="sr-only" />
										</form>
										<span class="err-msg" id="et-address-file-message"></span>

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
								
								<div class="iframe-holder hidden">
									<button type="button" class="et-minimal info passport orange-tooltip et-du-passport-tooltip" data-container="body" data-trigger="hover focus click" data-html="true" data-toggle="tooltip" data-placement="top" title="<fmt:message key="eliteTerms.documentUpload.Your.passport.copy.tooltip" bundle="${msg}" />" data-template='<div class="tooltip et-sp-tooltip-wrapper" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>'><span class="et-info-tooltip "></span></button>
									
									<iframe id="iframe-one" src="<%=request.getContextPath()%>/${language}/term-life-insurance/document-upload-hkid" onLoad="isUploaded(this.id);" class="upload-ie-iframe"></iframe>
									<iframe id="iframe-two" src="<%=request.getContextPath()%>/${language}/term-life-insurance/document-upload-passport" onLoad="isUploaded(this.id);" class="upload-ie-iframe-second"></iframe>
									<iframe id="iframe-three" src="<%=request.getContextPath()%>/${language}/term-life-insurance/document-upload-address" onLoad="isUploaded(this.id);" class="upload-ie-iframe-third"></iframe>
						
                        		</div>

								<div class="col-xs-12 col-md-12">
									<p class="notice"><span class="asterisk">* </span><fmt:message key="eliteTerms.documentUpload.Policy.remarks" bundle="${msg}" /></p>
								</div>
							</div>					
						</div>
                  	</div> <!-- PAGE CONTENT -->
					<div class="submit-btn" id="submit-btn">
						<button id="et-upload-doc-submit-btn" type="button" class="btn next"><fmt:message key="eliteTerms.button.complete" bundle="${msg}" /></button>
						<button id="iframe-et-upload-doc-submit-btn" type="button" class="btn next hide-element"><fmt:message key="eliteTerms.button.complete" bundle="${msg}" /></button>
					</div>
					<div class="elite-home-btn hidden" id="elite-home-btn">
						<button id="et-upload-doc-home-btn" type="button" class="btn next"><fmt:message key="eliteTerms.button.complete" bundle="${msg}" /></button>
					</div>
					<div class="link-button hidden" id="upload-link-btn">
						<button type="button" class="btn next"><fmt:message key="eliteTerms.documentUpload.Send.me.the.link" bundle="${msg}" /></button>
					</div>
					
				</div>
               
			</div>
            
		</div>
			
			<!-- FOOTER -->
			
		</div>
		      <div id="back-to-homek-to-home-modal" class="modal fade fwd-generic-modal back-to-home" role="dialog" data-keyboard="false" data-backdrop="static">
            <div class="modal-dialog">
                <div class="modal-content" align="center">
                  <div class="modal-body" style="color:#fc6d08">
                     <p><fmt:message key="eliteTerms.selectPlan.successfully.submitted" bundle="${msg}" /></p>	
                  </div>
                  <div>
                     <button type="button" class="btn btn-orange et-next-btn et-pad-bot-50" id="et-select-plan-go-homepage" data-dismiss="modal"><fmt:message key="eliteTerms.selectPlan.Back.to.homepage" bundle="${msg}" /></button>
                  </div>
               </div>

               
               <!--<div class="modal-content">
                  <div class="modal-header">
                     <h4 class="modal-title">Your request has been successfully submitted.</h4>
                  </div>
                     
                  <div class="modal-body"></div>
                  
                  <div class="modal-footer">
                     <a href="/" title="Back to homepage" class="btn-block">Back to homepage</a>
                     <button type="button" class="btn btn-orange et-next-btn et-pad-bot-50" id="et-select-plan-go-homepage" data-dismiss="modal"><fmt:message key="eliteTerms.selectPlan.Back.to.homepage" bundle="${msg}" /></button>
                  </div>
               </div>-->

            </div>
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
							  window.location.href= '<%=request.getContextPath()%>/${language}/term-life-insurance';
							});
	                 	</script>
		              </div>
		           </div>
		        </div>
		     </div>
		  </div>
		</div>
			
		<!-- JS INCLUDES -->
		<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/elite-term/elite-term.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/vendor/fwd-dropzone.js"></script>
		<script language="javascript">
			
		//iframe
		uploadIe();
		//tooltip
		tooltip();
		
		$(window).on('resize', function(){
			tooltip();
		});
		
			$('#residence-check').click(function(){
				$('.passport-holder').toggle();
				if(msieversion() > 0) {
					
	               	if( $('#iframe-two').hasClass('hide-element') ){
	                  $('#iframe-three').css('left', '68%');
	                  $('#iframe-two').removeClass('hide-element');
	                  $('.iframe-holder .et-du-passport-tooltip').removeClass('hide-element');
	               	} else {
	                  $('#iframe-three').css('left', '34%');
	                  $('#iframe-two').addClass('hide-element');
	                  $('.iframe-holder .et-du-passport-tooltip').addClass('hide-element');
	               	}
				}
			})
			
			function goodbye(e) {
            	if(!e) e = window.event;
                e.cancelBubble = true;
              	e.returnValue = 'Some inputs or changes may not have been saved yet.'; 

              	if (e.stopPropagation) {
                    e.stopPropagation();
                    e.preventDefault();
               }	
            }
            window.onbeforeunload=goodbye; 

            // Form file validation
            $('#et-upload-doc-submit-btn').on('click', function(e) {
            	
            	 ga('create', 'UA-60032236-1', 'auto');
            	 ga('send', 'pageview', '/${language}/term-life-insurance/document-upload'); 
            	
                var $self = $(this);
                var isValid = isHkidValidity($self);
                    isValid = isValid && isPassportValidity($self);
                    isValid = isValid && isProfAddValidity($self);
                
                if (isValid) {     
                    $self.removeAttr('disabled');
                    //window.location.href= contextPath+'/'+language+'/term-life-insurance/'+documentUploadNextPageFlow;
                    
                } else {
                    $self.attr('disabled', 'disabled');
                    //alert(getBundle(getBundleLanguage, 'error.upload.invalid'));
                }
            });
            
			// Back to home button
			$('#et-upload-doc-home-btn').on('click', function(e) {
				 if(checkLogin()){
					window.location.href= '<%=request.getContextPath()%>/${language}/term-life-insurance/confirmation';
				}
			})
			
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
						setTimeout(function(){
							//$('#'+id).contents().find('#upload-system-error .en').removeClass('hidden');
							var el_err = document.getElementById(id).contentWindow.document.querySelectorAll('#upload-system-error span.en')[0];

							if( el_err ){
								el_err.className = el_err.className.replace('hidden', '');
							}

						}, 1000);
					}
					else {
						setTimeout(function(){
							//$('#'+id).contents().find('#upload-system-error .ch').removeClass('hidden');

							var el_err = document.getElementById(id).contentWindow.document.querySelectorAll('#upload-system-error span.ch')[0];

							if( el_err ){
								el_err.className = el_err.className.replace('hidden', '');
							}
						}, 1000);
					}
				}

				//set 
			}
			function tooltip() {
				if(getWidth() > 1100) {
					$('.chin .fwd-et-wrapper .document-upload .upload-now-section .et-du-passport-tooltip').css('left','51.4%');
					$('.fwd-et-wrapper .document-upload .upload-now-section .et-du-passport-tooltip').css('left','51.4%');
				}
				else {
					$('.chin .fwd-et-wrapper .document-upload .upload-now-section .et-du-passport-tooltip').removeAttr('style');
					$('.fwd-et-wrapper .document-upload .upload-now-section .et-du-passport-tooltip').removeAttr('style');
				}
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
					}
					else {
						$('.upload-ie-iframe').css({'width': '140%', 'border': 'none', 'height': '550px'});
						$('.upload-ie-iframe-second').css({'width': '140%', 'border': 'none', 'height': '550px','position':'absolute','top':'0','left':'34%'});
						$('.upload-ie-iframe-third').css({'width': '140%', 'border': 'none', 'height': '550px','position':'absolute','top':'0','left':'68%'});
					}
				}
			}

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
                    removeFormFieldError('#et-hkid-file-message', '', true);
           
                    // Process hkid file here
                } else {
                    removeFormFieldError('#et-hkid-file-message', 'required-hkid');
                    addFormFieldError('#et-hkid-file-message', getBundle(getBundleLanguage, 'error.hkid.document.empty'), 'required-hkid');
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
                    removeFormFieldError('#et-passport-file-message', '', true);
                    
                    // Process passport file here
                } else {
                    removeFormFieldError('#et-passport-file-message', 'required-hkid');
                    addFormFieldError('#et-passport-file-message', getBundle(getBundleLanguage, 'error.passport.document.empty'), 'required-hkid');

                    isValid = false;
                }
                
                return isValid;
            }
            
            // Check if proof of address is valid
            function isProfAddValidity() {
                if ($('#residence-check').prop('checked')) {
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
                    removeFormFieldError('#et-address-file-message', '', true);
                    
                    // Process proof of address file here
                } else {
                    removeFormFieldError('#et-address-file-message', 'required-hkid');
                    addFormFieldError('#et-address-file-message', getBundle(getBundleLanguage, 'error.address.proof.empty'), 'required-hkid');

                    isValid = false;
                }
                
                return isValid;
            }
            $(function() {
            	var errorMessageType = "${errorMessageType}";
            	var userName = "${username}";
                var policyUserName = "${policyUserName}";
                var authenticate = "${authenticate}";

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
			});
            
            function checkLogin() {
            	if("${authenticate}" == "true" && "${authenticate}" != "*DIRECTGI"){
					return true;
				}else{
					$('#loginpopup').modal('show');
					return false;
				}
			}
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
         $(document).ready(function() {
        	 ga('create', 'UA-60032236-1', 'auto');
             ga('require', 'ecommerce');
             ga('ecommerce:addTransaction', {
              'id': '${eliteTermPolicy.transactionNumber }', // Transaction ID. Required.
              'revenue': '${eliteTermPremium.monthlyDuePremium*2}', // Grand Total.
              'affiliation': 'Protect', // Insurance type, e.g. Life
               'currency': 'HKD'
              });
             ga('ecommerce:addItem', {
                  'id': '${eliteTermPolicy.transactionNumber }', // Transaction ID. Required
                  'name': 'Elite Term', // Product name. Required
                  'category': 'Life', // Category or variation
                  'price': '${eliteTermPremium.monthlyPremium}', // Unit price
                  'quantity': '2',
                  'currency': 'HKD'
                });
             ga('ecommerce:send');


        	/* Initialize tooltip */
			$(function () {
				$('[data-toggle="tooltip"]').tooltip()
			});

			/* Toggle Upload Later */
			$("input[type='radio']").click(function(){
				if( $(this).attr('id') == 'upload-later'){
					$('#upload-now-section').addClass('hidden');
					$('#upload-later-section').removeClass('hidden');
					$('#submit-btn').addClass('hidden');
					$('#elite-home-btn').removeClass('hidden');
					window.onbeforeunload = null;
				} else {
					$('#upload-now-section').removeClass('hidden');
					$('#upload-later-section').addClass('hidden');
					$('#submit-btn').removeClass('hidden');
					$('#elite-home-btn').addClass('hidden');
				}
			});
			
	     });
		</script>
