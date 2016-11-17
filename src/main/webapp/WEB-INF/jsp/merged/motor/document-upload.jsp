<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<section id="" class="motor-confirmation motor-upload">
    <!-- Breadcrumb Component Start-->
    <div class="container container-fluid container--breadcrumb">
        <c:set var="breadcrumbItems">
            breadcrumb.item.home,breadcrumb.item.protect,breadcrumb.item.motor,breadcrumb.item.get.quote
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
            <div class="col-xs-12 col-md-10 col-md-offset-1">
                <div class="row">
                    <div class="col-xs-12 col-sm-4">
                        <div class="panel panel-default upload upload-id">
                            <div class="panel-body text-center">
                                <div class="thumbnail">
                                    <img src="../resources/images/motor/dummy.png" alt="" />
                                </div>
                                <h4 class="title">
                                    <fmt:message key="motor.docupload.upload.1.copy" bundle="${motorMsg}" />
                                </h4>
                                <div class="upload__dropzone" id="vehicleReg-dz">
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
                                <div class="thumbnail">
                                    <img src="../resources/images/motor/dummy.png" alt="" />
                                </div>
                                <h4 class="title">
                                    <fmt:message key="motor.docupload.upload.2.copy" bundle="${motorMsg}" />
                                </h4>
                                <div class="upload__dropzone" id="hkid-dz">
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
                                <div class="thumbnail">
                                    <img src="../resources/images/motor/dummy.png" alt="" />
                                </div>
                                <h4 class="title">
                                    <fmt:message key="motor.docupload.upload.3.copy" bundle="${motorMsg}" />
                                </h4>
                                <div class="upload__dropzone" id="license-dz">
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
                    <a id="submitDoc" class="bdr-curve btn btn-primary nxt-btn" ><fmt:message key="motor.button.submit" bundle="${motorMsg}" /></a>
                </div>
            </div>
        </div>
    </div>
</section>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/vendor/dropzone.js"></script>
<script type="text/javascript" charset="utf-8">
    $(document).ready(function(){
        var vehicleReg = $('#vehicleReg-dz').dropzone({
            url:"/file/post",
            maxFiles: 1,
            acceptedFiles: 'image/jpeg,image/png', 
            maxFilesize: 2,
            addRemoveLinks: true,
            init: function() {
                this.on("addedfile", function(file) { 
                    $('.error-msg').html('');
                    if($('#vehicleReg-dz').hasClass('dz-max-files-reached')){
                        $('#vehicleReg-dz').find('.dz-error-message span').html($('#vehicleReg-dz-error-message').data('max-error'));
                    }
                });
            }
        });
        var hkid = $('#hkid-dz').dropzone({
            url:"/file/post",
            maxFiles: 4,
            addRemoveLinks: true,
            acceptedFiles: 'image/jpeg,image/png', 
            maxFilesize: 2,
            init: function() {
                this.on("addedfile", function(file) { 
                    $('.error-msg').html('');
                    if($('#hkid-dz').hasClass('dz-max-files-reached')){
                        $('#hkid-dz').find('.dz-error-message span').html($('#hkid-dz-error-message').data('max-error'));
                    }
                });
            }
        });
        var license = $('#license-dz').dropzone({
            url:"/file/post",
            maxFiles: 4,
            acceptedFiles: 'image/jpeg,image/png', 
            maxFilesize: 2,
            addRemoveLinks: true,
            init: function() {
                this.on("addedfile", function(file) {
                    $('.error-msg').html('');
                    if($('#license-dz').hasClass('dz-max-files-reached')){
                        $('#license-dz').find('.dz-error-message span').html($('#license-dz-error-message').data('max-error'));
                    }
                });
            }
        });

        $('#submitDoc').click(function(e){
            e.preventDefault();
            
            if(!vehicleReg[0].dropzone.files.length){
            $('#vehicleReg-dz-error-message').html($('#vehicleReg-dz-error-message').data('required-error'));
            }
            if(!hkid[0].dropzone.files.length){
            $('#hkid-dz-error-message').html($('#hkid-dz-error-message').data('required-error'));
            }
            if(!license[0].dropzone.files.length){
            $('#license-dz-error-message').html($('#license-dz-error-message').data('required-error'));
            }
            
        
        });

    });
</script>


