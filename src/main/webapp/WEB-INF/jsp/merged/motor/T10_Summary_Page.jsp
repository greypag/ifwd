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
    .registerPanel .panel-heading{
    padding-top: 20px;
    padding-bottom: 20px;
    }
    .closeForm{
        position: absolute;
        z-index: 9;
        right: 20px;
        top: 0;
        cursor: pointer;
    }
    #forgotUserPassPopup .panel-body, #forgotUserNamePopup .panel-body{
        padding-top: 0 !important;
    }
    #forgotUserPassPopup, #forgotUserNamePopup{
        background-color: #f2f2f2;
        position: absolute;
        top: 0;
        width: 100%;
        height: 100%;
    }
    #forgetPassform h3, #forgetuserform h3{
        margin-top: 0;
        margin-bottom: 40px;
    }
    .memberLogin .loginPanel{
        position: relative;
    }
    .memberLogin .loginPanel > div{
        padding-bottom: 40px;
    }
    .memberLogin .loginPanel > div:first-of-type{
        padding-top: 0px;
        padding-bottom: 20px;
    }
    .summary .odd{
        background-color: #f2f2f2;
    }
    .summary .panel-body .detail-row > div{
        height: 70px;
        display: flex;
        flex-direction: column;
        justify-content: center;
    } 
    .summary, .summary .panel-heading{
        background-color: #fff;
        position: relative;
    }
    .summary .panel-heading .edit-detail{
        position: absolute;
        right: 20px;
        top: 20px;
    }
    .summary .panel-heading .edit-detail a{
        text-decoration: underline;
    }
    .summary .panel-heading > .panel-title{
        color: #ff8200;
        margin-bottom: 0;
    }
    .summary .panel-body{
        padding: 0 15px;
        border: solid 1px #ccc;
        border-top-width: 3px;
    }
    .center .landing_h2{
        color: #575757 !important;
    }
    .summary .driver-detail{
        border-bottom: solid 1px #ccc;
    } 
    .summary .driver-detail .title{
        font-weight: bold;
        color: #ff8200;
    }
    .finalPremium{
        background-color: #fff;
        border: solid 1px #ccc;
        border-radius:0 ;
    }
    .finalPremium .panel-heading{
        padding-top: 40px;
        background-color: #fff;
    }
    .finalPremium .panel-body{
        padding-bottom: 40px;
    }
    .finalPremium-title{
        font-family: Calibri, sans-serif !important;
        font-weight: 100;
        margin: 0;
    }
    .motor-summary .container:last-of-type{
        margin-bottom: 50px;
    }
    .payment-detail .panel-body .detail-row select{
        font-size: 16px;
    }
    @media (min-width: 768px){
        .payment-detail .panel-body .detail-row > div{
            height: 100px;
        }
        .payment-detail .panel-body .detail-row > div span{
            display: table-cell;
            height: 100px;
            vertical-align: middle;
        }
        .finalPremium .panel-heading > .row > div, .finalPremium .panel-body > .row > div{
            padding-left: 40px;
            padding-right: 40px;
        }
        .summary .panel-body .detail-row > div{
            padding-left: 40px;
            padding-right: 40px;
        }
        .summary .panel-body .row > div:nth-of-type(odd) > .detail-row > .text-right{
            border-right: solid 1px #ccc;
        }
    }
