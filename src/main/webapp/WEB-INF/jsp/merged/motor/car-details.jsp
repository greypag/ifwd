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
    .bootstrap-switch.bootstrap-switch-wrapper.bootstrap-switch-animate.bootstrap-switch-on{
    background: #ccc;
    }
    .bootstrap-switch.bootstrap-switch-wrapper.bootstrap-switch-animate.bootstrap-switch-on .bootstrap-switch-label{
    border: solid 2px #ccc;
    }
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
            <div id="motor_registerForm">
            <form id="carDetails" name="" method="post" data-toggle="validator" >
                <div class="container">
                    <div class="row">
                        <div class="col-md-8 col-md-offset-2 col-sm-12">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
	                                            <div class="help-block-wrap">
	                                                <a class="motor-tooltip" data-toggle="tooltip" data-html="true" title="<img src='http://dummyimage.com/600x200/fff/555.png' />">
	                                                    <i class="fa fa-exclamation-circle" aria-hidden="true"></i>
	                                                </a>
	                                                <input type="text" name="chassisNumber" minlength="3" maxlength="30" class="form-control input--grey mdl-textfield__input" id="chassisNumber" required data-required-error='<fmt:message key="motor.error.msg.chassis.empty" bundle="${motorMsg}" />' data-error='<fmt:message key="motor.error.msg.chassis.format" bundle="${motorMsg}" />'>
	                                                <label class="mdl-textfield__label" for="chassisNumber"><fmt:message key="motor.cardetails.car.chassisno" bundle="${motorMsg}" /></label>
	                                                <div class="help-block with-errors"></div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="col-sm-6">
	                                    <div class="form-group">
	                                        <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
	                                            <div class="help-block-wrap">
	                                                <a class="motor-tooltip" data-toggle="tooltip" data-html="true" title="<img src='http://dummyimage.com/600x200/fff/555.png' />">
	                                                    <i class="fa fa-exclamation-circle" aria-hidden="true"></i>
	                                                </a>
	                                                <input type="text" name="cubicCapacity" minlength="3" maxlength="5" class="form-control input--grey mdl-textfield__input" id="cubicCapacity" required data-required-error='<fmt:message key="motor.error.msg.cc.empty" bundle="${motorMsg}" />' data-error='<fmt:message key="motor.error.msg.cc.format" bundle="${motorMsg}" />'>
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
	                                                <a class="motor-tooltip" data-toggle="tooltip" data-html="true" title="<img src='http://dummyimage.com/600x200/fff/555.png' />">
	                                                    <i class="fa fa-exclamation-circle" aria-hidden="true"></i>
	                                                </a>
	                                                <input type="text" name="registedModel" pattern="^[a-zA-Z\d\s]+$" data-pattern-error='<fmt:message key="motor.error.msg.makemodel.format" bundle="${motorMsg}" />' minlength="4" maxlength="10" class="form-control input--grey mdl-textfield__input" id="registedModel" required data-required-error='<fmt:message key="motor.error.msg.makemodel.empty" bundle="${motorMsg}" />' data-error='<fmt:message key="motor.error.msg.makemodel.general" bundle="${motorMsg}" />'>
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
	                                    <div class="col-sm-6">
	                                        <fmt:message key="motor.cardetails.mortgage.question" bundle="${motorMsg}" />
	                                    </div>
	                                    <div class="col-sm-6 text-right">
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
	                                            <div class="help-block with-errors"></div>
	                                        </div>
	                                    </div>
	                                    <div class="form-group" id="bankNameHandle">
	                                        <!-- <div class="help-block-wrap">
	                                            <input class="form-control" type="text" pattern="^[a-zA-Z\s]+$"  name="bankName" id="bankName" data-error='<fmt:message key="motor.error.msg.mortgagebank.format" bundle="${motorMsg}" />' placeholder="Bank"/>
	                                            <div class="help-block with-errors"></div>
	                                        </div>-->
	                                        <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
	                                            <div class="help-block-wrap">
	                                                <input type="text" name="bankName" minlength="3" maxlength="30" class="form-control input--grey mdl-textfield__input" id="bankName" data-required-error='<fmt:message key="motor.error.msg.mortgagebank.format" bundle="${motorMsg}" />' data-error='<fmt:message key="motor.error.msg.mortgagebank.invalid" bundle="${motorMsg}" />'>
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
/*var chin = $('body').hasClass('chin'),
enErr = {
404: 'System Cannot find the policy',
504: 'System Error',
422: 'Invalid Details',
410: 'Invalid CarBand',
},
cnErr ={
		404: '您的汽車類型未能合乎即時報價的要求。',   
		504: '您的汽車類型未能合乎即時報價的要求。',      
		422: '您的汽車車齡超過13年。',                          
		410: '您的職業未能合乎即時報價的要求。',        
};*/

