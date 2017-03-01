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
                breadcrumb.item.home,breadcrumb.item.protect,breadcrumb.item.motor,breadcrumb.item.declarations
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
                                        <span class="status"><fmt:message key="motor.declarations.page.heading" bundle="${motorMsg}" /></span>
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
                    <h1 class="landing_h2 hidden-sm hidden-xs"><fmt:message key="motor.declarations.questions.heading" bundle="${motorMsg}" /></h1>
                    <!--end-desktop--> 
                    <!--Mobile-->
                    <h1 class="landing_h2 hidden-lg hidden-md feature-ttl"><fmt:message key="motor.declarations.questions.heading" bundle="${motorMsg}" /></h1>
                    <!--end mobile--> 
                </div>
            </div>
            <div id="motor_registerForm">
	        <form class="form-inline" id="declaration" method="post">
	            <div class="container">
	                <div class="row">
	                    <div class="col-xs-12 qusetion1">
	                        <div class="panel panel-default question">
	                            <div class="panel-heading">
	                                <h3 class="panel-title"><fmt:message key="motor.declarations.questions.1.heading" bundle="${motorMsg}" /></h3>
	                            </div>
	                            <div class="panel-body">
	                                <div class="row">
	                                    <div class="col-sm-8">
	                                        <p>
	                                            <fmt:message key="motor.declarations.questions.1.copy" bundle="${motorMsg}" />	                                            
	                                        </p>
	                                        <ul>
                                                <li><fmt:message key="motor.declarations.questions.1.li.part1" bundle="${motorMsg}" /></li>
                                                <li><fmt:message key="motor.declarations.questions.1.li.part2" bundle="${motorMsg}" /></li>
                                                <li><fmt:message key="motor.declarations.questions.1.li.part3" bundle="${motorMsg}" /></li>
                                                <li><fmt:message key="motor.declarations.questions.1.li.part4" bundle="${motorMsg}" /></li>
                                            </ul>
	                                    </div>
	                                    <div class="col-sm-4 text-center custom-radio">
		                                    <div class="form-group">
	                                            <div class="help-block-wrap">
	                                        <div class="radio text-center a1yes">
	                                            <input type="radio" name="answer1" id="a1yes" value="true" required data-required-error='<fmt:message key="motor.error.msg.declarationq.error.empty" bundle="${motorMsg}" />'>
	                                            <label class="" for="yes">
	                                                <span class=""><fmt:message key="motor.button.yes" bundle="${motorMsg}" /></span>
	                                            </label>
	                                        </div>
	                                        <div class="radio text-center a1no">
	                                            <input type="radio" name="answer1" id="a1no" value="false" required data-required-error='<fmt:message key="motor.error.msg.declarationq.error.empty" bundle="${motorMsg}" />'>
	                                            <label class="" for="no">
	                                                <span class=""><fmt:message key="motor.button.no" bundle="${motorMsg}" /></span>
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
	                                <h3 class="panel-title"><fmt:message key="motor.declarations.questions.2.heading" bundle="${motorMsg}" /></h3>
	                            </div>
	                            <div class="panel-body">
	                                <div class="row">
	                                    <div class="col-sm-8">
	                                        <p>
	                                            <fmt:message key="motor.declarations.questions.2.copy" bundle="${motorMsg}" />
	                                        </p>
	                                    </div>
	                                    <div class="col-sm-4 text-center custom-radio">
		                                    <div class="form-group">
	                                            <div class="help-block-wrap">
	                                        <div class="radio text-center a2yes">
	                                            <input type="radio" name="answer2" id="a2yes" value="true" required data-required-error='<fmt:message key="motor.error.msg.declarationq.error.empty" bundle="${motorMsg}" />'>
	                                            <label class="" for="yes">
	                                                <span class=""><fmt:message key="motor.button.yes" bundle="${motorMsg}" /></span>
	                                            </label>
	                                        </div>
	                                        <div class="radio text-center a2no">
	                                            <input type="radio" name="answer2" id="a2no" value="false" required data-required-error='<fmt:message key="motor.error.msg.declarationq.error.empty" bundle="${motorMsg}" />'>
	                                            <label class="" for="no">
	                                                <span class=""><fmt:message key="motor.button.no" bundle="${motorMsg}" /></span>
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
	                                <h3 class="panel-title"><fmt:message key="motor.declarations.questions.3.heading" bundle="${motorMsg}" /></h3>
	                            </div>
	                            <div class="panel-body">
	                                <div class="row">
	                                    <div class="col-sm-8">
	                                        <p>
	                                            <fmt:message key="motor.declarations.questions.3.copy" bundle="${motorMsg}" /> 
	                                        </p>
	                                    </div>
	                                    <div class="col-sm-4 text-center custom-radio">
	                                    <div class="form-group">
                                            <div class="help-block-wrap">
	                                        <div class="radio text-center a3yes">
	                                            <input type="radio" name="answer3" id="a3yes" value="true" required data-required-error='<fmt:message key="motor.error.msg.declarationq.error.empty" bundle="${motorMsg}" />'>
	                                            <label class="" for="yes">
	                                                <span class=""><fmt:message key="motor.button.yes" bundle="${motorMsg}" /></span>
	                                            </label>
	                                        </div>
	                                        <div class="radio text-center a3no">
	                                            <input type="radio" name="answer3" id="a3no" value="false" required data-required-error='<fmt:message key="motor.error.msg.declarationq.error.empty" bundle="${motorMsg}" />'> 
	                                            <label class="" for="no">
	                                                <span class=""><fmt:message key="motor.button.no" bundle="${motorMsg}" /></span>
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
	                                <h1 class="landing_h2 hidden-sm hidden-xs"><fmt:message key="motor.declarations.declaration.title" bundle="${motorMsg}" /></h1>
	                                <h1 class="landing_h2 hidden-lg hidden-md feature-ttl"><fmt:message key="motor.declarations.declaration.title" bundle="${motorMsg}" /></h1>
	                            </div>
	                        </div>
	                        <div class="clearfix"></div>
	                        <div class="col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 statement">
								<div class="custom-checkbox">
	                                <div class="checkbox">
	                                    <div class="form-group">
	                                        <div class="help-block-wrap">
	                                            <input  type="checkbox" id="psDEC" name="psDEC" value="" required data-required-error='<fmt:message key="motor.declarations.declaration.error1" bundle="${motorMsg}" />'>
	                                            <label>
													<small>
														<fmt:message key="motor.declarations.declaration.checkboxcontent.1" bundle="${motorMsg}" />
														<a target="_blank" href="<fmt:message key="motor.declarations.declaration.checkboxcontent.link" bundle="${motorMsg}" />">
														<fmt:message key="motor.declarations.declaration.chceckboxcontent.2" bundle="${motorMsg}" /></a>
														<fmt:message key="motor.declarations.declaration.checkboxcontent.3" bundle="${motorMsg}"/><br/>
														<fmt:message key="motor.declarations.declaration.checkbox.point1" bundle="${motorMsg}"/><br/>
														<fmt:message key="motor.declarations.declaration.checkbobx.point2" bundle="${motorMsg}"/><br/>
														<fmt:message key="motor.declarations.declaration.checkbobx.point3" bundle="${motorMsg}"/><br/>
													</small>
	                                            </label>
	                                            <div class="help-block with-errors"></div>
	                                        </div>
	                                    </div>
	                                    <br/>
	                                    <br/>
	                                </div>
	                            </div>
	                        </div>
	                        <div class="col-xs-12">
	                            <div class="center" > 
	                                <h1 class="landing_h2 hidden-sm hidden-xs"><fmt:message key="motor.declarations.privacy.policy" bundle="${motorMsg}" /></h1>
	                                <h1 class="landing_h2 hidden-lg hidden-md feature-ttl"><fmt:message key="motor.declarations.privacy.policy" bundle="${motorMsg}" /></h1>
	                            </div>
	                        </div>
	                        <div class="clearfix"></div>
	                        <div class="col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 statement">
										<p><fmt:message key="motor.declarations.privacy.policy.statement.1" bundle="${motorMsg}" /></p>
	                            <div class="custom-checkbox">
	                                <div class="checkbox">
	                                    <div class="form-group">
	                                        <div class="help-block-wrap">
	                                            <input  type="checkbox" id="psPICS" name="psPICS" value="" required data-required-error='<fmt:message key="motor.declarations.privacy.policy.error1" bundle="${motorMsg}" />'>
	                                            <label>
																	<small>
																		<fmt:message key="motor.declarations.privacy.policy.q1" bundle="${motorMsg}" /><a target="_blank" href="<fmt:message key="motor.declarations.privacy.policy.q1.url" bundle="${motorMsg}" />"><fmt:message key="motor.declarations.privacy.policy.q1.body" bundle="${motorMsg}" /></a><fmt:message key="motor.declarations.privacy.policy.q1.tail" bundle="${motorMsg}" />
																	</small>
	                                            </label>
	                                            <div class="help-block with-errors"></div>
	                                        </div>
	                                    </div>
	                                    <br/>
	                                    <br/>
	                                </div>
	                            </div>
										<p><fmt:message key="motor.declarations.privacy.policy.statement.2" bundle="${motorMsg}" /></p>
	                            <div class="custom-checkbox">
	                                <div class="checkbox">
	                                    <div class="form-group">
	                                        <div class="help-block-wrap">
	                                            <input  type="checkbox" id="psNoDM" name="psNoDM" value="" data-required-error='<fmt:message key="motor.declarations.privacy.policy.error2" bundle="${motorMsg}" />'>
	                                            <label><small>
	                                                    <fmt:message key="motor.declarations.privacy.policy.q2" bundle="${motorMsg}" /></small>
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
	                                            <input  type="checkbox" id="psNoProvidePersonalData" name="psNoProvidePersonalData" value=""  data-required-error='<fmt:message key="motor.declarations.privacy.policy.error3" bundle="${motorMsg}" />'>
	                                            <label><small>
	                                                    <fmt:message key="motor.declarations.privacy.policy.q3" bundle="${motorMsg}" /></small>
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
	                                        <a class="bdr-curve btn btn-primary nxt-btn" onclick="perventRedirect=false;BackMe();"><fmt:message key="motor.button.back" bundle="${motorMsg}" /> </a>
	                                        <br/>
	                                    </div>
	                                    <div class="text-center col-xs-6">
	                                        <br />
	                                <input type="submit" class="bdr-curve btn btn-primary nxt-btn" value="<fmt:message key="motor.button.next" bundle="${motorMsg}" />" />
	                                        <br/>
	                                    </div>
	                                    <div class="clearfix"></div>
										<div class="text-center has-error hide" id="system-error">
										<br/>
										<span class="help-block"><fmt:message key="motor.error.msg.serversystem.error" bundle="${motorMsg}" /></span>
										</div>
	                                    <div class="clearfix"></div > 
	                            <div class="text-center save">
	                                <!--<a href="#" id="saveForm" class=""><fmt:message key="motor.link.text.savecontinuelater" bundle="${motorMsg}" /></a>
	                             --></div>
	                                </div>
	                            </div>
	                        </div>
	
	                    </div>
	                </div>
	        </form>
        </div>
    </section>
    <!--<section class="yourQuote">
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
                            <fmt:message key="motor.quickquote.contanctme.reference.title" bundle="${motorMsg}" /> 
                                </p><h3 class="heading-h3 color-orange ref-number">
	                                <span id="quote-num"></span>
	                            </h3>
	                            <br>
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
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/vendor/bootstrapValidator.min.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/motor/bootstrap-switch.min.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/motor/selectize.min.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/motor/motor-forms.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/motor/motor-api.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/motor/register-form.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/motor/custom-datepicker.js"></script>
<script type="text/javascript">
var quote = jQuery.parseJSON('<%=request.getParameter("data")!=null?StringEscapeUtils.escapeEcmaScript(StringEscapeUtils.unescapeHtml4(request.getParameter("data"))):"{}"%>');
/* 
 *  Define motor success login callback
 */
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
		    	//tempquote = response.motorCareDetails;
		    	//$('#saveModal').modal("show");
		    }
		});
}
function SaveAndExit()
{
	$("#system-error").addClass("hide");
	if($('[value="yes"]:checked').length){
        $("#reasonMsg").text("choice 3");
        $("#contactpopup").modal('show');
        return false;
	 }else
	    	{
	var submitData = { 		
		   "policyId": quote.policyId,		
		   "motorCareDeclaration":[  		
		      {  		
		         "declarationAns":$("input[name=answer1]:checked").val(),		
		         "declarationNo":"q1"		
		      },		
		      {  		
		         "declarationAns":$("input[name=answer2]:checked").val(),		
		         "declarationNo":"q2"		
		      },		
		      {  		
		         "declarationAns":$("input[name=answer3]:checked").val(),		
		         "declarationNo":"q3"		
		      }		
		   ],		
		   "psNoDM":$('input[name=psNoDM]').val(),		
		   "psNoProvidePersonalData":$('input[name=psNoProvidePersonalData]').val(),		
		   "psPICS":$('input[name=psPICS]').val()	
				};
	console.dir(submitData);
	
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
	  url: context + "/api/iMotor/policy/save4Later/declarations",
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
	    	}
}
function BackMe() {
	 var $form = $("<form id='quote-form' />");
    	 $form.attr("action", "policy-details?back=yes");
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
		410: 'Fail to complete underwriting question(s).',
		422: 'Invalid information (code: 422)',
		504: 'Invalid information (code: 504)',
	},
	cnErr ={
		404: '資料不正確(編號：404)',
		410: '您未能通過核保問題。',
		422: '資料不正確(編號：422)',
		504: '資料不正確(編號：504)',               
	};
