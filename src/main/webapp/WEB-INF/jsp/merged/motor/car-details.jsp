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
                                        <span class="status">Car Details</span>
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
                <h1 class="landing_h2 hidden-sm hidden-xs">Car Details</h1>
                <!--end-desktop--> 
                <!--Mobile-->
                <h1 class="landing_h2 hidden-lg hidden-md feature-ttl">Car Details</h1>
                <h1 class="landing_h3 hidden-lg hidden-md feature-ttl">Car Details</h1>
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
	                                                <input type="text" name="chassisNumber" minlength="3" maxlength="30" class="form-control input--grey mdl-textfield__input" id="chassisNumber" required data-required-error="Please enter Chassis Number." data-error="Your Chassis Number is invalid.">
	                                                <label class="mdl-textfield__label" for="chassisNumber">Chassis Number</label>
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
	                                                <input type="text" name="cubicCapacity" minlength="3" maxlength="5" class="form-control input--grey mdl-textfield__input" id="cubicCapacity" required data-required-error="Please enter your Car's CC value." data-error="Your Car's CC value is invalid.">
	                                                <label class="mdl-textfield__label" for="cubicCapacity">Cubic Capacity</label>
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
	                                                <input type="text" name="registedModel" pattern="^[a-zA-Z\d]+$" data-pattern-error="Your Car Model number is invalid" minlength="4" maxlength="10" class="form-control input--grey mdl-textfield__input" id="registedModel" required data-required-error="Please enter your Car Model number in Registration Document" data-error="Your Car Model number is invalid">
	                                                <label class="mdl-textfield__label" for="registedModel">Model in Registration Document</label>
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
	                            <h1 class="landing_h2 hidden-sm hidden-xs">Bank mortgage</h1>
	                            <!--end-desktop--> 
	                            <!--Mobile-->
	                            <h1 class="landing_h2 hidden-lg hidden-md feature-ttl">Bank mortgage</h1>
	                            <!--end mobile--> 
	                        </div>
	                        <div class="row">
	                            <div class="col-md-8 col-md-offset-2 col-sm-12">
	                                <div class="form-group row">
	                                    <div class="col-sm-6">
	                                        Is car under a bank mortgage?
	                                    </div>
	                                    <div class="col-sm-6 text-right">
	                                        <span class="switch-light sly">Yes&nbsp;</span>
	                                        <input type="checkbox" class="toggleCheck" name="bankMortgage" checked>
	                                        <span class="switch-light sln">&nbsp;No</span>
	                                    </div>
	                                </div>
	                                <div class="mortgageBank">
	                                    <div class="form-group">
	                                        <div class="help-block-wrap">
	                                            <select class="form-control" id="mortgageBank" data-required-error="Please enter Hire Purchase Owner/ Bank." required>
	                                                <option value="" disabled selected hidden>Hire Purchase Owner/Bank</option>
	                                            </select>
	                                            <div class="help-block with-errors"></div>
	                                        </div>
	                                    </div>
	                                    <div class="form-group">
	                                        <div class="help-block-wrap">
	                                            <input class="form-control" type="text" pattern="^[a-zA-Z\s]+$"  name="bankName" id="bankName" data-error="Please enter Hire Purchase Owner/ Bank in English only." placeholder="Bank"/>
	                                            <div class="help-block with-errors"></div>
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
	                                <a class="bdr-curve btn btn-primary nxt-btn" onclick="perventRedirect=false;BackMe();">Back </a>
	                                <br/>
	                            </div>
	                            <div class="text-center col-xs-6">
	                                <br /> <br />
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
            <div class="login-close-wrapper"><a class="close" aria-label="Close" data-dismiss="modal"><span aria-hidden="true">×</span></a></div>
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
<script>
var checkbox=true;
$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip(); 
    $('input[name=bankMortgage]').bootstrapSwitch();
    $('input[name=bankMortgage]').on('switchChange.bootstrapSwitch', function(event, state) {
    	$(".switch-light").removeClass("orange");
    	if(state==true)
    		$(".sly").addClass("orange");
    	else
    		$(".sln").addClass("orange");
    	checkbox = state;
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
    
	$('#carDetails').submit(function(event){
	
	   var isThird;
       if (getUrlParameter('plan')=='third') {
    	  isThird = true;
       } else {
    	  isThird = false;
       }
     
	   var data = {"carDetail": {   	
				   "bankMortgage": checkbox,	
				   "bankMortgageName": $("#mortgageBank option:selected").text(),	
				   "chassisNumber": $('input[name=chassisNumber]').val(),    	
				   "engineCapacity": $('input[name=cubicCapacity]').val(),   	
				   "modelDesc": $('input[name=registedModel]').val()    	
					}, 	
					"policyId": "26379363"  	
					};
	  
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
          url:context + "/api/iMotor/policy/saving/carDetails",
		  success: function(data){
			 return false;
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
       


