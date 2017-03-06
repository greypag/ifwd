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
</style>
<div class="motor-form-wrap motor__wrap--sticky-dropdown">
    <section id="" class="motor-signup-form">
        <!-- Breadcrumb Component Start-->
        <div class="container container-fluid container--breadcrumb">
            <c:set var="breadcrumbItems">
                breadcrumb.item.home,breadcrumb.item.protect,breadcrumb.item.motor,breadcrumb.item.driver.details
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
                                    <div class="image-order-status image-order-status-intransit active img-circle act  second">
                                        <span class="status"><fmt:message key="motor.driversdetails.page.heading" bundle="${motorMsg}" /></span>
                                        <div class="icon">2</div>
                                    </div>
                                    <div class="image-order-status image-order-status-delivered  img-circle third">
                                        <div class="icon">3</div>
                                    </div>
                                    <div class="image-order-status image-order-status-completed  img-circle fourth">
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
                <h1 class="landing_h2 hidden-sm hidden-xs"><fmt:message key="motor.driversdetails.driver.title" bundle="${motorMsg}" /></h1>
                <!--end-desktop--> 
                <!--Mobile-->
                <h1 class="landing_h2 hidden-lg hidden-md feature-ttl"><fmt:message key="motor.driversdetails.driver.title" bundle="${motorMsg}" /></h1>
           		<h1 class="landing_h3 hidden-lg hidden-md feature-ttl"><fmt:message key="motor.driversdetails.driver.title" bundle="${motorMsg}" /></h1>
                <!--end mobile--> 
            </div>
        </div>
            <div id="motor_registerForm">
	            <form id="driverDetails"  method="post" >
	                <div class="container">
	                    <div class="row">
	                        <div class="col-md-8 col-md-offset-2 col-sm-12">
	                            <div class="row">
	                                <div class="col-sm-6">
	                                    <div class="form-group">
	                                        <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
	                                            <div class="help-block-wrap">
	                                                <input type="text" name="fullName" maxlength="100" class="form-control input--grey mdl-textfield__input" id="fullName" pattern="^[a-zA-Z\s]+$"  required data-required-error='<fmt:message key="motor.error.msg.name.empty" bundle="${motorMsg}" />' data-error='<fmt:message key="motor.error.msg.carowner.fullname.format" bundle="${motorMsg}" />'>
	                                                <label class="mdl-textfield__label" for="fullName"><fmt:message key="motor.driversdetails.driver.name" bundle="${motorMsg}" /></label>
	                                                <div class="help-block with-errors"></div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="col-sm-6">
	                                    <div class="form-group">
	                                        <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
	                                            <div class="help-block-wrap calendar"> 
	                                                <span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
	                                                <input type="text" name="driverDob" id="driverDob" class="driverDob-datepicker form-control input--grey mdl-textfield__input" data-required-error='<fmt:message key="motor.error.msg.carowner.dob.empty" bundle="${motorMsg}" />'>
	                                                <span style="display:none"><input type="text" id="driverDob-hidden"  data-required-error='<fmt:message key="motor.error.msg.policy.dob.empty" bundle="${motorMsg}" />' required/></span>
	                                                <label class="mdl-textfield__label" for="driverDob" style="font-size:12px"><fmt:message key="motor.driversdetails.driver.birthdate" bundle="${motorMsg}" /></label>
	                                                 </div>
	                                                <div class="help-block with-errors"></div>
	                                       </div>
	                                    </div>
	                                </div>
	                                <div class="clearfix"></div>
	                                <div class="col-sm-6">
	                                    <div class="form-group">
	                                        <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
	                                            <div class="help-block-wrap">
	                                                <!-- <input type="text" name="driverID" minlength="8" maxlength="8" data-bv-callback-callback="checkHKID" pattern="^[a-zA-Z\d\s]+$" data-error='<fmt:message key="motor.error.msg.carowner.id.format" bundle="${motorMsg}" />' class="form-control input--grey mdl-textfield__input" id="driverID" data-required-error='<fmt:message key="motor.error.msg.carowner.id.empty" bundle="${motorMsg}" />' required>-->
	                                                <input type="text" style="text-transform:uppercase" name="driverID" pattern="^[a-zA-Z\d\s]+$" data-error='<fmt:message key="motor.error.msg.carowner.id.format" bundle="${motorMsg}" />' data-equals='<fmt:message key="motor.error.msg.carowner.id.format" bundle="${motorMsg}" />' class="form-control input--grey mdl-textfield__input" id="driverID" data-required-error='<fmt:message key="motor.error.msg.carowner.id.empty" bundle="${motorMsg}" />' required>
	                                                <label class="mdl-textfield__label" for="driverID"><fmt:message key="motor.driversdetails.driver.hkid" bundle="${motorMsg}" /></label>
	                                                <div class="help-block with-errors"></div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="col-sm-6">	
	                                    <div class="form-group">
	                                        <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
	                                            <div class="help-block-wrap">
	                                                <input type="text" name="mobileno" pattern="^[5|6|8|9]{1}\d{7}$" maxlength="8" class="form-control input--grey check-emp login-input mdl-textfield__input" id="mobileno" data-error='<fmt:message key="motor.error.msg.carowner.mobile.format" bundle="${motorMsg}" />' data-required-error='<fmt:message key="motor.error.msg.carowner.mobile.empty" bundle="${motorMsg}" />'  required>
	                                                <label class="mdl-textfield__label" for="mobileno"><fmt:message key="motor.driversdetails.driver.contactno" bundle="${motorMsg}" /></label>
	                                                <div class="help-block with-errors"></div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="clearfix"></div>
	                                <div class="col-sm-6">
	                                    <div class="form-group">
	                                        <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
	                                            <div class="help-block-wrap">
	                                                <input type="email" name="email" id="email" maxlength="50" class="form-control input--grey mdl-textfield__input" data-error='<fmt:message key="motor.error.msg.carowner.email.format" bundle="${motorMsg}" />' data-required-error='<fmt:message key="motor.error.msg.carowner.email.empty" bundle="${motorMsg}" />' required>
	                                                <label class="mdl-textfield__label" for="email"><fmt:message key="motor.driversdetails.driver.email" bundle="${motorMsg}" /></label>
	                                                <div class="help-block with-errors"></div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="clearfix"></div>
	                                <div class="center" > 
	                                    <!--desktop-->
	                                    <h1 class="landing_h2 hidden-sm hidden-xs"><fmt:message key="motor.driversdetails.address.title" bundle="${motorMsg}" /></h1>
	                                    <!--end-desktop--> 
	                                    <!--Mobile-->
	                                    <h1 class="landing_h2 hidden-lg hidden-md feature-ttl"><fmt:message key="motor.driversdetails.address.title" bundle="${motorMsg}" /></h1>
	                                    <!--end mobile--> 
	                                </div>
	                                <div class="col-sm-4">
	                                    <div class="form-group">
	                                        <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
	                                            <div class="help-block-wrap">
	                                                <input type="text" name="flat" maxlength="20"  class="form-control input--grey mdl-textfield__input" id="flat"  data-required-error='<fmt:message key="motor.error.msg.general.engcharint" bundle="${motorMsg}" />'>
	                                                <label class="mdl-textfield__label" style="font-size:12px"><fmt:message key="motor.driversdetails.address.flat" bundle="${motorMsg}" /></label>
	                                                <div class="help-block with-errors"></div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="col-sm-4">
	                                    <div class="form-group">
	                                        <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
	                                            <div class="help-block-wrap"> 
	                                                <input type="text" name="floor" maxlength="20"  class="form-control input--grey mdl-textfield__input" id="floor"  data-required-error='<fmt:message key="motor.error.msg.general.engcharint" bundle="${motorMsg}" />'>
	                                                <label class="mdl-textfield__label" style="font-size:12px"><fmt:message key="motor.driversdetails.address.floor" bundle="${motorMsg}" /></label>
	                                                <div class="help-block with-errors"></div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="col-sm-4">
	                                    <div class="form-group">
	                                        <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
	                                            <div class="help-block-wrap"> 
	                                                <input type="text" name="block" maxlength="20"  class="form-control input--grey mdl-textfield__input" id="block" data-required-error='<fmt:message key="motor.error.msg.general.engcharint" bundle="${motorMsg}" />'>
	                                                <label class="mdl-textfield__label" style="font-size:12px"><fmt:message key="motor.driversdetails.address.block" bundle="${motorMsg}" /></label>
	                                                <div class="help-block with-errors"></div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="clearfix"></div>
	                                <div class="col-sm-6">
	                                    <div class="form-group">
	                                        <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
	                                            <div class="help-block-wrap">
	                                                <input type="text" name="building" id="building" maxlength="35"  class="form-control input--grey mdl-textfield__input" data-required-error='<fmt:message key="motor.error.msg.carowner.address.format" bundle="${motorMsg}" />' required>
	                                                <label class="mdl-textfield__label"><fmt:message key="motor.driversdetails.address.building" bundle="${motorMsg}" /></label>
	                                                <div class="help-block with-errors building"></div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="col-sm-6">
	                                    <div class="form-group">
	                                        <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
	                                            <div class="help-block-wrap">
	                                                <input type="text" name="estate" id="estate" maxlength="32" class="form-control input--grey mdl-textfield__input" data-required-error='<fmt:message key="motor.error.msg.carowner.address.format" bundle="${motorMsg}" />' required>
	                                                <label class="mdl-textfield__label"><fmt:message key="motor.driversdetails.address.estate" bundle="${motorMsg}" /></label>
	                                                <div class="help-block with-errors estate"></div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="clearfix"></div>
	                                <div class="col-sm-6">
	                                    <div class="form-group">
	                                        <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
	                                            <div class="help-block-wrap">
	                                                <input type="text" name="streetno" id="streetno" maxlength="20" class="form-control input--grey mdl-textfield__input" data-required-error='<fmt:message key="motor.error.msg.carowner.address.format" bundle="${motorMsg}" />' required>
	                                                <label class="mdl-textfield__label"><fmt:message key="motor.driversdetails.address.streetno" bundle="${motorMsg}" /></label>
	                                                <div class="help-block with-errors streetno"></div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="col-sm-6">
	                                    <div class="form-group">
	                                        <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
	                                            <div class="help-block-wrap">
	                                                <input type="text" name="streetname" id="streetname" maxlength="20"  class="form-control input--grey mdl-textfield__input" data-required-error='<fmt:message key="motor.error.msg.carowner.address.format" bundle="${motorMsg}" />' required>
	                                                <label class="mdl-textfield__label"><fmt:message key="motor.driversdetails.address.streetname" bundle="${motorMsg}" /></label>
	                                                <div class="help-block with-errors streetname"></div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="clearfix"></div>
	                                <div class="col-sm-6">
	                                    <div class="form-group">
	                                        <div class="help-block-wrap">
	                                            <select class="form-control" id="district" name="district" data-required-error='<fmt:message key="motor.error.msg.carowner.address.district.empty" bundle="${motorMsg}" />' required>
	                                                <option value="" disabled selected hidden><fmt:message key="motor.driversdetails.address.district" bundle="${motorMsg}" /></option>
	                                            </select>
	                                             <label class="mdl-textfield__label label-district hidden" for="district" ><fmt:message key="motor.driversdetails.address.district" bundle="${motorMsg}" /></label>
	                                            <div class="help-block with-errors"></div>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="col-sm-6">
	                                    <div class="form-group">
	                                        <div class="help-block-wrap">
	                                            <!-- <select class="form-control" id="area" data-required-error='<fmt:message key="motor.error.msg.carowner.address.district.general" bundle="${motorMsg}" />' required>
	                                                <option value="" disabled selected hidden><fmt:message key="motor.driversdetails.address.area" bundle="${motorMsg}" /></option>
	                                                <option value="Hong Kong"><fmt:message key="motor.driversdetails.address.area.hk" bundle="${motorMsg}" /></option>
	                                                <option value="Kowloon"><fmt:message key="motor.driversdetails.address.area.kln" bundle="${motorMsg}" /></option>
	                                                <option value="New Territories"><fmt:message key="motor.driversdetails.address.area.nt" bundle="${motorMsg}" /></option>
	                                            </select>-->
	                                            <!-- <select class="form-control" id="area" name="area" data-required-error='<fmt:message key="motor.error.msg.carowner.address.district.general" bundle="${motorMsg}" />' required>
	                                                <option value="" disabled selected hidden><fmt:message key="motor.driversdetails.address.area" bundle="${motorMsg}" /></option>
	                                            </select>-->
	                                            <input type="text" style="background-color: #f2f2f2;color: #bbb;font-size: 12px;" name="area" id="area" maxlength="20" class="form-control input--grey mdl-textfield__input" readonly value="<fmt:message key="motor.driversdetails.address.area" bundle="${motorMsg}" />">
	                                            <label class="mdl-textfield__label label-area hidden" for="area" ><fmt:message key="motor.driversdetails.address.area" bundle="${motorMsg}" /></label>
	                                   
	                                            <div class="help-block with-errors"></div>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            <div class="container">
	                <div id="testimonials">
	                    <div class="center" > 
	                        <!--desktop-->
	                        <h1 class="landing_h2 hidden-sm hidden-xs"><fmt:message key="motor.driversdetails.policy.title" bundle="${motorMsg}" /></h1>
	                        <!--end-desktop--> 
	                        <!--Mobile-->
	                        <h1 class="landing_h2 hidden-lg hidden-md feature-ttl"><fmt:message key="motor.driversdetails.policy.title" bundle="${motorMsg}" /></h1>
	                        <!--end mobile--> 
	                    </div>
	                    <div class="row">
	                        <div class="col-md-8 col-md-offset-2 col-sm-12">
	                            <div class="row">
	                                <div class="col-sm-6">
	                                    <div class="form-group">
	                                        <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
	                                            <div class="help-block-wrap calendar" > 
	                                                <span class="glyphicon glyphicon-calendar" aria-hidden="true" style="z-index:1"></span>
	                                                <input type="text" name="policy-datepicker" id="policy-datepicker" class="form-control mdl-textfield__input"  required>
	                                                <label class="mdl-textfield__label" for="policy-datepicker"><fmt:message key="motor.driversdetails.policy.startdate" bundle="${motorMsg}" /></label>
	                                                <div class="help-block with-errors"></div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="col-sm-6">
	                                    <div class="ped">
	                                        <span><fmt:message key="motor.driversdetails.policy.enddate" bundle="${motorMsg}" /></span>
	                                        &nbsp;
	                                        <i class="fa fa-angle-right" aria-hidden="true"></i>
	                                        &nbsp;
	                                        <span class="policy-end-date"></span>
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
	                            <div class="text-center has-error hide" id="system-error">
	                            <br/>
	                            <span class="help-block"><fmt:message key="motor.error.msg.serversystem.error" bundle="${motorMsg}" /></span>
	                            </div>
	                            <div class="clearfix"></div> 
	                            <div class="text-center save">
	                                <!-- <a href="#" id="saveForm" class=""><fmt:message key="motor.link.text.savecontinuelater" bundle="${motorMsg}" /></a>
	                             --></div>
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
                        
                        <div class="col-sm-6 text-right hidden">
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
                            <div class="col-xs-6 text-right hidden">
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
                            <div class="col-xs-6 text-right hidden">
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
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/vendor/validator.min.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/vendor/bootstrapValidator.min.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/vendor/bootstrap-switch.min.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/vendor/selectize.min.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/motor/motor-forms.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/motor/motor-api.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/motor/register-form.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/motor/custom-datepicker.js"></script>
<script type="text/javascript">
var checkbox=true;
var quote = jQuery.parseJSON('<%=request.getParameter("data")!=null?StringEscapeUtils.escapeEcmaScript(StringEscapeUtils.unescapeHtml4(request.getParameter("data"))):"{}"%>');

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
	//$('#saveModal').modal("show");
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
		    	//tempquote = response.motorCareDetails;
		    	//$('#saveModal').modal("show");
		    }
		});
}
function SaveAndExit()
{	
	$(document).ready(function(){
		$("#system-error").addClass("hide");
		var area = $('input[name=area]').val();
		if(area== "新界")
			area = "New Territories";
		else if(area== "香港")
			area = "Hong Kong";
		else if(area== "九龍")
			area = "Kowloon";
		 var submitData = {
				    "policyId": quote.policyId,		
				   	"policyStartDate":$('input[name=policy-datepicker]').val(),
					"policyEndDate":$('.policy-end-date').html(),
				  	"applicant": {		
				  	"contactNo": $('input[name=mobileno]').val(),		
				  	"correspondenceAddress": {    		
				    "block":  $('input[name=block]').val(),		
				    "building":  $('input[name=building]').val(),		
				    "district":  $('[name="district"]').val(),//$("#district option:selected").text(),		
				    "estate":  $('input[name=estate]').val(),		
				    "flat":  $('input[name=flat]').val(),		
				    "floor":  $('input[name=floor]').val(),		
				    "hkKlNt": area,//$("#area option:selected").text(),		
				    "streetName":  $('input[name=streetname]').val(),		
				    "streetNo":  $('input[name=streetno]').val()		
				  },		
				  "dateOfBirth": $('input[name=driverDob]').val(),  		
				  "email": $('input[name=email]').val() ,		
				  "hkid": $('input[name=driverID]').val(),		
				  "name": $('input[name=fullName]').val() 		
				  }		
				};
		   	console.dir(submitData);
		   	console.log(JSON.stringify(submitData));
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
			  url: context + "/api/iMotor/policy/save4Later/driverDetails",
			  success: function(data){
				  console.dir(data);
				  $('#saveModal').modal("hide");
				  location.assign(context);
			  },error: function(error) {
				 console.dir(error);				
				 $("#system-error").removeClass("hide");
	             $("#loading-overlay").modal("hide");
	             return false;
	              
			  }
			});
	});
}
function BackMe() {
	
	 var $form = $("<form id='quote-form' />");
    	 $form.attr("action", "car-details?back=yes");
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
var chin = $('body').hasClass('chin'),
enErr = {
	404: 'Invalid information (code: 404)',
	410: 'Invalid information (code: 410)',
	422: 'Invalid information (code: 422)',
	504: 'Invalid information (code: 504)',
},
cnErr ={
	404: '資料不正確(編號：404)',
	410: '資料不正確(編號：410)',
	422: '資料不正確(編號：422)',
	504: '資料不正確(編號：504)',               
};
$(document).ready(function(){
	$(".motor-signup-form input").css({"text-transform":"uppercase"});
	$("input[name=email]").css({"text-transform":"none"});
	$("#driverDob").val('');
	$("#driverDob").change(function(){
		$("#driverDob-hidden").prop('required',false);
	});
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
	
	if(getUrlParameter("edit")=="yes" || getUrlParameter("back")=="yes" )
	{
		$("#estate").prop('required',false);
		$("#building").prop('required',false);
		$("#streetname").prop('required',false);
		$("#streetno").prop('required',false);
	}  
		
	$("#building").bind("change paste keyup", function() {
		if($(this).val().length > 0)
		{	
			$("#estate").prop('required',false);
			$("#streetno").prop('required',false);
			$("#streetname").prop('required',false);
			$(".estate").html('');
			$(".streetno").html('');
			$(".streetname").html('');
			$('#driverDetails').validator('update'); 
		}else if($(this).val().length == 0)
		{
			if($("#estate").val().length == 0 && $("#building").val().length == 0 && $("#streetname").val().length == 0 && $("#streetno").val().length == 0)
			{	
				$("#estate").prop('required',true);
				$("#building").prop('required',true);
				$("#streetname").prop('required',true);
				$("#streetno").prop('required',true);
			}
			$('#driverDetails').validator('update'); 
		}
			
	});
	
	$("#estate").bind("change paste keyup", function() {
		if($(this).val().length > 0)
		{
			$("#building").prop('required',false);
			$("#streetno").prop('required',false);
			$("#streetname").prop('required',false);
			$(".building").html('');
			$(".streetno").html('');
			$(".streetname").html('');
			$('#driverDetails').validator('update'); 
		}else if($(this).val().length == 0)
		{
			if($("#estate").val().length == 0 && $("#building").val().length == 0 && $("#streetname").val().length == 0 && $("#streetno").val().length == 0)
			{	
				$("#estate").prop('required',true);
				$("#building").prop('required',true);
				$("#streetname").prop('required',true);
				$("#streetno").prop('required',true);
			}
			$('#driverDetails').validator('update'); 
		}
	});
	
	$("#streetname").bind("change paste keyup", function() {
		if($(this).val().length > 0)
		{
			$("#building").prop('required',false);
			$("#estate").prop('required',false);
			$("#streetno").prop('required',false);
			$(".building").html('');
			$(".estate").html('');
			$(".streetno").html('');
			$('#driverDetails').validator('update'); 
		}else if($(this).val().length == 0)
		{
			if($("#estate").val().length == 0 && $("#building").val().length == 0 && $("#streetname").val().length == 0 && $("#streetno").val().length == 0)
			{	
				$("#estate").prop('required',true);
				$("#building").prop('required',true);
				$("#streetname").prop('required',true);
				$("#streetno").prop('required',true);
			}
			$('#driverDetails').validator('update'); 
		}
	});
	
	$("#streetno").bind("change paste keyup", function() {
		if($(this).val().length > 0)
		{
			$("#building").prop('required',false);
			$("#estate").prop('required',false);
			$("#streetname").prop('required',false);
			$(".building").html('');
			$(".estate").html('');
			$(".streetname").html('');
			$('#driverDetails').validator('update'); 
		}else if($(this).val().length == 0)
		{
			if($("#estate").val().length == 0 && $("#building").val().length == 0 && $("#streetname").val().length == 0 && $("#streetno").val().length == 0)
			{	
				$("#estate").prop('required',true);
				$("#building").prop('required',true);
				$("#streetname").prop('required',true);
				$("#streetno").prop('required',true);
			}
			$('#driverDetails').validator('update'); 
		}
	});
	
	/*custom validate for HKID*/
	   $('#driverDetails').validator({
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
	 //$('#contactForm').formValidation();    
	//alert(IsHKID("z1133333") );
	
	
    
	if(getUrlParameter("edit")=="yes" || getUrlParameter("back")=="yes" )
    {
	    $('input[name=fullName]').val(quote.applicant.name);    
		$('input[name=driverDob]').val(quote.applicant.dateOfBirth);
		$('#driverDob-hidden').val(quote.applicant.dateOfBirth);
		$('input[name=driverID]').val(quote.applicant.hkid);
		$('input[name=mobileno]').val(quote.applicant.contactNo);
		$('input[name=email]').val(quote.applicant.email);
		
		if(quote.applicant.correspondenceAddress != null)
		{
			$('input[name=flat]').val(quote.applicant.correspondenceAddress.flat);
			$('input[name=floor]').val(quote.applicant.correspondenceAddress.floor);
			$('input[name=block]').val(quote.applicant.correspondenceAddress.block);
			$('input[name=building]').val(quote.applicant.correspondenceAddress.building);
			$('input[name=estate]').val(quote.applicant.correspondenceAddress.estate);
			$('input[name=district]').val(quote.applicant.correspondenceAddress.district);
			$('input[name=streetname]').val(quote.applicant.correspondenceAddress.streetName);	
		    $('input[name=streetno]').val(quote.applicant.correspondenceAddress.streetNo);
		}
    }
	
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
	     $motor_district = $('#district').selectize({
	         valueField: 'code',
	         labelField: 'desc',
	         searchField: 'desc',
	         create: false,
	         preload: true,
	         load: function(query, callback) {
	             $('#district-selectized').data('required-error', $('#district').data('required-error'));
	             $.ajax({
	                 url: context + '/api/iMotor/list/districts',
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
	 						if(typeof quote.applicant.correspondenceAddress != "undefined")
	 							$.each(res, function(i, item) {
	 								if(getUrlParameter("edit")=="yes" || getUrlParameter("back")=="yes" )
	 								{
	 									if(item.desc == quote.applicant.correspondenceAddress.district )
	 									{
	 										$motor_district[0].selectize.setValue(item.code);
	 										
	 										if(motorlanguage == "ZH")
	 										{
	 											console.log(item.remark);
	 											if(item.remark == "NEW TERRITORIES")
	 												$("#area").val("新界");
	 											else if(item.remark == "HONG KONG")
	 												$("#area").val("香港");
	 											else if(item.remark == "KOWLOON")
	 												$("#area").val("九龍");
	 										}	
	 										else
	 											$("#area").val(item.remark);
	 										$("#area").css({
	 											"color": "#000",										
	 									    	"font-size": "14px"});
	 									}
	 								}
	 							});
	                     }
	             });
	         },
	         onChange: function(value){
	 			$(".label-district, .label-area").removeClass("hidden");
	 			$(".label-district, .label-area").css({
	 				"font-size": "12px",
	 				"top": "2px",
	 				"left":"16px",
	 				"visibility": "visible",
	 				"z-index": "100"
	 				});
	 			//$motor_area[0].selectize.setValue("HONG KONG");
	 			$.ajax({
	                 url: context + '/api/iMotor/list/districts',
	                 type: 'GET',
	                 dataType: 'json',
	                 error: function() {
	                         callback();
	                     },
	                     success: function(res) {
	                     	
	 							$.each(res, function(i, item) {
	 									
	 									if(item.code == value)
	 									{
	 										if(motorlanguage == "ZH")
	 										{
	 											if(item.remark == "NEW TERRITORIES")
	 												$("#area").val("新界");
	 											else if(item.remark == "HONG KONG")
	 												$("#area").val("香港");
	 											else if(item.remark == "KOWLOON")
	 												$("#area").val("九龍");
	 										}	
	 										else
	 											$("#area").val(item.remark);
	 										
	 										$("#area").css({
	 											"color": "#000",										
	 									    	"font-size": "14px"});
	 									}
	 							
	 							});
	                     }
	             });
	 			
	         }
	     });
	 /*$.ajax({
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
    
	$('#driverDetails').validator().on('submit', function (e) {
		$("#system-error").addClass("hide");
		
		if (!e.isDefaultPrevented()) {
			$(".motor-signup-form input").val(function(i,val) {
				var pattern = new RegExp(/^[+a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i);
				if(pattern.test(val)!=true)
					return val.toUpperCase();
				else
					return val;
				
		    });
		
			var area = $('input[name=area]').val();
			if(area== "新界")
				area = "New Territories";
			else if(area== "香港")
				area = "Hong Kong";
			else if(area== "九龍")
				area = "Kowloon";
		   var submitData = {
				    "policyId": quote.policyId,		
				   	"policyStartDate":$('input[name=policy-datepicker]').val(),
				   	"policyEndDate":$('.policy-end-date').html(),
				  	"applicant": {		
				  	"contactNo": $('input[name=mobileno]').val(),		
				  	"correspondenceAddress": {    		
				    "block":  $('input[name=block]').val(),		
				    "building":  $('input[name=building]').val(),		
				    "district":  $('[name="district"]').val(),//$("#district option:selected").text(),		
				    "estate":  $('input[name=estate]').val(),		
				    "flat":  $('input[name=flat]').val(),		
				    "floor":  $('input[name=floor]').val(),		
				    "hkKlNt":area,//$("#area option:selected").text(),		
				    "streetName":  $('[name=streetname]').val(),		
				    "streetNo":  $('[name=streetno]').val()				
				  },		
				  "dateOfBirth": $('input[name=driverDob]').val(),  		
				  "email": $('input[name=email]').val() ,		
				  "hkid": $('input[name=driverID]').val(),		
				  "name": $('input[name=fullName]').val() 		
				  }		
				};
		   
		   	console.dir(submitData);
		   	console.log(JSON.stringify(submitData));
		   	
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
			  url: context + "/api/iMotor/policy/saving/driverDetails",
			  success: function(data){
		
				  var $form = $("<form id='quote-form' />");
				  if(getUrlParameter("edit")=="yes" || getUrlParameter("back")=="yes")
	             	 $form.attr("action", "policy-details?edit=yes");
				  else
					 $form.attr("action", "policy-details");
	              $form.attr("method", "post");
	              var $quote = $("<input type='hidden' name='data' />");
	              var opts = {};
	              opts = $.extend(opts,quote, submitData);
	              opts=  $.extend(opts,{"applicant": $.extend(quote.applicant, submitData.applicant)});
	              $quote.attr("value", JSON.stringify(opts));
	              $form.append($quote);
	              $("body").append($form);
	              $('#quote-form').submit();
	              
			  },error: function(xhr, textStatus, errorThrown) {
				  $('#reason').attr('value', xhr.status);
	               	 if(chin)
	               		$("#system-error").find('.help-block').html(cnErr[xhr.status]);
	             	 else
				  		$("#system-error").find('.help-block').html(enErr[xhr.status]);
	            	 $("#system-error").removeClass("hide");
	              
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

