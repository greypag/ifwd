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
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/motor/number-polyfill.css" type="text/css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/motor/bootstrap-switch.min.css" type="text/css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/motor/selectize.bootstrap3.css" type="text/css">
<style type="text/css" media="all">
    .bootstrap-switch.bootstrap-switch-wrapper.bootstrap-switch-animate.bootstrap-switch-on{
    background: #ccc;
    }
    .bootstrap-switch.bootstrap-switch-wrapper.bootstrap-switch-animate.bootstrap-switch-on .bootstrap-switch-label{
    border: solid 2px #ccc;
    }
    .no-padding-left{
    padding-left: 0;
    font-size:90%;
    }
        .no-padding-right{
      padding-right: 0;
         font-size:90%;
    }
</style>
<div class="motor-form-wrap motor__wrap--sticky-dropdown">
    <section id="" class="motor-signup-form">
        <!-- Breadcrumb Component Start-->
        <div class="container container-fluid container--breadcrumb">
            <c:set var="breadcrumbItems">
                breadcrumb.item.home,breadcrumb.item.protect,breadcrumb.item.motor,breadcrumb.item.car.details
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
                                    <div class="image-order-status image-order-status-new active img-circle act first">
                                        <span class="status"><fmt:message key="motor.cardetails.page.heading" bundle="${motorMsg}" /></span>
                                        <div class="icon">1</div>
                                    </div>
                                    <div class="image-order-status image-order-status-intransit  img-circle second">
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
                <h1 class="landing_h2 hidden-sm hidden-xs"><fmt:message key="motor.cardetails.car.title" bundle="${motorMsg}" /></h1>
                <!--end-desktop--> 
                <!--Mobile-->
                <h1 class="landing_h2 hidden-lg hidden-md feature-ttl"><fmt:message key="motor.cardetails.car.title" bundle="${motorMsg}" /></h1>
                <h1 class="landing_h3 hidden-lg hidden-md feature-ttl"><fmt:message key="motor.cardetails.car.title" bundle="${motorMsg}" /></h1>
                <!--end mobile--> 
            </div>
        </div>
            <!--  <div id="motor_registerForm">-->
            <form id="carDetails" name="" method="post">
                <div class="container">
                    <div class="row">
                        <div class="col-md-8 col-md-offset-2 col-sm-12">
                            <div class="row">
                                <div class="col-sm-6" id="chassisNumberDiv">
                                    <div class="form-group">
                                        <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
	                                            <div class="help-block-wrap">
	                                                <a class="motor-tooltip" data-toggle="tooltip" data-html="true" title="<img src='<%=request.getContextPath()%>/resources/images/motor/Car_details_registration_demo_chasis_no_Cc.jpg' />">
	                                                    <i class="fa fa-exclamation-circle" aria-hidden="true"></i>
	                                                </a>
	                                                <input type="text" name="chassisNumber" minlength="3" maxlength="30" pattern="^.{3,}$" class="form-control input--grey mdl-textfield__input" id="chassisNumber" required data-required-error='<fmt:message key="motor.error.msg.chassis.empty" bundle="${motorMsg}" />' data-error='<fmt:message key="motor.error.msg.chassis.format" bundle="${motorMsg}" />'>
	                                                <label class="mdl-textfield__label" for="chassisNumber"><fmt:message key="motor.cardetails.car.chassisno" bundle="${motorMsg}" /></label>
	                                                <div class="help-block with-errors"></div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="col-sm-6" id="cubicCapacityDiv">
	                                    <div class="form-group">
	                                        <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
	                                            <div class="help-block-wrap">
	                                                <a class="motor-tooltip" data-toggle="tooltip" data-html="true" title="<img src='<%=request.getContextPath()%>/resources/images/motor/Car_details_registration_demo_chasis_no_Cc.jpg' />">
	                                                    <i class="fa fa-exclamation-circle" aria-hidden="true"></i>
	                                                </a>
	                                                <input type="number" name="cubicCapacity" class="form-control input--grey mdl-textfield__input" id="cubicCapacity" pattern="^[0-9]*$" required data-required-error='<fmt:message key="motor.error.msg.cc.empty" bundle="${motorMsg}" />' data-error='<fmt:message key="motor.error.msg.cc.format" bundle="${motorMsg}" />'>
	                                                <label class="mdl-textfield__label" for="cubicCapacity"><fmt:message key="motor.cardetails.car.cubiccap" bundle="${motorMsg}" /></label>
	                                                <div class="help-block with-errors"></div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="col-sm-12">
	                                    <div class="form-group">
	                                        <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
	                                            <div class="help-block-wrap">
	                                                <a class="motor-tooltip" data-toggle="tooltip" data-html="true" title="<img src='<%=request.getContextPath()%>/resources/images/motor/Car_details_registration_demo_car_make.jpg' />">
	                                                    <i class="fa fa-exclamation-circle" aria-hidden="true"></i>
	                                                </a>
	                                                <input type="text" name="registedModel" pattern="^.{3,}$"  data-pattern-error='<fmt:message key="motor.error.msg.makemodel.format" bundle="${motorMsg}" />' minlength="3" maxlength="50" class="form-control input--grey mdl-textfield__input" id="registedModel" required data-required-error='<fmt:message key="motor.error.msg.makemodel.empty" bundle="${motorMsg}" />' data-error='<fmt:message key="motor.error.msg.makemodel.general" bundle="${motorMsg}" />'>
	                                                <label class="mdl-textfield__label" for="registedModel"><fmt:message key="motor.cardetails.car.model" bundle="${motorMsg}" /></label>
	                                                <div class="help-block with-errors"></div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	                <div class="container bankMortgage">
	                    <div id="testimonials">
	                        <div class="center" > 
	                            <!--desktop-->
	                            <h1 class="landing_h2 hidden-sm hidden-xs"><fmt:message key="motor.cardetails.mortgage.title" bundle="${motorMsg}" /></h1>
	                            <!--end-desktop--> 
	                            <!--Mobile-->
	                            <h1 class="landing_h2 hidden-lg hidden-md feature-ttl"><fmt:message key="motor.cardetails.mortgage.title" bundle="${motorMsg}" /></h1>
	                            <!--end mobile--> 
	                        </div>
	                        <div class="row">
	                            <div class="col-md-8 col-md-offset-2 col-sm-12">
	                                <div class="form-group row">
	                                    <div class="col-xs-6 col-sm-6 no-padding-right">
	                                        <fmt:message key="motor.cardetails.mortgage.question" bundle="${motorMsg}" />
	                                    </div>
	                                    <div class="col-xs-6 col-sm-6 no-padding-left text-right">
	                                        <span class="switch-light sly"><fmt:message key="motor.button.yes" bundle="${motorMsg}" />&nbsp;</span>
	                                        <input type="checkbox" class="toggleCheck" name="bankMortgage" style="display:none">
	                                        <span class="switch-light sln">&nbsp;<fmt:message key="motor.button.no" bundle="${motorMsg}" /></span>
	                                    </div>
	                                </div>
	                                <div class="mortgageBank hidden">
	                                    <div class="form-group">
	                                        <div class="help-block-wrap">
	                                            <select class="form-control" id="mortgageBank" name="mortgageBank" data-required-error='<fmt:message key="motor.error.msg.mortgagebank.empty" bundle="${motorMsg}"/>'>
	                                                <option value="" disabled selected hidden><fmt:message key="motor.cardetails.mortgage.hire" bundle="${motorMsg}" /></option>
	                                            </select>                         
	                                            <label class="mdl-textfield__label label-mortgageBank hidden" for="mortgageBank" ><fmt:message key="motor.cardetails.mortgage.hire" bundle="${motorMsg}" /></label>
	                                            <div class="help-block with-errors"></div>
	                                        </div>
	                                    </div>
	                                    <div class="form-group" id="bankNameHandle">
	                                        <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
	                                            <div class="help-block-wrap">
	                                                <input type="text" name="bankName" minlength="3" maxlength="50" class="form-control input--grey mdl-textfield__input" id="bankName" data-required-error='<fmt:message key="motor.error.msg.mortgagebank.format" bundle="${motorMsg}" />' data-error='<fmt:message key="motor.error.msg.mortgagebank.invalid" bundle="${motorMsg}" />'>
	                                                <label class="mdl-textfield__label" for="bankName"><fmt:message key="motor.cardetails.mortgage.bank" bundle="${motorMsg}" /></label>
	                                                <div class="help-block with-errors"></div>
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
	                                <br /> <br />
	                                <a class="bdr-curve btn btn-primary nxt-btn" onclick="perventRedirect=false;BackMe();"><fmt:message key="motor.button.back" bundle="${motorMsg}" /> </a>
	                                <br/>
	                            </div>
	                            <div class="text-center col-xs-6">
	                                <br /> <br />
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
	                                <!--  <a href="#" id="saveForm" class=""><fmt:message key="motor.link.text.savecontinuelater" bundle="${motorMsg}" /></a>
	                            --></div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </form>
       <!-- </div> --> 
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
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/motor/validator.min.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/vendor/bootstrapValidator.min.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/motor/number-polyfill.min.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/motor/bootstrap-switch.min.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/motor/selectize.min.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/motor/motor-forms.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/motor/motor-api.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/motor/register-form.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/motor/custom-datepicker.js"></script>
<script type="text/javascript">
$('input[name=cubicCapacity]').inputNumber();

