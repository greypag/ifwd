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
<style>
 @media all and (-ms-high-contrast:none)
     {
     .quick-quote form.add-on .checkbox label::after { left: auto; } /* IE10 */
     *::-ms-backdrop, .quick-quote form.add-on .checkbox label::after { left: auto;} /* IE11 */
     }

.quick-quote .thumbnail > img, .quick-quote .thumbnail a > img{
max-width: 90px;
}

</style>

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css_dir/motor-styles.css" type="text/css">

<div class="motor-form-wrap quick-quote">
<section id="" class="motor-select-plan">
    
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
        <div class="center" > 
            <!--desktop-->
            <h1 class="landing_h2 text-left hidden-sm hidden-xs"><fmt:message key="motor.quickquote.page.heading" bundle="${motorMsg}" /></h1>
            <!--end-desktop--> 
            <!--Mobile-->
            <h1 class="landing_h2 text-left hidden-lg hidden-md feature-ttl"><fmt:message key="motor.quickquote.page.heading" bundle="${motorMsg}" /></h1>
            <!--end mobile--> 
        </div>
    </div>
    <!--/.container--> 
     <form id="form-inline" class="form-inline add-on" name="" method="post" data-toggle="validator" >
        <div class="container select-plan-main">
            <div id="testimonials">
                <div class="row planbox-wrapper">
                    <div class="col-sm-6 plan-panel">
                        <div class="white-color">
                            <div class="row">
                                <div class="col-xs-2 col-sm-3">
                                    <div class="thumbnail">
                                        <img src="<%=request.getContextPath()%>/resources/images/motor/personal-acc.png" alt="" />
                                    </div>
                                </div>
                                <a class="col-xs-10 col-sm-9 collapse-addon" role="button" data-toggle="collapse" href="#addOn1" aria-expanded="false" aria-controls="addOn1">
                                    <h3><fmt:message key="motor.quickquote.addon.1.title" bundle="${motorMsg}" /></h3>
                                    <p><fmt:message key="motor.quickquote.addon.1.feature" bundle="${motorMsg}" /></p>
                                </a>
                                <div class="col-xs-12 text-center">
                                    <div class="price">
                                        <big>
                                            +
                                            <fmt:message key="motor.label.currency.front" bundle="${motorMsg}" />
                                            <span id="addOnPaAmt"></span>
                                            <fmt:message key="motor.label.currency.behind" bundle="${motorMsg}" />
                                        </big>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                                <div class="col-xs-12 text-center collapse" id="addOn1">
                                    <p class="addOn-content">
                                        <fmt:message key="motor.quickquote.addon.1.copy" bundle="${motorMsg}" />
                                        <br />
                                        <br />
                                    </p>
                                </div>
                                <div class="clearfix"></div>
                                <div class="col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 text-center">
                                    <div class="custom-checkbox">
                                        <div class="checkbox" id="addOnPaAmtClick">
                                            <input type="checkbox" name="addon1" value="addon1">
                                            <label></label>
                                            <br/>
                                            <br/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 plan-panel">
                        <div class="white-color">
                            <div class="row">
                                <div class="col-xs-2 col-sm-3">
                                    <div class="thumbnail">
                                        <img src="<%=request.getContextPath()%>/resources/images/motor/Benefits.png" alt="" />
                                    </div>
                                </div>
                                <a class="col-xs-10 col-sm-9 collapse-addon" role="button" data-toggle="collapse" href="#addOn2" aria-expanded="false" aria-controls="addOn2">
                                    <h3><fmt:message key="motor.quickquote.addon.2.title" bundle="${motorMsg}" /></h3>
                                    <p><fmt:message key="motor.quickquote.addon.2.feature" bundle="${motorMsg}" /></p>
                                </a>
                                <div class="col-xs-12 text-center">
                                    <div class="price">
                                        <big>
                                            +
                                            <fmt:message key="motor.label.currency.front" bundle="${motorMsg}" />
                                            <span id="addOnTppdAmt"></span>
                                            <fmt:message key="motor.label.currency.behind" bundle="${motorMsg}" />
                                        </big>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                                <div class="col-xs-12 text-center collapse" id="addOn2">
                                    <p class="addOn-content">
                                        <fmt:message key="motor.quickquote.addon.2.copy" bundle="${motorMsg}" /> 
                                        <br />
                                        <br />
                                    </p>
                                </div>
                                <div class="clearfix"></div>
                                <div class="col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 text-center">
                                    <div class="custom-checkbox">
                                        <div class="checkbox" id="addOnTppdAmtClick">
                                            <input type="checkbox" name="addon2" value="addon2" >
                                            <label></label>
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
        </div>
        <div class="container ready-container">
            <div class="row" >
                <div class="text-center col-sm-8 col-sm-offset-2">
                    <!--desktop-->
                    <h2 class="landing_h2 hidden-sm hidden-xs"><fmt:message key="motor.quickquote.document.heading" bundle="${motorMsg}" /></h2>
                    <!--end-desktop--> 
                    <!--Mobile-->
                    <h2 class="landing_h2 hidden-lg hidden-md feature-ttl"><fmt:message key="motor.quickquote.document.heading" bundle="${motorMsg}" /></h2>
                    <!--end mobile-->
                    <p>
                        <fmt:message key="motor.quickquote.document.copy" bundle="${motorMsg}" />
                        <br/>
                        <br/>

                    </p>
                </div>
            </div>
            <div class="row" >
                <div class="col-sm-4">
                    <div class="row" >
                        <div class="col-xs-10 col-xs-offset-1 col-sm-12 plan-panel">
                            <div class="white-color ready-panel">
                                <div class="row">
                                    <div class="col-xs-2 col-sm-4">
                                        <div class="thumbnail">
                                            <img src="<%=request.getContextPath()%>/resources/images/motor/HKID.png" alt="" />
                                        </div>
                                    </div>
                                    <div class="col-xs-10 col-sm-8 ready-content">
                                        <h3><fmt:message key="motor.quickquote.document.1.copy" bundle="${motorMsg}" /></h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="row" >
                        <div class="col-xs-10 col-xs-offset-1 col-sm-12 plan-panel">
                            <div class="white-color ready-panel">
                                <div class="row">
                                    <div class="col-xs-2 col-sm-4">
                                        <div class="thumbnail">
                                            <img src="<%=request.getContextPath()%>/resources/images/motor/Driver-License.png" alt="" />
                                        </div>
                                    </div>
                                    <div class="col-xs-10 col-sm-8 ready-content">
                                        <h3><fmt:message key="motor.quickquote.document.2.copy" bundle="${motorMsg}" /></h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="row" >
                        <div class="col-xs-10 col-xs-offset-1 col-sm-12 plan-panel">
                            <div class="white-color ready-panel">
                                <div class="row">
                                    <div class="col-xs-2 col-sm-4">
                                        <div class="thumbnail">
                                            <img src="<%=request.getContextPath()%>/resources/images/motor/Vehicle-Registration.png" alt="" />
                                        </div>
                                    </div>
                                    <div class="col-xs-10 col-sm-8 ready-content">
                                        <h3><fmt:message key="motor.quickquote.document.3.copy" bundle="${motorMsg}" /></h3>
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
                <div class="text-center col-xs-6 col-xs-offset-3 col-sm-4 col-sm-offset-4">
                    <br />
                    <!-- <a href="javascript:;" id="apply-link" data-toggle="modal" data-target="#contactpopup" class="bdr-curve btn btn-primary nxt-btn"><fmt:message key="motor.button.apply" bundle="${motorMsg}" /></a>-->
                    <button id="apply-link" class="bdr-curve btn btn-primary nxt-btn"><fmt:message key="motor.button.submit" bundle="${motorMsg}" /></button>
                    <br/>
                    <br/>
                </div>
                <div class="clearfix"></div> 
				 <div class="text-center save">
	                                <!--<a href="#" id="saveForm" class=""><fmt:message key="motor.link.text.savecontinuelater" bundle="${motorMsg}" /></a>
	                            --></div>
                <div class="clearfix"></div> 
                <div class="text-center ">
                    <a href="javascript:;"><fmt:message key="motor.quickquote.document.save.text" bundle="${motorMsg}" /></a>
                    <br/>
                    <br/>
                    <br/>
							<div class="col-xs-12 text-center">
								<p><small><fmt:message key="motor.quickquote.document.disclamier.copy" bundle="${motorMsg}" /></small></p>
							</div>
                </div>
                 
            </div>
        </div>
    </form>
