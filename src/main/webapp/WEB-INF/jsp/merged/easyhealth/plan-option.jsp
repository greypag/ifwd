<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeQuoteBean"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="enhance" uri="http://pukkaone.github.com/jsp" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<script type="text/javascript">
var context = "${pageContext.request.contextPath}";
var language = "${language}";
var affiliate = "${affiliate}";
var home_url = "<%=request.getContextPath()%>";
</script>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/easy-health/nouislider.min.css">
        <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/easy-health/style.css">
        <link href="<%=request.getContextPath()%>/resources/css/easy-health/mobiscroll.custom-2.17.1.min.css" rel="stylesheet" type="text/css" />
        <script src="<%=request.getContextPath()%>/resources/js/easy-health/mobiscroll.custom-2.17.1.min.js" type="text/javascript"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/easy-health/nouislider.min.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/easy-health/jquery-ui.effect.core.min.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/easy-health/uifn.js"></script>
        <div class="easy-health">
            <div id="bought-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel" data-backdrop="static" data-keyboard="false">
                <div class="modal-dialog modal-sm" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title text-center" id="gridSystemModalLabel">Sorry, You have bought this product. You may like: </h4>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-xs-12 col-md-6">
                                    <div class="col-xs-12">
                                        <img src="<%=request.getContextPath()%>/resources/images/easy-health/popup_suggest_1.jpg" alt="img" class="img-responsive">
                                    </div>
                                    <div class="col-xs-12 txt-box">
                                        <h4>TravelCare(Annual Cover)</h4>
                                        <p>Embark on an adventure abroad with a comprehensive travel protection companion.</p>
                                    </div>
                                    <div class="col-xs-12">
                                        <a href="javascript:void(0);" class="savie-common-btn">Details</a>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-md-6">
                                    <div class="col-xs-12">
                                        <img src="<%=request.getContextPath()%>/resources/images/easy-health/popup_suggest_2.jpg" alt="img" class="img-responsive">
                                    </div>
                                    <div class="col-xs-12 txt-box">
                                        <h4>Easy Home Care</h4>
                                        <p>Protect your home for around HK$1 a day, against loss or damage from fire, flood, bursting pipes, typhoon, theft, and accidents.</p>
                                    </div>
                                    <div class="col-xs-12">
                                        <a href="javascript:void(0);" class="savie-common-btn">Details</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>
            <!-- /.modal -->
            <div class="step1">
                <div class="container">
                    <dir class="row">
                        <div class="col-sm-12">
                            <div class="text-center title">
                                <img src="<%=request.getContextPath()%>/resources/images/easy-health/p1_img_02_title02_en.png" class="img-responsive eh-img-title inline-block">
                                <p>Need financial support when unexpected hospitalization
                                    <br>caused by sickness or bodily injury occurred?</p>
                            </div>
                        </div>
                    </dir>
                    <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-10 col-md-offset-1">
                            <div class="row row-eq-height">
                                <div class="col-sm-4 col-xs-12 selectionBox">
                                    <div class="selection-grid">
                                        <h5 class="text-center">Gender:</h5>
                                        <div class="selection-inner" id="gender-opt">
                                            <div class="row">
                                                <div class="col-sm-6 col-xs-6 item" data-gender="0">
                                                    <img src="<%=request.getContextPath()%>/resources/images/easy-health/p1_select_male_off.png" class="img-responsive">
                                                    <p class="text-center">Male</p>
                                                </div>
                                                <div class="col-sm-6 col-xs-6 item" data-gender="1">
                                                    <img src="<%=request.getContextPath()%>/resources/images/easy-health/p1_select_female_off.png" class="img-responsive">
                                                    <p class="text-center">Female</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="clearfix visible-xs"></div>
                                <div class="col-sm-4 col-xs-12 selectionBox">
                                    <div class="selection-grid">
                                        <h5 class="text-center">Smoking Habit?</h5>
                                        <div class="selection-inner" id="smoker-opt">
                                            <div class="row">
                                                <div class="col-sm-6 col-xs-6 item" data-smoker="1">
                                                    <img src="<%=request.getContextPath()%>/resources/images/easy-health/p1_select_smoker_off.png" class="img-responsive">
                                                    <p class="text-center">Smoker</p>
                                                </div>
                                                <div class="col-sm-6 col-xs-6 item" data-smoker="0">
                                                    <img src="<%=request.getContextPath()%>/resources/images/easy-health/p1_select_nonsmoker_off.png" class="img-responsive">
                                                    <p class="text-center">Non-smoker</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="clearfix visible-xs"></div>
                                <div class="col-sm-4 col-xs-12 selectionBox">
                                    <div class="selection-grid">
                                        <h5 class="text-center">Date of Birth:</h5>
                                        <input id="dob" name="dob" placeholder="Please Select ..." readonly>
                                    </div>
                                </div>
                                <div class="clearfix visible-xs"></div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm12">
                            <div class="text-center">
                                <a href="javascript:void(0);" class="eh-btn-plan-overview savie-common-btn disabled-gray-btn">Plan overview</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="step2">
                <div class="container">
                    <dir class="row">
                        <div class="col-sm-12">
                            <div class="text-center title">
                                <img src="<%=request.getContextPath()%>/resources/images/easy-health/p1_img_02_title02_en.png" class="img-responsive inline-block">
                                <p>Need financial support when unexpected hospitalization
                                    <br>caused by sickness or bodily injury occurred?</p>
                            </div>
                        </div>
                    </dir>
                    <div class="row">
                        <div class="col-sm-12 col-xs-12">
                            <div class="tbl-compare">
                                <br>
                                <a href="javascript:void(0);" class="hidden-sm hidden-md hidden-lg btn-back-step1 btn-back2-step1-mb"><span>Back</span><img src="<%=request.getContextPath()%>/resources/images/easy-health/btn_edit_mb_placeholder.png" alt=""></a>
                                <a href="javascript:void(0);" class="visible-sm visible-md visible-lg btn-back-step1 btn-back2-step1-dt">Back to Personal Information</a>
                                <div class="inner">
                                    <table>
                                        <thead>
                                            <tr class="plan-name">
                                                <th></th>
                                                <th>
                                                    <div class="text-center">
                                                        <img src="<%=request.getContextPath()%>/resources/images/easy-health/p2_hospital_A.png">
                                                        <br><span class="txt-type-a"></span>
                                                    </div>
                                                </th>
                                                <th>
                                                    <div class="text-center">
                                                        <img src="<%=request.getContextPath()%>/resources/images/easy-health/p2_hospital_B.png">
                                                        <br><span class="txt-type-b"></span>
                                                    </div>
                                                </th>
                                                <th>
                                                    <div class="text-center">
                                                        <img src="<%=request.getContextPath()%>/resources/images/easy-health/p2_hospital_C.png">
                                                        <br><span class="txt-type-c"></span>
                                                    </div>
                                                </th>
                                                <th>
                                                    <div class="text-center">
                                                        <img src="<%=request.getContextPath()%>/resources/images/easy-health/p2_hospital_D.png">
                                                        <br><span class="txt-type-d"></span>
                                                    </div>
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr class="plan-mca">
                                                <th>
                                                    <div class="row no-margin">
                                                        <img src="<%=request.getContextPath()%>/resources/images/easy-health/p5_icon_01.png" alt="Monthly Contribution" class="icon col-xs-3" data-toggle="tooltip" data-placement="right" title="Monthly Contribution Amount">
                                                        <span class="desc col-xs-9">Monthly Contribution Amount</span>
                                                    </div>
                                                </th>
                                                <th class="head t1 txt-price-a" data-grp="t1"></th>
                                                <th class="head t2 txt-price-b" data-grp="t2"></th>
                                                <th class="head t3 txt-price-c" data-grp="t3"></th>
                                                <th class="head t4 txt-price-d" data-grp="t4"></th>
                                            </tr>
                                            <tr class="plan-dhc">
                                                <th>
                                                    <div class="row no-margin">
                                                        <img src="<%=request.getContextPath()%>/resources/images/easy-health/p5_icon_02.png" alt="Monthly Contribution" class="icon col-xs-3" data-toggle="tooltip" data-placement="right" title="Daily Hospital Cash">
                                                        <span class="desc col-xs-9">Hospital Cash Benefit (per day)</span>
                                                    </div>
                                                </th>
                                                <td class="t1 txt-price-a" data-grp="t1"></td>
                                                <td class="t2 txt-price-b" data-grp="t2"></td>
                                                <td class="t3 txt-price-c" data-grp="t3"></td>
                                                <td class="t4 txt-price-d" data-grp="t4"></td>
                                            </tr>
                                            <tr class="plan-icu">
                                                <th>
                                                    <div class="row no-margin">
                                                        <img src="<%=request.getContextPath()%>/resources/images/easy-health/p5_icon_03.png" alt="Monthly Contribution" class="icon col-xs-3" data-toggle="tooltip" data-placement="right" title="Intensive Care Unit">
                                                        <span class="desc col-xs-9">Intensive Care Unit Benefit (per day)</span>
                                                    </div>
                                                </th>
                                                <td class="t1 txt-price-a" data-grp="t1"></td>
                                                <td class="t2 txt-price-b" data-grp="t2"></td>
                                                <td class="t3 txt-price-c" data-grp="t3"></td>
                                                <td class="t4 txt-price-d" data-grp="t4"></td>
                                            </tr>
                                            <tr class="plan-id">
                                                <th>
                                                    <div class="row no-margin">
                                                        <img src="<%=request.getContextPath()%>/resources/images/easy-health/p5_icon_04.png" alt="Monthly Contribution" class="icon col-xs-3" data-toggle="tooltip" data-placement="right" title="Infectious Disease">
                                                        <span class="desc col-xs-9">Infectious Disease Benefit (per day)</span>
                                                    </div>
                                                </th>
                                                <td class="t1 txt-price-a" data-grp="t1"></td>
                                                <td class="t2 txt-price-b" data-grp="t2"></td>
                                                <td class="t3 txt-price-c" data-grp="t3"></td>
                                                <td class="t4 txt-price-d" data-grp="t4"></td>
                                            </tr>
                                            <tr class="plan-rop">
                                                <th>
                                                    <div class="row no-margin">
                                                        <img src="<%=request.getContextPath()%>/resources/images/easy-health/p5_icon_07.png" alt="Monthly Contribution" class="icon col-xs-3" data-toggle="tooltip" data-placement="right" title="15 -Year Refund of Premium">
                                                        <span class="desc col-xs-9">Refund of Premium after 15 years</span>
                                                    </div>
                                                </th>
                                                <td class="t1 txt-price-a" data-grp="t1"></td>
                                                <td class="t2 txt-price-b" data-grp="t2"></td>
                                                <td class="t3 txt-price-c" data-grp="t3"></td>
                                                <td class="t4 txt-price-d" data-grp="t4"></td>
                                            </tr>
                                            <tr class="plan-db">
                                                <th>
                                                    <div class="row no-margin">
                                                        <img src="<%=request.getContextPath()%>/resources/images/easy-health/p5_icon_05.png" alt="Monthly Contribution" class="icon col-xs-3" data-toggle="tooltip" data-placement="right" title="Death Benefit">
                                                        <span class="desc col-xs-9">Death Benefit</span>
                                                    </div>
                                                </th>
                                                <td class="t1 txt-price-a" data-grp="t1">150% of Total Annualised Premium<sup>*</sup></td>
                                                <td class="t2 txt-price-b" data-grp="t2">150% of Total Annualised Premium<sup>*</sup></td>
                                                <td class="t3 txt-price-c" data-grp="t3">150% of Total Annualised Premium<sup>*</sup></td>
                                                <td class="t4 txt-price-d" data-grp="t4">150% of Total Annualised Premium<sup>*</sup></td>
                                            </tr>
                                            <tr class="plan-adb">
                                                <th>
                                                    <div class="row no-margin">
                                                        <img src="<%=request.getContextPath()%>/resources/images/easy-health/p5_icon_06.png" alt="Monthly Contribution" class="icon col-xs-3" data-toggle="tooltip" data-placement="right" title="Accidental Death Benefit">
                                                        <span class="desc col-xs-9">Accidental Death<br>Benefit</span>
                                                    </div>
                                                </th>
                                                <td class="t1 txt-price-a" data-grp="t1">Additional 50% of Total Annualised Premium<sup>*</sup></td>
                                                <td class="t2 txt-price-b" data-grp="t2">Additional 50% of Total Annualised Premium<sup>*</sup></td>
                                                <td class="t3 txt-price-c" data-grp="t3">Additional 50% of Total Annualised Premium<sup>*</sup></td>
                                                <td class="t4 txt-price-d" data-grp="t4">Additional 50% of Total Annualised Premium<sup>*</sup></td>
                                            </tr>
                                            <tr>
                                                <th></th>
                                                <td>
                                                    <a href="javascript:void(0);" class="eh-btn-tbl-detail savie-common-btn" data-tab="eh-plan-a">DETAILS</a>
                                                </td>
                                                <td>
                                                    <a href="javascript:void(0);" class="eh-btn-tbl-detail savie-common-btn" data-tab="eh-plan-b">DETAILS</a>
                                                </td>
                                                <td>
                                                    <a href="javascript:void(0);" class="eh-btn-tbl-detail savie-common-btn" data-tab="eh-plan-c">DETAILS</a>
                                                </td>
                                                <td>
                                                    <a href="javascript:void(0);" class="eh-btn-tbl-detail savie-common-btn" data-tab="eh-plan-d">DETAILS</a>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <!-- <div class="col-xs-12">
                            <div class="box-btn-select">
                                <div class="box-btn-cancel text-center">
                                    <a href="javascript:void(0);" class="savie-common-btn disabled-gray-btn btn-back-step1">
                                    Back
                                </a>
                                </div>
                            </div>
                        </div> -->
                        <div class="col-xs-12">
                            <p class="remarks"><small><sup>*</sup>Sum of the annualised premium of each policy year up to and including the policy year in which the insured died. Annualised premium of a policy year shall mean monthly premium of that policy year multiplied by 12.</small></p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="step-option">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-12">
                            <h3>Need some help to choose the right plan?</h3>
                            <p>Recommendations will be made based on your choices</p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-10 col-sm-offset-1">
                            <div class="box-option">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <h4><img src="<%=request.getContextPath()%>/resources/images/easy-health/p4_question.png" alt="?"> What type of food would you like to have during your hospital stay?</h4>
                                    </div>
                                </div>
                                <div class="row toggle-inner">
                                    <div class="col-sm-3">
                                        <a href="javascript:void(0);" class="item">
                                            <img src="<%=request.getContextPath()%>/resources/images/easy-health/p4_icon_01_off.png" class="img-responsive">Standard
                                            <br>Hospital Meals
                                        </a>
                                    </div>
                                    <div class="col-sm-3">
                                        <a href="javascript:void(0);" class="item">
                                            <img src="<%=request.getContextPath()%>/resources/images/easy-health/p4_icon_02_off.png" class="img-responsive">Premium Meals
                                        </a>
                                    </div>
                                    <div class="col-sm-3">
                                        <a href="javascript:void(0);" class="item">
                                            <img src="<%=request.getContextPath()%>/resources/images/easy-health/p4_icon_03_off.png" class="img-responsive">Home-made
                                            <br>Fresh Meals
                                        </a>
                                    </div>
                                    <div class="col-sm-3">
                                        <a href="javascript:void(0);" class="item">
                                            <img src="<%=request.getContextPath()%>/resources/images/easy-health/p4_icon_04_off.png" class="img-responsive">Health Supplements
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-10 col-sm-offset-1">
                            <div class="box-option">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <h4><img src="<%=request.getContextPath()%>/resources/images/easy-health/p4_question.png" alt="?"> You may feel bored in hospital, would you want some entertainments?</h4>
                                    </div>
                                </div>
                                <div class="row toggle-inner">
                                    <div class="col-sm-4">
                                        <a href="javascript:void(0);" class="item">
                                            <img src="<%=request.getContextPath()%>/resources/images/easy-health/p4_icon_05_off.png" class="img-responsive">Pay Online Entertainment
                                            <br>（TV shows, movies, video games）
                                        </a>
                                    </div>
                                    <div class="col-sm-4">
                                        <a href="javascript:void(0);" class="item">
                                            <img src="<%=request.getContextPath()%>/resources/images/easy-health/p4_icon_06_off.png" class="img-responsive">Daily WIFI or internet Service
                                        </a>
                                    </div>
                                    <div class="col-sm-4">
                                        <a href="javascript:void(0);" class="item">
                                            <img src="<%=request.getContextPath()%>/resources/images/easy-health/p4_icon_07_off.png" class="img-responsive">Books &amp; Magazines
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-10 col-sm-offset-1">
                            <div class="box-option">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <h4><img src="<%=request.getContextPath()%>/resources/images/easy-health/p4_question.png" alt="?"> You probably want to consider these services as well?</h4>
                                    </div>
                                </div>
                                <div class="row toggle-inner">
                                    <div class="col-sm-3">
                                        <a href="javascript:void(0);" class="item">
                                            <img src="<%=request.getContextPath()%>/resources/images/easy-health/p4_icon_08_off.png" class="img-responsive">Counselling
                                        </a>
                                    </div>
                                    <div class="col-sm-3">
                                        <a href="javascript:void(0);" class="item">
                                            <img src="<%=request.getContextPath()%>/resources/images/easy-health/p4_icon_09_off.png" class="img-responsive">Beauty Services
                                        </a>
                                    </div>
                                    <div class="col-sm-3">
                                        <a href="javascript:void(0);" class="item">
                                            <img src="<%=request.getContextPath()%>/resources/images/easy-health/p4_icon_10_off.png" class="img-responsive">Domestic Helpers
                                        </a>
                                    </div>
                                    <div class="col-sm-3">
                                        <a href="javascript:void(0);" class="item">
                                            <img src="<%=request.getContextPath()%>/resources/images/easy-health/p4_icon_11_off.png" class="img-responsive">Recuperation
                                            <br>(e.g. physiotherapy)
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-8">
                            <div class="box-btn-select">
                                <a href="javascript:void(0);" class="btn-option-select savie-common-btn">
                                    Show me the plan that is right for me
                                </a>
                            </div>
                        </div>
                        <br class="visible-xs">
                        <div class="col-sm-4">
                            <div class="box-btn-cancel">
                                <a href="javascript:void(0);" class="btn-option-select savie-common-btn disabled-gray-btn btn-option-cancel">
                                    Cancel
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="step3">
                <div class="movingBg movingBgL"></div>
                <div class="movingBg movingBgR"></div>
                <div class="plan-selector visible-md visible-lg">
                    <div class="container">
                        <div class="row">
                            <div class="plan-selector-grid">
                                <a href="javascript:void(0);" class="text-center btn-plan-back">
                                    <img src="<%=request.getContextPath()%>/resources/images/easy-health/main_btn_back.png">
                                    <br>
                                    <span>Plan Overview</span>
                                </a>
                            </div>
                            <div class="plan-selector-grid">
                                <a href="javascript:void(0);" class="text-center btn-plan-selector" data-tab="eh-plan-a">
                                    <span class="grid-head"></span>
                                    <span class="grid-desc"><span class="txt-price"></span> / Month</span>
                                </a>
                            </div>
                            <div class="plan-selector-grid">
                                <a href="javascript:void(0);" class="text-center btn-plan-selector" data-tab="eh-plan-b">
                                    <span class="grid-head"></span>
                                    <span class="grid-desc"><span class="txt-price"></span> / Month</span>
                                </a>
                            </div>
                            <div class="plan-selector-grid">
                                <a href="javascript:void(0);" class="text-center btn-plan-selector" data-tab="eh-plan-c">
                                    <span class="grid-head"></span>
                                    <span class="grid-desc"><span class="txt-price"></span> / Month</span>
                                </a>
                            </div>
                            <div class="plan-selector-grid">
                                <a href="javascript:void(0);" class="text-center btn-plan-selector" data-tab="eh-plan-d">
                                    <span class="grid-head"></span>
                                    <span class="grid-desc"><span class="txt-price"></span> / Month</span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- mobile plan selector -->
                <div class="visible-xs visible-sm plan-selector-m">
                    <div class="plan-selector-m-top">
                        <a href="javascript:void(0);" class="text-center btn-show-more">
                            <span class="grid-head"></span>
                            <span class="grid-desc"><span class="txt-price"></span>
                            <img class="arrow" src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s2_arrow_down.png" alt="more">
                        </a>
                    </div>
                    <div class="plan-selector-m-wrap">
                        <div>
                            <a href="javascript:void(0);" class="text-center btn-plan-selector" data-tab="eh-plan-a">
                                <span class="grid-head"></span>
                                <span class="grid-desc"><span class="txt-price"></span> / Month</span>
                            </a>
                        </div>
                        <div>
                            <a href="javascript:void(0);" class="text-center btn-plan-selector" data-tab="eh-plan-b">
                                <span class="grid-head"></span>
                                <span class="grid-desc"><span class="txt-price"></span> / Month</span>
                            </a>
                        </div>
                        <div>
                            <a href="javascript:void(0);" class="text-center btn-plan-selector" data-tab="eh-plan-c">
                                <span class="grid-head"></span>
                                <span class="grid-desc"><span class="txt-price"></span> / Month</span>
                            </a>
                        </div>
                        <div>
                            <a href="javascript:void(0);" class="text-center btn-plan-selector" data-tab="eh-plan-d">
                                <span class="grid-head"></span>
                                <span class="grid-desc"><span class="txt-price"></span> / Month</span>
                            </a>
                        </div>
                        <div>
                            <a href="javascript:void(0);" class="text-center btn-plan-back btn-plan-overview">
                                <span class="grid-head"><span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> Plan overview</span>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="sticky-help-wrapper">
                    <a href="javascript:void(0);">
                        <img src="<%=request.getContextPath()%>/resources/images/easy-health/btn_guidance_en.png" class="img-responsive pic">
                    </a>
                </div>
                <div class="eh-plan-a eh-plan-tab">
                    <div class="plan-detail">
                        <div class="container">
                            <div class="row">
                                <div class="col-sm-12 col-md-6">
                                    &nbsp;
                                    <div class="plan-detail-visual">
                                        <div class="visible-md visible-lg">
                                            <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_plan_A_bg.png" class="img-bg">
                                            <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_plan_A_building.png" class="img-building">
                                            <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_plan_A_bed.png" class="img-bed">
                                        </div>
                                        <div class="hidden-md hidden-lg text-center">
                                            <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_mobile_plan_A.png" class="img-responsive">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-12 col-md-6">
                                    <div class="plan-detail-desc">
                                        <div class="ferris-wheel-wrapper row no-margin">
                                            <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_benefit_border_en.png" class="img-responsive img-big-border visible-md visible-lg">
                                            <div class="img-big-circle col-xs-12 col-sm-offset-3 col-sm-6 col-md-offset-0">
                                                <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_benefit_main.png" class="img-responsive pic">
                                                <p class="txt-type text-center"></p>
                                                <div class="desc text-center">
                                                    <div class="moneyIcon">
                                                        <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_benefit_moneyIcon.png" class="img-bag">
                                                    </div>
                                                    <div class="txt text-left">
                                                        <span class="txt-youpay">You pay</span>
                                                        <br><span class="txt-youpay-price"></span>
                                                        <br><span class="txt-permonth"><img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_benefit_icon_month.png"> Per month</span>
                                                    </div>
                                                    <br>
                                                    <br class="hidden-xs hidden-md"><span class="txt-remarks text-center">(Yearly Contribution Amount <span class="txt-price-yca"></span>)</span>
                                                </div>
                                                <div class="btn-apply">
                                                    <a href="javascript:void(0);" class="savie-common-btn">Login to Apply</a>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 hidden-md hidden-lg text-center ywg">
                                                You will get
                                            </div>
                                            <div class="img-id col-xs-6">
                                                <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_benefit_02_id_en.png" class="img-responsive pic">
                                                <span class="txt-price txt-price-id"></span>
                                            </div>
                                            <div class="img-icu col-xs-6">
                                                <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_benefit_03_icu_en.png" class="img-responsive pic">
                                                <span class="txt-price txt-price-icu"></span>
                                            </div>
                                            <div class="img-hc col-xs-6">
                                                <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_benefit_01_hc_en.png" class="img-responsive pic">
                                                <span class="txt-price txt-price-hc"></span>
                                            </div>
                                            <div class="img-15 col-xs-6">
                                                <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_benefit_04_15_en.png" class="img-responsive pic">
                                                <span class="txt-price txt-price-rop"></span>
                                            </div>
                                            <div class="img-db col-xs-6">
                                                <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_benefit_06_db_en.png" class="img-responsive pic">
                                                <span class="txt-price txt-price-db"></span>
                                            </div>
                                            <div class="img-adb col-xs-6">
                                                <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_benefit_05_adb_en.png" class="img-responsive pic">
                                                <span class="txt-price txt-price-adb"></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="plan-benefit">
                        <div class="container">
                            <div class="row no-margin">
                                <div class="col-xs-12">
                                    <div class="container">
                                        <div class="row no-margin">
                                            <div class="col-xs-12">
                                                <div class="text-center">
                                                    <h4>Benefits</h4>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row no-margin">
                                            <div class="col-md-3 col-xs-12">
                                                <div class="text-center benefit-item first-item">
                                                    <div class="img-icon">
                                                        <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s2_benefit_01.png" class="img-responsive pic">
                                                        <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s2_benefit_get_en.png" class="img-additional img-responsive">
                                                    </div>
                                                    <h5>Hospital Cash Benefit</h5>
                                                    <span class="txt-price"><span class="txt-price txt-price-dhc"></span> (per day)</span>
                                                    <p>You are eligible to get the benefit when you have hospitalized more than 6 hours. You may claim up to 730 days per policy.</p>
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-xs-12">
                                                <div class="text-center benefit-item indicate">
                                                    <div class="img-icon">
                                                        <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s2_benefit_02.png" class="img-responsive pic">
                                                        <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s2_benefit_additional_en.png" class="img-additional img-responsive">
                                                    </div>
                                                    <h5>Intensive Care Unit Benefit</h5>
                                                    <span class="txt-price"><span class="txt-price txt-price-icu"></span> (per day) </span>
                                                    <p>On top of daily hospital cash, you are eligible to get the additional benefits when you are admitted to Intensive Care Unit. You may claim up to 90 days per policy.</p>
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-xs-12">
                                                <div class="text-center benefit-item indicate">
                                                    <div class="img-icon">
                                                        <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s2_benefit_03.png" class="img-responsive pic">
                                                        <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s2_benefit_additional_en.png" class="img-additional img-responsive">
                                                    </div>
                                                    <h5>Infectious Disease Benefit</h5>
                                                    <span class="txt-price"><span class="txt-price txt-price-id"></span>(per day)</span>
                                                    <p>On top of daily hospital cash, you are eligible to get the additional benefits when you suffered from Infectious disease. You may claim up to 30 days per policy.</p>
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-xs-12">
                                                <div class="total-benefit">
                                                    <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s2_benefit_04.png">
                                                    <p><span class="txt-ttl-upto">Total Amount Up to</span>
                                                        <br><span class="txt-ttl-benefit-price"></span>
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="plan-banner visible-md visible-lg">
                        <div class="container">
                            <div class="row">
                                <div class="col-sm-12">
                                    <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s3_death_en.png" class="img-responsive">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="plan-refund">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="">
                                        <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s4_table_en.png" class="img-responsive pic">
                                    </div>
                                </div>
                                <div class="col-md-6 text-left">
                                    <div class="wrapper-15yr">
                                        <div class="txt-15yr-box">
                                            <p class="txt-15yr"><img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s4_icon.png">15-year policy term</p>
                                            
                                        </div>
                                        <p class="txt-percent-refund highlight">102% of actual total premium paid</p>
                                        <p class="txt-refund-desc">Regardless of your claims made during the protection period</p>
                                        <div class="box-15yr-policy">
                                            <div class="lbl15yr-policy-top">Year <span class="lblYear"></span></div>
                                            <div class="slider-15yr-policy" id="s1_1_1"></div>
                                            
                                            <div class="lbl15yr-policy-bottom"><span class="minYear">1</span> <span class="maxYear">At maturity</span></div>
                                            <div class="tableView">
                                                <div class="tblv-titles">
                                                    <div class="tblv-title text-center">% of Premium Refund</div>
                                                    <!--
                                                    -->
                                                    <div class="tblv-title text-center">Actual Total Premium Paid (HK$)</div>
                                                    <!--
                                                    -->
                                                    <div class="tblv-title text-center">Refundable Amount (HK$)</div>
                                                </div>
                                                <div class="tblv-values">
                                                    <div class="tblv-value txt-ppr text-center"></div>
                                                    <!--
                                                    -->
                                                    <div class="tblv-value txt-atpp text-center"></div>
                                                    <!--
                                                    -->
                                                    <div class="tblv-value txt-ra text-center"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="box-paidget-wrap">
                                            <div class="box-paidget">
                                                <p class="txt-paidget">You Paid </p>
                                                <p class="txt-paidget-price txt-price-y15"></p>
                                            </div>
                                            <div class="box-paidget vcenter">
                                                <img class="right" src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s4_arrow.png">
                                                <img class="down" src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s4_arrow_down.png">
                                            </div>
                                            <div class="box-paidget">
                                                <p class="txt-paidget">You Get</p>
                                                <p class="txt-paidget-price txt-price-y15_102"></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="eh-plan-b eh-plan-tab">
                    <div class="plan-detail">
                        <div class="container">
                            <div class="row">
                                <div class="col-sm-12 col-md-6">
                                    &nbsp;
                                    <div class="plan-detail-visual">
                                        <div class="visible-md visible-lg">
                                            <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_plan_B_bg.png" class="img-bg">
                                            <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_plan_B_building.png" class="img-building">
                                            <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_plan_B_bed.png" class="img-bed">
                                        </div>
                                        <div class="hidden-md hidden-lg text-center">
                                            <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_mobile_plan_B.png" class="img-responsive">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-12 col-md-6">
                                    <div class="plan-detail-desc">
                                        <div class="ferris-wheel-wrapper row no-margin">
                                            <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_benefit_border_en.png" class="img-responsive img-big-border visible-md visible-lg">
                                            <div class="img-big-circle col-xs-12 col-sm-offset-3 col-sm-6 col-md-offset-0">
                                                <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_benefit_main.png" class="img-responsive pic">
                                                <p class="txt-type text-center"></p>
                                                <div class="desc text-center">
                                                    <div class="moneyIcon">
                                                        <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_benefit_moneyIcon.png" class="img-bag">
                                                    </div>
                                                    <div class="txt text-left">
                                                        <span class="txt-youpay">You Pay</span>
                                                        <br><span class="txt-youpay-price"></span>
                                                        <br><span class="txt-permonth"><img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_benefit_icon_month.png"> per month</span>
                                                    </div>
                                                    <br>
                                                    <br class="hidden-xs hidden-md"><span class="txt-remarks text-center">(Yearly Contribution Amount <span class="txt-price-yca"></span>)</span>
                                                </div>
                                                <div class="btn-apply">
                                                    <a href="javascript:void(0);" class="savie-common-btn">Login to Apply</a>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 hidden-md hidden-lg text-center ywg">
                                                You will get
                                            </div>
                                            <div class="img-id col-xs-6">
                                                <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_benefit_02_id_en.png" class="img-responsive pic">
                                                <span class="txt-price txt-price-id"></span>
                                            </div>
                                            <div class="img-icu col-xs-6">
                                                <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_benefit_03_icu_en.png" class="img-responsive pic">
                                                <span class="txt-price txt-price-icu"></span>
                                            </div>
                                            <div class="img-hc col-xs-6">
                                                <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_benefit_01_hc_en.png" class="img-responsive pic">
                                                <span class="txt-price txt-price-hc"></span>
                                            </div>
                                            <div class="img-15 col-xs-6">
                                                <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_benefit_04_15_en.png" class="img-responsive pic">
                                                <span class="txt-price txt-price-rop"></span>
                                            </div>
                                            <div class="img-db col-xs-6">
                                                <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_benefit_06_db_en.png" class="img-responsive pic">
                                                <span class="txt-price txt-price-db"></span>
                                            </div>
                                            <div class="img-adb col-xs-6">
                                                <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_benefit_05_adb_en.png" class="img-responsive pic">
                                                <span class="txt-price txt-price-adb"></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="plan-benefit">
                        <div class="container">
                            <div class="row no-margin">
                                <div class="col-xs-12">
                                    <div class="row no-margin">
                                        <div class="col-xs-12">
                                            <div class="text-center">
                                                <h4>Benefits</h4>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row no-margin">
                                        <div class="col-md-3 col-xs-12">
                                            <div class="text-center benefit-item first-item">
                                                <div class="img-icon">
                                                    <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s2_benefit_01.png" class="img-responsive pic">
                                                    <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s2_benefit_get_en.png" class="img-additional img-responsive">
                                                </div>
                                                <h5>Hospital Cash Benefit</h5>
                                                <span class="txt-price"><span class="txt-price txt-price-hc"></span>(per day)</span>
                                                <p>You are eligible to get the benefit when you have hospitalized more than 6 hours. You may claim up to 730 days per policy.</p>
                                            </div>
                                        </div>
                                        <div class="col-md-3 col-xs-12">
                                            <div class="text-center benefit-item indicate">
                                                <div class="img-icon">
                                                    <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s2_benefit_02.png" class="img-responsive pic">
                                                    <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s2_benefit_additional_en.png" class="img-additional img-responsive">
                                                </div>
                                                <h5>Intensive Care Unit Benefit</h5>
                                                <span class="txt-price"><span class="txt-price txt-price-icu"></span> (per day)</span>
                                                <p>On top of daily hospital cash, you are eligible to get the additional benefits when you are admitted to Intensive Care Unit. You may claim up to 90 days per policy.</p>
                                            </div>
                                        </div>
                                        <div class="col-md-3 col-xs-12">
                                            <div class="text-center benefit-item indicate">
                                                <div class="img-icon">
                                                    <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s2_benefit_03.png" class="img-responsive pic">
                                                    <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s2_benefit_additional_en.png" class="img-additional img-responsive">
                                                </div>
                                                <h5>Infectious Disease Benefit</h5>
                                                <span class="txt-price"><span class="txt-price txt-price-id"></span> (per day)</span>
                                                <p>On top of daily hospital cash, you are eligible to get the additional benefits when you suffered from Infectious disease. You may claim up to 30 days per policy.</p>
                                            </div>
                                        </div>
                                        <div class="col-md-3 col-xs-12">
                                            <div class="total-benefit">
                                                <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s2_benefit_04.png">
                                                <p><span class="txt-ttl-upto">Total Amount Up to</span>
                                                    <br><span class="txt-ttl-benefit-price"></span>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="plan-banner visible-md visible-lg">
                        <div class="container">
                            <div class="row">
                                <div class="col-sm-12">
                                    <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s3_death_en.png" class="img-responsive">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="plan-refund">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="">
                                        <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s4_table_en.png" class="img-responsive pic">
                                    </div>
                                </div>
                                <div class="col-md-6 text-left">
                                    <div class="wrapper-15yr">
                                        <div class="txt-15yr-box">
                                            <p class="txt-15yr"><img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s4_icon.png">15-year policy term</p>
                                            
                                        </div>
                                        <p class="txt-percent-refund highlight">102% of actual total premium paid</p>
                                        <p class="txt-refund-desc">Regardless of your claims made during the protection period</p>
                                        <div class="box-15yr-policy">
                                            <div class="lbl15yr-policy-top">Year <span class="lblYear"></span></div>
                                            <div class="slider-15yr-policy" id="s1_1_1"></div>
                                            
                                            <div class="lbl15yr-policy-bottom"><span class="minYear">1</span> <span class="maxYear">At maturity</span></div>
                                            <div class="tableView">
                                                <div class="tblv-titles">
                                                    <div class="tblv-title text-center">% of Premium Refund</div>
                                                    <!--
                                                    -->
                                                    <div class="tblv-title text-center">Actual Total Premium Paid (HK$)</div>
                                                    <!--
                                                    -->
                                                    <div class="tblv-title text-center">Refundable Amount (HK$)</div>
                                                </div>
                                                <div class="tblv-values">
                                                    <div class="tblv-value txt-ppr text-center"></div>
                                                    <!--
                                                    -->
                                                    <div class="tblv-value txt-atpp text-center"></div>
                                                    <!--
                                                    -->
                                                    <div class="tblv-value txt-ra text-center"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="box-paidget-wrap">
                                            <div class="box-paidget">
                                                <p class="txt-paidget">You Paid </p>
                                                <p class="txt-paidget-price txt-price-y15"></p>
                                            </div>
                                            <div class="box-paidget vcenter">
                                                <img class="right" src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s4_arrow.png">
                                                <img class="down" src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s4_arrow_down.png">
                                            </div>
                                            <div class="box-paidget">
                                                <p class="txt-paidget">You Get</p>
                                                <p class="txt-paidget-price txt-price-y15_102"></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="eh-plan-c eh-plan-tab">
                    <div class="plan-detail">
                        <div class="container">
                            <div class="row">
                                <div class="col-sm-12 col-md-6">
                                    &nbsp;
                                    <div class="plan-detail-visual">
                                        <div class="visible-md visible-lg">
                                            <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_plan_C_bg.png" class="img-bg">
                                            <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_plan_C_building.png" class="img-building">
                                            <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_plan_C_bed.png" class="img-bed">
                                        </div>
                                        <div class="hidden-md hidden-lg text-center">
                                            <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_mobile_plan_C.png" class="img-responsive">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-12 col-md-6">
                                    <div class="plan-detail-desc">
                                        <div class="ferris-wheel-wrapper row no-margin">
                                            <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_benefit_border_en.png" class="img-responsive img-big-border visible-md visible-lg">
                                            <div class="img-big-circle col-xs-12 col-sm-offset-3 col-sm-6 col-md-offset-0">
                                                <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_benefit_main.png" class="img-responsive pic">
                                                <p class="txt-type text-center"></p>
                                                <div class="desc text-center">
                                                    <div class="moneyIcon">
                                                        <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_benefit_moneyIcon.png" class="img-bag">
                                                    </div>
                                                    <div class="txt text-left">
                                                        <span class="txt-youpay">You pay</span>
                                                        <br><span class="txt-youpay-price"></span>
                                                        <br><span class="txt-permonth"><img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_benefit_icon_month.png"> Per month</span>
                                                    </div>
                                                    <br>
                                                    <br class="hidden-xs hidden-md"><span class="txt-remarks text-center">(Yearly Contribution Amount <span class="txt-price-yca"></span>)</span>
                                                </div>
                                                <div class="btn-apply">
                                                    <a href="javascript:void(0);" class="savie-common-btn">Login to Apply</a>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 hidden-md hidden-lg text-center ywg">
                                                You will get
                                            </div>
                                            <div class="img-id col-xs-6">
                                                <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_benefit_02_id_en.png" class="img-responsive pic">
                                                <span class="txt-price txt-price-id"></span>
                                            </div>
                                            <div class="img-icu col-xs-6">
                                                <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_benefit_03_icu_en.png" class="img-responsive pic">
                                                <span class="txt-price txt-price-icu"></span>
                                            </div>
                                            <div class="img-hc col-xs-6">
                                                <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_benefit_01_hc_en.png" class="img-responsive pic">
                                                <span class="txt-price txt-price-hc"></span>
                                            </div>
                                            <div class="img-15 col-xs-6">
                                                <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_benefit_04_15_en.png" class="img-responsive pic">
                                                <span class="txt-price txt-price-rop"></span>
                                            </div>
                                            <div class="img-db col-xs-6">
                                                <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_benefit_06_db_en.png" class="img-responsive pic">
                                                <span class="txt-price txt-price-db"></span>
                                            </div>
                                            <div class="img-adb col-xs-6">
                                                <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_benefit_05_adb_en.png" class="img-responsive pic">
                                                <span class="txt-price txt-price-adb"></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="plan-benefit">
                        <div class="container">
                            <div class="row no-margin">
                                <div class="col-xs-12">
                                    <div class="row no-margin">
                                        <div class="col-xs-12">
                                            <div class="text-center">
                                                <h4>Benefits</h4>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row no-margin">
                                        <div class="col-md-3 col-xs-12">
                                            <div class="text-center benefit-item first-item">
                                                <div class="img-icon">
                                                    <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s2_benefit_01.png" class="img-responsive pic">
                                                    <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s2_benefit_get_en.png" class="img-additional img-responsive">
                                                </div>
                                                <h5>Hospital Cash Benefit</h5>
                                                <span class="txt-price"><span class="txt-price txt-price-dhc"></span> (per day)</span>
                                                <p>You are eligible to get the benefit when you have hospitalized more than 6 hours. You may claim up to 730 days per policy.</p>
                                            </div>
                                        </div>
                                        <div class="col-md-3 col-xs-12">
                                            <div class="text-center benefit-item indicate">
                                                <div class="img-icon">
                                                    <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s2_benefit_02.png" class="img-responsive pic">
                                                    <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s2_benefit_additional_en.png" class="img-additional img-responsive">
                                                </div>
                                                <h5>Intensive Care Unit Benefit</h5>
                                                <span class="txt-price"><span class="txt-price txt-price-icu"></span> (per day)</span>
                                                <p>On top of daily hospital cash, you are eligible to get the additional benefits when you are admitted to Intensive Care Unit. You may claim up to 90 days per policy.</p>
                                            </div>
                                        </div>
                                        <div class="col-md-3 col-xs-12">
                                            <div class="text-center benefit-item indicate">
                                                <div class="img-icon">
                                                    <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s2_benefit_03.png" class="img-responsive pic">
                                                    <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s2_benefit_additional_en.png" class="img-additional img-responsive">
                                                </div>
                                                <h5>Infectious Disease Benefit</h5>
                                                <span class="txt-price"><span class="txt-price txt-price-id"></span> (per day)</span>
                                                <p>On top of daily hospital cash, you are eligible to get the additional benefits when you suffered from Infectious disease. You may claim up to 30 days per policy.</p>
                                            </div>
                                        </div>
                                        <div class="col-md-3 col-xs-12">
                                            <div class="total-benefit">
                                                <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s2_benefit_04.png">
                                                <p><span class="txt-ttl-upto">Total Amount Up to</span>
                                                    <br><span class="txt-ttl-benefit-price"></span></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="plan-banner visible-md visible-lg">
                        <div class="container">
                            <div class="row">
                                <div class="col-sm-12">
                                    <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s3_death_en.png" class="img-responsive">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="plan-refund">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="">
                                        <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s4_table_en.png" class="img-responsive pic">
                                    </div>
                                </div>
                                <div class="col-md-6 text-left">
                                    <div class="wrapper-15yr">
                                        <div class="txt-15yr-box">
                                            <p class="txt-15yr"><img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s4_icon.png">15-year policy term</p>
                                            
                                        </div>
                                        <p class="txt-percent-refund highlight">102% of actual total premium paid</p>
                                        <p class="txt-refund-desc">Regardless of your claims made during the protection period</p>
                                        <div class="box-15yr-policy">
                                            <div class="lbl15yr-policy-top">Year <span class="lblYear"></span></div>
                                            <div class="slider-15yr-policy" id="s1_1_1"></div>
                                            
                                            <div class="lbl15yr-policy-bottom"><span class="minYear">1</span> <span class="maxYear">At maturity</span></div>
                                            <div class="tableView">
                                                <div class="tblv-titles">
                                                    <div class="tblv-title text-center">% of Premium Refund</div>
                                                    <!--
                                                    -->
                                                    <div class="tblv-title text-center">Actual Total Premium Paid (HK$)</div>
                                                    <!--
                                                    -->
                                                    <div class="tblv-title text-center">Refundable Amount (HK$)</div>
                                                </div>
                                                <div class="tblv-values">
                                                    <div class="tblv-value txt-ppr text-center"></div>
                                                    <!--
                                                    -->
                                                    <div class="tblv-value txt-atpp text-center"></div>
                                                    <!--
                                                    -->
                                                    <div class="tblv-value txt-ra text-center"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="box-paidget-wrap">
                                            <div class="box-paidget">
                                                <p class="txt-paidget">You Paid </p>
                                                <p class="txt-paidget-price txt-price-y15"></p>
                                            </div>
                                            <div class="box-paidget vcenter">
                                                <img class="right" src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s4_arrow.png">
                                                <img class="down" src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s4_arrow_down.png">
                                            </div>
                                            <div class="box-paidget">
                                                <p class="txt-paidget">You Get</p>
                                                <p class="txt-paidget-price txt-price-y15_102"></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="eh-plan-d eh-plan-tab">
                    <div class="plan-detail">
                        <div class="container">
                            <div class="row">
                                <div class="col-sm-12 col-md-6">
                                    &nbsp;
                                    <div class="plan-detail-visual">
                                        <div class="visible-md visible-lg">
                                            <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_plan_D_bg.png" class="img-bg">
                                            <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_plan_D_building.png" class="img-building">
                                            <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_plan_D_bed.png" class="img-bed">
                                        </div>
                                        <div class="hidden-md hidden-lg text-center">
                                            <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_mobile_plan_D.png" class="img-responsive">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-12 col-md-6">
                                    <div class="plan-detail-desc">
                                        <div class="ferris-wheel-wrapper row no-margin">
                                            <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_benefit_border_en.png" class="img-responsive img-big-border visible-md visible-lg">
                                            <div class="img-big-circle col-xs-12 col-sm-offset-3 col-sm-6 col-md-offset-0">
                                                <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_benefit_main.png" class="img-responsive pic">
                                                <p class="txt-type text-center"></p>
                                                <div class="desc text-center">
                                                    <div class="moneyIcon">
                                                        <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_benefit_moneyIcon.png" class="img-bag">
                                                    </div>
                                                    <div class="txt text-left">
                                                        <span class="txt-youpay">You pay</span>
                                                        <br><span class="txt-youpay-price"></span>
                                                        <br><span class="txt-permonth"><img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_benefit_icon_month.png"> Per month</span>
                                                    </div>
                                                    <br>
                                                    <br class="hidden-xs hidden-md"><span class="txt-remarks text-center">(Yearly Contribution Amount <span class="txt-price-yca"></span>)</span>
                                                </div>
                                                <div class="btn-apply">
                                                    <a href="javascript:void(0);" class="savie-common-btn">Login to Apply</a>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 hidden-md hidden-lg text-center ywg">
                                                You will get
                                            </div>
                                            <div class="img-id col-xs-6">
                                                <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_benefit_02_id_en.png" class="img-responsive pic">
                                                <span class="txt-price txt-price-id"></span>
                                            </div>
                                            <div class="img-icu col-xs-6">
                                                <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_benefit_03_icu_en.png" class="img-responsive pic">
                                                <span class="txt-price txt-price-icu"></span>
                                            </div>
                                            <div class="img-hc col-xs-6">
                                                <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_benefit_01_hc_en.png" class="img-responsive pic">
                                                <span class="txt-price txt-price-hc"></span>
                                            </div>
                                            <div class="img-15 col-xs-6">
                                                <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_benefit_04_15_en.png" class="img-responsive pic">
                                                <span class="txt-price txt-price-rop"></span>
                                            </div>
                                            <div class="img-db col-xs-6">
                                                <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_benefit_06_db_en.png" class="img-responsive pic">
                                                <span class="txt-price txt-price-db"></span>
                                            </div>
                                            <div class="img-adb col-xs-6">
                                                <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_benefit_05_adb_en.png" class="img-responsive pic">
                                                <span class="txt-price txt-price-adb"></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="plan-benefit">
                        <div class="container">
                            <div class="row no-margin">
                                <div class="col-xs-12">
                                    <div class="row no-margin">
                                        <div class="col-xs-12">
                                            <div class="text-center">
                                                <h4>Benefits</h4>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row no-margin">
                                        <div class="col-md-3 col-xs-12">
                                            <div class="text-center benefit-item first-item">
                                                <div class="img-icon">
                                                    <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s2_benefit_01.png" class="img-responsive pic">
                                                    <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s2_benefit_get_en.png" class="img-additional img-responsive">
                                                </div>
                                                <h5>Hospital Cash Benefit</h5>
                                                <span class="txt-price"><span class="txt-price txt-price-dhc"></span> (per day)</span>
                                                <p>You are eligible to get the benefit when you have hospitalized more than 6 hours. You may claim up to 730 days per policy.</p>
                                            </div>
                                        </div>
                                        <div class="col-md-3 col-xs-12">
                                            <div class="text-center benefit-item indicate">
                                                <div class="img-icon">
                                                    <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s2_benefit_02.png" class="img-responsive pic">
                                                    <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s2_benefit_additional_en.png" class="img-additional img-responsive">
                                                </div>
                                                <h5>Intensive Care Unit Benefit</h5>
                                                <span class="txt-price"><span class="txt-price txt-price-icu"></span> (per day)</span>
                                                <p>On top of daily hospital cash, you are eligible to get the additional benefits when you are admitted to Intensive Care Unit. You may claim up to 90 days per policy.</p>
                                            </div>
                                        </div>
                                        <div class="col-md-3 col-xs-12">
                                            <div class="text-center benefit-item indicate">
                                                <div class="img-icon">
                                                    <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s2_benefit_03.png" class="img-responsive pic">
                                                    <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s2_benefit_additional_en.png" class="img-additional img-responsive">
                                                </div>
                                                <h5>Infectious Disease Benefit</h5>
                                                <span class="txt-price"><span class="txt-price txt-price-id"></span> (per day)</span>
                                                <p>On top of daily hospital cash, you are eligible to get the additional benefits when you suffered from Infectious disease. You may claim up to 30 days per policy.</p>
                                            </div>
                                        </div>
                                        <div class="col-md-3 col-xs-12">
                                            <div class="total-benefit">
                                                <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s2_benefit_04.png">
                                                <p><span class="txt-ttl-upto">Total Amount Up to</span>
                                                    <br><span class="txt-ttl-benefit-price"></span></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="plan-banner visible-md visible-lg">
                        <div class="container">
                            <div class="row">
                                <div class="col-sm-12">
                                    <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s3_death_en.png" class="img-responsive">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="plan-refund">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="">
                                        <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s4_table_en.png" class="img-responsive pic">
                                    </div>
                                </div>
                                <div class="col-md-6 text-left">
                                    <div class="wrapper-15yr">
                                        <div class="txt-15yr-box">
                                            <p class="txt-15yr"><img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s4_icon.png">15-year policy term</p>
                                            
                                        </div>
                                        <p class="txt-percent-refund highlight">102% of actual total premium paid</p>
                                        <p class="txt-refund-desc">Regardless of your claims made during the protection period</p>
                                        <div class="box-15yr-policy">
                                            <div class="lbl15yr-policy-top">Year <span class="lblYear"></span></div>
                                            <div class="slider-15yr-policy" id="s1_1_1"></div>
                                            
                                            <div class="lbl15yr-policy-bottom"><span class="minYear">1</span> <span class="maxYear">At maturity</span></div>
                                            <div class="tableView">
                                                <div class="tblv-titles">
                                                    <div class="tblv-title text-center">% of Premium Refund</div>
                                                    <!--
                                                    -->
                                                    <div class="tblv-title text-center">Actual Total Premium Paid (HK$)</div>
                                                    <!--
                                                    -->
                                                    <div class="tblv-title text-center">Refundable Amount (HK$)</div>
                                                </div>
                                                <div class="tblv-values">
                                                    <div class="tblv-value txt-ppr text-center"></div>
                                                    <!--
                                                    -->
                                                    <div class="tblv-value txt-atpp text-center"></div>
                                                    <!--
                                                    -->
                                                    <div class="tblv-value txt-ra text-center"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="box-paidget-wrap">
                                            <div class="box-paidget">
                                                <p class="txt-paidget">You Paid </p>
                                                <p class="txt-paidget-price txt-price-y15"></p>
                                            </div>
                                            <div class="box-paidget vcenter">
                                                <img class="right" src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s4_arrow.png">
                                                <img class="down" src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s4_arrow_down.png">
                                            </div>
                                            <div class="box-paidget">
                                                <p class="txt-paidget">You Get</p>
                                                <p class="txt-paidget-price txt-price-y15_102"></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="plan-faq container">
                    <div class="row">
                        <div class="col-xs-12">
                            <div id="plan-details-sample-and-faq">
                                <div id="pd-sf-tabs-container" class="container-fluid content-container-fluid">
                                    <ul id="pd-sf-nav-tabs" class="nav nav-tabs" role="tablist">
                                        <li class="pd-sf-tab text-center active" role="presentation">
                                            <a href="#pd-sf-sale-illustration-sample-pane" class="bold" aria-controls="pd-sf-sale-illustration-sample-pane" role="tab" data-toggle="tab">Key Product<br class="visible-xs"> Risks &amp; Exclusions</a>
                                        </li>
                                        <li class="pd-sf-tab pd-sf-tab-right text-center" role="presentation">
                                            <a href="#pd-sf-faq-and-glossary-pane" class="bold" aria-controls="pd-sf-faq-and-glossary-pane" role="tab" data-toggle="tab">Remarks</a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="pd-sf-divider"></div>
                                <div id="pd-sf-tab-content-container" class="container-fluid content-container-fluid">
                                    <div class="tab-content">
                                        <div role="tabpanel" class="tab-pane active" id="pd-sf-sale-illustration-sample-pane">
                                            <div class="panel-group" id="pd-sf-sale-illustration-sample-group" role="tablist" aria-multiselectable="true">
                                                <div class="panel panel-default pd-sf-sale-illustration-sample-panel">
                                                    <div class="panel-heading" role="tab" id="pd-sf-product-related">
                                                        <h4 class="panel-title">
                                 <a class="collapsed" role="button" data-toggle="collapse" data-parent="#pd-sf-sale-illustration-sample-group" href="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                                    Key Product Risks
                                    <span class="pull-right">
                                       <img src="<%=request.getContextPath()%>/resources/images/savie-2016/arrow-down1.png">
                                    </span>
                                 </a>
                              </h4>
                                                    </div>
                                                    <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="pd-sf-product-related">
                                                        <div class="panel-body">
                                                            <p>Credit risk </p>
                                                            <p>This product is an insurance policy issued by FWD Life Insurance Company (Bermuda) Limited (“the Company”). The application of this insurance product and all benefits payable under your policy are subject to the credit risk of the Company. You will bear the default risk in the event that the Company is unable to satisfy its financial obligations under this insurance contract.</p>
                                                            <br>
                                                            <p>Exchange rate and currency risk</p>
                                                            <p>The application of this insurance product with the policy currency denominated in a foreign currency is subject to that foreign currency’s exchange rate and currency risk. The foreign currency may be subject to the relevant regulatory bodies’ control (for example, exchange restrictions). If your home currency is different from the policy currency, please note that any exchange rate fluctuation between your home currency and the policy currency of this insurance product will have a direct impact on the amount of premium required and the value of benefit(s) to be received. For instance, if the policy currency of the insurance product depreciates substantially against your home currency, the potential loss arising from such exchange rate movement may have a negative impact on your benefits to be received from the product and your burden of the premium payment.</p>
                                                            <br>
                                                            <p>Inflation risk</p>
                                                            <p>The cost of living in the future may be higher than now due to the effects of inflation. Therefore, the benefits under this policy may not be sufficient for the increasing protection needs in the future even if the Company fulfills all of its contractual obligations.</p>
                                                            <br>
                                                            <p>Early surrender risk</p>
                                                            <p>If you surrender your policy in the early policy years or before the end of the policy term, or withdraw the premiums you contributed in the early policy years, the amount of the benefit you will get back may be considerably less than the total amount of the premiums you paid.</p>
                                                            <br>
                                                            <p>Premium adjustment</p>
                                                            <p>The premium is non-guaranteed and may significantly increase due to factors including but not limited to claims experience and policy persistency. However, premium will not be increased based on the age of the Insured on his or her next birthday.</p>
                                                            <br>
                                                            <p>Premium term and non-payment of premium</p>
                                                            <p>The premium payment period of the policy is 10 years. The Company allows a Grace Period of 30 days after the premium due date for payment of each premium. If a premium is still unpaid at the expiration of the Grace Period, the policy will be terminated from the date the first unpaid premium was due. Please note that once the policy is terminated on this basis, you will lose all of your benefits.</p>
                                                            <br>
                                                            <p>Termination conditions</p>
                                                            <p>This Policy shall terminate on the earliest of the following:
                                                                <ol>
                                                                    <li>The death of the Insured; or</li>
                                                                    <li>The Maturity Date; or</li>
                                                                    <li>The date of Policy surrender. Such date is determined in accordance with the Company’s applicable rules and regulations in relation to Policy surrender; or</li>
                                                                    <li>The end of the Grace Period of any premium due and not received by the Company.</li>
                                                                </ol>
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="panel panel-default pd-sf-sale-illustration-sample-panel">
                                                    <div class="panel-heading" role="tab" id="pd-sf-claim-related">
                                                        <h4 class="panel-title">
                                 <a class="collapsed" role="button" data-toggle="collapse" data-parent="#pd-sf-faq-and-glossary-group" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                    Key Exclusions
                                    <span class="pull-right">
                                       <img src="<%=request.getContextPath()%>/resources/images/savie-2016/arrow-down1.png">
                                    </span>
                                 </a>
                              </h4>
                                                    </div>
                                                    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="pd-sf-claim-related">
                                                        <div class="panel-body">
                                                            <p>No Daily Hospital Cash Benefit, Intensive Care Unit Benefit or Infectious Disease Benefit is payable under this Policy when the Confinement is directly or indirectly caused by:</p>
                                                            <ol>
                                                                <li>Congenital Conditions.</li>
                                                                <li>Pre-existing Conditions.</li>
                                                                <li>Intentional self-inflicted injury or attempted suicide, while sane or insane and while intoxicated or not; Disability arising out of excessive consumption of alcohol or narcotics or similar drugs or agents unless prescribed by a Physician for the treatment of a Disability.</li>
                                                                <li>Conditions arising from surgical, mechanical or chemical contraceptive methods of birth control or the reversal of birth control or treatment pertaining to infertility.</li>
                                                                <li>Cosmetic surgery or plastic surgery, preventive or vaccination treatment not related to a Disability, except as necessitated by bodily Injuries wholly caused by an Accident occurring after the Policy Date; dental care, surgery and treatment, except as necessitated by the need to restore sound natural teeth that are damaged wholly by Injury occurring after the Policy Date and the restoration is only to restore the basic function of the natural teeth that existed prior to the Injury.</li>
                                                                <li>War or any act of war, terrorism or terroristic activities, declared or undeclared, hostilities, rebellion, revolution, insurrection, coup or usurped power or active duty in the military, naval or air forces of any country or international authority.</li>
                                                                <li>Any Disability resulting from:
                                                                    <ol class="lower-roman">
                                                                        <li>Racing of any kind other than on foot.</li>
                                                                        <li>Participation in all forms of professional sports competition with reward and income.</li>
                                                                        <li>Motorcycling other than on roadways designed primarily for motor traffic.</li>
                                                                        <li>An activity in the air other than as a fare paying passenger on a duly licensed commercial aircraft.</li>
                                                                        <li>Deep water diving over thirty (30) meters requiring the use of breathing apparatus.</li>
                                                                        <li>Abseiling and mountain climbing requiring the use of ropes and/or pitons.</li>
                                                                        <li>Winter sports other than ice-rink skating.</li>
                                                                        <li>Deliberate exposure to exceptional danger in the opinion of the Company except in an effort to save human life.</li>
                                                                        <li>Nuclear radiation, or contamination or the use of ionization or combustion of any nuclear weapons.</li>
                                                                    </ol>
                                                                </li>
                                                                <li>Pregnancy, childbirth (including surgical delivery), miscarriage which is not a result of Accident, abortion and prenatal or postnatal care.</li>
                                                                <li>The participation in any criminal event (including the consumption of illegal drugs).</li>
                                                                <li>Trans-sexual surgery.</li>
                                                                <li>
                                                                    No Accidental Death Benefit is payable under this Policy when the death of the Insured is directly or indirectly caused by:
                                                                    <ol>
                                                                        <li>Disease or infection (except infections which occur through an accidental cut or wound).</li>
                                                                        <li>Pregnancy, childbirth (including surgical delivery) and abortion irrespective of whether such event is accelerated or induced by an Injury.</li>
                                                                        <li>Intentional self-inflicted injury or attempted suicide, while sane or insane and while intoxicated or not.</li>
                                                                        <li>Any drug unless taken in accordance with the lawful directions and prescription of a qualified and registered Physician.</li>
                                                                        <li>Accident occurring while or because the Insured is under the influence of alcohol.</li>
                                                                        <li>Poison, gas or fumes, voluntarily or otherwise taken, absorbed or inhaled, other than as a result of an Accident arising from a hazardous incident in relation to the Insured’s occupation.</li>
                                                                        <li>War or any act of war, terrorism or terroristic activities, declared or undeclared, hostilities, rebellion, revolution, insurrection, coup or usurped power or active duty in the military, naval or air forces of any country or international authority.</li>
                                                                        <li>Any activity in the air other than as a fare paying passenger on a duly licensed commercial aircraft. </li>
                                                                        <li>The participation in any criminal event (including the consumption of illegal drugs).</li>
                                                                        <li>Racing of any kind other than on foot.</li>
                                                                        <li>Nuclear radiation, or contamination or the use of ionization or combustion of any nuclear weapons.</li>
                                                                        <li>Participation in all forms of professional sports competition with reward and income. </li>
                                                                    </ol>
                                                                </li>
                                                            </ol>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div role="tabpanel" class="tab-pane" id="pd-sf-faq-and-glossary-pane">
                                            <div class="panel-group" id="pd-sf-faq-and-glossary-group" role="tablist" aria-multiselectable="true">
                                                <div class="panel panel-default pd-sf-faq-and-glossary-panel">
                                                    <div class="panel-heading" role="tab" id="pd-sf-product-related">
                                                        <h4 class="panel-title">
                                 <a class="collapsed" role="button" data-toggle="collapse" data-parent="#pd-sf-faq-and-glossary-group" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                    Remarks
                                    <span class="pull-right">
                                       <img src="<%=request.getContextPath()%>/resources/images/savie-2016/arrow-down1.png">
                                    </span>
                                 </a>
                              </h4>
                                                    </div>
                                                    <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="pd-sf-product-related">
                                                        <div class="panel-body">
                                                            <p><b>Confinement - </b>a period during which the insured is admitted into a hospital or Designated Psychiatric Hospital as an in-patient for Medically Necessary services or treatments on the written recommendation of a physician as a result of a Disability, provided that the duration of such stay is not less than six (6) consecutive hours. Throughout the period from the insured’s admission until his/her discharge, the insured is required to be continuously confined in the hospital without any physical absence or interruption.</p>
                                                            <br>
                                                            <p><b>Medically Necessary - </b>medical or health care services and Confinement which are necessary and consistent with the diagnosis and customary medical treatment for the Disability and recommended by a physician or surgeon. In no event will any of the following be considered to be Medically Necessary:
                                                            </p>
                                                            <ul>
                                                                <li>Confinement mainly for the personal comfort or convenience of the Insured or the physician or any other person.</li>
                                                                <li>Confinement which the insured’s Disability could safely and adequately be treated while not confined.</li>
                                                                <li>Confinement for experimental, screening and preventive services, routine physical examinations, health check-ups, or tests not incidental to treatment or diagnosis of a Disability.</li>
                                                            </ul>
                                                            <br>
                                                            <p><b>Disability - </b>any Sickness(es), Disease(s), Illness(es) or Injury(ies) and shall include all Disabilities arising from the same cause including any complications arising from it.</p>
                                                            <br>
                                                            <p><b>Sickness, Disease or Illness - </b>a physical condition marked by a pathological deviation from the normal healthy state which manifests and commences more than thirty (30) days after the policy date or the date of reinstatement of this policy (whichever is later).</p>
                                                            <br>
                                                            <p>Maximum period for which Daily Hospital Cash Benefit is payable per Disability (other than a Psychiatric Disorder and any Human Immunodeficiency Virus (HIV) related Disability) is seven hundred and thirty (730) days. The benefit for the treatment of Psychiatric Disorder (i.e. mental, behavioral, psychiatric or psychological disorder) in a Designated Psychiatric Hospital is subject to the maximum period of thirty (30) days of per policy year regardless of the number of Psychiatric Disorders suffered. Designated Psychiatric Hospital includes Alice Ho Miu Ling Nethersole Hospital, Castle Peak Hospital, Kowloon Hospital, Kwai Chung Hospital, Pamela Youde Nethersole Eastern Hospital, Queen Mary Hospital, Shatin Hospital, Tai Po Hospital, Tuen Mun Hospital, United Christian Hospital and Conde S. Januário Hospital, Macau.</p>
                                                            <br>
                                                            <p>If the Confinement occurs in places other than Hong Kong, Macau, South Korea, Taiwan, Singapore, Malaysia, Thailand, Japan, Canada, U.S.A, Western Europe, Australia and New Zealand, Daily Hospital Cash Benefit, Intensive Care Unit Benefit &amp; Infectious Disease Benefit payable for each day of Confinement under these benefits shall be reduced to fifty (50) percent of the benefit and further, the maximum period for which the Daily Hospital Cash Benefit is payable per Disability (other than a Psychiatric Disorder and any Human Immunodeficiency Virus (HIV) related Disability) shall be reduced to ninety (90) days. “Western Europe” shall mean Austria, Belgium, Denmark, Finland, France, Germany, Greece, Iceland, Ireland, Italy, Luxembourg, Monaco, Netherlands, Norway, Portugal, Spain, Sweden, Switzerland, United Kingdom and Vatican City.</p>
                                                            <br>
                                                            <p>No Daily Hospital Cash Benefit or Intensive Care Unit Benefit shall be paid in respect of any Human Immunodeficiency Virus (HIV) related Disability, including Acquired Immunization Deficiency Syndrome (AIDS) and/or any mutations, derivations or variations, which is derived from an HIV infection (except due to blood transfusion), unless the signs or symptoms of such Disability first occur after the policy has been effective for five (5) consecutive policy years from the policy date or the date of reinstatement of this policy (whichever is later). The maximum period for which the Daily Hospital Cash Benefit and the Intensive Care Unit Benefit are payable in respect of HIV related Disabilities is thirty (30) days per policy year regardless of the number of HIV related Disabilities suffered.</p>
                                                            <br>
                                                            <p>Premium is non-guaranteed and may significantly increase due to factors including but not limited to claims experience and policy persistency. However, premium will not be increased based on the age of the Insured on his or her next birthday.</p>
                                                            <br>
                                                            <p>Maximum period for which Intensive Care Unit Benefit is payable shall not exceed ninety (90) days per Disability. </p>
                                                            <br>
                                                            <p>Maximum period for which Infectious Disease Benefit is payable shall not exceed thirty (30) days per Disability. Covered infectious diseases include:</p>
                                                            <ol>
                                                                <li>Malaria</li>
                                                                <li>Cholera</li>
                                                                <li>Dengue Fever</li>
                                                                <li>Tetanus</li>
                                                                <li>Measles</li>
                                                                <li>Rabies</li>
                                                                <li>Yellow Fever</li>
                                                                <li>Scarlet Fever </li>
                                                                <li>SARS</li>
                                                                <li>Japanese Encephalitis</li>
                                                                <li>Meningococcal Infection </li>
                                                                <li>Creutzfeldt-Jakob Disease (Mad Cow Disease)</li>
                                                                <li>Legionnaires' Disease </li>
                                                                <li>Amoebic Dysentery </li>
                                                                <li>Anthrax </li>
                                                                <li>Leprosy </li>
                                                                <li>Diphtheria </li>
                                                                <li>Acute Poliomyelitis </li>
                                                                <li>Plague </li>
                                                                <li>Tuberculosis </li>
                                                            </ol>
                                                            <br>
                                                            <p><b>Total Annualised Premium - </b>is the sum of the annualised premium of each policy year up to and including the policy year in which the insured died. Annualised premium of a policy year shall mean monthly premium of that policy year multiplied by 12.</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        
                                    </div>
                                </div>
                                <!-- MODALS / LIGHTBOXES -->
                                <div class="modal fade common-welcome-modal" id="offline-online-modal" tabindex="-1" role="dialog">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="row">
                                                <div class="col-xs-2 col-md-1 numbering-holder">
                                                    <img src="<%=request.getContextPath()%>/resources/images/savie-2016/dk-numbering.png" class="visible-md visible-lg">
                                                    <img src="<%=request.getContextPath()%>/resources/images/savie-2016/mb-numbering.png" class="visible-xs visible-sm">
                                                </div>
                                                <div class="col-xs-10 col-md-10" id="steps-holder">
                                                    <h4 class="text-center">Thank you for your interest on this product.</h4>
                                                    <div id="step-1" class="step">
                                                        <div class="media">
                                                            <div class="media-left" id="step1-img-holder">
                                                                <img class="media-object" src="<%=request.getContextPath()%>/resources/images/savie-2016/book-icon.png">
                                                            </div>
                                                            <div class="media-body">
                                                                <p class="procedure">According to the Hong Kong Federation of insurers’ guidelines, insurance companies should carry out a Financial Need Analysis (FNA) before selling insurance products. We will provide suitable product options for your comparison after the completion of FNA.</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div id="step-2" class="step">
                                                        <div class="media">
                                                            <div class="media-left" id="step2-img-holder">
                                                                <img class="media-object" src="<%=request.getContextPath()%>/resources/images/savie-2016/note-icon.png">
                                                            </div>
                                                            <div class="media-body">
                                                                <p class="procedure">Once the FNA and the product recommendation confirms Savie is suitable for you, you may begin the application process immediately.</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row" id="on-of-holder">
                                                        <div class="col-md-6 col-xs-12" id="step-online">
                                                            <div class="step">
                                                                <div class="media">
                                                                    <div class="media-left" id="stepon-img-holder">
                                                                        <img class="media-object" src="<%=request.getContextPath()%>/resources/images/savie-2016/pc-icon.png">
                                                                    </div>
                                                                    <div class="media-body">
                                                                        <p class="procedure"><span class="bold-head">ONLINE APPLICATION</span> <span class="hidden-dash">-</span>
                                                                            <br class="visible-md visible-lg"> You may complete both the FNA and application on this platform. A “save and continue later” function is available in the application section to allow you to continue your application at any time.</p>
                                                                        <button class="btn savie-common-btn" id="online-application-btn">Online application</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="or-word">
                                                            <div id="or-mobile">
                                                                <span>or</span>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6 col-xs-12" id="step-offline">
                                                            <div class="step">
                                                                <div class="media">
                                                                    <div class="media-left">
                                                                        <img class="media-object" src="<%=request.getContextPath()%>/resources/images/savie-2016/clockfold-icon.png">
                                                                    </div>
                                                                    <div class="media-body">
                                                                        <p class="procedure"><span class="bold-head">OFFLINE APPLICATION</span> <span class="hidden-dash">-</span>
                                                                            <br class="visible-md visible-lg"> You may choose to complete the FNA and application process offline at our Customer Service Centre. Please book your preferred time slot at the Customer Service Centre to meet with our Customer Service Representative. The entire process will take about 30 to 45 minutes.</p>
                                                                        <button class="btn savie-common-btn" id="offline-application-btn">Offline application</button>
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
                                <!-- Thank you -->
                                <div class="modal fade thank-you-modal" id="thankYouModal" role="dialog" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content thank-you-content">
                                            <img src="<%=request.getContextPath()%>/resources/images/savie/iFWD_eg_infographic_desktop_EN_v3.jpg" class="img-responsive hidden-xs">
                                            <img src="<%=request.getContextPath()%>/resources/images/savie/iFWD_eg_infographic_mobile_EN_v3.jpg" class="img-responsive visible-xs">
                                            <button id="thank-you-continue" class="btn next" onclick="goServiceCenter();">Continue</button>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal fade common-welcome-modal" id="prev-savie-app-modal" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <!-- <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button> -->
                                            <h4 class="text-center welcome-msg">Welcome back to Savie Insurance Plan!<span id="fullName1" class="hidden"></span></h4>
                                            <p class="text-center description-msg">Unfortunately, each member is only permitted to make one application. Should you have any queries, please do not hesitate to call our Customer Hotline on 3123 3123.</p>
                                            <center>
                                                <button class="btn savie-common-btn" id="make-appointment-btn">Back to home</button>
                                            </center>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal fade common-welcome-modal" id="review-fna-modal" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <h4 class="text-center welcome-msg">Welcome! <span id="fullName"></span></h4>
                                            <p class="text-center description-msg">You have previously completed a Financial Needs Analysis (FNA). You may review and edit your FNA for up-to-date Product Recommendation.</p>
                                            <center>
                                                <button class="btn savie-common-btn" id="review-fna-btn">Review FNA</button>
                                            </center>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal fade common-welcome-modal" id="retrieve-application-modal" tabindex="-1" role="dialog">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                                            <h4 class="text-center welcome-msg">Welcome back! <span id="fullNames"></span></h4>
                                            <p class="text-center description-msg">Do you want to resume your application or start over?</p>
                                            <center>
                                                <button class="btn savie-common-btn" id="resume-btn">Resume</button>
                                                <button class="btn savie-common-btn disabled-gray-btn" id="start-over-btn">Start over</button>
                                            </center>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="plan-login">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="text-center">
                                    <a href="javascript:void(0);" class="savie-common-btn" id="btnLoginApply">Login to Apply</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

