<%@page pageEncoding="UTF-8" %>
<!DOCTYPE html>

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
							<li class="step-number" id="first-step"><button type="button" class="et-header-info-btn completed-step"><i class="fa fa-check"></i>Select plan</button></li>
							<li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
							<li class="step-number"><button type="button" class="et-header-info-btn completed-step"><i class="fa fa-check"></i>Application &amp; payment</button></li>
							<li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
							<li class="step-number"><button type="button" class="et-header-info-btn completed-step"><i class="fa fa-check"></i>Summary &amp; declaration</button></li>
							<li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
							<li class="step-number"><button type="button" class="et-header-info-btn completed-step"><i class="fa fa-check"></i>Signature</button></li>
							<li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
							<li class="step-number"><button type="button" class="et-header-info-btn active"><span class="status">5</span>Document upload</button></li>
							<li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
							<li class="step-number"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">6</span>Confirmation</button></li>
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
							   <h3>Document upload</h3>
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
						<h4 class="so-h4">Please select the document upload options</h4>
						<div class="radio-group clearfix">
						  <div class="radio-button-group">
							 <div class="clearfix desktop-align left">
								<div class="pull-left radio-holder">
								   <input type="radio" id="upload-now-radio" name="upload" checked /> <label for="upload-now-radio"></label>
								</div>
								<div class="pull-left desc">
								   Upload now
								   <span>Upload your HKID and proof of address</span>
								</div>
							 </div>
							 <div class="clearfix below desktop-align">
								<div class="pull-left radio-holder">
								   <input type="radio" id="upload-later-radio" name="upload" /> <label for="upload-later-radio"></label>
								</div>
								<div class="pull-left desc">
								   Upload later
								   <span>Go to your profile and upload from there, later!</span>
								</div>
							 </div>
						  </div>
					   </div>
						<div class="upload-later-section hidden" id="upload-later-section">
							<div class="description">
								<p class="first-desc">You may upload the document when you have all of them ready from either the following:</p>
								<ol>
									<li class="second-desc">We will send you a confirmation email embeded with a upload link, you may access directly;</p>
									<li class="second-desc">You may login to your <span class="bold">eService</span> membership account, and upload the document under <span class="bold">Purchase History</span> section.</p>
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
											<span class="checkbox-text">I’m Hong Kong permanent resident</span>
										 </div>
									  </div>
								   </div>
								</div>
							</div>
							<div class="row upload-now-row">
								<div class="col-xs-12 col-md-4 so-upload upload-hkid">
									<h5 class="so-h5">Your HKID</h5>
									<h6 class="so-h6 upload-bottom">Upload your HKID</h6>
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
														<!-- <input type="file" id="hkidFileToUploadCam" /> -->
														<span class="drag-cam">
															<i class="fa fa-camera"></i>
														</span>
													</label>
												</div>
												<div class="desk hidden-xs hidden-sm">
													Drag and drop files here<span class="drag-down">(jpg or png)</span>
												</div>
												<div class="mob-desk or">
													<span class="OR">or</span>
												</div>
												<div class="mob-desk">
													<label for="hkidFileToUpload" class="orange-select-file">
														<input type="file" id="hkidFileToUpload" accept="application/pdf,image/gif,image/jpeg,image/jpg,image/png" onchange="fileSelected('hkid-copy-progress','hkidFileToUpload','hkid-docu-filename','hkid-docu-fileSize','finish-upload-hkid','hkid-upload-percent-text','hkid-upload-progress-bar','', '#so-hkid-file-message');" />
														<span class="input-file-text">Select files</span>
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
								<div class="col-xs-12 col-md-4 so-upload" id="passport-section">
									<h5 class="so-h5">Your passport copy</h5>
									<h6 class="so-h6 upload-bottom">If you are a non-permanent resident</h6>
									<form action="" id="passport-upload-form" method="POST" class="upload-form">
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
														<!-- <input type="file" id="fileToUpload-passport-cam" /> -->
														<span class="drag-cam">
															<i class="fa fa-camera"></i>
														</span>
													</label>
												</div>
												<div class="desk hidden-xs hidden-sm">
													Drag and drop files here<span class="drag-down">(jpg or png)</span>
												</div>
												<div class="mob-desk or">
													<span class="OR">or</span>
												</div>
												<div class="mob-desk">
													<label for="passportFileToUpload" class="orange-select-file">
														<input type="file" id="passportFileToUpload" accept="application/pdf,image/gif,image/jpeg,image/jpg,image/png" onchange="fileSelected('passport-copy-progress','passportFileToUpload','passport-docu-filename','passport-docu-fileSize','finish-upload-passport','passport-upload-percent-text','passport-upload-progress-bar','', '#so-passport-file-message');" />
														<span class="input-file-text">Select files</span>
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
									<h5 class="so-h5">Proof of address</h5>
									<h6 class="so-h6">Upload your current residential address copy
										<span class="upload-h6"><a href="#" class="upload-link" data-toggle="modal" data-target=".modal-address-prof">Valid address proof</a> (within 3 months)</span>
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
														<!-- <input type="file" id="fileToUpload-addr-cam" /> -->
														<span class="drag-cam">
															<i class="fa fa-camera"></i>
														</span>
													</label>
												</div>
												<div class="desk hidden-xs hidden-sm">
													Drag and drop files here<span class="drag-down">(jpg or png)</span>
												</div>
												<div class="mob-desk or">
													<span class="OR">or</span>
												</div>
												<div class="mob-desk">
													<label for="fileToUploadProofAdd" class="orange-select-file">
														<input type="file" id="fileToUploadProofAdd" accept="application/pdf,image/gif,image/jpeg,image/jpg,image/png" onchange="fileSelected('proof-of-address-progress','fileToUploadProofAdd','address-docu-filename','address-docu-fileSize','finish-upload-addr','docu-upload-percent-text','document-upload-progress-bar','', '#so-address-file-message');" />
														<span class="input-file-text">Select files</span>
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
							<div class="upload-note hidden-sm hidden-xs">
								<p class="upload-p"><span class="orange">*</span> Please upload all documentation within 30 days, otherwise your application will be void.</p>
							</div>
						</div>
						<div class="next-btn">
						  <button id="updoc-complete-btn" class="btn savie-common-btn upload-btn">Complete</button>
						</div>
					</div>
				</div>
			</div>
			<div class="modal fade modal-address-prof" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
				<div class="modal-dialog" id="dialog-address-prof">
					<div class="modal-content common-welcome-modal" id="modal-content-addressprof">	
						<div class="modal-header">
							<button type="button" class="close" id="close-address-prof" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							<p>Address proof</p>
						</div>
						<div class="modal-body" id="modal-body-addressprof">
							<ol>
							 	<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus nec felis ipsum. Vivamus nec dolor vitae neque maximus elementum ut ac ex.</li>
							 	<li>Vivamus porta nisl vitae metus aliquet, id tempus mi egestas. Nulla in felis enim. Nam augue enim, accumsan nec tortor et, pellentesque mollis elit. Nunc tempor nisi eu metus sodales dictum. Nunc non ligula commodo est gravida ornare. In molestie mattis magna at dictum. Mauris vel urna lacus.</li>
							  	<li id="thrid-li">Vestibulum et libero justo. Etiam nisl ex, fringilla vel ultricies et, dignissim viverra purus. Nulla at felis luctus, sodales diam ac, congue urna. Phasellus ac malesuada enim, eget condimentum lacus. Fusce ut ex erat. Etiam ut lobortis elit, vel commodo risus. </li>
							</ol>
						</div>
					</div>
				</div>
			</div>
			<!-- FOOTER -->
		</div>
		
		<!-- JS INCLUDES -->
		<script src="assets/js/savie-2016/so-fwd-dropzone.js"></script>
		<script type="text/javascript">
			$(document).ready(function() {
				var language = "en";
				
				// Toggle passport
				$('#hkPermanentRes').click(function() {
					$('#passport-section').toggle();
				});
				
				// Uploading file validation
				$('#updoc-complete-btn').on('click', function(e) {
					var $self = $(this);
					var isValid = isHkidValidity($self);
						isValid = isPassportValidity($self);
						isValid = isProfAddValidity($self);
					
					if (isValid) {
						console.log('Proceed');
						$self.removeAttr('disabled');
					} else {
						$self.attr('disabled', 'disabled');
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
					var isValid = true;
					var $hkidFileDnD = $('#fileToUpload-hkid-dragAndDrop');
					var $hkidFile = $('#hkidFileToUpload');
					
					// Check HKID file
					if ($hkidFileDnD.get(0).files.length || $hkidFile.get(0).files.length) {
						removeFormFieldError('#so-hkid-file-message', '', true);
					} else { // Process hkid file here
						removeFormFieldError('#so-hkid-file-message', 'required-hkid');
						addFormFieldError('#so-hkid-file-message', 'HKID is required.', 'required-hkid');
						isValid = false;
					}
					return isValid;
				}
				
				// Check if passport is valid
				function isPassportValidity() {
					var isValid = true;
					var $passportFileDnD = $('#fileToUpload-passport-dragAndDrop');
					var $passportFile = $('#passportFileToUpload');
						
					// Check HKID file
					if ($passportFileDnD.get(0).files.length || $passportFile.get(0).files.length) {
						removeFormFieldError('#so-passport-file-message', '', true);
					} else { // Process passport file here
						removeFormFieldError('#so-passport-file-message', 'required-hkid');
						addFormFieldError('#so-passport-file-message', 'Passport is required.', 'required-hkid');
						isValid = false;
					}
					return isValid;
				}
				
				// Check if proof of address is valid
				function isProfAddValidity() {
					if ($('#residence-check').prop('checked')) {
						return true;
					}
					
					var isValid = true;
					var $profAddFileDnD = $('#fileToUpload-addr-dragAndDrop');
					var $profAddFile = $('#fileToUploadProofAdd');
					
					// Check HKID file
					if ($profAddFileDnD.get(0).files.length || $profAddFile.get(0).files.length) {
						removeFormFieldError('#so-address-file-message', '', true);
					} else { // Process proof of address file here
						removeFormFieldError('#so-address-file-message', 'required-hkid');
						addFormFieldError('#so-address-file-message', 'Proof of address is required.', 'required-hkid');
						isValid = false;
					}
					return isValid;
				}
			});
		</script>
		
	</body>
</html>