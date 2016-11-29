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
	        <form class="form-inline" id="declaration" method="post" data-toggle="validator">
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
	                                        <div class="radio text-center">
	                                            <input type="radio" name="answer1" id="a1yes" value="true">
	                                            <label class="" for="yes">
	                                                <span class=""><fmt:message key="motor.button.yes" bundle="${motorMsg}" /></span>
	                                            </label>
	                                        </div>
	                                        <div class="radio text-center">
	                                            <input type="radio" name="answer1" id="a1no" value="false">
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
	                                        <div class="radio text-center">
	                                            <input type="radio" name="answer2" id="a2yes" value="true">
	                                            <label class="" for="yes">
	                                                <span class=""><fmt:message key="motor.button.yes" bundle="${motorMsg}" /></span>
	                                            </label>
	                                        </div>
	                                        <div class="radio text-center">
	                                            <input type="radio" name="answer2" id="a2no" value="false">
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
	                                        <div class="radio text-center">
	                                            <input type="radio" name="answer3" id="a3yes" value="true">
	                                            <label class="" for="yes">
	                                                <span class=""><fmt:message key="motor.button.yes" bundle="${motorMsg}" /></span>
	                                            </label>
	                                        </div>
	                                        <div class="radio text-center">
	                                            <input type="radio" name="answer3" id="a3no" value="false">
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
	                                <h1 class="landing_h2 hidden-sm hidden-xs"><fmt:message key="motor.declarations.privacy.policy" bundle="${motorMsg}" /></h1>
	                                <h1 class="landing_h2 hidden-lg hidden-md feature-ttl"><fmt:message key="motor.declarations.privacy.policy" bundle="${motorMsg}" /></h1>
	                            </div>
	                        </div>
	                        <div class="clearfix"></div>
	                        <div class="col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 statement">
	                            <div class="custom-checkbox">
	                                <div class="checkbox">
	                                    <div class="form-group">
	                                        <div class="help-block-wrap">
	                                            <input type="checkbox" id="psNoDM" name="psNoDM" value="" required data-required-error='<fmt:message key="motor.declarations.privacy.policy.error1" bundle="${motorMsg}" />'>
	                                            <label><small>
	                                                    <fmt:message key="motor.declarations.privacy.policy.q1" bundle="${motorMsg}" /></small>
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
	                                            <input type="checkbox" id="psNoProvidePersonalData" name="psNoProvidePersonalData" value="" required data-required-error='<fmt:message key="motor.declarations.privacy.policy.error2" bundle="${motorMsg}" />'>
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
	                                            <input type="checkbox" id="psPICS" name="psPICS" value=""  required data-required-error='<fmt:message key="motor.declarations.privacy.policy.error3" bundle="${motorMsg}" />'>
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
	                                <input type="submit" class="bdr-curve btn btn-primary nxt-btn" value="Next" />
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
	                </div>
	        </form>
        </div>
    </section>
    <section class="yourQuote">
    <div class="container">
        <div class="row" >
            <a class="orange-color col-xs-12 collapse-addon center" role="button" data-toggle="collapse" href="#yourQuote" aria-expanded="false" aria-controls="yourQuote">
                <h3><span class="small title"><fmt:message key="motor.label.yourquote" bundle="${motorMsg}" /></span><span class="price"><fmt:message key="motor.label.currency.front" bundle="${motorMsg}" />4,680.00<fmt:message key="motor.label.currency.behind" bundle="${motorMsg}" /></span></h3>
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
var quote = jQuery.parseJSON('<%=request.getParameter("data")!=null?request.getParameter("data").replace("&quot;", "\""):"{}"%>');
/* 
 *  Define motor success login callback
 */
var loginStatus=false;
function callback_motor_LoginSuccess(){
	alert('Login success. Call Save later API.');
	$('#saveModal').modal("show");
}
function SaveAndExit()
{
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
    
    if(getUrlParameter("edit")=="yes")
    {
    	$("input[name=answer1]").prop('checked', quote.motorCareDeclaration[0].declarationAns);
    	$("input[name=answer2]").prop('checked', quote.motorCareDeclaration[1].declarationAns);
    	$("input[name=answer3]").prop('checked', quote.motorCareDeclaration[2].declarationAns);
    	$('input[name=psNoDM]').attr("checked",qupte.psNoDM);	
		$('input[name=psNoProvidePersonalData]').attr("checked",qupte.psNoProvidePersonalData);	
		$('input[name=psPICS]').attr("checked",qupte.psPICS);	
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
	    			$(".before-login").show();
	    			$("#saveModal").removeClass("hidden");
	    			return false;	
	    		}else
	    		{   loginStatus=true;
	    			$(".before-login").hide();	
	    		}
	    	}
	    }
	});

	  $("#saveForm").on("click",function(){
		    if(loginStatus==false)
			$('#loginpopup').modal("show");
		    else  if(loginStatus==true)
		    $('#saveModal').modal("show");
	  });
    
	$('#declaration').submit(function(event){
	
	
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
		  url: context + "/api/iMotor/policy/saving/declarations",
		  success: function(data){
			  var $form = $("<form id='quote-form' />");
			  $form.attr("action", "application-summary");
              $form.attr("method", "post");
              var $quote = $("<input type='hidden' name='data' />");
	          var opts = {};
	          quote.refNumber = data.refNumber;	          
	          opts = $.extend(opts,quote, submitData);
              $quote.attr("value", JSON.stringify(opts));
              $form.append($quote);
              $("body").append($form);
              $('#quote-form').submit();         
		  },error: function(error) {
			  console.dir(error);
			  return false;
		  }
		});
		return false;
	        	}
	});
	
});
</script>
       

