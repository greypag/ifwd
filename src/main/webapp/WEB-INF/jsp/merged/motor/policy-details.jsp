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
                                        <span class="status"><fmt:message key="motor.policydetails.page.heading" bundle="${motorMsg}" /></span>
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
                <h1 class="landing_h2 hidden-sm hidden-xs"><fmt:message key="motor.policydetails.page.heading" bundle="${motorMsg}" /></h1>
                <!--end-desktop--> 
                <!--Mobile-->
                <h1 class="landing_h2 hidden-lg hidden-md feature-ttl"><fmt:message key="motor.policydetails.page.heading" bundle="${motorMsg}" /></h1>
                <!--end mobile--> 
            </div>
        </div>
        <div id="motor_registerForm">
	        <form id="policyDetails" name="" method="post">
	            <div class="container">
	                <div class="center" > 
	                    <!--desktop-->
	                    <h1 class="landing_h2 hidden-sm hidden-xs"><fmt:message key="motor.policydetails.driver.1.title" bundle="${motorMsg}" /></h1>
	                    <!--end-desktop--> 
	                    <!--Mobile-->
	                    <h1 class="landing_h3 hidden-lg hidden-md feature-ttl"><fmt:message key="motor.policydetails.driver.1.title" bundle="${motorMsg}" /></h1>
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
	                                                <input type="text" readonly name="fullName" value="" maxlength="100" class="form-control input--grey mdl-textfield__input" id="fullName" pattern="^[a-zA-Z\s]+$" data-required-error='<fmt:message key="motor.error.msg.policy.fullname.empty" bundle="${motorMsg}" />' data-error='<fmt:message key="motor.error.msg.policy.driver.name.format" bundle="${motorMsg}" />' required>
	                                                <label class="mdl-textfield__label" for="fullName"><fmt:message key="motor.policydetails.driver.name" bundle="${motorMsg}" /></label>
	                                                <div class="help-block with-errors"></div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="col-sm-6">
	                                    <div class="form-group">
	                                        <div class="help-block-wrap">
	                                            <select class="form-control selectized" name="occupation" id="occupation" data-required-error='<fmt:message key="motor.error.msg.policy.occupation.empty" bundle="${motorMsg}" />' required>
	                                                <option value="" disabled selected hidden><fmt:message key="motor.policydetails.driver.occupation" bundle="${motorMsg}" /></option>
	                                            </select>
	                                            <label class="mdl-textfield__label label-occupation hidden" for="occupation" ><fmt:message key="motor.policydetails.driver.occupation" bundle="${motorMsg}" /></label>
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
	                                                <!--  <input type="text" readonly name="driverDob" id="driverDob" class="driverDob-datepicker form-control input--grey mdl-textfield__input" data-required-error='<fmt:message key="motor.error.msg.policy.dob.empty" bundle="${motorMsg}" />' required>-->
	                                                <input style="cursor:not-allowed" type="text" readonly name="driverDob" id="driverDob" maxlength="20" class="form-control input--grey mdl-textfield__input" required>
	                                                <label class="mdl-textfield__label" for="driverDob"><fmt:message key="motor.policydetails.driver.birthdate" bundle="${motorMsg}" /></label>
	                                                <div class="help-block with-errors"></div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="col-sm-6">
	                                    <div class="form-group">
	                                        <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
	                                            <div class="help-block-wrap">
	                                                <input type="text" readonly style="text-transform:uppercase" name="driverID" value="" minlength="8" maxlength="8" pattern="^[a-zA-Z\d\s]+$" data-error='<fmt:message key="motor.error.msg.policy.id.format" bundle="${motorMsg}" />' class="form-control input--grey mdl-textfield__input" data-required-error='<fmt:message key="motor.error.msg.policy.id.empty" bundle="${motorMsg}" />'  id="driverID" required>
	                                                <label class="mdl-textfield__label" for="driverID"><fmt:message key="motor.policydetails.driver.hkid" bundle="${motorMsg}" /></label>
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
	                                                    <input checked type="checkbox" id="term" name="term" value="true" data-required-error='<fmt:message key="motor.error.msg.policy.driver.exp.format" bundle="${motorMsg}" />' required>
	                                                    <label><small>
	                                                            <fmt:message key="motor.policydetails.driver.validlicense" bundle="${motorMsg}" /></small>
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
	                                <a href="" class="removeDriver pull-right"><small><i class="fa fa-times" aria-hidden="true"></i>&nbsp;<fmt:message key="motor.label.remove" bundle="${motorMsg}" /></small></a>
	                                <div class="center" > 
	                                    <!--desktop-->
	                                    <h1 class="landing_h2 hidden-sm hidden-xs"><fmt:message key="motor.policydetails.driver.2.title" bundle="${motorMsg}" /></h1>
	                                    <!--end-desktop--> 
	                                    <!--Mobile-->
	                                    <h1 class="landing_h2 hidden-lg hidden-md feature-ttl"><fmt:message key="motor.policydetails.driver.2.title" bundle="${motorMsg}" /></h1>
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
	                                                    <input type="text" name="d2name" maxlength="100" class="form-control input--grey mdl-textfield__input" pattern="^[a-zA-Z\s]+$" data-required-error='<fmt:message key="motor.error.msg.policy.fullname.empty" bundle="${motorMsg}" />' data-error='<fmt:message key="motor.error.msg.policy.driver.name.format" bundle="${motorMsg}" />' >
	                                                    <label class="mdl-textfield__label" ><fmt:message key="motor.policydetails.driver.name" bundle="${motorMsg}" /></label>
	                                                    <div class="help-block with-errors"></div>
	                                                </div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                    <div class="col-sm-6">
	                                        <div class="form-group">
	                                            <div class="help-block-wrap">
	                                                <!-- <select class="form-control occupation" name="d2occuption" data-required-error="Please select your occupation." required>-->
	                                                <select class="form-control selectized " name="d2occupation" id="d2occupation" data-required-error='<fmt:message key="motor.error.msg.policy.occupation.empty" bundle="${motorMsg}" />' >
	                                                <option value="" disabled selected hidden><fmt:message key="motor.policydetails.driver.occupation" bundle="${motorMsg}" /></option>
	                                            </select>
	                                            	<label class="mdl-textfield__label label-d2occupation hidden" for="d2occupation" ><fmt:message key="motor.policydetails.driver.occupation" bundle="${motorMsg}" /></label>
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
	                                                    <input type="text" name="d2dob" id="d2dob" class="driverDob-dp form-control input--grey mdl-textfield__input" data-required-error='<fmt:message key="motor.error.msg.policy.dob.empty" bundle="${motorMsg}" />' >
	                                                    <span style="display:none"><input type="text" id="d2dob-hidden"  data-required-error='<fmt:message key="motor.error.msg.policy.dob.empty" bundle="${motorMsg}" />' /></span>
	                                                    <label class="mdl-textfield__label" for="driverDob"><fmt:message key="motor.policydetails.driver.birthdate" bundle="${motorMsg}" /></label>
	                                                  </div>
	                                                  <div class="help-block with-errors"></div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                    <div class="col-sm-6">
	                                        <div class="form-group">
	                                            <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
	                                                <div class="help-block-wrap">
	                                                    <input type="text" style="text-transform:uppercase" name="d2id" data-equals="<fmt:message key="motor.error.msg.policy.id.empty" bundle="${motorMsg}" />" maxlength="8" class="form-control input--grey mdl-textfield__input" id="driverID" >
	                                                    <label class="mdl-textfield__label" for="driverID"><fmt:message key="motor.policydetails.driver.hkid" bundle="${motorMsg}" /></label>
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
	                                                    <input type="checkbox" id="d2term" name="d2term" value="true" data-required-error='<fmt:message key="motor.error.msg.policy.driver.exp.format" bundle="${motorMsg}" />' >
	                                                        <label><small>
	                                                                <fmt:message key="motor.policydetails.driver.validlicense" bundle="${motorMsg}" /></small>
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
	                                <a href="" class="removeDriver pull-right"><small><i class="fa fa-times" aria-hidden="true"></i>&nbsp;<fmt:message key="motor.label.remove" bundle="${motorMsg}" /></small></a>
	                                <div class="center" > 
	                                    <!--desktop-->
	                                    <h1 class="landing_h2 hidden-sm hidden-xs"><fmt:message key="motor.policydetails.driver.3.title" bundle="${motorMsg}" /></h1>
	                                    <!--end-desktop--> 
	                                    <!--Mobile-->
	                                    <h1 class="landing_h2 hidden-lg hidden-md feature-ttl"><fmt:message key="motor.policydetails.driver.3.title" bundle="${motorMsg}" /></h1>
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
	                                                    <input type="text" name="d3name" maxlength="100" class="form-control input--grey mdl-textfield__input" pattern="^[a-zA-Z\s]+$" data-required-error='<fmt:message key="motor.error.msg.policy.fullname.empty" bundle="${motorMsg}" />' data-error='<fmt:message key="motor.error.msg.policy.driver.name.format" bundle="${motorMsg}" />' >
	                                                    <label class="mdl-textfield__label" ><fmt:message key="motor.policydetails.driver.name" bundle="${motorMsg}" /></label>
	                                                    <div class="help-block with-errors"></div>
	                                                </div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                    <div class="col-sm-6">
	                                        <div class="form-group">
	                                            <div class="help-block-wrap">
	                                                <select class="form-control selectized" name="d3occupation" id="d3occupation" data-required-error='<fmt:message key="motor.error.msg.policy.occupation.empty" bundle="${motorMsg}" />' >
	                                                    <option value="" disabled selected hidden><fmt:message key="motor.policydetails.driver.occupation" bundle="${motorMsg}" /></option>
	                                                </select>
	                                                <label class="mdl-textfield__label label-d3occupation hidden" for="d3occupation" ><fmt:message key="motor.policydetails.driver.occupation" bundle="${motorMsg}" /></label>
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
	                                                    <input type="text" name="d3dob" id="d3dob" class="driverDob-dp form-control input--grey mdl-textfield__input" data-required-error='<fmt:message key="motor.error.msg.policy.dob.empty" bundle="${motorMsg}" />'>
	                                                    <span style="display:none"><input type="text" id="d3dob-hidden"  data-required-error='<fmt:message key="motor.error.msg.policy.dob.empty" bundle="${motorMsg}" />' /></span>
	                                                   
	                                                    <label class="mdl-textfield__label" for="driverDob"><fmt:message key="motor.policydetails.driver.birthdate" bundle="${motorMsg}" /></label>
										                 </div>                                   
										                 <div class="help-block with-errors"></div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                    <div class="col-sm-6">
	                                        <div class="form-group">
	                                            <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
	                                                <div class="help-block-wrap">
	                                                    <input type="text" style="text-transform:uppercase" name="d3id" data-equals="<fmt:message key="motor.error.msg.policy.id.empty" bundle="${motorMsg}" />" maxlength="8" class="form-control input--grey mdl-textfield__input" id="driverID"  >
	                                                    <label class="mdl-textfield__label" for="driverID"><fmt:message key="motor.policydetails.driver.hkid" bundle="${motorMsg}" /></label>
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
	                                                    <input type="checkbox" id="d3term" name="d3term" value="true" data-required-error='<fmt:message key="motor.error.msg.policy.driver.exp.format" bundle="${motorMsg}" />' >
	                                                        <label><small>
	                                                                <fmt:message key="motor.policydetails.driver.validlicense" bundle="${motorMsg}" /></small>
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
	                                <a href="" class="removeDriver pull-right"><small><i class="fa fa-times" aria-hidden="true"></i>&nbsp;<fmt:message key="motor.label.remove" bundle="${motorMsg}" /></small></a>
	                                <div class="center" > 
	                                    <!--desktop-->
	                                    <h1 class="landing_h2 hidden-sm hidden-xs"><fmt:message key="motor.policydetails.driver.4.title" bundle="${motorMsg}" /></h1>
	                                    <!--end-desktop--> 
	                                    <!--Mobile-->
	                                    <h1 class="landing_h2 hidden-lg hidden-md feature-ttl"><fmt:message key="motor.policydetails.driver.4.title" bundle="${motorMsg}" /></h1>
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
	                                                    <input type="text" name="d4name" maxlength="100" class="form-control input--grey mdl-textfield__input" pattern="^[a-zA-Z\s]+$" data-required-error='<fmt:message key="motor.error.msg.policy.fullname.empty" bundle="${motorMsg}" />' data-error='<fmt:message key="motor.error.msg.policy.driver.name.format" bundle="${motorMsg}" />' >
	                                                    <label class="mdl-textfield__label" ><fmt:message key="motor.policydetails.driver.name" bundle="${motorMsg}" /></label>
	                                                    <div class="help-block with-errors"></div>
	                                                </div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                    <div class="col-sm-6">
	                                        <div class="form-group">
	                                            <div class="help-block-wrap">
	                                                <select class="form-control selectized" name="d4occupation" id="d4occupation" data-required-error='<fmt:message key="motor.error.msg.policy.occupation.empty" bundle="${motorMsg}" />' >
	                                                    <option value="" disabled selected hidden><fmt:message key="motor.policydetails.driver.occupation" bundle="${motorMsg}" /></option>
	                                                </select>
	                                                <label class="mdl-textfield__label label-d4occupation hidden" for="d4occupation" ><fmt:message key="motor.policydetails.driver.occupation" bundle="${motorMsg}" /></label>
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
	                                                    <input type="text" name="d4dob" id="d4dob" class="driverDob-dp form-control input--grey mdl-textfield__input" data-required-error='<fmt:message key="motor.error.msg.policy.dob.empty" bundle="${motorMsg}" />'>
	                                                    <span style="display:none"><input type="text" id="d4dob-hidden"  data-required-error='<fmt:message key="motor.error.msg.policy.dob.empty" bundle="${motorMsg}" />' /></span>
	                                                   
	                                                    <label class="mdl-textfield__label" for="driverDob"><fmt:message key="motor.policydetails.driver.birthdate" bundle="${motorMsg}" /></label>
	                                                    </div>
	                                                    <div class="help-block with-errors"></div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                    <div class="col-sm-6">
	                                        <div class="form-group">
	                                            <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
	                                                <div class="help-block-wrap">
	                                                    <input type="text" style="text-transform:uppercase" name="d4id" data-equals="<fmt:message key="motor.error.msg.policy.id.empty" bundle="${motorMsg}" />" maxlength="8" class="form-control input--grey mdl-textfield__input" id="driverID" >
	                                                    <label class="mdl-textfield__label" for="driverID"><fmt:message key="motor.policydetails.driver.hkid" bundle="${motorMsg}" /></label>
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
	                                                    <input type="checkbox" id="true" name="d4term" value="true" data-required-error='<fmt:message key="motor.error.msg.policy.driver.exp.format" bundle="${motorMsg}" />' >
	                                                        <label><small>
	                                                                <fmt:message key="motor.policydetails.driver.validlicense" bundle="${motorMsg}" /></small>
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
	                                <a href="" class="removeDriver pull-right"><small><i class="fa fa-times" aria-hidden="true"></i>&nbsp;<fmt:message key="motor.label.remove" bundle="${motorMsg}" /></small></a>
	                                <div class="center" > 
	                                    <!--desktop-->
	                                    <h1 class="landing_h2 hidden-sm hidden-xs"><fmt:message key="motor.policydetails.driver.5.title" bundle="${motorMsg}" /></h1>
	                                    <!--end-desktop--> 
	                                    <!--Mobile-->
	                                    <h1 class="landing_h2 hidden-lg hidden-md feature-ttl"><fmt:message key="motor.policydetails.driver.5.title" bundle="${motorMsg}" /></h1>
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
	                                                    <input type="text" name="d5name" maxlength="100" class="form-control input--grey mdl-textfield__input" pattern="^[a-zA-Z\s]+$" data-required-error='<fmt:message key="motor.error.msg.policy.fullname.empty" bundle="${motorMsg}" />' data-error='<fmt:message key="motor.error.msg.policy.driver.name.format" bundle="${motorMsg}" />' >
	                                                    <label class="mdl-textfield__label" ><fmt:message key="motor.policydetails.driver.name" bundle="${motorMsg}" /></label>
	                                                    <div class="help-block with-errors"></div>
	                                                </div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                    <div class="col-sm-6">
	                                        <div class="form-group">
	                                            <div class="help-block-wrap">
	                                                <select class="form-control selectized" name="d5occupation" id="d5occupation" data-required-error='<fmt:message key="motor.error.msg.policy.occupation.empty" bundle="${motorMsg}" />' >
	                                                    <option value="" disabled selected hidden><fmt:message key="motor.policydetails.driver.occupation" bundle="${motorMsg}" /></option>
	                                                </select>
	                                                <label class="mdl-textfield__label label-d5occupation hidden" for="d5occupation" ><fmt:message key="motor.policydetails.driver.occupation" bundle="${motorMsg}" /></label>
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
	                                                    <input type="text" name="d5dob" id="d5dob" class="driverDob-dp form-control input--grey mdl-textfield__input" data-required-error='<fmt:message key="motor.error.msg.policy.dob.empty" bundle="${motorMsg}" />'>
	                                                    <span style="display:none"><input type="text" id="d5dob-hidden"  data-required-error='<fmt:message key="motor.error.msg.policy.dob.empty" bundle="${motorMsg}" />' /></span>
	                                                   
	                                                    <label class="mdl-textfield__label" for="driverDob"><fmt:message key="motor.policydetails.driver.birthdate" bundle="${motorMsg}" /></label>
	                                                    </div>
	                                                    <div class="help-block with-errors"></div>
	                                                </div>
	                                            
	                                        </div>
	                                    </div>
	                                    <div class="col-sm-6">
	                                        <div class="form-group">
	                                            <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
	                                                <div class="help-block-wrap">
	                                                    <input type="text" style="text-transform:uppercase" name="d5id" data-equals="<fmt:message key="motor.error.msg.policy.id.empty" bundle="${motorMsg}" />" maxlength="8" class="form-control input--grey mdl-textfield__input" id="driverID" >
	                                                    <label class="mdl-textfield__label" for="driverID"><fmt:message key="motor.policydetails.driver.hkid" bundle="${motorMsg}" /></label>
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
	                                                    <input type="checkbox" id="d5term" name="d5term" value="true" data-required-error='<fmt:message key="motor.error.msg.policy.driver.exp.format" bundle="${motorMsg}" />' >
	                                                        <label><small>
	                                                                <fmt:message key="motor.policydetails.driver.validlicense" bundle="${motorMsg}" /></small>
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
	                            <a href="#" class="underline" id="addDriver"><i class="fa fa-plus underline" aria-hidden="true"></i>&nbsp;&nbsp;<fmt:message key="motor.policydetails.driver.addadriver" bundle="${motorMsg}" /></a>
	                        </div>
	                    </div>
	                </div>
	            <div class="container no-claim">
	                <div id="testimonials">
	                    <div class="center" > 
	                        <!--desktop-->
	                        <h1 class="landing_h2 hidden-sm hidden-xs"><fmt:message key="motor.policydetails.policy.title" bundle="${motorMsg}" /></h1>
	                        <!--end-desktop--> 
	                        <!--Mobile-->
	                        <h1 class="landing_h2 hidden-lg hidden-md feature-ttl"><fmt:message key="motor.policydetails.policy.title" bundle="${motorMsg}" /></h1>
	                        <!--end mobile--> 
	                    </div>
	                    <div class="row">
	                        <div class="col-md-8 col-md-offset-2 col-sm-12">
	                            <div class="row">
	                                <div class="col-sm-6">
	                                    <div class="form-group">
	                                        <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
	                                            <div class="help-block-wrap">
	                                                <!--<input type="text" name="prev_ic" pattern="^[a-zA-Z\d\s]+$" data-error='<fmt:message key="motor.error.msg.policy.preinsurance.empty" bundle="${motorMsg}" />' minlength="3" maxlength="3" class="form-control input--grey mdl-textfield__input" id="prev_ic" required data-required-error='<fmt:message key="motor.error.msg.policy.preinsurance.empty" bundle="${motorMsg}" />'>
	                                                <label class="mdl-textfield__label" ><fmt:message key="motor.policydetails.policy.prev.insurer" bundle="${motorMsg}" /></label>
	                                                <div class="help-block with-errors"></div>-->
	                                                <select class="form-control" id="prev_ic" name="prev_ic" data-required-error='<fmt:message key="motor.error.msg.policy.preinsurance.empty" bundle="${motorMsg}" />' >
	                                                <option value="" disabled selected hidden><fmt:message key="motor.policydetails.policy.prev.insurer" bundle="${motorMsg}" /></option>
	                                            	</select>
	                                            	<label class="mdl-textfield__label label-prev_ic hidden" for="prev_ic" ><fmt:message key="motor.policydetails.policy.prev.insurer" bundle="${motorMsg}" /></label>
	                                                
													<div class="help-block with-errors"></div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="col-sm-6">
	                                    <div class="form-group">
	                                        <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
	                                            <div class="help-block-wrap">
	                                                <input type="text" name="prev_regNo" pattern="^[a-zA-Z\d\s]+$" data-error='<fmt:message key="motor.error.msg.general.alphanumeric" bundle="${motorMsg}" />' minlength="4" maxlength="8" class="form-control input--grey mdl-textfield__input" id="prev_regNo" data-required-error='<fmt:message key="motor.error.msg.policy.regno.empty" bundle="${motorMsg}" />' required>
	                                                <label class="mdl-textfield__label" ><fmt:message key="motor.policydetails.policy.prev.regno" bundle="${motorMsg}" /></label>
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
	                                                <input type="text" name="expiry-datepicker" id="expiry-datepicker" class="form-control mdl-textfield__input" required data-required-error='<fmt:message key="motor.error.msg.policy.expiry.empty" bundle="${motorMsg}" />' data-error='<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/motor/selectize.min.js"></script>'>
	                                                <label class="mdl-textfield__label" ><fmt:message key="motor.policydetails.policy.prev.expdate" bundle="${motorMsg}" /></label>
	                                            </div>
	                                                <div class="help-block with-errors" id="expiry-datepicker-error"></div>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="col-sm-6">
	                                    <div class="form-group">
	                                        <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
	                                            <div class="help-block-wrap">
	                                                <input type="text" name="prev_policyNo" pattern="^[a-zA-Z\d\s]+$" data-error='<fmt:message key="motor.error.msg.general.alphanumeric" bundle="${motorMsg}" />' minlength="3" maxlength="30" class="form-control input--grey mdl-textfield__input" data-required-error='<fmt:message key="motor.error.msg.policy.regno.empty" bundle="${motorMsg}" />' id="prev_policyNo" required>
	                                                <label class="mdl-textfield__label" ><fmt:message key="motor.policydetails.policy.prev.policyno" bundle="${motorMsg}" /></label>
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
	                                <a class="bdr-curve btn btn-primary nxt-btn" onclick="perventRedirect=false;BackMe();"><fmt:message key="motor.button.back" bundle="${motorMsg}" /> </a>
	                                <br/>
	                            </div>
	                            <div class="text-center col-xs-6">
	                                <br />
	                                 <input type="submit" class="bdr-curve btn btn-primary nxt-btn" value='<fmt:message key="motor.button.next" bundle="${motorMsg}" />' />
	                                <br/>
	                            </div>
	                            <div class="clearfix"></div> 
	                            <div class="text-center save">
	                                <a href="#" id="saveForm" class=""><fmt:message key="motor.link.text.savecontinuelater" bundle="${motorMsg}" /></a>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </form>
	   	</div>
    </section>
    <!-- <section class="yourQuote">
    <div class="container">
        <div class="row" >
            <a class="orange-color col-xs-12 collapse-addon center" role="button" data-toggle="collapse" href="#yourQuote" aria-expanded="false" aria-controls="yourQuote">
                <h3><span class="small title"><fmt:message key="motor.label.yourquote" bundle="${motorMsg}" /></span><fmt:message key="motor.label.currency.front" bundle="${motorMsg}" /><fmt:message key="motor.label.currency.behind" bundle="${motorMsg}" /><span class="price"></span></h3>
            </a>
            <div class="col-xs-12 col-sm-10 col-sm-offset-1 collapse" id="yourQuote">
                <div class="row">
                    <div class="col-sm-6">
                        <span class="ci"> Comprehensive Insurance </span>
                    </div>
                    <div class="col-sm-6 text-right">
                        <small class="from"><fmt:message key="motor.label.from" bundle="${motorMsg}" /></small><fmt:message key="motor.label.currency.front" bundle="${motorMsg}" /><fmt:message key="motor.label.currency.behind" bundle="${motorMsg}" /><span class="price"></span>
                    </div>
                    <div class="col-xs-12">
                        <br/>
                    </div>
                    <div class="col-xs-12">
                    <strong><fmt:message key="motor.label.addon" bundle="${motorMsg}" />:</strong> 
                    </div>
                    <div class="col-xs-6 paa-box">
                        <span>Personal Accident</span>
                    </div>
                    <div class="col-xs-6 text-right paa-box">
                       <fmt:message key="motor.label.currency.front" bundle="${motorMsg}" /><fmt:message key="motor.label.currency.behind" bundle="${motorMsg}" /><span class="paa"></span>
                    </div>
                    <div class="col-xs-12 paa-box">
                        <br/>
                    </div>
                     <div class="col-xs-6 cia-box">
                        <span>Personal Accidents</span>
                    </div>
                    <div class="col-xs-6 text-right cia-box">
                        <fmt:message key="motor.label.currency.front" bundle="${motorMsg}" /><fmt:message key="motor.label.currency.behind" bundle="${motorMsg}" /><span class="cia"></span>
                    </div>
                    <div class="col-xs-12 cia-box">
                        <br/>
                    </div>
                    <div class="col-xs-6">
                        <span><fmt:message key="motor.label.subtotal" bundle="${motorMsg}" /></span>
                    </div>
                    <div class="col-xs-6 text-right">
                        <fmt:message key="motor.label.currency.front" bundle="${motorMsg}" /><fmt:message key="motor.label.currency.behind" bundle="${motorMsg}" /><span class="subprice"></span>
                    </div>
                    <div class="col-xs-6" style="display:none">
                        <span><fmt:message key="motor.label.discounts" bundle="${motorMsg}" /></span>
                    </div>
                    <div class="col-xs-6 text-right" style="display:none">
                        <span>300.00</span>
                    </div>
                    <div class="col-xs-12">
                        <hr/>
                    </div>
                    <div class="col-xs-6">
                        <strong><fmt:message key="motor.label.amountdue" bundle="${motorMsg}" />:</strong>
                    </div>
                    <div class="col-xs-6 text-right">
                        <strong><fmt:message key="motor.label.currency.front" bundle="${motorMsg}" /><fmt:message key="motor.label.currency.behind" bundle="${motorMsg}" /><span class="amountDue"></span></strong>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
    </div>
    
