<%@page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<%@include file="includes/head.jsp" %>
	</head>
	<body>
		<%!
			boolean isSaleActiveClass = false;
			boolean isEservicesActiveClass = false;
		%>
		<div class="fwd-savie-wrapper">
      
         <%@include file="includes/header-block-elite-terms.jsp" %>
         	
         	<div class="fwd-container container-fluid breadcrumbs hidden-xs hidden-sm">
               <ol class="breadcrumb breadcrumbs-product-details et-breadcrumbs">
                  <li><a href="#">Home</a></li>
                  <li class="divider"><i class="fa fa-play"></i></li>
                  <li><a href="#">Protection </a></li>
                  <li class="divider"><i class="fa fa-play"></i></li>
                  <li><a href="#">Elite term </a></li>
                  <li class="divider last"><i class="fa fa-play"></i></li>
                  <li class="active-bc" id="et-active-bc-menu">Upload document</li>
               </ol>
            </div>
                      
            <div class="container-fluid fwd-container">
        
                <div class="document-upload page-application et-document-upload et-document-upload-later">

                    <div class="page-content clearfix">
                        <h2>Upload Document</h2>
                        
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
                                    I'm Hong Kong permanent resident
                                </div>
                            </div>
                            
                            <div class="row upload-now-row">
                     
                                <div class="upload-buttons clearfix">
                                    <div class="col-xs-12 col-md-4 hk-id-holder">
                                        <h4>Your HK ID</h4><button class="info hkid orange-tooltip hidden-xs hidden-sm" type="button" data-toggle="tooltip" data-placement="right" title="Lorem Ipsum"></button>
                                        <h5>Upload your HKID</h5>
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
                                                        Drag and drop files here
                                                    </div>
                                                    <div class="mob-desk">
                                                        <span class="OR">or</span>
                                                    </div>
                                                    <div class="mob-desk">
                                                        <label for="hkidFileToUpload" class="orange-select-file">
                                                            <input type="file" id="hkidFileToUpload" onchange="fileSelected('hkid-copy-progress','hkidFileToUpload','hkid-docu-filename','hkid-docu-fileSize','finish-upload-hkid','hkid-upload-percent-text','hkid-upload-progress-bar','');">
                                                            <span class="input-file-text">Select files</span>
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
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
                                                <span class="sr-only">70% Complete</span>
                                                </div>
                                            </div>
                                            <p class="upload-text">Uploading: <span id="hkid-upload-percent-text">0%</span></p>
                                        </div>
                                    </div>

                                    <div class="col-xs-12 col-md-4 passport-holder">
                                        <h4>Your passport copy</h4><button class="info passport orange-tooltip hidden-xs hidden-sm" type="button" data-toggle="tooltip" data-placement="right" title="Lorem Ipsum"></button>
                                        <h5>If you are a non-permanent resident</h5>
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
                                                        Drag and drop files here
                                                    </div>
                                                    <div class="mob-desk">
                                                        <span class="OR">or</span>
                                                    </div>
                                                    <div class="mob-desk">
                                                        <label for="passportFileToUpload" class="orange-select-file">
                                                            <input type="file" id="passportFileToUpload" onchange="fileSelected('passport-copy-progress','passportFileToUpload','passport-docu-filename','passport-docu-fileSize','finish-upload-passport','passport-upload-percent-text','passport-upload-progress-bar','');">
                                                            <span class="input-file-text">Select files</span>
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
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
                                                <span class="sr-only">70% Complete</span>
                                                </div>
                                            </div>
                                            <p class="upload-text">Uploading: <span id="passport-upload-percent-text">0%</span></p>
                                        </div>
                                    </div>
                                    
                                    <div class="col-xs-12 col-md-4 proof-address-holder">
                                        <h4>Proof of address</h4><button class="info addr orange-tooltip hidden-xs hidden-sm" type="button" data-toggle="tooltip" data-placement="right" title="Lorem Ipsum"></button>
                                        <h5>Your current residential address</h5>
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
                                                        Drag and drop files here
                                                    </div>
                                                    <div class="mob-desk">
                                                        <span class="OR">or</span>
                                                    </div>
                                                    <div class="mob-desk">
                                                        <label for="fileToUpload" class="orange-select-file">
                                                            <input type="file" id="fileToUpload" onchange="fileSelected('proof-of-address-progress','fileToUpload','address-docu-filename','address-docu-fileSize','finish-upload-addr','docu-upload-percent-text','document-upload-progress-bar','');">
                                                            <span class="input-file-text">Select files</span>
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
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
                                                <span class="sr-only">70% Complete</span>
                                                </div>
                                            </div>
                                            <p class="upload-text">Uploading: <span id="docu-upload-percent-text">0%</span></p>
                                        </div>
                                    </div>
                                </div>
                        
                                <div class="col-xs-12 col-md-12">
                                    <p class="notice"><span class="asterisk">* </span>Policy will be effective upon receiving all valid
                                    documentation within x days, otherwise your
                                    application will be void.</p>
                                </div>
                            </div>					
                        </div>
                    </div> <!-- PAGE CONTENT -->
                <div class="submit-btn" id="submit-btn">
                    <button id="et-upload-doc-submit-btn" type="button" class="btn next">Next</button>
                </div>
                <div class="link-button hidden" id="upload-link-btn">
                    <button type="button" class="btn next">Send me the link</button>
                </div>
                
            </div>
           
        </div>
			
			<!-- FOOTER -->
			<%@include file="includes/footer-block.jsp" %>
			
		</div>
		<!-- JS INCLUDES -->
		
		<%@include file="includes/js-include.jsp" %>
		<script src="assets/js/fwd-dropzone.js"></script>
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
	</body>
</html>