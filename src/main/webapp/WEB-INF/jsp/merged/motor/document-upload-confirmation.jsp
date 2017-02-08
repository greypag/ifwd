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
<style type="text/css" media="all">
    .motor-confirmation .center .landing_h1{
        color: #555 !important;

    }
    .motor-confirmation .confirmation-section{
        padding-top: 0;
        padding-bottom: 40px;
    }
    .motor-confirmation #testimonials .landing_h2{
        color: #555 !important;
    }
    .motor-confirmation .table-cell{
        display: table-cell;
        vertical-align: middle;
        height: 100px;
        padding-right: 15px;
    }
    .motor-confirmation #testimonials .upload{
        padding-top: 15px;
    }
    .motor-confirmation .table-cell .thumbnail{
        margin: 0;
        width: auto;
    }
    .small-print{
        line-height: 1;
    }
    .motor-confirmation .social-link-wrapper{
        float: none;
        padding: 40px 0;
    }
    @media screen and (max-width: 767px){
        .motor-confirmation .table-cell{
            height: auto;
        }
        .motor-confirmation #testimonials{
            padding-left: 15px;
            padding-right: 15px;
        }
        .motor-confirmation .thumbnail{
            max-width: 60px;
        }

    }
</style>
<section id="" class="motor-landing motor-confirmation">
    <!-- Breadcrumb Component Start-->
    <div class="container container-fluid container--breadcrumb">
        <c:set var="breadcrumbItems">
            breadcrumb.item.home,breadcrumb.item.protect,breadcrumb.item.motor,breadcrumb.item.document.upload.confirmation
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
            <h1 class="landing_h1 col-md-10 col-md-offset-1 hidden-sm hidden-xs"><fmt:message key="motor.uploadconfirm.page.heading" bundle="${motorMsg}" /></h1>
            <!--end-desktop--> 
            <!--Mobile-->
            <h1 class="landing_h1 hidden-lg hidden-md motor-ttl"><fmt:message key="motor.uploadconfirm.page.heading" bundle="${motorMsg}" /></h1>
            <!--end mobile--> 
        </div>
    </div>
    <div class="container confirmation-section">
        <div class="content">
            <div class="row">
                <div class="col-md-8 col-md-offset-2 col-sm-12 col-xs-12 text-center">
                    <p>
                        <fmt:message key="motor.uploadconfirm.page.copy.part1" bundle="${motorMsg}" /><strong><fmt:message key="motor.uploadconfirm.page.copy.part2" bundle="${motorMsg}" /></strong><fmt:message key="motor.uploadconfirm.page.copy.part3" bundle="${motorMsg}" />
                        <br/>
                        <%-- 
                        <fmt:message key="motor.uploadconfirm.covernote.copy.part1" bundle="${motorMsg}" />
                        <span id="sendMail"></span>
                        <fmt:message key="motor.uploadconfirm.covernote.copy.part2" bundle="${motorMsg}" />
                        --%>
                    </p>
                    <p>
                        <%-- <fmt:message key="motor.uploadconfirm.referenceno.copy" bundle="${motorMsg}" /> --%>
                        <h3 id="motorRef" class="heading-h3 color-orange ref-number hidden"></h3>
                    </p>
						  <p><fmt:message key="motor.uploadconfirm.reminder.copy" bundle="${motorMsg}" /></p>
                </div>
            </div>

        </div>
    </div>
    <div class="container" >
        <div class="center wow fadeInDown animated" > 
            <!--desktop-->
            <h2 class="landing_h2 col-md-10 col-md-offset-1 hidden-sm hidden-xs"><fmt:message key="motor.uploadconfirm.discount.title" bundle="${motorMsg}" /></h2>
            <!--end-desktop--> 
            <!--Mobile-->
            <h2 class="landing_h2 hidden-lg hidden-md motor-ttl"><fmt:message key="motor.uploadconfirm.discount.title" bundle="${motorMsg}" /></h2>
            <!--end mobile--> 
        </div>
        <div class="row text-center">
            <div class="col-sm-8 col-sm-offset-2">
                <div class="content">
                    <p>
                        <fmt:message key="motor.uploadconfirm.discount.copy" bundle="${motorMsg}" />
                        <br />
                        <br />
                    </p>
                    <%--
                    <p>
                        <h3><strike class="amountDueAmount"></strike></h3>
                        <h2 class="orange"><fmt:message key="motor.confirmation.discount.save.copy" bundle="${motorMsg}" /><span class="amountSave"></span></h2>
                    </p>
                    --%>
                    <p>
                        <br />
                        <fmt:message key="motor.uploadconfirm.discount.downloadnow" bundle="${motorMsg}" />
                        <br />
                        <a href="http://onelink.to/drive"><img src="<%=request.getContextPath()%>/resources/images/motor/Apple_icon.png" alt="" /></a>
                        &nbsp;
                        &nbsp;
                        <a href="http://onelink.to/drive"><img src="<%=request.getContextPath()%>/resources/images/motor/Andriod_icon.png" alt="" /></a>
                    </p>
                    <p class="small-print">
                        <br/>

                        <small>
                            <fmt:message key="motor.uploadconfirm.discount.remark.copy.part1" bundle="${motorMsg}" /><a href='<fmt:message key="motor.uploadconfirm.discount.remark.tnc.link" bundle="${motorMsg}" />' target="_blank"><fmt:message key="motor.uploadconfirm.discount.remark.tnc.copy" bundle="${motorMsg}" /></a><fmt:message key="motor.uploadconfirm.discount.remark.copy.part2" bundle="${motorMsg}" />
                        </small>
                    </p>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row bottom">
            <div class="text-center col-xs-12 col-sm-10 col-sm-offset-1 col-md-8 col-md-offset-2">
                <h3><fmt:message key="motor.uploadconfirm.share.title" bundle="${motorMsg}" /></h3>
                <div class="row">
                    <div class="col-xs-12 col-sm-10 col-sm-offset-1 col-md-8 col-md-offset-2" style="display:none">
                        <input type="text" name="shareUrl" id="" value="https://i.fwd......." class="form-control" disabled/>
                    </div>

                    <div class="col-xs-12 col-sm-10 col-sm-offset-1 col-md-8 col-md-offset-2" >
                        <div class="social-link-wrapper">
                            <div class="social-link">
                                <a id="fb-dialog-share" href="javascript:void(0);" onclick="return false;" target="_blank"><i class="fa fa-share-alt"></i></a>
                                <a href="https://www.facebook.com/FWD.HK.MO/" target="_blank"><i class="fa fa-facebook-official"></i></a>
                                <a href="https://www.youtube.com/FWDHK" target="_blank"><i class="fa fa-youtube-play"></i></a>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="center wow fadeInDown animated" > 
            <!--desktop-->
            <h2 class="landing_h2 col-md-10 col-md-offset-1 hidden-sm hidden-xs"><fmt:message key="motor.uploadconfirm.tips.heading" bundle="${motorMsg}" /></h2>
            <!--end-desktop--> 
            <!--Mobile-->
            <h2 class="landing_h2 hidden-lg hidden-md motor-ttl"><fmt:message key="motor.uploadconfirm.tips.heading" bundle="${motorMsg}" /></h2>
            <!--end mobile--> 
        </div>
        <div class="row read-more-blog">
            <div class="col-sm-6 col-md-3">
                <div class="hovereffect">
                    <img class="img-responsive" src="<%=request.getContextPath()%>/resources/images/motor/1st_blog_image.jpg" alt="">
                    <div class="overlay ">
                        <h2><fmt:message key="motor.confirmation.tips.1.title" bundle="${motorMsg}" /></h2>
                        <div class="hidden-xs">
                        <a class="info" href='<fmt:message key="motor.confirmation.tips.1.link" bundle="${motorMsg}" />' target="_blank"><fmt:message key="motor.button.readmore" bundle="${motorMsg}" /></a>
                        </div>
                    </div>
                </div>
                <div class="clearfix">
                </div>
                <div class="row text-center">
                    <div class="col-xs-4 col-xs-offset-4">
                        <br />
                        <a class="info visible-xs btn btn-primary bdr-curve" href='<fmt:message key="motor.confirmation.tips.1.link" bundle="${motorMsg}" />' target="_blank"><fmt:message key="motor.button.readmore" bundle="${motorMsg}" /></a>
                    </div>
                </div>


            </div>
            <div class="col-sm-6 hidden-xs col-md-3">
                <div class="hovereffect">
                    <img class="img-responsive" src="<%=request.getContextPath()%>/resources/images/motor/2nd_blog_image.jpg" alt="">
                    <div class="overlay">
                        <h2><fmt:message key="motor.confirmation.tips.2.title" bundle="${motorMsg}" /></h2>
                        <a class="info" href='<fmt:message key="motor.confirmation.tips.2.link" bundle="${motorMsg}" />' target="_blank"><fmt:message key="motor.button.readmore" bundle="${motorMsg}" /></a>
                    </div>
                </div>
            </div>
            <div class="hidden-sm hidden-xs col-md-3">
                <div class="hovereffect">
                    <img class="img-responsive" src="<%=request.getContextPath()%>/resources/images/motor/3rd_blog_image.jpg" alt="">
                    <div class="overlay">
                        <h2><fmt:message key="motor.confirmation.tips.3.title" bundle="${motorMsg}" /></h2>
                        <a class="info" href='<fmt:message key="motor.confirmation.tips.3.link" bundle="${motorMsg}" />' target="_blank"><fmt:message key="motor.button.readmore" bundle="${motorMsg}" /></a>
                    </div>
                </div>
            </div>
            <div class="hidden-sm hidden-xs col-md-3">
                <div class="hovereffect">
                    <img class="img-responsive" src="<%=request.getContextPath()%>/resources/images/motor/4th_blog_image.jpg" alt="">
                    <div class="overlay">
                        <h2><fmt:message key="motor.confirmation.tips.4.title" bundle="${motorMsg}" /></h2>
                        <a class="info" href='<fmt:message key="motor.confirmation.tips.4.link" bundle="${motorMsg}" />' target="_blank"><fmt:message key="motor.button.readmore" bundle="${motorMsg}" /></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/motor/landing.js"></script>
<script type="text/javascript" charset="utf-8">
var quote = jQuery.parseJSON('<%=request.getParameter("data")!=null?StringEscapeUtils.escapeEcmaScript(StringEscapeUtils.unescapeHtml4(request.getParameter("data"))):"{}"%>');

$(document).ready(function(){
	$(".amountDueAmount").html("$"+quote.amountDueAmount);
	$(".amountSave").html("$"+(parseInt(quote.amountDueAmount)*0.3).toFixed(2));
	<%--
	$("#sendMail").html("<a href='mailto:"+quote.applicant.email+"'>"+quote.applicant.email+"</a>");
	--%>
	$(".ref-number").html(quote.coverNoteNum);
});
</script>
    }