<script>
    $("#plan-option-next").click(function(){
        if('${authenticate}' == 'true' && '${authenticate}' != '*DIRECTGI'){
            window.location = '<%=request.getContextPath()%>/${language}/${nextPageFlow}';
        }else{
            $('#loginpopup').modal('show');         
        }
    });

    $(document).ready(function() {
        $("#btnLoginApply, .plan-detail-desc .btn-apply").click(function() {
            if("${authenticate}" == "true" && "${authenticate}" != "*DIRECTGI"){
                $("#offline-online-modal").modal();
            }else{
                $('#offline-online-modal').modal('hide');
                $('.login-info').addClass('hidden');
                $('#loginpopup .modal-dialog').removeClass('loginpopupext');
                $('#loginpopup #fna-check').val("false");
                $('#loginpopup #nav-bar-check').val("false");
                $('#loginpopup').modal('show');         
            }
        });

        $("#online-application-btn").click(function() {
            window.location = '<%=request.getContextPath()%>/${language}/${nextPageFlow}';
        });

        $("#offline-application-btn").click(function() {
            window.location = '<%=request.getContextPath()%>/${language}/${nextPageFlow2}';
        });

    })
</script>
<script src="<%=request.getContextPath()%>/resources/js/easy-health/tableHover.js"></script>