$(document).ready(function(){
	$("#quote-num").html(quote.refNumber);
	$(".motor-signup-form input").css({"text-transform":"uppercase"});
	//enable the Next Button
	   $('#declaration').validator({
		   custom: {
		   equals: function($el) {
			   
			  }
		   },
		   disable: false
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
    
    if(getUrlParameter("edit")=="yes" || getUrlParameter("back")=="yes")
    {  
    	if(typeof quote.motorCareDeclaration != 'undefined' && quote.motorCareDeclaration != null )
    	{

	    	if(quote.motorCareDeclaration[0].declarationAns==false || quote.motorCareDeclaration[0].declarationAns=="false")
	    	{$(".a1no").addClass("active");$('input[name=answer1]').prop("checked",true);	}
	    	else
	    	{$(".a1yes").addClass("active");$('input[name=answer1]').prop("checked",true);	}
	    	if(quote.motorCareDeclaration[1].declarationAns==false || quote.motorCareDeclaration[1].declarationAns=="false")
	    	{$(".a2no").addClass("active");$('input[name=answer2]').prop("checked",true);	}
	    	else
	    	{$(".a2yes").addClass("active");$('input[name=answer2]').prop("checked",true);	}
	    	if(quote.motorCareDeclaration[2].declarationAns==false || quote.motorCareDeclaration[2].declarationAns=="false")
	    	{$(".a3no").addClass("active");$('input[name=answer3]').prop("checked",true);	}
	    	else
	    	{$(".a3yes").addClass("active");$('input[name=answer3]').prop("checked",true);	}
	    	
	    	
	    	if(quote.psNoDM == "" || quote.psNoDM == "false")
	    	{	$('input[name=psNoDM]').prop("checked",false);$('input[name=psNoDM]').val(false);}	
	    	else
	    	{	$('input[name=psNoDM]').prop("checked",true);$('input[name=psNoDM]').val(true);}	
	    	
	    	if(quote.psNoProvidePersonalData == "" || quote.psNoProvidePersonalData == "false")
	    	{	$('input[name=psNoProvidePersonalData]').prop("checked",false);	$('input[name=psNoProvidePersonalData]').val(false);}	
	    	else
	    	{	$('input[name=psNoProvidePersonalData]').prop("checked",true);	$('input[name=psNoProvidePersonalData]').val(true);}	
	    		
			if(quote.psPICS == "" || quote.psPICS == "false")
			{	$('input[name=psPICS]').prop("checked",false);	$('input[name=psPICS]').val(false);}	
	    	else
	    	{	$('input[name=psPICS]').prop("checked",true);$('input[name=psPICS]').val(true);}	
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
	    			    url:context + "/api/iMotor/policy/save4Later/resume",
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
	     
	$('#declaration').validator().on('submit', function (e) {
		$("#system-error").addClass("hide");
		  if (e.isDefaultPrevented()) {
		  	
		  }
		  else
		  {
			 if($('#a1yes').is(":checked") ==true || $('#a2yes').is(":checked")==true || $('#a3yes').is(":checked") ==true){
				 	if(chin)
	              		$("#reasonMsg").text(cnErr[410]);
	              	else
	              		$("#reasonMsg").text(enErr[410]);
		            $("#contactpopup").modal('show');
		            return false;
		     }else
		        	{
		    	 
		    if(typeof $('input[name=psNoProvidePersonalData]').val() == "underfined")
		    	$('input[name=psNoProvidePersonalData]').val() = false; 
		    
		    if(typeof $('input[name=psPICS]').val() == "underfined")
		    	$('input[name=psPICS]').val() = false; 	
		    	
			var submitData = { 		
				   "policyId": quote.policyId,		
				   "motorCareDeclaration":[  		
				      {  		
				         "declarationAns":$("input[name=answer1]:checked").val(),		
				         "declarationNo":"q1"		
				      },		
				      {  		
				         "declarationAns":$("input[name=answer2]:checked").val(),		
				         "declarationNo":"q2"		
				      },		
				      {  		
				         "declarationAns":$("input[name=answer3]:checked").val(),		
				         "declarationNo":"q3"		
				      }		
				   ],		
				   "psNoDM":$('input[name=psNoDM]').val(),		
				   "psNoProvidePersonalData":$('input[name=psNoProvidePersonalData]').val(),		
				   "psPICS":$('input[name=psPICS]').val()	
		   			};
			console.dir(submitData);
			
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
			  url: context + "/api/iMotor/policy/saving/declarations",
			  success: function(data){
				  var $form = $("<form id='quote-form' />");
				  if(getUrlParameter("edit")=="yes" || getUrlParameter("back")=="yes")
				  	$form.attr("action", "application-summary?edit=yes");
				  else
					$form.attr("action", "application-summary");
	              $form.attr("method", "post");
	              var $quote = $("<input type='hidden' name='data' />");
		          var opts = {};
		          quote.token = data.token;	          
		          opts = $.extend(opts,quote, submitData);
	              $quote.attr("value", JSON.stringify(opts));
	              $form.append($quote);
	              $("body").append($form);
	              $('#quote-form').submit();         
			  },error: function(xhr, textStatus, errorThrown) {

				  $('#reason').attr('value', xhr.status);
	          
	              if (xhr.status == 410) {
	              	if(chin)
	              		$("#reasonMsg").text(cnErr[410]);
	              	else
	              		$("#reasonMsg").text(enErr[410]);
	                  $("#contactpopup").modal('show');
	                  console.log(xhr.status, textStatus, errorThrown);
	              }else			  
					 {
	            	  if(chin)
	            		  $("#system-error").find('.help-block').html(cnErr[xhr.status]);
		             	 else
					  		$("#system-error").find('.help-block').html(enErr[xhr.status]);
		            	 $("#system-error").removeClass("hide");
				 }
	              $("#loading-overlay").modal("hide");
				  return false;
			  }
			});
		  }
		return false;
	        	}
	});
	 function updateTotalDue(amt){
	        $('#yourQuotePrice').html(formatCurrency(amt));
	        $('#yourQuoteAmmount').html(formatCurrency(amt));
	    }
});
</script>
       

