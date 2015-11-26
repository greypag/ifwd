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
		<div class="fwd-savie-wrapper">
			
	
			<div>
				<div class="container-fluid fwd-container iframe-container">
					<div class="document-upload page-application et-document-upload upload-iframe">	
						 <div class="upload-now-section " id="upload-now-section">							
							<div class="row upload-now-row">
								<div class="col-xs-12 col-md-4 upload-iframe-height">
									<h4>Your HK ID</h4><button class="info hkid orange-tooltip" type="button" data-toggle="tooltip" data-placement="right" title="Lorem Ipsum"></button>
									<h5>Upload your HKID and proof of address</h5>
									<form  id="hkid-upload-form" class="upload-form select-iframe" action="http://52.74.209.219/sample-upload/upload.php" method="post" enctype="multipart/form-data">
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
														<input type="file" id="hkidFileToUploadCam" name="hkidFileToUploadCam" onchange="upload(this.id);">
														<span class="mobile-camera"></span>
													</label>
												</div>
												<div class="mob-desk hidden-lg hidden-md">
													<span class="OR">or</span>
												</div>
												
												<div class="mob-desk">
													<label for="hkidFileToUpload" class="orange-select-file">
														<input type="file" id="hkidFileToUpload" name="hkidFileToUpload" onchange="upload(this.id);">
														<span class="input-file-text">Select files</span>
													</label>
												</div>
											</div>
										</div>
									</form>
									<span class="hidden upload-error" style="color:red; font-size:14px; display:block; text-align:center">No file selected</span>
									<div class="document-upload-progress iframe hidden" id="hkid-copy-progress">
										<div class="clearfix">
											<div class="pull-left">
												<span id="hkid-docu-filename">Yourfiles.pdf </span>
											</div>
										</div>
									</div>

									<div class="text-center"><button type="button" class="btn next upload-iframe" id="hkid-upload-now">Upload now</button></div>
								</div>
								<!-- <div class="col-xs-12 col-md-4 upload-iframe-height" id="passport-section">
									<h4>Your passport copy</h4><button class="info passport orange-tooltip" type="button" data-toggle="tooltip" data-placement="right" title="Lorem Ipsum"></button>
									<h5>If you are a non-permanent resident</h5>
									<form id="passport-upload-form" class="upload-form" action="http://52.74.209.219/sample-upload/upload.php" method="post" enctype="multipart/form-data">
										<div class="finish-upload hidden" id="finish-upload-passport">
											<div class="center-align">
												<span class="finish-upload-check"></span>
											</div>
										</div>
										<div class="select-file-passport" id="passport-drop-zone" for="fileToUpload-passport-dragAndDrop">
											<div class="finish-upload hidden" id="finish-upload">
												<div class="center-align">
													<span class="finish-upload-check"></span>
												</div>
											</div>
											<div class="select-file-section" id="select-file-section">
												<div class="mob hidden-md hidden-lg">
													<label for="fileToUpload-passport-cam" class="mobile-camera-pic-file">
														<input type="file" id="fileToUpload-passport-cam" name="fileToUpload-passport-cam" onchange="upload(this.id);">
														<span class="mobile-camera"></span>
													</label>
												</div>
												<div class="mob-desk hidden-lg hidden-md">
													<span class="OR">or</span>
												</div>
												
												<div class="mob-desk">
													<label for="passportFileToUpload" class="orange-select-file">
														<input type="file" id="passportFileToUpload" name="passportFileToUpload" onchange="upload(this.id);">
														<span class="input-file-text">Select files</span>
													</label>
												</div>
											</div>
										</div>
									</form>
									<span class="hidden upload-error" style="color:red; font-size:14px; display:block; text-align:center">No file selected</span>
									<div class="document-upload-progress iframe hidden" id="passport-copy-progress">
										<div class="clearfix">
											<div class="pull-left">
												<span id="passport-docu-filename">Yourfiles.pdf </span>
											</div>									
										</div>
									</div>
									<div class="text-center"><button type="button" class="btn next upload-iframe" id="passport-upload-now">Upload now</button></div>
								</div>
								<div class="col-xs-12 col-md-4 upload-iframe-height">
									<h4>Proof of address</h4><button class="info addr orange-tooltip" type="button" data-toggle="tooltip" data-placement="right" title="Lorem Ipsum"></button>
									<h5>Your current residential address</h5>
									<form id="address-upload-form" class="upload-form" action="http://52.74.209.219/sample-upload/upload.php" method="post" enctype="multipart/form-data">
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
													<span class="OR">or</span>
												</div>
												
												<div class="mob-desk">
													<label for="fileToUpload" class="orange-select-file">
														<input type="file" id="fileToUpload" name="fileToUpload" onchange="upload(this.id);">
														<span class="input-file-text">Select files</span>
													</label>
												</div>
											</div>
										</div>
									</form>
									<span class="hidden upload-error" style="color:red; font-size:14px; display:block; text-align:center">No file selected</span>
									<div class="document-upload-progress iframe hidden" id="proof-of-address-progress">
										<div class="clearfix">
											<div class="pull-left">
												<span id="address-docu-filename">Yourfiles.pdf </span>
											</div>
										</div>
									</div>
									<div class="text-center"><button type="button" class="btn next upload-iframe" id="address-upload-now">Upload now</button></div>
								</div> -->
							</div>
							
						</div>
					</div>
				</div>
			</div>
			
		</div>
		<!-- JS INCLUDES -->
		
		<%@include file="includes/js-include.jsp" %>

		<script type="text/javascript">

			ieUpload();

			$(window).on('resize', function(){
				ieUpload();
			});
			$(document).on('click', '#hkid-upload-now', function(e) {
				if($('#hkidFileToUpload').val()!='' || $('#hkidFileToUploadCam').val()!='') {
					$('#hkid-upload-form').submit();
				}
				else {
					$('#hkid-upload-form').next('.upload-error').removeClass('hidden');
				}
			});

			$(document).on('click', '#passport-upload-now', function(e) {
				if($('#passportFileToUpload').val()!='' || $('#fileToUpload-passport-cam').val()!='') {
					$('#passport-upload-form').submit();
				}
				else {
					$('#passport-upload-form').next('.upload-error').removeClass('hidden');
				}
			});

			$(document).on('click', '#address-upload-now', function(e) {
				if($('#fileToUpload').val()!='' || $('#fileToUpload-addr-cam').val()!='') {
					$('#address-upload-form').submit();
				}
				else {
					$('#address-upload-form').next('.upload-error').removeClass('hidden');
				}
			});
		</script>

	</body>
</html>