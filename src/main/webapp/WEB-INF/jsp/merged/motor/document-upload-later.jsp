<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="org.apache.commons.lang3.StringEscapeUtils" %>
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<fmt:setBundle basename="motor" var="motorMsg" />
<script type="text/javascript">
var context = "${pageContext.request.contextPath}";
var language = "${language}";
var nextPage = "${nextPageFlow}";
</script>

<!--Body-->



<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css_dir/motor-styles.css" type="text/css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/motor/bootstrap-switch.min.css" type="text/css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/motor/selectize.bootstrap3.css" type="text/css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/js/motor/basic.min.css" type="text/css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/vendor/dropzone.min.css" type="text/css">
<style type="text/css" media="all">
    #submitDoc{
        margin: 30px 0 50px;
    }
    .motor-confirmation .center .landing_h1{
        color: #555 !important;

    }
    .motor-confirmation .confirmation-section{
        padding-top: 0;
        padding-bottom: 40px;
    }
    .motor-confirmation #uploadDocSection .upload {
        border-radius: 0;
    }
    .motor-confirmation #uploadDocSection .thumbnail{
        background-color: transparent;
        border: none;
        max-width: 50%;
        margin: 0 auto;
        padding-bottom: 15px;
    }
    .motor-confirmation #uploadDocSection .upload .upload__dropzone{
        background: #fff;
        margin: 30px 0 0;
        padding: 20px 0;
        min-height: 0;
        border: none;
        cursor: pointer;
    }
    .motor-confirmation #uploadDocSection .upload .upload__dropzone + div{
        background: #fff;
        padding-bottom: 30px;
    }
    .motor-confirmation #uploadDocSection .upload .upload__dropzone + div p{
        line-height: 1.2; 
        padding: 0 30px;
    }
    .motor-confirmation #uploadDocSection .upload .upload__dropzone h4{
        color: #f68a1d;
        margin-bottom: 1em;
    }
    .motor-confirmation div.upload__dropzone div.dz-preview {
        width: 100%;
        text-align: center;
        margin: 0;
    }
    .motor-confirmation div.dropzone div.dz-preview div.dz-image {
        display: inline-block;
    }
    .motor-confirmation .upload__dropzone .dz-preview .dz-error-message{
        width: 120px;
        padding: 0.5em;
    }
    .small-print{
        line-height: 1;
    }
    .motor-confirmation .social-link-wrapper{
        float: none;
        padding: 40px 0;
    }
    .error-msg{
        font-size: 80%;
        color: #f00;
        line-height: 1.2;
    }
    @media screen and (min-width: 768px){
        .motor-confirmation #uploadDocSection .upload-id .upload__dropzone{
            min-height: 175px !important;
        }
        .motor-confirmation #uploadDocSection .upload .title{
            height: 57px;
            word-wrap: break-word;
            overflow: hidden;
        }

    }
    @media screen and (max-width: 991px){
        .motor-confirmation .center .motor-ttl {
            margin-bottom: 20px !important
        }
    }
    @media screen and (max-width: 767px){
        .motor-confirmation .thumbnail{
            max-width: 60px;
        }
    }