</style>
<section id="" class="motor-summary motor-signup-form">
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
        <div class="center wow fadeInDown animated" > 
            <!--desktop-->
            <h1 class="landing_h2 col-md-10 col-md-offset-1 hidden-sm hidden-xs">Application Summary</h1>
            <!--end-desktop--> 
            <!--Mobile-->
            <h1 class="landing_h2 hidden-lg hidden-md motor-ttl">Application Summary</h1>
            <!--end mobile--> 
        </div>
    </div>
    <div class="container">
        <div class="center" >
            <div class="panel panel-default summary">
                <div class="panel-heading">
                    <h2 class="panel-title">Get Quote</h2>
                    <span class="edit-detail">
                        <a href="T2_Get_Quote_Page.html">Edit</a>
                    </span>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-xs-12 col-sm-6">
                            <div class="row detail-row">
                                <div class="col-xs-6 text-left odd">
                                    <span>Make</span>
                                </div>
                                <div class="col-xs-6 text-right odd">
                                    <span>Audi</span>
                                </div>
                                <div class="col-xs-6 text-left even">
                                    <span>Model Registration Document</span>
                                </div>
                                <div class="col-xs-6 text-right even">
                                    <span>A1 Sportback 30A1 Sportback 30</span>
                                </div>
                                <div class="col-xs-6 text-left odd">
                                    <span>CC</span>
                                </div>
                                <div class="col-xs-6 text-right odd">
                                    <span>1,395 c.c</span>
                                </div>
                                <div class="col-xs-6 text-left even">
                                    <span>Year</span>
                                </div>
                                <div class="col-xs-6 text-right even">
                                    <span>2000</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6">
                            <div class="row detail-row">
                                <div class="col-xs-6 text-left odd">
                                    <span>Chasis No.</span> 
                                </div>
                                <div class="col-xs-6 text-right odd">
                                    <span>1231231231</span>
                                </div>
                                <div class="col-xs-6 text-left even">
                                    <span>Estimated Value</span>
                                </div>
                                <div class="col-xs-6 text-right even">
                                    <span>HK $XXX</span>
                                </div>
                                <div class="col-xs-6 text-left odd">
                                    <span>Bank Mortgage</span>
                                </div>
                                <div class="col-xs-6 text-right odd">
                                    <span>HSBC</span>
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
            <div class="panel panel-default summary">
                <div class="panel-heading">
                    <h2 class="panel-title">Car Details</h2>
                    <span class="edit-detail">
                        <a href="T6_Sign_Up_Page1.html">Edit</a>
                    </span>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-xs-12 col-sm-6">
                            <div class="row detail-row">
                                <div class="col-xs-6 text-left odd">
                                    <span>Make</span>
                                </div>
                                <div class="col-xs-6 text-right odd">
                                    <span>Audi</span>
                                </div>
                                <div class="col-xs-6 text-left even">
                                    <span> Model Registration Document</span>
                                </div>
                                <div class="col-xs-6 text-right even">
                                    <span> A1 Sportback 30A1 Sportback 30</span>
                                </div>
                                <div class="col-xs-6 text-left odd">
                                    <span>CC</span>
                                </div>
                                <div class="col-xs-6 text-right odd">
                                    <span>1,395 c.c</span>
                                </div>
                                <div class="col-xs-6 text-left even">
                                    <span>Year</span>
                                </div>
                                <div class="col-xs-6 text-right even">
                                    <span>2000</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6">
                            <div class="row detail-row">
                                <div class="col-xs-6 text-left odd">
                                    <span>Chasis No.</span> 
                                </div>
                                <div class="col-xs-6 text-right odd">
                                    <span>1231231231</span>
                                </div>
                                <div class="col-xs-6 text-left even">
                                    <span>Estimated Value</span>
                                </div>
                                <div class="col-xs-6 text-right even">
                                    <span>HK $XXX</span>
                                </div>
                                <div class="col-xs-6 text-left odd">
                                    <span>Bank Mortgage</span>
                                </div>
                                <div class="col-xs-6 text-right odd">
                                    <span>HSBC</span>
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
            <div class="panel panel-default summary">
                <div class="panel-heading">
                    <h2 class="panel-title">Applicant Detail</h2>
                    <span class="edit-detail">
                        <a href="T7_Sign_Up_Page2.html">Edit</a>
                    </span>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-xs-12 col-sm-6">
                            <div class="row detail-row">
                                <div class="col-xs-6 text-left odd">
                                    <span>Full Name</span>
                                </div>
                                <div class="col-xs-6 text-right odd">
                                    <span>Audi</span>
                                </div>
                                <div class="col-xs-6 text-left even">
                                    <span>Date of Birth</span>
                                </div>
                                <div class="col-xs-6 text-right even">
                                    <span>12-12-2014</span>
                                </div>
                                <div class="col-xs-6 text-left odd">
                                    <span>Occuption</span>
                                </div>
                                <div class="col-xs-6 text-right odd">
                                    <span>Designer</span>
                                </div>
                                <div class="col-xs-6 text-left even">
                                    <span>HKID</span>
                                </div>
                                <div class="col-xs-6 text-right even">
                                    <span>GG1223311</span>
                                </div>
                                <div class="col-xs-6 text-left odd">
                                    <span>Address</span>
                                </div>
                                <div class="col-xs-6 text-right odd">
                                    <span>Flat A</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6">
                            <div class="row detail-row">
                                <div class="col-xs-6 text-left odd">
                                    <span>Contact No.</span> 
                                </div>
                                <div class="col-xs-6 text-right odd">
                                    <span>1231231231</span>
                                </div>
                                <div class="col-xs-6 text-left even">
                                    <span>Email</span>
                                </div>
                                <div class="col-xs-6 text-right even">
                                    <span>TTT@XXX.com</span>
                                </div>
                                <div class="col-xs-6 text-left odd">
                                    <span>Policy Start Date</span>
                                </div>
                                <div class="col-xs-6 text-right odd">
                                    <span>12-12-2016</span>
                                </div>
                                <div class="col-xs-6 text-left even">
                                    <span>Policy End Date</span>
                                </div>
                                <div class="col-xs-6 text-right even">
                                    <span>12-12-2017</span>
                                </div>
                                <div class="col-xs-6 text-left odd hidden-xs">
                                </div>
                                <div class="col-xs-6 text-right odd hidden-xs">
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
            <div class="panel panel-default summary">
                <div class="panel-heading">
                    <h2 class="panel-title">Driver Details</h2>
                    <span class="edit-detail">
                        <a href="T8_Sign_Up_Page3.html">Edit</a>
                    </span>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-xs-12 col-sm-6 driver-detail" id="driver1">
                            <div class="row detail-row">
                                <div class="col-xs-6 text-left odd">
                                    <span class="title">Diver 1</span>
                                </div>
                                <div class="col-xs-6 text-right odd">
                                </div>
                                <div class="col-xs-6 text-left even">
                                    <span>Full name</span>
                                </div>
                                <div class="col-xs-6 text-right even">
                                    <span>Fu Chan</span>
                                </div>
                                <div class="col-xs-6 text-left odd">
                                    <span>Occupation</span>
                                </div>
                                <div class="col-xs-6 text-right odd">
                                    <span>IT</span>
                                </div>
                                <div class="col-xs-6 text-left even">
                                    <span>Date of Birth</span>
                                </div>
                                <div class="col-xs-6 text-right even">
                                    <span>12-12-2000</span>
                                </div>
                                <div class="col-xs-6 text-left odd">
                                    <span>HKID</span>
                                </div>
                                <div class="col-xs-6 text-right odd">
                                    <span>GG1111222</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 driver-detail" id="driver2">
                            <div class="row detail-row">
                                <div class="col-xs-6 text-left odd">
                                    <span class="title">Diver 2</span>
                                </div>
                                <div class="col-xs-6 text-right odd">
                                </div>
                                <div class="col-xs-6 text-left even">
                                    <span>Full name</span>
                                </div>
                                <div class="col-xs-6 text-right even">
                                    <span>Fu Chan</span>
                                </div>
                                <div class="col-xs-6 text-left odd">
                                    <span>Occupation</span>
                                </div>
                                <div class="col-xs-6 text-right odd">
                                    <span>IT</span>
                                </div>
                                <div class="col-xs-6 text-left even">
                                    <span>Date of Birth</span>
                                </div>
                                <div class="col-xs-6 text-right even">
                                    <span>12-12-2000</span>
                                </div>
                                <div class="col-xs-6 text-left odd">
                                    <span>HKID</span>
                                </div>
                                <div class="col-xs-6 text-right odd">
                                    <span>GG1111222</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 driver-detail" id="driver3">
                            <div class="row detail-row">
                                <div class="col-xs-6 text-left odd">
                                    <span class="title">Diver 3</span>
                                </div>
                                <div class="col-xs-6 text-right odd">
                                </div>
                                <div class="col-xs-6 text-left even">
                                    <span>Full name</span>
                                </div>
                                <div class="col-xs-6 text-right even">
                                    <span>Fu Chan</span>
                                </div>
                                <div class="col-xs-6 text-left odd">
                                    <span>Occupation</span>
                                </div>
                                <div class="col-xs-6 text-right odd">
                                    <span>IT</span>
                                </div>
                                <div class="col-xs-6 text-left even">
                                    <span>Date of Birth</span>
                                </div>
                                <div class="col-xs-6 text-right even">
                                    <span>12-12-2000</span>
                                </div>
                                <div class="col-xs-6 text-left odd">
                                    <span>HKID</span>
                                </div>
                                <div class="col-xs-6 text-right odd">
                                    <span>GG1111222</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 driver-detail" id="driver4">
                            <div class="row detail-row">
                                <div class="col-xs-6 text-left odd">
                                    <span class="title">Diver 4</span>
                                </div>
                                <div class="col-xs-6 text-right odd">
                                </div>
                                <div class="col-xs-6 text-left even">
                                    <span>Full name</span>
                                </div>
                                <div class="col-xs-6 text-right even">
                                    <span>Fu Chan</span>
                                </div>
                                <div class="col-xs-6 text-left odd">
                                    <span>Occupation</span>
                                </div>
                                <div class="col-xs-6 text-right odd">
                                    <span>IT</span>
                                </div>
                                <div class="col-xs-6 text-left even">
                                    <span>Date of Birth</span>
                                </div>
                                <div class="col-xs-6 text-right even">
                                    <span>12-12-2000</span>
                                </div>
                                <div class="col-xs-6 text-left odd">
                                    <span>HKID</span>
                                </div>
                                <div class="col-xs-6 text-right odd">
                                    <span>GG1111222</span>
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
            <div class="panel panel-default summary">
                <div class="panel-heading">
                    <h2 class="panel-title">No Claim Discount</h2>
                    <span class="edit-detail">
                        <a href="T8_Sign_Up_Page3.html">Edit</a>
                    </span>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-xs-12 col-sm-6">
                            <div class="row detail-row">
                                <div class="col-xs-6 text-left odd">
                                    <span>Name of Prev Incur</span>
                                </div>
                                <div class="col-xs-6 text-right odd">
                                    <span>FWD</span>
                                </div>
                                <div class="col-xs-6 text-left even">
                                    <span>Registration No. of Document</span>
                                </div>
                                <div class="col-xs-6 text-right even">
                                    <span>ffffffffff</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6">
                            <div class="row detail-row">
                                <div class="col-xs-6 text-left odd">
                                    <span>Prev. insur Expiry Date</span> 
                                </div>
                                <div class="col-xs-6 text-right odd">
                                    <span>12-31-2312</span>
                                </div>
                                <div class="col-xs-6 text-left even">
                                    <span>Prevous Policy No.</span>
                                </div>
                                <div class="col-xs-6 text-right even">
                                    <span>xxxxxXXX</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="panel panel-default finalPremium">
            <div class="panel-heading">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="row">
                            <div class="col-xs-6">
                                <h3 class="finalPremium-title">FINAL PREMIUM</h3>
                            </div>
                            <div class="col-xs-6 text-right">
                                <h3 class="finalPremium-title">HK$ <span class="price">4,230.00</span></h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-xs-12 ">
                        <div class="row">
                            <div class="col-xs-12">
                                <br>
                            </div>
                            <div class="col-xs-12">
                                <strong>Plan Type</strong> 
                            </div>
                            <div class="col-xs-6">
                                <span>Comprehensive Insurance</span>
                            </div>
                            <div class="col-xs-6 text-right">
                                <span>300.00</span>
                            </div>
                            <div class="col-xs-12">
                                <br>
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
                                <hr>
                            </div>
                            <div class="col-xs-6 orange">
                                <strong>Amount due:</strong>
                            </div>
                            <div class="col-xs-6 text-right">
                                <h2 class="finalPremium-title orange">HKD$<span>4,300.00</span></h2>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="center" >
            <div class="panel panel-default payment-detail">
                <div class="panel-heading">
                    <h2 class="panel-title">Payment Detail</h2>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-sm-10 col-sm-offset-1">
                            <div class="row">
                                <form action="" method="post" class="no-claim" data-toggle="validator">
                                    <div class="col-xs-12">
                                        <div class="row detail-row">
                                            <div class="col-xs-4 col-sm-2 text-left">
                                                <span>We accept</span>
                                            </div>
                                            <div class="col-xs-8 col-sm-10 text-left">
                                                <span>
                                                    <img src="https://dummyimage.com/80x45/ccc/000.png" alt="" />
                                                    <img src="https://dummyimage.com/80x45/ccc/000.png" alt="" />
                                                </span>
                                            </div>
                                            <div class="col-xs-12 col-sm-6 text-left">
                                                <div class="form-group">
                                                    <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                        <div class="help-block-wrap">
                                                            <input type="text" name="cardName" maxlength="100" class="form-control mdl-textfield__input" id="fullName" required>
                                                            <label class="mdl-textfield__label" >Name on credit card</label>
                                                            <div class="help-block with-errors"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-6 text-left">
                                                <div class="form-group">
                                                    <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                        <div class="help-block-wrap">
                                                            <input type="text" name="cardNo" maxlength="100" class="form-control mdl-textfield__input" id="fullName" required>
                                                            <label class="mdl-textfield__label" >Credit card number</label>
                                                            <div class="help-block with-errors"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-3 text-left">
                                                <label>Expiry date</label>
                                                <select class="form-control" name="month">
                                                    <option value="" disabled selected hidden>Month</option>
                                                    <option value="1" >January</option>
                                                </select>
                                            </div>
                                            <div class="col-xs-6 col-sm-3 text-left">
                                                <label></label>
                                                <select class="form-control">
                                                    <option value="" disabled selected hidden>Year</option>
                                                </select>
                                            </div>
                                            <div class="col-xs-6 col-sm-3 text-left">
                                                <label></label>
                                                <div class="form-group">
                                                    <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                        <div class="help-block-wrap">
                                                            <input type="text" name="securityCode" maxlength="100" class="form-control mdl-textfield__input" id="fullName" required>
                                                            <label class="mdl-textfield__label" >Security Code</label>
                                                            <div class="help-block with-errors"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-3 text-left">
                                                <span>
                                                    <img src="https://dummyimage.com/80x45/ccc/000.png" alt="" />
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12">
                                        <div class="custom-checkbox">
                                            <div class="checkbox">
                                                <div class="form-group">
                                                    <div class="help-block-wrap">
                                                        <input type="checkbox" id="" name="" value="" required>
                                                        <label class="text-left"><small>
                                                                Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. </small>
                                                        </label>
                                                        <div class="help-block with-errors text-left"></div>
                                                    </div>
                                                </div>
                                                <br/>
                                                <br/>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="center" >
            <div class="panel panel-default memberLogin">
                <div class="panel-heading">
                    <h2 class="panel-title">Member Login (optional)</h2>
                </div>
                <div class="panel-body">
                    <div class="plan-accordion">
                        <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true" >
                            <div class="panel panel-default loginPanel">
                                <div class="panel-heading" role="tab" id="headingOne">
                                    <h4 class="panel-title">
                                        <a role="button" data-toggle="collapse" href="#collapseOne" aria-controls="collapseOne" aria-expanded="true">
                                            Login <i class="fa fa-caret-down" aria-hidden="true"></i>
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapseOne" class="panel-collapse in" role="tabpanel" aria-labelledby="headingOne">
                                    <div class="panel-body">
                                        <form name="loginform" id="loginformPopup" method="post">
                                            <div class="row">
                                                <div class="col-xs-12 col-sm-10 col-sm-offset-1">
                                                    <div class="form-container row">
                                                        <div class="col-xs-12 col-sm-6">
                                                            <div class="form-group">
                                                                <!--ä½¿ç¨èå -->
                                                                <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label text-left">
                                                                    <input type="text" name="userName"
                                                                    class="form-control check-emp login-input mdl-textfield__input" id="headerUserName" onkeypress="return validationUsername(event);">
                                                                    <!-- å¿è¨ä½¿ç¨èå -->
                                                                    <a href="javascript:;" id="forgotUserName" class="heading-h5">Forgot username?</a>
                                                                    <label class="mdl-textfield__label" for="headerUserName">Username</label>
                                                                    <span id="errUserName" class="empHide color-red heading-h5"></span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-6">
                                                            <div class="form-group">
                                                                <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label text-left">
                                                                    <input type="password" name="password"
                                                                    class="form-control check-emp-forgotusername login-input mdl-textfield__input" autocomplete="off" id="headerPassword">
                                                                    <label class="mdl-textfield__label" for="headerPassword">Password</label>
                                                                    <!--å¿è¨å¯ç¢¼ -->
                                                                    <a href="javascript:;" id="link-forgotPassword" class="heading-h5">Forgot password?</a>
                                                                    <span id="errPass" class="empHide color-red heading-h5"></span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12">
                                                            <div class="login-button-group">
                                                                <input id="fna-check" type="hidden" name="fna" value="false">
                                                                <input id="forcefna" type="hidden" name="forcefna" value="false">
                                                                <input id="nav-bar-check" type="hidden" name="isNavBar" value="true">
                                                                <button type="button" onclick="submitLoginForm('loginformPopup');"
                                                                    class="cta-confirm cta-font cta-orange cta-padding-40">
                                                                    Log In
                                                                </button>
                                                                <div class="login-error-wrapper">
                                                                    <div id="login-err-msg" class="color-red heading-h5"
                                                                        role="alert"></div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <div id="forgotUserPassPopup" class="hidden" >
                                    <span id="closeUserPass" class="closeForm">
                                        <i class="fa fa-times" aria-hidden="true"></i>
                                    </span>
                                    <div class="panel-body">
                                        <form name="" id="forgetPassform" method="post" >
                                            <div class="row">
                                                <div class="col-xs-12 col-sm-10 col-sm-offset-1" >
                                                    <div class="form-container row">
                                                        <div class="col-xs-12">
                                                            <h3>
                                                                Forgot password
                                                            </h3>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-6">
                                                            <div class="form-group">
                                                                <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                                    <div class="help-block-wrap">
                                                                        <input type="text" name="contactNum" pattern="^\d{8}$" maxlength="8" class="form-control check-emp login-input mdl-textfield__input" id="mobileNo" required>
                                                                        <label class="mdl-textfield__label" for="headerUserName">Mobile No.</label>
                                                                        <div class="help-block with-errors"></div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-6">
                                                            <div class="form-group">
                                                                <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                                    <div class="help-block-wrap">
                                                                        <input type="email" name="email"
                                                                        class="form-control mdl-textfield__input" required>
                                                                        <label class="mdl-textfield__label" for="email">Email</label>
                                                                        <div class="help-block with-errors"></div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-6">
                                                            <div class="form-group">
                                                                <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                                    <div class="help-block-wrap">
                                                                        <input type="text" name="fullName" maxlength="100" class="form-control mdl-textfield__input" required>
                                                                        <label class="mdl-textfield__label" >Full Name</label>
                                                                        <div class="help-block with-errors"></div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12">
                                                            <button type="button" onclick="" class="cta-confirm cta-font cta-orange cta-padding-40">
                                                                Submit 
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <div id="forgotUserNamePopup" class="hidden" >
                                    <span id="closeUserName" class="closeForm">
                                        <i class="fa fa-times" aria-hidden="true"></i>
                                    </span>
                                    <div class="panel-body">
                                        <form name="" id="forgetuserform" method="post" >
                                            <div class="row">
                                                <div class="col-xs-12 col-sm-10 col-sm-offset-1" >
                                                    <div class="form-container row">
                                                        <div class="col-xs-12">
                                                            <h3>
                                                                Forgot username
                                                            </h3>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-6">
                                                            <div class="form-group">
                                                                <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                                    <div class="help-block-wrap">
                                                                        <input type="text" name="contactNum" pattern="^\d{8}$" maxlength="8" class="form-control check-emp login-input mdl-textfield__input" id="mobileNo" required>
                                                                        <label class="mdl-textfield__label" for="headerUserName">Mobile No.</label>
                                                                        <div class="help-block with-errors"></div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-6">
                                                            <div class="form-group">
                                                                <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                                    <div class="help-block-wrap">
                                                                        <input type="email" name="email"
                                                                        class="form-control mdl-textfield__input" required>
                                                                        <label class="mdl-textfield__label" for="email">Email</label>
                                                                        <div class="help-block with-errors"></div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12">
                                                            <button type="button" onclick="" class="cta-confirm cta-font cta-orange cta-padding-40">
                                                                Submit 
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default registerPanel">
                                <div class="panel-heading" role="tab" id="headingTwo">
                                    <h4 class="panel-title">
                                        <a class="collapsed" role="button" data-toggle="collapse" href="#collapseTwo" aria-controls="collapseTwo">
                                            Register <i class="fa fa-caret-down" aria-hidden="true"></i>
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-sm-10 col-sm-offset-1 col-xs-12">
                                                <form id="userDetails" data-toggle="validator" name="joinus_form" role="form" class="form-horizontal" action="/tc/joinus" method="post">
                                                    <div class="row form-container">
                                                        <div class="col-xs-12 col-sm-6">
                                                            <div class="form-group">
                                                                <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                                    <div class="help-block-wrap">
                                                                        <input type="text" name="fullName" maxlength="100" class="form-control mdl-textfield__input" required>
                                                                        <label class="mdl-textfield__label" >Full Name</label>
                                                                        <div class="help-block with-errors"></div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-6">
                                                            <div class="form-group">
                                                                <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                                    <div class="help-block-wrap">
                                                                        <input type="text" name="contactNum" pattern="^\d{8}$" maxlength="8" class="form-control check-emp login-input mdl-textfield__input" id="mobileNo" required>
                                                                        <label class="mdl-textfield__label" for="headerUserName">Mobile No.</label>
                                                                        <div class="help-block with-errors"></div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="clearfix"></div>
                                                        <div class="col-xs-12 col-sm-6">
                                                            <div class="form-group">
                                                                <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                                    <div class="help-block-wrap">
                                                                        <input type="email" name="email"
                                                                        class="form-control mdl-textfield__input" required>
                                                                        <label class="mdl-textfield__label" for="email">Email</label>
                                                                        <div class="help-block with-errors"></div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-6">
                                                            <div class="form-group">
                                                                <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                                    <div class="help-block-wrap">
                                                                        <input type="text" name="userName" maxlength="100" class="form-control mdl-textfield__input" required>
                                                                        <label class="mdl-textfield__label" >User Name</label>
                                                                        <div class="help-block with-errors"></div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-6">
                                                            <div class="form-group">
                                                                <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                                    <div class="help-block-wrap">
                                                                        <input type="password" name="pwd" maxlength="100" class="form-control mdl-textfield__input" required>
                                                                        <label class="mdl-textfield__label" >Password</label>
                                                                        <div class="help-block with-errors"></div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-6">
                                                            <div class="form-group">
                                                                <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                                    <div class="help-block-wrap">
                                                                        <input type="password" name="confirmPwd" maxlength="100" class="form-control mdl-textfield__input" required>
                                                                        <label class="mdl-textfield__label" >Confirm Password</label>
                                                                        <div class="help-block with-errors"></div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="clearfix"></div>
                                                        <div class="col-xs-12 text-left">
                                                            <div class="custom-checkbox">
                                                                <div class="checkbox">
                                                                    <div class="form-group">
                                                                        <div class="help-block-wrap">
                                                                            <input type="checkbox" id="registerAgree1" name="registerAgree1" value="" required>
                                                                            <label><small>
                                                                                    Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. </small>
                                                                            </label>
                                                                            <div class="help-block with-errors"></div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="custom-checkbox">
                                                                <div class="checkbox">
                                                                    <div class="form-group">
                                                                        <div class="help-block-wrap">
                                                                            <input type="checkbox" id="registerAgree2" name="registerAgree2" value="" required>
                                                                            <label><small>
                                                                                    Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. </small>
                                                                            </label>
                                                                            <div class="help-block with-errors"></div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="custom-checkbox">
                                                                <div class="checkbox">
                                                                    <div class="form-group">
                                                                        <div class="help-block-wrap">
                                                                            <input type="checkbox" id="registerAgree3" name="registerAgree3" value="" required>
                                                                            <label><small>
                                                                                    Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. </small>
                                                                            </label>
                                                                            <div class="help-block with-errors"></div>
                                                                        </div>
                                                                    </div>
                                                                    <br/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12">
                                                            <p>
                                                                <button type="button" onclick="" class="cta-confirm cta-font cta-orange cta-padding-40">
                                                                    Register 
                                                                </button>
                                                            </p>
                                                            <br/> 
                                                            <br/> 
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
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
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/motor/validator.min.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/motor/selectize.min.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/motor/motor-forms.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/motor/register-form.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/motor/custom-datepicker.js"></script>