var checkbox=false;

var quote = jQuery.parseJSON('<%=request.getParameter("data")!=null?request.getParameter("data").replace("&quot;", "\""):"{}"%>');
if(typeof quote.policyId == "undefined")
	window.location="/fwdhk/en/motor-insurance/";

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
 		    	tempquote = response.motorCareDetails;
 		    	$('#saveModal').modal("show");
 		    }
 		});
 }
function SaveAndExit()
{
	$(document).ready(function(){

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
					  alert("error");
			         $("#loading-overlay").modal("hide");
			        // location.assign(context);
				  }
				});
	});
}
function BackMe() {
	
	/*if(getUrlParameter("edit")=="yes")
		window.location="/fwdhk/en/motor-insurance/rider-options?edit=yes";
	else
		window.location="/fwdhk/en/motor-insurance/rider-options";*/
	//window.history.back();
	 var $form = $("<form id='quote-form' />");
    	 $form.attr("action", "rider-options?back=yes");
     $form.attr("method", "post");
     var $quote = $("<input type='hidden' name='data' />");
     $quote.attr("value", JSON.stringify(quote));
     $form.append($quote);
     $("body").append($form);
     $('#quote-form').submit();
}

$(document).ready(function(){
	
    $('[data-toggle="tooltip"]').tooltip(); 
 
    
    if(getUrlParameter("edit")=="yes" || getUrlParameter("back")=="yes" )
    {	
	    $('input[name=chassisNumber]').val(quote.carDetail.chassisNumber);    
		$('input[name=cubicCapacity]').val(quote.carDetail.engineCapacity);
		$('input[name=registedModel]').val(quote.carDetail.modelDesc);
		$("#bankNameHandle").addClass("hidden");
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
     
	$('#carDetails').submit(function(event){
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
          url:context + "/api/iMotor/policy/saving/carDetails",
		  success: function(data){
			  var $form = $("<form id='quote-form' />");
			  if(getUrlParameter("edit")=="yes")
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
		  },error: function(error) {
			  /*$('#reason').attr('value', xhr.status);
          		e.preventDefault();
              if (xhr.status == 404) {
              	if(chin)
              		$("#reasonMsg").text(cnErr[404]);
              	else
              		$("#reasonMsg").text(enErr[404]);
                  $("#contactpopup").modal('show');
                  console.log(xhr.status, textStatus, errorThrown);
              } 
              if (xhr.status == 504) {
              	if(chin)
              		$("#reasonMsg").text(cnErr[504]);
              	else
              		$("#reasonMsg").text(enErr[504]);
                  $("#contactpopup").modal('show');
                  console.log(xhr.status, textStatus, errorThrown);
              } 
              else if (xhr.status == 422) {
              	if(chin)
              		$("#reasonMsg").text(cnErr[422]);
              	else
              		$("#reasonMsg").text(enErr[422]);
                  $("#contactpopup").modal('show');
                  console.log(xhr.status, textStatus, errorThrown);
              } 
              else if (xhr.status == 410) {
              	if(chin)
              		$("#reasonMsg").text(cnErr[410]);
              	else
              		$("#reasonMsg").text(enErr[410]);
                  $("#contactpopup").modal('show');
                  console.log(xhr.status, textStatus, errorThrown);
              }*/
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
       


