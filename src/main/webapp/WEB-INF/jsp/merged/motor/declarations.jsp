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

        <div class="container">
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
                                    <div class="image-order-status image-order-status-delivered img-circle third">
                                        <div class="icon">3</div>
                                    </div>
                                    <div class="image-order-status image-order-status-completed active act img-circle fourth">
                                        <span class="status">Declarations</span>
                                        <div class="icon">4</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
            <div class="container">
                <div class="center" > 
                    <!--desktop-->
                    <h1 class="landing_h2 hidden-sm hidden-xs">Declarations</h1>
                    <!--end-desktop--> 
                    <!--Mobile-->
                    <h1 class="landing_h2 hidden-lg hidden-md feature-ttl">Declarations</h1>
                    <!--end mobile--> 
                </div>
            </div>
            <div id="motor_registerForm">
	        <form class="form-inline" id="declaration" method="post" data-toggle="validator">
	            <div class="container">
	                <div class="row">
	                    <div class="col-xs-12 qusetion1">
	                        <div class="panel panel-default question">
	                            <div class="panel-heading">
	                                <h3 class="panel-title">Question 1</h3>
	                            </div>
	                            <div class="panel-body">
	                                <div class="row">
	                                    <div class="col-sm-8">
	                                        <p>
	                                            Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. 
	                                        </p>
	                                    </div>
	                                    <div class="col-sm-4 text-center custom-radio">
		                                    <div class="form-group">
	                                            <div class="help-block-wrap">
	                                        <div class="radio text-center">
	                                            <input type="radio" name="answer1" id="a1yes" value="yes" required>
	                                            <label class="" for="yes">
	                                                <span class="">Yes</span>
	                                            </label>
	                                        </div>
	                                        <div class="radio text-center">
	                                            <input type="radio" name="answer1" id="a1no" value="no" required>
	                                            <label class="" for="no">
	                                                <span class="">No</span>
	                                            </label>
	                                        </div>
	                                        <div class="help-block with-errors"></div>
										                                    </div>
                               				</div>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="col-xs-12 qusetion2">
	                        <div class="panel panel-default question">
	                            <div class="panel-heading">
	                                <h3 class="panel-title">Question 2</h3>
	                            </div>
	                            <div class="panel-body">
	                                <div class="row">
	                                    <div class="col-sm-8">
	                                        <p>
	                                            Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. 
	                                        </p>
	                                    </div>
	                                    <div class="col-sm-4 text-center custom-radio">
		                                    <div class="form-group">
	                                            <div class="help-block-wrap">
	                                        <div class="radio text-center">
	                                            <input type="radio" name="answer2" id="a2yes" value="yes" required>
	                                            <label class="" for="yes">
	                                                <span class="">Yes</span>
	                                            </label>
	                                        </div>
	                                        <div class="radio text-center">
	                                            <input type="radio" name="answer2" id="a2no" value="no" required>
	                                            <label class="" for="no">
	                                                <span class="">No</span>
	                                            </label>
	                                        </div>
	                                        <div class="help-block with-errors"></div>
                                    		</div>
									 	 </div>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="col-xs-12 qusetion3">
	                        <div class="panel panel-default question">
	                            <div class="panel-heading">
	                                <h3 class="panel-title">Question 3</h3>
	                            </div>
	                            <div class="panel-body">
	                                <div class="row">
	                                    <div class="col-sm-8">
	                                        <p>
	                                            Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. 
	                                        </p>
	                                    </div>
	                                    <div class="col-sm-4 text-center custom-radio">
	                                    <div class="form-group">
                                            <div class="help-block-wrap">
	                                        <div class="radio text-center">
	                                            <input type="radio" name="answer3" id="a3yes" value="yes" required>
	                                            <label class="" for="yes">
	                                                <span class="">Yes</span>
	                                            </label>
	                                        </div>
	                                        <div class="radio text-center">
	                                            <input type="radio" name="answer3" id="a3no" value="no" required>
	                                            <label class="" for="no">
	                                                <span class="">No</span>
	                                            </label>
	                                        </div>
	                                        <div class="help-block with-errors"></div>
                                   		 </div>
									 	 </div>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="clearfix"></div>
	                    <form action="/api/iMotor/policy/declarations" method="post">
	                        <div class="col-xs-12">
	                            <div class="center" > 
	                                <!--desktop-->
	                                <h1 class="landing_h2 hidden-sm hidden-xs">Privacy Statement</h1>
	                                <!--end-desktop--> 
	                                <!--Mobile-->
	                                <h1 class="landing_h2 hidden-lg hidden-md feature-ttl">Privacy Statement</h1>
	                                <!--end mobile--> 
	                            </div>
	                        </div>
	                        <div class="clearfix"></div>
	                        <div class="col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 statement">
	                            <div class="custom-checkbox">
	                                <div class="checkbox">
	                                    <div class="form-group">
	                                        <div class="help-block-wrap">
	                                            <input type="checkbox" id="psNoDM" name="psNoDM" value="" required data-required-error="Please enter Registration No. of Previous Policy." >
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
	                            <div class="custom-checkbox">
	                                <div class="checkbox">
	                                    <div class="form-group">
	                                        <div class="help-block-wrap">
	                                            <input type="checkbox" id="psNoProvidePersonalData" name="psNoProvidePersonalData" value="" required data-required-error="Please enter Registration No. of Previous Policy." >
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
	                            <div class="custom-checkbox">
	                                <div class="checkbox">
	                                    <div class="form-group">
	                                        <div class="help-block-wrap">
	                                            <input type="checkbox" id="psPICS" name="psPICS" value=""  required data-required-error="Please enter Registration No. of Previous Policy." >
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
	
	                        </form>
	                    </div>
	                    <div class="col-xs-12">
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
                                <a class="bdr-curve btn btn-primary nxt-btn" onclick="perventRedirect=false;BackMe();">Back</a>
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
<!-- Modal -->
<div class="modal fade" id="contactpopup" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div
        style="display: none; position: absolute; left: 0; top: 0; bottom: 0; right: 0; background: #000; opacity: 0.8; z-index: 1052"
        class="login-ajax-loading">
        <img
        style="width: 100px; height: 100px; position: absolute; top: 50%; left: 50%; margin-left:-50px; margin-top: -50px;"
        src="<%=request.getContextPath()%>/resources/images/ajax-loader.gif">
    </div>
    <div class="modal-dialog modal-lg">
        <div class="modal-content plan-modal">
            <div class=""><a class="close overlay__close" aria-label="Close" data-dismiss="modal"><span aria-hidden="true">×</span></a></div>
            <div class="contact-us-wrap">
                <div class="row">
                    <div class="col-sm-6 col-sm-offset-3 plan-panel">
                        <div class="row">
                            <div class="col-xs-5">
                                <div class="thumbnail">
                                    <img src="<%=request.getContextPath()%>/resources/images/motor/dummy.png" alt="" />
                                </div>
                            </div>
                            <div class="col-xs-7">
                                <h3 class="heading-h3 color-orange">
                                    <fmt:message key="motor.quickquote.contactme.heading" bundle="${motorMsg}" /> 
                                </h3>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-10 col-sm-offset-1 text-center">
                        <p>
                        <br/>
                            <fmt:message key="motor.getquote.contanctme.copy.part1" bundle="${motorMsg}" /><br><br>
                            <em id="reasonMsg"></em><br><br>
                            <fmt:message key="motor.getquote.contanctme.copy.part2" bundle="${motorMsg}" />
                            <a href="tel:23123123"><fmt:message key="motor.getquote.contanctme.copy.part3" bundle="${motorMsg}" /></a> <fmt:message key="motor.getquote.contanctme.copy.part4" bundle="${motorMsg}" />
                        </p>
                        
                    </div>
                </div>
            </div>
            <div id="successMessage" class="text-center hidden contact-us-wrap">
            	<p><br/>
            	 <fmt:message key="motor.quickquote.contactme.form.thankyou" bundle="${motorMsg}" />
            	<br/>
            	            	<br/>
            	</p>
            </div>
            <form role="form" data-toggle="validator" name="contactform" id="contactform-pop" >
                <input type="hidden" name="ref_no" id="ref_no" value="RQ862541" />
                <div class="contact-form contact-us-wrap">
                    <div class="row">
                        <div class="col-sm-10 col-sm-offset-1">
                        <div class="row">
                            <div class="col-xs-12 col-sm-6">
                                <div class="form-group">
                                    <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <div class="help-block-wrap">
                                            <input type="text" name="fullName"
                                            class="form-control gray-textbox mdl-textfield__input" id="fullName" maxlength="100" pattern="^[a-zA-Z\s]+$" data-pattern-error="<fmt:message key="motor.error.msg.name.format" bundle="${motorMsg}" />" data-required-error="<fmt:message key="motor.error.msg.name.empty" bundle="${motorMsg}" />" required >
                                            <label class="mdl-textfield__label" for="fullName"><fmt:message key="motor.quickquote.contactme.form.fullname" bundle="${motorMsg}" /></label>
                                            <div class="help-block with-errors"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6">
                                <div class="form-group">
                                    <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <div class="help-block-wrap">
                                            <input type="email" name="email" id="contactEmail" class="form-control gray-textbox mdl-textfield__input" data-error="<fmt:message key="motor.error.msg.email.format" bundle="${motorMsg}" />" data-required-error="<fmt:message key="motor.error.msg.email.empty" bundle="${motorMsg}" />" required>
                                            <label class="mdl-textfield__label" for="email"><fmt:message key="motor.quickquote.contactme.form.email" bundle="${motorMsg}" /></label>
                                            <div class="help-block with-errors"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6">
                                <div class="form-group">
                                    <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <div class="help-block-wrap">
                                            <input type="text" id="contactNo" class="form-control gray-textbox check-emp login-input mdl-textfield__input" name="contactNo" pattern="^[2|3|5|6|8|9]{1}\d{7}$" maxlength="8" data-pattern-error="<fmt:message key="motor.error.msg.mobile.format" bundle="${motorMsg}" />" data-required-error="<fmt:message key="motor.error.msg.mobile.empty" bundle="${motorMsg}" />" required>
                                            <label class="mdl-textfield__label" for="headerUserName"><fmt:message key="motor.quickquote.contactme.form.mobile" bundle="${motorMsg}" /></label>
                                            <div class="help-block with-errors"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6" style="padding-top:5px;">
                                <div class="form-group">
                                    <div class="selectDiv centreDiv gray-text-bg" id="plan-dob">
                                          <div class="help-block-wrap">
                                    <select class="form-control" id="perferedDate" data-required-error='<fmt:message key="motor.error.msg.calltime.empty" bundle="${motorMsg}" />' name="perferedDate" required>
                                        <option value="anytime" disabled selected hidden><fmt:message key="motor.quickquote.contactme.form.prefereddate" bundle="${motorMsg}" /></option>
                                        <option value="Anytime"><fmt:message key="motor.quickquote.contactme.form.prefereddate.option.0" bundle="${motorMsg}" /></option>
                                        <option value="Morning" ><fmt:message key="motor.quickquote.contactme.form.prefereddate.option.1" bundle="${motorMsg}" /></option>
                                         <option value="Afternoon" ><fmt:message key="motor.quickquote.contactme.form.prefereddate.option.2" bundle="${motorMsg}" /></option>
                                            <option value="Evening" ><fmt:message key="motor.quickquote.contactme.form.prefereddate.option.3" bundle="${motorMsg}" /></option>
                                    </select>
                                    <div class="help-block with-errors"></div>
                                </div>
                                  
                                    </div>
                                </div>
                            </div>
                            <div class="custom-checkbox col-xs-12">
                            <div class="checkbox">
                                <div class="form-group">
                                    <div class="help-block-wrap">
                                        <input type="checkbox" id="agreement" name="agreement" value="" data-required-error="<fmt:message key="motor.error.msg.declaration.empty" bundle="${motorMsg}" />" required>
                                        <label>
                                        <small>
                                                <fmt:message key="motor.quickquote.contactme.form.agreement.part1" bundle="${motorMsg}" /><a href='<fmt:message key="motor.quickquote.contactme.form.agreement.pics.link" bundle="${motorMsg}" />' target="_blank"><fmt:message key="motor.quickquote.contactme.form.agreement.pics.copy" bundle="${motorMsg}" /></a><fmt:message key="motor.quickquote.contactme.form.agreement.part2" bundle="${motorMsg}" />
                                        </small>
                                        </label>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <br/>
                            </div>
                        </div>
                            <div class=" col-xs-4 col-xs-offset-4 text-center">
                            <input type="hidden" name="reason" id="reason" />
                            <a href="javascript:;" id="submitEnquiry" class="bdr-curve btn btn-primary nxt-btn">
                                <fmt:message key="motor.button.submit" bundle="${motorMsg}" />  
                            </a>
                            <br/>
                            <br/>
                        </div>
                        </div>
                        </div>
                        
                   
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/motor/validator.min.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/motor/bootstrap-switch.min.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/motor/selectize.min.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/motor/motor-forms.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/motor/register-form.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/motor/custom-datepicker.js"></script>
<script>
$(document).ready(function(){
	
	$('#declaration').submit(function(event){
	   var isThird;
	   if (getUrlParameter('plan')=='third') {
	 	  isThird = true;
	   } else {
	 	  isThird = false;
	   }
	   
	   alert($('input[name=answer1]').val());
	   
	   var data = { 		
			   "policyId": "26379363",		
			   "motorCareDeclaration":[  		
			      {  		
			         "declarationAns":true,		
			         "declarationNo":"q1"		
			      },		
			      {  		
			         "declarationAns":true,		
			         "declarationNo":"q2"		
			      },		
			      {  		
			         "declarationAns":true,		
			         "declarationNo":"q3"		
			      }		
			   ],		
			   "psNoDM":$('input[name=psNoDM]').val(),		
			   "psNoProvidePersonalData":$('input[name=psNoProvidePersonalData]').val(),		
			   "psPICS":$('input[name=psPICS]').val()	
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
		  url: "/api/iMotor/policy/saving/declarations",
		  success: function(data){
			  
		  	 var $form = $("<form id='quote-form' />");
             if (isThird) {
                 $form.attr("action", "third-party-quote");
             } else {
                 $form.attr("action", "comprehensive-quote");
             }
             $form.attr("method", "post");
             var $quote = $("<input type='hidden' name='data' />");
             $quote.attr("value", JSON.stringify(quote));
             $form.append($quote);
             $("body").append($form);
             $('#quote-form').submit();  
			  
		  },error: function(error) {
			  console.dir(error);
				return false;
		  }
		});
		return false;
	});
});
</script>
       

