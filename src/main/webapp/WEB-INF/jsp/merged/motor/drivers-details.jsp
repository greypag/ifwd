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
	            <form id="driverDetails"  method="post" data-toggle="validator">
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
	                                                <input type="text" name="driverDob" id="driverDob" class="driverDob-datepicker form-control input--grey mdl-textfield__input" required data-required-error='<fmt:message key="motor.error.msg.carowner.dob.empty" bundle="${motorMsg}" />'>
	                                                <label class="mdl-textfield__label" for="driverDob"><fmt:message key="motor.driversdetails.driver.birthdate" bundle="${motorMsg}" /></label>
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
	                                                <input type="text" name="driverID" minlength="8" maxlength="8" pattern="^[a-zA-Z\d\s]+$" data-error='<fmt:message key="motor.error.msg.carowner.id.format" bundle="${motorMsg}" />' class="form-control input--grey mdl-textfield__input" id="driverID" data-required-error='<fmt:message key="motor.error.msg.carowner.id.empty" bundle="${motorMsg}" />' required>
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
	                                                <input type="text" name="mobileno" pattern="^\d{8}$" maxlength="8" class="form-control input--grey check-emp login-input mdl-textfield__input" id="mobileno" data-error='<fmt:message key="motor.error.msg.carowner.mobile.format" bundle="${motorMsg}" />' data-required-error='<fmt:message key="motor.error.msg.carowner.mobile.empty" bundle="${motorMsg}" />'  required>
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
	                                                <input type="text" name="flat" maxlength="10" pattern="^[a-zA-Z\d\s]+$" data-pattern-error='<fmt:message key="motor.error.msg.general.engcharint" bundle="${motorMsg}" />' class="form-control input--grey mdl-textfield__input" id="flat">
	                                                <label class="mdl-textfield__label"><fmt:message key="motor.driversdetails.address.flat" bundle="${motorMsg}" /></label>
	                                                <div class="help-block with-errors"></div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="col-sm-4">
	                                    <div class="form-group">
	                                        <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
	                                            <div class="help-block-wrap"> 
	                                                <input type="text" name="floor" maxlength="5" pattern="^[a-zA-Z\d\s]+$" data-pattern-error='<fmt:message key="motor.error.msg.general.engcharint" bundle="${motorMsg}" />'  class="form-control input--grey mdl-textfield__input" id="floor">
	                                                <label class="mdl-textfield__label"><fmt:message key="motor.driversdetails.address.floor" bundle="${motorMsg}" /></label>
	                                                <div class="help-block with-errors"></div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="col-sm-4">
	                                    <div class="form-group">
	                                        <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
	                                            <div class="help-block-wrap"> 
	                                                <input type="text" name="block" maxlength="5" pattern="^[a-zA-Z\d\s]+$" data-pattern-error='<fmt:message key="motor.error.msg.general.engcharint" bundle="${motorMsg}" />'  class="form-control input--grey mdl-textfield__input" id="block" >
	                                                <label class="mdl-textfield__label"><fmt:message key="motor.driversdetails.address.block" bundle="${motorMsg}" /></label>
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
	                                                <input type="text" name="building" maxlength="50" pattern="^[a-zA-Z\d\s]+$" data-pattern-error='<fmt:message key="motor.error.msg.general.engcharint" bundle="${motorMsg}" />'  class="form-control input--grey mdl-textfield__input" id="building" data-required-error='<fmt:message key="motor.error.msg.carowner.address.format" bundle="${motorMsg}" />' required>
	                                                <label class="mdl-textfield__label"><fmt:message key="motor.driversdetails.address.building" bundle="${motorMsg}" /></label>
	                                                <div class="help-block with-errors"></div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="col-sm-6">
	                                    <div class="form-group">
	                                        <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
	                                            <div class="help-block-wrap">
	                                                <input type="text" name="estate" maxlength="50" pattern="^[a-zA-Z\d\s]+$" data-pattern-error='<fmt:message key="motor.error.msg.general.alphanumeric" bundle="${motorMsg}" />' class="form-control input--grey mdl-textfield__input" id="estate" required>
	                                                <label class="mdl-textfield__label"><fmt:message key="motor.driversdetails.address.estate" bundle="${motorMsg}" /></label>
	                                                <div class="help-block with-errors"></div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                                <!--
	                                <div class="clearfix"></div>
	                                <div class="col-sm-6">
	                                    <div class="form-group">
	                                        <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
	                                            <div class="help-block-wrap">
	                                                <input type="text" name="streetno" maxlength="5" pattern="^[a-zA-Z\d\s]+$" data-pattern-error='<fmt:message key="motor.error.msg.general.alphanumeric" bundle="${motorMsg}" />'  class="form-control input--grey mdl-textfield__input" id="streetno" >
	                                                <label class="mdl-textfield__label"><fmt:message key="motor.driversdetails.address.streetno" bundle="${motorMsg}" /></label>
	                                                <div class="help-block with-errors"></div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="col-sm-6">
	                                    <div class="form-group">
	                                        <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
	                                            <div class="help-block-wrap">
	                                                <input type="text" name="streetname" maxlength="50" pattern="^[a-zA-Z\d\s]+$" data-pattern-error='<fmt:message key="motor.error.msg.general.alphanumeric" bundle="${motorMsg}" />'  class="form-control input--grey mdl-textfield__input" id="streetname">
	                                                <label class="mdl-textfield__label"><fmt:message key="motor.driversdetails.address.streetname" bundle="${motorMsg}" /></label>
	                                                <div class="help-block with-errors"></div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                                -->
	                                <div class="clearfix"></div>
	                                <div class="col-sm-6">
	                                    <div class="form-group">
	                                        <div class="help-block-wrap">
	                                            <select class="form-control" id="district" name="district" data-required-error='<fmt:message key="motor.error.msg.carowner.address.district.empty" bundle="${motorMsg}" />' required>
	                                                <option value="" disabled selected hidden><fmt:message key="motor.driversdetails.address.district" bundle="${motorMsg}" /></option>
	                                            </select>
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
	                                            <select class="form-control" id="area" name="area" data-required-error='<fmt:message key="motor.error.msg.carowner.address.district.general" bundle="${motorMsg}" />' required>
	                                                <option value="" disabled selected hidden><fmt:message key="motor.driversdetails.address.area" bundle="${motorMsg}" /></option>
	                                            </select>
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
	                                                <span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
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
	                                <a class="bdr-curve btn btn-primary nxt-btn" onclick="perventRedirect=false;BackCarDetail();"><fmt:message key="motor.button.back" bundle="${motorMsg}" /> </a>
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
    <section class="yourQuote">
    <div class="container">
        <div class="row" >
            <a class="orange-color col-xs-12 collapse-addon center" role="button" data-toggle="collapse" href="#yourQuote" aria-expanded="false" aria-controls="yourQuote">
                <h3><span class="small title"><fmt:message key="motor.label.yourquote" bundle="${motorMsg}" /></span><span class="price"><fmt:message key="motor.label.currency.front" bundle="${motorMsg}" /><fmt:message key="motor.label.currency.behind" bundle="${motorMsg}" /></span></h3>
            </a>
            <div class="col-xs-12 col-sm-10 col-sm-offset-1 collapse" id="yourQuote">
                <div class="row">
                    <div class="col-sm-6">
                        <span class="ci"> Comprehensive Insurance </span>
                    </div>
                    <div class="col-sm-6 text-right">
                        <small class="from"><fmt:message key="motor.label.from" bundle="${motorMsg}" /></small><span class="price"><fmt:message key="motor.label.currency.front" bundle="${motorMsg}" />4,230.00<fmt:message key="motor.label.currency.behind" bundle="${motorMsg}" /></span>
                    </div>
                    <div class="col-xs-12">
                        <br/>
                    </div>
                    <div class="col-xs-12">
                    <strong><fmt:message key="motor.label.addon" bundle="${motorMsg}" />:</strong> 
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
                        <span><fmt:message key="motor.label.subtotal" bundle="${motorMsg}" /></span>
                    </div>
                    <div class="col-xs-6 text-right">
                        <span>3400.00</span>
                    </div>
                    <div class="col-xs-6">
                        <span><fmt:message key="motor.label.discounts" bundle="${motorMsg}" /></span>
                    </div>
                    <div class="col-xs-6 text-right">
                        <span>300.00</span>
                    </div>
                    <div class="col-xs-12">
                        <hr/>
                    </div>
                    <div class="col-xs-6">
                        <strong><fmt:message key="motor.label.amountdue" bundle="${motorMsg}" />:</strong>
                    </div>
                    <div class="col-xs-6 text-right">
                        <strong><fmt:message key="motor.label.currency.front" bundle="${motorMsg}" />300.00<fmt:message key="motor.label.currency.behind" bundle="${motorMsg}" /></strong>
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
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/motor/register-form.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/motor/custom-datepicker.js"></script>
<script type="text/javascript">
var checkbox=true;
var quote = jQuery.parseJSON('<%=request.getParameter("data")!=null?request.getParameter("data").replace("&quot;", "\""):"{}"%>');
//quote = jQuery.parseJSON('{"id":0,"planCode":"Third","compPlan":null,"grossPremium":null,"discountAmount":null,"personalAccident":true,"thirdPartyPropertyDamage":true,"addOnPaAmt":"100","addOnTppdAmt":"309","addOnPaBenefit":"500000","addOnTppdIncrease":"5000000","policyId":"26932443","refNumber":"QFVPE16-001864","amtFromThirdPartyToCompSilver":null,"amtFromThirdPartyToCompGold":null,"compInsuranceAmount":null,"personalAccidentAmount":null,"subTotalAmount":null,"amountDueAmount":"2023.53","ownDamageExcess":null,"theftExcess":null,"unnamedDriverExcess":null,"youngDriverExcess":null,"inexperiencedDriverExcess":null,"tPPDExcess":null,"parkingExcess":null,"promoCode":null,"carDetail":{"id":null,"makeCode":"BMW","model":"120I","engineCapacity":2599,"typeOfBody":null,"carGroup":null,"electricCar":false,"alarm":null,"modelDesc":"MODELZ","yearOfManufacture":"2016","estimatedValue":2000000,"chassisNumber":"1HGCM82633A004352","bankMortgage":false,"bankMortgageCode":null,"bankMortgageName":null},"driver":[{"name":"chan chan chan","dateOfBirth":"06-12-1991","hkid":"a1234563","contactNo":null,"email":null,"occupation":"A1","ncb":null,"validAgeGroup":true,"driveMoreThanTwo":true}],"policyStartDate":"06-12-2016","nameOfPreviousInusrancer":"ACEInsuranceLimited","regNoofPreviousPolicy":"1111111","expDateOfPreviousInsurance":"06-12-2016","previousPolicyNo":"p1233213","motorCareDeclaration":[{"declarationNo":"q1","declarationDesc":null,"declarationAns":false,"langCode":null},{"declarationNo":"q2","declarationDesc":null,"declarationAns":true,"langCode":null},{"declarationNo":"q3","declarationDesc":null,"declarationAns":false,"langCode":null}],"psPICS":false,"psNoDM":true,"psNoProvidePersonalData":true,"theClubMemberNum":null,"coverNoteNum":null,"applicant":{"name":"chan chan chan","dateOfBirth":"06-12-1991","hkid":"a1234563","contactNo":"28515450","email":"kevin.chan@isobar.com","occupation":"A1","ncb":40,"validAgeGroup":true,"driveMoreThanTwo":true,"correspondenceAddress":null},"riderDiscountAmt":0}');
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
		    	console.dir(response);
		    	tempquote = response.motorCareDetails;
		    	$('#saveModal').modal("show");
		    }
		});
}
function SaveAndExit()
{
	$(document).ready(function(){
		 var submitData = {
				    "policyId": quote.policyId,		
				   	"policyStartDate":$('input[name=policy-datepicker]').val(),		
				  	"applicant": {		
				  	"contactNo": $('input[name=mobileno]').val(),		
				  	"correspondenceAddress": {    		
				    "block":  $('input[name=block]').val(),		
				    "building":  $('input[name=building]').val(),		
				    "district":  $('[name="district"]').val(),//$("#district option:selected").text(),		
				    "estate":  $('input[name=estate]').val(),		
				    "flat":  $('input[name=flat]').val(),		
				    "floor":  $('input[name=floor]').val(),		
				    "hkKlNt": $('[name="area"]').val(),//$("#area option:selected").text(),		
				    "streetName": null,		
				    "streetNo": null		
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
				 alert("error");
	             $("#loading-overlay").modal("hide");
	             return false;
	              
			  }
			});
	});
}
$(document).ready(function(){
        
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
    console.dir(quote);
	if(getUrlParameter("edit")=="yes")
    {
	    $('input[name=fullName]').val(quote.applicant.name);    
		$('input[name=driverDob]').val(quote.applicant.dateOfBirth);
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
						$.each(res, function(i, item) {
							if(getUrlParameter("edit")=="yes")
							{
								if(item.desc == quote.applicant.correspondenceAddress.district )
								{
									$motor_district[0].selectize.setValue(item.code);	
								}
							}
						});
                    }
            });
        },
        onChange: function(value){
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
    
	$('#driverDetails').submit(function(event){
		
	   var submitData = {
			    "policyId": quote.policyId,		
			   	"policyStartDate":$('input[name=policy-datepicker]').val(),		
			  	"applicant": {		
			  	"contactNo": $('input[name=mobileno]').val(),		
			  	"correspondenceAddress": {    		
			    "block":  $('input[name=block]').val(),		
			    "building":  $('input[name=building]').val(),		
			    "district":  $('[name="district"]').val(),//$("#district option:selected").text(),		
			    "estate":  $('input[name=estate]').val(),		
			    "flat":  $('input[name=flat]').val(),		
			    "floor":  $('input[name=floor]').val(),		
			    "hkKlNt": $('[name="area"]').val(),//$("#area option:selected").text(),		
			    "streetName": null,		
			    "streetNo": null		
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
			  if(getUrlParameter("edit")=="yes")
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
              
		  },error: function(error) {
			 console.dir(error);				
			 alert("error");
             $("#loading-overlay").modal("hide");
             return false;
              
		  }
		});
		return false;
	});
});
</script>

