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
</style>
<div class="motor-form-wrap motor__wrap--sticky-dropdown">
    <section id="" class="motor-signup-form">
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

        <div class="container ">
            <div class="row">
                <div id="tr-steps" class="col-md-8 col-md-offset-2 col-sm-12 col-xs-12  shop-tracking-status">
                    <div class="row">
                        <div class="col-lg-12 col-md-12">
                            <div id="tr-wizard" class="shop-tracking-status">
                                <div class="order-status has-four">
                                    <div class="order-status-timeline-new">
                                        <!--
                                        There can be n '.order-status-timeline-completion'
                                        dots-inactive and dots-active color the dots -->
                                        <div class="order-status-timeline-completion dots-inactive"></div>
                                        <div class="order-status-timeline-completion dots-inactive"></div>
                                        <div class="order-status-timeline-completion dots-inactive"></div>
                                    </div>
                                    <div class="image-order-status image-order-status-new  img-circle first">
                                        <div class="icon">1</div>
                                    </div>
                                    <div class="image-order-status image-order-status-intransit img-circle second">
                                        <div class="icon">2</div>
                                    </div>
                                    <div class="image-order-status image-order-status-delivered active img-circle act third">
                                        <span class="status">Policy Details</span>
                                        <div class="icon">3</div>
                                    </div>
                                    <div class="image-order-status image-order-status-completed img-circle fourth">
                                        <div class="icon">4</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    	<div class="container" id="motor_Form_Title">
            <div class="center" > 
                <!--desktop-->
                <h1 class="landing_h2 hidden-sm hidden-xs">Policy Details</h1>
                <!--end-desktop--> 
                <!--Mobile-->
                <h1 class="landing_h2 hidden-lg hidden-md feature-ttl">Policy Details</h1>
                <!--end mobile--> 
        </div>
        <div id="motor_registerForm">
	        <form id="policyDetails" name="" method="post" data-toggle="validator" >
	            <div class="container">
	                <div class="center" > 
	                    <!--desktop-->
	                    <h1 class="landing_h2 hidden-sm hidden-xs">Named Driver 1</h1>
	                    <!--end-desktop--> 
	                    <!--Mobile-->
	                    <h1 class="landing_h3 hidden-lg hidden-md feature-ttl">Named Driver 1</h1>
	                    <!--end mobile--> 
	                </div>
	            </div>
	                <div class="container">
	                    <div class="row">
	                        <div class="col-md-8 col-md-offset-2 col-sm-12">
	                            <div class="row">
	                                <div class="col-sm-6">
	                                    <div class="form-group">
	                                        <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
	                                            <div class="help-block-wrap">
	                                                <input type="text" name="fullName" value="Driver" maxlength="100" class="form-control input--grey mdl-textfield__input" id="fullName" pattern="^[a-zA-Z\s]+$" data-required-error="Please enter your full name." data-error="Please enter your full name in English." required>
	                                                <label class="mdl-textfield__label" for="fullName">Full Name</label>
	                                                <div class="help-block with-errors"></div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="col-sm-6">
	                                    <div class="form-group">
	                                        <div class="help-block-wrap">
	                                            <select class="form-control selectized" name="occupation" id="occupation" data-required-error="Please select your occupation." required>
	                                                <option value="" disabled selected hidden>Occupation</option>
	                                            </select>
	                                            <div class="help-block with-errors"></div>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="clearfix"></div>
	                                <div class="col-sm-6">
	                                    <div class="form-group">
	                                        <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
	                                            <div class="help-block-wrap calendar"> 
	                                                <span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
	                                                <input type="text" name="driverDob" id="driverDob" class="driverDob-datepicker form-control input--grey mdl-textfield__input" data-required-error="Please select your date of birth." required>
	                                                <label class="mdl-textfield__label" for="driverDob">Date of Birth</label>
	                                                <div class="help-block with-errors"></div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="col-sm-6">
	                                    <div class="form-group">
	                                        <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
	                                            <div class="help-block-wrap">
	                                                <input type="text" name="driverID" value="Z1234567" minlength="8" maxlength="8" pattern="^[a-zA-Z\d]+$" data-error="Your HKID no. is invalid." class="form-control input--grey mdl-textfield__input" data-required-error="Please enter your HKID no."  id="driverID" required>
	                                                <label class="mdl-textfield__label" for="driverID">HKID e.g. Z1234567 Without ()</label>
	                                                <div class="help-block with-errors"></div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="clearfix"></div>
	                                <div class="col-xs-12">
	                                    <div class="custom-checkbox">
	                                        <div class="checkbox">
	                                            <div class="form-group">
	                                                <div class="help-block-wrap">
	                                                    <input type="checkbox" id="term" name="term" value="agree" data-required-error="Named driver must have more than 2 years of driving experience." required>
	                                                    <label><small>
	                                                            Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. </small>
	                                                    </label>
	                                            <div class="help-block with-errors"></div>
	                                                </div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	                <div class="added-driver hidden" id="driver2">  
	                    <div class="container">
	                        <div class="row">
	                            <div class="col-md-8 col-md-offset-2 col-sm-12">
	                                <a href="" class="removeDriver pull-right"><small><i class="fa fa-times" aria-hidden="true"></i>&nbsp;Remove</small></a>
	                                <div class="center" > 
	                                    <!--desktop-->
	                                    <h1 class="landing_h2 hidden-sm hidden-xs">Driver 2</h1>
	                                    <!--end-desktop--> 
	                                    <!--Mobile-->
	                                    <h1 class="landing_h2 hidden-lg hidden-md feature-ttl">Driver 2</h1>
	                                    <!--end mobile--> 
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="container">
	                        <div class="row">
	                            <div class="col-md-8 col-md-offset-2 col-sm-12">
	                                <div class="row">
	                                    <div class="col-sm-6">
	                                        <div class="form-group">
	                                            <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
	                                                <div class="help-block-wrap">
	                                                    <input type="text" name="d2name" maxlength="100" class="form-control input--grey mdl-textfield__input" pattern="^[a-zA-Z\s]+$" data-required-error="Please enter your full name." data-error="Please enter your full name in English." >
	                                                    <label class="mdl-textfield__label" >Full Name</label>
	                                                    <div class="help-block with-errors"></div>
	                                                </div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                    <div class="col-sm-6">
	                                        <div class="form-group">
	                                            <div class="help-block-wrap">
	                                                <!-- <select class="form-control occupation" name="d2occuption" data-required-error="Please select your occupation." required>-->
	                                                <select class="form-control selectized" name="d2occupation" id="d2occupation" data-required-error="Please select your occupation." >
	                                                <option value="" disabled selected hidden>Occupation</option>
	                                            </select>
	                                                <div class="help-block with-errors"></div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                    <div class="clearfix"></div>
	                                    <div class="col-sm-6">
	                                        <div class="form-group">
	                                            <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
	                                                <div class="help-block-wrap calendar"> 
	                                                    <span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
	                                                    <input type="text" name="d2dob" class="driverDob-datepicker form-control input--grey mdl-textfield__input" >
	                                                    <label class="mdl-textfield__label" for="driverDob">Date of Birth</label>
	                                                    <div class="help-block with-errors"></div>
	                                                </div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                    <div class="col-sm-6">
	                                        <div class="form-group">
	                                            <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
	                                                <div class="help-block-wrap">
	                                                    <input type="text" name="d2id" minlength="8" maxlength="8" pattern="^[a-zA-Z\d]+$" data-pattern-error="Your HKID no. is invalid." class="form-control input--grey mdl-textfield__input" id="driverID" data-required-error="Please enter your HKID no." >
	                                                    <label class="mdl-textfield__label" for="driverID">HKID e.g. Z1234567 Without ()</label>
	                                                    <div class="help-block with-errors"></div>
	                                                </div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                    <div class="clearfix"></div>
	                                    <div class="col-xs-12">
	                                        <div class="custom-checkbox">
	                                            <div class="checkbox">
	                                                <div class="form-group">
	                                                    <div class="help-block-wrap">
	                                                    <input type="checkbox" id="d2term" name="d2term" value="agree" data-required-error="Named driver must have more than 2 years of driving experience." >
	                                                        <label><small>
	                                                                Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. </small>
	                                                        </label>
	                                                        <div class="help-block with-errors"></div>
	                                                    </div>
	                                                </div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	                <div class="added-driver hidden" id="driver3">  
	                    <div class="container">
	                        <div class="row">
	                            <div class="col-md-8 col-md-offset-2 col-sm-12">
	                                <a href="" class="removeDriver pull-right"><small><i class="fa fa-times" aria-hidden="true"></i>&nbsp;Remove</small></a>
	                                <div class="center" > 
	                                    <!--desktop-->
	                                    <h1 class="landing_h2 hidden-sm hidden-xs">Driver 3</h1>
	                                    <!--end-desktop--> 
	                                    <!--Mobile-->
	                                    <h1 class="landing_h2 hidden-lg hidden-md feature-ttl">Driver 3</h1>
	                                    <!--end mobile--> 
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="container">
	                        <div class="row">
	                            <div class="col-md-8 col-md-offset-2 col-sm-12">
	                                <div class="row">
	                                    <div class="col-sm-6">
	                                        <div class="form-group">
	                                            <div class="left-desktop text-box mdlhttp://localhost:3014/t8_Sign_up_page3.html-textfield mdl-js-textfield mdl-textfield--floating-label">
	                                                <div class="help-block-wrap">
	                                                    <input type="text" name="d3name" maxlength="100" class="form-control input--grey mdl-textfield__input" pattern="^[a-zA-Z\s]+$" data-required-error="Please enter your full name." data-error="Please enter your full name in English." >
	                                                    <label class="mdl-textfield__label" >Full Name</label>
	                                                    <div class="help-block with-errors"></div>
	                                                </div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                    <div class="col-sm-6">
	                                        <div class="form-group">
	                                            <div class="help-block-wrap">
	                                                 <select class="form-control selectized" name="d3occupation" id="d3occupation" data-required-error="Please select your occupation." >
	                                                <option value="" disabled selected hidden>Occupation</option>
	                                            </select>
	                                                <div class="help-block with-errors"></div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                    <div class="clearfix"></div>
	                                    <div class="col-sm-6">
	                                        <div class="form-group">
	                                            <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
	                                                <div class="help-block-wrap calendar">
	                                                	<span class="glyphicon glyphicon-calendar" aria-hidden="true"></span> 
	                                                    <input type="text" name="d3dob" class="driverDob-datepicker form-control input--grey mdl-textfield__input"  >
	                                                    <label class="mdl-textfield__label" for="driverDob">Date of Birth</label>
	                                                    <div class="help-block with-errors"></div>
	                                                </div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                    <div class="col-sm-6">
	                                        <div class="form-group">
	                                            <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
	                                                <div class="help-block-wrap">
	                                                    <input type="text" name="d3id" minlength="8" maxlength="8" pattern="^[a-zA-Z\d]+$" data-pattern-error="Your HKID no. is invalid." class="form-control input--grey mdl-textfield__input" id="driverID" data-required-error="Please enter your HKID no." >
	                                                    <label class="mdl-textfield__label" for="driverID">HKID e.g. Z1234567 Without ()</label>
	                                                    <div class="help-block with-errors"></div>
	                                                </div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                    <div class="clearfix"></div>
	                                    <div class="col-xs-12">
	                                        <div class="custom-checkbox">
	                                            <div class="checkbox">
	                                                <div class="form-group">
	                                                    <div class="help-block-wrap">
	                                                    <input type="checkbox" id="d3term" name="d3term" value="agree" data-required-error="Named driver must have more than 2 years of driving experience." >
	                                                        <label><small>
	                                                                Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. </small>
	                                                        </label>
	                                                        <div class="help-block with-errors"></div>
	                                                    </div>
	                                                </div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	                <div class="added-driver hidden" id="driver4">  
	                    <div class="container">
	                        <div class="row">
	                            <div class="col-md-8 col-md-offset-2 col-sm-12">
	                                <a href="" class="removeDriver pull-right"><small><i class="fa fa-times" aria-hidden="true"></i>&nbsp;Remove</small></a>
	                                <div class="center" > 
	                                    <!--desktop-->
	                                    <h1 class="landing_h2 hidden-sm hidden-xs">Driver 4</h1>
	                                    <!--end-desktop--> 
	                                    <!--Mobile-->
	                                    <h1 class="landing_h2 hidden-lg hidden-md feature-ttl">Driver 4</h1>
	                                    <!--end mobile--> 
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="container">
	                        <div class="row">
	                            <div class="col-md-8 col-md-offset-2 col-sm-12">
	                                <div class="row">
	                                    <div class="col-sm-6">
	                                        <div class="form-group">
	                                            <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
	                                                <div class="help-block-wrap">
	                                                    <input type="text" name="d4name" maxlength="100" class="form-control input--grey mdl-textfield__input" pattern="^[a-zA-Z\s]+$" data-required-error="Please enter your full name." data-error="Please enter your full name in English." >
	                                                    <label class="mdl-textfield__label" >Full Name</label>
	                                                    <div class="help-block with-errors"></div>
	                                                </div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                    <div class="col-sm-6">
	                                        <div class="form-group">
	                                            <div class="help-block-wrap">
	                                                <select class="form-control selectized" name="d4occupation" id="d4occupation" data-required-error="Please select your occupation." >
	                                                <option value="" disabled selected hidden>Occupation</option>
	                                            </select>
	                                                <div class="help-block with-errors"></div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                    <div class="clearfix"></div>
	                                    <div class="col-sm-6">
	                                        <div class="form-group">
	                                            <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
	                                                <div class="help-block-wrap calendar">
	                                               		<span class="glyphicon glyphicon-calendar" aria-hidden="true"></span> 
	                                                    <input type="text" name="d4dob" class="driverDob-datepicker form-control input--grey mdl-textfield__input"  >
	                                                    <label class="mdl-textfield__label" for="driverDob">Date of Birth</label>
	                                                    <div class="help-block with-errors"></div>
	                                                </div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                    <div class="col-sm-6">
	                                        <div class="form-group">
	                                            <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
	                                                <div class="help-block-wrap">
	                                                    <input type="text" name="d4id" minlength="8" maxlength="8" pattern="^[a-zA-Z\d]+$" data-pattern-error="Your HKID no. is invalid." class="form-control input--grey mdl-textfield__input" id="driverID" data-required-error="Please enter your HKID no." >
	                                                    <label class="mdl-textfield__label" for="driverID">HKID e.g. Z1234567 Without ()</label>
	                                                    <div class="help-block with-errors"></div>
	                                                </div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                    <div class="clearfix"></div>
	                                    <div class="col-xs-12">
	                                        <div class="custom-checkbox">
	                                            <div class="checkbox">
	                                                <div class="form-group">
	                                                    <div class="help-block-wrap">
	                                                    <input type="checkbox" id="d4term" name="d4term" value="agree" data-required-error="Named driver must have more than 2 years of driving experience." >
	                                                        <label><small>
	                                                                Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. </small>
	                                                        </label>
	                                                        <div class="help-block with-errors"></div>
	                                                    </div>
	                                                </div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	                <div class="added-driver hidden" id="driver5">  
	                    <div class="container">
	                        <div class="row">
	                            <div class="col-md-8 col-md-offset-2 col-sm-12">
	                                <a href="" class="removeDriver pull-right"><small><i class="fa fa-times" aria-hidden="true"></i>&nbsp;Remove</small></a>
	                                <div class="center" > 
	                                    <!--desktop-->
	                                    <h1 class="landing_h2 hidden-sm hidden-xs">Driver 5</h1>
	                                    <!--end-desktop--> 
	                                    <!--Mobile-->
	                                    <h1 class="landing_h2 hidden-lg hidden-md feature-ttl">Driver 5</h1>
	                                    <!--end mobile--> 
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="container">
	                        <div class="row">
	                            <div class="col-md-8 col-md-offset-2 col-sm-12">
	                                <div class="row">
	                                    <div class="col-sm-6">
	                                        <div class="form-group">
	                                            <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
	                                                <div class="help-block-wrap">
	                                                    <input type="text" name="d5name" maxlength="100" class="form-control input--grey mdl-textfield__input" pattern="^[a-zA-Z\s]+$" data-required-error="Please enter your full name." data-error="Please enter your full name in English." >
	                                                    <label class="mdl-textfield__label" >Full Name</label>
	                                                    <div class="help-block with-errors"></div>
	                                                </div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                    <div class="col-sm-6">
	                                        <div class="form-group">
	                                            <div class="help-block-wrap">
	                                                <select class="form-control selectized" name="d5occupation" id="d5occupation" data-required-error="Please select your occupation." >
	                                                <option value="" disabled selected hidden>Occupation</option>
	                                            </select>
	                                                <div class="help-block with-errors"></div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                    <div class="clearfix"></div>
	                                    <div class="col-sm-6">
	                                        <div class="form-group">
	                                            <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
	                                                <div class="help-block-wrap calendar">
	                                                	<span class="glyphicon glyphicon-calendar" aria-hidden="true"></span> 
	                                                    <input type="text" name="d5dob" class="driverDob-datepicker form-control input--grey mdl-textfield__input"  >
	                                                    <label class="mdl-textfield__label" for="driverDob">Date of Birth</label>
	                                                    <div class="help-block with-errors"></div>
	                                                </div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                    <div class="col-sm-6">
	                                        <div class="form-group">
	                                            <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
	                                                <div class="help-block-wrap">
	                                                    <input type="text" name="d5id" minlength="8" maxlength="8" pattern="^[a-zA-Z\d]+$" data-pattern-error="Your HKID no. is invalid." class="form-control input--grey mdl-textfield__input" id="driverID" data-required-error="Please enter your HKID no." >
	                                                    <label class="mdl-textfield__label" for="driverID">HKID e.g. Z1234567 Without ()</label>
	                                                    <div class="help-block with-errors"></div>
	                                                </div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                    <div class="clearfix"></div>
	                                    <div class="col-xs-12">
	                                        <div class="custom-checkbox">
	                                            <div class="checkbox">
	                                                <div class="form-group">
	                                                    <div class="help-block-wrap">
	                                                    <input type="checkbox" id="d5term" name="d5term" value="agree" data-required-error="Named driver must have more than 2 years of driving experience." >
	                                                        <label><small>
	                                                                Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. </small>
	                                                        </label>
	                                                        <div class="help-block with-errors"></div>
	                                                    </div>
	                                                </div>
	                                                <br/>
	                                                <br/>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	                <div class="container">
	                    <div class="row">
	                        <div class="col-xs-12 text-center">
	                            <a href="#" class="underline" id="addDriver"><i class="fa fa-plus underline" aria-hidden="true"></i>&nbsp;&nbsp;Add Driver</a>
	                        </div>
	                    </div>
	                </div>
	            <div class="container no-claim">
	                <div id="testimonials">
	                    <div class="center" > 
	                        <!--desktop-->
	                        <h1 class="landing_h2 hidden-sm hidden-xs">Policy Period</h1>
	                        <!--end-desktop--> 
	                        <!--Mobile-->
	                        <h1 class="landing_h2 hidden-lg hidden-md feature-ttl">Policy Period</h1>
	                        <!--end mobile--> 
	                    </div>
	                    <div class="row">
	                        <div class="col-md-8 col-md-offset-2 col-sm-12">
	                            <div class="row">
	                                <div class="col-sm-6">
	                                    <div class="form-group">
	                                        <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
	                                            <div class="help-block-wrap">
	                                                <input type="text" name="prev_ic" pattern="^[a-zA-Z\d]+$" data-error="Please enter Name of Previous Insurance Company in English." minlength="8" maxlength="8" class="form-control input--grey mdl-textfield__input" id="prev_ic" required data-required-error="Please enter Name of Previous Insurance Company.">
	                                                <label class="mdl-textfield__label" >Name of Previous Insurance Company</label>
	                                                <div class="help-block with-errors"></div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="col-sm-6">
	                                    <div class="form-group">
	                                        <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
	                                            <div class="help-block-wrap">
	                                                <input type="text" name="prev_regNo" pattern="^[a-zA-Z\d]+$" data-error="Please enter alphabetic or numberic characters only." minlength="6" maxlength="20" class="form-control input--grey mdl-textfield__input" id="prev_regNo" data-required-error="Please enter Registration No. of Previous Policy." required>
	                                                <label class="mdl-textfield__label" >Registration No. of Prev Policy</label>
	                                                <div class="help-block with-errors"></div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="col-sm-6">
	                                    <div class="form-group" id="expiry-datepicker-group">
	                                        <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
	                                            <div class="help-block-wrap calendar" > 
	                                                <span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
	                                                <input type="text" name="expiry-datepicker" id="expiry-datepicker" class="form-control mdl-textfield__input" required data-required-error="Please select Previous Insurance Expiry Date." data-error="Previous Insurance Expiry Date must be within 365 days ">
	                                                <label class="mdl-textfield__label" >Previous Insurance Expiry Date</label>
	                                            </div>
	                                                <div class="help-block with-errors" id="expiry-datepicker-error"></div>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="col-sm-6">
	                                    <div class="form-group">
	                                        <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
	                                            <div class="help-block-wrap">
	                                                <input type="text" name="prev_policyNo" pattern="^[a-zA-Z\d]+$" data-error="Please enter alphabetic or numberic characters only." minlength="3" maxlength="30" class="form-control input--grey mdl-textfield__input" data-required-error="Please enter Registration No. of Previous Policy." id="prev_policyNo" required>
	                                                <label class="mdl-textfield__label" >Pervious Policy No.</label>
	                                                <div class="help-block with-errors"></div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>  
	                        </div> 
	                    </div>
	                </div> 
	            </div>
	            <div class="container">
	                <div class="row" >
	                    <div class="text-center col-sm-6 col-sm-offset-3">
	                        <div class="row" >
	                            <div class="text-center col-xs-6">
	                                <br />
	                                <a class="bdr-curve btn btn-primary nxt-btn" onclick="perventRedirect=false;BackMe();">Back </a>
	                                <br/>
	                            </div>
	                            <div class="text-center col-xs-6">
	                                <br />
	                                 <input type="submit" class="bdr-curve btn btn-primary nxt-btn" value="Next" />
	                                <br/>
	                            </div>
	                            <div class="clearfix"></div> 
	                            <div class="text-center save">
	                                <a href="#" data-toggle="modal" id="saveForm" data-target="#saveModal" class="">Save an Continue Later</a>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </form>
	   	</div>
    </section>
    <section class="yourQuote">
    <div class="container">
        <div class="row" >
            <a class="orange-color col-xs-12 collapse-addon center" role="button" data-toggle="collapse" href="#yourQuote" aria-expanded="false" aria-controls="yourQuote">
                <h3><span class="small title">Your quote</span><span class="price">HK$4,680.00</span></h3>
            </a>
            <div class="col-xs-12 col-sm-10 col-sm-offset-1 collapse" id="yourQuote">
                <div class="row">
                    <div class="col-sm-6">
                        <span class="ci"> Comprehensive Insurance </span>
                    </div>
                    <div class="col-sm-6 text-right">
                        <small class="from">from</small><span class="price">HK$4,230.00</span>
                    </div>
                    <div class="col-xs-12">
                        <br/>
                    </div>
                    <div class="col-xs-12">
                    <strong>Add On:</strong> 
                    </div>
                    <div class="col-xs-6">
                        <span>Personal Accident</span>
                    </div>
                    <div class="col-xs-6 text-right">
                        <span>300.00</span>
                    </div>
                    <div class="col-xs-12">
                        <br/>
                    </div>
                    <div class="col-xs-6">
                        <span>Subtitle</span>
                    </div>
                    <div class="col-xs-6 text-right">
                        <span>3400.00</span>
                    </div>
                    <div class="col-xs-6">
                        <span>Discounts</span>
                    </div>
                    <div class="col-xs-6 text-right">
                        <span>300.00</span>
                    </div>
                    <div class="col-xs-12">
                        <hr/>
                    </div>
                    <div class="col-xs-6">
                        <strong>Amount due:</strong>
                    </div>
                    <div class="col-xs-6 text-right">
                        <strong>HKD$300.00</strong>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
    </div>
    
