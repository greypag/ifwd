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



<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/motor/motor-styles.css" type="text/css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/motor/bootstrap-switch.min.css" type="text/css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/motor/selectize.bootstrap3.css" type="text/css">
<style type="text/css" media="all">
</style>
<div class="motor-form-wrap">
    <section id="" class="motor-signup-form">
        <div class="container container-fluid breadcrumbs motor">
            <ol class="breadcrumb">
                <li><a href="#">Home</a></li>
                <li class="divider"><i class="fa fa-angle-right"></i></li>
                <li><a href="#">Protect</a></li>
                <li class="divider"><i class="fa fa-angle-right"></i></li>
                <li><a href="#">MotorCare</a></li>
                <li class="divider"><i class="fa fa-angle-right"></i></li>
                <li class="active-bc" id="et-active-bc-menu">Get quote</li>
            </ol>
        </div>
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
        <form class="form-inline" id="motor_registerForm" action="/api/iMotor/policy" method="post" data-toggle="validator">
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
                                        <div class="radio active text-center">
                                            <input type="radio" name="answer1" id="a1yes" value="yes" checked>
                                            <label class="" for="yes">
                                                <span class="">Yes</span>
                                            </label>
                                        </div>
                                        <div class="radio text-center">
                                            <input type="radio" name="answer1" id="a1no" value="no">
                                            <label class="" for="no">
                                                <span class="">No</span>
                                            </label>
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
                                        <div class="radio active text-center">
                                            <input type="radio" name="answer2" id="a2yes" value="yes" checked>
                                            <label class="" for="yes">
                                                <span class="">Yes</span>
                                            </label>
                                        </div>
                                        <div class="radio text-center">
                                            <input type="radio" name="answer2" id="a2no" value="no">
                                            <label class="" for="no">
                                                <span class="">No</span>
                                            </label>
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
                                        <div class="radio active text-center">
                                            <input type="radio" name="answer3" id="a3yes" value="yes" checked>
                                            <label class="" for="yes">
                                                <span class="">Yes</span>
                                            </label>
                                        </div>
                                        <div class="radio text-center">
                                            <input type="radio" name="answer3" id="a3no" value="no">
                                            <label class="" for="no">
                                                <span class="">No</span>
                                            </label>
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
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/motor/validator.min.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/bootstrap-switch.min.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/motor/selectize.min.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/motor/motor-forms.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/motor/register-form.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/motor/custom-datepicker.js"></script>