</section>
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
                        
                        <div class="col-xs-6 text-right">
                        <!--
                            <span>
                                <fmt:message key="motor.label.currency.front" bundle="${motorMsg}" />
                                </span>
                                
                                <span id="yourQuotefromPrice"></span>
                                <fmt:message key="motor.label.currency.behind" bundle="${motorMsg}" />
                               
                                -->
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
                          <div class="clearfix"></div>
                        <div class="col-xs-6 summary__addOn2 hidden">                          
                                <span id="addOn2Title"><fmt:message key="motor.quickquote.addon.2.title" bundle="${motorMsg}" /></span>
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
                            <fmt:message key="motor.quickquote.contanctme.copy.part1" bundle="${motorMsg}" /><a href="tel:23123123"><fmt:message key="motor.quickquote.contanctme.copy.part2" bundle="${motorMsg}" /></a><fmt:message key="motor.quickquote.contanctme.copy.part3" bundle="${motorMsg}" />
                        </p>
                        <p>
                            <fmt:message key="motor.quickquote.contanctme.copy.part4" bundle="${motorMsg}" />
                            <br />
                            <fmt:message key="motor.quickquote.contanctme.reference.title" bundle="${motorMsg}" />
                            <h3 class="heading-h3 color-orange ref-number">
                                <span id="quote-num"></span>
                            </h3>
                        </p>
                    </div>
                </div>
            </div>
            <div id="successMessage" class="text-center hidden contact-us-wrap">
            	<p><br/>
            	 <fmt:message key="motor.quickquote.contactme.form.thankyou" bundle="${motorMsg}" />
            	<br/><br/>
            	</p>
            </div>
            <form role="form" name="contactform" id="contactform-pop" >
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
                                            <label class="mdl-textfield__label" for="mobileNo"><fmt:message key="motor.quickquote.contactme.form.mobile" bundle="${motorMsg}" /></label>
                                            <div class="help-block with-errors"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6" style="padding-top:5px;">
                                <div class="form-group">
                                    <div class="selectDiv centreDiv gray-text-bg" id="plan-dob">
                                          <div class="help-block-wrap">
                                 <select class="form-control" id="perferedDate" data-required-error='<fmt:message key="motor.error.msg.calltime.empty" bundle="${motorMsg}" />' name="perferedDate">
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
                                <fmt:message key="motor.button.submit" bundle="${motorMsg}" /></a>
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
<script type="text/javascript">
	var quote = jQuery.parseJSON('<%=StringEscapeUtils.escapeEcmaScript(StringEscapeUtils.unescapeHtml4(request.getParameter("data")))%>');
	
