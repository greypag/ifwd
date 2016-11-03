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
            <h1 class="landing_h1 col-md-10 col-md-offset-1 hidden-sm hidden-xs">Confirmation Page</h1>
            <!--end-desktop--> 
            <!--Mobile-->
            <h1 class="landing_h1 hidden-lg hidden-md motor-ttl">Confirmation Page</h1>
            <!--end mobile--> 
        </div>
    </div>
    <div class="container confirmation-section">
        <div class="content">
            <div class="row">
                <div class="col-md-8 col-md-offset-2 col-sm-12 col-xs-12 text-center">
                    <p>
                        Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. 

                        <br/>
                    </p>
                    <p>  
                        Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. 
                        <br/>
                        <br/>
                    </p>
                    <p>
                        Your Reference No.
                        <h3 id="motorRef" class="heading-h3 color-orange ref-number">
                            RQ862541 
                        </h3>
                    </p>
                </div>
            </div>

        </div>
    </div>
    <div class="container no-border" id="testimonials" >
        <div class="center" > 
            <!--desktop-->
            <h2 class="landing_h2 col-md-10 col-md-offset-1 hidden-sm hidden-xs">Upload Document</h2>
            <!--end-desktop--> 
            <!--Mobile-->
            <h2 class="landing_h2 hidden-lg hidden-md motor-ttl">Upload Document</h2>
            <!--end mobile--> 
            <div class="row">
                <div class="col-xs-12 col-sm-10 col-sm-offset-1">
                    <p>
                        Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. 
                        <br />
                        <br />
                    </p>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-10 col-sm-offset-1">
                <div class="row">
                    <div class="col-sm-4 upload">
                        <div class="table-cell">
                            <div class="thumbnail">
                                <img src="../resources/images/motor/dummy.png" alt="" />
                            </div>
                        </div>
                        <h4 class="table-cell text-left">
                            HKID for all named drivers
                        </h4>
                    </div>
                    <div class="col-sm-4 upload">
                        <div class="table-cell">
                            <div class="thumbnail">
                                <img src="../resources/images/motor/dummy.png" alt="" />
                            </div>
                        </div>
                        <h4 class="table-cell text-left">
                            HKID for all named drivers
                        </h4>
                    </div>
                    <div class="col-sm-4 upload">
                        <div class="table-cell">
                            <div class="thumbnail">
                                <img src="../resources/images/motor/dummy.png" alt="" />
                            </div>
                        </div>
                        <h4 class="table-cell text-left">
                            HKID for all named drivers
                        </h4>
                    </div>
                </div>

            </div>
            <div class="col-xs-12 col-sm-10 col-sm-offset-1">
                <div class="content text-center">
                    <br />
                    <a class="bdr-curve btn btn-primary" href="#">Upload Now</a>
                    <br />
                    <br />
                </div>
            </div>
        </div>
    </div>
    <div class="container" >
        <div class="center wow fadeInDown animated" > 
            <!--desktop-->
            <h2 class="landing_h2 col-md-10 col-md-offset-1 hidden-sm hidden-xs">Want to get more discount?</h2>
            <!--end-desktop--> 
            <!--Mobile-->
            <h2 class="landing_h2 hidden-lg hidden-md motor-ttl">Want to get more discount?</h2>
            <!--end mobile--> 
        </div>
        <div class="row text-center">
            <div class="col-sm-8 col-sm-offset-2">
                <div class="content">
                    <p>
                        Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa.
                        <br />
                        <br />
                    </p>
                    <p>
                        <h3>Orginal Renewal <strike>$10000</strike></h3>
                        <h2 class="orange">Save $400</h2>
                    </p>
                    <p>
                        <br />
                        <a class="" href="#">Download Now!</a>
                        <br />
                        <img src="https://dummyimage.com/100x50/000/fff.png" alt="" />
                        &nbsp;
                        &nbsp;
                        <img src="https://dummyimage.com/100x50/000/fff.png" alt="" />
                    </p>
                    <p class="small-print">
                        <br/>

                        <small>
                            Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa.
                            Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa.
                            Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa.
                        </small>
                    </p>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row bottom">
            <div class="text-center col-xs-12 col-sm-10 col-sm-offset-1 col-md-8 col-md-offset-2">
                <h3>
                    Share this great product with friends
                </h3>
                <div class="row">
                    <div class="col-xs-12 col-sm-10 col-sm-offset-1 col-md-8 col-md-offset-2">
                        <input type="text" name="shareUrl" id="" value="https://i.fwd......." class="form-control" disabled/>
                    </div>

                    <div class="col-xs-12 col-sm-10 col-sm-offset-1 col-md-8 col-md-offset-2">
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
            <h2 class="landing_h2 col-md-10 col-md-offset-1 hidden-sm hidden-xs">Read more from our blog</h2>
            <!--end-desktop--> 
            <!--Mobile-->
            <h2 class="landing_h2 hidden-lg hidden-md motor-ttl">Read more from our blog</h2>
            <!--end mobile--> 
        </div>
        <div class="row read-more-blog">
            <div class="col-sm-6 col-md-3">
                <div class="hovereffect">
                    <img class="img-responsive" src="http://placehold.it/767x540" alt="">
                    <div class="overlay ">
                        <h2>Lorem ipsum dolor sit amet</h2>
                        <div class="hidden-xs">
                            <a class="info" href="#">Read More</a>
                        </div>
                    </div>
                </div>
                <div class="clearfix">
                </div>
                <div class="row text-center">
                    <div class="col-xs-4 col-xs-offset-4">
                        <br />
                        <a class="info visible-xs btn btn-primary bdr-curve" href="#">Read More</a>
                    </div>
                </div>


            </div>
            <div class="col-sm-6 hidden-xs col-md-3">
                <div class="hovereffect">
                    <img class="img-responsive" src="http://placehold.it/767x540" alt="">
                    <div class="overlay">
                        <h2>product 1</h2>
                        <a class="info" href="#">Read More</a>
                    </div>
                </div>
            </div>
            <div class="hidden-sm hidden-xs col-md-3">
                <div class="hovereffect">
                    <img class="img-responsive" src="http://placehold.it/767x540" alt="">
                    <div class="overlay">
                        <h2>product 1</h2>
                        <a class="info" href="#">Read More</a>
                    </div>
                </div>
            </div>
            <div class="hidden-sm hidden-xs col-md-3">
                <div class="hovereffect">
                    <img class="img-responsive" src="http://placehold.it/767x540" alt="">
                    <div class="overlay">
                        <h2>product 1</h2>
                        <a class="info" href="#">Read More</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/motor/landing.js"></script>

