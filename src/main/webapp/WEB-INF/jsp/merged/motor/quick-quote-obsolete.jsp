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
var quote = jQuery.parseJSON('<%=request.getParameter("data").replace("&quot;", "\"")%>');
 
$(document).ready(function(){
    $.ajax({
        url: '/fwdhk/api/iMotor/quote',
		contentType: "application/json",        
        type: 'POST',
        dataType: "json",
        data: JSON.stringify({
			"addOnPaAmt": null,
			"addOnTppdAmt": null,
			"compPlan": quote.compPlan,
			"discountAmount": quote.discountAmount,
			"grossPremium": quote.grossPremium,
			"personalAccident": quote.personalAccident,
			"planCode": quote.planCode,
			"quoteDriver": {
				"carEstimatedValue": quote.quoteDriver.carEstimatedValue,
				"carMakeCode": quote.quoteDriver.carMakeCode,
				"carCC": quote.quoteDriver.carCC,
				"carModel": quote.quoteDriver.carModel,
				"carYearOfManufacture": quote.quoteDriver.carYearOfManufacture,
				"clubMember": quote.quoteDriver.clubMember,
				"clubMemberNum": quote.quoteDriver.clubMemberNum,
				"driveMoreThanTwo": quote.quoteDriver.driveMoreThanTwo,
				"ncb": quote.quoteDriver.ncb,
				"occupation": quote.quoteDriver.occupation,
				"promoCode": quote.quoteDriver.promoCode,
				"validAgeGroup": quote.quoteDriver.validAgeGroup
			},
			"quoteId": null,
			"refNumber": null,
			"thirdPartyPropertyDemage": false
       	}),
        error: function() {
            alert("Error");
        },
        success: function(data) {
            $('#quote-price').html(data.grossPremium);
        }
    });

    $('#apply-link').on("click", function(){
    	if ($('#quote_num').html()==''){
            $.ajax({
                url: '/fwdhk/api/iMotor/quote/saving',
        		contentType: "application/json",        
                type: 'POST',
                dataType: "json",
                data: JSON.stringify({
					"addOnPaAmt": null,
					"addOnTppdAmt": null,
					"compPlan": quote.compPlan,
					"personalAccident": quote.personalAccident,
					"planCode": quote.planCode,
					"quoteDriver": {
						"carEstimatedValue": quote.quoteDriver.carEstimatedValue,
						"carMakeCode": quote.quoteDriver.carMakeCode,
						"carCC": quote.quoteDriver.carCC,
						"carModel": quote.quoteDriver.carModel,
						"carYearOfManufacture": quote.quoteDriver.carYearOfManufacture,
						"clubMember": quote.quoteDriver.clubMember,
						"clubMemberNum": quote.quoteDriver.clubMemberNum,
						"driveMoreThanTwo": quote.quoteDriver.driveMoreThanTwo,
						"ncb": quote.quoteDriver.ncb,
						"occupation": quote.quoteDriver.occupation,
						"promoCode": quote.quoteDriver.promoCode,
						"validAgeGroup": quote.quoteDriver.validAgeGroup
					},
					"quoteId": null,
					"refNumber": null,
					"thirdPartyPropertyDemage": false
              	}),
                error: function() {
                    alert("Error");
                },
                success: function(data) {
                    $('#quote_num').html(data.refNumber);
                }
            });
    	}
    });    
});
</script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/motor/selectize.bootstrap3.css" type="text/css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css_dir/motor-styles.css" type="text/css">
<style type="text/css" media="all">
    .quote-form-wrapper{
        margin: 0 15px;
    }
    .q5:last-of-type{
        margin-bottom: 30px;
    }
    @media screen and (max-width: 767px){
        .quote-form-wrapper{
            margin: 0;
            padding: 0 20px;
        }
        #testimonials{
            margin-left: -20px;
            margin-right: -20px;
            padding-left: 20px;
            padding-right: 20px;
        }
    }