</style>
<section id="" class="motor-confirmation motor-upload motor-signup-form">
    <!-- Breadcrumb Component Start-->
    <div class="container container-fluid container--breadcrumb">
        <c:set var="breadcrumbItems">
            breadcrumb.item.home,breadcrumb.item.protect,breadcrumb.item.motor,breadcrumb.item.document.upload
        </c:set>
        <c:set var="breadcrumbActive">3</c:set>
        
        <jsp:include page="/WEB-INF/jsp/merged/comp/breadcrumb.jsp">
            <jsp:param name="breadcrumbItems" value="${breadcrumbItems}"/>
            <jsp:param name="breadcrumbActive" value="${breadcrumbActive}"/>
        </jsp:include>
    </div>
    <!-- Breadcrumb Component End-->

    <div class="">
        <div class="center wow fadeInDown animated" > 
            <!--desktop-->
            <h1 class="landing_h1 col-md-10 col-md-offset-1 hidden-sm hidden-xs"><fmt:message key="motor.docupload.page.heading" bundle="${motorMsg}" /></h1>
            <!--end-desktop--> 
            <!--Mobile-->
            <h1 class="landing_h1 hidden-lg hidden-md motor-ttl"><fmt:message key="motor.docupload.page.heading" bundle="${motorMsg}" /></h1>
            <!--end mobile--> 
        </div>
    </div>
    <div class="container confirmation-section">
        <div class="content">
            <div class="row">
                <div class="col-md-8 col-md-offset-2 col-sm-12 col-xs-12 text-center">
                    <p>
                        <fmt:message key="motor.docupload.page.copy" bundle="${motorMsg}" />
                        <br/>
                    </p>
                </div>
            </div>

        </div>
    </div>
    <div class="container no-border" id="uploadDocSection">
        <div class="center" > 
            <!--desktop-->
            <h2 class="landing_h2 col-md-10 col-md-offset-1 hidden-sm hidden-xs"><fmt:message key="motor.docupload.upload.title" bundle="${motorMsg}" /></h2>
            <!--end-desktop--> 
            <!--Mobile-->
            <h2 class="landing_h2 hidden-lg hidden-md motor-ttl"><fmt:message key="motor.docupload.upload.title" bundle="${motorMsg}" /></h2>
            <!--end mobile--> 
        </div>
        <div class="row">
        	<form id="motor-upload-form" method="post" class="form-group" enctype="multipart/form">
            <div class="col-xs-12 col-md-10 col-md-offset-1">
                <div class="row">
                    <div class="col-xs-12 col-sm-4">
                        <div class="panel panel-default upload">
                            <div class="panel-body text-center">
                                <div class="">
                                     <img src="<%=request.getContextPath()%>/resources/images/motor/Driver_License_upload_confirm.png" alt="" width="150" />
                                </div>
                                <h4 class="title">
                                    <fmt:message key="motor.docupload.upload.1.copy" bundle="${motorMsg}" />
                                </h4>
           
                                 <div class="upload__dropzone drop-zone dropzone" id="vehicleReg-dz">
                                    <div class="content">
                                        <h4 class="dz-message">
                                            <fmt:message key="motor.docupload.upload.select.copy" bundle="${motorMsg}" />
                                        </h4>
                                    </div>
                                </div>
                                <div>
                                    <div class="content">
                                        <p>
                                            <fmt:message key="motor.docupload.upload.max.copy" bundle="${motorMsg}" />
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <label class="error-msg" id="vehicleReg-dz-error-message" data-required-error='<fmt:message key="motor.error.msg.upload.vehicle.empty" bundle="${motorMsg}" />' data-max-error='<fmt:message key="motor.error.msg.upload.number.copy" bundle="${motorMsg}" />' data-dict-file-too-big='<fmt:message key="motor.error.msg.upload.file.size" bundle="${motorMsg}" />' data-dict-invalid-file-type='<fmt:message key="motor.error.msg.upload.file.format" bundle="${motorMsg}" />'></label>
                    </div>
                    <div class="col-xs-12 col-sm-4">
                        <div class="panel panel-default upload">
                            <div class="panel-body text-center">
                                <div class="">
                                   <img src="<%=request.getContextPath()%>/resources/images/motor/vehicle_registeration_Confirm_upload.png" alt="" width="150"  />
                                </div>
                                <h4 class="title">
                                    <fmt:message key="motor.docupload.upload.2.copy" bundle="${motorMsg}" />
                                </h4>
                                <div class="upload__dropzone drop-zone dropzone" id="hkid-dz">
                                    <div class="content">
                                        <h4 class="dz-message">
                                            <fmt:message key="motor.docupload.upload.select.copy" bundle="${motorMsg}" />
                                        </h4>
                                    </div>
                                </div>
                                <div>
                                    <div class="content">
                                        <p>
                                            <fmt:message key="motor.docupload.upload.max.copy" bundle="${motorMsg}" />
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <label class="error-msg" id="hkid-dz-error-message" data-required-error='<fmt:message key="motor.error.msg.upload.idcard.empty" bundle="${motorMsg}" />' data-max-error='<fmt:message key="motor.error.msg.upload.number.copy" bundle="${motorMsg}" />' data-dict-file-too-big='<fmt:message key="motor.error.msg.upload.file.size" bundle="${motorMsg}" />' data-dict-invalid-file-type='<fmt:message key="motor.error.msg.upload.file.format" bundle="${motorMsg}" />'></label>
                    </div>
                    <div class="col-xs-12 col-sm-4">
                        <div class="panel panel-default upload">
                            <div class="panel-body text-center">
                                <div class="">
                                   <img src="<%=request.getContextPath()%>/resources/images/motor/HKID_upload_confirm.png" alt="" width="150"  />
                                </div>
                                <h4 class="title">
                                    <fmt:message key="motor.docupload.upload.3.copy" bundle="${motorMsg}" />
                                </h4>
                                <div class="upload__dropzone drop-zone dropzone" id="license-dz">
                                    <div class="content">
                                        <h4 class="dz-message">
                                            <fmt:message key="motor.docupload.upload.select.copy" bundle="${motorMsg}" />
                                        </h4>
                                    </div>
                                </div>
                                <div>
                                    <div class="content">
                                        <p>
                                            <fmt:message key="motor.docupload.upload.max.copy" bundle="${motorMsg}" />
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <label class="error-msg" id="license-dz-error-message" data-required-error='<fmt:message key="motor.error.msg.upload.drive.empty" bundle="${motorMsg}" />' data-max-error='<fmt:message key="motor.error.msg.upload.number.copy" bundle="${motorMsg}" />' data-dict-file-too-big='<fmt:message key="motor.error.msg.upload.file.size" bundle="${motorMsg}" />' data-dict-invalid-file-type='<fmt:message key="motor.error.msg.upload.file.format" bundle="${motorMsg}" />'></label>
                    </div>
                </div>
            </div>
            
	            <div class="col-xs-12 col-sm-10 col-sm-offset-1">
	                <div class="content text-center">
	                    <button id="submitDoc" class="bdr-curve btn btn-primary nxt-btn disabled" style="white-space: initial;"><fmt:message key="motor.button.submit" bundle="${motorMsg}" /></button>
	                </div>
	            </div>
	            <div class="col-sm-12 col-sm-10 col-sm-offset-1 text-center">
					<div class="error-message error-msg-overall"></div>
				</div>
            </form>
        </div>
    </div>