</section>

</div>
<!-- SaveForm Modal -->
<div class="modal fade" id="saveModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content plan-modal">
            <div class="login-close-wrapper"><a class="close" aria-label="Close" data-dismiss="modal"><span aria-hidden="true">Ã</span></a></div>
            <div class="login-title-wrapper">
                <div class="row">
                    <div class="col-xs-12 col-sm-10 col-sm-offset-1 plan-panel">
                        <h3 class="heading-h3 color-orange text-center">
                            Welcome Back! ABC! 
                        </h3>
                    </div>
                    <div class="col-xs-12 col-sm-8 col-sm-offset-2 text-center">
                        <p>
                            Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. 
                        </p>
                    </div>
                    <div class="col-xs-12 col-sm-8 col-sm-offset-2 plan-panel">
                        <div class="row" >
                            <div class="text-center col-xs-6">
                                <br />
                                <a class="bdr-curve btn btn-primary nxt-btn" onclick="perventRedirect=false;BackMe();">Back </a>
                                <br/>
                            </div>
                            <div class="text-center col-xs-6">
                                <br />
                                <input type="submit" class="bdr-curve btn btn-primary nxt-btn" value="Next" />
                                <br/>
                            </div>
                            <div class="clearfix"></div> 
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/motor/validator.min.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/motor/bootstrap-switch.min.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/motor/selectize.min.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/motor/motor-forms.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/motor/register-form.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/motor/custom-datepicker.js"></script>
<script type="text/javascript">
var quote = jQuery.parseJSON('<%=request.getParameter("data").replace("&quot;", "\"")%>');
$(document).ready(function(){

	var term = $('#term');
	var d2term = $('#d2term');
	var d3term = $('#d3term');
	var d4term = $('#d4term');
	var d5term = $('#d5term');
	
	
	 var getUrlParameter = function getUrlParameter(sParam) {
	        var sPageURL = decodeURIComponent(window.location.search.substring(1)),
	            sURLVariables = sPageURL.split('&'),
	            sParameterName,
	            i;

	        for (i = 0; i < sURLVariables.length; i++) {
	            sParameterName = sURLVariables[i].split('=');

	            if (sParameterName[0] === sParam) {
	                return sParameterName[1] === undefined ? true : sParameterName[1];
	            }
	        }
	    };
	
    $.ajax({
		  type: "POST",
		  data: JSON.stringify(quote),
		  dataType: "json",
	      contentType : "application/json",
	      cache: false,
	      async: false,
	      url:context + "/api/iMotor/quote",
		  success: function(data){
			  console.dir(data);
			  $('.price').html(formatCurrency(data.amountDueAmount));
		  },error: function(error) {
			
		  }
		});    
	    
	$('#policyDetails').submit(function(event){
	   
	   var isThird;
       if (getUrlParameter('plan')=='third') {
    	  isThird = true;
       } else {
    	  isThird = false;
       }
       
       var driverMoreThanTwo = false;
	   if($('input[name=d3name]').val()!="")
	   {
		   driverMoreThanTwo = true;
	   }
	   var data = { 		
			   "policyId": "26379363",		
			   "driver": [		
			   {		
			     "dateOfBirth": $('input[name=driverDob]').val(),		
			     "driveMoreThanTwo": driverMoreThanTwo,		
			     "hkid": $('input[name=driverID]').val(),		
			     "name": $('input[name=fullName]').val(),		
			     "occupation": $("#occupation option:selected").text(),	
			     "validAgeGroup": $('input[name=term]').val()		
			   }, 		
			   {		
			     "dateOfBirth": $('input[name=d2dob]').val(),		
			     "driveMoreThanTwo": driverMoreThanTwo,		
			     "hkid": $('input[name=d2id]').val(),		
			     "name": $('input[name=d2name]').val(),		
			     "occupation": $("#d2occupation option:selected").text(),		
			     "validAgeGroup":  $('input[name=d2term]').val()			
			   }, 		
			   {		
				 "dateOfBirth": $('input[name=d3dob]').val(),		
				 "driveMoreThanTwo": driverMoreThanTwo,		
				 "hkid": $('input[name=d3id]').val(),		
				 "name": $('input[name=d3name]').val(),		
				 "occupation": $("#d3occupation option:selected").text(),		
				 "validAgeGroup": $('input[name=d3term]').val()		
			   }, 		
			   {		
				 "dateOfBirth": $('input[name=d4dob]').val(),		
				 "driveMoreThanTwo": driverMoreThanTwo,		
				 "hkid": $('input[name=d4id]').val(),		
				 "name": $('input[name=d4name]').val(),		
				 "occupation": $("#d4occupation option:selected").text(),		
				 "validAgeGroup":  $('input[name=d4term]').val()			
			   }, 		
			   {		
				 "dateOfBirth": $('input[name=d5dob]').val(),		
				 "driveMoreThanTwo": driverMoreThanTwo,		
				 "hkid": $('input[name=d5id]').val(),		
				 "name": $('input[name=d5name]').val(),		
				 "occupation": $("#d5occupation option:selected").text(),		
				 "validAgeGroup": $('input[name=d5term]').val()		
			   }		
			   ], 		
			     "nameOfPreviousInusrancer": $('input[name=prev_ic]').val(),		
			     "regNoofPreviousPolicy": $('input[name=prev_regNo]').val(),		
			     "expDateOfPreviousInsurance": $('input[name=expiry-datepicker]').val(),		
			     "previousPolicyNo": $('input[name=prev_policyNo]').val()	
			 };
		console.dir(data);
		
		$.ajax({
		 beforeSend: function(){
          	$('#loading-overlay').modal("show");
          },
		  type: "POST",
		  data: JSON.stringify(data),
		  dataType: "json",
          contentType : "application/json",
          cache: false,
          async: false,
		  url: "/api/iMotor/policy/saving/policyDetails",
		  success: function(data){
			  
		 	 var $form = $("<form id='quote-form' />");
             if (isThird) {
                 $form.attr("action", "third-party-quote");
             } else {
                 $form.attr("action", "comprehensive-quote");
             }
             $form.attr("method", "post");
             var $quote = $("<input type='hidden' name='data' />");
             var newdata = {};
             newdata['FulPolicyDetails'] = data;
             $quote.attr("value", JSON.stringify($.extend( newdata, quote )));
             $form.append($quote);
             $("body").append($form);
             $('#quote-form').submit();  
			  
		  },error: function(error) {
			 	
	             var $form = $("<form id='quote-form' />");
	              if (isThird) {
	                  $form.attr("action", "third-party-quote");
	              } else {
	                  $form.attr("action", "application-summary");
	              }
	              $form.attr("method", "post");
	              var $quote = $("<input type='hidden' name='data' />");
	              var newdata = {};
	              newdata['FulPolicyDetails'] = data;
	              $quote.attr("value", JSON.stringify($.extend( newdata, quote )));
	              $form.append($quote);
	              $("body").append($form);
	              $('#quote-form').submit(); 
		  }
		});
		return false;
	});
});
</script>