</style>
<section id="" class="motor-get-quote">
    <div class="container container-fluid breadcrumbs motor pad-0">
        <!-- Breadcrumb Component Start-->
        <c:set var="breadcrumbItems">
            breadcrumb.item.home,breadcrumb.item.protect,breadcrumb.item.motor,breadcrumb.item.get.quote
        </c:set>
        <c:set var="breadcrumbActive">3</c:set>
        
        <jsp:include page="/WEB-INF/jsp/merged/comp/breadcrumb.jsp">
            <jsp:param name="breadcrumbItems" value="${breadcrumbItems}"/>
            <jsp:param name="breadcrumbActive" value="${breadcrumbActive}"/>
        </jsp:include>

        <!-- Breadcrumb Component End-->
    </div>
    <div class="container">
        <div class="center wow fadeInDown animated" > 
            <!--desktop-->
            <h1 class="landing_h2 col-md-10 col-md-offset-1 hidden-sm hidden-xs">Get Your quote in a minute</h1>
            <!--end-desktop--> 
            <!--Mobile-->
            <h1 class="landing_h2 hidden-lg hidden-md motor-ttl">Get Your quote in a minute</h1>
            <!--end mobile--> 
        </div>
    </div>
        <div class="container">
            <div class="center" > 
                <!--desktop-->
                <h1 class="landing_h2 text-left hidden-sm hidden-xs">Make a great plan even better. Add on:</h1>
                <!--end-desktop--> 
                <!--Mobile-->
                <h1 class="landing_h2 text-left hidden-lg hidden-md feature-ttl">Make a great plan even better. Add on:</h1>
                <!--end mobile--> 
            </div>
        </div>
        <!--/.container--> 
        <form class="form-inline add-on" id="quick-quote-form">
            <div class="container select-plan-main">
                <div id="testimonials">
                    <div class="row planbox-wrapper">
                        <div class="col-sm-6 plan-panel">
                            <div class="white-color">
                                <div class="row">
                                    <div class="col-xs-2 col-sm-3">
                                        <div class="thumbnail">
                                            <img src="<%=request.getContextPath()%>/resources/images/motor/dummy.png" alt="" />
                                        </div>
                                    </div>
                                    <a class="col-xs-10 col-sm-9 collapse-addon" role="button" data-toggle="collapse" href="#addOn1" aria-expanded="false" aria-controls="addOn1">
                                        <h3>personalAccident</h3>
                                        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</p>
                                    </a>
                                    <div class="col-xs-12 text-center">
                                        <div class="price">
                                            <big>+ HK$100</big>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-xs-12 text-center collapse" >
                                        <p>
                                            Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. 
                                            <br />
                                            <br />
                                        </p>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 text-center">
                                        <div class="custom-checkbox">
                                            <div class="checkbox">
                                                <input type="checkbox" name="addon1" value="false">
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
                                            <img src="<%=request.getContextPath()%>/resources/images/motor/dummy.png" alt="" />
                                        </div>
                                    </div>
                                    <a class="col-xs-10 col-sm-9 collapse-addon" role="button" data-toggle="collapse" href="#addOn2" aria-expanded="false" aria-controls="addOn2">
                                        <h3>thirdPartyPropertyDemage</h3>
                                        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</p>
                                    </a>
                                    <div class="col-xs-12 text-center">
                                        <div class="price">
                                            <big>+ HK$100</big>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-xs-12 text-center collapse">
                                        <p>
                                            Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. 
                                            <br />
                                            <br />
                                        </p>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 text-center">
                                        <div class="custom-checkbox">
                                            <div class="checkbox">
                                                <input type="checkbox" name="addon2" value="false" >
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
                        <h2 class="landing_h2 hidden-sm hidden-xs">Have these ready?</h2>
                        <!--end-desktop--> 
                        <!--Mobile-->
                        <h2 class="landing_h2 hidden-lg hidden-md feature-ttl">Have these ready?</h2>
                        <!--end mobile-->
                        <p>
                            Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. 
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
                                                <img src="<%=request.getContextPath()%>/resources/images/motor/dummy.png" alt="" />
                                            </div>
                                        </div>
                                        <div class="col-xs-10 col-sm-8 ready-content">
                                            <h3>HKID for all named drivers</h3>
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
                                                <img src="<%=request.getContextPath()%>/resources/images/motor/dummy.png" alt="" />
                                            </div>
                                        </div>
                                        <div class="col-xs-10 col-sm-8 ready-content">
                                            <h3>Driver liciense for all named drivers</h3>
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
                                                <img src="<%=request.getContextPath()%>/resources/images/motor/dummy.png" alt="" />
                                            </div>
                                        </div>
                                        <div class="col-xs-10 col-sm-8 ready-content">
                                            <h3>Vehicle Registration Document</h3>
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
                        <a href="#" id="apply-link" data-toggle="modal" data-target="#contactpopup" class="bdr-curve btn btn-primary nxt-btn">Apply</a>
                        <br/>
                        <br/>
                    </div>
                    <div class="clearfix"></div> 
                        <div class="text-center ">
                            <a id="saveForm" href="javascript:" >Save and Continue Later</a>
                            <br/>
                            <br/>
                            <br/>
                        </div>
                </div>
            </div>
        </form>
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
                            <small class="from">from</small><span class="price">HK$<span id="quote-price"></span></span>
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
            <div class="login-close-wrapper"><a class="close" aria-label="Close" data-dismiss="modal"><span aria-hidden="true">×</span></a></div>
            <div class="login-title-wrapper">
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
                                    Opps 
                                </h3>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-10 col-sm-offset-1 text-center">
                        <p>
                            Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. 
                        </p>
                        <p>
                            Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem.
                            <br />
                            <br />
                            Your Reference No.
                            <h3 class="heading-h3 color-orange ref-number">
                                <span id="quote_num"></span>
                            </h3>
                        </p>
                    </div>
                </div>
            </div>
            <form data-toggle="validator" action="/api/iMotor/contactMe" role="form" name="contactform" id="contactform-pop" method="post">
                <input type="hidden" name="ref_no" id="ref_no" value="RQ862541" />
                <div class="contact-form">
                    <div class="form-container">
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <div class="help-block-wrap">
                                            <input type="text" name="fullName"
                                            class="form-control gray-textbox mdl-textfield__input" id="fullName" required>
                                            <label class="mdl-textfield__label" for="fullName">Full Name</label>
                                            <div class="help-block with-errors"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <div class="help-block-wrap">
                                            <input type="email" name="email"
                                            class="form-control gray-textbox mdl-textfield__input" required>
                                            <label class="mdl-textfield__label" for="email">Email</label>
                                            <div class="help-block with-errors"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <div class="help-block-wrap">
                                            <input type="text" name="mobileNo" pattern="^\d{8}$" maxlength="8" class="form-control gray-textbox check-emp login-input mdl-textfield__input" id="mobileNo" required>
                                            <label class="mdl-textfield__label" for="headerUserName">Mobile No.</label>
                                            <div class="help-block with-errors"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <div class="selectDiv centreDiv gray-text-bg" id="plan-dob">
                                        <div class="help-block-wrap">
                                            <input  name="content-datepicker" id="content-datepicker" readonly placeholder="" class="form-control" required>
                                            <div class="help-block with-errors"></div>
                                        </div>
                                        <img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg">
                                        <label class="mdl-textfield__label so-mdl-textfield-label custom-made-label " for="content-datepicker">Prefered Date</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="custom-checkbox">
                            <div class="checkbox">
                                <div class="form-group">
                                    <div class="help-block-wrap">
                                        <input type="checkbox" id="" name="" value="" required>
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
                        <div class="login-button-group text-center">
                            <input id="fna-check" type="hidden" name="fna" value="false">
                            <input id="forcefna" type="hidden" name="forcefna" value="false">
                            <input id="nav-bar-check" type="hidden" name="isNavBar" value="true">
                            <button type="submit" onclick=""
                                class="cta-confirm cta-font cta-orange cta-padding-40">
                                Submit 
                            </button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/vendor/validator.min.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/motor/motor-forms.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/motor/custom-datepicker.js"></script>