var ccCheck = $('#cubicCapacityDiv').find('.left-desktop');
var ccField= $('input[name=cubicCapacity]');

ccField.keyup(function(e){
	if (navigator.appName == 'Microsoft Internet Explorer' ||  !!(navigator.userAgent.match(/Trident/) || navigator.userAgent.match(/rv 11/)) || (typeof $.browser !== "undefined" && $.browser.msie == 1))
	{
		 if ( e.which < 96 ) {
			    if ( e.which < 48 || e.which > 57 ) {
			    	e.stopPropagation();
			    	var strng = $(this).val();
			    	$(this).val(strng.substring(0,strng.length-1));
			  	
			    }
			    else{
			     	if($(this).val() > 9999){
			        	$(this).val(9999);
			      	  $(this).blur().focus();
			    	}
			    }
			}
	}
	if($(this).val() > 9999){
    	$(this).val(9999);
  	  $(this).blur().focus();
	}
	 
		if(ccCheck.hasClass('is-invalid')){
			if(ccCheck.hasClass('is-dirty')){
				
			}
			else{
				$(this).val("");
			}
		}

	});
/*
ccField.keyup(function(e) {
	
});
*/
var checkbox=false;
var quote = jQuery.parseJSON('<%=request.getParameter("data")!=null?StringEscapeUtils.escapeEcmaScript(StringEscapeUtils.unescapeHtml4(request.getParameter("data"))):"{}"%>');

