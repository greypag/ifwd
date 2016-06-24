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
								<div class="col-xs-12 col-md-4 so-upload upload-hkid upload-iframe-height">
									<h5 class="so-h5"><fmt:message key="label.hkid" bundle="${msg}" /></h5>
									<h6 class="so-h6 upload-bottom"><fmt:message key="label.upload.your.hkid" bundle="${msg}" /></h6>
									<form  id="hkid-upload-form" class="upload-form select-iframe" action="" method="post" enctype="multipart/form-data">
										<div class="finish-upload hidden" id="finish-upload-hkid">
											<div class="center-align">
												<span class="finish-upload-check"></span>
											</div>
										</div>
										<div class="select-file-hkid select-zone" id="hkid-drop-zone" for="fileToUpload-hkid-dragAndDrop">
											<div class="finish-upload hidden" id="finish-upload-hkid">
												<div class="center-align">
													<span class="finish-upload-check"></span>
												</div>
											</div>
											<div class="select-file-section" id="select-file-section">
												<div class="mob hidden-md hidden-lg">
													<label for="hkidFileToUploadCam" class="mobile-camera-pic-file">
														<input type="file" id="hkidFileToUploadCam" name="hkidFileToUploadCam" onchange="upload(this.id);">
														<span class="drag-cam">
															<i class="fa fa-camera"></i>
														</span>
													</label>
												</div>
												<div class="desk hidden-xs hidden-sm">
													<fmt:message key="label.upload.box.copy" bundle="${msg}" />
												</div>
												<div class="mob-desk or">
													<span class="OR">or</span>
												</div>
												<div class="mob-desk">
													<label for="iframeHkidFileToUpload" class="orange-select-file">
														<input type="file" id="iframeHkidFileToUpload" name="iframeHkidFileToUpload" onchange="upload(this.id);">
														<span class="input-file-text"><fmt:message key="button.select.files" bundle="${msg}" /></span>
													</label>
												</div>
											</div>
										</div>
									</form>
									<span class="hidden upload-error" style="color:red; font-size:14px; display:block; text-align:center">No file selected</span>
									<span id="upload-system-error" class="upload-error" style="color:red; font-size:14px; display:block; text-align:center"><span class="ch hidden">上載失敗。請重新嘗試。</span><span class="en hidden">Upload failed. Please try again.</span> </span>
									<div class="document-upload-progress iframe hidden" id="hkid-copy-progress">
										<div class="clearfix">
											<div class="pull-left">
												<span id="hkid-docu-filename">Yourfiles.pdf </span>
											</div>
										</div>
									</div>
									<div class="text-center">
										<button type="button" class="btn next upload-iframe" id="hkid-upload-now"><fmt:message key="upload.button" bundle="${msg}" /></button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- FOOTER -->
		</div>
		<!-- JS INCLUDES -->
		<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/savie-online/savie-online.js"></script>
		<script type="text/javascript">
			var language = "en";
			
			$(document).on('click', '#hkid-upload-now', function(e) {
				if(fHkidValid()) {
					$('#hkid-upload-form').submit();
				}
				else {
					$('#hkid-upload-form').next('.upload-error').removeClass('hidden');
				}
			});
			
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
			
			function fHkidValid() {
				return $('#iframeHkidFileToUpload').val()!='' || $('#hkidFileToUploadCam').val()!='';
			}
			
			function finishUploadHkid() {
				var frameSrc = window.frameElement.getAttribute('src') || '';
				return frameSrc.indexOf('uploadResult=true') > -1; 
			}
		</script>
		<style>
			#hkid-copy-progress {
				margin-top: 6px;
			}
		</style>
	</body>
</html>