</section>-->
<section class="yourQuote">
        <div class="container">
            <div class="row" >
                <a class="orange-color col-xs-12 collapse-addon center" role="button" data-toggle="collapse" href="#yourQuote" aria-expanded="false" aria-controls="yourQuote">
                    <h3>
                        <span class="small title"><fmt:message key="motor.label.yourquote" bundle="${motorMsg}" /></span>
                        <fmt:message key="motor.label.currency.front" bundle="${motorMsg}" />
                        <span id="yourQuotePrice"></span>
                        <fmt:message key="motor.label.currency.behind" bundle="${motorMsg}" />
                    </h3>
                </a>
                <div class="col-xs-12 col-sm-10 col-sm-offset-1 collapse" id="yourQuote">
                    <div class="row">
                        <div class="col-xs-6">
                            <span class="ci" id="yourQuoteTitle"></span>
                        </div>
                        
                        <div class="col-sm-6 text-right">
                       	 <strong><small class="from"><fmt:message key="motor.label.from" bundle="${motorMsg}" /></small><fmt:message key="motor.label.currency.front" bundle="${motorMsg}" /><span class="yourQuoteAmmount"></span><fmt:message key="motor.label.currency.behind" bundle="${motorMsg}" /> </strong>
                   		</div>
                        <div class="col-xs-12">
                            <br/>
                        </div>
                        <div class="col-xs-12 summary__addOn hidden">
                            <strong><fmt:message key="motor.label.addontable" bundle="${motorMsg}" /></strong> 
                        </div>
                        <div class="col-xs-6 summary__addOn1 hidden">
                           
                                <span id="addOn1Title"><fmt:message key="motor.quickquote.addon.1.title" bundle="${motorMsg}" /></span>
                           </div>
                            <div class="col-xs-6 text-right">
                            <strong>
                                <fmt:message key="motor.label.currency.front" bundle="${motorMsg}" />
                                <span id="paa"></span>
                                <fmt:message key="motor.label.currency.behind" bundle="${motorMsg}" />
                            </strong>
                        </div>
                          <div class="clearfix"></div>
                        <div class="col-xs-6 summary__addOn2 hidden">                          
                                <span id="addOn2Title"><fmt:message key="motor.quickquote.addon.2.title" bundle="${motorMsg}" /></span>
                            </div>
                            <div class="col-xs-6 text-right">
                            <strong>
                                <fmt:message key="motor.label.currency.front" bundle="${motorMsg}" />
                                <span id="cia"></span>
                                <fmt:message key="motor.label.currency.behind" bundle="${motorMsg}" />
                            </strong>
                        </div>
                        <div class="col-xs-12">
                            <br/>
                        </div>
                        <div class="col-xs-6 summary__subtotal hidden">
                           
                                <span id="subtitleTitle"><fmt:message key="motor.quickquote.summary.subtotal.title" bundle="${motorMsg}" /></span>
                           </div>
                            <div class="col-xs-6 text-right hidden">
                            <strong>
                                <fmt:message key="motor.label.currency.front" bundle="${motorMsg}" />
                                <span id="subtotalAmount"></span>
                                <fmt:message key="motor.label.currency.behind" bundle="${motorMsg}" />
                            </strong>
                        </div>
                          <div class="clearfix"></div>
                        <div class="col-xs-6 summary__Discounts hidden">                          
                                <span id="discountsTitle"><fmt:message key="motor.quickquote.summary.discounts.title" bundle="${motorMsg}" /></span>
                            </div>
                            <div class="col-xs-6 text-right hidden">
                            <strong>
                                <fmt:message key="motor.label.currency.front" bundle="${motorMsg}" />
                                <span id="discountsAmount"></span>
                                <fmt:message key="motor.label.currency.behind" bundle="${motorMsg}" />
                            </strong>
                        </div>
                        <div class="col-xs-12">
                            <hr/>
                        </div>
                        <div class="col-xs-6">
                            <strong><fmt:message key="motor.label.amountdue" bundle="${motorMsg}" />:</strong>
                        </div>
                        <div class="col-xs-6 text-right">
                            <strong>
                                <fmt:message key="motor.label.currency.front" bundle="${motorMsg}" />
                                <span id="yourQuoteAmmount"></span>
                                <fmt:message key="motor.label.currency.behind" bundle="${motorMsg}" />
                            </strong>
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
            <div class="login-close-wrapper" style="padding-right: 15px;padding-top: 10px;"><a class="close" aria-label="Close" data-dismiss="modal"><span aria-hidden="true">×</span></a></div>
            <div class="login-title-wrapper">
                <div class="row">
                	 <div class="col-xs-12 col-sm-10 col-sm-offset-1 plan-panel">
                        <h3 class="heading-h3 color-orange text-center">
                          
                        </h3>
                    </div>
                    <div class="col-xs-12 col-sm-8 col-sm-offset-2 text-center">
                        <p>
                            <fmt:message key="motor.lightbox.savecontinuelater.title" bundle="${motorMsg}" />  </p>
                    </div>
                    <div class="col-xs-12 col-sm-8 col-sm-offset-2 plan-panel">
                        <div class="row" >
                            <div class="text-center col-xs-6">
                                <br />
                                <a class="bdr-curve btn btn-primary nxt-btn saveExit" onclick="SaveAndExit()"><fmt:message key="motor.button.savecontinue.exit" bundle="${motorMsg}" /> </a>
                                <br/>
                            </div>
                            <div class="text-center col-xs-6">
                                <br />
                                <a class="bdr-curve btn btn-primary nxt-btn continue"><fmt:message key="motor.button.savecontinue.continue" bundle="${motorMsg}" /> </a>
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
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/bootstrapValidator.min.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/motor/bootstrap-switch.min.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/motor/selectize.min.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/motor/motor-forms.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/motor/motor-api.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/motor/register-form.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/motor/custom-datepicker.js"></script>
<script type="text/javascript">
var quote = jQuery.parseJSON('<%=request.getParameter("data")!=null?request.getParameter("data").replace("&quot;", "\""):"{}"%>');
if(typeof quote.policyId == "undefined")
	window.location="<%=request.getContextPath()%>/en/motor-insurance/";

	
