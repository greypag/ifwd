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
                                    <span>Car Make</span>
                                </div>
                                <div class="col-xs-6 text-right odd">
                                    <span class="carmake"></span>
                                </div>
                                <div class="col-xs-6 text-left odd">
                                    <span>C.C.</span>
                                </div>
                                <div class="col-xs-6 text-right odd">
                                    <span class="carcc"></span>
                                </div>
                                <div class="col-xs-6 text-left even">
                                    <span>Estimated value</span>
                                </div>
                                <div class="col-xs-6 text-right even">
                                    <span class="carvalue"></span>
                                </div>
                                <div class="col-xs-6 text-left even">
                                    <span>No Claim Discount</span>
                                </div>
                                <div class="col-xs-6 text-right even">
                                    <span class="cardiscount"></span>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6">
                            <div class="row detail-row">
                                <div class="col-xs-6 text-left odd">
                                    <span>Car Model.</span> 
                                </div>
                                <div class="col-xs-6 text-right odd">
                                    <span class="carmodel"></span>
                                </div>
                                <div class="col-xs-6 text-left even">
                                    <span>Made year</span>
                                </div>
                                <div class="col-xs-6 text-right even">
                                    <span class="carmade"></span>
                                </div>
                                <div class="col-xs-6 text-left odd">
                                    <span>Occupation</span>
                                </div>
                                <div class="col-xs-6 text-right odd">
                                    <span class="useroccupation"></span>
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
                                    <span>Chasis No.</span>
                                </div>
                                <div class="col-xs-6 text-right odd">
                                    <span class="carchasis"></span>
                                </div>
                                <div class="col-xs-6 text-left even">
                                    <span>Model Registration Document</span>
                                </div>
                                <div class="col-xs-6 text-right even">
                                    <span class="carmodeldocument"></span>
                                </div>
                                <div class="col-xs-6 text-left odd">
                                    <span>Other Bank Mortgage</span>
                                </div>
                                <div class="col-xs-6 text-right odd">
                                    <span class="carotherbankmortgage"></span>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6">
                            <div class="row detail-row">
                                <div class="col-xs-6 text-left odd">
                                    <span>Cubic Capacity</span> 
                                </div>
                                <div class="col-xs-6 text-right odd">
                                    <span class="carcubic"></span>
                                </div>
                                <div class="col-xs-6 text-left even">
                                    <span>Bank Mortgage.</span>
                                </div>
                                <div class="col-xs-6 text-right even">
                                    <span  class="carbankmortgage"></span>
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
                                    <span class="fullname"></span>
                                </div>
                                <div class="col-xs-6 text-left even">
                                    <span>Date of Birth</span>
                                </div>
                                <div class="col-xs-6 text-right even">
                                    <span class="birth" ></span>
                                </div>
                                <div class="col-xs-6 text-left odd">
                                    <span>HKID</span>
                                </div>
                                <div class="col-xs-6 text-right odd">
                                    <span class="hkid"></span>
                                </div>
                                <div class="col-xs-6 text-left even">
                                    <span>Correspondence Address</span>
                                </div>
                                <div class="col-xs-6 text-right even" style="height:120px;text-align: justify;">
                                    <span class="address"></span>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6">
                            <div class="row detail-row">
                                <div class="col-xs-6 text-left odd">
                                    <span>Contact No.</span> 
                                </div>
                                <div class="col-xs-6 text-right odd">
                                    <span class="contactno"></span>
                                </div>
                                <div class="col-xs-6 text-left even">
                                    <span>Email</span>
                                </div>
                                <div class="col-xs-6 text-right even">
                                    <span class="email"></span>
                                </div>
                                <div class="col-xs-6 text-left odd">
                                    <span>Policy Start Date</span>
                                </div>
                                <div class="col-xs-6 text-right odd">
                                    <span class="policystart"></span>
                                </div>
                                <div class="col-xs-6 text-left even">
                                    <span>Policy End Date</span>
                                </div>
                                <div class="col-xs-6 text-right even">
                                    <span class="policyend"></span>
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
                                    <span class="driver1fullname"></span>
                                </div>
                                <div class="col-xs-6 text-left odd">
                                    <span>Occupation</span>
                                </div>
                                <div class="col-xs-6 text-right odd">
                                    <span  class="driver1occupation"></span>
                                </div>
                                <div class="col-xs-6 text-left even">
                                    <span>Date of Birth</span>
                                </div>
                                <div class="col-xs-6 text-right even">
                                    <span class="driver1birth"></span>
                                </div>
                                <div class="col-xs-6 text-left odd">
                                    <span>HKID</span>
                                </div>
                                <div class="col-xs-6 text-right odd">
                                    <span class="driver1hkid"></span>
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
                                    <span class="driver2fullname"></span>
                                </div>
                                <div class="col-xs-6 text-left odd">
                                    <span>Occupation</span>
                                </div>
                                <div class="col-xs-6 text-right odd">
                                    <span class="driver2occupation"></span>
                                </div>
                                <div class="col-xs-6 text-left even">
                                    <span>Date of Birth</span>
                                </div>
                                <div class="col-xs-6 text-right even">
                                    <span class="driver2birth"></span>
                                </div>
                                <div class="col-xs-6 text-left odd">
                                    <span>HKID</span>
                                </div>
                                <div class="col-xs-6 text-right odd">
                                    <span class="driver2hkid"></span>
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
                                    <span class="driver3fullname"></span>
                                </div>
                                <div class="col-xs-6 text-left odd">
                                    <span>Occupation</span>
                                </div>
                                <div class="col-xs-6 text-right odd">
                                    <span class="driver3occupation"></span>
                                </div>
                                <div class="col-xs-6 text-left even">
                                    <span>Date of Birth</span>
                                </div>
                                <div class="col-xs-6 text-right even">
                                    <span class="driver3birth"></span>
                                </div>
                                <div class="col-xs-6 text-left odd">
                                    <span>HKID</span>
                                </div>
                                <div class="col-xs-6 text-right odd">
                                    <span class="driver3hkid"></span>
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
                                    <span class="driver4fullname"></span>
                                </div>
                                <div class="col-xs-6 text-left odd">
                                    <span>Occupation</span>
                                </div>
                                <div class="col-xs-6 text-right odd">
                                    <span class="driver4occupation"></span>
                                </div>
                                <div class="col-xs-6 text-left even">
                                    <span>Date of Birth</span>
                                </div>
                                <div class="col-xs-6 text-right even">
                                    <span class="driver4birth"></span>
                                </div>
                                <div class="col-xs-6 text-left odd">
                                    <span>HKID</span>
                                </div>
                                <div class="col-xs-6 text-right odd">
                                    <span class="driver4hkid"></span>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 driver-detail" id="driver5">
                            <div class="row detail-row">
                                <div class="col-xs-6 text-left odd">
                                    <span class="title">Diver 5</span>
                                </div>
                                <div class="col-xs-6 text-right odd">
                                </div>
                                <div class="col-xs-6 text-left even">
                                    <span>Full name</span>
                                </div>
                                <div class="col-xs-6 text-right even">
                                    <span class="driver5fullname"></span>
                                </div>
                                <div class="col-xs-6 text-left odd">
                                    <span>Occupation</span>
                                </div>
                                <div class="col-xs-6 text-right odd">
                                    <span class="driver5occupation"></span>
                                </div>
                                <div class="col-xs-6 text-left even">
                                    <span>Date of Birth</span>
                                </div>
                                <div class="col-xs-6 text-right even">
                                    <span class="driver5birth"></span>
                                </div>
                                <div class="col-xs-6 text-left odd">
                                    <span>HKID</span>
                                </div>
                                <div class="col-xs-6 text-right odd">
                                    <span class="driver5hkid"></span>
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
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/motor/bootstrap-switch.min.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/motor/selectize.min.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/motor/motor-forms.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/motor/register-form.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/motor/custom-datepicker.js"></script>
<script>
var quote = jQuery.parseJSON('<%=request.getParameter("data").replace("&quot;", "\"")%>');
$(document).ready(function(){
	/*$.ajax({
	  type: "GET",
	  dataType: "json",
      contentType : "application/json",
      cache: false,
      async: false,
	  url: "/api/session",
	  success: function(data){
		  console.dir(data);
	  },error: function(error) {
		  console.dir(error);
			return false;
	  }
	});*/
	//quote
	$(".carmake").html(quote.carDetail.makeCode);
	$(".carmodel").html(quote.carDetail.model);
	$(".carcc").html(quote.carDetail.engineCapacity);
	$(".carmade").html(quote.carDetail.yearOfManufacture);
	$(".carvalue").html(quote.carDetail.estimatedValue);
	$(".useroccupation").html(quote.applicant.occupation);
	$(".cardiscount").html(quote.applicant.ncb+"%");
	
	//car details
	$(".carchasis").html(quote.FullCarDetails.carDetail.chassisNumber);
	$(".carcubic").html(quote.FullCarDetails.carDetail.engineCapacity);
	$(".carmodeldocument").html(quote.FullCarDetails.carDetail.modelDesc);
	$(".carbankmortgage").html(quote.FullCarDetails.carDetail.bankMortgageName);
	$(".carotherbankmortgage").html(quote.FullCarDetails.carDetail.bankMortgageName);
	
	//applicant detail
	$(".fullname").html(quote.FullDriversDetails.applicant.name);
	$(".contactno").html(quote.FullDriversDetails.applicant.contactNo);
	$(".birth").html(quote.FullDriversDetails.applicant.dateOfBirth);
	$(".email").html(quote.FullDriversDetails.applicant.email);
	$(".hkid").html(quote.FullDriversDetails.applicant.hkid);
	$(".policystart").html(quote.FullDriversDetails.policyStartDate);
	var address = quote.FullDriversDetails.applicant.correspondenceAddress.flat + ", " +
				  quote.FullDriversDetails.applicant.correspondenceAddress.floor + ", " +
				  quote.FullDriversDetails.applicant.correspondenceAddress.block + ", " +
				  quote.FullDriversDetails.applicant.correspondenceAddress.building + ", " +
				  quote.FullDriversDetails.applicant.correspondenceAddress.streetName + ", " +
				  quote.FullDriversDetails.applicant.correspondenceAddress.streetNo + ", " +
				  quote.FullDriversDetails.applicant.correspondenceAddress.district + ", " +
				  quote.FullDriversDetails.applicant.correspondenceAddress.estate + " " +
				  quote.FullDriversDetails.applicant.correspondenceAddress.hkKlNt;
	$(".address").html(address);
	$(".policyend").html(quote.FullDriversDetails.applicant.modelDesc);
	
	//drivers
	$(".driver1fullname").html(quote.FulPolicyDetails.driver[0].name);
	$(".driver1occupation").html(quote.FulPolicyDetails.driver[0].occupation);
	$(".driver1birth").html(quote.FulPolicyDetails.driver[0].dateOfBirth);
	$(".driver1hkid").html(quote.FulPolicyDetails.driver[0].hkid);
	
	if(quote.FulPolicyDetails.driver[1].name=="")
		$("#driver2").hide();
	else{	
		$(".driver2fullname").html(quote.FulPolicyDetails.driver[1].name);
		$(".driver2occupation").html(quote.FulPolicyDetails.driver[1].occupation);
		$(".driver2birth").html(quote.FulPolicyDetails.driver[1].dateOfBirth);
		$(".driver2hkid").html(quote.FulPolicyDetails.driver[1].hkid);
	}
	
	if(quote.FulPolicyDetails.driver[2].name=="")
		$("#driver3").hide();
	else{	
		$(".driver3fullname").html(quote.FulPolicyDetails.driver[2].name);
		$(".driver3occupation").html(quote.FulPolicyDetails.driver[2].occupation);
		$(".driver3birth").html(quote.FulPolicyDetails.driver[2].dateOfBirth);
		$(".driver3hkid").html(quote.FulPolicyDetails.driver[2].hkid);
	}
	
	if(quote.FulPolicyDetails.driver[3].name=="")
		$("#driver4").hide();
	else{	
		$(".driver4fullname").html(quote.FulPolicyDetails.driver[3].name);
		$(".driver4occupation").html(quote.FulPolicyDetails.driver[3].occupation);
		$(".driver4birth").html(quote.FulPolicyDetails.driver[3].dateOfBirth);
		$(".driver4hkid").html(quote.FulPolicyDetails.driver[3].hkid);
	}
	
	if(quote.FulPolicyDetails.driver[4].name=="")
		$("#driver5").hide();
	else{	
		$(".driver5fullname").html(quote.FulPolicyDetails.driver[4].name);
		$(".driver5occupation").html(quote.FulPolicyDetails.driver[4].occupation);
		$(".driver5birth").html(quote.FulPolicyDetails.driver[4].dateOfBirth);
		$(".driver5hkid").html(quote.FulPolicyDetails.driver[4].hkid);
	}	
	
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
	
});
</script>