</section>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/vendor/dropzone.js"></script>
<script type="text/javascript" charset="utf-8">
var total_vehicleReg_dz = 0;
var total_hkid_dz = 0;
var total_license_dz = 0;
var quote = jQuery.parseJSON('<%=request.getParameter("data")!=null?StringEscapeUtils.escapeEcmaScript(StringEscapeUtils.unescapeHtml4(request.getParameter("data"))):""%>');

    $(document).ready(function(){
    	$vehicleReg_dz = $('#vehicleReg-dz');
    	$hkid_dz = $('#hkid-dz');
    	$license_dz = $('#license-dz');
    	
    	invalid_file = (language == 'en') ? 'Please upload document in jpg or png or pdf or tiff format only. And max file size is 2MB.' : '只接受jpg 或 png 或 pdf 或tiff 格式 和檔案大小不可以大於2MB。';
    	exceeded_1file = (language == 'en') ? 'You cannot upload more than 1 copy.' : '只可上載1個檔案。';
    	exceeded_4file = (language == 'en') ? 'You cannot upload more than 4 copy.' : '只可上載4個檔案。';
    	remove_file = (language == 'en') ? 'Remove File' : '刪除檔案';
    	
    	var url = context + '/api/iMotor/policy/fileUploadLater';

    	function submit_enable(){
    		if(total_vehicleReg_dz > 0 && total_hkid_dz > 0 && total_license_dz >0)
    			$("#submitDoc").removeClass('disabled');
    		else
    			$("#submitDoc").addClass('disabled');
    		
    		if(total_vehicleReg_dz > 4 )
    			$("#submitDoc").addClass('disabled');
    		if(total_hkid_dz > 4 )
    			$("#submitDoc").addClass('disabled');
    		if(total_license_dz > 4 )
    			$("#submitDoc").addClass('disabled');
    	}
    	
    	if($vehicleReg_dz!=null && $hkid_dz!=null && $license_dz!=null){
    		Dropzone.autoDiscover = false;
	        var vehicleReg = $('#vehicleReg-dz').dropzone({
	        	url:url,
	            maxFiles: 4,
				maxFilesize: 2,
				addRemoveLinks: true,
				dictRemoveFile:remove_file,
				acceptedFiles: 'image/jpeg,image/png,image/tiff,application/pdf',
				uploadMultiple: true,
	            parallelUploads: 4,
	            init: function() {
	            	this.on("sending", function(file, xhr, formData){
	                        formData.append("refNumber", quote.refNumber);
	                        formData.append("coverNote", quote.coverNoteNum);
	                        formData.append("docType", "vehicleReg");
	                });
						this.on("maxfilesreached", function(file) {
							$('.error-msg').html('');
							$('#vehicleReg-dz .content').appendTo('#vehicleReg-dz');
							$('#vehicleReg-dz .content .dz-message').css('display','none');
						});
						this.on("removedfile", function(file) {
							$('.error-msg').html('');
							if($('#vehicleReg-dz').hasClass('dz-max-files-reached')){
								$('#vehicleReg-dz').removeClass('dz-max-files-reached');
							}
							$('#vehicleReg-dz .content').appendTo('#vehicleReg-dz');
							$('#vehicleReg-dz .content .dz-message').css('display','block');
						});
	                this.on("addedfile", function(file) { 
	                	//total_vehicleReg_dz++;
	                	//submit_enable();
	  	                $('.error-msg').html('');
								if(!$('#vehicleReg-dz').hasClass('dz-max-files-reached')){
									$('#vehicleReg-dz .content').appendTo('#vehicleReg-dz');
									$('#vehicleReg-dz .content .dz-message').css('display','block');
	                    }
	                });
	                this.on("complete", function(file) { 
	                	total_vehicleReg_dz++;
	                	submit_enable();
	  	                $('.error-msg').html('');
							 if(!$('#vehicleReg-dz').hasClass('dz-max-files-reached')){
									$('#vehicleReg-dz .content').appendTo('#vehicleReg-dz');
									$('#vehicleReg-dz .content .dz-message').css('display','block');
	                    }
	                });
	            },
	            removedfile: function(file) {
	            	total_vehicleReg_dz--;
	            	submit_enable();
	                var _ref;
	                return (_ref = file.previewElement) != null ? _ref.parentNode.removeChild(file.previewElement) : void 0;
	             },
				dictInvalidFileType: invalid_file,
				dictFileTooBig: invalid_file,
				dictMaxFilesExceeded: exceeded_4file,
	        });
	        var hkid = $('#hkid-dz').dropzone({
	            url:url,
	            maxFiles: 4,
				maxFilesize: 2,
				addRemoveLinks: true,
				dictRemoveFile:remove_file,
				acceptedFiles: 'image/jpeg,image/png,image/tiff,application/pdf',
				uploadMultiple: true,
	            parallelUploads: 4,
	            init: function() {
	            	this.on("sending", function(file, xhr, formData){	            		
                        formData.append("refNumber", quote.refNumber);
                        formData.append("coverNote", quote.coverNoteNum);
                        formData.append("docType", "hkid");
                	});
						this.on("maxfilesreached", function(file) {
							$('.error-msg').html('');
							$('#hkid-dz .content').appendTo('#hkid-dz');
							$('#hkid-dz .content .dz-message').css('display','none');
						});
						this.on("removedfile", function(file) {
							$('.error-msg').html('');
							if($('#hkid-dz').hasClass('dz-max-files-reached')){
								$('#hkid-dz').removeClass('dz-max-files-reached');
							}
							$('#hkid-dz .content').appendTo('#hkid-dz');
							$('#hkid-dz .content .dz-message').css('display','block');
						});
	                this.on("addedfile", function(file) { 
	                	//total_hkid_dz++;
	                	//submit_enable();
	                    $('.error-msg').html('');
								if(!$('#hkid-dz').hasClass('dz-max-files-reached')){
									$('#hkid-dz .content').appendTo('#hkid-dz');
									$('#hkid-dz .content .dz-message').css('display','block');
	                    }
	                });
	                this.on("complete", function(file) { 
	                	total_hkid_dz++;
	                	submit_enable();
	                    $('.error-msg').html('');
								if(!$('#hkid-dz').hasClass('dz-max-files-reached')){
									$('#hkid-dz .content').appendTo('#hkid-dz');
									$('#hkid-dz .content .dz-message').css('display','block');
	                    }
	                });
	            },
	            removedfile: function(file) {
	            	total_hkid_dz--;
	            	submit_enable();
	            	var _ref;
		            return (_ref = file.previewElement) != null ? _ref.parentNode.removeChild(file.previewElement) : void 0;
	             },
				dictInvalidFileType: invalid_file,
				dictFileTooBig: invalid_file,
				dictMaxFilesExceeded: exceeded_4file,
	        });
	        var license = $('#license-dz').dropzone({
	            url:url,
	            maxFiles: 4,
				maxFilesize: 2,
				addRemoveLinks: true,
				dictRemoveFile:remove_file,
				acceptedFiles: 'image/jpeg,image/png,image/tiff,application/pdf',
				uploadMultiple: true,
	            parallelUploads: 4,
	            init: function() {
	            	this.on("sending", function(file, xhr, formData){
                        formData.append("refNumber", quote.refNumber);
                        formData.append("coverNote", quote.coverNoteNum);
                        formData.append("docType", "license");
                	});
						this.on("maxfilesreached", function(file) {
							$('.error-msg').html('');
							$('#license-dz .content').appendTo('#license-dz');
							$('#license-dz .content .dz-message').css('display','none');
						});
						this.on("removedfile", function(file) {
							$('.error-msg').html('');
							if($('#license-dz').hasClass('dz-max-files-reached')){
								$('#license-dz').removeClass('dz-max-files-reached');
							}
							$('#license-dz .content').appendTo('#license-dz');
							$('#license-dz .content .dz-message').css('display','block');
						});
	                this.on("addedfile", function(file) {
	                	//total_license_dz++;
	                	//submit_enable();
	                    $('.error-msg').html('');
								if(!$('#license-dz').hasClass('dz-max-files-reached')){
									$('#license-dz .content').appendTo('#license-dz');
									$('#license-dz .content .dz-message').css('display','block');
	                    }
	                });
	                this.on("complete", function(file) {
	                	total_license_dz++;
	                	submit_enable();
	                    $('.error-msg').html('');
								if(!$('#license-dz').hasClass('dz-max-files-reached')){
									$('#license-dz .content').appendTo('#license-dz');
									$('#license-dz .content .dz-message').css('display','block');
	                    }
	                });
	            },
	            removedfile: function(file) {
	            	total_license_dz--;
	            	submit_enable();
	            	var _ref;
		            return (_ref = file.previewElement) != null ? _ref.parentNode.removeChild(file.previewElement) : void 0;
	             },
				dictInvalidFileType: invalid_file,
				dictFileTooBig: invalid_file,
				dictMaxFilesExceeded: exceeded_4file,
	        });
    	}
    	
    	 $('#submitDoc').click(function(e){
             e.preventDefault();
             var $form = $("<form id='quote-form' />");
             $form.attr("action", "document-upload-confirmation");
             $form.attr("method", "post");
             var $quote = $("<input type='hidden' name='data' />");
             $quote.attr("value", JSON.stringify(quote));
             $form.append($quote);
             $("body").append($form);
             $('#quote-form').submit();  
             //checkForm();
    	 });
    	
    	//Get server side response of message(both error and success)
	   	 function response2div(message, id_class, class_id_name){
	   	 	if(id_class=='class'){
	   	 		$('.'+class_id_name).show();
	   	 		$('.'+class_id_name).text(message);
	   	 	}else if(id_class=='id'){
	   	 		$('#'+class_id_name).show();
	   	 		$('#'+class_id_name).text(message);
	   	 	}
	   	 }
    	 
    	function checkForm(){
    		
    		response2div("", "class", "error-msg-overall");
    		
    		if(total_vehicleReg_dz > 1 && total_hkid_dz > 1  && total_license_dz > 1)
    		{	
	    		var document1Base64 = $("#vehicleReg-dz img")[0].src;
	    		var document1Type = $("#vehicleReg-dz img")[0].alt;
	    		var document2Base64 = $("#hkid-dz img")[0].src;
	    		var document2Type = $("#hkid-dz img")[0].alt;
	    		var document3Base64 = $("#license-dz img")[0].src;
	    		var document3Type = $("#license-dz img")[0].alt;
    			
	    		if(document1Base64!=null && document1Base64!="" && document2Base64!=null && document2Base64!="" && document3Base64!=null && document3Base64!=""){
	    	
	    			$.ajax({
	    				type: "POST",
	    				async: false,
	    				url: context + '/api/iMotor/policy/fileUpload',
	    				success: function (data) {
	    					if (data != null && data.errorMsg != null && data.errorMsg != "") {
	    						if(data.errorMsg == "Policy not found for this HKID"){
	    							response2div(getBundle(getBundleLanguage, "Please.enter.correct.Certificate.Number.or.HKID.number"), "class", "error-msg-overall");
	    						}
	    						else if(data.errorMsg == "Policy not found for this passport"){
	    							response2div(getBundle(getBundleLanguage, "Please.enter.correct.Certificate.Number.or.Passport.number"), "class", "error-msg-overall");
	    						}else if(data.errorMsg == "Claim cannot be more than three times"){
	    							response2div(getBundle(getBundleLanguage, "Over.screenProtector.policy.claim.time.limitation"), "class", "error-msg-overall");
	    						}
	    						else{
	    							response2div(data.errorMsg, "class", "error-msg-overall");
	    						}
	    						$("#submit").removeClass("disabled");
	    					} 
	    					else {
	    						//window.location = '/screen-insurance/tc/claim-online-confirmation';
	    					}
	    				},
	    				error: function(data){
	    					$("#submit").removeClass("disabled");
	    				}
	    			});
	    		}
	    		else{
	    			response2div("Please select a file", "class", "error-msg-overall");
	    			$("#submit").removeClass("disabled");
	    		}
    		}	
    		return false;
    	}
    });
</script>