/* 
 *  Define motor success login callback
 */
 var tempquote="";
 var loginStatus=false;
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
 function callback_motor_LoginSuccess(){
 	//alert('Login success. Call Save later API.');
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
		if($('input[name=bankMortgage]:checked').length>0)
			checkbox = true;
	
		  var submitData = {"carDetail": {   	
			   "bankMortgage": checkbox,	
			   "bankMortgageName": $('[name="mortgageBank"]').val()!="OTHER"?$('[name="mortgageBank"]').val():$('input[name=bankName]').val(),//$("#mortgageBank option:selected").val(),	
			   "chassisNumber": $('input[name=chassisNumber]').val(),    	
			   "engineCapacity": $('input[name=cubicCapacity]').val(),   	
			   "modelDesc": $('input[name=registedModel]').val()    	
				}, 	
				"policyId": quote.policyId
				};

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
			     url:context + "/api/iMotor/policy/save4Later/carDetails",
				  success: function(data){
					  console.dir(data);
					  $('#saveModal').modal("hide");
					  location.assign(context);
				  },error: function(error) {
					  console.dir(error);				
					 $("#system-error").removeClass("hide");
			         $("#loading-overlay").modal("hide");
			        // location.assign(context);
				  }
				});
	});
}

function BackMe() {
	 var $form = $("<form id='quote-form' />");
    	 $form.attr("action", "rider-options?back=yes");
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
	/*try to overwrite the fwd function
	$('[name=bankName]').on('keyup keydown keypress',function(e){
		e.preventDefault();
		e.stopPropagation();
		alert();
	});
	*/
	$(".motor-signup-form input").css({"text-transform":"uppercase"});
	//console.log(quote.carDetail);
	 
	var eCarApi = context + '/api/iMotor/carDetails/' + quote.carDetail.makeCode + "/supplement" + "?carModel=" + quote.carDetail.model; 
        	$.ajax({
        		  url: eCarApi,
        		  contentType: "application/json",
        		  type: 'GET',
        		  dataType: "json",
        		  success: function(data) {
        	            if(data.electricCar){ //true
        	            	$('#cubicCapacityDiv').remove();
        	        		$('#chassisNumberDiv').toggleClass('col-sm-6 col-sm-12');
        	        		$('#carDetails').validator('update'); 
        	            }
        		  }
        	});
	
	var min_a = quote.carDetail.engineCapacity;
	//console.log(min_a);
	if(min_a <= 1650){
		$('#cubicCapacity').attr("max",1650);
	}
	else
	if(min_a > 3500){
		$('#cubicCapacity').attr("min",3501);
	}
	else
		{
		$('#cubicCapacity').attr("min",1651);
		$('#cubicCapacity').attr("max",3500);
		}
	/*end cc validation*/
	
	 
	
    $('[data-toggle="tooltip"]').tooltip(); 
 
    
    if(getUrlParameter("edit")=="yes" || getUrlParameter("back")=="yes" )
    {	
	    $('input[name=chassisNumber]').val(quote.carDetail.chassisNumber);    
		$('input[name=cubicCapacity]').val(quote.carDetail.engineCapacity);
		$('input[name=registedModel]').val(quote.carDetail.modelDesc);
		$("#bankNameHandle").addClass("hidden");
		/*if(quote.carDetail.bankMortgage ==false)
			$('[name="bankMortgage"]').bootstrapSwitch('state',false);
		else
		{	
			$('[name="bankMortgage"]').bootstrapSwitch('state',true);
			$mortgageBank[0].selectize.setValue("OTHER");
			$('#motor_registerForm').validator('update');
			$("input[name=bankName]").prop('required',false);
			$("#bankNameHandle").removeClass("hidden");
			$('#bankName').val(quote.carDetail.bankMortgageName);
		}*/
	}
    else
   	 if($('[name="mortgageBank"]').val()!="others")
    	$("#bankNameHandle").addClass("hidden");
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
    
	/* 
	 *  Save later login check
	 */
	$('#motor-save-submit').click(function(){

		// Check if user is logged in
		$.ajax({
			url:fwdApi.url.session,
			type:"get",
			contentType: "application/json",
			cache:false,
			async:false,
		    error:function (xhr, textStatus, errorThrown){
		        
		        /* Error denotes system error */

		        if(xhr.status == 404){		        
		        	/* TO DO - Show errors */
		        } else {
		        	/* TO DO - Show errors */
		        }
		    },
		    success:function(response){
		    	if(response){
		    		if(response.userName == '*DIRECTGI'){
		    			/* Show Login Popup */
		    			$('#saveModal').modal('hide'); // hide save modal
		    			$('.login-btn').trigger('click');
		    		} else {
		    			$('#saveModal').modal("show");
		    			/* Call Save later API */
		    		}		    		
		    	}
		    }
		});

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
     
	$('#carDetails').validator({disable: false}).on('submit', function (e) {
		$("#system-error").addClass("hide");
		
		if (!e.isDefaultPrevented()) {
			$(".motor-signup-form input").val(function(i,val) {
		        return val.toUpperCase();
		    });
			if($('input[name=bankMortgage]:checked').length>0)
				checkbox = true;
		   var cccc="";
	
		   if(typeof $('input[name=cubicCapacity]').val()!="undefined")
			   cccc = $('input[name=cubicCapacity]').val();
		
		   var submitData = {"carDetail": {   	
					   "bankMortgage": checkbox,	
					   "bankMortgageName": $('[name="mortgageBank"]').val()!="OTHER"?$('[name="mortgageBank"]').val():$('input[name=bankName]').val(),//$("#mortgageBank option:selected").val(),	
					   "chassisNumber": $('input[name=chassisNumber]').val(),    	
					   "engineCapacity": cccc,   	
					   "modelDesc": $('input[name=registedModel]').val(),
					   "makeCode": quote.carDetail.makeCode, 
					   "model": quote.carDetail.model
						}, 	
						"policyId": quote.policyId
						};
	
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
	          url:context + "/api/iMotor/policy/saving/carDetails",
			  success: function(data){
				  var $form = $("<form id='quote-form' />");
				  if(getUrlParameter("edit")=="yes" || getUrlParameter("back")=="yes")
	              	$form.attr("action", "drivers-details?edit=yes");
				  else
					  $form.attr("action", "drivers-details");  
	              $form.attr("method", "post");
	              var $quote = $("<input type='hidden' name='data' />");
	              var opts = {};
	              opts = $.extend(opts,quote, submitData);
	              opts=  $.extend(opts,{"carDetail": $.extend(quote.carDetail, submitData.carDetail)});
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
       


