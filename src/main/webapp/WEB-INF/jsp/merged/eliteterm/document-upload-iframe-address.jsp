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
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/styles-et.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css">
<script type="text/javascript">
var context = "${pageContext.request.contextPath}";
var documentUploadNextPageFlow = "${nextPageFlow}";
var languageP = "${language}";
</script>
		<%!
			boolean isSaleActiveClass = false;
			boolean isEservicesActiveClass = false;
		%>
		<div class="fwd-savie-wrapper">
			
	
			<!-- <div>-->
				<div class="container-fluid fwd-container iframe-container">
					<div class="document-upload page-application et-document-upload upload-iframe">	
						 <div class="upload-now-section " id="upload-now-section">							
							<div class="row upload-now-row">
								<div class="col-xs-12 col-md-4 upload-iframe-height">
									<h4><fmt:message key="eliteTerms.documentUpload.Proof.of.address" bundle="${msg}" /></h4>
									<!--<button type="button" class="et-minimal info addr orange-tooltip hidden-xs hidden-sm" data-container="body" data-trigger="hover focus click" data-html="true" data-toggle="tooltip" data-placement="top" title="<fmt:message key="eliteTerms.documentUpload.Proof.of.address.tooltip" bundle="${msg}" />" data-template='<div class="tooltip et-sp-tooltip-wrapper" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>'><span class="et-info-tooltip "></span>
										</button>-->
									<h5 class="resident-address-desc">
										<fmt:message key="eliteTerms.documentUpload.Your.current.residential" bundle="${msg}" />
										<a class="et-valid-proof" href="<%=request.getContextPath()%>/<fmt:message key="link.address.proof" bundle="${msg}" />" target="_blank">
											<fmt:message key="eliteTerms.documentUpload.Your.current.residential.validProof" bundle="${msg}" />
										</a>
									</h5>
									
									<form id="address-upload-form" class="upload-form select-iframe" action="${pageContext.request.contextPath}/ajax/eliteTerm/postEliteTermImage" method="post" enctype="multipart/form-data">
										<div class="finish-upload hidden" id="finish-upload-addr">
											<div class="center-align">
												<span class="finish-upload-check"></span>
											</div>
										</div>
										<div class="select-file" id="drop-zone" for="fileToUpload-addr-dragAndDrop">	
											<div class="select-file-section" id="select-file-section-address">
												<div class="mob hidden-md hidden-lg">
													<label for="fileToUpload-addr-cam" class="mobile-camera-pic-file">
														<input type="file" id="fileToUpload-addr-cam" name="fileToUpload-addr-cam" onchange="upload(this.id);">
														<span class="mobile-camera"></span>
													</label>
												</div>
												<div class="mob-desk hidden-lg hidden-md">
													<span class="OR"><fmt:message key="eliteTerms.documentUpload.or" bundle="${msg}" /></span>
												</div>
												
												<div class="mob-desk">
													<label for="iframeFileToUpload" class="orange-select-file">
														<input type="file" id="iframeFileToUpload" name="iframeFileToUpload" onchange="upload(this.id);">
														<span class="input-file-text"><fmt:message key="eliteTerms.documentUpload.Select.files" bundle="${msg}" /></span>
													</label>
												</div>
											</div>
										</div>
									</form>
									<span class="hidden upload-error" style="color:red; font-size:14px; display:block; text-align:center">No file selected</span>
									<span id="upload-system-error" class="upload-error" style="color:red; font-size:14px; display:block; text-align:center"><span class="ch hidden">上載失敗。請重新嘗試。</span><span class="en hidden">Upload failed. Please try again.</span> </span>
									<div class="document-upload-progress iframe hidden" id="proof-of-address-progress">
										<div class="clearfix">
											<div class="pull-left document-filename">
												<span id="address-docu-filename">Yourfiles.pdf </span>
											</div>
										</div>
									</div>
									<div class="text-center"><button type="button" class="btn next upload-iframe" id="address-upload-now"><fmt:message key="upload.button" bundle="${msg}" /></button></div>
								</div>
							</div>
							
						</div>
					</div>
				</div>
			<!--  </div> -->
			
		</div>
		<!-- JS INCLUDES -->
		<script src="<%=request.getContextPath()%>/resources/js/vendor/jquery.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/vendor/bootstrap.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/custom.js"></script>
		<script type="text/javascript">
			
			$(document).on('click', '#address-upload-now', function(e) {
				if(fAddrValid()) {
					//parent.isDis2Sub();
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
				//return !$("#finish-upload-addr").hasClass("hidden");
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