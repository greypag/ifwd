<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page import="com.ifwd.fwdhk.model.HomeQuoteBean"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
									<h4><fmt:message key="eliteTerms.documentUpload.Your.HK.ID" bundle="${msg}" /></h4>
									<!--<button type="button" class="et-minimal info hkid orange-tooltip hidden-xs hidden-sm" data-container="body" data-trigger="hover focus click" data-html="true" data-toggle="tooltip" data-placement="top" title="<fmt:message key="eliteTerms.documentUpload.Upload.your.HKID.tooltip" bundle="${msg}" />" data-template='<div class="tooltip et-sp-tooltip-wrapper" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>'><span class="et-info-tooltip "></span>
											</button>-->
									<h5><fmt:message key="eliteTerms.documentUpload.Upload.your.HKID" bundle="${msg}" /></h5>
									<br />
									<form  id="hkid-upload-form" class="upload-form select-iframe" action="${pageContext.request.contextPath}/ajax/eliteTerm/postEliteTermImage" method="post" enctype="multipart/form-data">
										<div class="finish-upload hidden" id="finish-upload-hkid">
											<div class="center-align">
												<span class="finish-upload-check"></span>
											</div>
										</div>
										<div class="select-file-hkid" id="hkid-drop-zone" for="fileToUpload-hkid-dragAndDrop">
											<div class="finish-upload hidden" id="finish-upload-hkid">
												<div class="center-align">
													<span class="finish-upload-check"></span>
												</div>
											</div>
											<div class="select-file-section" id="select-file-section">
												<div class="mob hidden-md hidden-lg">
													<label for="hkidFileToUploadCam" class="mobile-camera-pic-file">
														<input type="file" id="fileToUpload-hkid-dragAndDrop" name="hkidFileToUploadCam" onchange="upload(this.id);">
														<span class="mobile-camera"></span>
													</label>
												</div>
												<div class="mob-desk hidden-lg hidden-md">
													<span class="OR"><fmt:message key="eliteTerms.documentUpload.or" bundle="${msg}" /></span>
												</div>
												
												<div class="mob-desk">
													<label for="hkidFileToUpload" class="orange-select-file">
														<input type="file" id="hkidFileToUpload" name="hkidFileToUpload" onchange="upload(this.id);">
														<span class="input-file-text"><fmt:message key="eliteTerms.documentUpload.Select.files" bundle="${msg}" /></span>
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

									<div class="text-center"><button type="button" class="btn next upload-iframe" id="hkid-upload-now"><fmt:message key="upload.button" bundle="${msg}" /></button></div>
								</div>
			
		</div>
		<!-- JS INCLUDES -->
		<script src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/custom.js"></script>


		<script type="text/javascript">

			$(document).on('click', '#hkid-upload-now', function(e) {
				if($('#hkidFileToUpload').val()!='' || $('#hkidFileToUploadCam').val()!='') {
					$('#hkid-upload-form').submit();
				}
				else {
					$('#hkid-upload-form').next('.upload-error').removeClass('hidden');
				}
			});
			
			var check = <%=request.getParameter("uploadResult")%>;
			console.log(check);
			if(check==true) {
				$('.select-file-section').addClass('hidden');
				$('.upload-form').find('.finish-upload').removeClass('hidden');
				$('.upload-iframe-height').find('.document-upload-progress').removeClass('hidden');
				$('.upload-form').next('.upload-error').addClass('hidden');
				$('.upload-iframe-height').find('button.upload-iframe').addClass('hidden');
			}

		</script>

	</body>
</html>