/* 
 *  Define motor success login callback
 */
 var motorlanguage=UILANGUAGE;

 if(motorlanguage == "TC")
 	motorlanguage = "ZH";
 
var tempquote="";
var loginStatus=false;
function callback_motor_LoginSuccess(){
	//alert('Login success. Call Save later API.');
	$('#saveModal').modal("show");
	var empty = {}; 
	  $.ajax({
			url:fwdApi.url.resume,
			type:"post",
			contentType: "application/json",
			data: JSON.stringify(empty),
			cache:false,
			async:false,
		    error:function (xhr, textStatus, errorThrown){
		        //alert("error");
		    },
		    success:function(response){
		    	tempquote = response.motorCareDetails;
		    	$('#saveModal').modal("show");
		    }
		});
}
function SaveAndExit()
{
	$(document).ready(function(){
		var driverMoreThanTwo = false;
		   if($('input[name=d3name]').val()!="")
		   {
			   driverMoreThanTwo = true;
		   }
		   var submitData = { 		
				   "policyId": quote.policyId,
				   "policyStartDate": quote.policyStartDate,
				   "policyEndDate":  quote.policyEndDate,	
				   "driver": [		
				   {		
				     "dateOfBirth": $('input[name=driverDob]').val(),		
				     "driveMoreThanTwo": $('input[name=term]').val(),		
				     "hkid": $('input[name=driverID]').val(),		
				     "name": $('input[name=fullName]').val(),		
				     "occupation": $('[name="occupation"]').val(),//$("#occupation option:selected").text(),	
				     "validAgeGroup": $('input[name=term]').val()		
				   }, 		
				   {		
				     "dateOfBirth": $('input[name=d2dob]').val(),		
				     "driveMoreThanTwo": $('input[name=d2term]').val(),		
				     "hkid": $('input[name=d2id]').val(),		
				     "name": $('input[name=d2name]').val(),		
				     "occupation": $('[name="d2occupation"]').val(),//$("#d2occupation option:selected").text(),		
				     "validAgeGroup":  $('input[name=d2term]').val()			
				   }, 		
				   {		
					 "dateOfBirth": $('input[name=d3dob]').val(),		
					 "driveMoreThanTwo": $('input[name=d3term]').val()	,		
					 "hkid": $('input[name=d3id]').val(),		
					 "name": $('input[name=d3name]').val(),		
					 "occupation": $('[name="d3occupation"]').val(),//$("#d3occupation option:selected").text(),		
					 "validAgeGroup": $('input[name=d3term]').val()		
				   }, 		
				   {		
					 "dateOfBirth": $('input[name=d4dob]').val(),		
					 "driveMoreThanTwo": $('input[name=d4term]').val(),		
					 "hkid": $('input[name=d4id]').val(),		
					 "name": $('input[name=d4name]').val(),		
					 "occupation": $('[name="d4occupation"]').val(),//$("#d4occupation option:selected").text(),		
					 "validAgeGroup":  $('input[name=d4term]').val()			
				   }, 		
				   {		
					 "dateOfBirth": $('input[name=d5dob]').val(),		
					 "driveMoreThanTwo": $('input[name=d5term]').val()	,		
					 "hkid": $('input[name=d5id]').val(),		
					 "name": $('input[name=d5name]').val(),		
					 "occupation": $('[name="d5occupation"]').val(),//$("#d5occupation option:selected").text(),		
					 "validAgeGroup": $('input[name=d5term]').val()		
				   }		
				   ], 		
				     "nameOfPreviousInusrancer": $('[name=prev_ic]').val(),		
				     "regNoofPreviousPolicy": $('input[name=prev_regNo]').val(),		
				     "expDateOfPreviousInsurance": $('input[name=expiry-datepicker]').val(),		
				     "previousPolicyNo": $('[name="prev_policyNo"]').val()//$("#prev_ic option:selected").val()//$('input[name=prev_policyNo]').val()	
				 };
			
			if($('input[name=d2name]').val()=="")
				delete submitData.driver[1]
			if($('input[name=d3name]').val()=="")
				delete submitData.driver[2]
			if($('input[name=d4name]').val()=="")
				delete submitData.driver[3]
			if($('input[name=d5name]').val()=="")
				delete submitData.driver[4]
		
			console.dir(submitData);
		
			submitData.driver = submitData.driver.filter(function(x){return x !== null});
			$.ajax({
				  beforeSend: function(){
		          	$('#loading-overlay').modal("show");
		          },
				  type: "POST",
				  data: JSON.stringify(submitData),
				  dataType: "json",
		          contentType : "application/json",
		          cache: false,
		          async: false,
				  url: context + "/api/iMotor/policy/save4Later/policyDetails",
				  success: function(data){
					  console.dir(data);
					  $('#saveModal').modal("hide");
					  location.assign(context);
				  },error: function(error) {
					  console.dir(error);				
						 alert("error");
			             $("#loading-overlay").modal("hide");
			             return false;
				  }
				});
	});
}
function BackMe() {
	 var $form = $("<form id='quote-form' />");
    	 $form.attr("action", "drivers-details?back=yes");
     $form.attr("method", "post");
     var $quote = $("<input type='hidden' name='data' />");
     $quote.attr("value", JSON.stringify(quote));
     $form.append($quote);
     $("body").append($form);
     $('#quote-form').submit();
}
$(window).load(function(){
    $('body').backDetect(function(){
    	 BackMe();
    	 return false;
    });
});
$(document).ready(function(){
	 
	/*custom validate for HKID*/
	   $('#policyDetails').validator({
		   custom: {
		   equals: function($el) {
			    if(!IsHKID($el.val())){
			    	return $el.data("equals");
			    }
			  }
		   },
		   disable: false
	   });
	   /*custom validate for HKID*/
	$("#d2dob").change(function(){
		$("#d2dob-hidden").prop('required',false);
	});
	$("#d3dob").change(function(){
		$("#d3dob-hidden").prop('required',false);
	});
	$("#d4dob").change(function(){
		$("#d4dob-hidden").prop('required',false);
	});
	$("#d5dob").change(function(){
		$("#d5dob-hidden").prop('required',false);
	});
	
	var term = $('#term');
	var d2term = $('#d2term');
	var d3term = $('#d3term');
	var d4term = $('#d4term');
	var d5term = $('#d5term');
	var totalDriver = $('.added-driver').length;
	var current = 0;

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
	
    $("input[name=fullName]").val(quote.applicant.name);
	$("input[name=driverDob]").val(quote.applicant.dateOfBirth);
    $("input[name=driverID]").val(quote.applicant.hkid);
    
	if(getUrlParameter("edit")=="yes" || getUrlParameter("back")=="yes")
	{
		
		$("#fullName").attr("value",quote.applicant.name);
		$('input[name=driverDob]').val(quote.applicant.dateOfBirth);	
	    $('input[name=driverID]').val(quote.applicant.hkid);		
	    $('input[name=fullName]').val(quote.applicant.name);
	    $('input[name=term]').attr("checked",quote.driver[0].validAgeGroup);
	  	
	    if(quote.driver.length > 1){
	    	current =1;
	    	$('#driver2').removeClass('hidden');
		    $('input[name=d2dob]').val(quote.driver[1].dateOfBirth);
		    $('#d2dob-hidden').val(quote.driver[1].dateOfBirth);
		    $('input[name=d2id]').val(quote.driver[1].hkid);
		    $('input[name=d2name]').val(quote.driver[1].name);	
		    $('input[name=d2term]').attr("checked",quote.driver[1].validAgeGroup);
		    $('#driver2').find('select').prop('required',true);
		    $('#driver2').find('input').prop('required',true);
		    $('#driver2').find('.selectize-input > input').prop('required',false);
	    }
	  	
	    if(quote.driver.length > 2){
	    	current =2;
	    	$('#driver3').removeClass('hidden');
			$('input[name=d3dob]').val(quote.driver[2].dateOfBirth);
			$('#d3dob-hidden').val(quote.driver[2].dateOfBirth);
			$('input[name=d3id]').val(quote.driver[2].hkid);	
			$('input[name=d3name]').val(quote.driver[2].name);	
			$('input[name=d3term]').attr("checked",quote.driver[2].validAgeGroup);	
			$('#driver3').find('select').prop('required',true);
		    $('#driver3').find('input').prop('required',true);
		    $('#driver3').find('.selectize-input > input').prop('required',false);
	    }
	    
	    if(quote.driver.length > 3){
	    	current =3;
	    	$('#driver4').removeClass('hidden');
			$('input[name=d4dob]').val(quote.driver[3].dateOfBirth);
			$('#d4dob-hidden').val(quote.driver[3].dateOfBirth);
			$('input[name=d4id]').val(quote.driver[3].hkid);	
			$('input[name=d4name]').val(quote.driver[3].name);
			$('input[name=d4term]').attr("checked",quote.driver[3].validAgeGroup);
			$('#driver4').find('select').prop('required',true);
		    $('#driver4').find('input').prop('required',true);
		    $('#driver4').find('.selectize-input > input').prop('required',false);
	    }
	    
	    if(quote.driver.length > 4){
	    	current =4;
	    	$('#driver5').removeClass('hidden');
			$('input[name=d5dob]').val(quote.driver[4].dateOfBirth);
			$('#d5dob-hidden').val(quote.driver[4].dateOfBirth);
			$('input[name=d5id]').val(quote.driver[4].hkid);		
			$('input[name=d5name]').val(quote.driver[4].name);
			$('input[name=d5term]').attr("checked",quote.driver[4].validAgeGroup);
			$('#driver5').find('select').prop('required',true);
		    $('#driver5').find('input').prop('required',true);
		    $('#driver5').find('.selectize-input > input').prop('required',false);
	    }
		//$('input[name=prev_ic]').val(quote.nameOfPreviousInusrancer);
		$('input[name=prev_regNo]').val(quote.regNoofPreviousPolicy);		
	    $('input[name=expiry-datepicker]').val(quote.expDateOfPreviousInsurance);		
	    $('input[name=prev_policyNo]').val(quote.previousPolicyNo);
	    
	    for(var i=0;i<quote.driver.length;i++)
	    {
	    	if(i > 0){
	    		$('#driver'+i).find('.removeDriver').addClass('hidden');
            }
	    }
	}
	
	$prev_ic = $('#prev_ic').selectize({
        valueField: 'code',
        labelField: 'desc',
        searchField: 'desc',
        create: false,
        preload: true,
        load: function(query, callback) {
            $('#prev_ic-selectized').data('required-error', $('#prev_ic').data('required-error'));
            $("#prev_ic-selectized").prop('required',true);
            $('#policyDetails').validator('update'); 
            $.ajax({
                url: context + '/api/iMotor/list/insurers',
                type: 'GET',
                dataType: 'json',
                error: function() {
                        callback();
                    },
                    success: function(res) {
                            callback(res);      
                            //$.each(res, function(i, item) {
    							//if(getUrlParameter("edit")=="yes")
    							{	
    								//if(item.desc == quote.nameOfPreviousInusrancer)
    								{	
    									$prev_ic[0].selectize.setValue(quote.nameOfPreviousInusrancer);	
    								}
    							}
    						//});	
                    }
            });
        },
        onChange: function(value){
        	$(".label-prev_ic").removeClass("hidden");
			$(".label-prev_ic").css({
				"font-size": "12px",
				"top": "2px",
				"left":"0px",
				"visibility": "visible",
				"z-index": "100"
				});
        	$("#prev_ic-selectized").prop('required',false);
        }
    });
	
	$motor_occupation = $('#occupation').selectize({
        valueField: 'code',
        labelField: 'desc',
        searchField: 'desc',
        create: false,
        preload: true,
        load: function(query, callback) {
            $('#occupation-selectized').data('required-error', $('#occupation').data('required-error'));
           
            $.ajax({
                url: context + '/api/iMotor/list/occupations/v2',
                type: 'GET',
                dataType: 'json',
                error: function() {
                        callback();
                    },
                    success: function(res) {
						console.dir(res);
						var newres= new Array();
                    	var total = res.length;
                    	$.each(res, function(i, item) {
                    		if(item.lang==motorlanguage) 
                    		newres.push(res[i]);
                    	});
						console.dir(newres);
                              callback(newres); 
						//$.each(res, function(i, item) {
							//if(getUrlParameter("edit")=="yes")
							{
								//if(item.code == quote.driver[0].occupation)
								if(quote.driver.length > 0)	
								{
									$motor_occupation[0].selectize.setValue(quote.driver[0].occupation);	
								}
							}
						//});						
                    }
            });
        },
        onChange: function(value){
        	$(".label-occupation").removeClass("hidden");
			$(".label-occupation").css({
				"font-size": "12px",
				"top": "2px",
				"left":"16px",
				"visibility": "visible",
				"z-index": "100"
				});
        	$("#occupation-selectized").prop('required',false);
        }
    });
	$motor_d2occupation = $('#d2occupation').selectize({
        valueField: 'code',
        labelField: 'desc',
        searchField: 'desc',
        create: false,
        preload: true,
        load: function(query, callback) {
            $('#d2occupation-selectized').data('required-error', $('#d2occupation').data('required-error'));
            $.ajax({
                url: context + '/api/iMotor/list/occupations/v2',
                type: 'GET',
                dataType: 'json',
                error: function() {
                        callback();
                    },
                    success: function(res) {
                    	console.dir(res);
						var newres= new Array();
                    	var total = res.length;
                    	$.each(res, function(i, item) {
                    		if(item.lang==motorlanguage) 
                    		newres.push(res[i]);
                    	});
						console.dir(newres);
                              callback(newres);      
                             // $.each(res, function(i, item) {
      							//if(getUrlParameter("edit")=="yes")
      							{
      							//	if(item.desc == quote.driver[1].occupation)
      								if(quote.driver.length > 1)
      								{
      									$motor_d2occupation[0].selectize.setValue(quote.driver[1].occupation);	
      								}
      							}
      						//});	
                    }
            });
        },
        onChange: function(value){
        	$(".label-d2occupation").removeClass("hidden");
			$(".label-d2occupation").css({
				"font-size": "12px",
				"top": "2px",
				"left":"16px",
				"visibility": "visible",
				"z-index": "100"
				});
        	$("#d2occupation-selectized").prop('required',false);
        }
    });
	$motor_d3occupation = $('#d3occupation').selectize({
        valueField: 'code',
        labelField: 'desc',
        searchField: 'desc',
        create: false,
        preload: true,
        load: function(query, callback) {
            $('#d3occupation-selectized').data('required-error', $('#d3occupation').data('required-error'));
            $.ajax({
                url: context + '/api/iMotor/list/occupations/v2',
                type: 'GET',
                dataType: 'json',
                error: function() {
                        callback();
                    },
                    success: function(res) {
                    	console.dir(res);
						var newres= new Array();
                    	var total = res.length;
                    	$.each(res, function(i, item) {
                    		if(item.lang==motorlanguage) 
                    		newres.push(res[i]);
                    	});
						console.dir(newres);
                              callback(newres);
                              //$.each(res, function(i, item) {
      							//if(getUrlParameter("edit")=="yes")
      							{
      								//if(item.desc == quote.driver[2].occupation)
      								if(quote.driver.length > 2)
      								{
      									$motor_d3occupation[0].selectize.setValue(quote.driver[2].occupation);	
      								}
      							}
      						//});	
                    }
            });
        },
        onChange: function(value){
        	$(".label-d3occupation").removeClass("hidden");
			$(".label-d3occupation").css({
				"font-size": "12px",
				"top": "2px",
				"left":"16px",
				"visibility": "visible",
				"z-index": "100"
				});
        	$("#d3occupation-selectized").prop('required',false);
        }
    });
	$motor_d4occupation = $('#d4occupation').selectize({
        valueField: 'code',
        labelField: 'desc',
        searchField: 'desc',
        create: false,
        preload: true,
        load: function(query, callback) {
            $('#d4occupation-selectized').data('required-error', $('#d4occupation').data('required-error'));
            $.ajax({
                url: context + '/api/iMotor/list/occupations/v2',
                type: 'GET',
                dataType: 'json',
                error: function() {
                        callback();
                    },
                    success: function(res) {
                    	console.dir(res);
						var newres= new Array();
                    	var total = res.length;
                    	$.each(res, function(i, item) {
                    		if(item.lang==motorlanguage) 
                    		newres.push(res[i]);
                    	});
						console.dir(newres);
                              callback(newres);  
                              //$.each(res, function(i, item) {
      							//if(getUrlParameter("edit")=="yes")
      							{
      								//if(item.desc == quote.driver[3].occupation)
      								if(quote.driver.length > 3)
      								{
      									$motor_d4occupation[0].selectize.setValue(quote.driver[3].occupation);	
      								}
      							}
      						//});	
                    }
            });
        },
        onChange: function(value){
        	$(".label-d4occupation").removeClass("hidden");
			$(".label-d4occupation").css({
				"font-size": "12px",
				"top": "2px",
				"left":"16px",
				"visibility": "visible",
				"z-index": "100"
				});
        	$("#d4occupation-selectized").prop('required',false);
        }
    });
	$motor_d5occupation = $('#d5occupation').selectize({
        valueField: 'code',
        labelField: 'desc',
        searchField: 'desc',
        create: false,
        preload: true,
        load: function(query, callback) {
            $('#d5occupation-selectized').data('required-error', $('#d5occupation').data('required-error'));
            $.ajax({
                url: context + '/api/iMotor/list/occupations/v2',
                type: 'GET',
                dataType: 'json',
                error: function() {
                        callback();
                    },
                    success: function(res) {
                    	console.dir(res);
						var newres= new Array();
                    	var total = res.length;
                    	$.each(res, function(i, item) {
                    		if(item.lang==motorlanguage) 
                    		newres.push(res[i]);
                    	});
						console.dir(newres);
                              callback(newres);  
                              //if(item.desc == quote.driver[4].occupation)
      						  if(quote.driver.length > 4)
      					      {
      							$motor_d5occupation[0].selectize.setValue(quote.driver[4].occupation);	
      					      }
      								
                    }
            });
        },
        onChange: function(value){
        	$(".label-d5occupation").removeClass("hidden");
			$(".label-d5occupation").css({
				"font-size": "12px",
				"top": "2px",
				"left":"16px",
				"visibility": "visible",
				"z-index": "100"
				});
        	$("#d5occupation-selectized").prop('required',false);
        }
    });
	 if (current == totalDriver) {
		 $('#addDriver').addClass('hidden');
     }
	
	    $('#addDriver').on('click', function(e){
	        e.preventDefault();

			//$('#motor_registerForm [type="submit"]').addClass('disabled');
	        if(current < totalDriver){
	            $('.added-driver').eq(current).removeClass('hidden');
				$('.added-driver').eq(current).find('select').prop('required',true);
				$('.added-driver').eq(current).find('input').prop('required',true);
				$('.added-driver').eq(current).find('.selectize-input > input').prop('required',false);
				$('.added-driver').eq(current).find('input').val(''); 
			
				
	            if(current > 0){
	                $('.added-driver').eq(current-1).find('.removeDriver').addClass('hidden');
	            }
	            current += 1;
	            
	            if(current == 1)
				    $("#d2occupation-selectized,#d2dob-hidden").prop('required',true);
				if(current == 2)
					$("#d3occupation-selectized,#d3dob-hidden").prop('required',true);
				if(current == 3)
					$("#d4occupation-selectized,#d4dob-hidden").prop('required',true);
				if(current == 4)
					$("#d5occupation-selectized,#d5dob-hidden").prop('required',true);
				
	            if (current == totalDriver) {
	                $(this).addClass('hidden');
	            }
				$('#policyDetails').validator('update'); 
			//	$('#policyDetails').validator('validate');
	        }

	        // console.log(current);
	    });
	    $('.removeDriver').on('click', function(e){
	        e.preventDefault();
	        $(this).parents('.added-driver').find('input').prop('required',false);
			$(this).parents('.added-driver').find('select').prop('required',false);
	        $(this).parents('.added-driver').find('input').val('');
	        $(this).parents('.added-driver').find('input:checkbox').removeAttr('checked');
	        $(this).parents('.added-driver').find('option').removeAttr('selected');
			//$occSelect[0].selectize.clear();
			if(current == 1)
			{
				$motor_d2occupation[0].selectize.clear();
				$("#d2occupation-selectized,#d2dob-hidden").prop('required',false);
			}
			if(current == 2)
			{
				$motor_d3occupation[0].selectize.clear();
				$("#d3occupation-selectized,#d3dob-hidden").prop('required',false);
			}
			if(current == 3)
			{
				$motor_d4occupation[0].selectize.clear();
				$("#d4occupation-selectized,#d4dob-hidden").prop('required',false);
			}
			if(current == 4)
			{
				$motor_d5occupation[0].selectize.clear();
				$("#d5occupation-selectized,#d5dob-hidden").prop('required',false);
			}
			
	        $(this).parents('.added-driver').addClass('hidden');
	        $(this).parents('.added-driver').prev().find('.removeDriver').removeClass('hidden');
			$('#policyDetails').validator('update'); 
			//$('#policyDetails').validator('validate');
	        if(current == totalDriver){
	            $('#addDriver').removeClass('hidden');
	        }
	        current -= 1;
	    });
	    
	  //Check UserLogin
		$.ajax({
			url:fwdApi.url.session,
			type:"get",
			contentType: "application/json",
			cache:false,
			async:false,
		    error:function (xhr, textStatus, errorThrown){
		    	
		        if(xhr.status == 404){		        
		        	$(".before-login").show();
		        } else {
		        	$(".before-login").show();
		        }
		    },
		    success:function(response){
		    	if(response){
		    		if(response.userName == '*DIRECTGI'){
		    			loginStatus=false;
		    			//$('#loginpopup').modal("show");
		    			//$(".before-login").show();
		    			//$("#saveModal").removeClass("hidden");
		    			return false;	
		    		}else
		    		{   loginStatus=true;
		    			var empty = {}; 
		    		  $.ajax({
		    				url:fwdApi.url.resume,
		    				type:"post",
		    				contentType: "application/json",
		    				data: JSON.stringify(empty),
		    				cache:false,
		    				async:false,
		    			    error:function (xhr, textStatus, errorThrown){
		    			        //alert("error");
		    			    },
		    			    success:function(response){
		      			    	console.dir(response);
		    			    	tempquote = response.motorCareDetails;
		    			    	//$('#saveModal').modal("show");
		    			    }
		    			});
		    		}
		    	}
		    }
		});

		$(".continue").on("click",function(){	
			  $('#saveModal').modal("hide");
		  });
	  
		  $("#saveForm").on("click",function(){
			    if(loginStatus==false)
				$('#loginpopup').modal("show");
			    else  if(loginStatus==true)
			    $('#saveModal').modal("show");
		  });
		  var planType = (quote.planCode=='Third')?'third':quote.compPlan.toLowerCase();
		     $.when(getMotorQuotePrice(planType, quote)).then(function(){
				
				            totalDue = parseFloat(motorPrice[planType].amountDueAmount);
				            addOnPaQuote = parseFloat(motorPrice[planType].addOnPaAmt);
				            addOnTppdQuote = parseFloat(motorPrice[planType].addOnTppdAmt);
				            if($('body').hasClass('chin')){
								if(quote.planCode=="Comp"){
								 if(quote.compPlan=="Gold")
								 $('#yourQuoteTitle').html('綜合保險(金)');
								else
								 $('#yourQuoteTitle').html('綜合保險(銀)');
								}
								else
								$('#yourQuoteTitle').html('第三者保險');
								}
								else{
								if(quote.planCode=="Comp"){
								 if(quote.compPlan=="Gold")
								 $('#yourQuoteTitle').html('Comprehensive Gold');
								else
								 $('#yourQuoteTitle').html('Comprehensive Silver');
								}
								else
								$('#yourQuoteTitle').html('Third Party');
								}
				            $('#addOnPaAmt').html(formatCurrency(addOnPaQuote));
				            $('#addOnTppdAmt').html(formatCurrency(addOnTppdQuote));
				         
				            if(quote.personalAccident == true)
				            {
				            	$('.summary__addOn1').removeClass('hidden');
				            	$('.summary__addOn').removeClass('hidden');
				             	$('#paa').html(formatCurrency(addOnPaQuote));
				            }
				            	
				            if(quote.thirdPartyPropertyDamage == true)
				            {	
				            	$('.summary__addOn2').removeClass('hidden');
				            	$('.summary__addOn').removeClass('hidden');
				            	$('#cia').html(formatCurrency(addOnTppdQuote));
				            }
				         	updateTotalDue(totalDue);
				         	$(".yourQuoteAmmount").html ($("#yourQuoteAmmount").html());
		     });
		  /*
	    $.ajax({
			  type: "POST",
			  data: JSON.stringify(quote),
			  dataType: "json",
		      contentType : "application/json",
		      cache: false,
		      async: false,
		      url:context + "/api/iMotor/quote",
			  success: function(data){
				  $('.amountDue').html(formatCurrency(data.amountDueAmount));
				  $('.price').html(formatCurrency(data.amountDueAmount));
				  $('.subprice').html(formatCurrency(data.subTotalAmount));
				
				  if(data.personalAccident ==true)
				  	$('.paa').html(formatCurrency(data.personalAccidentAmount));
				  else
					$('.paa-box').hide();	 
				  if(data.thirdPartyPropertyDamage ==true)
				  	$('.cia').html(formatCurrency(data.compInsuranceAmount));
				  else
					  $('.cia-box').hide();	
			  },error: function(error) {
				
			  }
			});*/
	$('#policyDetails').validator().on('submit', function (e) {
		if (!e.isDefaultPrevented()) {
	       var driverMoreThanTwo = false;
		   if($('input[name=d3name]').val()!="")
		   {
			   driverMoreThanTwo = true;
		   }
		   var submitData = { 		
				   "policyId": quote.policyId,		
				   "policyStartDate": quote.policyStartDate,
				   "policyEndDate":  quote.policyEndDate,	
				   "driver": [		
				   {		
				     "dateOfBirth": $('input[name=driverDob]').val(),		
				     "driveMoreThanTwo": $('input[name=term]').val(),		
				     "hkid": $('input[name=driverID]').val(),		
				     "name": $('input[name=fullName]').val(),		
				     "occupation": $('[name="occupation"]').val(),//$("#occupation option:selected").text(),	
				     "validAgeGroup": $('input[name=term]').val()		
				   }, 		
				   {		
				     "dateOfBirth": $('input[name=d2dob]').val(),		
				     "driveMoreThanTwo": $('input[name=d2term]').val(),		
				     "hkid": $('input[name=d2id]').val(),		
				     "name": $('input[name=d2name]').val(),		
				     "occupation": $('[name="d2occupation"]').val(),//$("#d2occupation option:selected").text(),		
				     "validAgeGroup":  $('input[name=d2term]').val()			
				   }, 		
				   {		
					 "dateOfBirth": $('input[name=d3dob]').val(),		
					 "driveMoreThanTwo": $('input[name=d3term]').val(),		
					 "hkid": $('input[name=d3id]').val(),		
					 "name": $('input[name=d3name]').val(),		
					 "occupation": $('[name="d3occupation"]').val(),//$("#d3occupation option:selected").text(),		
					 "validAgeGroup": $('input[name=d3term]').val()		
				   }, 		
				   {		
					 "dateOfBirth": $('input[name=d4dob]').val(),		
					 "driveMoreThanTwo": $('input[name=d4term]').val(),		
					 "hkid": $('input[name=d4id]').val(),		
					 "name": $('input[name=d4name]').val(),		
					 "occupation": $('[name="d4occupation"]').val(),//$("#d4occupation option:selected").text(),		
					 "validAgeGroup":  $('input[name=d4term]').val()			
				   }, 		
				   {		
					 "dateOfBirth": $('input[name=d5dob]').val(),		
					 "driveMoreThanTwo": $('input[name=d5term]').val()	,		
					 "hkid": $('input[name=d5id]').val(),		
					 "name": $('input[name=d5name]').val(),		
					 "occupation": $('[name="d5occupation"]').val(),//$("#d5occupation option:selected").text(),		
					 "validAgeGroup": $('input[name=d5term]').val()		
				   }		
				   ], 		
				     "nameOfPreviousInusrancer": $('[name=prev_ic]').val(),		
				     "regNoofPreviousPolicy": $('input[name=prev_regNo]').val(),		
				     "expDateOfPreviousInsurance": $('input[name=expiry-datepicker]').val(),		
				     "previousPolicyNo": $('[name="prev_policyNo"]').val()//$("#prev_ic option:selected").val()//$('input[name=prev_policyNo]').val()	
				 };
			
			if($('input[name=d2name]').val()=="")
				delete submitData.driver[1]
			if($('input[name=d3name]').val()=="")
				delete submitData.driver[2]
			if($('input[name=d4name]').val()=="")
				delete submitData.driver[3]
			if($('input[name=d5name]').val()=="")
				delete submitData.driver[4]
		
			console.dir(submitData);
		
			submitData.driver = submitData.driver.filter(function(x){return x !== null});
			$.ajax({
				  beforeSend: function(){
		          	$('#loading-overlay').modal("show");
		          },
				  type: "POST",
				  data: JSON.stringify(submitData),
				  dataType: "json",
		          contentType : "application/json",
		          cache: false,
		          async: false,
				  url: context + "/api/iMotor/policy/saving/policyDetails",
				  success: function(data){
					  var $form = $("<form id='quote-form' />");
					  if(getUrlParameter("edit")=="yes")
					  	  $form.attr("action", "declarations?edit=yes");
					  else
						  $form.attr("action", "declarations");
		              $form.attr("method", "post");
		              var $quote = $("<input type='hidden' name='data' />");
			          var opts = {};
			          opts = $.extend(opts,quote, submitData);
		              opts=  $.extend(opts,{"driver": $.extend(quote.driver, submitData.driver)});
		              $quote.attr("value", JSON.stringify(opts));
		              $form.append($quote);
		              $("body").append($form);
		              $('#quote-form').submit();
				  },error: function(error) {
					  console.dir(error);				
						 alert("error");
			             $("#loading-overlay").modal("hide");
			             return false;
				  }
				});
		}
		return false;
	});
	 function updateTotalDue(amt){
	        $('#yourQuotePrice').html(formatCurrency(amt));
	        $('#yourQuoteAmmount').html(formatCurrency(amt));
	    }
});
</script>
