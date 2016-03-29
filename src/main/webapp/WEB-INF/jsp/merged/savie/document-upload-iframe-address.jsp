<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeQuoteBean"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<script type="text/javascript">
var context = "${pageContext.request.contextPath}";
var documentUploadNextPageFlow = "${nextPageFlow}";
var languageP = "${language}";
</script>

		<%!
			boolean isSaleActiveClass = false;
			boolean isEservicesActiveClass = false;
		%>
		<div class="fwd-savie-wrapper savie-online-container with-breadcrumbs-steps headerStick" id="upload-document-page">	   <!-- HEADER -->
			<!-- UPLOAD DOCUMENT BLOCK -->
			<div id="so-upload-document-section">
				<div class="container-fluid fwd-container up-doc-page">
					<div class="fwd-container-limit clearfix sidebar personal-info-widget page-application et-application-page document-upload upload-iframe">
						<div class="upload-now-section" id="upload-now-section">
							<div class="row upload-now-row">
								<div class="col-xs-12 col-md-4 so-upload upload-iframe-height" id="proof-address-holder">
									<h5 class="so-h5"><fmt:message key="label.proof.of.address" bundle="${msg}" /></h5>
									<h6 class="so-h6"><fmt:message key="label.upload.address.proof.copy1" bundle="${msg}" />
										<span class="text-bold upload-h6"><a href="#" class="text-bold upload-link" data-toggle="modal" data-target=".modal-address-prof"><fmt:message key="label.upload.address.proof.copy2" bundle="${msg}" /></a> <fmt:message key="label.upload.address.proof.copy3" bundle="${msg}" /></span>
									</h6>
									<form id="address-upload-form" class="upload-form select-iframe" action="" method="post" enctype="multipart/form-data">
										<div class="finish-upload hidden" id="finish-upload-addr">
											<div class="center-align">
												<span class="finish-upload-check"></span>
											</div>
										</div>
										<div class="select-file select-zone" id="drop-zone" for="fileToUpload-addr-dragAndDrop">
											<div class="select-file-section" id="select-file-section-address">
												<div class="mob hidden-md hidden-lg">
													<label for="fileToUpload-addr-cam" class="mobile-camera-pic-file">
														<input type="file" id="fileToUpload-addr-cam" name="fileToUpload-addr-cam" onchange="upload(this.id);">
														<span class="drag-cam">
															<i class="fa fa-camera"></i>
														</span>
													</label>
												</div>
												<div class="text-bold desk hidden-xs hidden-sm">
													<fmt:message key="label.upload.box.copy" bundle="${msg}" />
												</div>
												<div class="mob-desk or">
													<span class="OR">or</span>
												</div>
												<div class="mob-desk">
													<label for="iframeFileToUpload" class="orange-select-file">
														<input type="file" id="iframeFileToUpload" name="iframeFileToUpload" onchange="upload(this.id);">
														<span class="input-file-text"><fmt:message key="button.select.files" bundle="${msg}" /></span>
													</label>
												</div>
											</div>
										</div>
									</form>
									<span class="hidden upload-error" style="color:red; font-size:14px; display:block; text-align:center">No file selected</span>
									<span id="upload-system-error" class="upload-error" style="color:red; font-size:14px; display:block; text-align:center"><span class="ch hidden">上載失敗。請重新嘗試。</span><span class="en hidden">Upload failed. Please try again.</span> </span>
									<div class="document-upload-progress iframe hidden" id="proof-of-address-progress">
										<div class="clearfix">
											<div class="pull-left">
												<span id="address-docu-filename">Yourfiles.pdf </span>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="text-center">
								<button type="button" class="btn next upload-iframe" id="address-upload-now"><fmt:message key="upload.button" bundle="${msg}" /></button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- FOOTER -->
		</div>		
		<!-- JS INCLUDES -->
		<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/savie-online/savie-online.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/savie-2016/so-fwd-dropzone.js"></script>
		<script type="text/javascript">
			var language = "en";
			
			$(document).on('click', '#address-upload-now', function(e) {
				if(fAddrValid()) {
					$('#address-upload-form').submit();
				}
				else {
					$('#address-upload-form').next('.upload-error').removeClass('hidden');
				}
			});
			
			function fAddrValid() {
				return $('#iframeFileToUpload').val()!='' || $('#fileToUpload-addr-cam').val()!='';
			}
			
			function finishUploadAddr() {
				var frameSrc = window.frameElement.getAttribute('src') || '';
				return frameSrc.indexOf('uploadResult=true') > -1; 
			}
			
			var check = <%=request.getParameter("uploadResult")%>;
			if(check==true) {
				$('.select-file-section').addClass('hidden');
				$('.upload-form').find('.finish-upload').removeClass('hidden');
				$('.upload-iframe-height').find('.document-upload-progress').removeClass('hidden');
				$('.upload-form').next('.upload-error').addClass('hidden');
				$('.upload-iframe-height').find('button.upload-iframe').addClass('hidden');
				$('.document-filename').addClass('pull-left hidden');
				$('.document-filename').removeClass('text-center');
			} else {
				$('.document-filename').removeClass('pull-left hidden');
				$('.document-filename').addClass('text-center');
			}
		</script>
		<style>
			#proof-of-address-progress {
				margin-top: 6px;
			}
		</style>
	</body>
</html>