</script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/vendor/validator.min.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/motor/motor-forms.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/motor/motor-api.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/vendor/selectize.min.js"></script>
<script type="text/javascript" charset="utf-8">

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
var tempquote="";
var loginStatus=false;
var planCode;
var compPlan;
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
		    	tempquote = response.motorCareDetails;
		    	//$('#saveModal').modal("show");
		    }
		});
}
function SaveAndExit()
{
	$(document).ready(function(){
		
		 var submitData = {
	        		"applicant": {
                     "ncb": quote.applicant.ncb,
                     "occupation": quote.applicant.occupation,
	    	         "driveMoreThanTwo": quote.applicant.driveMoreThanTwo,         
                     "validAgeGroup": quote.applicant.validAgeGroup
                 },
                 "carDetail": {
                 	 "estimatedValue": quote.carDetail.estimatedValue,
                      "makeCode": quote.carDetail.makeCode,
                      "engineCapacity": quote.carDetail.engineCapacity,
                      "model": quote.carDetail.model,
                      "yearOfManufacture": quote.carDetail.yearOfManufacture                       
                 }, 
                 "driver" : [{   
	    	        	"ncb": quote.applicant.ncd,
	    	        	"occupation": quote.applicant.occupation,
	    	        	"driveMoreThanTwo": quote.applicant.driveMoreThanTwo,         
	    	        	"validAgeGroup": quote.applicant.validAgeGroup, 
	    	        }],
                 "planCode":planCode,
                 "compPlan": compPlan,
                 "personalAccident": $('[name="addon1"]').is(':checked'),
                 "thirdPartyPropertyDamage": $('[name="addon2"]').is(':checked')
             };
               
				$.ajax({
			     beforeSend: function(){
			    	 $('#saveModal').modal("hide");
			     	$('#loading-overlay').modal("show");
			     },
				  type: "POST",
				  data: JSON.stringify(submitData),
				  dataType: "json",
			     contentType : "application/json",
			     cache: false,
			     async: false,
			     url:context + "/api/iMotor/quote/save4Later",
				  success: function(data){
					console.dir(data);
					location.assign(context);
				  },error: function(error) {
					  console.dir(error);				
					  alert("error");
			          $("#loading-overlay").modal("hide");
				  }
				});
	});
}

	$(document).ready(function () {
		planCode = quote.planCode;
		compPlan = quote.compPlan;
		 if(getUrlParameter("edit")=="yes" || getUrlParameter("back")=="yes")
		 {  
			
			 var planType = (quote.planCode=='Third')?'third':quote.compPlan.toLowerCase();
		     if(quote.personalAccident == true)
		     {
		    	$("[name=addon1]").attr("checked", quote.personalAccident);
			 	var $this1 = $('#addOnPaAmtClick').find('[type="checkbox"]');
					quote.personalAccident = $this1.is(':checked');
					$.when(getMotorQuotePrice(planType, quote)).then(function(){				
					    totalDue = parseFloat(motorPrice[planType].amountDueAmount);
					    updateTotalDue(totalDue);
					});
				
		            if($this1.is(':checked')){
		            	
		                $('.summary__addOn1').removeClass('hidden');
						$('.summary__addOn').removeClass('hidden');
		            }
		            else{
		                $('.summary__addOn1').addClass('hidden');
		                if($('.summary__addOn2').hasClass('hidden'))
		     				$('.summary__addOn').addClass('hidden');
		            }
		     }
		     if(quote.thirdPartyPropertyDamage == true)
		     {
		    	
		    	 $("[name=addon2]").attr("checked", quote.thirdPartyPropertyDamage);
		            var $this2 = $('#addOnTppdAmtClick').find('[type="checkbox"]');
					quote.thirdPartyPropertyDamage = $this2.is(':checked');
					$.when(getMotorQuotePrice(planType, quote)).then(function(){
					    totalDue = parseFloat(motorPrice[planType].amountDueAmount);
					    updateTotalDue(totalDue);
					});
					
		            if($this2.is(':checked')){
		            	
		                $('.summary__addOn2').removeClass('hidden');
						$('.summary__addOn').removeClass('hidden');
		            }
		            else{
		            	$('.summary__addOn2').addClass('hidden');
		               	if($('.summary__addOn1').hasClass('hidden'))
		     				$('.summary__addOn').addClass('hidden');
		            }
		     }
		 }
			 
			 
        var totalDue = 0;
        var addOnPaQuote = 0;
        var addOnTppdQuote = 0;

        /*
         * Get Quote Price
         */
        var planType = (quote.planCode=='Third')?'third':quote.compPlan.toLowerCase();
        $.when(getMotorQuotePrice(planType, quote)).then(function(){
		
		            totalDue = parseFloat(motorPrice[planType].amountDueAmount);
		            addOnPaQuote = parseFloat(motorPrice[planType].addOnPaAmt);
		            addOnTppdQuote = parseFloat(motorPrice[planType].addOnTppdAmt);
					console.log(motorPrice);
					console.log(quote);
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
		            
		         //   $('#yourQuotefromPrice').html(formatCurrency(totalDue));
		         if(getUrlParameter("edit")!="yes" && getUrlParameter("back")!="yes")
		         	updateTotalDue(totalDue);
			
		        });
			
		/*
         * Check / Uncheck Add-On
         */
		$('#addOnTppdAmtClick').click(function() {
			$('#loading-overlay').modal("show");
            var $this = $(this).find('[type="checkbox"]');
			quote.thirdPartyPropertyDamage = $this.is(':checked');
			$.when(getMotorQuotePrice(planType, quote)).then(function(){
			    totalDue = parseFloat(motorPrice[planType].amountDueAmount);
			    updateTotalDue(totalDue);
			});
            if($this.is(':checked')){
                $('.summary__addOn2').removeClass('hidden');
				$('.summary__addOn').removeClass('hidden');
            }
            else{
            	$('.summary__addOn2').addClass('hidden');
               	if($('.summary__addOn1').hasClass('hidden'))
     				$('.summary__addOn').addClass('hidden');
            }
		});
		$('#addOnPaAmtClick').click(function() {
			$('#loading-overlay').modal("show");
            var $this = $(this).find('[type="checkbox"]');
			quote.personalAccident = $this.is(':checked');
			$.when(getMotorQuotePrice(planType, quote)).then(function(){				
			    totalDue = parseFloat(motorPrice[planType].amountDueAmount);
			    updateTotalDue(totalDue);
			});
            if($this.is(':checked')){
                $('.summary__addOn1').removeClass('hidden');
				$('.summary__addOn').removeClass('hidden');
            }
            else{
                $('.summary__addOn1').addClass('hidden');
                if($('.summary__addOn2').hasClass('hidden'))
     				$('.summary__addOn').addClass('hidden');
            }
        });
		
        $('#content-datepicker').datepicker({
            format: "dd-mm-yyyy",
            startView: "decade",
            autoclose: true,
            startView: 2
        }).change(function(e){
            $('label[for="content-datepicker"]').addClass('hidden');
        });
        $('#content-datepicker').focus(function () {
            $(this).parent().find('.custom-made-label').css({color: '#ff8200'});
        }).focusout(function (){
            $(this).parent().find('.custom-made-label').css({color: '#000000'});
        });

        $('#apply-link').on("click", function(){
        });
        $('#form-inline').submit(function(event){
        	$('#loading-overlay').modal("show");
        	quote.personalAccident = $('[name="addon1"]').is(':checked');
            quote.thirdPartyPropertyDamage = $('[name="addon2"]').is(':checked');
        	if(getUrlParameter("edit") == "yes" || getUrlParameter("back")=="yes")
        	{
        		
        		$.ajax({
        			  type: "POST",
        			  data: JSON.stringify(quote),
        			  dataType: "json",
        		      contentType : "application/json",
        		      cache: false,
        		      async: false,
        		      url:context + "/api/iMotor/quote/saving?edit=y",
        			  success: function(data){
        				  
	                        var $form = $("<form id='quote-form' />");
	                        $form.attr("action", "car-details?edit=yes");
	                        $form.attr("method", "post");
	                        var $quote = $("<input type='hidden' name='data' />");
	                        $quote.attr("value", JSON.stringify(quote));
	                        $form.append($quote);
	                        $("body").append($form);
	                        $('#quote-form').submit();
	                    	$('#loading-overlay').modal("hide");
	                        return false;
        		                
        			  },error: function(error) {
        				alert("error");
        			  }
        			});
        	}else
        	{
	            //window.location.hash = "callme=popup";
	        	if ($('#quote-num').html().trim().length==0){
	                $.ajax({
	                    url:  motorApi.quoteSaving,
	            		contentType: "application/json",        
	                    type: 'POST',
	                    dataType: "json",
	                    data: JSON.stringify(quote),
	                    async: false,
	                    cache: false,
	                    error: function() {
	                        alert("Error");
	                    },
	                    success: function(data) {
	                    	console.dir(data);
	                    	console.log(data.refNumber);
	                    	console.log(data.policyId);
	                        /*$('#quote-num').html(data.refNumber);
	                        quote.policyId = data.policyId;*/
	                        var object1 = {"policyId": data.policyId,"refNumber":data.refNumber};
	                        var $form = $("<form id='quote-form' />");
	                        $form.attr("action", "car-details");
	                        $form.attr("method", "post");
	                        var $quote = $("<input type='hidden' name='data' />");
	                        $quote.attr("value", JSON.stringify($.extend( object1, quote )));
	                        $form.append($quote);
	                        $("body").append($form);
	                        $('#quote-form').submit();  
	                        return false;
	                    }
	                 
	                }); 
	        	}
        	}
        	   return false;
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
    	    			    	quote = response.motorCareDetails;
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
	});
    
	
	
    function updateTotalDue(amt){
        $('#yourQuotePrice').html(formatCurrency(amt));
        $('#yourQuoteAmmount').html(formatCurrency(amt));
    	$('#loading-overlay').modal("hide");
    }

</script>
